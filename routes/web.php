<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\BerandaController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DosenController;
use App\Http\Controllers\KrsController;
use App\Http\Controllers\MahasiswaController;
use App\Http\Controllers\MataKuliahController;
use App\Http\Controllers\PenggunaController;
use App\Http\Middleware\PreventBackHistory;
use Illuminate\Support\Facades\Route;

// Halaman untuk tamu: hanya bisa dibuka bila BELUM login
Route::middleware('guest')->group(function () {
    Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
    Route::post('/login', [LoginController::class, 'authenticate'])->name('login.attempt');
});

// Halaman internal: hanya bisa dibuka bila SUDAH login (ditambah proteksi no-back)
Route::middleware(['auth', 'no-back'])->group(function () { // <-- 2. Tambahkan 'no-back' di sini
    // Halaman awal diarahkan ke dashboard (dari Jobsheet 08)
    Route::get('/', fn () => redirect()->route('dashboard'));

    Route::post('/logout', [LoginController::class, 'logout'])->name('logout');

    Route::get('/dashboard', [DashboardController::class, 'index'])
        ->name('dashboard');
    Route::get('/pengguna', [PenggunaController::class, 'index'])
        ->middleware('role:admin')
        ->name('pengguna.index');
    Route::get('/mahasiswa', [MahasiswaController::class, 'index'])
        ->name('mahasiswa.index');
    Route::get('/mata-kuliah', [MataKuliahController::class, 'index'])
        ->name('matakuliah.index');
    Route::get('/krs', [KrsController::class, 'index'])
        ->name('krs.index');

    // Dari Jobsheet 07; menampilkan versi PHP/MySQL dan nama database, jadi dilindungi
    Route::get('/beranda', [BerandaController::class, 'index'])->name('beranda');

    // Data Dosen (Jobsheet 11)
    Route::get('/dosen/data', [DosenController::class, 'data'])->name('dosen.data');

    Route::middleware('role:admin')->group(function () {
        Route::resource('dosen', DosenController::class)
            ->except(['index', 'show']);
    });

    Route::resource('dosen', DosenController::class)
        ->only(['index', 'show']);
});