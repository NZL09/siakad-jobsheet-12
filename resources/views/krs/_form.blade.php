<div class="mb-3">
    <label class="form-label">Mahasiswa</label>
    <select name="mahasiswa_id" class="form-select @error('mahasiswa_id') is-invalid @enderror" required>
        <option value="">-- Pilih Mahasiswa --</option>
        @foreach($mahasiswa as $m)
            <option value="{{ $m->id }}" {{ old('mahasiswa_id', $krs->mahasiswa_id) == $m->id ? 'selected' : '' }}>
                {{ $m->nim }} - {{ $m->nama }}
            </option>
        @endforeach
    </select>
    @error('mahasiswa_id') <div class="invalid-feedback">{{ $message }}</div> @enderror
</div>
<div class="row">
    <div class="col-md-4 mb-3">
        <x-form-input label="Tahun Akademik" name="tahun_akademik" :value="$krs->tahun_akademik" placeholder="Contoh: 2026/2027" maxlength="9" required />
    </div>
    <div class="col-md-4 mb-3">
        <label class="form-label">Semester</label>
        <select name="semester" class="form-select @error('semester') is-invalid @enderror" required>
            <option value="Ganjil" {{ old('semester', $krs->semester) == 'Ganjil' ? 'selected' : '' }}>Ganjil</option>
            <option value="Genap" {{ old('semester', $krs->semester) == 'Genap' ? 'selected' : '' }}>Genap</option>
        </select>
        @error('semester') <div class="invalid-feedback">{{ $message }}</div> @enderror
    </div>
    <div class="col-md-4 mb-3">
        <label class="form-label">Status</label>
        <select name="status" class="form-select @error('status') is-invalid @enderror" required>
            <option value="draft" {{ old('status', $krs->status) == 'draft' ? 'selected' : '' }}>Draft</option>
            <option value="diajukan" {{ old('status', $krs->status) == 'diajukan' ? 'selected' : '' }}>Diajukan</option>
            <option value="disetujui" {{ old('status', $krs->status) == 'disetujui' ? 'selected' : '' }}>Disetujui</option>
            <option value="ditolak" {{ old('status', $krs->status) == 'ditolak' ? 'selected' : '' }}>Ditolak</option>
        </select>
        @error('status') <div class="invalid-feedback">{{ $message }}</div> @enderror
    </div>
</div>

<div class="mb-3">
    <label class="form-label fw-bold">Pilih Mata Kuliah</label>
    @error('mata_kuliah_id') 
        <div class="text-danger small mb-2">{{ $message }}</div> 
    @enderror
    <div class="row border rounded p-3 bg-light" style="max-height: 250px; overflow-y: auto;">
        @foreach($matakuliah as $mk)
            <div class="col-md-6 mb-2">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" name="mata_kuliah_id[]" value="{{ $mk->id }}" id="mk_{{ $mk->id }}"
                        {{ in_array($mk->id, old('mata_kuliah_id', $selectedMk ?? [])) ? 'checked' : '' }}>
                    <label class="form-check-label" for="mk_{{ $mk->id }}">
                        {{ $mk->kode_mk }} - {{ $mk->nama_mk }} ({{ $mk->sks }} SKS)
                    </label>
                </div>
            </div>
        @endforeach
    </div>
</div>