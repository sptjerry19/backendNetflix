<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Song extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'image', 'audio', 'singer_id', 'genre_id'
    ];

    public function singer()
    {
        return $this->belongsTo(Singer::class);
    }

    public function genre()
    {
        return $this->belongsToMany(Genre::class);
    }
}
