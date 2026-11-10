<?php

namespace App\Http\Controllers;

use App\Models\Mahasiswa;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Validation\Rule;

class MahasiswaController extends Controller
{
    public function index(): View
    {
        return view('mahasiswa.index');
    }

    public function data(): JsonResponse
    {
        // Sesuaikan select dengan kolom yang ada di database
        $query = Mahasiswa::query()->select(['id', 'nim', 'nama', 'email', 'angkatan', 'program_studi']);
        return DataTables::eloquent($query)
            ->addIndexColumn()
            ->addColumn('aksi', function (Mahasiswa $mahasiswa) {
                return view('mahasiswa._aksi', compact('mahasiswa'))->render();
            })
            ->rawColumns(['aksi'])
            ->toJson();
    }

    public function create(): View
    {
        return view('mahasiswa.create', ['mahasiswa' => new Mahasiswa()]);
    }

    public function store(Request $request): RedirectResponse
    {
        $mahasiswa = Mahasiswa::create($this->validated($request));
        return redirect()->route('mahasiswa.index')
            ->with('success', 'Data mahasiswa ' . $mahasiswa->nama . ' berhasil ditambahkan.');
    }

    public function edit(Mahasiswa $mahasiswa): View
    {
        return view('mahasiswa.edit', compact('mahasiswa'));
    }

    public function update(Request $request, Mahasiswa $mahasiswa): RedirectResponse
    {
        $mahasiswa->update($this->validated($request, $mahasiswa));
        return redirect()->route('mahasiswa.index')
            ->with('success', 'Data mahasiswa ' . $mahasiswa->nama . ' berhasil diperbarui.');
    }

    public function destroy(Mahasiswa $mahasiswa): JsonResponse
    {
        try {
            $mahasiswa->delete();
        } catch (\Exception $e) {
            return response()->json(['message' => 'Data tidak dapat dihapus karena masih terkait data lain.'], 409);
        }
        return response()->json(['message' => 'Data mahasiswa ' . $mahasiswa->nama . ' berhasil dihapus.']);
    }

    private function validated(Request $request, ?Mahasiswa $mahasiswa = null): array
    {
        return $request->validate([
            'nim' => ['required', 'string', 'max:15', Rule::unique(Mahasiswa::class, 'nim')->ignore($mahasiswa?->id)],
            'nama' => ['required', 'string', 'max:100'],
            'jenis_kelamin' => ['required', 'in:L,P'],
            'email' => ['required', 'email', 'max:100', Rule::unique(Mahasiswa::class, 'email')->ignore($mahasiswa?->id)],
            'angkatan' => ['required', 'integer'],
            'program_studi' => ['required', 'string', 'max:100'],
        ]);
    }

    public function show(Mahasiswa $mahasiswa): View
    {
        return view('mahasiswa.show', compact('mahasiswa'));
    }
}