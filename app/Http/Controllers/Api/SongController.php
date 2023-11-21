<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Genre;
use App\Models\Song;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SongController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $id = $request->genre;
        $search = $request->a;
        if ($id) {
            Genre::findOrFail($id);
            $data = Genre::query()
                ->join('genre_song', 'genre_song.genre_id', '=', 'genres.id')
                ->join('songs', 'genre_song.song_id', '=', 'songs.id')
                ->where('genres.id', '=', $id)
                ->join('singers', 'songs.singer_id', '=', 'singers.id')
                ->select('genres.name as genre_name', 'songs.*', 'singers.name as singer_name')->paginate(15);
        } else if ($search) {
            $data = Genre::query()
                ->join('genre_song', 'genre_song.genre_id', '=', 'genres.id')
                ->join('songs', 'genre_song.song_id', '=', 'songs.id')
                ->where('songs.name', 'LIKE', '%' . $search . '%')
                ->join('singers', 'songs.singer_id', '=', 'singers.id')
                ->select('songs.*', 'singers.name as singer_name', DB::raw('GROUP_CONCAT(genres.name) AS genre_name'))
                ->groupBy('songs.id')->paginate(15);
        } else {
            $data = Song::query()
                ->join('genre_song', 'genre_song.song_id', '=', 'songs.id')
                ->join('genres', 'genre_song.genre_id', '=', 'genres.id')
                ->join('singers', 'songs.singer_id', '=', 'singers.id')
                ->select('songs.*', 'singers.name as singer_name', DB::raw('GROUP_CONCAT(genres.name) AS genre_name'))
                ->groupBy('songs.id')->paginate(15);
        }
        return response()->json($data, 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $song = Song::findOrFail($id)
            ->join('genre_song', 'genre_song.song_id', '=', 'songs.id')
            ->join('genres', 'genre_song.genre_id', '=', 'genres.id')
            ->join('singers', 'songs.singer_id', '=', 'singers.id')
            ->where('songs.id', '=', $id)
            ->select('songs.*', 'singers.name as singer_name', DB::raw('GROUP_CONCAT(genres.name) AS genre_name'))
            ->groupBy('songs.id')->get();

        return response()->json($song);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $song = Song::findOrFail($id);
        return response()->json($song->delete());
    }

    /**
     * top10 music song
     */
    public function top10(Request $request)
    {
        $limit = ($request->limit) ? $request->limit : null;
        $data = Song::query()
            ->join('genre_song', 'genre_song.song_id', '=', 'songs.id')
            ->join('genres', 'genre_song.genre_id', '=', 'genres.id')
            ->join('singers', 'songs.singer_id', '=', 'singers.id')
            ->select('songs.*', 'singers.name as singer_name', DB::raw('GROUP_CONCAT(genres.name) AS genre_name'))
            ->groupBy('songs.id')->limit($limit)->get();

        return response()->json($data);
    }
}
