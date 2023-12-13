<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Song;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SongFavoriteController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user_id = Auth::id();
        $data = Song::query()
            ->join('favorite_songs', 'favorite_songs.Song_id', '=', 'songs.id')
            ->join('users', 'favorite_songs.user_id', '=', 'users.id')
            ->join('singers', 'songs.singer_id', '=', 'singers.id')
            ->where('users.id', '=', $user_id)
            ->select('songs.*', 'singers.name as singer_name', DB::raw('GROUP_CONCAT(songs.name) AS Song_name'))
            ->groupBy('songs.id')->paginate(15);
        return response()->json($data);
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
        $user_id = Auth::id();
        $data = Song::query()
            ->join('favorite_songs', 'favorite_songs.Song_id', '=', 'Songs.id')
            ->join('users', 'favorite_songs.user_id', '=', 'users.id')
            ->where('users.id', '=', $user_id)
            ->select('Songs.*', DB::raw('GROUP_CONCAT(Songs.title) AS Song_title'))
            ->groupBy('Songs.id')->paginate(15);
        return response()->json($data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $user = User::find(Auth::id());
        $data = $user->Song()->syncWithoutDetaching($id);

        return Response($data);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $user = User::find(Auth::id());
        $data = $user->Song()->detach($id);

        return Response($data);
    }
}
