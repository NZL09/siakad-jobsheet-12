<?php

namespace Database\Seeders;

use App\Models\Krs;
use App\Models\Mahasiswa;
use App\Models\MataKuliah;
use Illuminate\Database\Seeder;

class KrsSeeder extends Seeder
{
    public function run(): void
    {
        $mahasiswa = Mahasiswa::take(10)->get();

        foreach ($mahasiswa as $mhs) {
            $krs = Krs::create([
                'mahasiswa_id'   => $mhs->id,
                'tahun_akademik' => '2026/2027',
                'semester'       => 'Ganjil',
                'status'         => 'diajukan',
            ]);

            $mkAcak = MataKuliah::inRandomOrder()->limit(5)->pluck('id');
            $krs->matakuliah()->attach($mkAcak);
        }
    }
}