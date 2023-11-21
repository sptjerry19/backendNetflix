<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Genre;
use App\Models\Song;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class GenreController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $data = Genre::query()->get();
        return Response()->json([
            'status' => "200",
            'message' => "successfull",
            'data' => $data,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|unique:genres',
        ]);
        $data = Genre::create([
            'name' => $request->name,
        ]);
        return response()->json($data);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        Genre::findOrFail($id);
        $genre = Genre::query()
            ->join('genre_song', 'genre_song.genre_id', '=', 'genres.id')
            ->join('songs', 'genre_song.song_id', '=', 'songs.id')
            ->where('genres.id', '=', $id)
            ->join('singers', 'songs.singer_id', '=', 'singers.id')
            ->select('genres.name as genre_name', 'songs.*', 'singers.name as singer_name')->paginate(15);
        return response()->json($genre);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $genre = Genre::findOrFail($id);
        $this->validate($request, [
            'name' => 'required|string|unique:genres',
        ]);
        $data = $genre->update([
            'name' => $request->name,
        ]);
        return response()->json($data);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $genre = Genre::findOrFail($id);

        return response()->json($genre->delete());
    }
}
