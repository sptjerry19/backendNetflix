<?php

use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\FilmController;
use App\Http\Controllers\Api\GenreController;
use App\Http\Controllers\api\ImdbController;
use App\Http\Controllers\AuthController;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Laravel\Socialite\Facades\Socialite;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// middleware('auth:sanctum')
// Route::get('/user', function (Request $request) {
//     return User::get();
// });
Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);
Route::get('/login/{provider}', function ($provider) {
    return Socialite::driver($provider)->redirect();
});

Route::get('/redirect/{provider}', function ($provider) {
    try {
        $user = Socialite::driver($provider)->stateless()->user();
    } catch (\Exception $e) {
        return response()->json(['error' => $e->getMessage()], 500);
    }

    // Create or update user in your database
    // ...

    // Generate and return authentication token
    $token = $user->createToken('AuthToken')->accessToken;
    return response()->json(['token' => $token]);
});
Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('/users', [AuthController::class, 'index']);
    Route::post('/logout', [AuthController::class, 'logout']);

    // films
    Route::post('/films', [FilmController::class, 'store']);
    Route::put('/films/{id}', [FilmController::class, 'update']);
    Route::delete('/films/{id}', [FilmController::class, 'destroy']);

    // category
    Route::post('/categories', [CategoryController::class, 'store']);
    Route::delete('/categories/{id}', [CategoryController::class, 'destroy']);
    Route::put('/categories/{id}', [CategoryController::class, 'update']);
});
// Route::middleware('auth:sanctum')->get('/users', [AuthController::class, 'index']);

// Route::resource('films', FilmController::class);
Route::get('/films', [FilmController::class, 'index']);
Route::get('/films/{id}', [FilmController::class, 'show']);

Route::get('/imdb', [FilmController::class, 'imdb']);

Route::get('/categories', [CategoryController::class, 'index']);


// musics
Route::get('/genre', [GenreController::class, 'index']);
