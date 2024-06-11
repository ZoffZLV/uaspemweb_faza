-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2024 at 07:07 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grabook`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'admin1@example.com', 'admin123', 'Admin One'),
(3, 'admin2@example.com', 'admin456', 'Admin Two');

-- --------------------------------------------------------

--
-- Table structure for table `kurir`
--

CREATE TABLE `kurir` (
  `id_kurir` int(50) NOT NULL,
  `nama_kurir` varchar(100) NOT NULL,
  `tarif` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kurir`
--

INSERT INTO `kurir` (`id_kurir`, `nama_kurir`, `tarif`) VALUES
(1, 'J&T REG (2 Hari Kerja)', 9000),
(2, 'JNE REG (2 Hari Kerja)', 10000),
(3, 'JNE YES (1 Hari Kerja)', 24000),
(4, 'Grab Instan (Lokasi Diluar Service)', 20000),
(5, 'Grab Same Day (Lokasi Diluar Service)', 20000),
(6, 'Rush Delivery by Grab Express (Lokasi Diluar Service)', 20000),
(7, 'GO-SEND Same Day (Lokasi Diluar Service)', 20000),
(8, 'GO-SEND Instant', 20000),
(9, 'Tiki REG (2 Hari Kerja)', 8000),
(10, 'Pos Indonesia (3-5 Hari Kerja)', 12000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `gmail_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `gmail_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`) VALUES
(10, 'ngasalaja@hotmale.com', 'jakurminang', 'hashafasha', '086969696969'),
(11, 'faza@gmail.com', 'faza', 'faza', '0892929292');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(6, 9, 'Andi', 'BCA', 75000, '2024-05-10', 'bukti_pembayaran_andi.jpg'),
(7, 10, 'Budi', 'BNI', 128000, '2024-05-11', 'bukti_pembayaran_budi.jpg'),
(8, 12, 'ym', 'BCA', 72000, '2024-05-20', '20240520054919Screenshot (53).png'),
(9, 13, 'ym', 'BCA', 72000, '2024-05-20', '20240520103608Screenshot (68).png'),
(10, 18, 'faza', '172818722', 82000, '2024-06-11', '20240611054537SerbaGuna.jpg'),
(11, 20, 'ffaza', '324796420', 340000, '2024-06-11', '20240611064234SerbaGuna.jpg'),
(12, 21, 'faza', '25739241', 25000, '2024-06-11', '20240611064736d9f9283fa463bc51adbe9879b497d983.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_kurir` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `nama_kurir` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'Tertunda',
  `resi_pengiriman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_kurir`, `tanggal_pembelian`, `total_pembelian`, `nama_kurir`, `tarif`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`) VALUES
(9, 4, 9, '2024-05-10', 85000, 'Tiki REG (2 Hari Kerja)', 8000, 'Jakarta', 'Lunas (Barang Terkirim)', '71616'),
(12, 8, 3, '2024-05-20', 72000, 'JNE YES (1 Hari Kerja)', 24000, 'haljdald', 'Pilih Status', ''),
(13, 4, 1, '2024-05-20', 105000, 'J&T REG (2 Hari Kerja)', 9000, 'GGS', 'Batal (Jumlah Duit Tidak Sesuai)', ''),
(18, 9, 10, '2024-06-11', 82000, 'Pos Indonesia (3-5 Hari Kerja)', 12000, 'sdssad', 'Lunas (Barang Terkirim)', '7386389632589'),
(19, 9, 1, '2024-06-11', 57000, 'J&T REG (2 Hari Kerja)', 9000, 'JL. Jalan Ke Surabaya, Cakeepp!', 'Tertunda', ''),
(20, 11, 4, '2024-06-11', 340000, 'Grab Instan (Lokasi Diluar Service)', 20000, 'rumah saya', 'Lunas (Barang Terkirim)', '7386389632589'),
(21, 11, 1, '2024-06-11', 57000, 'J&T REG (2 Hari Kerja)', 9000, 'jl. haji marwah blok b6 nomor 3', 'Batal (Jumlah Duit Tidak Sesuai)', '-');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah_pembelian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah_pembelian`) VALUES
(13, 9, 3, 1),
(14, 10, 4, 2),
(15, 11, 4, 4),
(16, 12, 3, 1),
(17, 13, 3, 2),
(18, 14, 2, 1),
(19, 15, 3, 1),
(20, 15, 2, 1),
(21, 16, 8, 1),
(22, 16, 1, 1),
(23, 17, 8, 2),
(24, 18, 8, 1),
(25, 19, 3, 1),
(26, 20, 2, 1),
(27, 21, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `resep_produk` varchar(100) NOT NULL,
  `stok_produk` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `resep_produk`, `stok_produk`) VALUES
(1, 'The Avengers #151 [1976]', 450000, 180, 'avengers assemble.jpg', 'The Avengers #151 (1976) menampilkan Avengers berkumpul untuk menyusun ulang keanggotaan tim mereka, menghadapi ketegangan internal dan ancaman baru, dengan ilustrasi dramatis dan penuh aksi.', 'tb1alt.png', 6),
(2, 'Wolverine Vol 2 17', 320000, 220, 'Wolverine_Vol_2_17.webp', '\r\nWolverine Vol. 2 #17 menampilkan petualangan penuh aksi Wolverine saat ia menghadapi berbagai tantangan dan musuh baru, dengan ilustrasi dinamis yang menonjolkan kekuatan dan keterampilannya dalam situasi berbahaya.', 'tb2alt.png', 5),
(3, 'Dune Messiah', 48000, 170, 'Dune_Messiah-Frank_Herbert_(1969)_First_edition.jpg', 'Dune Messiah adalah novel fiksi ilmiah tahun 1969 karya penulis Amerika Frank Herbert, novel kedua dari enam novel seri Dune. Sekuel dari Dune, awalnya diserialkan di majalah Galaxy pada tahun 1969, dan kemudian diterbitkan oleh Putnam pada tahun yang sama.\r\n', 'tb3alt.png', 87),
(5, 'Ayahku (Bukan) Pembohong', 78000, 190, 'Novel-Ayahku--Bukan--Pembohong.jpg', ' Ayahku (Bukan) Pembohong adalah novel karya Tere Liye yang mengisahkan hubungan antara seorang anak dan ayahnya yang penuh dengan cerita-cerita fantastis.', 'tb5alt.png', 67),
(7, 'Spiderman (1990) #1', 360000, 240, 'kka.jpg', ' Spider-Man (1990) #1 memulai kisah \"Torment\" dengan Spider-Man menghadapi serangkaian serangan brutal dari musuh misterius, menampilkan suasana gelap dan intens dengan ilustrasi detail khas Todd McFarlane.', 'tb7alt.png', 1),
(9, 'Dune', 130000, 200, 'Dune_KPG.jpg', ' Dune adalah sebuah novel fiksi ilmiah wiracarita tahun 1965 karya pengarang Amerika Frank Herbert, yang aslinya terbit sebagai dua serial terpisah dalam majalah Analog.', 'tb9alt.png', 25),
(10, 'The Lord of the Rings', 90000, 250, 'tb10.png', 'Awal dari trilogi epik fantasi karya J.R.R. Tolkien yang mengikuti petualangan Frodo Baggins dan kawan-kawan untuk menghancurkan Cincin Kekuasaan yang jahat.', 'tb10alt.png', 3),
(12, 'Jujutsu Kaisen VOL.25', 140000, 200, 'Volume_25.webp', 'Berkisah Tentang kelanjutan dari garis ajaib (Jujutsu Kaisen) sukuna melawan gojo', 'Volume_25.webp', 48),
(13, 'Attack On Titan VOL.34', 120000, 200, 'aot34.jpg', 'Volume Terakhir dari Seri Attack On Titan mengisahkan bagaimana mikasa dan kawan kawan mengakhiri kisah ini.', 'aot34.jpg', 49),
(14, 'Attack On Titan VOL.1', 40000, 180, '5af5878a9d66ed46d3c2ab8250b0e849.jpg', 'Mengawali kisah Eren Jeager yang memulai kisahnya di dunia Yang dipenuhi oleh titan titan', '5af5878a9d66ed46d3c2ab8250b0e849.jpg', 29),
(15, 'Attack On Titan: Before The Fall #1', 120000, 200, 'btf aot.jpg', 'Mengisahkan Attack On Titan Sebelum adanya Eren Jeager, Mengisahkan kisah si anak titan Kuklo', 'btf aot.jpg', 34),
(16, 'His Name Is George Floyd', 69000, 200, 'image_2024-06-11_112856155.png', ' George Perry Floyd Jr. adalah seorang pria Afrika-Amerika yang tewas dibunuh dalam penangkapan oleh seorang polisi setelah diduga mengeluarkan uang kertas palsu senilai $20 di Minneapolis.', 'image_2024-06-11_112858608.png', 56);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `kurir`
--
ALTER TABLE `kurir`
  ADD PRIMARY KEY (`id_kurir`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kurir`
--
ALTER TABLE `kurir`
  MODIFY `id_kurir` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
