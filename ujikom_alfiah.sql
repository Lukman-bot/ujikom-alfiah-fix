-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2022 at 06:16 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ujikom_alfiah`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `jumlahkamar` ()  SELECT * FROM kamar$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `namatamu` ()  SELECT * FROM tamu$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detailfasilitaskamar`
--

CREATE TABLE `detailfasilitaskamar` (
  `iddetailfasilitaskamar` int(11) NOT NULL,
  `fasilitasid` int(11) NOT NULL,
  `kamarid` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detailfasilitaskamar`
--

INSERT INTO `detailfasilitaskamar` (`iddetailfasilitaskamar`, `fasilitasid`, `kamarid`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-03-22 18:53:34', NULL),
(2, 1, 2, '2022-03-22 18:55:08', NULL),
(3, 1, 3, '2022-03-22 18:56:17', NULL),
(4, 2, 3, '2022-03-22 18:56:17', NULL),
(5, 1, 4, '2022-03-22 18:57:01', NULL),
(6, 1, 5, '2022-03-22 18:57:47', NULL),
(7, 1, 6, '2022-03-22 18:58:31', NULL),
(8, 2, 6, '2022-03-22 18:58:31', NULL),
(9, 1, 7, '2022-03-22 18:59:11', NULL),
(10, 2, 7, '2022-03-22 18:59:11', NULL),
(11, 2, 8, '2022-03-22 18:59:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `detailreservasi`
--

CREATE TABLE `detailreservasi` (
  `iddetailreservasi` int(11) NOT NULL,
  `reservasiid` int(11) NOT NULL,
  `kamar_idkamar` int(11) NOT NULL,
  `extraid` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detailreservasi`
--

INSERT INTO `detailreservasi` (`iddetailreservasi`, `reservasiid`, `kamar_idkamar`, `extraid`, `qty`, `created_at`, `updated_at`) VALUES
(1, 11, 2, 1, 0, '2022-03-27 13:04:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `extra`
--

CREATE TABLE `extra` (
  `idextra` int(11) NOT NULL,
  `namapesanan` varchar(45) NOT NULL,
  `harga` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `extra`
--

INSERT INTO `extra` (`idextra`, `namapesanan`, `harga`, `created_at`, `updated_at`) VALUES
(1, 'kopi', 5000, '2022-03-27 13:01:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `idfasilitas` int(11) NOT NULL,
  `namafasilitas` varchar(50) NOT NULL,
  `icon` varchar(25) NOT NULL,
  `picture` varchar(45) NOT NULL,
  `jenisfasilitas` enum('KAMAR','HOTEL') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fasilitas`
--

INSERT INTO `fasilitas` (`idfasilitas`, `namafasilitas`, `icon`, `picture`, `jenisfasilitas`) VALUES
(1, 'TV LED', 'fa fa-tv', '', 'KAMAR'),
(2, 'wifi', 'fa fa-wifi', '', 'KAMAR'),
(3, 'Kolam Renang', '', '8144-IMG-Picture.jpg', 'HOTEL'),
(5, 'Restaurant', '', '5659-IMG-Picture.jpg', 'HOTEL'),
(6, 'Gym', '', '2932-IMG-Picture.jpg', 'HOTEL'),
(8, 'Restaurant 3', '', '1469-IMG-Picture.jpg', 'HOTEL'),
(9, 'Kolam Renang 2', '', '9154-IMG-Picture.jpg', 'HOTEL'),
(10, 'Kolam Renang 3', '', '1908-IMG-Picture.jpg', 'HOTEL'),
(11, 'Billiard', '', '6707-IMG-Picture.jpg', 'HOTEL'),
(12, 'Gym 2', '', '5977-IMG-Picture.jpg', 'HOTEL'),
(14, 'Spa', '', '4254-IMG-Picture.jpg', 'HOTEL'),
(15, 'Shower', 'fa fa-bath', '', 'KAMAR'),
(17, 'AC', 'fa fa-ac', '', 'KAMAR');

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `idkamar` int(11) NOT NULL,
  `tipekamarid` int(11) NOT NULL,
  `namakamar` varchar(100) NOT NULL,
  `harga` double NOT NULL,
  `jumlahqty` int(11) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`idkamar`, `tipekamarid`, `namakamar`, `harga`, `jumlahqty`, `description`, `created_at`, `updated_at`) VALUES
(1, 8, 'Twin Room new', 300, 1, '<p>Tersedia</p>\r\n', '2022-03-22 18:53:34', NULL),
(2, 7, 'Single Room', 200000, 1, '<p>Tersedia</p>\r\n', '2022-03-22 18:55:08', NULL),
(3, 3, 'Deluxe Room', 350000, 2, '<p>Tersedia</p>\r\n', '2022-03-22 18:56:17', NULL),
(4, 5, 'Suite Room', 350000, 4, '<p>Tersedia</p>\r\n', '2022-03-22 18:57:01', NULL),
(5, 1, 'Standard Room', 200000, 5, '<p>Tersedia</p>\r\n', '2022-03-22 18:57:47', NULL),
(6, 6, 'Presidential Suite', 1000000, 3, '<p>Tersedia</p>\r\n', '2022-03-22 18:58:31', NULL),
(7, 3, 'Deluxe Room 2', 500000, 2, '<p>Tersedia</p>\r\n', '2022-03-22 18:59:11', NULL),
(8, 1, 'Standard Room 2', 250000, 5, '<p>Tersedia</p>\r\n', '2022-03-22 18:59:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kamargalery`
--

CREATE TABLE `kamargalery` (
  `idkamargalery` int(11) NOT NULL,
  `kamarid` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kamargalery`
--

INSERT INTO `kamargalery` (`idkamargalery`, `kamarid`, `url`, `text`, `created_at`, `updated_at`) VALUES
(1, 1, '9558-IMG-Picture.jpg', '', '2022-03-22 18:53:34', NULL),
(2, 2, '2106-IMG-Picture.jpg', '', '2022-03-22 18:55:08', NULL),
(3, 3, '5275-IMG-Picture.jpg', '', '2022-03-22 18:56:17', NULL),
(4, 4, '8981-IMG-Picture.jpg', '', '2022-03-22 18:57:01', NULL),
(5, 5, '6078-IMG-Picture.jpg', '', '2022-03-22 18:57:47', NULL),
(6, 6, '5762-IMG-Picture.jpg', '', '2022-03-22 18:58:31', NULL),
(7, 7, '1048-IMG-Picture.jpg', '', '2022-03-22 18:59:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `idrating` int(11) NOT NULL,
  `tamuid` int(11) NOT NULL,
  `kamarid` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`idrating`, `tamuid`, `kamarid`, `value`, `created_at`, `updated_at`) VALUES
(18, 6, 1, 5, '2022-03-24 19:06:00', NULL),
(19, 6, 6, 5, '2022-03-24 20:25:30', NULL),
(20, 8, 2, 4, '2022-03-25 04:03:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `idreservasi` int(11) NOT NULL,
  `tamuid` int(11) NOT NULL,
  `kamarid` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `lama` int(11) NOT NULL,
  `qtykamar` int(11) NOT NULL,
  `status` enum('reservaasi','checkin','checkout','cancel') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `canceled_by` int(11) DEFAULT NULL,
  `approved_date` datetime NOT NULL,
  `canceled_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservasi`
--

INSERT INTO `reservasi` (`idreservasi`, `tamuid`, `kamarid`, `startdate`, `enddate`, `lama`, `qtykamar`, `status`, `created_at`, `updated_at`, `approved_by`, `canceled_by`, `approved_date`, `canceled_date`) VALUES
(1, 1, 6, '2022-03-13', '2022-03-14', 1, 1, 'checkout', '2022-03-22 21:04:41', NULL, NULL, NULL, '2022-03-22 22:04:20', '2022-03-22 22:04:20'),
(2, 2, 2, '2022-03-13', '2022-03-13', 1, 1, 'checkin', '2022-03-22 21:05:17', NULL, NULL, NULL, '2022-03-22 22:04:43', '2022-03-22 22:04:43'),
(3, 7, 7, '2022-03-13', '2022-03-14', 1, 1, 'checkout', '2022-03-22 21:05:17', NULL, NULL, NULL, '2022-03-22 22:04:43', '2022-03-22 22:04:43'),
(4, 6, 2, '2022-03-13', '2022-03-14', 1, 1, 'checkout', '2022-03-22 21:05:52', NULL, NULL, NULL, '2022-03-22 22:05:24', '2022-03-22 22:05:24'),
(5, 5, 4, '2022-03-13', '2022-03-14', 1, 1, 'checkout', '2022-03-22 21:05:52', NULL, NULL, NULL, '2022-03-22 22:05:24', '2022-03-22 22:05:24'),
(6, 8, 7, '2022-03-13', '2022-03-14', 1, 1, 'checkout', '2022-03-22 21:06:52', NULL, NULL, NULL, '2022-03-22 22:06:13', '2022-03-22 22:06:13'),
(7, 9, 8, '2022-03-13', '2022-03-14', 1, 1, 'checkout', '2022-03-22 21:06:52', NULL, NULL, NULL, '2022-03-22 22:06:13', '2022-03-22 22:06:13'),
(8, 5, 1, '2022-03-23', '2022-03-23', 1, 1, 'checkin', '2022-03-23 16:39:42', NULL, NULL, NULL, '2022-03-23 17:39:12', '2022-03-23 17:39:12'),
(9, 6, 1, '0000-00-00', '0000-00-00', 1, 1, 'reservaasi', '2022-03-25 04:42:22', NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 6, 5, '2022-03-25', '2022-03-25', 1, 1, 'reservaasi', '2022-03-25 04:44:03', NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 8, 2, '2022-03-16', '0000-00-00', 5, 1, 'reservaasi', '2022-03-27 13:04:23', NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Triggers `reservasi`
--
DELIMITER $$
CREATE TRIGGER `trigger_hotel` AFTER UPDATE ON `reservasi` FOR EACH ROW BEGIN
	IF new.status='checkin' THEN
    	UPDATE kamar SET jumlahqty=jumlahqty-old.qtykamar WHERE idkamar = old.kamarid;
        END IF;
		IF new.status='checkout' THEN
        UPDATE kamar SET jumlahqty=jumlahqty+old.qtykamar WHERE idkamar= old.kamarid;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `idreview` int(11) NOT NULL,
  `tamuid` int(11) NOT NULL,
  `kamarid` int(11) NOT NULL,
  `review` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`idreview`, `tamuid`, `kamarid`, `review`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 'Sangat Bagus', '2022-03-22 21:01:45', NULL),
(2, 9, 6, 'Bagus', '2022-03-22 21:02:11', NULL),
(3, 5, 4, 'Bagus', '2022-03-22 21:02:11', NULL),
(4, 7, 5, 'Bagus', '2022-03-22 21:02:32', NULL),
(5, 9, 3, 'Bagus', '2022-03-22 21:02:32', NULL),
(6, 6, 6, 'Sangat Bagus', '2022-03-22 21:02:51', NULL),
(7, 3, 3, 'Bagus', '2022-03-22 21:02:51', NULL),
(8, 7, 4, 'Sangat Bagus', '2022-03-22 21:03:16', NULL),
(9, 5, 6, 'Sangat Bagus', '2022-03-22 21:03:16', NULL),
(10, 6, 1, 'Kamarnya Bagus dan nyaman', '2022-03-24 20:04:44', NULL),
(11, 8, 2, 'Sangat Bagus', '2022-03-25 04:03:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tamu`
--

CREATE TABLE `tamu` (
  `idtamu` int(11) NOT NULL,
  `nik` varchar(100) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jeniskelamin` enum('laki-laki','perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `ismember` enum('YA','NO') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tamu`
--

INSERT INTO `tamu` (`idtamu`, `nik`, `nama`, `jeniskelamin`, `alamat`, `telepon`, `username`, `password`, `ismember`, `created_at`, `updated_at`) VALUES
(1, '123456789', 'Lukman Aditiya Anggara', 'laki-laki', 'Sindanggalih, Indonesia', '089510396303', 'lukman@hotel.com', '123456789', 'YA', '2022-03-22 19:02:37', NULL),
(2, '123456789', 'Syahrun Nijam', 'laki-laki', 'Sampih Rt 003 Rw 008 003/008 Rejasari Langensari Kota Banjar Jawa Barat', '08', 'syahrun@hotel.com', '123456789', 'YA', '2022-03-22 19:03:52', NULL),
(3, '123456789', 'Aditya Risqi Firmansyah', 'laki-laki', 'Cikawung 032/09 Cintaratu Lakbok Kab. Ciamis Jawa Barat', '08', 'adit@hotel.com', '123456789', 'YA', '2022-03-22 19:04:36', NULL),
(4, '123456789', 'Fredi Almas', 'laki-laki', 'Cibodas 021/005 Cintaratu Lakbok Kab. Ciamis Jawa Barat', '08', 'fredi@hotel.com', '123456789', 'YA', '2022-03-22 19:05:29', NULL),
(5, '123456789', 'Ari Riski', 'laki-laki', 'Purwodadi 012/004 Waringinsari Langensari Kota Banjar Jawa Barat', '08', 'ari@hotel.com', '123456789', 'NO', '2022-03-22 19:06:04', NULL),
(6, '123456789', 'Zeni Destia Ningsih', 'perempuan', 'Dusu Cikondang 002/006 Kunci Sidareja Kab. Cilacap Jawa Tengah', '08', 'zeni@hotel.com', '123456789', 'YA', '2022-03-22 19:06:45', NULL),
(7, '123456789', 'Lilis Suryani', 'perempuan', 'Jl. Kelapa Sawit 003/002 Gunungreja Sidareja Kab. Cilacap Jawa Tengah', '08', 'lilis@hotel.com', '123456789', 'YA', '2022-03-22 19:07:30', NULL),
(8, '123456789', 'Alpiah', 'perempuan', 'Sindangmulya 001/009 Kujangsari Langensari Kota Banjar Jawa Barat', '08', 'alpiah@hotel.com', '123456789', 'YA', '2022-03-22 19:08:02', NULL),
(9, '123456789', 'Arsyah Fathurrahman', 'laki-laki', 'Sinargalih 004/002 Langensari Langensari Kota Banjar Jawa Barat', '08', 'fatur@hotel.com', '123456789', 'YA', '2022-03-22 19:08:39', NULL),
(10, '123456', 'Feri Setiawan', 'laki-laki', 'Indonesia', '08', 'feri@hotel.com', '123456789', 'YA', '2022-03-24 14:51:21', NULL),
(11, '123456', 'Arjuna Willy', 'laki-laki', 'indonesia', '089', 'juna@hotel.com', '123456789', 'YA', '2022-03-24 21:06:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tipekamar`
--

CREATE TABLE `tipekamar` (
  `idtipekamar` int(11) NOT NULL,
  `tipekamar` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipekamar`
--

INSERT INTO `tipekamar` (`idtipekamar`, `tipekamar`, `created_at`, `updated_at`) VALUES
(1, 'Deluxe', '2022-03-22 18:44:12', NULL),
(2, 'Super Deluxe', '2022-03-22 18:44:43', NULL),
(3, 'Deluxe Room', '2022-03-22 18:44:58', NULL),
(4, 'Non Smoking Room', '2022-03-22 18:45:17', NULL),
(5, 'Cabana Room', '2022-03-22 18:45:55', NULL),
(7, 'Single Room', '2022-03-22 18:46:26', NULL),
(8, 'Twin Room', '2022-03-22 18:46:37', NULL),
(9, 'Apartemen-style', '2022-03-24 20:30:32', NULL),
(10, 'VVIP', '2022-03-27 13:55:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idusers` int(11) NOT NULL,
  `namauser` varchar(50) NOT NULL,
  `jk` enum('laki-laki','perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `notelepon` varchar(15) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `is_active` char(1) NOT NULL,
  `role` enum('ADMIN','RECEPTIONIST','OWNER') NOT NULL,
  `photo` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idusers`, `namauser`, `jk`, `alamat`, `notelepon`, `username`, `password`, `is_active`, `role`, `photo`, `created_at`, `updated_at`) VALUES
(4, 'alfiah', 'perempuan', 'Banjar', '089662', 'alpiah@admin.com', '$2y$10$w8vAeyy1K.MfgakHhyPESeHC/nMmxqLUZ/go81jPH.U27E95Yn3Oe', 'Y', 'ADMIN', '4857-IMG-Picture.jpg', '2022-03-25 02:26:28', NULL),
(5, 'alfiah', 'perempuan', 'Indonesia', '08966256', 'alpiah@owner.com', '$2y$10$DfexLgPQ5PE1aVhhbbXIT.Rezb9QNG2JPWa68C7tw3pBPY3CMFfPi', 'Y', 'RECEPTIONIST', '7921-IMG-Picture.jpg', '2022-03-25 02:28:43', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detailfasilitaskamar`
--
ALTER TABLE `detailfasilitaskamar`
  ADD PRIMARY KEY (`iddetailfasilitaskamar`),
  ADD KEY `fasilitasid` (`fasilitasid`),
  ADD KEY `kamarid` (`kamarid`);

--
-- Indexes for table `detailreservasi`
--
ALTER TABLE `detailreservasi`
  ADD PRIMARY KEY (`iddetailreservasi`),
  ADD KEY `reservasiid` (`reservasiid`),
  ADD KEY `kamar_idkamar` (`kamar_idkamar`),
  ADD KEY `extraid` (`extraid`);

--
-- Indexes for table `extra`
--
ALTER TABLE `extra`
  ADD PRIMARY KEY (`idextra`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`idfasilitas`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`idkamar`),
  ADD KEY `tipekamarid` (`tipekamarid`);

--
-- Indexes for table `kamargalery`
--
ALTER TABLE `kamargalery`
  ADD PRIMARY KEY (`idkamargalery`),
  ADD KEY `kamarid` (`kamarid`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`idrating`),
  ADD KEY `tamuid` (`tamuid`),
  ADD KEY `kamarid` (`kamarid`);

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`idreservasi`),
  ADD KEY `tamuid` (`tamuid`),
  ADD KEY `kamarid` (`kamarid`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`idreview`),
  ADD KEY `tamuid` (`tamuid`),
  ADD KEY `kamarid` (`kamarid`);

--
-- Indexes for table `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`idtamu`);

--
-- Indexes for table `tipekamar`
--
ALTER TABLE `tipekamar`
  ADD PRIMARY KEY (`idtipekamar`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idusers`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detailfasilitaskamar`
--
ALTER TABLE `detailfasilitaskamar`
  MODIFY `iddetailfasilitaskamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `detailreservasi`
--
ALTER TABLE `detailreservasi`
  MODIFY `iddetailreservasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `extra`
--
ALTER TABLE `extra`
  MODIFY `idextra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `idfasilitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `idkamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kamargalery`
--
ALTER TABLE `kamargalery`
  MODIFY `idkamargalery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `idrating` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `idreservasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `idreview` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tamu`
--
ALTER TABLE `tamu`
  MODIFY `idtamu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tipekamar`
--
ALTER TABLE `tipekamar`
  MODIFY `idtipekamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idusers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
