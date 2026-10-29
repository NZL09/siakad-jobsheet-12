@extends('layouts.app')

@section('title', 'Detail Mahasiswa')

@section('content')
<x-page-header judul="Detail Mahasiswa" deskripsi="Detail data mahasiswa {{ $mahasiswa['nama'] }}">
    <a href="{{ route('mahasiswa.index') }}" class="btn btn-outline-secondary">
        <i class="bi bi-arrow-left"></i> Kembali
    </a>
</x-page-header>

<div class="card border-0 shadow-sm col-lg-6">
    <div class="card-header bg-body fw-semibold">
        Kartu Detail Mahasiswa
    </div>
    <div class="card-body">
        <table class="table table-borderless mb-0">
            <tr>
                <th style="width: 140px;">NIM</th>
                <td>: {{ $mahasiswa['nim'] }}</td>
            </tr>
            <tr>
                <th>Nama Lengkap</th>
                <td>: {{ $mahasiswa['nama'] }}</td>
            </tr>
            <tr>
                <th>Angkatan</th>
                <td>: {{ $mahasiswa['angkatan'] }}</td>
            </tr>
            <tr>
                <th>Email</th>
                <td>: {{ $mahasiswa['email'] }}</td>
            </tr>
            <tr>
                <th>Status</th>
                <td>: 
                    @php
                        $warna = match ($mahasiswa['status']) {
                            'Aktif' => 'success',
                            'Cuti' => 'warning',
                            'Lulus' => 'info',
                            default => 'secondary',
                        };
                    @endphp
                    <span class="badge text-bg-{{ $warna }}">{{ $mahasiswa['status'] }}</span>
                </td>
            </tr>
        </table>
    </div>
</div>
@endsection