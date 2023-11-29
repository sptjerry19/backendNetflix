<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Singer;
use Illuminate\Http\Request;

class SingerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $singers = Singer::query()->get();

        return response()->json([
            'status' => "200",
            'message' => "successfull",
            'data' => $singers,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
            'name' => 'required|string|max:40'
        ]);

        $image_path = $request->file('image')->store('image', 'public');

        $data = Singer::query()->create([
            'image' => $image_path,
            'name' => $request->name,
        ]);

        return response()->json([
            'status' => 200,
            'message' => "success",
            'data' => $data
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $singer = Singer::findOrFail($id);

        return response()->json($singer);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $this->validate($request, [
            'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
            'name' => 'required|string|max:40'
        ]);

        $singer = Singer::findOrFail($id);
        $data = $singer->update([
            'image' => $request->image,
            'name' => $request->name,
        ]);

        return response()->json([
            'status' => 200,
            'message' => "success",
            'data' => $data
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $singer = Singer::findOrFail($id);
        return response()->json($singer->delete(), 200);
    }
}
