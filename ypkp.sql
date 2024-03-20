-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Mar 2024 pada 23.13
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ypkp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `email`, `username`, `password`, `level`) VALUES
(1, 'Fajar', 'admin@admin.com', 'admin', '$2y$10$k8bfmSPHMIddPqIghsGNWeJ8rNsw4bZCK9x.zLyZKhxs0unB5tufW', 1),
(2, 'Juy As', 'juy@juy.com', 'juy', '$2y$10$Zr5JU.IlFCHNED8e9BM.AuQw4481.Cx/7450YsfbeuwL7K5DsNEuK', 1),
(4, 'Dev', 'dev@dev.com', 'dev', '$2y$10$xJkuEbhBtBYaKKG9IU3qpuwTmRjqB3SlHliKdbh5s16Ggpen8avtO', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cron`
--

CREATE TABLE `cron` (
  `cron` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cron`
--

INSERT INTO `cron` (`cron`) VALUES
('JEYMVRodqCQO7u1vUlsPtTg3nHpckNayGehxBI4ALwFfDrmz8jWSb96iX2KZ5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `galeri`
--

CREATE TABLE `galeri` (
  `id_galeri` int(11) NOT NULL,
  `img` text NOT NULL,
  `status_img` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `galeri`
--

INSERT INTO `galeri` (`id_galeri`, `img`, `status_img`) VALUES
(5, 'IMG-20231017-WA0015.jpg', '1'),
(6, 'IMG-20231017-WA0014.jpg', '1'),
(7, 'IMG-20231017-WA0013.jpg', '1'),
(8, 'IMG-20231017-WA0012.jpg', '1'),
(9, 'IMG-20231017-WA0011.jpg', '1'),
(10, 'IMG-20231017-WA0017.jpg', '1'),
(11, 'IMG-20231017-WA0016.jpg', '1'),
(12, 'IMG-20231017-WA0022.jpg', '1'),
(13, 'IMG-20231017-WA0018.jpg', '1'),
(14, 'IMG-20231017-WA0019.jpg', '1'),
(15, 'IMG-20231017-WA0020.jpg', '1'),
(16, 'IMG-20231017-WA0021.jpg', '1'),
(17, 'IMG-20231017-WA0010.jpg', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gelombang`
--

CREATE TABLE `gelombang` (
  `id_gelombang` int(11) NOT NULL,
  `nama_gelombang` varchar(100) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_akhir` date NOT NULL,
  `status_gelombang` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `gelombang`
--

INSERT INTO `gelombang` (`id_gelombang`, `nama_gelombang`, `tanggal_mulai`, `tanggal_akhir`, `status_gelombang`) VALUES
(10, 'Tahun Ajaran sekarang', '2023-09-05', '2023-09-11', 'nonaktiv'),
(11, 'kkkk', '2023-09-08', '2023-09-10', 'aktiv'),
(12, 'aaaaaa', '2023-09-12', '2023-10-20', 'aktiv');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `nama_jurusan` varchar(100) NOT NULL,
  `status_jurusan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`, `status_jurusan`) VALUES
(9, 'Magister Teknik Sipil', 'nonaktiv'),
(11, 'Magister Manajemen', 'aktiv'),
(12, 'Magister Akutansi', 'nonaktiv');

-- --------------------------------------------------------

--
-- Struktur dari tabel `konsentrasi`
--

CREATE TABLE `konsentrasi` (
  `id_konsentrasi` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `konsentrasi` varchar(255) NOT NULL,
  `tanggal_input` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `konsentrasi`
--

INSERT INTO `konsentrasi` (`id_konsentrasi`, `id_jurusan`, `konsentrasi`, `tanggal_input`) VALUES
(11, 11, 'Rumah Sakit', '2022-08-03'),
(13, 11, 'Pemerintahan', '2022-08-03'),
(14, 11, 'koke', '2022-08-19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `link`
--

CREATE TABLE `link` (
  `id_link` int(11) NOT NULL,
  `link_address` varchar(225) NOT NULL,
  `status_link` varchar(100) NOT NULL,
  `input_link` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `link`
--

INSERT INTO `link` (`id_link`, `link_address`, `status_link`, `input_link`) VALUES
(18, '1e0f8230dffa1502c346101c75e1530665472230', 'false', '2022-06-12'),
(19, 'b0cef7248c503bc408b26cb8e42b71f77b5ea3e9', 'false', '2022-06-12'),
(20, 'f8e9dc15d605bfcfe4623b820e0238c62c39cc00', 'true', '2022-06-12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftar`
--

CREATE TABLE `pendaftar` (
  `id_pendaftar` int(11) NOT NULL,
  `id_gelombang` int(11) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` text NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `kota` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `pos` varchar(100) NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `whatsapp` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `konsentrasi` varchar(200) NOT NULL,
  `file_ijazah` varchar(200) NOT NULL,
  `file_transkip` varchar(200) NOT NULL,
  `file_toefl` varchar(200) NOT NULL,
  `file_pembayaran` varchar(200) NOT NULL,
  `file_foto` varchar(200) NOT NULL,
  `file_ktp` varchar(200) NOT NULL,
  `file_formulir` varchar(200) NOT NULL,
  `tanggal_input` date NOT NULL,
  `time` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pendaftar`
--

INSERT INTO `pendaftar` (`id_pendaftar`, `id_gelombang`, `nama`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `provinsi`, `kota`, `kecamatan`, `pos`, `telepon`, `whatsapp`, `email`, `jurusan`, `konsentrasi`, `file_ijazah`, `file_transkip`, `file_toefl`, `file_pembayaran`, `file_foto`, `file_ktp`, `file_formulir`, `tanggal_input`, `time`) VALUES
(33, 12, 'fgjnrh', 'fegeg', '2023-10-05', 'Jkljslkfnkjne', 'Jawa Barat', 'Kabupaten Bandung Barat', 'Kopo', '35353', '3536475885', '66584585485', 'fnblknd@dkgn.com', 'Magister Manajemen', 'Rumah', 'Ijazah_fgjnrh_12_20231017175504.pdf', 'Transkip_fgjnrh_12_20231017175504.pdf', '', 'Pembayaran_fgjnrh_12_20231017175504.jpg', 'Foto_fgjnrh_12_20231017175504.jpg', 'KTP_fgjnrh_12_20231017175504.jpg', 'Formulir_fgjnrh_12_20231017175504.docx', '2023-10-17', '17:55:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekening`
--

CREATE TABLE `rekening` (
  `id_rekening` int(11) NOT NULL,
  `bank` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nomor` varchar(100) NOT NULL,
  `note` text NOT NULL,
  `status_rekening` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rekening`
--

INSERT INTO `rekening` (`id_rekening`, `bank`, `nama`, `nomor`, `note`, `status_rekening`) VALUES
(6, 'BCA', 'Farida Kosasih', '0869220207', '( Rp. 1.000.000 )', 'aktif'),
(9, 'BJB', 'Universitas Sangga Buana YPKP', '0243-2000-32125', '( Rp. 500.000 & Rp. 4.500.000 )', 'aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(11) NOT NULL,
  `theme` varchar(20) NOT NULL,
  `facebook_pixel` text NOT NULL,
  `biaya` varchar(100) NOT NULL,
  `nomor_daftar` varchar(50) NOT NULL,
  `nama_bank` varchar(100) NOT NULL,
  `nama_rekening` varchar(100) NOT NULL,
  `nomor_rekening` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `setting`
--

INSERT INTO `setting` (`id_setting`, `theme`, `facebook_pixel`, `biaya`, `nomor_daftar`, `nama_bank`, `nama_rekening`, `nomor_rekening`) VALUES
(1, 'dark-theme', '<!-- Facebook Pixel Code -->\r\n<script>\r\n !function(f,b,e,v,n,t,s)\r\n {if(f.fbq)return;n=f.fbq=function(){n.callMethod?\r\n n.callMethod.apply(n,arguments):n.queue.push(arguments)};\r\n if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version=\'2.0\';\r\n n.queue=[];t=b.createElement(e);t.async=!0;\r\n t.src=v;s=b.getElementsByTagName(e)[0];\r\n s.parentNode.insertBefore(t,s)}(window, document,\'script\',\r\n \'https://connect.facebook.net/en_US/fbevents.js\');\r\n fbq(\'init\', \'12345678910\');\r\n fbq(\'track\', \'PageView\');\r\n</script>\r\n<noscript><img height=\"1\" width=\"1\" style=\"display:none\"\r\n src=\"https://www.facebook.com/tr?id=12345678910&ev=PageView&noscript=1\"\r\n/></noscript>\r\n<!-- End Facebook Pixel Code -->', '20000000', '', 'BCA', 'pasca ypkp', '1212131314141414');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `email`, `username`, `password`, `level`) VALUES
(2, 'aaaaaa vvv', 'aaa@aaaa.com', 'userllm', '$2y$10$uzsPw/gh4nR6nWRNNU7jrudrYP2pmRpukgXfGiSRrVz/jDEwpvD.W', 'cs'),
(3, 'Asep Diningrat', 'otok@gmail.com', 'cs', '$2y$10$aV1E7FqbEQhAxbvSp3cTleteo3jNlu2kvCZxPzwrMXJ.I2Fg0rqfe', 'cs');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `galeri`
--
ALTER TABLE `galeri`
  ADD PRIMARY KEY (`id_galeri`);

--
-- Indeks untuk tabel `gelombang`
--
ALTER TABLE `gelombang`
  ADD PRIMARY KEY (`id_gelombang`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `konsentrasi`
--
ALTER TABLE `konsentrasi`
  ADD PRIMARY KEY (`id_konsentrasi`);

--
-- Indeks untuk tabel `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`id_link`);

--
-- Indeks untuk tabel `pendaftar`
--
ALTER TABLE `pendaftar`
  ADD PRIMARY KEY (`id_pendaftar`);

--
-- Indeks untuk tabel `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`id_rekening`);

--
-- Indeks untuk tabel `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id_galeri` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `gelombang`
--
ALTER TABLE `gelombang`
  MODIFY `id_gelombang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `konsentrasi`
--
ALTER TABLE `konsentrasi`
  MODIFY `id_konsentrasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `link`
--
ALTER TABLE `link`
  MODIFY `id_link` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `pendaftar`
--
ALTER TABLE `pendaftar`
  MODIFY `id_pendaftar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `rekening`
--
ALTER TABLE `rekening`
  MODIFY `id_rekening` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
