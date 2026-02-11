-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jan 2023 pada 15.43
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rentalmotor`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_motor`
--

CREATE TABLE `data_motor` (
  `id_motor` varchar(100) NOT NULL,
  `nama_motor` varchar(100) NOT NULL,
  `merek_motor` varchar(100) NOT NULL,
  `no_plat` varchar(100) NOT NULL,
  `harga_rental` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_motor`
--

INSERT INTO `data_motor` (`id_motor`, `nama_motor`, `merek_motor`, `no_plat`, `harga_rental`, `status`) VALUES
('MT001', 'Beat 125', 'Honda', 'R 1234 HR', '100000', 'Tersedia'),
('MT0010', 'Jupiter MX King', 'Yamaha', 'R 2278 PW', '150000', 'Tersedia'),
('MT002', 'Scoopy', 'Honda', 'R 3360 JD', '100000', 'Tersedia'),
('MT003', 'Vario 150', 'Honda', 'R 4430 RD', '100000', 'Tersedia'),
('MT004', 'Fazio', 'Yamaha', 'R 1145 JK', '100000', 'Tersedia'),
('MT005', 'Nmax', 'Yamaha', 'R 1002 MD', '100000', 'Tersedia'),
('MT006', 'Piaggio Vespa', 'Vespa', 'R 4576 PR', '100000', 'Tersedia'),
('MT007', 'Supra X', 'Honda', 'R 1155 HG', '150000', 'Tersedia'),
('MT008', 'Revo X FI', 'Honda', 'R 2902 RS', '150000', 'Tersedia'),
('MT009', 'Supra GTR 150', 'Honda', 'R 7743 QW', '150000', 'Tersedia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_penyewa`
--

CREATE TABLE `data_penyewa` (
  `id_penyewa` varchar(100) NOT NULL,
  `nama_penyewa` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_hp` varchar(100) NOT NULL,
  `no_ktp` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_penyewa`
--

INSERT INTO `data_penyewa` (`id_penyewa`, `nama_penyewa`, `alamat`, `no_hp`, `no_ktp`, `status`) VALUES
('PE001', 'Gemilang Rey', 'Bobosan', '081255566663', '3302124509862013', 'Pekerja'),
('PE002', 'Wahyu Nugroho', 'Cilongok', '08970598020', '3302524509562011', 'Pekerja'),
('PE003', 'Danim Alim', 'Pasir Kulon', '0895421936117', '3302214503563011', 'Pekerja'),
('PE004', 'Pulung Setiawan', 'Rempoah', '082137397357', '3302714208563001', 'Pekerja'),
('PE005', 'Luki Firmansyah', 'Kasih', '088980825600', '3302417258963019', 'Pekerja');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `username` varchar(30) DEFAULT NULL,
  `pass` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`username`, `pass`) VALUES
('admin', 'admin'),
('luki', 'luki1'),
('wahyu', 'wahyu1'),
('danim', 'danim1'),
('gemilang', 'gemilang1'),
('pulung', 'pulung1'),
('luki', 'luki1'),
('wahyu', 'wahyu1'),
('danim', 'danim1'),
('gemilang', 'gemilang1'),
('pulung', 'pulung1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `no_transaksi` int(11) NOT NULL,
  `lama_sewa` varchar(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`no_transaksi`, `lama_sewa`, `harga`, `total`) VALUES
(1, '1 hari', 100000, 100000),
(2, '2 hari', 100000, 200000),
(3, '2 hari', 150000, 300000),
(4, '1 hari', 150000, 150000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_motor`
--
ALTER TABLE `data_motor`
  ADD PRIMARY KEY (`id_motor`);

--
-- Indeks untuk tabel `data_penyewa`
--
ALTER TABLE `data_penyewa`
  ADD PRIMARY KEY (`id_penyewa`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`no_transaksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
