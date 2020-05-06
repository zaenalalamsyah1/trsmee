-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 03:14 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trashmee`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `satuan` int(50) NOT NULL,
  `nilai_poin` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `satuan`, `nilai_poin`) VALUES
(1, 'Beras Premium', 1, 3000),
(2, 'Sembako', 1, 4000),
(3, 'Daging Ayam', 1, 3000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `satuan` int(11) NOT NULL,
  `nilai_kategori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`id_kategori`, `nama_kategori`, `satuan`, `nilai_kategori`) VALUES
(3, 'Botol Plastik', 1, 2000),
(4, 'Kaca', 1, 2000),
(6, 'kardus', 1, 4000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_masyarakat`
--

CREATE TABLE `tb_masyarakat` (
  `id_masyarakat` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `level` int(11) NOT NULL,
  `nama` text NOT NULL,
  `status` int(11) NOT NULL,
  `poin` text NOT NULL,
  `createdata` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_masyarakat`
--

INSERT INTO `tb_masyarakat` (`id_masyarakat`, `username`, `password`, `level`, `nama`, `status`, `poin`, `createdata`) VALUES
(3, 'zeze', '5167356f3931609ba816f489f5131517', 1, 'zenal', 1, '100', '2020-05-03 09:09:47'),
(4, 'irene', '156044609eb527b3b743accc8e7b6d8a', 1, 'zenal', 1, '100', '2020-05-03 09:13:11'),
(5, 'yus', 'efb6e5a9e90a1126301802ee0b3f11b8', 1, 'yusuf', 1, '100', '2020-05-03 09:14:21'),
(6, 'dede', 'e10adc3949ba59abbe56e057f20f883e', 1, 'dede sukmawan', 1, '100', '2020-05-03 10:50:55');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengepul`
--

CREATE TABLE `tb_pengepul` (
  `id_pengepul` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_tlp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengepul`
--

INSERT INTO `tb_pengepul` (`id_pengepul`, `username`, `email`, `password`, `nama_lengkap`, `jenis_kelamin`, `alamat`, `no_tlp`) VALUES
(3, 'susan', 'susan@gmail.com', 'nunung', 'Susan Susanti', 'P', 'Cibolang', '0856752626'),
(4, 'zeze', 'zenal@gmail.com', '123', 'zenal', 'L', 'cisaat', '0876');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tukarpoin`
--

CREATE TABLE `tb_tukarpoin` (
  `id_transaksi` int(11) NOT NULL,
  `nama_barang` text NOT NULL,
  `jumlah` text NOT NULL,
  `poin_terpakai` text NOT NULL,
  `kode_user` text NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_tukarpoin`
--

INSERT INTO `tb_tukarpoin` (`id_transaksi`, `nama_barang`, `jumlah`, `poin_terpakai`, `kode_user`, `alamat`) VALUES
(1, 'sembako', '1', '4000', 'zheze09', 'cisaat'),
(2, 'Beras premium', '1', '3000', 'dede', 'cisaat');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tukarsampah`
--

CREATE TABLE `tb_tukarsampah` (
  `id_transaksi` int(11) NOT NULL,
  `nama_kategori` text NOT NULL,
  `jumlah` text NOT NULL,
  `kirim_poin` text NOT NULL,
  `kode_user` text NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_tukarsampah`
--

INSERT INTO `tb_tukarsampah` (`id_transaksi`, `nama_kategori`, `jumlah`, `kirim_poin`, `kode_user`, `tanggal`) VALUES
(2, 'kaca', '1', '2000', 'zheze09', '0000-00-00 00:00:00'),
(3, 'kardu', '2', '8000', 'juse', '0000-00-00 00:00:00'),
(4, 'botol plastik', '1', '4000', 'anton', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `level` int(11) NOT NULL,
  `nama` text NOT NULL,
  `status` int(11) NOT NULL,
  `createdata` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `level`, `nama`, `status`, `createdata`) VALUES
(3, 'juse', 'e10adc3949ba59abbe56e057f20f883e', 2, 'juse', 1, '2020-05-01 14:43:58'),
(4, 'zheze09', 'e10adc3949ba59abbe56e057f20f883e', 1, 'Zaenal', 1, '2020-05-01 14:54:34'),
(5, 'indri', '71f7be7b8496f7ece8454b1bcdcd2162', 1, 'indri', 1, '2020-05-01 22:43:29'),
(6, 'dindaimoet', '6c511c8e9c85b49f7bb68c1f85e6cfac', 1, 'Dinda Adnan Husain', 1, '2020-05-02 05:15:21'),
(7, 'zeze', 'e10adc3949ba59abbe56e057f20f883e', 1, 'zaenal', 1, '2020-05-03 08:57:00'),
(8, 'zeze', '5167356f3931609ba816f489f5131517', 1, 'zenal', 1, '2020-05-03 09:00:20'),
(9, 'anton', 'e10adc3949ba59abbe56e057f20f883e', 1, 'anton', 1, '2020-05-03 10:48:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `tb_masyarakat`
--
ALTER TABLE `tb_masyarakat`
  ADD PRIMARY KEY (`id_masyarakat`);

--
-- Indexes for table `tb_pengepul`
--
ALTER TABLE `tb_pengepul`
  ADD PRIMARY KEY (`id_pengepul`);

--
-- Indexes for table `tb_tukarpoin`
--
ALTER TABLE `tb_tukarpoin`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `tb_tukarsampah`
--
ALTER TABLE `tb_tukarsampah`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_masyarakat`
--
ALTER TABLE `tb_masyarakat`
  MODIFY `id_masyarakat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_pengepul`
--
ALTER TABLE `tb_pengepul`
  MODIFY `id_pengepul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_tukarpoin`
--
ALTER TABLE `tb_tukarpoin`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_tukarsampah`
--
ALTER TABLE `tb_tukarsampah`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
