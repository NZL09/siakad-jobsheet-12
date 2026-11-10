<?php

namespace App\Http\Controllers;

use App\Models\Krs;
use App\Models\Mahasiswa;
use App\Models\MataKuliah;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\DB;

class KrsController extends Controller
{
    public function index(): View
    {
        return view('krs.index');
    }

    public function data(): JsonResponse
    {
        $query = Krs::with('mahasiswa')->select('krs.*');
        
        return DataTables::eloquent($query)
            ->addIndexColumn()
            ->addColumn('nim', function (Krs $krs) {
                return $krs->mahasiswa->nim ?? '-';
            })
            ->addColumn('nama_mahasiswa', function (Krs $krs) {
                return $krs->mahasiswa->nama ?? '-';
            })
            // Tambahkan 2 filterColumn ini agar pencarian NIM dan Nama berfungsi
            ->filterColumn('nim', function($query, $keyword) {
                $query->whereHas('mahasiswa', function($q) use ($keyword) {
                    $q->where('nim', 'like', "%{$keyword}%");
                });
            })
            ->filterColumn('nama_mahasiswa', function($query, $keyword) {
                $query->whereHas('mahasiswa', function($q) use ($keyword) {
                    $q->where('nama', 'like', "%{$keyword}%");
                });
            })
            ->addColumn('aksi', function (Krs $krs) {
                return view('krs._aksi', compact('krs'))->render();
            })
            ->rawColumns(['aksi', 'status'])
            ->toJson();
    }

    public function create(): View
    {
        $mahasiswa = Mahasiswa::orderBy('nama')->get();
        $matakuliah = MataKuliah::orderBy('nama_mk')->get();
        return view('krs.create', [
            'krs' => new Krs(), 
            'mahasiswa' => $mahasiswa, 
            'matakuliah' => $matakuliah,
            'selectedMk' => []
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $this->validated($request);
        
        // Panggil validasi batas SKS di sini
        $this->cekBatasSks($request->mata_kuliah_id);

        DB::transaction(function () use ($validated, $request) {
            $krs = Krs::create($validated);
            $krs->matakuliah()->attach($request->mata_kuliah_id);
        });

        return redirect()->route('krs.index')->with('success', 'Data KRS berhasil ditambahkan.');
    }

    public function show(Krs $krs): View
    {
        $krs->load(['mahasiswa', 'matakuliah']);
        return view('krs.show', compact('krs'));
    }

    public function edit(Krs $krs): View
    {
        $mahasiswa = Mahasiswa::orderBy('nama')->get();
        $matakuliah = MataKuliah::orderBy('nama_mk')->get();
        $selectedMk = $krs->matakuliah->pluck('id')->toArray();

        return view('krs.edit', compact('krs', 'mahasiswa', 'matakuliah', 'selectedMk'));
    }

    public function update(Request $request, Krs $krs): RedirectResponse
    {
        $validated = $this->validated($request);
        
        // Panggil validasi batas SKS di sini juga
        $this->cekBatasSks($request->mata_kuliah_id);

        DB::transaction(function () use ($krs, $validated, $request) {
            $krs->update($validated);
            $krs->matakuliah()->sync($request->mata_kuliah_id);
        });

        return redirect()->route('krs.index')->with('success', 'Data KRS berhasil diperbarui.');
    }

    public function destroy(Krs $krs): JsonResponse
    {
        try {
            DB::transaction(function () use ($krs) {
                $krs->matakuliah()->detach(); // Hapus detail dulu
                $krs->delete(); // Baru hapus parent
            });
        } catch (\Exception $e) {
            return response()->json(['message' => 'KRS tidak dapat dihapus.'], 409);
        }
        return response()->json(['message' => 'Data KRS berhasil dihapus.']);
    }

    private function validated(Request $request): array
    {
        return $request->validate([
            'mahasiswa_id' => ['required', 'exists:mahasiswa,id'],
            'tahun_akademik' => ['required', 'string', 'max:9'], // Contoh: 2026/2027
            'semester' => ['required', 'in:Ganjil,Genap'],
            'status' => ['required', 'in:draft,diajukan,disetujui,ditolak'],
            'mata_kuliah_id' => ['required', 'array', 'min:1'], // Minimal pilih 1 MK
            'mata_kuliah_id.*' => ['exists:mata_kuliah,id'],
        ], [
            'mata_kuliah_id.required' => 'Minimal satu mata kuliah harus dipilih.'
        ]);
    }
    private function cekBatasSks(array $mataKuliahIds)
    {
        // Hitung total SKS dari ID mata kuliah yang dipilih
        $totalSks = MataKuliah::whereIn('id', $mataKuliahIds)->sum('sks');
        
        if ($totalSks > 24) {
            throw \Illuminate\Validation\ValidationException::withMessages([
                'mata_kuliah_id' => 'Total SKS melebihi batas maksimal (24 SKS). Pilihanmu mencapai ' . $totalSks . ' SKS.'
            ]);
        }
    }
}