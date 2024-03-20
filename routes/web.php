<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Login;
use App\Http\Controllers\Admin;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
/*
Route::get('/', function () {
    return view('welcome');
});
Route::get('/user/{id}', [UserController::class, 'show']);
*/

Route::get('/login', [Login::class, 'index'])->name('login')->middleware('guest');
Route::post('/authentication', [Login::class, 'authentication']);


Route::group(['middleware' => ['auth']], function () {
    Route::get('/domain', [Admin::class, 'domain']);

    Route::get('/kirim', [Admin::class, 'kirim']);
    Route::get('/tem-email', [Admin::class, 'tem_email']);

    Route::post('/change-theme', [Admin::class, 'change_theme']);

    Route::get('/', [Admin::class, 'index']);
    Route::get('/dashboard', [Admin::class, 'index']);

    Route::get('/pendaftaran', [Admin::class, 'pendaftaran']);
    Route::get('/data-pmb/{id}', [Admin::class, 'data_pmb']);
    Route::get('/data-pmb-detail/{id}', [Admin::class, 'data_pmb_detail']);
    Route::get('/data-pmb-cetak/{id}', [Admin::class, 'data_pmb_cetak']);
    Route::get('/data-pmb-pdf/{id}', [Admin::class, 'data_pmb_pdf']);
    Route::get('/data-pmb-hapus/{id}/{gelombang}', [Admin::class, 'data_pmb_hapus']);
    Route::get('/data-pmb-hapus-semua/{id}', [Admin::class, 'data_pmb_hapus_semua']);
    Route::get('/data-pmb-excel/{id}', [Admin::class, 'data_pmb_excel']);

    Route::get('/link', [Admin::class, 'link']);
    Route::get('/tambah-link', [Admin::class, 'tambah_link']);
    Route::get('/link-hapus', [Admin::class, 'link_hapus']);
    Route::get('/link-hapus-select/{id}', [Admin::class, 'link_hapus_select']);

    Route::get('/gelombang', [Admin::class, 'gelombang']);
    Route::post('/gelombang-get', [Admin::class, 'gelombang_get']);
    Route::post('/gelombang-simpan', [Admin::class, 'gelombang_simpan']);
    Route::post('/gelombang-simpan-perpanjang', [Admin::class, 'gelombang_simpan_perpanjang']);
    Route::post('/gelombang-status', [Admin::class, 'gelombang_status']);
    Route::get('/gelombang-hapus/{id}', [Admin::class, 'gelombang_hapus']);

    Route::get('/jurusan', [Admin::class, 'jurusan']);
    Route::post('/jurusan-simpan', [Admin::class, 'jurusan_simpan']);
    Route::post('/jurusan-status', [Admin::class, 'jurusan_status']);
    Route::get('/jurusan-hapus/{id}', [Admin::class, 'jurusan_hapus']);
    Route::get('/jurusan-konsentrasi/{id}', [Admin::class, 'jurusan_konsentrasi']);
    Route::post('/jurusan-konsentrasi-simpan', [Admin::class, 'jurusan_konsentrasi_simpan']);
    Route::get('/jurusan-konsentrasi-hapus/{id}/{id_kon}', [Admin::class, 'jurusan_konsentrasi_hapus']);
    
    Route::get('/admin', [Admin::class, 'admin']);
    Route::post('/admin-simpan', [Admin::class, 'admin_simpan']);
    Route::post('/admin-simpan-update', [Admin::class, 'admin_simpan_update']);
    Route::get('/admin-hapus/{id}', [Admin::class, 'admin_hapus']);
    Route::post('/admin-ambil-data', [Admin::class, 'ambil_data_admin']);

    Route::get('/cs', [Admin::class, 'cs']);
    Route::post('/cs-simpan', [Admin::class, 'cs_simpan']);
    Route::get('/cs-hapus/{id}', [Admin::class, 'cs_hapus']);
    Route::post('/cs-ambil-data', [Admin::class, 'ambil_data_cs']);
    Route::post('/cs-simpan-update', [Admin::class, 'cs_simpan_update']);

    Route::get('/setting-facebook-pixel', [Admin::class, 'facebook_pixel']);
    Route::post('/update-facebook-pixel', [Admin::class, 'update_facebook_pixel']);
    Route::get('/setting-biaya', [Admin::class, 'biaya']);
    Route::post('/update-biaya', [Admin::class, 'update_biaya']);

    Route::get('/setting-rekening', [Admin::class, 'rekening']);
    Route::post('/rekening-simpan', [Admin::class, 'rekening_simpan']);
    Route::get('/rekening-hapus/{id}', [Admin::class, 'rekening_hapus']);
    Route::post('/update-rekening', [Admin::class, 'update_rekening']);

    Route::get('/galeri', [Admin::class, 'galeri']);
    Route::post('/upload-galeri', [Admin::class, 'upload_galeri']);
    Route::get('/galeri-hapus/{id}', [Admin::class, 'galeri_hapus']);

    Route::post('/logout', [Login::class, 'logout']);
});


    Route::get('/cron-gelombang', [Admin::class, 'cron_gelombang']);

    Route::get('/cron', [Admin::class, 'cron']);


