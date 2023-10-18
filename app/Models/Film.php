<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Film extends Model
{
    use HasFactory;
    protected $fillable = [
        'image', 'title'
    ];

    public function categories()
    {
        return $this->belongsTo(Category::class);
    }
}