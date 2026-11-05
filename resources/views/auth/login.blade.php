@extends('layouts.guest')

@section('title', 'Login')

@section('content')
<div class="text-center mb-4">
    <i class="bi bi-mortarboard-fill display-5 text-primary"></i>
    <h1 class="h3 fw-bold mb-1">{{ config('app.name') }}</h1>
    <p class="text-body-secondary mb-0">Politeknik Negeri Pontianak</p>
</div>

@include('layouts.partials.flash')

<div class="card border-0 shadow-sm">
    <div class="card-body p-4">
        <h2 class="h5 mb-3">Masuk ke akun Anda</h2>
        <form method="POST" action="{{ route('login.attempt') }}" novalidate>
            @csrf
            
            <div class="mb-3">
                <x-form-input label="Email" name="email" type="email" 
                    autocomplete="username" required autofocus />
            </div>
            
            <!-- Bagian Password diubah menjadi HTML manual agar tombol mata bisa masuk -->
            <div class="mb-3">
                <label for="password" class="form-label">Kata Sandi</label>
                <div class="position-relative">
                    <input type="password" class="form-control @error('password') is-invalid @enderror" 
                        name="password" id="password" autocomplete="current-password" required>
                    
                    <button type="button" id="togglePassword" class="btn btn-sm btn-link position-absolute end-0 top-50 translate-middle-y text-decoration-none text-muted pe-3" style="border: none; background: transparent;">
                        <i class="bi bi-eye-fill" id="iconPassword"></i>
                    </button>
                </div>
                @error('password')
                    <div class="invalid-feedback d-block">{{ $message }}</div>
                @enderror
            </div>
            
            <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" 
                    name="remember" id="remember">
                <label class="form-check-label" for="remember">Ingat saya</label>
            </div>
            
            <button type="submit" class="btn btn-primary w-100">Masuk</button>
        </form>
    </div>
</div>

@push('scripts')
<script>
    document.getElementById('togglePassword').addEventListener('click', function () {
        const passInput = document.getElementById('password');
        const icon = document.getElementById('iconPassword');
        if (passInput.type === 'password') {
            passInput.type = 'text';
            icon.classList.replace('bi-eye-fill', 'bi-eye-slash-fill');
        } else {
            passInput.type = 'password';
            icon.classList.replace('bi-eye-slash-fill', 'bi-eye-fill');
        }
    });
</script>
@endpush
@endsection