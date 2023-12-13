<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Film;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class FilmFavoriteController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user_id = Auth::id();
        $data = Film::query()
            ->join('favorite_films', 'favorite_films.film_id', '=', 'films.id')
            ->join('users', 'favorite_films.user_id', '=', 'users.id')
            ->where('users.id', '=', $user_id)
            ->select('films.*', DB::raw('GROUP_CONCAT(films.title) AS film_title'))
            ->groupBy('films.id')->paginate(15);
        return response()->json($data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request, string $id)
    {
        $user = User::find(Auth::id());
        $data = $user->film()->syncWithoutDetaching($id);

        return Response($data);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $user_id = Auth::id();
        $data = Film::query()
            ->join('favorite_films', 'favorite_films.film_id', '=', 'films.id')
            ->join('users', 'favorite_films.user_id', '=', 'users.id')
            ->where('users.id', '=', $user_id)
            ->select('films.*', DB::raw('GROUP_CONCAT(films.title) AS film_title'))
            ->groupBy('films.id')->paginate(15);
        return response()->json($data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $user = User::find(Auth::id());
        $data = $user->film()->syncWithoutDetaching($id);

        return Response($data);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $user = User::find(Auth::id());
        $data = $user->film()->detach($id);

        return Response($data);
    }
}
