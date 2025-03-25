<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Auth\AuthController;
use App\Http\Controllers\Api\Document\DocumentController;

Route::prefix('v1')->group(function () {

     
    Route::post('register', [AuthController::class, 'register']);
    Route::post('login', [AuthController::class, 'login']);

     
    Route::middleware('auth:api')->group(function () {

        
        Route::post('logout', [AuthController::class, 'logout']);
        
        Route::get('documents', [DocumentController::class, 'index']);

         
        Route::post('documents', [DocumentController::class, 'store']);

        Route::put('documents/{id}', [DocumentController::class, 'update']);

        Route::get('documents/{id}', [DocumentController::class, 'show']);

        Route::get('documents/{id}/versions', [DocumentController::class, 'versions']);

        Route::post('documents/{id}/activate', [DocumentController::class, 'activate']);

         
    });
});


 

