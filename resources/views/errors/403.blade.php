@extends('layouts.app')

@section('title', '403 Forbidden')

@section('content')
<div class="text-center py-5">
    <h1 class="display-1 fw-bold text-danger">403</h1>
    <h2 class="h4 mb-3">Akses Ditolak!</h2>
    <p class="text-body-secondary mb-4">
        Maaf, Anda tidak memiliki izin atau peran yang sesuai untuk mengakses halaman ini.
    </p>
    <a href="{{ route('dashboard') }}" class="btn btn-primary">
        <i class="bi bi-house-door-fill me-1"></i> Kembali ke Dashboard
    </a>
</div>
@endsection