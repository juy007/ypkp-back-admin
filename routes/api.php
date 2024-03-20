<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api;

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
/*
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::get('/get-setting', [Api::class, 'get_setting']);
Route::get('/get-rekening', [Api::class, 'get_rekening']);
Route::get('/cek-link/{id}', [Api::class, 'cek_link']);
Route::get('/cek-gelombang', [Api::class, 'cek_gelombang']);
Route::get('/get-jurusan', [Api::class, 'get_jurusan']); 
Route::post('/get-konsentrasi', [Api::class, 'get_konsentrasi']);
Route::post('/pmb-post', [Api::class, 'post_pmb']); 

Route::get('/get-galeri', [Api::class, 'get_galeri']);

Route::get('warga-api', [Api::class, 'index']); 

Route::post('/warga-api-update', [Api::class, 'update']); 
Route::get('/warga-api-detail/{id}', [Api::class, 'detail']); 
Route::delete('/warga-api-delete/{id}', [Api::class, 'delete']);