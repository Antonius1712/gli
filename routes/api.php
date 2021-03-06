<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\UserRoleController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::get('/users',[UserController::class, 'index']);
Route::post('/storeUser', [UserController::class, 'store']);
Route::post('/updateUser', [UserController::class, 'update']);
Route::post('/deleteUser', [UserController::class, 'destroy']);

Route::get('/user_roles',[UserRoleController::class, 'index']);
Route::post('/storeUserRole', [UserRoleController::class, 'store']);
Route::post('/updateUserRole', [UserRoleController::class, 'update']);
Route::post('/deleteUserRole', [UserRoleController::class, 'destroy']);

Route::get('/listRole', [UserRoleController::class, 'listRole']);