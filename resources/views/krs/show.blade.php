@extends('layouts.app')
@section('title', 'Detail KRS')
@section('content')
<x-page-header judul="Detail KRS" deskripsi="Informasi lengkap KRS dan mata kuliah yang diambil." />
<div class="card border-0 shadow-sm mb-4">
    <div class="card-header bg-body fw-semibold">Informasi Mahasiswa & KRS</div>
    <div class="card-body">
        <dl class="row mb-0">
            <dt class="col-sm-3">NIM / Nama</dt>
            <dd class="col-sm-9">{{ $krs->mahasiswa->nim ?? '-' }} / {{ $krs->mahasiswa->nama ?? '-' }}</dd>
            <dt class="col-sm-3">Tahun Akademik</dt>
            <dd class="col-sm-9">{{ $krs->tahun_akademik }}</dd>
            <dt class="col-sm-3">Semester</dt>
            <dd class="col-sm-9">{{ $krs->semester }}</dd>
            <dt class="col-sm-3">Status</dt>
            <dd class="col-sm-9"><span class="badge bg-secondary">{{ strtoupper($krs->status) }}</span></dd>
        </dl>
    </div>
</div>

<div class="card border-0 shadow-sm">
    <div class="card-header bg-body fw-semibold">Daftar Mata Kuliah</div>
    <div class="card-body p-0">
        <table class="table table-striped table-hover mb-0">
            <thead class="table-light">
                <tr>
                    <th class="px-4">No</th>
                    <th>Kode MK</th>
                    <th>Nama Mata Kuliah</th>
                    <th>SKS</th>
                </tr>
            </thead>
            <tbody>
                @php $totalSks = 0; @endphp
                @forelse($krs->matakuliah as $index => $mk)
                    @php $totalSks += $mk->sks; @endphp
                    <tr>
                        <td class="px-4">{{ $index + 1 }}</td>
                        <td>{{ $mk->kode_mk }}</td>
                        <td>{{ $mk->nama_mk }}</td>
                        <td>{{ $mk->sks }}</td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="4" class="text-center px-4">Belum ada mata kuliah yang diambil.</td>
                    </tr>
                @endforelse
            </tbody>
            <tfoot class="table-light fw-bold">
                <tr>
                    <td colspan="3" class="text-end px-4">Total SKS:</td>
                    <td>{{ $totalSks }}</td>
                </tr>
            </tfoot>
        </table>
    </div>
    <div class="card-footer bg-body">
        <a href="{{ route('krs.index') }}" class="btn btn-outline-secondary">
            <i class="bi bi-arrow-left"></i> Kembali
        </a>
        @if (Auth::user()->role === 'admin')
            <a href="{{ route('krs.edit', $krs) }}" class="btn btn-warning">
                <i class="bi bi-pencil-square"></i> Ubah
            </a>
        @endif
    </div>
</div>
@endsection