<?php

namespace App\Http\Controllers;

use App\Models\Mahasiswa;
use App\Models\Dosen;
use App\Models\MataKuliah;
use App\Models\Krs;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        // 1. Data Statistik (Kartu Atas)
        $totalMahasiswa = Mahasiswa::count();
        $totalDosen = Dosen::count();
        $totalMataKuliah = MataKuliah::count();
        $totalKrs = Krs::count();

        // Hitung Rata-rata SKS
        $totalSksDiambil = DB::table('krs_detail')
            ->join('mata_kuliah', 'krs_detail.mata_kuliah_id', '=', 'mata_kuliah.id')
            ->sum('mata_kuliah.sks');
        $rataSks = $totalKrs > 0 ? round($totalSksDiambil / $totalKrs) : 0;

        $statistik = [
            ['judul' => 'Mahasiswa', 'jumlah' => number_format($totalMahasiswa, 0, ',', '.'), 'ikon' => 'bi-mortarboard-fill', 'warna' => 'primary'],
            ['judul' => 'Dosen', 'jumlah' => $totalDosen, 'ikon' => 'bi-person-badge', 'warna' => 'success'],
            ['judul' => 'Mata Kuliah', 'jumlah' => $totalMataKuliah, 'ikon' => 'bi-book', 'warna' => 'warning'],
            ['judul' => 'KRS Aktif', 'jumlah' => $totalKrs, 'ikon' => 'bi-ui-checks', 'warna' => 'info'],
            ['judul' => 'Rata-rata SKS', 'jumlah' => $rataSks, 'ikon' => 'bi-calculator', 'warna' => 'secondary'],
        ];

        // 2. Data KRS Terbaru (5 Data Terakhir dari DB)
        $krsList = Krs::with(['mahasiswa', 'matakuliah'])
            ->latest() 
            ->take(5)  
            ->get();

        $krsTerbaru = $krsList->map(function ($krs) {
            $statusLabel = match($krs->status) {
                'disetujui' => 'Disetujui',
                'diajukan' => 'Menunggu',
                'ditolak' => 'Ditolak',
                default => 'Draft',
            };

            return [
                'nim' => $krs->mahasiswa->nim ?? '-',
                'nama' => $krs->mahasiswa->nama ?? '-',
                'sks' => $krs->matakuliah->sum('sks'),
                'status' => $statusLabel,
            ];
        })->toArray(); 

        // 3. Status KRS (Progress Bars)
        $jmlDisetujui = Krs::where('status', 'disetujui')->count();
        $jmlMenunggu = Krs::where('status', 'diajukan')->count();
        $jmlDitolak = Krs::where('status', 'ditolak')->count();

        $persenDisetujui = $totalKrs > 0 ? round(($jmlDisetujui / $totalKrs) * 100) : 0;
        $persenMenunggu = $totalKrs > 0 ? round(($jmlMenunggu / $totalKrs) * 100) : 0;
        $persenDitolak = $totalKrs > 0 ? round(($jmlDitolak / $totalKrs) * 100) : 0;

        $statuskrs = [
            ['label' => 'Disetujui', 'persen' => $persenDisetujui, 'warna' => 'success'],
            ['label' => 'Menunggu', 'persen' => $persenMenunggu, 'warna' => 'warning'],
            ['label' => 'Ditolak', 'persen' => $persenDitolak, 'warna' => 'danger'],
        ];

        $kolomkrs = [
            'nim' => 'NIM', 
            'nama' => 'Nama Mahasiswa', 
            'sks' => 'SKS', 
            'status' => 'Status'
        ];

        return view('dashboard', compact('statistik', 'kolomkrs', 'krsTerbaru', 'statuskrs'));
    }
}