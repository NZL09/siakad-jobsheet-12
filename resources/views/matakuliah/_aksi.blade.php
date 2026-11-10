<div class="btn-group btn-group-sm" role="group">
    <a href="{{ route('matakuliah.show', $matakuliah) }}" class="btn btn-outline-info" title="Detail">
        <i class="bi bi-eye"></i>
    </a>
    @if (Auth::user()->role === 'admin')
        <a href="{{ route('matakuliah.edit', $matakuliah) }}" class="btn btn-outline-warning" title="Ubah">
            <i class="bi bi-pencil-square"></i>
        </a>
        <button type="button" class="btn btn-outline-danger btn-hapus" 
                data-url="{{ route('matakuliah.destroy', $matakuliah, false) }}" 
                data-nama="{{ $matakuliah->nama_mk }}" title="Hapus">
            <i class="bi bi-trash"></i>
        </button>
    @endif
</div>