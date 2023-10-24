<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function index() {
        return response()->json(User::latest()->get());
    }

    public function register(Request $request) {
        $fieds = $request->validate([
            'name' => 'required|string|',
            'email' => 'required|string|unique:users,email',
            'password' => 'required|string',
        ]);

        $user = User::create([
            'name' => $fieds['name'],
            'email' => $fieds['email'],
            'password' => bcrypt($fieds['password']),
        ]);

        $token = $user->createToken('myapptoken')->plainTextToken;

        $response = [
            'user' => $user,
            'token' => $token,
        ];

        return response($response, 201);
    }

    public function login(Request $request) {
        $fieds = $request->validate([
            'email' => 'required|string',
            'password' => 'required|string',
        ]);

        $user = User::where('email', $fieds['email'])->first();

        if(!$user || !Hash::check($fieds['password'], $user->password)) {
            return response([
                'message' => 'Error login',
            ], 401);
        }

        $token = $user->createToken('myapptoken')->plainTextToken;

        $response = [
            'user' => $user,
            'token' => $token,
        ];

        return response($response, 201);
    }

    public function logout(Request $request) {
        $user = $request->user();

        $user->tokens()->delete();

        return response()->noContent();
    }
}