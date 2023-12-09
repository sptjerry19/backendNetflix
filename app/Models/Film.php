<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Film extends Model
{
    use HasFactory;
    protected $fillable = [
        'image', 'title', 'video', 'over_view', 'views', 'category_id'
    ];

    public function categories()
    {
        return $this->belongsTo(Category::class);
    }

    public function user()
    {
        return $this->belongsToMany(User::class);
    }
}
