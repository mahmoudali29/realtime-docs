<?php

use Illuminate\Support\Facades\Broadcast;

/*
|--------------------------------------------------------------------------
| Broadcast Channels
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
*/

Broadcast::channel('App.Models.User.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
});

Broadcast::channel('document.{id}', function ($user, $id) {
    $hasAccess = \App\Models\Document::where('id', $id)
        ->where(function ($q) use ($user) {
            $q->where('owner_id', $user->id)
              ->orWhereHas('collaborators', function ($q) use ($user) {
                  $q->where('user_id', $user->id);
              });
        })->exists();

    if ($hasAccess) {
        return ['id' => $user->id, 'name' => $user->name]; 
    }

    return false;
});


