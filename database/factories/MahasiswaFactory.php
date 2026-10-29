<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class MahasiswaFactory extends Factory
{
    public function definition(): array
    {
        $jenisKelamin = fake()->randomElement(['L', 'P']);
        $gender = $jenisKelamin === 'L' ? 'male' : 'female';
        $angkatan = fake()->numberBetween(2022, 2025);
        
        $nim = substr((string) $angkatan, -2) . fake()->unique()->numerify('####');
        $nama = fake()->firstName($gender) . ' ' . fake()->lastName();

        return [
            'nim'           => $nim,
            'nama'          => $nama,
            'jenis_kelamin' => $jenisKelamin,
            'email'         => $nim . '@mhs.example.com',
            'angkatan'      => $angkatan,
            'program_studi' => 'D3 Teknik Informatika',
        ];
    }
}