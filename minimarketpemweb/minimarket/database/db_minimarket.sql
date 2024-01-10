-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2024 at 09:41 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_minimarket`
--

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `id_penjualan` char(4) NOT NULL,
  `id_barang` char(4) NOT NULL,
  `jumlah` int(9) NOT NULL,
  `total` int(9) NOT NULL,
  `tgl_input` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `kasir`
--
DELIMITER $$
CREATE TRIGGER `trg_before_insert_kasir` BEFORE INSERT ON `kasir` FOR EACH ROW BEGIN
  DECLARE max_id INT(3);
  SET max_id = (SELECT MAX(CAST(SUBSTRING(`id_penjualan`, 2) AS UNSIGNED)) FROM `kasir`);
  SET NEW.`id_penjualan` = CONCAT('K', LPAD(COALESCE(max_id + 1, 1), 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` char(4) NOT NULL,
  `nama_kategori` varchar(20) NOT NULL,
  `tanggal_input` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `tanggal_input`) VALUES
('K001', 'Makeup & Hairstyling', '2024-01-01'),
('K002', 'Body Care', '2024-01-01'),
('K003', 'Skin Care', '2024-01-01'),
('K004', 'Parfume & Cologne', '2024-01-01'),
('K005', 'Ice Cream', '2024-01-05'),
('K006', 'Fresh Food', '2024-01-05'),
('K007', 'Frozen Foods', '2024-01-05'),
('K008', 'Snack', '2024-01-05'),
('K009', 'Instant Food', '2024-01-05'),
('K010', 'Soft Drink', '2024-01-05'),
('K011', 'Instant Drink', '2024-01-05'),
('K012', 'Tissue', '2024-01-05'),
('K013', 'Home Care & Cleaning', '2024-01-05'),
('K014', 'Kesehatan', '2024-01-05'),
('K015', 'Pet Foods', '2024-01-05'),
('K016', 'Lifestyle', '2024-01-05');

--
-- Triggers `kategori`
--
DELIMITER $$
CREATE TRIGGER `trg_before_insert_kategori` BEFORE INSERT ON `kategori` FOR EACH ROW BEGIN
  DECLARE max_id INT(3);
  SET max_id = (SELECT MAX(CAST(SUBSTRING(`id_kategori`, 2) AS UNSIGNED)) FROM `kategori`);
  SET NEW.`id_kategori` = CONCAT('K', LPAD(COALESCE(max_id + 1, 1), 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id_login` int(3) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id_login`, `user`, `pass`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `nota`
--

CREATE TABLE `nota` (
  `id_nota` char(4) NOT NULL,
  `id_barang` char(4) NOT NULL,
  `jumlah` int(9) NOT NULL,
  `total` int(9) NOT NULL,
  `tgl_input` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nota`
--

INSERT INTO `nota` (`id_nota`, `id_barang`, `jumlah`, `total`, `tgl_input`) VALUES
('N001', 'B006', 2, 20000, '2023-06-20'),
('N002', 'B007', 1, 5000, '2023-06-20'),
('N003', 'B001', 2, 6000, '2023-06-20'),
('N004', 'B005', 2, 6000, '2023-07-06'),
('N005', 'B006', 1, 10000, '2023-07-10'),
('N006', 'B004', 1, 1000, '2023-07-14'),
('N007', 'B003', 1, 2000, '2023-07-14');

--
-- Triggers `nota`
--
DELIMITER $$
CREATE TRIGGER `trg_before_insert_nota` BEFORE INSERT ON `nota` FOR EACH ROW BEGIN
  DECLARE max_id INT(3);
  SET max_id = (SELECT MAX(CAST(SUBSTRING(`id_nota`, 2) AS UNSIGNED)) FROM `nota`);
  SET NEW.`id_nota` = CONCAT('N', LPAD(COALESCE(max_id + 1, 1), 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_barang` char(4) NOT NULL,
  `id_kategori` char(4) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `stok` int(4) NOT NULL,
  `harga_jual` varchar(9) NOT NULL,
  `harga_beli` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_barang`, `id_kategori`, `nama_barang`, `stok`, `harga_jual`, `harga_beli`) VALUES
('B001', 'K001', 'Maybelline Eyeliner', 10, '85000', '50000'),
('B003', 'K001', 'Maybelline lip mate', 15, '100000', '70000'),
('B004', 'K001', 'Azzura Loose Powder', 20, '40000', '20000'),
('B005', 'K001', 'Wardah Lightening Matte Loose Powder', 15, '45000', '25000'),
('B006', 'K001', 'Hanasui lip cream', 12, '30000', '15000'),
('B007', 'K001', 'Garnier Micellar Water oil', 20, '32000', '25000'),
('B008', 'K001', 'Emina Mousturizer', 12, '35000', '20000'),
('B009', 'K001', 'Wardah Cushion Netral', 12, '100000', '60000'),
('B010', 'K002', 'Azzarine Sunscreen Badan', 10, '70000', '40000'),
('B011', 'K002', 'Marina UV White 100 gr', 15, '25000', '15000'),
('B012', 'K003', 'Biore Sunscreen', 15, '42000', '30000'),
('B013', 'K003', 'Kojiesan Lightening Skincare Pack', 15, '175000', '120000'),
('B014', 'K003', 'Skin Aqua Tone Up UV Essense SPF 50', 20, '77000', '50000'),
('B015', 'K004', 'Casablanca Body Mist Cologne Parfume 100 gr', 20, '25000', '15000'),
('B016', 'K002', 'Bellagio Homme Spray Cologne Parfum Stamina 100 gr', 15, '40000', '25000'),
('B017', 'K005', 'Walls Ice Cream Shaky Shake 140 ml', 20, '11000', '7000'),
('B018', 'K005', 'Walls Chocolate Vanilla 90 ml', 15, '6000', '3000'),
('B019', 'K005', 'Walls Paddle Pop Choco Lava 50 ml', 13, '6000', '4000'),
('B020', 'K006', 'Telur Ayam Kampung', 50, '5000', '2000'),
('B021', 'K007', 'So Good Ayam Potong paha 450 g', 20, '42000', '30000'),
('B022', 'K007', 'Belfoods Chicken Nugget Ceria g', 20, '63000', '45000'),
('B023', 'K008', 'Biskuit Marie Susu 234 g', 20, '24000', '17000'),
('B024', 'K008', 'Rebo Kuaci Biji Bunga Matahari Greentea 150 g', 13, '17000', '10000'),
('B025', 'K009', 'Samyang Buldak Jjang Hot Chicken 140 g', 20, '25000', '18000'),
('B026', 'K009', 'MamaSuka Sup Ayam 55 g', 11, '10000', '6000'),
('B027', 'K010', 'Le Minerale Air Mineral 330 ml - karton', 10, '80000', '60000'),
('B028', 'K010', 'Nestle Pure Life Air Mineral 600 ml - karton', 5, '92000', '60000'),
('B029', 'K011', 'Tongtji Teh Celup Hijau 25 s x 50 g', 15, '27000', '19000'),
('B030', 'K012', 'Tissue Roll 4 pcs', 30, '20000', '14000'),
('B031', 'K012', 'Tessa Facial Tissue 260 s', 20, '23000', '17000'),
('B032', 'K013', 'Paket Molto All in 1 Cairan Pelembut dan Pewangi 1', 15, '120000', '100000'),
('B033', 'K013', 'So Klin Deterjen Cair  5 L', 20, '97000', '70000'),
('B034', 'K014', 'Om3Heart Natural Fish Oil Mini 30 kapsul', 10, '65000', '39000'),
('B035', 'K014', 'Sangobion Suplemen Kesehatan MUltivitamin 10 Kapsu', 20, '23000', '17000'),
('B036', 'K015', 'Whiskas Dry Pet Food Kucing Tuna 1,2 kg', 6, '75000', '50000'),
('B037', 'K001', 'Me-O Dry Pet Food Kucing Salmon 1,1 kg', 4, '85000', '50000'),
('B038', 'K016', 'Ikat Rambut Warna 6 pcs Assorted', 15, '15000', '10000');

--
-- Triggers `produk`
--
DELIMITER $$
CREATE TRIGGER `trg_before_insert_produk` BEFORE INSERT ON `produk` FOR EACH ROW BEGIN
  DECLARE max_id INT(3);
  SET max_id = (SELECT MAX(CAST(SUBSTRING(`id_barang`, 2) AS UNSIGNED)) FROM `produk`);
  SET NEW.`id_barang` = CONCAT('B', LPAD(COALESCE(max_id + 1, 1), 3, '0'));
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indexes for table `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kasir`
--
ALTER TABLE `kasir`
  ADD CONSTRAINT `kasir_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `produk` (`id_barang`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `produk` (`id_barang`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
