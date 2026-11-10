@extends('layouts.app')
@section('title', 'Ubah KRS')
@section('content')
<x-page-header judul="Ubah KRS" deskripsi="Perbarui kartu rencana studi dan mata kuliah." />
<div class="card border-0 shadow-sm">
    <div class="card-header bg-body fw-semibold">Form Ubah KRS</div>
    <div class="card-body">
        <form method="POST" action="{{ route('krs.update', $krs) }}" novalidate>
            @csrf
            @method('PUT')
            @include('krs._form')
            <button type="submit" class="btn btn-primary mt-3"><i class="bi bi-save"></i> Perbarui KRS</button>
            <a href="{{ route('krs.index') }}" class="btn btn-outline-secondary mt-3">Batal</a>
        </form>
    </div>
</div>
@endsection