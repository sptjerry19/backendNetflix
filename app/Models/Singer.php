<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Singer extends Model
{
    use HasFactory;

    protected $fillable = [
        'image', 'name'
    ];

    public function categories()
    {
        return $this->hasMany(Song::class);
    }
}
