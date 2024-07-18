-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 17 Jul 2024 pada 23.51
-- Versi server: 10.5.25-MariaDB-cll-lve-log
-- Versi PHP: 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pascasa1_ypkp`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `email`, `username`, `password`, `level`) VALUES
(1, 'Fajar', 'admin@admin.com', 'admin', '$2y$10$k8bfmSPHMIddPqIghsGNWeJ8rNsw4bZCK9x.zLyZKhxs0unB5tufW', 1),
(2, 'Juy As', 'juy@juy.com', 'juy', '$2y$10$Zr5JU.IlFCHNED8e9BM.AuQw4481.Cx/7450YsfbeuwL7K5DsNEuK', 1),
(4, 'Dev', 'dev@dev.com', 'dev', '$2y$10$xJkuEbhBtBYaKKG9IU3qpuwTmRjqB3SlHliKdbh5s16Ggpen8avtO', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `galeri`
--

CREATE TABLE `galeri` (
  `id_galeri` int(11) NOT NULL,
  `img` text NOT NULL,
  `status_img` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `galeri`
--

INSERT INTO `galeri` (`id_galeri`, `img`, `status_img`) VALUES
(26, 'galeri_ypkp (2).jpg', '1'),
(27, 'galeri_ypkp (3).jpg', '1'),
(30, 'galeri_ypkp (13).jpg', '1'),
(31, 'galeri_ypkp (12).jpg', '1'),
(37, 'galeri_ypkp (11).jpg', '1'),
(38, 'galeri_ypkp (9).jpg', '1'),
(39, 'galeri_ypkp (8).jpg', '1'),
(41, 'galeri_ypkp (3).jpg', '1'),
(46, 'galeri_ypkp (6).jpg', '1'),
(47, 'galeri_ypkp (5).jpg', '1'),
(48, 'galeri_ypkp (4).jpg', '1'),
(49, 'galeri_ypkp (2).jpg', '1'),
(50, 'galeri_ypkp (7).jpg', '1'),
(53, 'galeri_ypkp (10).jpg', '1'),
(54, 'galeri_ypkp (1).jpg', '1');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `gelombang`
--

INSERT INTO `gelombang` (`id_gelombang`, `nama_gelombang`, `tanggal_mulai`, `tanggal_akhir`, `status_gelombang`) VALUES
(1, 'Tahun ajaran 2019/2020', '2022-06-10', '2022-06-17', 'nonaktiv'),
(10, 'Tahun ajaran 2022/2023', '2022-06-20', '2022-06-25', 'nonaktiv'),
(11, 'Tahun Ajaran 2022/2023', '2022-06-24', '2022-11-30', 'nonaktiv'),
(12, 'Penerimaan Mahasiswa Baru Semester Ganjil Tahun 2022/2023', '2022-08-13', '2022-09-30', 'nonaktiv'),
(13, 'Penerimaan Mahasiswa Baru Semester Genap Tahun 2022/2023', '2022-10-12', '2023-02-20', 'nonaktiv'),
(15, 'Penerimaan Mahasiswa Baru Semester Ganjil Tahun 2023/2024', '2023-02-22', '2023-09-12', 'nonaktiv'),
(16, 'Penerimaan Mahasiswa Baru Semester Ganjil Tahun 2023/2024', '2023-09-14', '2023-10-13', 'nonaktiv'),
(18, 'Penerimaan Mahasiswa Baru Semester Genap Tahun 2023/2024', '2023-10-30', '2024-03-31', 'nonaktiv'),
(19, 'Penerimaan Mahasiswa Baru Semester Genap Tahun 2024/2025', '2024-04-02', '2024-12-02', 'aktiv');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `nama_jurusan` varchar(100) NOT NULL,
  `status_jurusan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`, `status_jurusan`) VALUES
(14, 'Magister Manajemen', 'aktiv'),
(15, 'Magister Akutansi', 'aktiv'),
(16, 'Magister Teknik Sipil', 'aktiv');

-- --------------------------------------------------------

--
-- Struktur dari tabel `konsentrasi`
--

CREATE TABLE `konsentrasi` (
  `id_konsentrasi` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `konsentrasi` varchar(255) NOT NULL,
  `tanggal_input` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `konsentrasi`
--

INSERT INTO `konsentrasi` (`id_konsentrasi`, `id_jurusan`, `konsentrasi`, `tanggal_input`) VALUES
(41, 15, 'Perpajakan', '2022-08-22'),
(42, 15, 'Keuangan Pusat/ Daerah', '2022-08-22'),
(43, 15, 'Auditing', '2022-08-22'),
(44, 14, 'Manajemen SDM', '2022-08-22'),
(45, 14, 'Manajemen Rumah Sakit', '2022-08-22'),
(46, 14, 'Manajemen Pendidikan', '2022-08-22'),
(53, 16, 'Manajemen Rekayasa Kontruksi', '2022-08-22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `link`
--

CREATE TABLE `link` (
  `id_link` int(11) NOT NULL,
  `link_address` varchar(225) NOT NULL,
  `status_link` varchar(100) NOT NULL,
  `input_link` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `provinsi` varchar(100) NOT NULL,
  `kota` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `pos` varchar(100) NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `whatsapp` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `konsentrasi` varchar(100) NOT NULL,
  `file_ijazah` varchar(200) NOT NULL,
  `file_transkip` varchar(200) NOT NULL,
  `file_toefl` varchar(200) NOT NULL,
  `file_pembayaran` varchar(200) NOT NULL,
  `file_foto` varchar(200) NOT NULL,
  `file_ktp` varchar(200) NOT NULL,
  `file_formulir` varchar(200) NOT NULL,
  `tanggal_input` date NOT NULL,
  `time` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pendaftar`
--

INSERT INTO `pendaftar` (`id_pendaftar`, `id_gelombang`, `nama`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `provinsi`, `kota`, `kecamatan`, `pos`, `telepon`, `whatsapp`, `email`, `jurusan`, `konsentrasi`, `file_ijazah`, `file_transkip`, `file_toefl`, `file_pembayaran`, `file_foto`, `file_ktp`, `file_formulir`, `tanggal_input`, `time`) VALUES
(22, 10, 'Dudi Setiawan', 'Cianjur', '1995-10-19', 'Kp.  Sukalilah Rt 04/01 Desa Campakamulya Kec. Cam', '', 'Cianjur', 'Campakamulya', '43269', '085795045257', '082126788683', 'dudidudisetiawan@gmail.com', 'Magister Manajemen', '', 'Ijazah_Dudi_Setiawan_10_20220619205201.pdf', 'Transkip_Dudi_Setiawan_10_20220619205201.pdf', 'Toefl_Dudi-Setiawan_10_20220619205201.pdf', 'Pembayaran_Dudi-Setiawan_10_20220619205201.jpg', 'Foto_Dudi-Setiawan_10_20220619205201.jpg', 'KTP_Dudi-Setiawan_10_20220619205201.jpg', 'Formulir_Dudi-Setiawan_10_20220619205201.docx', '2022-06-19', '20:52:01'),
(24, 11, 'Adriansyah', 'Barru Palanro', '1987-10-26', 'Kompleks Perumahan Kehutanan, Jl. Drs. H. Anang Hasyim Blk. F No.174, RT.20, Air Hitam', '', 'Kota Samarinda', 'Kec. Samarinda Ulu', '75124', '08114177919', '08114177919', 'kursus.equity@gmail.com', 'Magister Akutansi', '', 'Ijazah_Adriansyah_11_20220728184400.pdf', 'Transkip_Adriansyah_11_20220728184400.pdf', '', 'Pembayaran_Adriansyah_11_20220728184400.jpeg', 'Foto_Adriansyah_11_20220728184400.jpeg', 'KTP_Adriansyah_11_20220728184400.jpg', 'Formulir_Adriansyah_11_20220728184400.docx', '2022-07-28', '18:44:00'),
(25, 11, 'ASNITA PUTRI SYAFRIZAL', 'BUKITTINGGI', '1995-06-01', 'Jl. Pangeran Drajat, Gg. Karya Bakti I No.141 A, RT/RW. 04/02, Drajat', '', 'KOTA CIREBON', 'KESAMBI', '45134', '081365856185', '081365856185', 'asnitaputri01695@gmail.com', 'Magister Manajemen', '', 'Ijazah_ASNITA_PUTRI_SYAFRIZAL_11_20220731110719.pdf', 'Transkip_ASNITA_PUTRI_SYAFRIZAL_11_20220731110719.pdf', '', 'Pembayaran_ASNITA-PUTRI-SYAFRIZAL_11_20220731110719.jpeg', 'Foto_ASNITA-PUTRI-SYAFRIZAL_11_20220731110719.jpg', 'KTP_ASNITA-PUTRI-SYAFRIZAL_11_20220731110719.jpg', 'Formulir_ASNITA-PUTRI-SYAFRIZAL_11_20220731110719.docx', '2022-07-31', '11:07:19'),
(26, 11, 'Rafialdo Arifian', 'Jakarta', '1998-02-04', 'Jalan Kali Pandega Marta No.730 Desa Sinduadi', '', 'Sleman', 'Mlati', '55284', '082123383860', '082123383860', 'ootakiitsuki@gmail.com', 'Magister Manajemen', '', 'Ijazah_Rafialdo_Arifian_11_20220803162644.pdf', 'Transkip_Rafialdo_Arifian_11_20220803162644.pdf', '', 'Pembayaran_Rafialdo-Arifian_11_20220803162644.jpeg', 'Foto_Rafialdo-Arifian_11_20220803162644.jpg', 'KTP_Rafialdo-Arifian_11_20220803162644.jpeg', 'Formulir_Rafialdo-Arifian_11_20220803162644.docx', '2022-08-03', '16:26:44'),
(41, 12, 'FERI HENDRAWAN', 'PESONGORAN', '1995-08-05', 'JL. PRAMUKA, DUSUN PESONGORAN, RT 002 / RW 000', 'Nusa Tenggara Barat', 'Kabupaten Lombok Barat', 'Kuripan', '83362', '081339312234', '081339312234', 'nersferi@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_FERI_HENDRAWAN_12_20220813133304.pdf', 'Transkip_FERI_HENDRAWAN_12_20220813133304.pdf', '', 'Pembayaran_FERI-HENDRAWAN_12_20220813133304.jpg', 'Foto_FERI-HENDRAWAN_12_20220813133304.jpeg', 'KTP_FERI-HENDRAWAN_12_20220813133304.jpg', 'Formulir_FERI-HENDRAWAN_12_20220813133304.docx', '2022-08-13', '13:33:04'),
(42, 12, 'Rivaldi Fauzaan', 'Tangerang', '1999-07-13', 'Kp. Kademangan RT 001/003 Kel. Kademangan Kec.  Setu Tangerang selatan', 'Banten', 'Kota Tangerang Selatan', 'Setu', '15342', '083877872274', '083877872274', 'rivaldifauzaan99@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Rivaldi_Fauzaan_12_20220816181138.pdf', 'Transkip_Rivaldi_Fauzaan_12_20220816181138.pdf', 'Toefl_Rivaldi-Fauzaan_12_20220816181138.pdf', 'Pembayaran_Rivaldi-Fauzaan_12_20220816181138.jpg', 'Foto_Rivaldi-Fauzaan_12_20220816181138.jpg', 'KTP_Rivaldi-Fauzaan_12_20220816181138.jpg', 'Formulir_Rivaldi-Fauzaan_12_20220816181138.docx', '2022-08-16', '18:11:38'),
(43, 12, 'ADITYA LEONARDO PRATAMA', 'SOPPENG', '1995-08-12', 'JALAN BALAIKOTA NOMOR 1', 'Sulawesi Utara', 'TIKALA ARES', 'Tikala', '95124', '082218976669', '082218976669', 'batangkorek8@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_ADITYA_LEONARDO_PRATAMA_12_20220818151849.pdf', 'Transkip_ADITYA_LEONARDO_PRATAMA_12_20220818151849.pdf', '', 'Pembayaran_ADITYA-LEONARDO-PRATAMA_12_20220818151849.jpg', 'Foto_ADITYA-LEONARDO-PRATAMA_12_20220818151849.jpg', 'KTP_ADITYA-LEONARDO-PRATAMA_12_20220818151849.jpg', 'Formulir_ADITYA-LEONARDO-PRATAMA_12_20220818151849.docx', '2022-08-18', '15:18:49'),
(46, 12, 'Ir. Abubakar H. Kadjidjo ST', 'Moti', '1992-01-10', 'Kel. toboleu RT/RW 018/006 Samping Pesantren, Kompleks salero 2', 'Maluku Utara', 'Kota Ternate', 'Ternate Utara (Kota)', '97726', '081243638421', '081243638421', 'motikadjidjo@gmail.com', 'Magister Sipil', 'Auditing', 'Ijazah_Ir._Abubakar_H._Kadjidjo_ST_12_20220820223441.pdf', 'Transkip_Ir._Abubakar_H._Kadjidjo_ST_12_20220820223441.pdf', '', 'Pembayaran_Ir.-Abubakar-H.-Kadjidjo-ST_12_20220820223441.jpeg', 'Foto_Ir.-Abubakar-H.-Kadjidjo-ST_12_20220820223441.jpg', 'KTP_Ir.-Abubakar-H.-Kadjidjo-ST_12_20220820223441.jpg', 'Formulir_Ir.-Abubakar-H.-Kadjidjo-ST_12_20220820223441.docx', '2022-08-20', '22:34:41'),
(47, 12, 'Syamsul Bahri', 'Bone', '1988-10-06', 'JL. Cendan RT.10 RW.03 No.69', 'Kalimantan Utara', 'Kota Tarakan', 'Tarakan Timur', '77126', '081346212345', '081346212345', 'syamsul_bahri@poltekbiskal.ac.id', 'Magister Manajemen', 'Manajemen', 'Ijazah_Syamsul_Bahri_12_20220822114810.pdf', 'Transkip_Syamsul_Bahri_12_20220822114810.pdf', 'Toefl_Syamsul-Bahri_12_20220822114810.pdf', 'Pembayaran_Syamsul-Bahri_12_20220822114810.jpg', 'Foto_Syamsul-Bahri_12_20220822114810.jpeg', 'KTP_Syamsul-Bahri_12_20220822114810.jpeg', 'Formulir_Syamsul-Bahri_12_20220822114810.docx', '2022-08-22', '11:48:10'),
(48, 12, 'Hendriko Fernandes', 'Tabalong', '1996-05-17', 'Warukin, RT.006, No.41, Kec.Tanta, Kab.Tabalong, 71561, Kalimantan Selatan,', 'Kalimantan Selatan', 'Kabupaten Tabalong', 'Tanta', '71561', '081321303584', '081321303584', 'hendrikofernandes96@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Hendriko_Fernandes_12_20220823081926.pdf', 'Transkip_Hendriko_Fernandes_12_20220823081926.pdf', '', 'Pembayaran_Hendriko-Fernandes_12_20220823081926.jpg', 'Foto_Hendriko-Fernandes_12_20220823081926.jpg', 'KTP_Hendriko-Fernandes_12_20220823081926.jpg', 'Formulir_Hendriko-Fernandes_12_20220823081926.docx', '2022-08-23', '08:19:26'),
(51, 12, 'Muhammad Firman Annur', 'Enok', '1989-02-08', 'Perumahan AG Permai B No. 4, Desa Kapur', 'Kalimantan Barat', 'Kabupaten Kubu Raya', 'Sungai Raya', '78234', '082110748774', '082110748774', 'muhammad@stkippamanetalino.ac.id', 'Magister Manajemen', 'Manajemen', 'Ijazah_Muhammad_Firman_Annur_12_20220908134826.pdf', 'Transkip_Muhammad_Firman_Annur_12_20220908134826.pdf', '', 'Pembayaran_Muhammad-Firman-Annur_12_20220908134826.jpg', 'Foto_Muhammad-Firman-Annur_12_20220908134826.jpg', 'KTP_Muhammad-Firman-Annur_12_20220908134826.jpg', 'Formulir_Muhammad-Firman-Annur_12_20220908134826.docx', '2022-09-08', '13:48:26'),
(52, 12, 'MUH. YUSUF PRATAMA, S.T.', 'MAKASSAR', '1996-09-24', 'Jl Rehablilitasi Cacat No 23 B', 'Sulawesi Selatan', 'Makassar', 'Panakkukang', '90232', '081248715276', '083879167125', 'muhyusuftama@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_MUH._YUSUF_PRATAMA,_S.T._12_20220911114412.pdf', 'Transkip_MUH._YUSUF_PRATAMA,_S.T._12_20220911114412.pdf', '', 'Pembayaran_MUH.-YUSUF-PRATAMA,-S.T._12_20220911114412.jpg', 'Foto_MUH.-YUSUF-PRATAMA,-S.T._12_20220911114412.jpg', 'KTP_MUH.-YUSUF-PRATAMA,-S.T._12_20220911114412.jpg', 'Formulir_MUH.-YUSUF-PRATAMA,-S.T._12_20220911114412.docx', '2022-09-11', '11:44:12'),
(53, 13, 'Robby Nurdiansyah', 'Purwakarta', '2000-08-15', 'Jl. Flamboyan Gg. Melur No. 3434A RT. 39 RW. 04', 'Jawa Barat', 'Kabupaten Purwakarta', 'Purwakarta', '41115', '0813244477766', '081324477766', 'robbynurdiansyah96@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Robby_Nurdiansyah_13_20221012172230.pdf', 'Transkip_Robby_Nurdiansyah_13_20221012172230.pdf', '', 'Pembayaran_Robby-Nurdiansyah_13_20221012172230.jpg', 'Foto_Robby-Nurdiansyah_13_20221012172230.jpg', 'KTP_Robby-Nurdiansyah_13_20221012172230.jpg', 'Formulir_Robby-Nurdiansyah_13_20221012172230.docx', '2022-10-12', '17:22:30'),
(55, 13, 'Nia Suryana', 'Tasikmalaya', '1985-04-18', 'Perum Green Palme Residen Blok PW D06 Desa Cileles', 'Banten', 'Kabupaten Tangerang', 'Tigaraksa', '15720', '085283019695', '085283019695', 'suryanania65@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Nia_Suryana_13_20221115191534.pdf', 'Transkip_Nia_Suryana_13_20221115191534.pdf', '', 'Pembayaran_Nia-Suryana_13_20221115191534.jpeg', 'Foto_Nia-Suryana_13_20221115191534.jpg', 'KTP_Nia-Suryana_13_20221115191534.jpeg', 'Formulir_Nia-Suryana_13_20221115191534.docx', '2022-11-15', '19:15:34'),
(56, 13, 'HENDRI FIRNANDO', 'PONTIANAK', '1998-07-02', 'Jl. Sungai Raya Dalam, Komplek Villa Mutiara Mas 4 C.5', 'Kalimantan Barat', 'Kota Pontianak', 'Pontianak Tenggara', '78124', '081298772589', '081298772589', 'hendrifirnando2798@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_HENDRI_FIRNANDO_13_20221129155245.pdf', 'Transkip_HENDRI_FIRNANDO_13_20221129155245.pdf', '', 'Pembayaran_HENDRI-FIRNANDO_13_20221129155245.jpg', 'Foto_HENDRI-FIRNANDO_13_20221129155245.jpg', 'KTP_HENDRI-FIRNANDO_13_20221129155245.jpg', 'Formulir_HENDRI-FIRNANDO_13_20221129155245.docx', '2022-11-29', '15:52:45'),
(57, 13, 'LA ODE SURA', 'LAIBA', '1979-08-01', 'KOMPLEK PERUMAHAN BARUG NUSANTARA KENDARI', 'Sulawesi Tenggara', 'Kota Kendari', 'Baruga', '93116', '085333693607', '085333693607', 'surahcmrsukendari@yahoo.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_LA_ODE_SURA_13_20221205204956.pdf', 'Transkip_LA_ODE_SURA_13_20221205204956.pdf', '', 'Pembayaran_LA-ODE-SURA_13_20221205204956.jpeg', 'Foto_LA-ODE-SURA_13_20221205204956.jpeg', 'KTP_LA-ODE-SURA_13_20221205204956.jpeg', 'Formulir_LA-ODE-SURA_13_20221205204956.docx', '2022-12-05', '20:49:56'),
(58, 13, 'JOSEPH', 'Abepura', '1982-01-09', 'Perumahan Bukit baruga Blok Tebing Tinggi Nias No.04', 'Sulawesi Selatan', 'Kota Makassar', 'Manggala', '90233', '082197410909', '082197410909', 'yahazielazaryapurek@gmail.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_JOSEPH_13_20221214235804.pdf', 'Transkip_JOSEPH_13_20221214235804.pdf', '', 'Pembayaran_JOSEPH_13_20221214235804.jpg', 'Foto_JOSEPH_13_20221214235804.jpg', 'KTP_JOSEPH_13_20221214235804.jpg', 'Formulir_JOSEPH_13_20221214235804.docx', '2022-12-14', '23:58:04'),
(59, 13, 'Anang Kurniawan', 'Surabaya', '1982-07-09', 'Jl. Galudra 10 Ds. Cilame', 'Jawa Barat', 'Kabupaten Bandung Barat', 'Ngamprah', '40662', '081221330288', '081221330288', 'anangkurniawan82@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Anang_Kurniawan_13_20230101014507.pdf', 'Transkip_Anang_Kurniawan_13_20230101014507.pdf', '', 'Pembayaran_Anang-Kurniawan_13_20230101014507.jpeg', 'Foto_Anang-Kurniawan_13_20230101014507.jpg', 'KTP_Anang-Kurniawan_13_20230101014507.jpg', 'Formulir_Anang-Kurniawan_13_20230101014507.docx', '2023-01-01', '01:45:07'),
(60, 13, 'Dewanti Putri Nurita', 'Pangkalpinang', '1989-10-24', 'Bumi Puspiptek Asri, Jl. Mangga 3 Blok3V/11, RT.06/RW.04\r\nDesa Pagedangan', 'Banten', 'Kabupaten Tangerang', 'Pagedangan', '15339', '085716981960', '085716981960', 'dewantiputri847@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Dewanti_Putri_Nurita_13_20230103164758.pdf', 'Transkip_Dewanti_Putri_Nurita_13_20230103164758.pdf', '', 'Pembayaran_Dewanti-Putri-Nurita_13_20230103164758.jpg', 'Foto_Dewanti-Putri-Nurita_13_20230103164758.jpg', 'KTP_Dewanti-Putri-Nurita_13_20230103164758.jpg', 'Formulir_Dewanti-Putri-Nurita_13_20230103164758.docx', '2023-01-03', '16:47:58'),
(61, 13, 'Muhammad Adib Dwi Tamma. P', 'Palembang', '1998-07-24', 'Komplek Permata Merak Blok D9 Veteran Palembang', 'Sumatra Selatan', 'Kuto Batu', 'Ilir Timur II', '30111', '082289252282', '082289252282', 'adibdwitamma@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Muhammad_Adib_Dwi_Tamma._P_13_20230103213102.pdf', 'Transkip_Muhammad_Adib_Dwi_Tamma._P_13_20230103213102.pdf', '', 'Pembayaran_Muhammad-Adib-Dwi-Tamma.-P_13_20230103213102.jpeg', 'Foto_Muhammad-Adib-Dwi-Tamma.-P_13_20230103213102.jpeg', 'KTP_Muhammad-Adib-Dwi-Tamma.-P_13_20230103213102.jpeg', 'Formulir_Muhammad-Adib-Dwi-Tamma.-P_13_20230103213102.docx', '2023-01-03', '21:31:02'),
(62, 13, 'Yanti Rumahorbo', 'Ambarita', '1992-04-23', 'Jl. RE. Martadinata RT. 010 RW. 000 Kel. Nabarua', 'Papua', 'Nabire', 'Nabire', '98811', '081343465434', '+62 813-4346-5434', 'yantirumahorbo3@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Yanti_Rumahorbo_13_20230111131837.pdf', 'Transkip_Yanti_Rumahorbo_13_20230111131837.pdf', '', 'Pembayaran_Yanti-Rumahorbo_13_20230111131837.jpg', 'Foto_Yanti-Rumahorbo_13_20230111131837.jpeg', 'KTP_Yanti-Rumahorbo_13_20230111131837.jpeg', 'Formulir_Yanti-Rumahorbo_13_20230111131837.docx', '2023-01-11', '13:18:37'),
(63, 13, 'Ade Nabilah Vania Utami', 'Palembang', '1997-06-10', 'Jalan Veteran, komplek permata merak blok D9', 'Sumatra Selatan', 'Kota Palembang', 'Ilir Timur II', '30114', '082281339831', '082281339831', 'bellazmewf@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Ade_Nabilah_Vania_Utami_13_20230112223148.pdf', 'Transkip_Ade_Nabilah_Vania_Utami_13_20230112223148.pdf', '', 'Pembayaran_Ade-Nabilah-Vania-Utami_13_20230112223148.jpeg', 'Foto_Ade-Nabilah-Vania-Utami_13_20230112223148.jpeg', 'KTP_Ade-Nabilah-Vania-Utami_13_20230112223148.jpeg', 'Formulir_Ade-Nabilah-Vania-Utami_13_20230112223148.docx', '2023-01-12', '22:31:48'),
(64, 13, 'ISTADI', 'Purworejo', '1990-10-04', 'Jl. KM. Idris No. 3 Kubang, RT.001 RW.012', 'Banten', 'Kota Serang', 'Serang', '42117', '081717797939', '081717797939', 'istadi90@gmail.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_ISTADI_13_20230113223903.pdf', 'Transkip_ISTADI_13_20230113223903.pdf', '', 'Pembayaran_ISTADI_13_20230113223903.jpeg', 'Foto_ISTADI_13_20230113223903.jpg', 'KTP_ISTADI_13_20230113223903.jpg', 'Formulir_ISTADI_13_20230113223903.docx', '2023-01-13', '22:39:03'),
(65, 13, 'RAHMATULLAH', 'Kualasimpang', '1991-06-02', 'JL. TB. Husni Qodir Ling. Pabuaran No. 25 Kelurahan Unyur', 'Banten', 'Kota Serang', 'Serang', '42111', '081919563085', '081919563085', 'rahmatullah.gtp@gmail.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_RAHMATULLAH_13_20230122093651.pdf', 'Transkip_RAHMATULLAH_13_20230122093651.pdf', '', 'Pembayaran_RAHMATULLAH_13_20230122093651.jpeg', 'Foto_RAHMATULLAH_13_20230122093651.jpg', 'KTP_RAHMATULLAH_13_20230122093651.jpg', 'Formulir_RAHMATULLAH_13_20230122093651.docx', '2023-01-22', '09:36:51'),
(66, 15, 'Glorya Nathasia Ahab', 'Ambon', '1997-06-27', 'Jln.Kota Lama', 'Maluku', 'Kabupaten Maluku Barat Daya', 'Kisar Utara', '97445', '081210984849', '081210984849', 'ahabglorya@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Glorya_Nathasia_Ahab_15_20230308201350.pdf', 'Transkip_Glorya_Nathasia_Ahab_15_20230308201351.pdf', '', 'Pembayaran_Glorya-Nathasia-Ahab_15_20230308201351.jpg', 'Foto_Glorya-Nathasia-Ahab_15_20230308201351.jpg', 'KTP_Glorya-Nathasia-Ahab_15_20230308201351.jpg', 'Formulir_Glorya-Nathasia-Ahab_15_20230308201351.docx', '2023-03-08', '20:13:51'),
(67, 15, 'Nurasiah, SST', 'Sekatak Buji', '1976-02-10', 'Jl. Gunung Beluan RT/RW :IV Desa/ Kel Sesayap', 'Kalimantan Utara', 'Kabupaten Tana Tidung', 'Sesayap Hilir', '77152', '085351785535', '085351785535', 'nurasiah7600@gami.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Nurasiah,_SST_15_20230321100940.pdf', 'Transkip_Nurasiah,_SST_15_20230321100940.pdf', '', 'Pembayaran_Nurasiah,-SST_15_20230321100940.jpeg', 'Foto_Nurasiah,-SST_15_20230321100940.jpg', 'KTP_Nurasiah,-SST_15_20230321100940.jpg', 'Formulir_Nurasiah,-SST_15_20230321100940.docx', '2023-03-21', '10:09:40'),
(68, 15, 'dr. M. Rizki Fathurrohim', 'Jakarta', '1997-06-20', 'Jl.  Nunyai Blok A, No 1B,  Rajabasa', 'Lampung', 'Kota Bandar Lampung', 'Rajabasa', '35144', '081311250040', '081311250040', 'rizkifathurrohim89@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_dr._M._Rizki_Fathurrohim_15_20230408154312.pdf', 'Transkip_dr._M._Rizki_Fathurrohim_15_20230408154312.pdf', '', 'Pembayaran_dr.-M.-Rizki-Fathurrohim_15_20230408154312.jpg', 'Foto_dr.-M.-Rizki-Fathurrohim_15_20230408154312.jpeg', 'KTP_dr.-M.-Rizki-Fathurrohim_15_20230408154312.jpeg', 'Formulir_dr.-M.-Rizki-Fathurrohim_15_20230408154312.docx', '2023-04-08', '15:43:12'),
(69, 15, 'dr. Ayu Lestari Nofiyanti', 'Kotabumi', '1993-11-14', 'Jl. Jendral Sudirman No. 267 Kotabumi', 'Lampung', 'Kabupaten Lampung Utara', 'Kotabumi', '34511', '08117221114', '08117221114', 'ayu.1482@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_dr._Ayu_Lestari_Nofiyanti_15_20230414100432.pdf', 'Transkip_dr._Ayu_Lestari_Nofiyanti_15_20230414100432.pdf', '', 'Pembayaran_dr.-Ayu-Lestari-Nofiyanti_15_20230414100432.jpeg', 'Foto_dr.-Ayu-Lestari-Nofiyanti_15_20230414100432.jpeg', 'KTP_dr.-Ayu-Lestari-Nofiyanti_15_20230414100432.jpeg', 'Formulir_dr.-Ayu-Lestari-Nofiyanti_15_20230414100432.docx', '2023-04-14', '10:04:32'),
(70, 15, 'Alvin Widya Ananda', 'Jakarta', '1998-03-15', 'Rusun Tambora IV Blok B3 No. 7 RT 013 RW 011 Angke', 'DKI Jakarta', 'Kota Administrasi Jakarta Barat', 'Tambora', '11330', '081317491112', '081317491112', 'alvinwidyaananda@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Alvin_Widya_Ananda_15_20230516125923.pdf', 'Transkip_Alvin_Widya_Ananda_15_20230516125923.pdf', '', 'Pembayaran_Alvin-Widya-Ananda_15_20230516125923.jpg', 'Foto_Alvin-Widya-Ananda_15_20230516125923.jpg', 'KTP_Alvin-Widya-Ananda_15_20230516125923.jpg', 'Formulir_Alvin-Widya-Ananda_15_20230516125923.docx', '2023-05-16', '12:59:23'),
(71, 15, 'dr SITI HANTINA JOHAN', 'NEGARA RATU', '1983-07-31', 'JL. YOS SUDARSO.24 MADUKORO', 'Lampung', 'Kabupaten Lampung Utara', 'Kotabumi Utara', '34511', '081369100398', '081369100398', 'hantinajohan@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_dr_SITI_HANTINA_JOHAN_15_20230522145353.pdf', 'Transkip_dr_SITI_HANTINA_JOHAN_15_20230522145353.pdf', '', 'Pembayaran_dr-SITI-HANTINA-JOHAN_15_20230522145353.jpeg', 'Foto_dr-SITI-HANTINA-JOHAN_15_20230522145353.jpg', 'KTP_dr-SITI-HANTINA-JOHAN_15_20230522145353.jpg', 'Formulir_dr-SITI-HANTINA-JOHAN_15_20230522145353.docx', '2023-05-22', '14:53:53'),
(72, 15, 'M Nabil Sulthoni Eralsyah', 'Batam', '2000-10-13', 'Jalan Raden Gunawan Peruh. Griya Assalam Blok E No 6', 'Lampung', 'Kota Bandar Lampung', 'Rajabasa', '35144', '-', '085155161876', 'NABILSULTHONI@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_M_Nabil_Sulthoni_Eralsyah_15_20230623130211.pdf', 'Transkip_M_Nabil_Sulthoni_Eralsyah_15_20230623130211.pdf', '', 'Pembayaran_M-Nabil-Sulthoni-Eralsyah_15_20230623130211.jpg', 'Foto_M-Nabil-Sulthoni-Eralsyah_15_20230623130211.jpg', 'KTP_M-Nabil-Sulthoni-Eralsyah_15_20230623130211.jpeg', 'Formulir_M-Nabil-Sulthoni-Eralsyah_15_20230623130211.docx', '2023-06-23', '13:02:11'),
(73, 15, 'Fendy Aprilian Pamungkas', 'Semarang', '1994-04-13', 'Jl. Kelapa Pendek No 53 (Belakang SPBT), Kota Ternate', 'Maluku Utara', 'Kota Ternate', 'Ternate Selatan (Kota)', '97751', '082198971847', '082198971847', 'fendyaprilian@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Fendy_Aprilian_Pamungkas_15_20230628103205.pdf', 'Transkip_Fendy_Aprilian_Pamungkas_15_20230628103205.pdf', '', 'Pembayaran_Fendy-Aprilian-Pamungkas_15_20230628103205.jpeg', 'Foto_Fendy-Aprilian-Pamungkas_15_20230628103205.jpg', 'KTP_Fendy-Aprilian-Pamungkas_15_20230628103205.jpeg', 'Formulir_Fendy-Aprilian-Pamungkas_15_20230628103205.docx', '2023-06-28', '10:32:05'),
(74, 15, 'ADRIYANTO LAPAUGI', 'Gorontalo', '1984-07-16', ':      JL. BANJAR NO.7\r\n       RT / RW : - / -  Desa / Kel. : BUGIS\r\n       Kec.  : DUMBO RAYA', 'Gorontalo', 'Kota Gorontalo', 'Dumbo Raya', '96118', '085340101781/081242559850', '085340101781/081242559850', 'tahasiswatiana@gmail.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_ADRIYANTO_LAPAUGI_15_20230713123709.pdf', 'Transkip_ADRIYANTO_LAPAUGI_15_20230713123709.pdf', '', 'Pembayaran_ADRIYANTO-LAPAUGI_15_20230713123709.jpeg', 'Foto_ADRIYANTO-LAPAUGI_15_20230713123709.jpeg', 'KTP_ADRIYANTO-LAPAUGI_15_20230713123709.jpeg', 'Formulir_ADRIYANTO-LAPAUGI_15_20230713123709.docx', '2023-07-13', '12:37:09'),
(75, 15, 'DEDI ALNANDO', 'KOTO TUO', '1989-09-27', 'jl. Bandara Rembele-Pante Raya, Kab. Bener Meriah', 'Aceh', 'Bener Meriah', 'Wih Pesam', '24580', '08127662882', '08127662882', 'dedialnandosh@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_DEDI_ALNANDO_15_20230803221720.pdf', 'Transkip_DEDI_ALNANDO_15_20230803221720.pdf', '', 'Pembayaran_DEDI-ALNANDO_15_20230803221720.jpeg', 'Foto_DEDI-ALNANDO_15_20230803221720.jpg', 'KTP_DEDI-ALNANDO_15_20230803221720.jpg', 'Formulir_DEDI-ALNANDO_15_20230803221720.docx', '2023-08-03', '22:17:20'),
(76, 15, 'Mohamad Abdulah', 'Cianjur', '1998-11-07', 'Kp simpang Des Simpang', 'Jawa Barat', 'Kabupaten Cianjur', 'Takokak', '43265', '085864333374', '085864333374', 'mohamadabdulah29@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Mohamad_Abdulah_15_20230804105602.pdf', 'Transkip_Mohamad_Abdulah_15_20230804105602.pdf', '', 'Pembayaran_Mohamad-Abdulah_15_20230804105602.jpg', 'Foto_Mohamad-Abdulah_15_20230804105602.jpg', 'KTP_Mohamad-Abdulah_15_20230804105602.jpg', 'Formulir_Mohamad-Abdulah_15_20230804105602.docx', '2023-08-04', '10:56:02'),
(77, 15, 'Agung Dwijo Sasongko', 'Bekasi', '1983-11-04', 'Bogor Raya Permai Blok FC 3 No 14, Kota Bogor', 'Jawa Barat', 'Kota Bogor', 'Bogor Barat - Kota', '16166', '08111185577', '08111185577', 'agungds1983@gmail.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_Agung_Dwijo_Sasongko_15_20230814134047.pdf', 'Transkip_Agung_Dwijo_Sasongko_15_20230814134047.pdf', '', 'Pembayaran_Agung-Dwijo-Sasongko_15_20230814134047.jpg', 'Foto_Agung-Dwijo-Sasongko_15_20230814134047.jpg', 'KTP_Agung-Dwijo-Sasongko_15_20230814134047.jpg', 'Formulir_Agung-Dwijo-Sasongko_15_20230814134047.docx', '2023-08-14', '13:40:47'),
(78, 15, 'Erna Kena', 'Ujung pandang', '1985-10-16', 'Jl Diponegoro', 'Sulawesi Barat', 'Mamuju', 'Mamuju', '91511', '+62 823-2105-1786', '+62 823-2105-1786', 'ernakinesio5@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Erna_Kena_15_20230816140745.pdf', 'Transkip_Erna_Kena_15_20230816140745.pdf', '', 'Pembayaran_Erna-Kena_15_20230816140745.jpg', 'Foto_Erna-Kena_15_20230816140745.jpg', 'KTP_Erna-Kena_15_20230816140745.jpg', 'Formulir_Erna-Kena_15_20230816140745.docx', '2023-08-16', '14:07:45'),
(79, 15, 'BUDI RAHMADI', 'LAMBUR', '1986-10-22', 'Perum Anugrah Batara I No. 47 Rt. 09 Desa Mekar Jaya', 'Jambi', 'Kabupaten Muaro Jambi', 'Sungai Gelam', '36363', '085266951961', '085266951961', 'boe_sy09@yahoo.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_BUDI_RAHMADI_15_20230818185511.pdf', 'Transkip_BUDI_RAHMADI_15_20230818185511.pdf', '', 'Pembayaran_BUDI-RAHMADI_15_20230818185511.jpeg', 'Foto_BUDI-RAHMADI_15_20230818185511.JPG', 'KTP_BUDI-RAHMADI_15_20230818185511.jpeg', 'Formulir_BUDI-RAHMADI_15_20230818185511.docx', '2023-08-18', '18:55:11'),
(80, 15, 'dr. Milano Wibi Takbiranda', 'Jakarta', '1997-02-05', 'Jl Endu Kelurahan Rejosari Kecamatan Tenayan Raya kota Pekanbaru Riau', 'Riau', 'Kota Pekanbaru', 'Tenayan Raya', '28281', '082284228407', '082284228407', 'milanowibit@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_dr._Milano_Wibi_Takbiranda_15_20230819194347.pdf', 'Transkip_dr._Milano_Wibi_Takbiranda_15_20230819194347.pdf', '', 'Pembayaran_dr.-Milano-Wibi-Takbiranda_15_20230819194347.jpeg', 'Foto_dr.-Milano-Wibi-Takbiranda_15_20230819194347.jpg', 'KTP_dr.-Milano-Wibi-Takbiranda_15_20230819194347.jpg', 'Formulir_dr.-Milano-Wibi-Takbiranda_15_20230819194347.docx', '2023-08-19', '19:43:47'),
(81, 15, 'Noak Karubuy,S.Sos', 'Sorong', '1981-11-30', 'Kampung Kabouw,RT 02', 'Papua Barat', 'Kabupaten Teluk Wondama', 'Wondiboy (Wasior Selatan)', '98347', '082199095456', '082199095456', 'nockykarubuy@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Noak_Karubuy,S.Sos_15_20230822115250.pdf', 'Transkip_Noak_Karubuy,S.Sos_15_20230822115250.pdf', '', 'Pembayaran_Noak-Karubuy,S.Sos_15_20230822115250.jpg', 'Foto_Noak-Karubuy,S.Sos_15_20230822115250.jpg', 'KTP_Noak-Karubuy,S.Sos_15_20230822115250.jpg', 'Formulir_Noak-Karubuy,S.Sos_15_20230822115250.docx', '2023-08-22', '11:52:50'),
(82, 15, 'Marini Delina Charla Rarawi', 'Jakarta', '1994-04-26', 'Kompleks Rumah Sakit', 'Papua Pegunungan', 'Kabupaten Nduga', 'Kenyam', '99942', '081343365604', '081343365604', 'marinidelanicharlararawi@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Marini_Delina_Charla_Rarawi_15_20230826132404.pdf', 'Transkip_Marini_Delina_Charla_Rarawi_15_20230826132404.pdf', '', 'Pembayaran_Marini-Delina-Charla-Rarawi_15_20230826132404.jpeg', 'Foto_Marini-Delina-Charla-Rarawi_15_20230826132404.jpeg', 'KTP_Marini-Delina-Charla-Rarawi_15_20230826132404.jpeg', 'Formulir_Marini-Delina-Charla-Rarawi_15_20230826132404.docx', '2023-08-26', '13:24:04'),
(83, 15, 'Karomahul Malaya Jati', 'Bogor', '2001-10-10', 'Kp. Kemang Kiara Gg. Astana No. 6', 'Jawa Barat', 'Kabupaten Bogor', 'Kemang', '16310', '081211304473', '081211304473', 'karomahulkmj@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Karomahul_Malaya_Jati_15_20230828145643.pdf', 'Transkip_Karomahul_Malaya_Jati_15_20230828145643.pdf', '', 'Pembayaran_Karomahul-Malaya-Jati_15_20230828145643.jpg', 'Foto_Karomahul-Malaya-Jati_15_20230828145643.jpg', 'KTP_Karomahul-Malaya-Jati_15_20230828145643.jpg', 'Formulir_Karomahul-Malaya-Jati_15_20230828145643.docx', '2023-08-28', '14:56:43'),
(84, 15, 'Valerianus Bria', 'Rabasa Bradik', '1996-11-22', 'Dusun Nularan Rt.08 Rw.2 Desa Rabsahain', 'Nusa Tenggara Barat', 'Kabupaten Malaka', 'Malaka Barat', '85763', '081338672010', '081338672010', 'Fervallery11@gmail.com', 'Magister Akutansi', 'Keuangan', 'Ijazah_Valerianus_Bria_15_20230831162543.pdf', 'Transkip_Valerianus_Bria_15_20230831162543.pdf', '', 'Pembayaran_Valerianus-Bria_15_20230831162543.jpg', 'Foto_Valerianus-Bria_15_20230831162543.jpeg', 'KTP_Valerianus-Bria_15_20230831162543.jpg', 'Formulir_Valerianus-Bria_15_20230831162543.docx', '2023-08-31', '16:25:43'),
(85, 15, 'Meti Linawati, S.Kom', 'Jakarta', '1969-10-06', 'Jl. Jagakarsa Raya No.1 Kelapa Tiga Rt.10 Rw.03', 'DKI Jakarta', 'Kota Administrasi Jakarta Selatan', 'Jagakarsa', '12620', '7864662', '081806664123', 'meti.linawati@yahoo.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Meti_Linawati,_S.Kom_15_20230902115135.pdf', 'Transkip_Meti_Linawati,_S.Kom_15_20230902115135.pdf', '', 'Pembayaran_Meti-Linawati,-S.Kom_15_20230902115135.jpeg', 'Foto_Meti-Linawati,-S.Kom_15_20230902115135.jpg', 'KTP_Meti-Linawati,-S.Kom_15_20230902115135.jpeg', 'Formulir_Meti-Linawati,-S.Kom_15_20230902115135.docx', '2023-09-02', '11:51:35'),
(86, 15, 'HARFAH', 'KAILI', '1976-09-18', 'Komp.Marham JL Marham Alam Raya Blok B No 4', 'Sulawesi Selatan', 'Kota Parepare', 'Bacukiki Barat', '91121', '081 281 890 313', '081 281 890 313', 'harfahmasady@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_HARFAH_15_20230905143417.pdf', 'Transkip_HARFAH_15_20230905143417.pdf', '', 'Pembayaran_HARFAH_15_20230905143417.jpeg', 'Foto_HARFAH_15_20230905143417.jpg', 'KTP_HARFAH_15_20230905143417.jpg', 'Formulir_HARFAH_15_20230905143417.docx', '2023-09-05', '14:34:17'),
(87, 15, 'Tri Hedianto', 'Surabaya', '1985-04-22', 'Gersikan buntu no 9 Surabaya', 'Jawa Timur', 'Kota Surabaya', 'Tambaksari', '60131', '085210001242', '085210001242', 'trihedianto@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Tri_Hedianto_15_20230906175011.pdf', 'Transkip_Tri_Hedianto_15_20230906175011.pdf', '', 'Pembayaran_Tri-Hedianto_15_20230906175011.jpeg', 'Foto_Tri-Hedianto_15_20230906175011.jpg', 'KTP_Tri-Hedianto_15_20230906175011.jpg', 'Formulir_Tri-Hedianto_15_20230906175011.docx', '2023-09-06', '17:50:11'),
(88, 15, 'Alamsyah', 'Bima', '1991-10-08', 'Desa Sumi kecamatan lambu kabupaten Bima NTB', 'Nusa Tenggara Barat', 'Kabupaten Bima', 'Lambu', '84182', '085338908203', '08533898203', 'alamsyah.abdmalik@yahoo.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_Alamsyah_15_20230907094736.pdf', 'Transkip_Alamsyah_15_20230907094736.pdf', '', 'Pembayaran_Alamsyah_15_20230907094736.jpeg', 'Foto_Alamsyah_15_20230907094736.jpeg', 'KTP_Alamsyah_15_20230907094736.jpeg', 'Formulir_Alamsyah_15_20230907094736.docx', '2023-09-07', '09:47:36'),
(89, 15, 'Muhammad Tedo Hardiyanto', 'Jakarta', '1987-04-05', 'Jl. Kh Hasyim Ashari Blok C No.15 Rt.05 Rw.03 Desa/Kel Limbangan Kulon', 'Jawa Tengah', 'Kabupaten Brebes', 'Brebes', '52219', '087889300600', '087889300600', 'hardiyanto.tedo@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Muhammad_Tedo_Hardiyanto_15_20230907125301.pdf', 'Transkip_Muhammad_Tedo_Hardiyanto_15_20230907125301.pdf', '', 'Pembayaran_Muhammad-Tedo-Hardiyanto_15_20230907125301.jpeg', 'Foto_Muhammad-Tedo-Hardiyanto_15_20230907125301.jpeg', 'KTP_Muhammad-Tedo-Hardiyanto_15_20230907125301.jpeg', 'Formulir_Muhammad-Tedo-Hardiyanto_15_20230907125301.docx', '2023-09-07', '12:53:01'),
(90, 15, 'Ranti Ana Ningsih', 'Surabaya', '1985-07-17', 'Gersikan Buntu no 9 Surabaya', 'Jawa Timur', 'Kota Surabaya', 'Tambaksari', '60131', '081703416739', '081703416739', 'rantianadr@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Ranti_Ana_Ningsih_15_20230908073320.pdf', 'Transkip_Ranti_Ana_Ningsih_15_20230908073320.pdf', '', 'Pembayaran_Ranti-Ana-Ningsih_15_20230908073320.jpeg', 'Foto_Ranti-Ana-Ningsih_15_20230908073320.jpeg', 'KTP_Ranti-Ana-Ningsih_15_20230908073320.jpg', 'Formulir_Ranti-Ana-Ningsih_15_20230908073320.docx', '2023-09-08', '07:33:20'),
(91, 15, 'Wilson Marpaung', 'Pangasean', '1975-11-16', 'Jl. Aswa No 35 LK XI Desa/Kel Gedung Johor', 'Sumatra Utara', 'Kota Medan', 'Medan Johor', '20144', '085283010016', '085283010016', 'wilsonmarpaung75@gmail.com', 'Magister Akutansi', 'Keuangan', 'Ijazah_Wilson_Marpaung_15_20230908115019.pdf', 'Transkip_Wilson_Marpaung_15_20230908115019.pdf', '', 'Pembayaran_Wilson-Marpaung_15_20230908115019.jpeg', 'Foto_Wilson-Marpaung_15_20230908115019.jpeg', 'KTP_Wilson-Marpaung_15_20230908115019.jpeg', 'Formulir_Wilson-Marpaung_15_20230908115019.docx', '2023-09-08', '11:50:19'),
(92, 15, 'RIZAL JUNIAR RIZQI', 'BANDUNG', '1989-06-30', 'KP. SARENGSENG RT.018/007', 'Jawa Barat', 'Kabupaten Subang', 'Patokbeusi', '41263', '081296666351', '081296666351', 'rizaljuniarr@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_RIZAL_JUNIAR_RIZQI_15_20230908205823.pdf', 'Transkip_RIZAL_JUNIAR_RIZQI_15_20230908205823.pdf', '', 'Pembayaran_RIZAL-JUNIAR-RIZQI_15_20230908205823.jpeg', 'Foto_RIZAL-JUNIAR-RIZQI_15_20230908205823.jpg', 'KTP_RIZAL-JUNIAR-RIZQI_15_20230908205823.jpeg', 'Formulir_RIZAL-JUNIAR-RIZQI_15_20230908205823.docx', '2023-09-08', '20:58:23'),
(93, 15, 'Fahmi Muhajir', 'Kota Bekasi', '1997-09-29', 'Jl. Garuda IV Kavling Tunas Jaya Rt.001 Rw. 002 Desa/Kel Harapan Mulya', 'Jawa Barat', 'Kota Bekasi', 'Medan Satria', '171343', '081807239544', '081807239544', 'fahmimuhajirrr@gmail.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_Fahmi_Muhajir_15_20230909095728.pdf', 'Transkip_Fahmi_Muhajir_15_20230909095728.pdf', '', 'Pembayaran_Fahmi-Muhajir_15_20230909095728.jpeg', 'Foto_Fahmi-Muhajir_15_20230909095728.jpg', 'KTP_Fahmi-Muhajir_15_20230909095728.jpeg', 'Formulir_Fahmi-Muhajir_15_20230909095728.docx', '2023-09-09', '09:57:28'),
(94, 15, 'Riyan Charlie Milyantono', 'Kediri', '1985-07-14', 'Kali Kepiting 125 blok B-4 RT / RW : 007/005 Kelurahan  Pacarkembang', 'Jawa Timur', 'Kota Surabaya', 'Tambaksari', '60138', '085648261216', '085648261216', 'dr.riyancharlie@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Riyan_Charlie_Milyantono_15_20230909104219.pdf', 'Transkip_Riyan_Charlie_Milyantono_15_20230909104219.pdf', '', 'Pembayaran_Riyan-Charlie-Milyantono_15_20230909104219.jpg', 'Foto_Riyan-Charlie-Milyantono_15_20230909104219.jpg', 'KTP_Riyan-Charlie-Milyantono_15_20230909104219.jpg', 'Formulir_Riyan-Charlie-Milyantono_15_20230909104219.docx', '2023-09-09', '10:42:19'),
(95, 15, 'dr. Alef Adlia Rahmani', 'Teluk Betung', '1983-04-12', 'jl. Serma Peturun n0 33 kotabumi Lampung Utara 34511', 'lam', 'Kabupaten Lampung Utara', 'Kotabumi Selatan', '34511', '08122753746', '0812273746', 'dralefalifa@yahoo.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_dr._Alef_Adlia_Rahmani_15_20230909140018.pdf', 'Transkip_dr._Alef_Adlia_Rahmani_15_20230909140018.pdf', '', 'Pembayaran_dr.-Alef-Adlia-Rahmani_15_20230909140018.jpg', 'Foto_dr.-Alef-Adlia-Rahmani_15_20230909140018.jpg', 'KTP_dr.-Alef-Adlia-Rahmani_15_20230909140018.jpg', 'Formulir_dr.-Alef-Adlia-Rahmani_15_20230909140018.docx', '2023-09-09', '14:00:18'),
(96, 15, 'Saprudin Sri Susanto', 'Bandung', '1985-08-03', 'Jl. Moch.Toha Gg. Legok Cireureuh No. 151/202 B Rt.03 Rw. 04 Desa/Kel Karasak', 'Jawa Barat', 'Kota Bandung', 'Astana Anyar', '40243', '(022)54428238', '081999011999', 'saprudinssusanto@gamil.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_Saprudin_Sri_Susanto_15_20230909160149.pdf', 'Transkip_Saprudin_Sri_Susanto_15_20230909160149.pdf', '', 'Pembayaran_Saprudin-Sri-Susanto_15_20230909160149.jpeg', 'Foto_Saprudin-Sri-Susanto_15_20230909160149.jpeg', 'KTP_Saprudin-Sri-Susanto_15_20230909160149.jpeg', 'Formulir_Saprudin-Sri-Susanto_15_20230909160149.docx', '2023-09-09', '16:01:49'),
(97, 15, 'Maria Stolin Timu Kumanireng', 'Larantuka', '1994-11-23', 'Desa Mokantarak Rt. 012 Rw. 008', 'Nusa Tenggara Timur', 'Kabupaten Flores Timur', 'Larantuka', '86219', '081212817693', '081212817693', 'mariastolin2311@gamil.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Maria_Stolin_Timu_Kumanireng_15_20230911093405.pdf', 'Transkip_Maria_Stolin_Timu_Kumanireng_15_20230911093405.pdf', '', 'Pembayaran_Maria-Stolin-Timu-Kumanireng_15_20230911093405.jpeg', 'Foto_Maria-Stolin-Timu-Kumanireng_15_20230911093405.jpg', 'KTP_Maria-Stolin-Timu-Kumanireng_15_20230911093405.jpg', 'Formulir_Maria-Stolin-Timu-Kumanireng_15_20230911093405.docx', '2023-09-11', '09:34:05'),
(98, 15, 'Abdul Mutaqin', 'Bandung', '1991-01-19', 'Jl. Raya Derwati Gang Haji Wahli Rt. 03 Rw 06 Desa/Kel Derwati', 'Jawa Barat', 'Kota Bandung', 'Rancasari', '40292', '081291607286', '081291607286', 'mutaqinabdul18@gmail.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_Abdul_Mutaqin_15_20230911101920.PDF', 'Transkip_Abdul_Mutaqin_15_20230911101920.PDF', '', 'Pembayaran_Abdul-Mutaqin_15_20230911101920.jpeg', 'Foto_Abdul-Mutaqin_15_20230911101920.jpeg', 'KTP_Abdul-Mutaqin_15_20230911101920.jpeg', 'Formulir_Abdul-Mutaqin_15_20230911101920.docx', '2023-09-11', '10:19:20'),
(99, 16, 'A Deni Iskandar', 'Tasikmalaya', '1972-01-16', 'Bumi Krakatau Permai Jl Krakatau I Blok 4 B No A.2 Rt. 03 Rw.01 Desa /Kel Margatani', 'Banten', 'Kota Serang', 'Kramatwatu', '42016', '081310523923', '081310523923', 'deni.iskandar1972@gmail.com', 'Magister Akutansi', 'Auditing', 'Ijazah_A_Deni_Iskandar_16_20230914171053.pdf', 'Transkip_A_Deni_Iskandar_16_20230914171053.pdf', '', 'Pembayaran_A-Deni-Iskandar_16_20230914171053.jpeg', 'Foto_A-Deni-Iskandar_16_20230914171053.jpeg', 'KTP_A-Deni-Iskandar_16_20230914171053.jpeg', 'Formulir_A-Deni-Iskandar_16_20230914171053.docx', '2023-09-14', '17:10:53'),
(100, 16, 'Enrika Tunjung Puspita', 'Gunung Kidul', '1996-01-23', 'Trenggono Selatan Rt. 01 Rw.12 Desa/Kel Sidorejo', 'DI Yogyakarta', 'Kabupaten Gunungkidul', 'Ponjong', '55892', '0895322913041', '0895322913041', 'enrikapuspita@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Enrika_Tunjung_Puspita_16_20230914195111.pdf', 'Transkip_Enrika_Tunjung_Puspita_16_20230914195111.pdf', '', 'Pembayaran_Enrika-Tunjung-Puspita_16_20230914195111.jpeg', 'Foto_Enrika-Tunjung-Puspita_16_20230914195111.jpg', 'KTP_Enrika-Tunjung-Puspita_16_20230914195111.jpeg', 'Formulir_Enrika-Tunjung-Puspita_16_20230914195111.docx', '2023-09-14', '19:51:11'),
(101, 16, 'Aprili Wulandari', 'Bohomotefe', '1995-04-07', 'Jl, Trans Sulawesi Rt.04 Rw,04 Desa/Kel Bahomotefe', 'Sulawesi Tengah', 'Kabupaten Morowali', 'Bungku Timur', '94980', '085240900323', '085240900323', 'apprilia64@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Aprili_Wulandari_16_20230914202110.pdf', 'Transkip_Aprili_Wulandari_16_20230914202110.pdf', '', 'Pembayaran_Aprili-Wulandari_16_20230914202110.jpeg', 'Foto_Aprili-Wulandari_16_20230914202110.jpg', 'KTP_Aprili-Wulandari_16_20230914202110.jpeg', 'Formulir_Aprili-Wulandari_16_20230914202110.docx', '2023-09-14', '20:21:10'),
(102, 16, 'Nurhidayani', 'Rebang Tinggi', '1980-06-08', 'Jl Sahantang No 73 Rt.01 Rw.01 Desa/Kel Tiubalak Pasar Kec. Baradatu', 'Lampung', 'Kabupaten Way Kanan', 'Baradatu', '34766', '085268663324', '085268663324', 'nurhidayani816@guru.sd.belajar.id', 'Magister Manajemen', 'Manajemen', 'Ijazah_Nurhidayani_16_20230915111048.pdf', 'Transkip_Nurhidayani_16_20230915111048.pdf', '', 'Pembayaran_Nurhidayani_16_20230915111048.jpeg', 'Foto_Nurhidayani_16_20230915111048.jpeg', 'KTP_Nurhidayani_16_20230915111048.jpeg', 'Formulir_Nurhidayani_16_20230915111048.docx', '2023-09-15', '11:10:48'),
(103, 16, 'Nunuk Musluhiyah', 'Surabaya', '1986-04-28', 'Jl. KH. Mukhals Tengah No. 03 Rt. 08 Rw. 02 Desa/Kel. Kalanganyar', 'Jawa Timur', 'Kabupaten Sidoarjo', 'Sedati', '61253', '08113224800', '08113224800', 'dr.nunuk@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Nunuk_Musluhiyah_16_20230915125624.pdf', 'Transkip_Nunuk_Musluhiyah_16_20230915125624.pdf', '', 'Pembayaran_Nunuk-Musluhiyah_16_20230915125624.jpeg', 'Foto_Nunuk-Musluhiyah_16_20230915125624.jpeg', 'KTP_Nunuk-Musluhiyah_16_20230915125624.jpeg', 'Formulir_Nunuk-Musluhiyah_16_20230915125624.docx', '2023-09-15', '12:56:24'),
(104, 16, 'Cece Syaputra', 'Muara Teweh', '1977-10-13', 'Jl. Sengaji Hulu No. 03 Rt.19 Rw.00 Desa/Kel. Melayu', 'Kalimantan Tengah', 'Kabupaten Muara Enim', 'Teweh Tengah', '73811', '081354410848', '081354410848', 'Cecesyaputra@gmail.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_Cece_Syaputra_16_20230915154413.pdf', 'Transkip_Cece_Syaputra_16_20230915154413.pdf', '', 'Pembayaran_Cece-Syaputra_16_20230915154413.jpeg', 'Foto_Cece-Syaputra_16_20230915154413.jpeg', 'KTP_Cece-Syaputra_16_20230915154413.jpeg', 'Formulir_Cece-Syaputra_16_20230915154413.docx', '2023-09-15', '15:44:13'),
(105, 16, 'Donny Septian Wibisono', 'Balikpapan', '1990-09-01', 'Jl Candi Mendut Selatan II no 18', 'Jawa Timur', 'Kota Malang', 'Lowokwaru', '65141', '081216194824', '082132720332', 'donnyseptianwibisono@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Donny_Septian_Wibisono_16_20230915162217.pdf', 'Transkip_Donny_Septian_Wibisono_16_20230915162217.pdf', '', 'Pembayaran_Donny-Septian-Wibisono_16_20230915162217.jpg', 'Foto_Donny-Septian-Wibisono_16_20230915162217.jpg', 'KTP_Donny-Septian-Wibisono_16_20230915162217.jpg', 'Formulir_Donny-Septian-Wibisono_16_20230915162217.docx', '2023-09-15', '16:22:17'),
(106, 16, 'Rahmi', 'Muaradua', '1993-01-22', 'Perumahan Golden Palm Hill Blok A1 No 12 Desa Sukadami', 'Jawa Barat', 'Kabupaten Bekasi', 'Cikarang Selatan', '17530', '081274117030', '081274117030', 'rahmi.warliyanaa@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Rahmi_16_20230915171609.pdf', 'Transkip_Rahmi_16_20230915171609.pdf', '', 'Pembayaran_Rahmi_16_20230915171609.jpeg', 'Foto_Rahmi_16_20230915171609.jpeg', 'KTP_Rahmi_16_20230915171609.jpeg', 'Formulir_Rahmi_16_20230915171609.docx', '2023-09-15', '17:16:09'),
(107, 16, 'Ade Ranny Ratnaningsih', 'Karawang', '1983-06-26', 'Jln Gadung IV No.3 Rt.01 Rw.1 Kel Karang Mekar', 'Jawa Barat', 'Kota Cimahi', 'Cimahi Tengah', '40523', '0811720683', '0811720683', 'rannyratnaningsih26@gmail.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_Ade_Ranny_Ratnaningsih_16_20230915195258.pdf', 'Transkip_Ade_Ranny_Ratnaningsih_16_20230915195258.pdf', '', 'Pembayaran_Ade-Ranny-Ratnaningsih_16_20230915195258.jpeg', 'Foto_Ade-Ranny-Ratnaningsih_16_20230915195258.jpeg', 'KTP_Ade-Ranny-Ratnaningsih_16_20230915195258.jpeg', 'Formulir_Ade-Ranny-Ratnaningsih_16_20230915195258.docx', '2023-09-15', '19:52:58'),
(108, 16, 'Gunadi Ibnu Sutopo', 'Karangayar', '1981-08-23', 'Beruk Kulon Rt.01 Rw. 05 Desa Beruk', 'Jawa Tengah', 'Kabupaten Karanganyar', 'Jatiyoso', '57785', '087836006064', '087836006064', 'Gunadiibnusutopo30244@gamil.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_Gunadi_Ibnu_Sutopo_16_20230916084157.pdf', 'Transkip_Gunadi_Ibnu_Sutopo_16_20230916084157.pdf', '', 'Pembayaran_Gunadi-Ibnu-Sutopo_16_20230916084157.jpeg', 'Foto_Gunadi-Ibnu-Sutopo_16_20230916084157.jpeg', 'KTP_Gunadi-Ibnu-Sutopo_16_20230916084157.jpeg', 'Formulir_Gunadi-Ibnu-Sutopo_16_20230916084157.docx', '2023-09-16', '08:41:57'),
(109, 16, 'Selly Tristiyanti', 'Purwokwerto', '1990-06-15', 'Jl. Jendral Soedirman Rt.05 Rw.02 Desa/Kel. Purwokerto', 'Lampung', 'Kabupaten Lampung Tengah', 'Kota Gajah', '34153', '082165550504', '082165550504', 'Sellytriss@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Selly_Tristiyanti_16_20230918113943.pdf', 'Transkip_Selly_Tristiyanti_16_20230918113943.pdf', '', 'Pembayaran_Selly-Tristiyanti_16_20230918113943.jpeg', 'Foto_Selly-Tristiyanti_16_20230918113943.jpg', 'KTP_Selly-Tristiyanti_16_20230918113943.jpg', 'Formulir_Selly-Tristiyanti_16_20230918113943.docx', '2023-09-18', '11:39:43'),
(110, 16, 'Talizokho Halawa', 'Sifiora\'asi', '1981-08-27', 'Desa Sifaoroasi Rt.09 Rw.04', 'Sumatra Utara', 'Kabupaten Nias Selatan', 'Huruna', '22867', '081396858153', '081396858153', 'talizokhohal@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Talizokho_Halawa_16_20230918115918.pdf', 'Transkip_Talizokho_Halawa_16_20230918115918.pdf', '', 'Pembayaran_Talizokho-Halawa_16_20230918115918.jpeg', 'Foto_Talizokho-Halawa_16_20230918115918.jpg', 'KTP_Talizokho-Halawa_16_20230918115918.jpg', 'Formulir_Talizokho-Halawa_16_20230918115918.docx', '2023-09-18', '11:59:18'),
(111, 16, 'Iyan Mulyana', 'Subang', '1981-08-22', 'Jl. Masjid Jami Alikhwan Rt.03 Rw.06 Desa Cinta Rasa', 'Jawa Barat', 'Kabupaten Garut', 'Semarang', '44160', '082129101968', '082129101968', 'iyanmulyana168@gamil.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_Iyan_Mulyana_16_20230918120549.pdf', 'Transkip_Iyan_Mulyana_16_20230918120549.pdf', '', 'Pembayaran_Iyan-Mulyana_16_20230918120549.jpeg', 'Foto_Iyan-Mulyana_16_20230918120549.jpeg', 'KTP_Iyan-Mulyana_16_20230918120549.jpeg', 'Formulir_Iyan-Mulyana_16_20230918120549.docx', '2023-09-18', '12:05:49'),
(112, 16, 'Dedy Triyono', 'Banyuwangi', '1981-01-03', 'Apartemen Puncak CBD Wiyung Surabaya Unit A0106 Desa/Kel. Jajar Tunggal', 'Jawa Timur', 'Kota Surabaya', 'Wiyung', '60228', '081333660136', '081333660136', 'detron@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Dedy_Triyono_16_20230918122727.pdf', 'Transkip_Dedy_Triyono_16_20230918122727.pdf', '', 'Pembayaran_Dedy-Triyono_16_20230918122727.jpeg', 'Foto_Dedy-Triyono_16_20230918122727.jpeg', 'KTP_Dedy-Triyono_16_20230918122727.jpeg', 'Formulir_Dedy-Triyono_16_20230918122727.docx', '2023-09-18', '12:27:27'),
(113, 16, 'RENDIAWAN, ST', 'TANJUNG JAYA', '1979-07-13', 'Perumahan Pinang Mas Blok C No 11 RT. 23 RW. 1 Bentiring Permai', 'Bengkulu', 'Kota Bengkulu', 'Muara Bangka Hulu', '38121', '082269268822', '082269268822', 'rendiawan79@gmail.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_RENDIAWAN,_ST_16_20230922134100.pdf', 'Transkip_RENDIAWAN,_ST_16_20230922134100.pdf', '', 'Pembayaran_RENDIAWAN,-ST_16_20230922134100.jpg', 'Foto_RENDIAWAN,-ST_16_20230922134100.jpg', 'KTP_RENDIAWAN,-ST_16_20230922134100.jpg', 'Formulir_RENDIAWAN,-ST_16_20230922134100.docx', '2023-09-22', '13:41:00'),
(114, 16, 'Ridho Cahya Dewangga', 'Tanjungpandan', '1993-12-20', 'Jl mangun sarkoro no 19 a trenggalek', 'Jawa Timur', 'Kabupaten Trenggalek', 'Trenggalek', '66316', '085607784875', '085607884875', 'ridho.dewangga20@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Ridho_Cahya_Dewangga_16_20230926190111.pdf', 'Transkip_Ridho_Cahya_Dewangga_16_20230926190111.pdf', '', 'Pembayaran_Ridho-Cahya-Dewangga_16_20230926190111.jpeg', 'Foto_Ridho-Cahya-Dewangga_16_20230926190111.jpeg', 'KTP_Ridho-Cahya-Dewangga_16_20230926190111.jpg', 'Formulir_Ridho-Cahya-Dewangga_16_20230926190111.docx', '2023-09-26', '19:01:11'),
(115, 16, 'Muhammad Reqza Pratama', 'Metro', '1999-03-31', 'Perum Taman Untung Suropati Blok C no.17 Lk. I', 'Lampung', 'Kota Bandar Lampung', 'Labuhan Ratu', '35142', '088286147726', '088286147726', 'reqzapratama@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Muhammad_Reqza_Pratama_16_20231013170911.pdf', 'Transkip_Muhammad_Reqza_Pratama_16_20231013170911.pdf', '', 'Pembayaran_Muhammad-Reqza-Pratama_16_20231013170911.jpeg', 'Foto_Muhammad-Reqza-Pratama_16_20231013170911.jpeg', 'KTP_Muhammad-Reqza-Pratama_16_20231013170911.jpeg', 'Formulir_Muhammad-Reqza-Pratama_16_20231013170911.docx', '2023-10-13', '17:09:11'),
(116, 16, 'Muhammad Reqza Pratama', 'Metro', '1999-03-31', 'Perum Taman Untung Suropati Blok C no. 17 Lk. I', 'Lampung', 'Kota Bandar Lampung', 'Labuhan Ratu', '35142', '088286147726', '088286147726', 'reqzapratama4@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Muhammad_Reqza_Pratama_16_20231013171750.pdf', 'Transkip_Muhammad_Reqza_Pratama_16_20231013171750.pdf', '', 'Pembayaran_Muhammad-Reqza-Pratama_16_20231013171750.jpeg', 'Foto_Muhammad-Reqza-Pratama_16_20231013171750.jpeg', 'KTP_Muhammad-Reqza-Pratama_16_20231013171750.jpeg', 'Formulir_Muhammad-Reqza-Pratama_16_20231013171750.docx', '2023-10-13', '17:17:50'),
(117, 18, 'Farah Saufika, S.Kep., Ns.', 'Bondowoso', '1997-03-09', 'Dusun Dawuhan RT 10 RW 04, Wonokusumo', 'Jawa Timur', 'Kabupaten Bondowoso', 'Tapen', '68283', '082302336336', '082302336336', 'farahfarah0397@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Farah_Saufika,_S.Kep.,_Ns._18_20231120151406.pdf', 'Transkip_Farah_Saufika,_S.Kep.,_Ns._18_20231120151406.pdf', '', 'Pembayaran_Farah-Saufika,-S.Kep.,-Ns._18_20231120151406.jpeg', 'Foto_Farah-Saufika,-S.Kep.,-Ns._18_20231120151406.jpeg', 'KTP_Farah-Saufika,-S.Kep.,-Ns._18_20231120151406.jpeg', 'Formulir_Farah-Saufika,-S.Kep.,-Ns._18_20231120151406.docx', '2023-11-20', '15:14:06'),
(118, 18, 'Ricky Fakhrazi', 'Samarinda', '1986-09-02', 'Jl. Timbul IV G No.13-14 Rt.10 Rw.6', 'DKI Jakarta', 'Jakarta Selatan', 'Jagakarsa', '12630', '081294039811', '081294039811', 'rickyfakhrazi@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Ricky_Fakhrazi_18_20231128102805.pdf', 'Transkip_Ricky_Fakhrazi_18_20231128102805.pdf', '', 'Pembayaran_Ricky-Fakhrazi_18_20231128102805.jpeg', 'Foto_Ricky-Fakhrazi_18_20231128102805.jpg', 'KTP_Ricky-Fakhrazi_18_20231128102805.jpg', 'Formulir_Ricky-Fakhrazi_18_20231128102805.docx', '2023-11-28', '10:28:05'),
(119, 18, 'Ridwan syaidi', 'Jakarta', '1982-03-17', 'Griya Cinere 1, Jalan Rajawali Blok D5 No. 6 Kelurahan Limo', 'Jawa Barag', 'Depok', 'Limo', '16515', '085814422366', '085814422366', 'syaidi.ridwan@gmail.com', 'Magister Akutansi', 'Auditing', 'Ijazah_Ridwan_syaidi_18_20231217102902.pdf', 'Transkip_Ridwan_syaidi_18_20231217102902.pdf', '', 'Pembayaran_Ridwan-syaidi_18_20231217102902.jpg', 'Foto_Ridwan-syaidi_18_20231217102902.jpg', 'KTP_Ridwan-syaidi_18_20231217102902.jpg', 'Formulir_Ridwan-syaidi_18_20231217102902.docx', '2023-12-17', '10:29:02'),
(120, 18, 'BAMBANG SAPUTRO,ST', 'Medan', '1982-04-13', 'Jl.Batutulis Gang Amil No.22', 'Jawa Barat', 'Kota Bogor', 'Bogor Selatan - Kota', '16133', '085778217642', '085778217642', 'bambang.saputro1304@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_BAMBANG_SAPUTRO,ST_18_20231221144721.pdf', 'Transkip_BAMBANG_SAPUTRO,ST_18_20231221144721.pdf', '', 'Pembayaran_BAMBANG-SAPUTRO,ST_18_20231221144721.jpg', 'Foto_BAMBANG-SAPUTRO,ST_18_20231221144721.jpg', 'KTP_BAMBANG-SAPUTRO,ST_18_20231221144721.jpg', 'Formulir_BAMBANG-SAPUTRO,ST_18_20231221144721.docx', '2023-12-21', '14:47:21'),
(121, 18, 'Devid Elshadai Lumintang', 'kawangkoan', '1997-10-04', 'Jaga XI, Kema Satu', 'Sulawesi Utara', 'Kabupaten Minahasa Utara', 'Kema', '95379', '081253423896', '081253423896', 'Devid.Lumintang@gmail.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_Devid_Elshadai_Lumintang_18_20240110121033.pdf', 'Transkip_Devid_Elshadai_Lumintang_18_20240110121033.pdf', '', 'Pembayaran_Devid-Elshadai-Lumintang_18_20240110121033.jpg', 'Foto_Devid-Elshadai-Lumintang_18_20240110121033.jpg', 'KTP_Devid-Elshadai-Lumintang_18_20240110121033.jpg', 'Formulir_Devid-Elshadai-Lumintang_18_20240110121033.docx', '2024-01-10', '12:10:33'),
(122, 18, 'ARPIANTO NGION SAMPE', 'SENTANI', '1994-09-20', 'JL. KASIOLA PERUMAHAN AQWA 3 NO.C18', 'Papua Barat', 'Kota sorong', 'Sorong Timur', '98415', '085274147575', '081344541926', 'arpin.sampe20@gmail.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_ARPIANTO_NGION_SAMPE_18_20240115184019.pdf', 'Transkip_ARPIANTO_NGION_SAMPE_18_20240115184019.pdf', '', 'Pembayaran_ARPIANTO-NGION-SAMPE_18_20240115184019.jpg', 'Foto_ARPIANTO-NGION-SAMPE_18_20240115184019.jpg', 'KTP_ARPIANTO-NGION-SAMPE_18_20240115184019.jpg', 'Formulir_ARPIANTO-NGION-SAMPE_18_20240115184019.docx', '2024-01-15', '18:40:19'),
(123, 18, 'Amandus Herikus Wanto Galus', 'Lawi', '1989-10-26', 'Jl. Sudirman, RT.030/RW.010, Kel. Pau, Ruteng , Manggarai', 'Nusa Tenggara Timur', 'Kabupaten Manggarai', 'Langke Rembong', '86513', '085239491709', '085239491709', 'anetagalus191017@gmail.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_Amandus_Herikus_Wanto_Galus_18_20240118075821.pdf', 'Transkip_Amandus_Herikus_Wanto_Galus_18_20240118075821.pdf', '', 'Pembayaran_Amandus-Herikus-Wanto-Galus_18_20240118075821.jpeg', 'Foto_Amandus-Herikus-Wanto-Galus_18_20240118075821.jpg', 'KTP_Amandus-Herikus-Wanto-Galus_18_20240118075821.jpg', 'Formulir_Amandus-Herikus-Wanto-Galus_18_20240118075821.docx', '2024-01-18', '07:58:21');
INSERT INTO `pendaftar` (`id_pendaftar`, `id_gelombang`, `nama`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `provinsi`, `kota`, `kecamatan`, `pos`, `telepon`, `whatsapp`, `email`, `jurusan`, `konsentrasi`, `file_ijazah`, `file_transkip`, `file_toefl`, `file_pembayaran`, `file_foto`, `file_ktp`, `file_formulir`, `tanggal_input`, `time`) VALUES
(124, 18, 'Alauddin', 'Parado', '1992-09-30', 'Desa Parado  Rato Dusun Salama', 'Nusa Tenggara Barat', 'Kabupaten Bima', 'Parado', '84172', '082311120578', '082311120578', 'ama.lintar@gamil.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_Alauddin_18_20240120112854.pdf', 'Transkip_Alauddin_18_20240120112854.pdf', '', 'Pembayaran_Alauddin_18_20240120112854.jpeg', 'Foto_Alauddin_18_20240120112854.jpg', 'KTP_Alauddin_18_20240120112854.jpg', 'Formulir_Alauddin_18_20240120112854.docx', '2024-01-20', '11:28:54'),
(125, 18, 'ALFIN ARIANSYAH', 'SEKAYU', '1990-08-15', 'JL.THAMRIN V NO 37 RT 003/002 KEL KETAPANG', 'Banten', 'Kota Tangerang', 'Cipondoh', '15122', '082183561960', '082183561960', 'alfinariansyah90@gmaul.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_ALFIN_ARIANSYAH_18_20240120162529.pdf', 'Transkip_ALFIN_ARIANSYAH_18_20240120162529.pdf', '', 'Pembayaran_ALFIN-ARIANSYAH_18_20240120162529.jpeg', 'Foto_ALFIN-ARIANSYAH_18_20240120162529.jpg', 'KTP_ALFIN-ARIANSYAH_18_20240120162529.jpg', 'Formulir_ALFIN-ARIANSYAH_18_20240120162529.docx', '2024-01-20', '16:25:29'),
(126, 18, 'asih', 'la', '1988-10-20', 'gunung malintang lama, rt 05/rw 06 desa hative kecil', 'Maluku', 'ambon', 'Sirimau', '97128', '082397028788', '082397028788', 'asih.romayanti@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_asih_18_20240125101212.pdf', 'Transkip_asih_18_20240125101212.pdf', '', 'Pembayaran_asih_18_20240125101212.jpeg', 'Foto_asih_18_20240125101212.jpeg', 'KTP_asih_18_20240125101212.jpeg', 'Formulir_asih_18_20240125101212.docx', '2024-01-25', '10:12:12'),
(127, 18, 'R.AJENG APRIDA PUTRI KUMALA AYU', 'TANJUNG KARANG', '1997-04-24', 'JL HI PANGERAN SUHAIMI BANDAR LAMPUNG', 'Lampung', 'Kota Bandar Lampung', 'SUKARAME', '35131', '082183799494', '082183799494', 'kmlayupratama@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_R.AJENG_APRIDA_PUTRI_KUMALA_AYU_18_20240127143239.pdf', 'Transkip_R.AJENG_APRIDA_PUTRI_KUMALA_AYU_18_20240127143239.pdf', '', 'Pembayaran_R.AJENG-APRIDA-PUTRI-KUMALA-AYU_18_20240127143239.jpeg', 'Foto_R.AJENG-APRIDA-PUTRI-KUMALA-AYU_18_20240127143239.jpg', 'KTP_R.AJENG-APRIDA-PUTRI-KUMALA-AYU_18_20240127143239.jpeg', 'Formulir_R.AJENG-APRIDA-PUTRI-KUMALA-AYU_18_20240127143239.docx', '2024-01-27', '14:32:39'),
(128, 18, 'Caesaria Sinta Zuya', 'Kotabumi', '1999-01-15', 'Jl. Pramuka Perumahan Bukit Alam Permai  1 Blok E20', 'Lampung', 'Kota Bandar Lampung', 'Rajabasa', '35152', '081367657675', '081367657675', 'zuyacaesaria@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Caesaria_Sinta_Zuya_18_20240127145055.pdf', 'Transkip_Caesaria_Sinta_Zuya_18_20240127145055.pdf', '', 'Pembayaran_Caesaria-Sinta-Zuya_18_20240127145055.JPG', 'Foto_Caesaria-Sinta-Zuya_18_20240127145055.JPG', 'KTP_Caesaria-Sinta-Zuya_18_20240127145055.jpeg', 'Formulir_Caesaria-Sinta-Zuya_18_20240127145055.docx', '2024-01-27', '14:50:55'),
(129, 18, 'DITA RAHMA SUMARNA', 'PONTIANAK', '1998-06-11', 'JL. MAWAR NO.99', 'Kalimantan Barat', 'Kota Singkawang', 'Singkawang Tengah', '79116', '085349686697', '085349686697', 'ditarahmasumarna@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_DITA_RAHMA_SUMARNA_18_20240127145507.pdf', 'Transkip_DITA_RAHMA_SUMARNA_18_20240127145507.pdf', '', 'Pembayaran_DITA-RAHMA-SUMARNA_18_20240127145507.jpeg', 'Foto_DITA-RAHMA-SUMARNA_18_20240127145507.jpeg', 'KTP_DITA-RAHMA-SUMARNA_18_20240127145507.jpeg', 'Formulir_DITA-RAHMA-SUMARNA_18_20240127145507.docx', '2024-01-27', '14:55:07'),
(130, 18, 'Ashilah Mumtaz Hakim', 'Bandar Lampung', '1998-11-05', 'Jl. Sisingamangaraja GG.Nuri No.445 RT/RW 0122', 'Lampung', 'Kota Bandar Lampung', 'Tanjung Karang Barat', '35151', '082160111998', '082160111998', 'ashilahculla@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Ashilah_Mumtaz_Hakim_18_20240129120158.pdf', 'Transkip_Ashilah_Mumtaz_Hakim_18_20240129120158.pdf', '', 'Pembayaran_Ashilah-Mumtaz-Hakim_18_20240129120158.jpeg', 'Foto_Ashilah-Mumtaz-Hakim_18_20240129120158.jpg', 'KTP_Ashilah-Mumtaz-Hakim_18_20240129120158.jpg', 'Formulir_Ashilah-Mumtaz-Hakim_18_20240129120158.docx', '2024-01-29', '12:01:58'),
(131, 18, 'Edgar Irvin Raranta', 'Manado', '1989-11-22', 'Jl. Manguni 8, Lingkungan 1', 'Sulawesi Utara', 'Kota Manado', 'Paal Dua', '95128', '081340484422', '081340484422', 'edgarirvinraranta@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Edgar_Irvin_Raranta_18_20240130123657.pdf', 'Transkip_Edgar_Irvin_Raranta_18_20240130123657.pdf', '', 'Pembayaran_Edgar-Irvin-Raranta_18_20240130123657.jpeg', 'Foto_Edgar-Irvin-Raranta_18_20240130123657.jpg', 'KTP_Edgar-Irvin-Raranta_18_20240130123657.jpg', 'Formulir_Edgar-Irvin-Raranta_18_20240130123657.docx', '2024-01-30', '12:36:57'),
(132, 18, 'NAsoka Ramli', 'Demak', '1976-06-30', 'Jl. Goalpara KM 0,5', 'Jawa Barat', 'Kota Sukabumi', 'Sukaraja', '43192', '081563176205', '081563176205', 'nasoka18@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_NAsoka_Ramli_18_20240205115424.pdf', 'Transkip_NAsoka_Ramli_18_20240205115424.pdf', '', 'Pembayaran_NAsoka-Ramli_18_20240205115424.jpg', 'Foto_NAsoka-Ramli_18_20240205115424.jpeg', 'KTP_NAsoka-Ramli_18_20240205115424.jpeg', 'Formulir_NAsoka-Ramli_18_20240205115424.docx', '2024-02-05', '11:54:24'),
(133, 18, 'SAIDA RANI', 'BAGAN BESAR', '1997-02-08', 'JL. PERUMNAS BAGAN BESAR KOTA DUMAI RIAU', 'Riau', 'Kota Dumai', 'BUKIT KAPUR', '28882', '082170013877', '082170013877', 'saidarani425@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_SAIDA_RANI_18_20240208180145.pdf', 'Transkip_SAIDA_RANI_18_20240208180145.pdf', '', 'Pembayaran_SAIDA-RANI_18_20240208180145.jpeg', 'Foto_SAIDA-RANI_18_20240208180145.jpeg', 'KTP_SAIDA-RANI_18_20240208180145.jpeg', 'Formulir_SAIDA-RANI_18_20240208180145.docx', '2024-02-08', '18:01:45'),
(134, 18, 'RINI AFYAT', 'AMBON', '1992-03-01', 'JL. BATU MERAH PUNCAK RT 002/RW 006', 'Maluku', 'Kota Ambon', 'Sirimau', '97128', '082210475706', '082210475706', 'nhyabasy@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_RINI_AFYAT_18_20240210193132.pdf', 'Transkip_RINI_AFYAT_18_20240210193132.pdf', '', 'Pembayaran_RINI-AFYAT_18_20240210193132.jpg', 'Foto_RINI-AFYAT_18_20240210193132.jpg', 'KTP_RINI-AFYAT_18_20240210193132.jpg', 'Formulir_RINI-AFYAT_18_20240210193132.docx', '2024-02-10', '19:31:32'),
(135, 18, 'I Gede Eka Handrean', 'Jakarta', '1988-11-23', 'Jln. Anyelir Gg. Rama 3A No.9 Br/Link. Pekandelan Kesiman', 'Bali', 'denpasar', 'Denpasar Timur', '80237', '+6282131884346', '+6282131884346', 'eka.handrean@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_I_Gede_Eka_Handrean_18_20240212214639.pdf', 'Transkip_I_Gede_Eka_Handrean_18_20240212214639.pdf', '', 'Pembayaran_I-Gede-Eka-Handrean_18_20240212214639.jpg', 'Foto_I-Gede-Eka-Handrean_18_20240212214639.jpg', 'KTP_I-Gede-Eka-Handrean_18_20240212214639.jpg', 'Formulir_I-Gede-Eka-Handrean_18_20240212214639.docx', '2024-02-12', '21:46:39'),
(136, 18, 'YULI ANGGRAINI', 'LAMONGAN', '1984-09-26', 'Jl. Raya Pasar Ikan No.22, Kel. Tumenggungan', 'Jawa Timur', 'Kabupaten Lamongan', 'Lamongan', '62214', '082245119333', '082245119333', 'y148ly@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_YULI_ANGGRAINI_18_20240221204005.pdf', 'Transkip_YULI_ANGGRAINI_18_20240221204005.pdf', '', 'Pembayaran_YULI-ANGGRAINI_18_20240221204005.jpg', 'Foto_YULI-ANGGRAINI_18_20240221204005.jpg', 'KTP_YULI-ANGGRAINI_18_20240221204005.jpg', 'Formulir_YULI-ANGGRAINI_18_20240221204005.docx', '2024-02-21', '20:40:05'),
(137, 18, 'WELLA FITRIA HARERA', 'PADANG GANTING', '1994-03-25', 'PERUMAHAN TAMAN SARI BLOK A NO 69', 'Kepulauan Riau', 'Kota Batam', 'Sekupang', '29426', '082283018090', '082283018090', 'wellayondra@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_WELLA_FITRIA_HARERA_18_20240320121803.pdf', 'Transkip_WELLA_FITRIA_HARERA_18_20240320121803.pdf', '', 'Pembayaran_WELLA-FITRIA-HARERA_18_20240320121803.jpeg', 'Foto_WELLA-FITRIA-HARERA_18_20240320121803.jpg', 'KTP_WELLA-FITRIA-HARERA_18_20240320121803.jpeg', 'Formulir_WELLA-FITRIA-HARERA_18_20240320121803.docx', '2024-03-20', '12:18:03'),
(138, 19, 'Conny Selvana Muskitta', 'Ambon', '1979-07-02', 'Jl. Ahmad Yani', 'Maluku', 'Kota Ambon', 'Sirimau', '97127', '081316003177', '081316003177', 'conny_selvana@yahoo.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Conny_Selvana_Muskitta_19_20240508070129.pdf', 'Transkip_Conny_Selvana_Muskitta_19_20240508070129.pdf', '', 'Pembayaran_Conny-Selvana-Muskitta_19_20240508070129.jpeg', 'Foto_Conny-Selvana-Muskitta_19_20240508070129.jpeg', 'KTP_Conny-Selvana-Muskitta_19_20240508070129.jpeg', 'Formulir_Conny-Selvana-Muskitta_19_20240508070129.docx', '2024-05-08', '07:01:29'),
(139, 19, 'MEGA WIRA SUSWANTI', 'BOGOR', '1988-09-08', 'JL KANTIL II BLOK H-3 NO 02 RT 09 RW 06 KELURAHAN BENCONGAN INDAH', 'Banten', 'Kabupaten Tangerang', 'Kelapa Dua', '15836', '081381828889', '081381828889', 'drmegawiras@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_MEGA_WIRA_SUSWANTI_19_20240613095819.pdf', 'Transkip_MEGA_WIRA_SUSWANTI_19_20240613095819.pdf', '', 'Pembayaran_MEGA-WIRA-SUSWANTI_19_20240613095819.jpeg', 'Foto_MEGA-WIRA-SUSWANTI_19_20240613095819.jpeg', 'KTP_MEGA-WIRA-SUSWANTI_19_20240613095819.jpeg', 'Formulir_MEGA-WIRA-SUSWANTI_19_20240613095819.docx', '2024-06-13', '09:58:19'),
(140, 19, 'Egi Hermawan', 'Bandung', '1991-03-12', 'Jalan Babakan Ciparay gg Ibu Arsih No. 32 RT 02 RW 02\r\nbabakan Ciparay', 'Jawa Barat', 'Kota Bandung', 'Babakan Ciparay', '40221', '082115217775', '082115217775', 'egihermawan10@gmail.com', 'Magister Teknik Sipil', 'Manajemen', 'Ijazah_Egi_Hermawan_19_20240621142756.pdf', 'Transkip_Egi_Hermawan_19_20240621142756.pdf', '', 'Pembayaran_Egi-Hermawan_19_20240621142756.jpg', 'Foto_Egi-Hermawan_19_20240621142756.jpg', 'KTP_Egi-Hermawan_19_20240621142756.jpg', 'Formulir_Egi-Hermawan_19_20240621142756.docx', '2024-06-21', '14:27:56'),
(141, 19, 'Endang Sumarni', 'Koto Beringin', '1980-02-27', 'Jl. M. H. Thamrin Lingkungan Pemancar TVRI Rawang, Kecamatan Hamparan Rawang, Kota Sungai Penuh, Provinsi Jambi 37152', 'Jambi', 'Kota Sungai Penuh', 'Hamparan Rawang', '37151', '085366279437', '085366279437', 'endangsumarni713@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Endang_Sumarni_19_20240621195256.pdf', 'Transkip_Endang_Sumarni_19_20240621195256.pdf', '', 'Pembayaran_Endang-Sumarni_19_20240621195256.jpeg', 'Foto_Endang-Sumarni_19_20240621195256.jpeg', 'KTP_Endang-Sumarni_19_20240621195256.jpg', 'Formulir_Endang-Sumarni_19_20240621195256.docx', '2024-06-21', '19:52:56'),
(142, 19, 'dr. VICTORINA TABITHA LARWUY', 'TITAWAAI (AMBON)', '1976-08-31', 'Jl. SULTAN HASANUDDIN TANTUI - AMBON', 'Maluku', 'Kota Ambon', 'Sirimau', '97128', '082211750855', '082211750855', 'viltalarwuy30@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_dr._VICTORINA_TABITHA_LARWUY_19_20240630131251.pdf', 'Transkip_dr._VICTORINA_TABITHA_LARWUY_19_20240630131251.pdf', '', 'Pembayaran_dr.-VICTORINA-TABITHA-LARWUY_19_20240630131251.jpg', 'Foto_dr.-VICTORINA-TABITHA-LARWUY_19_20240630131251.jpeg', 'KTP_dr.-VICTORINA-TABITHA-LARWUY_19_20240630131251.jpg', 'Formulir_dr.-VICTORINA-TABITHA-LARWUY_19_20240630131251.docx', '2024-06-30', '13:12:51'),
(143, 19, 'Sigit KrenFino W.S', 'Bangko', '1999-02-10', 'Rumah Bidan Mimi depan lapangan Bola kaki Limbur tembesi, Rt/Rw 006/000, kec. Bathin VIII, Kab. Saroangun, Jambi', 'Jambi', 'Kabupaten Sarolangun', 'Bathin VIII (Batin VIII)', '37480', '082175772414', '082175772414', 'sigitkrenfino1999@gmail.com', 'Magister Manajemen', 'Manajemen', 'Ijazah_Sigit_KrenFino_W.S_19_20240702191828.pdf', 'Transkip_Sigit_KrenFino_W.S_19_20240702191828.pdf', '', 'Pembayaran_Sigit-KrenFino-W.S_19_20240702191828.jpeg', 'Foto_Sigit-KrenFino-W.S_19_20240702191828.jpg', 'KTP_Sigit-KrenFino-W.S_19_20240702191828.jpeg', 'Formulir_Sigit-KrenFino-W.S_19_20240702191828.docx', '2024-07-02', '19:18:28');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `nama_bank` varchar(100) NOT NULL,
  `nama_rekening` varchar(100) NOT NULL,
  `nomor_rekening` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `setting`
--

INSERT INTO `setting` (`id_setting`, `theme`, `facebook_pixel`, `biaya`, `nama_bank`, `nama_rekening`, `nomor_rekening`) VALUES
(1, 'dark-theme', '<!-- Meta Pixel Code -->\r\n<script>\r\n  !function(f,b,e,v,n,t,s)\r\n  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?\r\n  n.callMethod.apply(n,arguments):n.queue.push(arguments)};\r\n  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version=\'2.0\';\r\n  n.queue=[];t=b.createElement(e);t.async=!0;\r\n  t.src=v;s=b.getElementsByTagName(e)[0];\r\n  s.parentNode.insertBefore(t,s)}(window, document,\'script\',\r\n  \'https://connect.facebook.net/en_US/fbevents.js\');\r\n  fbq(\'init\', \'410223764306532\');\r\n  fbq(\'track\', \'PageView\');\r\nfbq(\'track\', \'ViewContent\');\r\n</script>\r\n<noscript><img height=\"1\" width=\"1\" style=\"display:none\"\r\n  src=\"https://www.facebook.com/tr?id=410223764306532&ev=PageView&noscript=1\"\r\n/></noscript>\r\n<!-- End Meta Pixel Code -->', '36000000', 'BJB', 'Universitas Sangga Buana YPKP', '0243-2000-32125');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `email`, `username`, `password`, `level`) VALUES
(4, 'Dudi', 'dudi@doang.com', 'dudi', '$2y$10$Zk6H8AJvg8gDoGOhHDLjM./6oOj6BGUpjlXvUNhAlaNS2G8Q3b9Sm', 'cs'),
(5, 'Irene Indah', 'mymoonlore@gmail.com', 'ireneindah', '$2y$10$n/.sCGhjxjVBUBs9j84yIuH/Q1KFr37rONbb4gyMdznre3ReO0yBe', 'cs'),
(6, 'juy', 'juy@juy.com', 'juy', '$2y$10$SAh1WXz97n2y7yavmKlzIeq79g4/7y7BV1ZDsYn64kdlJzc8BWgWm', 'cs');

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
  MODIFY `id_galeri` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT untuk tabel `gelombang`
--
ALTER TABLE `gelombang`
  MODIFY `id_gelombang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `konsentrasi`
--
ALTER TABLE `konsentrasi`
  MODIFY `id_konsentrasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT untuk tabel `link`
--
ALTER TABLE `link`
  MODIFY `id_link` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `pendaftar`
--
ALTER TABLE `pendaftar`
  MODIFY `id_pendaftar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT untuk tabel `rekening`
--
ALTER TABLE `rekening`
  MODIFY `id_rekening` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
