@props(['kolom' => [], 'baris' => []])

<div class="table-responsive">
    <table class="table table-striped table-hover align-middle mb-0">
        <thead class="table-light">
            <tr>
                <th scope="col" style="width: 50px">#</th>
                @foreach ($kolom as $key => $kol)
                    <th scope="col">
                        {{ is_array($kol) ? $kol['nama'] : $kol }}
                    </th>
                @endforeach
            </tr>
        </thead>
        <tbody>
            @forelse ($baris as $item)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    @foreach ($kolom as $key => $kol)
                        @php
                            $kunci = is_array($kol) ? $kol['cetak'] : (is_string($key) ? $key : $kol);
                        @endphp
                        <td>
                            @if (isset($kunci) && $kunci === 'status')
                                @php
                                    $val = is_array($item) ? ($item[$kunci] ?? '') : ($item->$kunci ?? '');
                                    $warna = match ($val) {
                                        'Aktif', 'Disetujui' => 'success',
                                        'Menunggu', 'Cuti' => 'warning',
                                        'Ditolak' => 'danger',
                                        default => 'secondary',
                                    };
                                @endphp
                                <span class="badge text-bg-{{ $warna }}">
                                    {{ $val }}
                                </span>
                            @elseif (isset($kunci) && $kunci === 'nim' && Route::has('mahasiswa.show'))
                                @php $val = is_array($item) ? ($item[$kunci] ?? '') : ($item->$kunci ?? ''); @endphp
                                <a href="{{ route('mahasiswa.show', $val) }}" class="text-decoration-none fw-semibold">
                                    {{ $val }}
                                </a>
                            @else
                                {{ is_array($item) ? ($item[$kunci] ?? '') : ($item->$kunci ?? '') }}
                            @endif
                        </td>
                    @endforeach
                </tr>
            @empty
                <tr>
                    <td colspan="{{ count($kolom) + 1 }}" class="text-center text-body-secondary py-4">
                        Belum ada data.
                    </td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div>