<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
    protected $fillable = ['title', 'content', 'owner_id'];

    public function owner()
    {
        return $this->belongsTo(User::class, 'owner_id');
    }

    public function collaborators()
    {
        return $this->belongsToMany(User::class)
                    ->withTimestamps()
                    ->withPivot('is_active');
    }


    public function versions()
    {
        return $this->hasMany(DocumentVersion::class);
    }
}
