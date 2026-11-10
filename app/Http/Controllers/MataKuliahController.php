<?php

namespace App\Http\Controllers;

use App\Models\MataKuliah;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Validation\Rule;

class MataKuliahController extends Controller
{
    public function index(): View
    {
        return view('matakuliah.index');
    }

    public function data(): JsonResponse
    {
        $query = MataKuliah::query()->select(['id', 'kode_mk', 'nama_mk', 'sks']);
        return DataTables::eloquent($query)
            ->addIndexColumn()
            ->addColumn('aksi', function (MataKuliah $matakuliah) {
                return view('matakuliah._aksi', compact('matakuliah'))->render();
            })
            ->rawColumns(['aksi'])
            ->toJson();
    }

    public function create(): View
    {
        return view('matakuliah.create', ['matakuliah' => new MataKuliah()]);
    }

    public function store(Request $request): RedirectResponse
    {
        $matakuliah = MataKuliah::create($this->validated($request));
        return redirect()->route('matakuliah.index')
            ->with('success', 'Mata kuliah ' . $matakuliah->nama_mk . ' berhasil ditambahkan.');
    }

    public function show(MataKuliah $matakuliah): View
    {
        return view('matakuliah.show', compact('matakuliah'));
    }

    public function edit(MataKuliah $matakuliah): View
    {
        return view('matakuliah.edit', compact('matakuliah'));
    }

    public function update(Request $request, MataKuliah $matakuliah): RedirectResponse
    {
        $matakuliah->update($this->validated($request, $matakuliah));
        return redirect()->route('matakuliah.index')
            ->with('success', 'Mata kuliah ' . $matakuliah->nama_mk . ' berhasil diperbarui.');
    }

    public function destroy(MataKuliah $matakuliah): JsonResponse
    {
        try {
            $matakuliah->delete();
        } catch (\Exception $e) {
            return response()->json(['message' => 'Mata kuliah tidak dapat dihapus karena masih digunakan di KRS.'], 409);
        }
        return response()->json(['message' => 'Mata kuliah ' . $matakuliah->nama_mk . ' berhasil dihapus.']);
    }

    private function validated(Request $request, ?MataKuliah $matakuliah = null): array
    {
        return $request->validate([
            'kode_mk' => ['required', 'string', 'max:10', Rule::unique(MataKuliah::class, 'kode_mk')->ignore($matakuliah?->id)],
            'nama_mk' => ['required', 'string', 'max:100'],
            'sks' => ['required', 'integer', 'min:1', 'max:6'],
        ]);
    }
}