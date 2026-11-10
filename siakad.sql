-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 10, 2026 at 01:04 PM
-- Server version: 8.0.30
-- PHP Version: 8.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siakad`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('siakad-3202416096-cache-awdsaw@gmail.com|127.0.0.1', 'i:1;', 1793282507),
('siakad-3202416096-cache-awdsaw@gmail.com|127.0.0.1:timer', 'i:1793282507;', 1793282507),
('siakad-3202416096-cache-iqbaltop99@gmail.com|127.0.0.1', 'i:1;', 1793286118),
('siakad-3202416096-cache-iqbaltop99@gmail.com|127.0.0.1:timer', 'i:1793286118;', 1793286118);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id` bigint UNSIGNED NOT NULL,
  `nidn` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `jabatan_fungsional` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id`, `nidn`, `nama`, `email`, `telepon`, `alamat`, `jabatan_fungsional`, `created_at`, `updated_at`) VALUES
(1, '0099019603', 'Saadat Winarno S.Si., M.Cs.', 'maulana.juli@example.net', '087782968872', 'Psr. Barat No. 399, Pekanbaru 60915, Jatim', NULL, '2026-10-26 05:01:39', '2026-11-05 00:32:55'),
(2, '0047742388', 'Oni Hutagalung S.Kom., M.Kom.', 'susanti.betania@example.com', '088523087121', 'Jln. Babadan No. 593, Padang 97870, Aceh', NULL, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(3, '0044051272', 'Zelaya Lestari S.Kom., M.Eng.', 'pandu.palastri@example.com', '089769432918', 'Jln. Abdul. Muis No. 179, Bandung 77588, Sulteng', NULL, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(4, '0092749208', 'Ratih Yuniar S.Si., M.Cs.', 'jgunarto@example.net', '083515249218', 'Dk. Diponegoro No. 291, Sukabumi 16371, Sulsel', NULL, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(5, '0025853232', 'Kayla Nurdiyanti S.Kom., M.Kom.', 'jelita.handayani@example.com', '081669091471', 'Ds. Sutami No. 261, Kotamobagu 37701, DIY', NULL, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(6, '0025786587', 'Maria Hutapea S.Kom., M.Eng.', 'eli.wijayanti@example.net', '086893997113', 'Gg. Halim No. 28, Binjai 22328, Sumbar', NULL, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(7, '0070365836', 'Oliva Haryanti S.Si., M.Cs.', 'ahastuti@example.com', '087317643462', 'Kpg. Perintis Kemerdekaan No. 777, Pariaman 45809, Bali', NULL, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(8, '0069571941', 'Iriana Pratiwi S.Kom., M.Kom.', 'baktianto.sudiati@example.com', '083179175638', 'Ds. S. Parman No. 771, Palopo 85936, Kaltim', NULL, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(9, '0089429810', 'Yoga Pertiwi S.Si., M.Cs.', 'empluk.budiman@example.com', '089123466570', 'Gg. Jend. Sudirman No. 147, Magelang 31505, Banten', NULL, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(10, '0090941183', 'Eman Situmorang S.Si., M.Cs.', 'gambira.permadi@example.org', '080359966833', 'Ds. Ters. Pasir Koja No. 205, Singkawang 37697, Kaltara', NULL, '2026-10-26 05:01:39', '2026-10-26 05:01:39');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `krs`
--

CREATE TABLE `krs` (
  `id` bigint UNSIGNED NOT NULL,
  `mahasiswa_id` bigint UNSIGNED NOT NULL,
  `tahun_akademik` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` enum('Ganjil','Genap') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('draft','diajukan','disetujui','ditolak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `krs`
--

INSERT INTO `krs` (`id`, `mahasiswa_id`, `tahun_akademik`, `semester`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2026/2027', 'Ganjil', 'diajukan', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(2, 2, '2026/2027', 'Ganjil', 'diajukan', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(3, 3, '2026/2027', 'Ganjil', 'diajukan', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(4, 4, '2026/2027', 'Ganjil', 'diajukan', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(5, 5, '2026/2027', 'Ganjil', 'diajukan', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(6, 6, '2026/2027', 'Ganjil', 'diajukan', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(7, 7, '2026/2027', 'Ganjil', 'diajukan', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(8, 8, '2026/2027', 'Ganjil', 'diajukan', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(9, 9, '2026/2027', 'Ganjil', 'diajukan', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(10, 10, '2026/2027', 'Ganjil', 'diajukan', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(15, 9, '2027/2028', 'Ganjil', 'ditolak', '2026-11-09 06:48:47', '2026-11-09 06:48:47');

-- --------------------------------------------------------

--
-- Table structure for table `krs_detail`
--

CREATE TABLE `krs_detail` (
  `id` bigint UNSIGNED NOT NULL,
  `krs_id` bigint UNSIGNED NOT NULL,
  `mata_kuliah_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `krs_detail`
--

INSERT INTO `krs_detail` (`id`, `krs_id`, `mata_kuliah_id`, `created_at`, `updated_at`) VALUES
(1, 1, 7, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(2, 1, 3, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(3, 1, 4, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(4, 1, 10, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(5, 1, 2, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(6, 2, 9, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(7, 2, 2, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(8, 2, 5, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(9, 2, 7, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(10, 2, 10, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(11, 3, 3, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(12, 3, 4, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(13, 3, 1, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(14, 3, 10, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(15, 3, 6, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(16, 4, 4, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(17, 4, 3, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(18, 4, 5, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(19, 4, 2, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(20, 4, 6, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(21, 5, 2, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(22, 5, 6, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(23, 5, 5, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(24, 5, 7, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(25, 5, 4, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(26, 6, 8, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(27, 6, 4, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(28, 6, 3, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(29, 6, 5, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(30, 6, 10, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(31, 7, 10, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(32, 7, 8, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(33, 7, 6, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(34, 7, 2, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(35, 7, 7, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(36, 8, 5, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(37, 8, 7, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(38, 8, 9, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(39, 8, 4, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(40, 8, 6, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(41, 9, 4, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(42, 9, 2, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(43, 9, 5, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(44, 9, 6, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(45, 9, 9, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(46, 10, 3, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(47, 10, 8, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(48, 10, 2, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(49, 10, 9, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(50, 10, 6, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(75, 15, 2, '2026-11-09 06:48:47', '2026-11-09 06:48:47'),
(76, 15, 5, '2026-11-09 06:48:47', '2026-11-09 06:48:47'),
(77, 15, 7, '2026-11-09 06:48:47', '2026-11-09 06:48:47'),
(78, 15, 1, '2026-11-09 06:48:47', '2026-11-09 06:48:47');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` bigint UNSIGNED NOT NULL,
  `nim` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `angkatan` smallint UNSIGNED NOT NULL,
  `program_studi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'D3 Teknik Informatika',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nim`, `nama`, `jenis_kelamin`, `email`, `angkatan`, `program_studi`, `created_at`, `updated_at`) VALUES
(1, '237376', 'Vivi Suartini', 'P', '237376@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(2, '241573', 'Vero Prasasta', 'L', '241573@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(3, '233742', 'Raisa Tampubolon', 'P', '233742@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(4, '225415', 'Raden Laksita', 'L', '225415@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(5, '239841', 'Titin Manullang', 'P', '239841@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(6, '253938', 'Perkasa Hakim', 'L', '253938@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(7, '236176', 'Galang Usada', 'L', '236176@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(8, '230778', 'Lidya Siregar', 'P', '230778@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(9, '233507', 'Lili Rajata', 'P', '233507@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(10, '234651', 'Lulut Utami', 'L', '234651@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(11, '220680', 'Kariman Situmorang', 'L', '220680@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(12, '231207', 'Hasna Mangunsong', 'P', '231207@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(13, '225684', 'Abyasa Wahyudin', 'L', '225684@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(14, '251714', 'Cahyo Januar', 'L', '251714@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(15, '242283', 'Suci Pudjiastuti', 'P', '242283@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(16, '230595', 'Rini Zulaika', 'P', '230595@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(17, '245085', 'Lidya Firgantoro', 'P', '245085@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(18, '232645', 'Ozy Anggraini', 'L', '232645@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(19, '257324', 'Azalea Hidayat', 'P', '257324@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(20, '227303', 'Tasnim Wijayanti', 'L', '227303@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(21, '243873', 'Siska Firmansyah', 'P', '243873@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(22, '224561', 'Dewi Farida', 'P', '224561@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(23, '236998', 'Diah Mustofa', 'P', '236998@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(24, '231162', 'Jessica Astuti', 'P', '231162@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(25, '245521', 'Titin Rajasa', 'P', '245521@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(26, '224519', 'Malik Dongoran', 'L', '224519@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(27, '250064', 'Salsabila Mangunsong', 'P', '250064@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(28, '232970', 'Salwa Laksmiwati', 'P', '232970@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(29, '228841', 'Cayadi Puspasari', 'L', '228841@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(30, '230654', 'Dwi Mulyani', 'L', '230654@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(31, '227772', 'Atma Thamrin', 'L', '227772@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(32, '234210', 'Tirtayasa Hutasoit', 'L', '234210@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(33, '220063', 'Uli Hutagalung', 'P', '220063@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(34, '242240', 'Baktiadi Megantara', 'L', '242240@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(35, '240410', 'Galih Firgantoro', 'L', '240410@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(36, '255474', 'Purwadi Nuraini', 'L', '255474@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(37, '236431', 'Galuh Yuliarti', 'L', '236431@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(38, '259725', 'Salsabila Pranowo', 'P', '259725@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(39, '235471', 'Talia Mandala', 'P', '235471@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(40, '234718', 'Rini Widiastuti', 'P', '234718@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(41, '248950', 'Harjo Gunarto', 'L', '248950@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(42, '247062', 'Rini Nasyiah', 'P', '247062@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(43, '222693', 'Karsana Kurniawan', 'L', '222693@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(44, '227422', 'Chandra Nashiruddin', 'L', '227422@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(45, '251341', 'Queen Sihotang', 'P', '251341@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(46, '234834', 'Dian Hidayanto', 'P', '234834@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(47, '245686', 'Usyi Wulandari', 'P', '245686@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(48, '249623', 'Asmadi Suartini', 'L', '249623@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(49, '251668', 'Michelle Mustofa', 'P', '251668@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(50, '252627', 'Anastasia Winarsih', 'P', '252627@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-26 05:01:39', '2026-10-26 05:01:39');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `id` bigint UNSIGNED NOT NULL,
  `kode_mk` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_mk` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sks` tinyint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id`, `kode_mk`, `nama_mk`, `sks`, `created_at`, `updated_at`) VALUES
(1, 'TI101', 'Pengantar Teknologi Informasi', 2, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(2, 'TI102', 'Algoritma dan Pemrograman', 3, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(3, 'TI103', 'Matematika Diskrit', 3, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(4, 'TI201', 'Basis Data', 3, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(5, 'TI202', 'Desain Web', 3, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(6, 'TI203', 'Pemrograman Web', 3, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(7, 'TI204', 'Jaringan Komputer', 3, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(8, 'TI301', 'Rekayasa Perangkat Lunak', 3, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(9, 'TI302', 'Pemrograman Berorientasi Objek', 3, '2026-10-26 05:01:39', '2026-10-26 05:01:39'),
(10, 'TI303', 'Sistem Operasi', 2, '2026-10-26 05:01:39', '2026-10-26 05:01:39');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_10_20_040909_create_dosen_table', 1),
(5, '2026_10_20_041015_create_mahasiswa_table', 1),
(6, '2026_10_20_041027_create_mata_kuliah_table', 1),
(7, '2026_10_26_095925_create_krs_table', 1),
(8, '2026_10_26_095942_create_krs_detail_table', 1),
(9, '2026_10_26_115617_add_jabatan_fungsional_to_dosen_table', 1),
(10, '2026_10_29_154151_add_last_login_at_to_users_table', 2),
(11, '2026_10_29_160500_add_column_last_login_at_to_users', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('d6AaQLF8fvke2wE1Hj19tbs2YSdh5SkfpZEZOfEJ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoicEE1b0dTWE5XeVExc1J4Y2t0dTJhTzBmUnRpVG1sekN3bmRPeUpNVCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGFzaGJvYXJkIjtzOjU6InJvdXRlIjtzOjk6ImRhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6IjE4MTA1NDM2NzE3NzYzMGY3OGZmMTQ0MjcyMjBjZGMxMzgxYjk5Y2E0Y2FmMzllOWZkOWQwNWQ4MGVkOWQyMDgiO30=', 1794276689);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','dosen','mahasiswa') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mahasiswa',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`, `last_login_at`) VALUES
(1, 'Administrator SIAKAD', 'admin@siakad.test', NULL, '$2y$12$AKkwnDWom6IxNZvlOfqrau18HkNqgYBIoi5YR2nMBPE8XFnocdx3W', 'admin', 'F9vOXjpXtWydCtAM1tuFwEDKnLcL3T6oLaZxoh8z32a1OdhML1140K52W4KN', '2026-10-26 05:01:38', '2026-10-26 05:01:38', NULL),
(2, 'Dosen Uji', 'dosen@siakad.test', NULL, '$2y$12$Er1mNqN4ipOXX32MTD4QjuiQ7Xznq8wipwOsVZmaKhAPngYDtY1U.', 'dosen', NULL, '2026-10-26 05:01:38', '2026-10-26 21:08:25', NULL),
(3, 'Mahasiswa Uji', 'mahasiswa@siakad.test', NULL, '$2y$12$KmR/aCFRffRocqS8N0.UpOUoX0EkfFV34vYZYwaCyVeqaBuf5Og3S', 'mahasiswa', NULL, '2026-10-26 05:01:39', '2026-10-26 21:08:26', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dosen_nidn_unique` (`nidn`),
  ADD UNIQUE KEY `dosen_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `krs_mahasiswa_id_tahun_akademik_semester_unique` (`mahasiswa_id`,`tahun_akademik`,`semester`);

--
-- Indexes for table `krs_detail`
--
ALTER TABLE `krs_detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `krs_detail_krs_id_mata_kuliah_id_unique` (`krs_id`,`mata_kuliah_id`),
  ADD KEY `krs_detail_mata_kuliah_id_foreign` (`mata_kuliah_id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mahasiswa_nim_unique` (`nim`),
  ADD UNIQUE KEY `mahasiswa_email_unique` (`email`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mata_kuliah_kode_mk_unique` (`kode_mk`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `krs`
--
ALTER TABLE `krs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `krs_detail`
--
ALTER TABLE `krs_detail`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `krs_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `krs_detail`
--
ALTER TABLE `krs_detail`
  ADD CONSTRAINT `krs_detail_krs_id_foreign` FOREIGN KEY (`krs_id`) REFERENCES `krs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `krs_detail_mata_kuliah_id_foreign` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliah` (`id`) ON DELETE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
