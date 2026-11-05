<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\View\View;
use Carbon\Carbon;

class PenggunaController extends Controller
{
    public function index(): View
    {
        $kolom = [
            ['nama' => 'No', 'cetak' => 'no'],
            ['nama' => 'Nama', 'cetak' => 'name'],
            ['nama' => 'Email', 'cetak' => 'email'],
            ['nama' => 'Peran', 'cetak' => 'role'],
            ['nama' => 'Login Terakhir', 'cetak' => 'last_login_at'],
        ];

        // Ambil data pengguna dan format last_login_at menjadi string
        $pengguna = User::all()->map(function ($user) {
            $user->last_login_at = $user->last_login_at 
                ? Carbon::parse($user->last_login_at)->format('d-m-Y H:i:s') 
                : 'Belum pernah';
            return $user;
        });

        return view('pengguna.index', compact('kolom', 'pengguna'));
    }
}