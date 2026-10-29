<nav class="navbar navbar-expand bg-success navbar-dark shadow-sm">
    <div class="container-fluid">
        <!-- Tombol menu untuk layar kecil -->
        <button class="btn btn-success d-lg-none me-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebar" aria-controls="sidebar">
            <i class="bi bi-list"></i>
        </button>

        <a class="navbar-brand fw-bold" href="#">
            <i class="bi bi-mortarboard-fill"></i> SIAKAD
        </a>

        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto align-items-center">
                
                <!-- Tombol Ganti Tema Terang/Gelap -->
                <li class="nav-item me-3">
                    <button class="btn btn-outline-light border-0" id="btnTema" title="Ganti Tema">
                        <i class="bi bi-moon-stars-fill"></i>
                    </button>
                </li>
                
                <!-- Akun Administrator -->
                <div class="dropdown">
					<button class="btn btn-primary dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false">
						<i class="bi bi-person-circle"></i>
						<span class="d-none d-sm-inline">{{ Auth::user()->name }}</span>
					</button>
					<ul class="dropdown-menu dropdown-menu-end">
						<li>
							<span class="dropdown-item-text small">
								{{ Auth::user()->email }}
								<span class="badge text-bg-secondary ms-1">{{ Auth::user()->role }}</span>
							</span>
						</li>
						<li><hr class="dropdown-divider"></li>
						<li>
							<form method="POST" action="{{ route('logout') }}">
								@csrf
								<button type="submit" class="dropdown-item text-danger">
									<i class="bi bi-box-arrow-right me-1"></i> Keluar
								</button>
							</form>
						</li>
					</ul>
				</div>
			</nav>
@push('scripts')
<script>
    document.getElementById('btnTema').addEventListener('click', function() {
        const html = document.documentElement;
        const tema = html.getAttribute('data-bs-theme');
        const ikon = this.querySelector('i');
        
        // Cek tema saat ini dan tukar
        if (tema === 'dark') {
            html.setAttribute('data-bs-theme', 'light');
            ikon.classList.replace('bi-sun-fill', 'bi-moon-stars-fill');
        } else {
            html.setAttribute('data-bs-theme', 'dark');
            ikon.classList.replace('bi-moon-stars-fill', 'bi-sun-fill');
        }
    });
</script>
@endpush