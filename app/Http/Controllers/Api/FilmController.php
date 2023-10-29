<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Film;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class FilmController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->a) {
            $value = request()->a;
            $data = Film::where('title', 'LIKE', '%' . $value . '%')->paginate(15);
        } else if (request()->category) {
            $id = request()->category;
            $data = Film::query()->where('category_id', '=', $id)->paginate(15);
        } else {
            $data = Film::query()->join('categories', 'films.category_id', '=', 'categories.id')
                ->select('films.*', 'categories.name')->paginate(15);
        }
        return Response()->json([
            'status' => "200",
            'message' => strlen($data) != 2 ? "successfull" : "error",
            'data' => $data,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
            'title' => 'required|string|unique:films,title|max:40',
            'over_view' => 'string|max:300',
        ]);
        $image_path = $request->file('image')->store('image', 'public');

        $data = Film::create([
            'image' => $image_path,
            'video' => $request->video,
            'title' => $request->title,
            'over_view' => $request->over_view,
            'views' => $request->views,
            'category_id' => $request->category_id,
        ]);

        return Response($data, Response::HTTP_CREATED);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $film = Film::query()->join('categories', 'films.category_id', '=', 'categories.id')
            ->select('films.*', 'categories.name')->findOrFail($id);
        return response()->json([
            'status' => '200',
            'message' => 'successfull',
            'data' => $film,
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $film = Film::findOrFail($id);
        $this->validate($request, [
            'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
            'title' => 'required|string|max:40',
            'over_view' => 'string|max:300',
        ]);
        $image_path = $request->file('image')->store('image', 'public');

        $data = $film->update([
            'image' => $image_path,
            'video' => $request->video,
            'title' => $request->title,
            'over_view' => $request->over_view,
            'views' => $request->views,
            'category_id' => $request->category_id,
        ]);

        return Response($data, Response::HTTP_UPGRADE_REQUIRED);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $film = Film::findOrFail($id);
        return response()->json([
            'status' => '200',
            'message' => 'destroy completed',
            'data' => $film->delete(),
        ]);
    }
}
