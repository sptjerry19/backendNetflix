<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreSongRequest;
use App\Http\Requests\UpdateSongRequest;
use App\Models\Genre;
use App\Models\Song;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
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
                ->select('genres.name as genre_name', 'songs.*', 'singers.name as singer_name')->get();
        } else if ($search) {
            $data = Genre::query()
                ->join('genre_song', 'genre_song.genre_id', '=', 'genres.id')
                ->join('songs', 'genre_song.song_id', '=', 'songs.id')
                ->where('songs.name', 'LIKE', '%' . $search . '%')
                ->join('singers', 'songs.singer_id', '=', 'singers.id')
                ->select('songs.*', 'singers.name as singer_name', DB::raw('GROUP_CONCAT(genres.name) AS genre_name'))
                ->groupBy('songs.id')->get();
        } else {
            $data = Song::query()
                ->join('genre_song', 'genre_song.song_id', '=', 'songs.id')
                ->join('genres', 'genre_song.genre_id', '=', 'genres.id')
                ->join('singers', 'songs.singer_id', '=', 'singers.id')
                ->select('songs.*', 'singers.name as singer_name', DB::raw('GROUP_CONCAT(genres.name) AS genre_name'))
                ->groupBy('songs.id')->get();
        }
        return response()->json($data, 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreSongRequest $request)
    {
        $params = $request->validated();
        $selectGenres = $request->genres;
        $image_path = $request->file('image')->store('image', 'public');
        $audio_path = $request->file('audio')->store('audio', 'public');

        $data = Song::create([
            'name' => $request->name,
            'image' => $image_path,
            'audio' => $audio_path,
            'singer_id' => $request->singer_id,
        ]);

        $data->genre()->sync($selectGenres);

        return Response($data, Response::HTTP_CREATED);
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

        if ($song->isEmpty()) {
            $song = Song::findOrFail($id)
                ->join('singers', 'songs.singer_id', '=', 'singers.id')
                ->where('songs.id', '=', $id)
                ->select('songs.*', 'singers.name as singer_name')
                ->groupBy('songs.id')->get();
        };

        return response()->json($song);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateSongRequest $request, string $id)
    {
        $song = Song::finOrFail($id);
        $params = $request->validated();
        $selectGenres = $request->genres;
        if ($request->file('image') == $song->image) {
            $image_path = $song->image;
        } else if ($request->file('audio') == $song->audio) {
            $audio_path = $song->audio;
        } else {
            $image_path = $request->file('image')->store('image', 'public');
            $audio_path = $request->file('audio')->store('audio', 'public');
        }

        $data = $song->update([
            'name' => $request->name,
            'image' => $image_path,
            'audio' => $audio_path,
            'singer_id' => $request->singer_id,
        ]);

        $data->genre()->sync($selectGenres);

        return Response($data, Response::HTTP_CREATED);
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
        $data = Song::query()
            ->join('genre_song', 'genre_song.song_id', '=', 'songs.id')
            ->join('genres', 'genre_song.genre_id', '=', 'genres.id')
            ->join('singers', 'songs.singer_id', '=', 'singers.id')
            ->select('songs.*', 'singers.name as singer_name', DB::raw('GROUP_CONCAT(genres.name) AS genre_name'))
            ->groupBy('songs.id')->limit(10)->get();

        return response()->json($data);
    }

    /**
     * all song
     */
    public function all(Request $request)
    {
        $data = Song::query()
            ->join('singers', 'songs.singer_id', '=', 'singers.id')
            ->select('songs.*', 'singers.name as singer_name',)
            ->groupBy('songs.id')->paginate(15);

        return response()->json($data);
    }
}
