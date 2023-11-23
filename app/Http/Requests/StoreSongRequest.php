<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

class StoreSongRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return Auth::check();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name' => 'required|string|unique:songs|max:100',
            'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
            'audio' => 'required|mimes:audio/mpeg,mpga,mp3,wav',
            'singer_id' => 'required',
        ];
    }
}
