-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2024 at 01:51 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko-denielle`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kategori` enum('makanan','minuman') NOT NULL,
  `stok` int(10) UNSIGNED NOT NULL,
  `harga_beli` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `harga_jual` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama`, `kategori`, `stok`, `harga_beli`, `created_at`, `updated_at`, `harga_jual`) VALUES
(3, 'Coca Cola', 'minuman', 90, 4000, '2024-02-15 03:01:14', '2024-02-22 06:36:38', 5500),
(6, 'Aqua', 'minuman', 230, 3000, '2024-02-16 03:52:45', '2024-02-22 06:36:31', 4000),
(8, 'Doritos', 'makanan', 67, 230000, '2024-02-22 06:03:07', '2024-02-22 06:32:03', 6500);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_barang` int(10) UNSIGNED NOT NULL,
  `jumlah` int(10) UNSIGNED NOT NULL,
  `total_harga` int(10) UNSIGNED NOT NULL,
  `id_staff` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id`, `id_barang`, `jumlah`, `total_harga`, `id_staff`, `created_at`, `updated_at`) VALUES
(23, 6, 4, 12000, 8, '2024-02-22 06:36:31', NULL),
(24, 3, 5, 20000, 8, '2024-02-22 06:36:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_barang` int(10) UNSIGNED NOT NULL,
  `jumlah` int(10) UNSIGNED NOT NULL,
  `total_harga` int(10) UNSIGNED NOT NULL,
  `id_staff` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `id_barang`, `jumlah`, `total_harga`, `id_staff`, `created_at`, `updated_at`) VALUES
(6, 3, 4, 22000, 8, '2024-02-22 06:31:30', '2024-02-22 06:31:30'),
(7, 3, 5, 27500, 8, '2024-02-22 06:31:37', '2024-02-22 06:31:37'),
(8, 6, 14, 56000, 8, '2024-02-22 06:31:44', '2024-02-22 06:31:44');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(225) NOT NULL,
  `level` enum('admin','keuangan','logistik') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `level`, `created_at`, `updated_at`) VALUES
(8, 'denil', '$2y$10$64gk1VQJJ.kKMOplNv6.3u7dXO72/yj/4.Eyi5E1G0ntPNhByUhlO', 'admin', '2024-02-15 02:20:10', '2024-02-22 05:57:14'),
(9, 'denielle', '$2a$12$/Tz6JExPEEG.fJNvMdXM0OtuBqbmktTUBmTB2e..waaDgTEIjWiwu', 'keuangan', '2024-02-15 02:20:37', NULL),
(10, 'denil g', '$2a$12$eiIlNsecyfNkXUZIwWq7X.NYeFOQLmCayHINZOW0Vr054TaXRa2kC', 'logistik', '2024-02-15 02:21:05', NULL),
(11, 'denielle gunawan', '$2y$10$nO8ts9.3XcwVV6HjdFolRetvganEOQFHauQKtOPsOfjAjygob9L1q', 'admin', '2024-02-22 06:01:07', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_staff` (`id_staff`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_staff` (`id_staff`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`id_staff`) REFERENCES `user` (`id`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`id_staff`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
