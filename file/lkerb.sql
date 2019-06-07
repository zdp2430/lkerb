-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2019 at 10:45 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lkerb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bab`
--

CREATE TABLE `bab` (
  `id_bab` int(5) NOT NULL,
  `nama_bab` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bab`
--

INSERT INTO `bab` (`id_bab`, `nama_bab`) VALUES
(1, 'Proses'),
(2, 'Hasil');

-- --------------------------------------------------------

--
-- Table structure for table `bobot`
--

CREATE TABLE `bobot` (
  `id_bobot` int(5) NOT NULL,
  `nama_bobot` varchar(255) NOT NULL,
  `nilai_bobot` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bobot`
--

INSERT INTO `bobot` (`id_bobot`, `nama_bobot`, `nilai_bobot`) VALUES
(1, 'A/B/C', '1/0.5/0'),
(2, 'A/B/C/D', '1/0.67/0.33/0'),
(3, 'Y/T', '1/0'),
(4, '0-100', '0-100'),
(5, '0-5', '0-5'),
(6, '0-4', '0-4'),
(7, 'WTP/WTP dengan paragraph penjelas/WDP/TMP/TW/Tidak menyusun Laporan Keuangan', 'Wajar Tanpa Pengecualian');

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE `forum` (
  `id_forum` int(5) NOT NULL,
  `judul_forum` varchar(255) NOT NULL,
  `isi_forum` text NOT NULL,
  `jumlah_post` int(5) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_pembuat` int(5) NOT NULL,
  `jumlah_dilliat` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forum_post`
--

CREATE TABLE `forum_post` (
  `id_forum_post` int(5) NOT NULL,
  `id_forum_FK` int(5) NOT NULL,
  `balasan` text NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_pembalas` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id_item` int(5) NOT NULL,
  `penilaian` varchar(255) NOT NULL,
  `penjelasan` text NOT NULL,
  `id_subkriteria_FK` int(5) NOT NULL,
  `id_kriteria_FK` int(5) NOT NULL,
  `id_bobot_FK` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id_item`, `penilaian`, `penjelasan`, `id_subkriteria_FK`, `id_kriteria_FK`, `id_bobot_FK`) VALUES
(1, 'A. Tim Reformasi Birokrasi telah dibentuk', 'A. Telah membentuk Tim Reformasi Birokrasi sesuai kebutuhan organisasi\r\nB. Telah membentuk Tim Reformasi Birokrasi namun belum sesuai kebutuhan organisasi\r\nC. Belum membentuk Tim Reformasi Birokrasi', 1, 1, 1),
(2, 'B.Tim Reformasi Birokrasi telah melaksanakan tugas sesuai rencana kerja Tim Reformasi Birokrasi ', 'a. Seluruh tugas telah dilaksanakan oleh Tim Reformasi Birokrasi sesuai dengan rencana kerja\r\nb. Sebagian besar tugas telah dilaksanakan oleh Tim Reformasi Birokrasi sesuai dengan rencana kerja\r\nc. Sebagian kecil tugas telah dilaksanakan oleh Tim Reformasi Birokrasi sesuai dengan rencana kerja\r\nd. Seluruh tugas belum dilaksanakan oleh Tim Reformasi Birokrasi sesuai dengan rencana kerja', 1, 1, 1),
(3, 'C. Tim Reformasi Birokrasi telah melakukan monitoring dan evaluasi rencana kerja, dan hasil evaluasi telah ditindaklanjuti', 'a. Seluruh rencana kerja telah dimonitoring dan di evaluasi, dan hasil evaluasi telah ditindaklanjuti\r\nb. Sebagian besar rencana kerja telah dimonitoring dan di evaluasi, dan hasil evaluasi telah ditindaklanjuti\r\nc. Sebagian kecil rencana kerja telah dimonitoring dan di evaluasi, dan hasil evaluasi telah ditindaklanjuti\r\nd. Seluruh rencana kerja belum dimonitoring dan di evaluasi', 1, 1, 1),
(7, 'A.Road Map telah disusun dan diformalkan', 'Road Map telah disusun dan ditetapkan sebagai dokumen formal', 2, 1, 1),
(8, 'B. Road Map telah mencakup 8 area perubahan', 'a. 4 area atau lebih \r\nb. 1-3 area\r\nc.  tidak ada', 2, 1, 1),
(9, 'C. Road Map telah mencakup \"quick win\"', 'a. Quick win ada sesuai dengan ekspektasi dan dapat diselesaikan dalam waktu cepat  \r\nb. Quick win ada tapi tidak sesuai dengan ekspektasi atau tidak dapat diselesaikan dalam waktu cepat\r\nc. Belum ada quick win      ', 2, 1, 1),
(10, 'D. Penyusunan Road Map telah melibatkan seluruh unit organisasi', 'a. Seluruh unit organisasi telah dilibatkan dalam penyusunan Road Map \r\nb. Sebagian besar unit organisasi telah dilibatkan dalam penyusunan Road Map \r\nc. Sebagian kecil unit organisasi telah dilibatkan dalam penyusunan Road Map \r\nd. Belum ada organisasi yang  dilibatkan dalam penyusunan Road Map ', 2, 1, 1),
(11, 'E. Telah terdapat sosialisasi/internalisasi Road Map kepada anggota organisasi', 'a. Seluruh anggota organisasi telah mendapatkan sosialisasi dan internalisasi Road Map\r\nb. Sebagian besar anggota organisasi telah mendapatkan sosialisasi dan internalisasi Road Map\r\nc. Sebagian kecil anggota organisasi telah mendapatkan sosialisasi dan internalisasi Road Map\r\nd. Seluruh anggota organisasi belum mendapatkan sosialisasi dan internalisasi Road Map\r\n\r\n', 2, 1, 1),
(12, 'A. PMPRB telah direncanakan dan diorganisasikan dengan baik', 'a. Seluruh PMPRB telah direncanakan dan diorganisasikan dengan baik\r\nb. Sebagian besar PMPRB telah direncanakan dan diorganisasikan dengan baik\r\nc. Sebagian kecil PMPRB telah direncanakan dan diorganisasikan dengan baik\r\nd. Seluruh PMPRB belum direncanakan dan diorganisasikan dengan baik\r\n', 3, 1, 1),
(13, 'B. Aktivitas PMPRB telah dikomunikasikan pada masing-masing unit kerja', 'a. Seluruh aktivitas PMPRB telah dikomunikasikan pada masing-masing unit organisasi\r\nb. Sebagian besar aktivitas PMPRB telah dikomunikasikan pada masing-masing unit organisasi\r\nc. Sebagian kecil aktivitas PMPRB telah dikomunikasikan pada masing-masing unit organisasi\r\nd. Seluruh akktivitas PMPRB belum dikomunikasikan pada masing-masing unit organisasi\r\n', 3, 1, 1),
(14, 'C. Telah dilakukan pelatihan yang cukup bagi Tim Asessor PMPRB', 'a. Seluruh Tim Asessor PMPRB telah mendapatkan pelatihan\r\nb. Sebagian besar Tim Asessor PMPRB telah mendapatkan pelatihan\r\nc. Sebagian kecil Tim Asessor PMPRB telah mendapatkan pelatihan\r\nd. Seluruh Tim Asessor PMPRB  belum mendapatkan pelatihan\r\n', 3, 1, 1),
(15, 'D. Pelaksanaan PMPRB dilakukan oleh Asesor sesuai dengan ketentuan yang berlaku', 'a. Terdapat penunjukan keikutsertaan pejabat struktural lapis kedua sebagai asesor PMPRB dan yang bersangkutan terlibat sepenuhnya sejak tahap awal hingga akhir proses PMPRB.\r\nb. Terdapat penunjukan keikutsertaan pejabat struktural lapis kedua sebagai asesor PMPRB, tetapi partisipasinya tidak meliputi seluruh proses PMPRB.\r\nc. Terdapat penetapan pejabat struktural lapis kedua sebagai asesor PMPRB, tetapi fungsi asesor dari unit tersebut dilakukan oleh pegawai lain \r\nd. Partisipasi pejabat struktural lapis kedua sebagai asesor PMPRB belum ada.\r\n', 3, 1, 1),
(16, 'E. Apakah koordinator asesor PMPRB melakukan reviu terhadap kertas kerja asesor sebelum menyusun kertas kerja instansi?', 'a. Koordinator assessor telah melakukan reviu terhadap seluruh kertas kerja sebelum menyusun kertas kerja instansi\r\nb. Koordinator assessor telah melakukan reviu terhadap sebagian kertas kerja sebelum menyusun kertas kerja instansi\r\nc. Koordinator assessor belum melakukan reviu kertas kerja sebelum menyusun kertas kerja instansi \r\n', 3, 1, 1),
(17, 'F. Apakah para asesor mencapai konsensus atas pengisian kertas kerja sebelum menetapkan nilai PMPRB instansi?', 'a. Mayoritas koordinator assessor mencapai konsensus dan seluruh kriteria dibahas \r\nb. Tidak seluruh koordinator  assessor mencapai konsensus dan/atau tidak seluruh kriteria dibahas; \r\nc. Belum ada konsensus yang dicapai oleh para koordinator assessor\r\n', 3, 1, 1),
(18, 'G. Rencana aksi tindak lanjut (RATL) telah dikomunikasikan dan dilaksanakan', 'a. Terdapat Rencana Aksi dan Tindak Lanjut (RATL) yang telah dikomunikasikan dan dilaksanakan\r\nb. Terdapat Rencana Aksi dan Tindak Lanjut (RATL) namun belum dikomunikasikan dan dilaksanakan\r\nc. Belum terdapat Rencana Aksi Tindak Lanjut (RATL)', 3, 1, 1),
(19, 'A. Terdapat keterlibatan pimpinan tertinggi secara aktif dan berkelanjutan dalam pelaksanaan reformasi birokrasi', 'a. seluruh jajaran pimpinan tertinggi terlibat secara aktif dan berkelanjutan dalam pelaksanaan Reformasi Birokrasi\r\nb. sebagian besar pimpinan tertinggi terlibat secara aktif dan berkelanjutan dalam pelaksanaan Reformasi Birokrasi\r\nc. sebagian kecil pimpinan tertinggi terlibat secara aktif dan berkelanjutan dalam pelaksanaan Reformasi Birokrasi\r\nd. Seluruh jajaran pimpinan tertinggi belum terlibat secara aktif dan berkelanjutan dalam pelaksanaan Reformasi Birokrasi', 4, 1, 1),
(20, 'B. Terdapat media komunikasi secara reguler untuk menyosialisasikan tentang reformasi birokrasi yang sedang dan akan dilakukan', 'a. Ada media komunikasi yang cakupannya menjangkau seluruh pegawai dan pemangku kepentingan terkait serta dilaksanakan secara berkala\r\nb. Ada media komunikasi yang cakupannya menjangkau seluruh pegawai dan pemangku kepentingan terkait\r\nc. Ada media komunikasi yang cakupannya menjangkau seluruh pegawai\r\nd. Ada media komunikasi namun cakupannya terbatas pada pegawai tingkatan tertentu\r\ne. Belum ada media komunikasi untuk mensosialisasikan pelaksanaan reformasi birokrasi', 4, 1, 1),
(21, 'C. Terdapat upaya untuk menggerakkan organisasi dalam melakukan perubahan melalui pembentukan agent of change ataupun role model', 'a. Sudah terdapat upaya pembentukan Agent of Change secara formal dan sesuai ukuran organisasi, dan sudah mengikuti pelatihan sebagai role model dalam perubahan\r\nb. Sudah terdapat upaya pembentukan Agent of Change secara formal dan sesuai ukuran organisasi\r\nc. Sudah terdapat upaya pembentukan Agent of Change namun secara formal belum dilakukan\r\nd. Belum ada upaya untuk membentuk Agent of Change', 4, 1, 1),
(22, 'A. Telah dilakukan identifikasi, analisis, dan pemetaan terhadap peraturan perundang-undangan yang tidak harmonis/sinkron', 'a. Telah dilakukan identifikasi, analisis, dan pemetaan terhadap seluruh peraturan perundang-undangan yang tidak harmonis/sinkron \r\nb. Telah dilakukan identifikasi, analisis, dan pemetaan terhadap sebagian peraturan perundang-undangan yang tidak harmonis/sinkron\r\nc. Belum dilakukan identifikasi, analisis, dan pemetaan terhadap peraturan perundang-undangan yang tidak harmonis/sinkron', 5, 2, 1),
(23, 'B. Telah dilakukan revisi peraturan perundang-undangan yang tidak harmonis / tidak sinkron', 'a. Revisi atas peraturan perundang-undangan yang tidak harmonis / tidak sinkron telah selesai dilakukan, atau tidak ditemukan adanya peraturan perundangan-undangan yang tidak harmonis\r\nb. Upaya revisi atas peraturan perundang-undangan yang tidak harmonis / tidak sinkron telah dilakukan, namun belum selesai\r\nc. Belum dilakukan upaya revisi atas peraturan perundang-undangan yang tidak harmonis / tidak sinkron', 5, 2, 1),
(24, 'A. Adanya Sistem pengendalian penyusunan peraturan perundangan yang mensyaratkan adanya Rapat Koordinasi, Naskah Akademis/kajian/policy paper, dan Paraf Koordinasi', 'a. Seluruh persyaratan lengkap dan diimplementasikan\r\nb. Ada persyaratan tersebut namun baru sebagian diimplementasikan  \r\nc. Ada persyaratan tersebut namun belum diimplementasikan \r\nd. Belum ada persyaratan tersebut', 6, 2, 1),
(25, 'B. Telah dilakukan evaluasi atas pelaksanaan sistem pengendalian penyusunan peraturan perundang-undangan', 'a. Evaluasi atas pelaksanaan sistem pengendalian penyusunan peraturan perundang-undangan dilakukan secara berkala \r\nb. Evaluasi atas pelaksanaan sistem pengendalian penyusunan peraturan perundang-undangan dilakukan secara tidak berkala\r\nc. Belum pernah dilakukan evaluasi atas pelaksanaan sistem pengendalian penyusunan peraturan perundang-undangan', 6, 2, 1),
(26, 'A. Telah dilakukan evaluasi yang bertujuan untuk menilai ketepatan fungsi dan ketepatan ukuran organisasi', 'a. Telah dilakukan evaluasi untuk menilai ketepatan fungsi dan ketepatan ukuran organisasi kepada seluruh unit organisasi\r\nb. Telah dilakukan evaluasi untuk menilai ketepatan fungsi dan ketepatan ukuran organisasi kepada sebagian unit organisasi\r\nc. Belum dilakukan evaluasi untuk menilai ketepatan fungsi dan ketepatan ukuran organisasi kepada unit organsiasi', 7, 3, 1),
(27, 'B. Telah dilakukan evaluasi yang mengukur jenjang organisasi', 'a. Telah dilakukan evaluasi yang mengukur jenjang organisasi kepada seluruh unit organisasi\r\nb. Telah dilakukan evaluasi yang mengukur jenjang organisasi kepada sebagian unit organisasi\r\nc. Belum dilakukan evaluasi yang mengukur jenjang organisasi kepada unit organisasi', 7, 3, 1),
(28, 'C. Telah dilakukan evaluasi yang menganalisis kemungkinan duplikasi fungsi', 'a. Telah dilakukan evaluasi yang menganalisis kemungkinan duplikasi fungsi kepada seluruh unit kerja\r\nb. Telah dilakukan evaluasi yang menganalisis kemungkinan duplikasi fungsi kepada sebagian unit kerja\r\nc. Belum dilakukan evaluasi yang menganalisis kemungkinan duplikasi fungsi kepada unit kerja', 7, 3, 1),
(29, 'D. Telah dilakukan evaluasi yang menganalisis satuan organisasi yang berbeda tujuan namun ditempatkan dalam satu kelompok', 'a. Telah dilakukan evaluasi yang menganalisis satuan organisasi yang berbeda tujuan namun ditempatkan dalam satu kelompok kepada seluruh unit kerja\r\nb. Telah dilakukan evaluasi yang menganalisis satuan organisasi yang berbeda tujuan namun ditempatkan dalam satu kelompok kepada sebagian unit kerja\r\nc. Belum dilakukan evaluasi yang menganalisis satuan organisasi yang berbeda tujuan namun ditempatkan dalam satu kelompok kepada unit kerja', 7, 3, 1),
(30, 'E. Telah dilakukan evaluasi yang menganalisis kemungkinan adanya pejabat yang melapor kepada lebih dari seorang atasan', 'a. Telah dilakukan evaluasi yang menganalisis kemungkinan adanya pejabat yang melapor kepada lebih dari seorang atasan kepada seluruh unit kerja\r\nb. Telah dilakukan evaluasi yang menganalisis kemungkinan adanya pejabat yang melapor kepada lebih dari seorang atasan kepada sebagian unit kerja\r\nc. Belum  dilakukan evaluasi yang menganalisis kemungkinan adanya pejabat yang melapor kepada lebih dari seorang atasan kepada unit kerja', 7, 3, 1),
(31, 'F. Telah dilakukan evaluasi yang menganalisis kesesuaian struktur organisasi dengan kinerja yang akan dihasilkan', 'a. Telah dilakukan evaluasi yang menganalisis kesesuaian struktur organisasi dengan kinerja yang akan dihasilkan kepada seluruh unit kerja\r\nb. Telah dilakukan evaluasi yang menganalisis kesesuaian struktur organisasi dengan kinerja yang akan dihasilkan kepada sebagian unit kerja\r\nc. Belum dilakukan evaluasi yang menganalisis kesesuaian struktur organisasi dengan kinerja yang akan dihasilkan kepada unit kerja', 7, 3, 1),
(32, 'G. Telah dilakukan evaluasi atas kesesuaian struktur organisasi dengan mandat', 'a. Telah dilakukan evaluasi  atas kesesuaian struktur organisasi dengan mandat kepada seluruh unit kerja\r\nb. Telah dilakukan evaluasi  atas kesesuaian struktur organisasi dengan mandat kepada sebagian unit kerja\r\nc. Belum dilakukan evaluasi atas kesesuaian struktur organisasi dengan mandat kepada unit kerja', 7, 3, 1),
(33, 'H. Telah dilakukan evaluasi yang menganalisis kemungkinan tumpang tindih fungsi dengan instansi lain', 'Ya, apabila telah dilakukan evaluasi yang menganalisis kemungkinan tumpang tindih fungsi dengan instansi lain\r\n', 7, 3, 1),
(34, 'I. Telah dilakukan evaluasi yang menganalisis kemampuan struktur organisasi untuk adaptif terhadap perubahan lingkungan strategis', 'Ya, apabila telah dilakukan evaluasi yang menganalisis kemampuan struktur organisasi untuk adaptif terhadap perubahan lingkungan strategis\r\n', 7, 3, 1),
(35, 'Hasil evaluasi telah ditindaklanjuti dengan mengajukan perubahan organisasi', 'a. Seluruh hasil evaluasi telah ditindaklanjuti dengan mengajukan perubahan organisasi\r\nb. Sebagian besar hasil evaluasi telah ditindaklanjuti dengan mengajukan perubahan organisasi\r\nc. Sebagian kecil hasil evaluasi telah ditindaklanjuti dengan mengajukan perubahan organisasi\r\nd. Seluruh hasil evaluasi belum  ditindaklanjuti dengan mengajukan perubahan organisasi', 8, 3, 1),
(36, 'A. Telah memiliki peta proses bisnis yang sesuai dengan tugas dan fungsi', 'a. Seluruh unit organisasi telah memiliki peta proses bisnis yang sesuai dengan tugas dan fungsi\r\nb. Sebagian besar unit organisasi telah memiliki peta proses bisnis yang sesuai dengan tugas dan fungsi\r\nc. Sebagian kecil unit organisasi telah memiliki peta proses bisnis yang sesuai dengan tugas dan fungsi\r\nd. Seluruh unit organisasi belum memiliki peta proses bisnis yang sesuai dengan tugas dan fungsi', 9, 4, 1),
(37, 'B. Peta proses bisnis sudah dijabarkan ke dalam prosedur operasional tetap (SOP)', 'a. Seluruh peta proses bisnis telah dijabarkan dalam SOP\r\nb. Sebagian besar peta proses bisnis telah dijabarkan dalam SOP \r\nc. Sebagian kecil peta proses bisnis telah dijabarkan dalam SOP \r\nd. Seluruh peta proses bisnis belum dijabarkan dalam SOP', 9, 4, 1),
(38, 'C. Prosedur operasional tetap (SOP) telah diterapkan', 'a. Seluruh unit organisasi telah menerapkan Prosedur operasional tetap (SOP) \r\nb. Sebagian besar unit organisasi telah menerapkan Prosedur operasional tetap (SOP) \r\nc. Sebagian kecil unit organisasi telah menerapkan Prosedur operasional tetap (SOP) \r\nd. Seluruh unit organisasi belum menerapkan Prosedur operasional tetap (SOP) ', 9, 4, 1),
(39, 'D. Peta proses bisnis dan Prosedur operasional telah dievaluasi dan disesuaikan dengan perkembangan tuntutan efisiensi, dan efektivitas birokrasi', 'a. Terdapat evaluasi terhadap efisiensi dan efektivitas peta proses bisnis dan SOP secara berkala dan seluruh hasilnya telah ditindaklanjuti\r\nb. Terdapat evaluasi terhadap efisiensi dan efektivitas peta proses bisnis dan SOP secara berkala namun belum seluruh hasilnya ditindaklanjuti\r\nc. Terdapat evaluasi namun belum menganalisis efisiensi dan efektivitas peta proses bisnis dan SOP\r\nd. Belum ada evaluasi terhadap efisiensi dan efektifitas peta proses bisnis dan prosedur operasional', 9, 4, 1),
(40, 'A. Sudah memiliki rencana pengembangan e-government di lingkungan instansi', 'Ya, apabila sudah memiliki rencana pengembangan e-government di lingkungan instansi\r\n', 10, 4, 1),
(41, 'B. Sudah dilakukan pengembangan e-government di lingkungan internal dalam rangka mendukung proses birokrasi (misal: intranet, sistem perencanaan dan penganggaran, sistem data base SDM, dll)', 'a. Sudah dilakukan implementasi pengembangan e-government secara terintegrasi \r\nb.  Sudah dilakukan implementasi pengembangan e-government namun belum terintegrasi \r\nc. Sudah dilakukan pengembangan e-government namun belum dilakukan implementasi\r\nd.Belum ada pengembangan dan implementasi e-government', 10, 4, 1),
(42, 'C. Sudah dilakukan pengembangan e-government untuk meningkatkan kualitas pelayanan kepada masyarakat (misal: website untuk penyediaan informasi kepada masyarakat, sistem pengaduan)', 'a. Sudah dilakukan implementasi pengembangan e-government secara terintegrasi \r\nb. Sudah dilakukan implementasi pengembangan e-government namun belum terintegrasi \r\nc. Sudah dilakukan pengembangan e-government namun belum dilakukan implementasi\r\nd. Belum ada pengembangan dan implemetasi e-government', 10, 4, 1),
(43, 'D. Sudah dilakukan pengembangan e-government untuk meningkatkan kualitas pelayanan kepada masyarakat dalam tingkatan transaksional (masyarakat dapat mengajukan perijinan melalui website, melakukan pembayaran, dll)', 'a. Sudah dilakukan implementasi pengembangan e-government secara terintegrasi \r\nb. Sudah dilakukan implementasi pengembangan e-government namun belum terintegrasi \r\nc. Sudah dilakukan pengembangan e-government namun belum dilakukan implementasi\r\nd. Belum ada pengembangan dan implemetasi e-government', 10, 4, 1),
(44, 'A. Adanya kebijakan pimpinan tentang keterbukaan informasi publik (identifikasi informasi yang dapat diketahui oleh publik dan mekanisme penyampaian)', 'Ya, apabila telah ada kebijakan pimpinan tentang keterbukaan informasi publik\r\n', 11, 4, 1),
(45, 'B. Menerapkan kebijakan keterbukaan informasi publik', 'a. Seluruh informasi publik telah dapat diakses \r\nb. Sebagian besar informasi publik telah dapat diakses\r\nc. Sebagian kecil informasi publik telah dapat diakses\r\nd. Seluruh informasi publik belum dapat diakses', 11, 4, 1),
(46, 'C. Melakukan monitoring dan evaluasi pelaksanaan kebijakan keterbukaan informasi publik', 'a. Monitoring dan evaluasi pelaksanaan kebijakan keterbukaan informasi publik dilakukan secara berkala\r\nb. Monitoring dan evaluasi pelaksanaan kebijakan keterbukaan informasi publik dilakukan  tidak berkala\r\nc. Belum ada monitoring dan evaluasi pelaksanaan kebijakan keterbukaan informasi publik', 11, 4, 1),
(47, 'A. Analisis jabatan dan analisis beban kerja telah dilakukan', 'a. Analisis jabatan dan analisis beban kerja telah dilakukan kepada seluruh jabatan\r\nb. Analisis jabatan dan analisis beban kerja telah dilakukan kepada sebagian besar jabatan\r\nc.  Analisis jabatan dan analisis beban kerja telah dilakukan kepada sebagian kecil jabatan\r\nd. Analisis jabatan dan analisis beban kerja belum dilakukan ', 12, 5, 1),
(48, 'B. Perhitungan kebutuhan pegawai telah dilakukan', 'a. Perhitungan kebutuhan pegawai telah dilakukan kepada seluruh unit organisasi\r\nb. Perhitungan kebutuhan pegawai telah dilakukan kepada sebagian besar unit organisasi \r\nc. Perhitungan kebutuhan pegawai telah dilakukan kepada sebagian kecil  unit organisasi\r\nd. Perhitungan kebutuhan pegawai belum dilakukan', 12, 5, 1),
(49, 'C. Rencana redistribusi pegawai telah disusun dan diformalkan', 'ya, apabila terdapat dokumen rencana redistribusi pegawai\r\n', 12, 5, 1),
(50, 'D. Proyeksi kebutuhan 5 tahun telah disusun dan diformalkan', 'ya, apabila terdapat dokumen tentang proyeksi kebutuhan 5 tahun\r\n', 12, 5, 1),
(51, 'E. Perhitungan formasi jabatan yang menunjang kinerja utama instansi telah dihitung dan diformalkan', 'a. Perhitungan formasi jabatan yang menunjang kinerja utama instansi telah dihitung dan diformalkan pada seluruh unit organisasi\r\nb. Perhitungan formasi jabatan yang menunjang kinerja utama instansi telah dihitung dan diformalkan pada sebagian besar unit organisasi\r\nc. Perhitungan formasi jabatan yang menunjang kinerja utama instansi telah dihitung dan diformalkan pada sebagian kecil unit organisasi\r\nd. Perhitungan formasi jabatan yang menunjang kinerja utama instansi telah dihitung dan diformalkan belum dilakukan', 12, 5, 1),
(52, 'A. Pengumuman penerimaan diinformasikan secara luas kepada masyarakat', 'a. Pengumuman penerimaan disebarluaskan melalui berbagai media (misal: website, jejaring sosial, dsb)\r\nb. Pengumuman penerimaan diinformasikan melalui media secara terbatas (misal: papan pengumuman di kantor)\r\nc. Pengumuman penerimaan belum disebarluaskan', 13, 5, 1),
(53, 'B. Pendaftaran dapat dilakukan dengan mudah, cepat dan pasti (online)', 'Ya, apabila pendaftaran dapat dilakukan secara online dan dapat segera diperoleh informasi mengenai kepastian status pendaftaran.\r\n', 13, 5, 1),
(54, 'C. Persyaratan jelas, tidak diskriminatif', 'Ya, apabila terdapat kejelasan persyaratan administrasi dan kompetensi. Persyaratan memberikan kesempatan luas kepada masyarakat.\r\n', 13, 5, 1),
(55, 'D. Proses seleksi transparan, objektif, adil, akuntabel dan bebas KKN', 'Ya, apabila proses seleksi jelas kriteria dan prosesnya, tidak terjadi KKN, dan dapat dipertanggungjawabkan.\r\n', 13, 5, 1),
(56, 'E. Pengumuman hasil seleksi diinformasikan secara terbuka', 'Ya, apabila Pengumuman hasil seleksi dapat diakses oleh publik dengan mudah\r\n', 13, 5, 1),
(57, 'A. Telah ada standar kompetensi jabatan', 'Ya, apabila terdapat kebijakan tentang tentang kompetensi jabatan\r\n', 14, 5, 1),
(58, 'B. Telah dilakukan asessment pegawai', 'a. Telah dilakukan asessment kepada seluruh pegawai\r\nb. Telah dilakukan asessment kepada sebagian besar pegawai\r\nc. Telah dilakukan asessment kepada sebagian kecil pegawai \r\nd. Belum dilakukan assessment pegawai', 14, 5, 1),
(59, 'C. Telah diidentifikasi kebutuhan pengembangan kompetensi', 'a. Telah diidentifikasi kebutuhan pengembangan kompetensi kepada seluruh pegawai \r\nb. Telah diidentifikasi kebutuhan pengembangan kompetensi kepada sebagian besar pegawai\r\nc. Telah diidentifikasi kebutuhan pengembangan kompetensi kepada sebagian kecil pegawai \r\nd. Belum dilakukan identifikasi kebutuhan  pengembangan kompetensi pegawai ', 14, 5, 1),
(60, 'D. Telah disusun rencana pengembangan kompetensi dengan dukungan anggaran yang mencukupi', 'a. Telah disusun rencana pengembangan kompetensi seluruh pegawai dengan dukungan anggaran yang mencukupi \r\nb.Telah disusun rencana pengembangan kompetensi sebagian besar pegawai dengan dukungan anggaran yang mencukupi \r\nc. Telah disusun rencana pengembangan kompetensi sebagian kecil pegawai dengan dukungan anggaran yang mencukupi  \r\nd. Belum ada rencana pengembangan kompetensi pegawai', 14, 5, 1),
(61, 'E. Telah dilakukan pengembangan pegawai berbasis kompetensi sesuai dengan rencana  dan kebutuhan pengembangan kompetensi', 'a. Telah dilakukan pengembangan berbasis kompetensi kepada seluruh pegawai sesuai dengan rencana  dan kebutuhan pengembangan kompetensi \r\nb. Telah dilakukan pengembangan berbasis kompetensi kepada sebagian besar pegawai sesuai dengan rencana  dan kebutuhan pengembangan kompetensi \r\nc. Telah dilakukan pengembangan berbasis kompetensi kepada sebagian kecil pegawai sesuai dengan rencana  dan kebutuhan pengembangan kompetensi  \r\nd. Belum ada pengembangan pegawai berbasis kompetensi', 14, 5, 1),
(62, 'F. Telah dilakukan monitoring dan evaluasi pengembangan pegawai berbasis kompetensi secara berkala', 'a. Telah dilakukan monitoring dan evaluasi pengembangan pegawai berbasis kompetensi secara berkala\r\nb. Telah dilakukan monitoring dan evaluasi pengembangan pegawai berbasis kompetensi secara tidak berkala\r\nc. Belum ada monitoring dan evaluasi pengembangan pegawai berbasis kompetensi', 14, 5, 1),
(63, 'A. Kebijakan promosi terbuka telah ditetapkan', 'ya, apabila terdapat kebijakan tentang promosi terbuka dan telah ditetapkan\r\n', 15, 5, 1),
(64, 'B. Promosi terbuka pengisian jabatan pimpinan tinggi telah dilaksanakan', 'a. Pengisian jabatan pimpinan tinggi (utama, madya dan pratama) telah dilakukan melalui promosi terbuka secara nasional\r\nb. Pengisian jabatan pimpinan tinggi (utama, madya dan pratama) telah dilakukan melalui promosi terbuka secara terbatas\r\nc. Promosi terbuka jabatan pimpinan tinggi terbatas pada posisi jabatan pimpinan tinggi pratama \r\nd. Belum ada promosi terbuka jabatan pimpinan tinggi', 15, 5, 1),
(65, 'C. Promosi terbuka dilakukan secara kompetitif dan obyektif', 'Ya, apabila pelaksanaan promosi dilakukan dengan cara kompetitif dan penilaian dilakukan secara obyektif\r\n', 15, 5, 1),
(66, 'D. Promosi terbuka dilakukan oleh panitia seleksi yang independen', 'Ya, apabila telah ditetapkan susunan panitia seleksi yang berasal dari pihak-pihak independen\r\n', 15, 5, 1),
(67, 'E. Hasil setiap tahapan seleksi diumumkan secara terbuka', 'Ya, apabila tahapan diumumkan secara terbuka melalui media IT seperti website panitia seleksi dsb\r\n', 15, 5, 1),
(68, 'A. Penerapan Penetapan kinerja individu', 'a. Penerapan penetapan kinerja individu telah dilakukan terhadap seluruh pegawai\r\nb. Penerapan penetapan kinerja individu telah dilakukan terhadap sebagian besar pegawai\r\nc. Penerapan penetapan kinerja individu telah dilakukan terhadap sebagian kecil pegawai\r\nd. Belum ada penerapan penetapan kinerja individu yang telah dilakukan ', 16, 5, 1),
(69, 'B. Terdapat penilaian kinerja individu yang terkait dengan kinerja organisasi ', 'a. Seluruh pegawai telah melakukan penilaian kinerja individu yang terkait dengan kinerja organisasi\r\nb. Sebagian besar pegawai telah melakukan penilaian kinerja individu yang terkait dengan kinerja organisasi\r\nc. Sebagian kecil pegawai telah melakukan penilaian kinerja individu yang terkait dengan kinerja organisasi \r\nd. Belum ada pegawai yang melakukan penilaian kinerja individu yang terkait dengan kinerja organisasi', 16, 5, 1),
(70, 'C. Ukuran kinerja individu telah memiliki kesesuaian dengan indikator kinerja individu level diatasnya', 'a. Seluruh pegawai telah memiliki ukuran kinerja individu yang sesuai dengan indikator kinerja individu diatasnya\r\nb. Sebagian besar pegawai telah memiliki ukuran kinerja individu yang sesuai dengan indikator kinerja individu diatasnya\r\nc. Sebagian kecil pegawai telah memiliki ukuran kinerja individu yang sesuai dengan indikator kinerja individu diatasnya\r\nd.Seluruh pegawai belum memiliki ukuran kinerja individu yang sesuai dengan indikator kinerja individu diatasnya', 16, 5, 1),
(71, 'D. Pengukuran kinerja individu dilakukan secara periodik', 'a. Pengukuran kinerja individu dilakukan secara bulanan\r\nb. Pengukuran kinerja individu dilakukan secara triwulanan\r\nc. Pengukuran kinerja individu dilakukan secara semesteran\r\nd. Pengukuran kinerja individu dilakukan secara tahunan\r\ne. Pengukuran kinerja individu belum dilakukan', 16, 5, 1),
(72, 'E. Telah dilakukan monitoring dan evaluasi atas pencapaian kinerja individu.', 'a. telah dilakukan monev atas pencapaian kinerja individu secara berkala\r\nb.  telah dilakukan monev atas pencapaian kinerja individu secara tidak berkala\r\nc. Belum ada monev pencapaian kinerja individu', 16, 5, 1),
(73, 'F. Hasil penilaian kinerja individu telah dijadikan dasar untuk pengembangan karir individu', 'a. Hasil penilaian kinerja individu telah dijadikan dasar untuk pengembangan karir individu terhadap seluruh pegawai\r\nb. Hasil penilaian kinerja individu telah dijadikan dasar untuk pengembangan karir individu terhadap sebagian besar pegawai\r\nc. Hasil penilaian kinerja individu telah dijadikan dasar untuk pengembangan karir individu terhadap sebagian kecil pegawai \r\nd. Hasil penilaian kinerja individu belum dijadikan dasar untuk pengembangan karir individu terhadap seluruh pegawai', 16, 5, 1),
(74, 'G. Capaian kinerja individu telah dijadikan dasar untuk pemberian tunjangan kinerja ', 'a. Capaian kinerja individu telah dijadikan dasar untuk pemberian tunjangan kinerja kepada seluruh pegawai\r\nb. Capaian kinerja individu telah dijadikan dasar untuk pemberian tunjangan kinerja kepada sebagian besar pegawai\r\nc. Capaian kinerja individu telah dijadikan dasar untuk pemberian tunjangan kinerja kepada sebagian kecil pegawai \r\nd. Capaian kinerja individu belum dijadikan dasar untuk pemberian tunjangan kinerja kepada seluruh pegawai', 16, 5, 1),
(75, 'A.  Aturan disiplin/kode etik/kode perilaku instansi telah ditetapkan', 'ya, apabila terdapat kebijakan tentang disiplin/kode etik/kode perilaku\r\n', 17, 5, 1),
(76, 'B.  Aturan disiplin/kode etik/kode perilaku instansi telah diimplementasikan', 'a. Aturan disiplin/kode etik/kode perilaku instansi telah diimplementasikan kepada seluruh unit organisasi\r\nb. Aturan disiplin/kode etik/kode perilaku instansi telah diimplementasikan kepada sebagian besar unit organisasi\r\nc. Aturan disiplin/kode etik/kode perilaku instansi telah diimplementasikan kepada sebagian kecil unit organisasi\r\nd. Aturan disiplin/kode etik/kode perilaku instansi belum diimplementasikan kepada seluruh unit organisasi', 17, 5, 1),
(77, 'C. Adanya monitoring dan evaluasi atas pelaksanaan aturan disiplin/kode etik/kode perilaku instansi', 'a. Adanya monev atas pelaksanaan aturan disiplin/kode etik/kode perilaku instansi secara berkala\r\nb. Adanya monev atas pelaksanaan aturan disiplin/kode etik/kode perilaku instansi tidak berkala\r\nc. Belum ada monev atas pelaksanaan aturan disiplin/kode etik/kode perilaku instansi ', 17, 5, 1),
(78, 'D. Adanya pemberian sanksi dan imbalan (reward)', 'a. Adanya pemberian sanksi dan imbalan (reward) kepada seluruh unit organisasi\r\nb. Adanya pemberian sanksi dan imbalan (reward) kepada sebagian besar unit organisasi\r\nc. Adanya pemberian sanksi dan imbalan (reward) kepada sebagian kecil unit organisasi\r\nd. Belum ada pemberian sanksi dan imbalan (reward) kepada unit organisasi', 17, 5, 1),
(79, 'A. Informasi faktor jabatan telah disusun', 'Ya, apabila terdapat dokumen tentang penyusunan Faktor Jabatan\r\n', 18, 5, 1),
(80, 'B. Peta jabatan telah ditetapkan', 'a. Seluruh unit organisasi telah menetapkan peta jabatan\r\nb. Sebagian besar unit organisasi telah menetapkan peta jabatan\r\nc. Sebagian kecil unit organisasi telah menetapkan peta jabatan\r\nd. Seluruh unit organisasi belum menetapkan peta jabatan', 18, 5, 1),
(81, 'C. Kelas jabatan telah ditetapkan', 'a. Seluruh unit organisasi telah menetapkan kelas  jabatan\r\nb. Sebagian besar unit organisasi telah menetapkan kelas jabatan\r\nc. Sebagian kecil unit organisasi telah menetapkan kelas jabatan\r\nd. Seluruh unit organisasi belum menetapkan kelas  jabatan', 18, 5, 1),
(82, 'A. Sistem informasi kepegawaian telah dibangun sesuai kebutuhan', 'Ya, apabila terdapat sistem informasi yang dibangun sesuai dengan kebutuhan\r\n', 19, 5, 1),
(83, 'B. Sistem informasi kepegawaian dapat diakses oleh pegawai', 'Ya, apabila pegawai dapat mengakses sistem informasi kepegawaian\r\n', 19, 5, 1),
(84, 'C. Sistem informasi kepegawaian terus dimutakhirkan', 'a. Seluruh unit organisasi  terus memutakhirkan Sistem Informasi Kepegawaian\r\nb. Sebagian besar unit organisasi  terus memutakhirkan Sistrm Informasi Kepegawaian\r\nc. Sebagian kecil unit organisasi  terus memutakhirkan Sistem Informasi Kepegawaian\r\nd. Seluruh unit organsiasi belum memutakhirkan Sistem Informasi Kepegawaian', 19, 5, 1),
(85, 'D. Sistem informasi kepegawaian digunakan sebagai pendukung pengambilan kebijakan manajemen SDM', 'Ya, apabila sistem informasi kepegawaian digunakan sebagai pendukung pengambilan kebijakan manajemen SDM\r\n', 19, 5, 1),
(86, 'A. Apakah pimpinan terlibat secara langsung pada saat penyusunan Renstra', 'a. Seluruh pimpinan terlibat secara langsung pada saat penyusunan Renstra\r\nb. Sebagian besar pimpinan terlibat secara langsung pada saat penyusunan Renstra\r\nc. Sebagian kecil pimpinan terlibat secara langsung pada saat penyusunan Renstra\r\nd. Seluruh pimpinan belum terlibat secara langsung pada saat penyusunan Renstra', 20, 6, 1),
(87, 'B. Apakah pimpinan terlibat secara langsung pada saat penyusunan Penetapan Kinerja', 'a. Seluruh pimpinan terlibat secara langsung pada saat penyusunan Penetapan Kinerja\r\nb. Sebagian besar pimpinan terlibat secara langsung pada saat penyusunan Penetapan Kinerja\r\nc. Sebagian kecil pimpinan terlibat secara langsung pada saat penyusunan Penetapan Kinerja\r\nd. Seluruh pimpinan belum terlibat secara langsung pada saat penyusunan Penetapan Kinerja', 20, 6, 1),
(88, 'C. Apakah pimpinan memantau pencapaian kinerja secara berkala', 'a. Seluruh pimpinan memantau pencapaian kinerja secara berkala\r\nb. Sebagian besar pimpinan memantau pencapaian kinerja secara berkala\r\nc. Sebagian kecil pimpinan memantau pencapaian kinerja secara berkala\r\nd. Seluruh pimpinan belum memantau pencapaian kinerja secara berkala', 20, 6, 1),
(89, 'A. Apakah terdapat upaya peningkatan kapasitas SDM yang menangani akuntabilitas kinerja', 'a. Seluruh unit organisasi berupaya meningkatkan kapasitas SDM yang menangani akuntabilitas kinerja\r\nb. Sebagian besar unit organisasi berupaya meningkatkan kapasitas SDM yang menangani akuntabilitas kinerja\r\nc. Sebagian kecil unit organisasi berupaya meningkatkan kapasitas SDM yang menangani akuntabilitas kinerja\r\nd. Seluruh unit organisasi belum berupaya meningkatkan kapasitas SDM yang menangani akuntabilitas kinerja', 21, 6, 1),
(90, 'B. Apakah pedoman akuntabilitas kinerja telah disusun', 'Ya, apabila terdapat dokumen pedoman akuntabilitas kinerja \r\n', 21, 6, 1),
(91, 'C. Sistem Pengukuran Kinerja telah dirancang berbasis elektronik', 'a. Sistem Pengukuran Kinerja berbasis elektronik sudah terimplementasi dan terintegrasi  \r\nb. Sistem Pengukuran Kinerja berbasis elektronik sudah terimplementasi tapi belum terintegrasi\r\nc. Sistem Pengukuran Kinerja berbasis elektronik dalam pengembangan tp belum implementasi\r\nd. Belum ada Sistem Pengukuran Kinerja berbasis elektronik', 21, 6, 1),
(92, 'D. Sistem Pengukuran Kinerja dapat diakses oleh seluruh unit', 'a. Sistem Pengukuran Kinerja dapat diakses oleh seluruh unit organisasi\r\nb. Sistem Pengukuran Kinerja dapat diakses oleh sebagian besar organisasi\r\nc. Sistem Pengukuran Kinerja dapat diakses oleh sebagian kecil organisasi\r\nd. Sistem pengukuran kinerja belum dapat diakses oleh unit organisasi', 21, 6, 1),
(93, 'E. Pemutakhiran data kinerja dilakukan secara berkala', 'a. Pemutakhiran data kinerja dilakukan secara bulanan\r\nb. Pemutakhiran data kinerja dilakukan secara triwulanan\r\nc. Pemutakhiran data kinerja dilakukan secara semesteran\r\nd. Pemutakhiran data kinerja dilakukan secara tahunan\r\ne. Pemutakhiran data kinerja belum dilakukan', 21, 6, 1),
(94, 'A. Telah terdapat kebijakan penanganan gratifikasi', 'Ya, apabila telah ditetapkan kebijakan tentang penanganan gratifikasi\r\n', 22, 7, 1),
(95, 'B. Telah dilakukan public campaign ', 'a. Public campaign telah dilakukan secara berkala\r\nb. Public campaign dilakukan tidak secara berkala\r\nc. Belum dilakukan public campaign ', 22, 7, 1),
(96, 'C. Penanganan gratifikasi telah diimplementasikan', 'Ya, apabila UPG melaporkan secara berkala tentang praktik gratifikasi\r\n', 22, 7, 1),
(97, 'D. Telah dilakukan evaluasi atas kebijakan penanganan gratifikasi', 'Ya, apabila terdapat evaluasi atas kebijakan penanganan gratifikasi\r\n', 22, 7, 1),
(98, 'E. Hasil evaluasi atas penanganan gratifikasi telah ditindaklanjuti ', 'Ya, apabila terdapat laporan tindak lanjut \r\n', 22, 7, 1),
(99, 'A. Telah terdapat peraturan Pimpinan organisasi tentang SPIP', 'Ya, apabila ada peraturan pimpinan organisasi tentang SPIP\r\n', 23, 7, 1),
(100, 'B. Telah dibangun lingkungan pengendalian', 'a. Seluruh organisasi telah membangun lingkungan pengendalian\r\nb. Sebagian organisasi telah membangun lingkungan pengendalian\r\nc. Seluruh organisasi belum membangunan lingkungan pengendalian', 23, 7, 1),
(101, 'C. Telah dilakukan penilaian risiko atas organisasi', 'a. Seluruh organisasi telah melaksanakan penilaian risiko \r\nb. Sebagian besar organisasi telah melaksanakan penilaian risiko \r\nc. Sebagian kecil organisasi telah melaksanakan penilaian risiko \r\nd. Seluruh organisasi belum melaksanakan penilaian risiko ', 23, 7, 1),
(102, 'D. Telah dilakukan kegiatan pengendalian untuk meminimalisir risiko yang telah diidentifikasi', 'a. Seluruh organisasi telah melakukan kegiatan pengendalian untuk meminimalisir risiko yang telah diidentifikasi\r\nb. Sebagian besar organisasi telah melakukan kegiatan pengendalian untuk meminimalisir risiko yang telah diidentifikasi\r\nc. Sebagian kecil organisasi telah melakukan kegiatan pengendalian untuk meminimalisir risiko yang telah diidentifikasi\r\nd. Seluruh organisasi belum melakukan kegiatan pengendalian untuk meminimalisir risiko yang telah diidentifikasi', 23, 7, 1),
(103, 'E. SPI telah diinformasikan dan dikomunikasikan kepada seluruh pihak terkait', 'a. SPI telah diinformasikan dan dikomunikasikan kepada seluruh pihak terkait\r\nb. SPI telah diinformasikan dan dikomunikasikan kepada sebagian besar pihak terkait \r\nc. SPI telah diinformasikan dan dikomunikasikan kepada sebagian kecil pihak terkait\r\nd. Belum ada pihak terkait yang mendapatkan informasi dan komunikasi mengenai SPI', 23, 7, 1),
(104, 'F. Telah dilakukan pemantauan pengendalian intern', 'a. Sistem pengendalian intern dimonitoring dan evaluasi secara berkala \r\nb. Sistem pengendalian intern dimonitoring dan evaluasi tidak secara berkala\r\nc. Belum ada monitoring dan evaluasi terhadap  sistem pengendalian intern ', 23, 7, 1),
(105, 'A. Telah disusun kebijakan pengaduan masyarakat', 'Ya, apabila telah ditetapkan kebijakan tentang penanganan pengaduan\r\n', 24, 7, 1),
(106, 'B. Penanganan pengaduan masyrakat telah diimplementasikan', 'a. Seluruh unit organisasi mengimplementasikan penanganan pengaduan masyarakat\r\nb. Sebagian besar unit organisasi mengimplementasikan penanganan pengaduan masyarakat\r\nc. Sebagian kecil unit organisasi mengimplementasikan penanganan pengaduan masyrakat\r\nd. Seluruh unit organisasi mengimplementasikan penanganan pengaduan masyarakat', 24, 7, 1),
(107, 'C. Hasil penanganan pengaduan masyarakat telah ditindaklanjuti ', 'a. Seluruh hasil penanganan pengaduan masyarakat ditindaklanjuti\r\nb. Sebagian besar Hasil penanganan pengaduan masyarakat ditindaklanjuti\r\nc. Sebagian kecil Hasil penanganan pengaduan masyarakat ditindaklanjuti\r\nd. Seluruh hasil penanganan pengaduan masyarakat belum ditindaklanjuti', 24, 7, 1),
(108, 'D. Telah dilakukan evaluasi atas penanganan pengaduan masyarakat', 'a. Penanganan pengaduan masyarakat dimonitoring dan evaluasi secara berkala \r\nb. Penanganan pengaduan masyarakat dimonitoring dan evaluasi tidak secara berkala\r\nc. Belum ada monitoring dan evaluasi terhadap penanganan pengaduan masyarakat', 24, 7, 1),
(109, 'E. Hasil evaluasi atas penanganan pengaduan masyarakat telah ditindaklanjuti ', 'Ya, apabila terdapat laporan hasil evaluasi atas tindak lanjut penanganan pengaduan masyarakat\r\n', 24, 7, 1),
(110, 'A. Telah terdapat Whistle Blowing System', 'Ya, apabila terdapat kebijakan tentang Whistle Blowing System\r\n', 25, 7, 1),
(111, 'B. Whistle Blowing System telah disosialisasikan', 'a. Whistle blowing system disosialisasikan ke seluruh organisasi\r\nb. Whistle blowing system disosialisasikan ke sebagian besar organisasi\r\nc. Whistle blowing system disosialisasikan ke sebagian kecil organisasi \r\nd. Whistle blowing system belum disosialisasikan ke seluruh organisasi', 25, 7, 1),
(112, 'C. Whistle Blowing System telah diimplementasikan', 'Ya, apabila kebijakan whistle blowing system telah diimplementasikan\r\n', 25, 7, 1),
(113, 'D. Telah dilakukan evaluasi atas Whistle Blowing System', 'a. Whistle Blowing System dimonitoring dan evaluasi secara berkala\r\nb. Whistle Blowing System dimonitoring dan evaluasi tidak secara berkala\r\nc. Belum ada monitoring dan evaluasi Whistle Blowing System ', 25, 7, 1),
(114, 'E. Hasil evaluasi atas Whistle Blowing System telah ditindaklanjuti ', 'a. Seluruh Hasil evaluasi atas Whistle Blowing System telah ditindaklanjuti\r\nb. Sebagian besar Hasil evaluasi atas Whistle Blowing System telah ditindaklanjuti\r\nc. Sebagian kecil Hasil evaluasi atas Whistle Blowing System telah ditindaklanjuti\r\nd.  Seluruh Hasil evaluasi atas Whistle Blowing System belum ditindaklanjuti', 25, 7, 1),
(115, 'A. Telah terdapat Penanganan Benturan Kepentingan', 'Ya, apabila terdapat peraturan/kebijakan Penanganan Benturan Kepentingan\r\n', 26, 7, 1),
(116, 'B. Penanganan Benturan Kepentingan telah disosialisasikan', 'a. Penanganan Benturan Kepentingan disosialiasikan ke seluruh unit organisasi \r\nb.  Penanganan Benturan Kepentingan disosialiasikan ke sebagian besar unit organisasi\r\nc.  Penanganan Benturan Kepentingan disosialiasikan ke sebagian kecil unit organisasi\r\nd.  Penanganan Benturan Kepentingan belum disosialiasikan ke seluruh unit organisasi', 26, 7, 1),
(117, 'C. Penanganan Benturan Kepentingan telah diimplementasikan', 'Ya, apabila Penanganan Benturan Kepentingan telah diimplementasikan\r\n', 26, 7, 1),
(118, 'D. Telah dilakukan evaluasi atas Penanganan Benturan Kepentingan', 'a. Penanganan Benturan Kepentingan dimonitoring dan evaluasi secara berkala\r\nb. Penanganan Benturan Kepentingan dimonitoring dan evaluasi tidak secara berkala\r\nc. Belum ada monitoring dan evaluasi Penanganan Benturan Kepentingan', 26, 7, 1),
(119, 'E. Hasil evaluasi atas Penanganan Benturan Kepentingan telah ditindaklanjuti', 'a. Seluruh Hasil evaluasi atas Penanganan Benturan Kepentingan telah ditindaklanjuti\r\nb. Sebagian besar Hasil evaluasi atas Penanganan Benturan Kepentingan telah ditindaklanjuti\r\nc. Sebagian kecil Hasil evaluasi atas Penanganan Benturan Kepentingan telah ditindaklanjuti\r\nd. Seluruh Hasil evaluasi atas Penanganan Benturan Kepentingan belum ditindaklanjuti', 26, 7, 1),
(120, 'A. Telah dilakukan pencanangan zona integritas', 'Ya, apabila terdapat Dokumen Pencanangan Zona Integritas ditandatangani sesuai ketentuan\r\n', 27, 7, 1),
(121, 'B. Telah ditetapkan unit yang akan dikembangkan menjadi zona integritas', 'Ya, apabila ada Surat Keputusan Tentang unit yang ditetapkan\r\n', 27, 7, 1),
(122, 'C. Telah dilakukan pembangunan zona integritas', 'a. Pembangunan zona integritas dilakukan secara intensif\r\nb. Pembangunan zona integritas dilakikan tidak secara intensif\r\nc. Belum ada pembangunan zona integritas', 27, 7, 1),
(123, 'D. Telah dilakukan evaluasi atas zona integritas yang telah ditentukan', 'a.Zona integritas yang telah ditentukan dimonitoring dan evaluasi secara berkala\r\nb. Zona integritas yang telah ditentukan dimonitoring dan evaluasi tidak secara berkala\r\nc. Belum ada monitoring dan evaluasi zona integritas yang telah ditentukan', 27, 7, 1),
(124, 'E. Telah terdapat unit kerja yang ditetapkan sebagai “menuju WBK/WBBM”', 'a. Telah terdapat unit kerja yang berpredikat menuju WBBM\r\nb. Telah terdapat unit kerja yang berpredikat menuju WBK\r\nc. Belum terdapat unit kerja yang berpredikat menuju WBK', 27, 7, 1),
(125, 'A. Rekomendasi APIP didukung dengan komitmen pimpinan', 'a. Seluruh rekomendasi yang memerlukan komitmen pimpinan telah ditindaklanjuti dalam 2 tahun terakhir\r\nb. Sebagian rekomendasi yang memerlukan komitmen pimpinan telah di tindaklanjuti dalam 2 tahun terakhir \r\nc. Sebagian kecil rekomendasi yang memerlukan komitmen pimpinan telah di tindaklanjuti dalam 2 tahun terakhir \r\nd. Seluruh rekomendasi yang memerlukan komitmen pimpinan belum ditindaklanjuti dalam 2 tahun terakhir', 28, 7, 1),
(126, 'B. APIP didukung dengan SDM yang memadai secara kualitas dan kuantitas.', 'a. Seluruh fungsi pengawasan internal tertangani oleh SDM yang kompeten baik secara kuantitas maupun kualitas\r\nb. Sebagian besar fungsi pengawasan internal tertangani oleh SDM yang kompeten baik secara kuantitas maupun kualitas\r\nc. Sebagian kecil fungsi pengawasan internal tertangani oleh SDM yang kompeten baik secara kuantitas maupun kualitas\r\nd. Seluruh fungsi pengawasan internal belum tertangani oleh SDM yang kompeten baik secara kuantitas maupun kualitas', 28, 7, 1),
(127, 'C. APIP didukung dengan anggaran yang memadai', 'a. Seluruh kebutuhan didukung oleh anggaran\r\nb. Sebagian besar kebutuhan didukung oleh anggaran\r\nc. Sebagian kecil kebutuhan didukung oleh anggaran\r\nd. Seluruh kebutuhan belum didukung oleh anggaran', 28, 7, 1),
(128, 'D. APIP berfokus pada client dan audit berbasis risiko', 'a. Seluruh fungsi pengawasan internal berfokus pada client dan audit berbasis risiko\r\nb. Sebagian besar fungsi pengawasan internal berfokus pada client dan audit berbasis risiko\r\nc. Sebagian kecil fungsi pengawasan internal berfokus pada client dan audit berbasis risiko\r\nd.  Seluruh fungsi pengawasan internal belum berfokus pada client dan audit berbasis risiko', 28, 7, 1),
(129, 'A. Terdapat kebijakan standar pelayanan', 'Ya, apabila telah terdapat kebijakan standar pelayanan yang mencakup kejelasan biaya, waktu, persyaratan perijinan\r\n', 29, 8, 1),
(130, 'B. Standar pelayanan telah dimaklumatkan', 'a. Standar pelayanan telah dimaklumatkan pada seluruh jenis pelayanan\r\nb. Standar pelayanan telah dimaklumatkan pada sebagian besar jenis pelayanan\r\nc. Standar pelayanan telah dimaklumatkan pada sebagian kecil  jenis pelayanan\r\nd. Standar pelayanan belum dimaklumatkan pada seluruh jenis pelayanan', 29, 8, 1),
(131, 'C. Terdapat SOP bagi pelaksanaan standar pelayanan', 'a. Terdapat SOP bagi pelaksanaan standar pelayanan pada seluruh jenis pelayanan \r\nb. Terdapat SOP bagi pelaksanaan standar pelayanan pada sebagian besar  jenis pelayanan \r\nc. Terdapat SOP bagi pelaksanaan standar pelayanan pada sebagian kecil  jenis pelayanan \r\nd. Belum terdapat SOP bagi pelaksanaan standar pelayanan ', 29, 8, 1),
(132, 'D. Dilakukan reviu dan perbaikan atas standar pelayanan', 'a. Dilakukan reviu dan perbaikan atas standar pelayanan secara berkala dan dilakukan dengan melibatkan stakeholders\r\nb.Dilakukan reviu dan perbaikan atas standar pelayanan secara tidak berkala dan/atau tidak dengan melibatkan stakeholders\r\nc. Belum dilakukan reviu dan perbaikan atas standar pelayanan', 29, 8, 1),
(133, 'E. Dilakukan reviu dan perbaikan atas SOP', 'a. Dilakukan reviu dan perbaikan SOP secara berkala\r\nb. Dilakukan reviu dan SOP secara tidak berkala\r\nc. Belum ada reviu dan perbaikan SOP', 29, 8, 1),
(134, 'A. Telah dilakukan sosialisasi/pelatihan dalam upaya penerapan Budaya Pelayanan Prima (contoh: kode etik, estetika, capacity building, pelayanan prima)', 'a. Seluruh sosilisasi/pelatihan telah dilakukan dalam upaya penerapan budaya pelayanan prima\r\nb. Sebagian besar sosialisasi/pelatihan telah dilakukan dalam upaya penerapan budaya pelayanan prima\r\nc. Sebagian kecil sosialisasi/pelatihan telah dilakukan dalam upaya penerapan budaya pelayanan prima\r\nd. Seluruh sosilisasi/pelatihan belum dilakukan dalam upaya penerapan budaya pelayanan prima', 30, 8, 1),
(135, 'B. Informasi tentang pelayanan mudah diakses melalui berbagai media ', 'a. Informasi pelayanan dapat diakses melalui berbagai media (misal: papan pengumuman, website, media sosial, media cetak, media televisi, radio dsb)\r\nb. Informasi pelayanan dapat diakses melalui beberapa media (misal: papan pengumuman, selebaran, dsb)\r\nc. Informasi pelayanan sulit diakses melalui berbagai media', 30, 8, 1),
(136, 'C. Telah terdapat sistem punishment(sanksi)/reward bagi pelaksana layanan serta pemberian kompensasi kepada penerima layanan bila layanan tidak sesuai standar', 'a. Telah terdapat sistem sanksi/reward bagi pelaksana layanan serta pemberian kompensasi kepada penerima layanan bila layanan tidak sesuai standar dan sudah diimplementasikan \r\nb. Telah terdapat sistem sanksi/reward bagi pelaksana layanan serta pemberian kompensasi kepada penerima layanan bila layanan tidak sesuai standar ada namun belum diimplementasikan \r\nc. Belum terdapat sistem sanksi/reward bagi pelaksana layanan serta pemberian kompensasi kepada penerima layanan bila layanan tidak sesuai standar ', 30, 8, 1),
(137, 'D. Telah terdapat sarana layanan terpadu/terintegrasi', 'a. Apabila seluruh pelayanan sudah dilakukan secara terpadu\r\nb. Apabila sebagian besar pelayanan sudah dilakukan secara terpadu\r\nc. Apabila sebagian kecil pelayanan sudah dilakukan secara terpadu\r\nd. Apabila tidak ada pelayanan yang dilakukan secara terpadu\r\n', 30, 8, 1),
(138, 'E. Terdapat inovasi pelayanan', 'Ya, apabila terdapat bukti inovasi pelayanan yang diciptakan dan bermanfaat bagi penerima pelayanan\r\n', 30, 8, 1),
(139, 'A. Terdapat media pengaduan pelayanan', 'Ya, apabila telah ditetapkan media pengaduan pelayanan secara jelas dan terbuka\r\n', 31, 8, 1),
(140, 'B. Terdapat SOP pengaduan pelayanan', 'a. Terdapat SOP pengaduan pelayanan secara komprehensif\r\nb. Terdapat SOP pengaduan pelayanan namun belum seluruhnya\r\nc. Belum ada SOP pengaduan pelayanan', 31, 8, 1),
(141, 'C. Terdapat unit yang mengelola pengaduan pelayanan', 'ya, apabila telah ditetapkan unit pengelola pengaduan\r\n', 31, 8, 1),
(142, 'D. Telah dilakukan tindak lanjut atas seluruh pengaduan pelayanan untuk perbaikan kualitas pelayanan', 'a. Telah dilakukan tindak lanjut atas seluruh pengaduan pelayanan untuk perbaikan kualitas pelayanan\r\nb. Telah dilakukan tindak lanjut atas  sebagian besar pengaduan pelayanan untuk perbaikan kualitas pelayanan\r\nc. Telah dilakukan tindak lanjut atas sebagian kecil pengaduan pelayanan unutk perbaikan kualitas pelayanan \r\nd. Belum dilakukan tindak lanjut atas seluruh pengaduan pelayanan untuk perbaikan kualitas pelayanan', 31, 8, 1),
(143, 'E. Telah dilakukan evaluasi atas penanganan keluhan / masukan', 'a. Evaluasi atas penanganan keluhan / masukan dilakukan secara berkala\r\nb. Evaluasi  atas penanganan keluhan / masukan dilakukan  tidak berkala\r\nc. Belum ada evaluasi penanganan keluhan / masukan', 31, 8, 1);
INSERT INTO `item` (`id_item`, `penilaian`, `penjelasan`, `id_subkriteria_FK`, `id_kriteria_FK`, `id_bobot_FK`) VALUES
(144, 'A. Dilakukan survey kepuasan masyarakat terhadap pelayanan', 'a. Survey kepuasan masyarakat terhadap pelayanan dilakukan secara berkala\r\nb. Survey kepuasan masyarakat terhadap pelayanan tidak berkala\r\nc. Belum ada survey kepuasan masyarakat terhadap pelayanan', 32, 8, 1),
(145, 'B. Hasil survey kepuasan masyarakat dapat diakses secara terbuka', 'Ya, apabila tersedia media untuk mengakses data hasil survey dengan mudah\r\n', 32, 8, 1),
(146, 'C. Dilakukan tindak lanjut atas hasil survey kepuasan masyarakat', 'a. Dilakukan tindak lanjut atas seluruh hasil survey kepuasan masyarakat\r\nb. Dilakukan tindak lanjut atas sebagian besar hasil survey kepuasan masyarakat\r\nc. Dilakukan tindak lanjut atas sebagian kecil hasil survey kepuasan masyarakat\r\nd. Belum dilakukan tindak lanjut atas hasil survey kepuasan masyarakat', 32, 8, 1),
(147, 'A. Telah memiliki rencana penerapan teknologi informasi dalam pemberian pelayanan', 'Ya, apabila ada rencana penerapan teknologi informasi dalam pemberian pelayanan\r\n', 33, 8, 1),
(148, 'B. Telah menerapkan teknologi informasi dalam memberikan pelayanan', 'a. Seluruh pelayanan telah menerapkan teknologi informasi dalam memberikan pelayanan\r\nb. Sebagian besar pelayanan telah menerapkan teknologi informasi dalam memberikan pelayanan\r\nc. Sebagian kecil pelayanan telah menerapkan teknologi informasi dalam memberikan pelayanan\r\nd. Seluruh pelayanan belum menerapkan teknologi informasi dalam memberikan pelayanan', 33, 8, 1),
(149, 'C. Telah dilakukan perbaikan secara terus menerus', 'a. Perbaikan dilakukan secara terus-menerus\r\nb. Perbaikan dilakukan tidak secara terus menerus\r\nc. Belum dilakukan perbaikan ', 33, 8, 1),
(150, 'Nilai Akuntabilitas Kinerja', 'Diisi dengan nilai hasil evaluasi Sistem Akuntabilitas Kinerja Instansi Pemerintah (SAKIP)\r\n', 34, 9, 2),
(151, 'Nilai Kapasitas Organisasi  (Survei Internal)', 'Diisi dengan nilai hasil Survei Internal Kapasitas Organisasi\r\n', 35, 9, 2),
(152, 'Nilai Persepsi Korupsi (Survei Eksternal)', 'Diisi dengan nilai hasil Survei Eksternal atas Persepsi Korupsi\r\n', 36, 10, 2),
(153, 'Opini BPK', 'Diisi dengan Opini BPK atas Laporan Keuangan\r\n', 37, 10, 2),
(155, 'Nilai Persepsi Kualitas Pelayanan (Survei Eksternal)', 'Diisi dengan Nilai Hasil Survei Eksternal Kualitas Pelayanan\r\n', 38, 11, 2);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(5) NOT NULL,
  `nama_kriteria` varchar(255) NOT NULL,
  `jumlah_subkriteria` int(5) NOT NULL,
  `urutan` int(5) NOT NULL,
  `id_bab_FK` int(5) NOT NULL,
  `poin` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `nama_kriteria`, `jumlah_subkriteria`, `urutan`, `id_bab_FK`, `poin`) VALUES
(1, 'Manajemen Perubahan', 4, 1, 1, 5),
(2, 'Penataan Peraturan Perundang-undangan', 2, 2, 1, 5),
(3, 'Penataan dan Penguatan Organisasi', 2, 3, 1, 6),
(4, 'Penataan Tatalaksana', 3, 4, 1, 5),
(5, 'Penataan Sistem Manajemen SDM', 8, 5, 1, 15),
(6, 'Penguatan Akuntabilitas', 2, 6, 1, 6),
(7, 'Penguatan Pengawasan', 7, 7, 1, 12),
(8, 'Peningkatan Kualitas Pelayanan Publik', 5, 8, 1, 6),
(9, 'Kapasitas dan Akuntabilitas Kinerja Organisasi', 2, 1, 2, 20),
(10, 'Pemerintah Yang Bersih dan Bebas KKN', 2, 2, 2, 10),
(11, 'Kualitas Pelayanan Publik', 1, 3, 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id_level` int(5) NOT NULL,
  `level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lke`
--

CREATE TABLE `lke` (
  `id_lke` int(5) NOT NULL,
  `id_pilar_FK` int(5) NOT NULL,
  `proses_poin` decimal(5,0) NOT NULL,
  `hasil_poin` decimal(5,0) NOT NULL,
  `tahun` varchar(10) NOT NULL,
  `created_by` int(5) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pengumpulan` enum('Belum Mengumpulkan','Sudah Mengumpulkan') NOT NULL,
  `kelengkapan` enum('Belum Lengkap','Sudah Lengkap') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lke_detail`
--

CREATE TABLE `lke_detail` (
  `id_lke_detail` int(5) NOT NULL,
  `id_lke_FK` int(5) NOT NULL,
  `id_bab_FK` int(5) NOT NULL,
  `id_kriteria_FK` int(5) NOT NULL,
  `id_subkriteria_FK` int(5) NOT NULL,
  `id_item_FK` int(5) NOT NULL,
  `id_bobot_FK` int(5) NOT NULL,
  `jawaban` varchar(255) NOT NULL,
  `nilai` decimal(5,0) NOT NULL,
  `persentase` decimal(5,0) NOT NULL,
  `dokumen_pendukung` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id_notifikasi` int(5) NOT NULL,
  `id_user_FK` int(5) NOT NULL,
  `id_pengumuman_FK` int(5) NOT NULL,
  `status` enum('Belum Dibaca','Sudah Dibaca') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pengaturan`
--

CREATE TABLE `pengaturan` (
  `id_pengaturan` int(5) NOT NULL,
  `kode_pengaturan` varchar(255) NOT NULL,
  `nilai_pengaturan` text NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id_pengumuman` int(5) NOT NULL,
  `judul_pengumuman` varchar(255) NOT NULL,
  `isi_pengumuman` text NOT NULL,
  `kategori` enum('Tidak Penting','Penting') NOT NULL,
  `id_user_pembuat` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman_dituju`
--

CREATE TABLE `pengumuman_dituju` (
  `id_pengumuman_dituju` int(5) NOT NULL,
  `id_pengumuman_FK` int(5) NOT NULL,
  `id_level_FK` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pilar`
--

CREATE TABLE `pilar` (
  `id_pilar` int(5) NOT NULL,
  `nama_pilar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pilar`
--

INSERT INTO `pilar` (`id_pilar`, `nama_pilar`) VALUES
(1, 'Revolusi Mental Aparatur dan Manajemen Perubahan'),
(2, 'Penguatan Sistem Pengawasan'),
(3, 'Penguatan Akuntabilitas Kinerja'),
(4, 'Penguatan Kelembagaan dan Peraturan Perundang-undangan'),
(5, 'Penataan Tatalaksana'),
(6, 'SDM Aparatur Sipil Negara'),
(7, 'Peningkatan Kualitas Pelayanan Publik'),
(8, 'Monitoring dan Evaluasi');

-- --------------------------------------------------------

--
-- Table structure for table `sekretariat_rb`
--

CREATE TABLE `sekretariat_rb` (
  `id_sekretariat_rb` int(5) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subkriteria`
--

CREATE TABLE `subkriteria` (
  `id_subkriteria` int(5) NOT NULL,
  `nama_subkriteria` varchar(255) NOT NULL,
  `urutan` int(11) NOT NULL,
  `poin` decimal(3,1) NOT NULL,
  `id_kriteria_FK` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subkriteria`
--

INSERT INTO `subkriteria` (`id_subkriteria`, `nama_subkriteria`, `urutan`, `poin`, `id_kriteria_FK`) VALUES
(1, 'Tim Reformasi Birokrasi', 1, '1.0', 1),
(2, 'Road Map Reformasi Birokrasi', 2, '1.0', 1),
(3, 'Pemantauan dan Evaluasi Reformasi Birokrasi', 3, '2.0', 1),
(4, 'Perubahan Pola Pikir dan Budaya Kinerja', 4, '1.0', 1),
(5, 'Harmonisasi', 1, '2.5', 2),
(6, 'Sistem Pengendalian dalam Penyusunan Peraturan Perundang-undangan', 2, '2.5', 2),
(7, 'Evaluasi', 1, '3.0', 3),
(8, 'Penataan', 2, '3.0', 3),
(9, 'Proses Bisnis dan Prosedur Operasional Tetap (SOP) Kegiatan Utama', 1, '1.5', 4),
(10, 'E-Government', 2, '2.0', 4),
(11, 'Keterbukaan Informasi Publik', 3, '1.5', 4),
(12, 'Perencanaan Kebutuhan Pegawai Sesuai dengan Kebutuhan Organisasi', 1, '1.0', 5),
(13, 'Proses Penerimaan Pegawai Transparan, Objektif, Akuntabel, dan Bebas KKN', 2, '2.0', 5),
(14, 'Pengembangan Pegawai Berbasis Kompetensi', 3, '1.0', 5),
(15, 'Promosi Jabatan Dilakukan Secara Terbuka', 4, '6.0', 5),
(16, 'Penetapan Kinerja Individu', 5, '2.0', 5),
(17, 'Penegakan Aturan Disiplin/Kode Etik/Kode Perilaku Pegawai', 6, '1.0', 5),
(18, 'Pelaksanaan Evaluasi Jabatan', 7, '1.0', 5),
(19, 'Sistem Informasi Kepegawaian', 8, '1.0', 5),
(20, 'Keterlibatan Pimpinan', 1, '2.0', 6),
(21, 'Pengelolaan Akuntabilitas Kinerja', 2, '4.0', 6),
(22, 'Gratifikasi', 1, '1.5', 7),
(23, 'Penerapan SPIP', 2, '1.5', 7),
(24, 'Pengaduan Masyarakat', 3, '2.0', 7),
(25, 'Whistle-Bowling System', 4, '1.5', 7),
(26, 'Penanganan Benturan Kepentingan', 5, '1.5', 7),
(27, 'Pembangunan Zona Integritas', 6, '2.5', 7),
(28, 'Aparat Pengawasan Intern Pemerintah (APIP)', 7, '1.5', 7),
(29, 'Standar Pelayanan', 1, '1.0', 8),
(30, 'Budaya Pelayanan Prima', 2, '1.0', 8),
(31, 'Pengelolaan Pengaduan', 3, '1.5', 8),
(32, 'Penilaian Kepuasan terhadap Pelayanan ', 4, '1.5', 8),
(33, 'Pemanfaatan Teknologi Informasi', 5, '1.0', 8),
(34, 'Nilai Akuntabilitas Kinerja', 1, '14.0', 9),
(35, 'Nilai Kapasitas Organisasi (Survei Internal)', 2, '6.0', 9),
(36, 'Nilai Persepsi Korupsi (Survei Eksternal)', 1, '7.0', 10),
(37, 'Opini BPK', 2, '3.0', 10),
(38, 'Nilai Persepsi Kualitas Pelayanan (Survei Eksternal)', 1, '10.0', 11);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `authKey` varchar(100) NOT NULL,
  `accessToken` varchar(100) NOT NULL,
  `update_at` int(5) NOT NULL,
  `id_level_FK` int(5) NOT NULL,
  `foto` blob NOT NULL,
  `email` varchar(255) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `agama` enum('Islam','Kristen Katolik','Kristen Protestan','Hindu','Buddha') NOT NULL,
  `unit_kerja` varchar(255) NOT NULL,
  `posisi` varchar(255) NOT NULL,
  `no_telp` varchar(100) NOT NULL,
  `NIP` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `username`, `password`, `authKey`, `accessToken`, `update_at`, `id_level_FK`, `foto`, `email`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `agama`, `unit_kerja`, `posisi`, `no_telp`, `NIP`) VALUES
(1, 'Zulfandri', 'zdp123', 'zdp123', 'zdp-12345', 'zdp123', 15022019, 1, 0xffd8ffe000104a4649460001010100dc00dc0000ffdb0043000302020302020303030304030304050805050404050a070706080c0a0c0c0b0a0b0b0d0e12100d0e110e0b0b1016101113141515150c0f171816141812141514ffdb00430103040405040509050509140d0b0d1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414ffc000110801b2015a03012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f9328a28afc90ff44028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a296989c92dc4a28a280524f60a28a290c28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00518ee71477e2b335af11586831335ccc0498c8407935e6bac7c58bcb8de9668214e7e61d715eae1f2eaf88d62ac8f84ce38cb2bc99ba7527cd3ec8f50d475cb1d210b5d5ca27fb39e7f2ae4354f8b5a7dab116b134c7b31e057935fea973a94c649e5676272727354cf35f4b4325a3049d47767e1f9af8979962a4e1834a9c7f13bcbcf8b5a94f21316d897b002b36e3e236b170c49b861feef15c9d2fe35eac707878ab2823f3eadc479b56779e225f79d65afc48d5ed5b3e7eff0066e6b4d7e2e6a38e5573f4ae03ad144b078796f143a5c499b51d238897de7a769bf1725dff00e931023daba2b1f89fa6dc30593284f15e1f92b4e0ecadd6b9279561aa74b1f4584e3dceb0a947daf32f33e97b2d4adb508c3dbcab20ff0064d59af9d349f125e69328782564fa1af4ef0c7c4a8af9522bd1b25c801877fad7ce62b28a947dea7aa3f67c83c44c1e61cb471bee4fbf43bda3ad24722c88194e55b90452d7cfeda33f5f8ca338a945dd3128a28a45851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140052f341f6e959dab6bf65a2c65ae6609c70a3a9ad214e551f2c55d9c989c551c1d3756bc9462bb9a12489146cce42228c9635e73e2ff008986dd9edb4d2323832f5fcab0bc65f11a5d5f36f6798adfa75e4fd6b8467691b2c79ef5f5f97e52a36a95d6bd8fe74e2ee3f9622f83cae568f5977f42ddfea571a94e649e46918f24b1cd5563d85373d853f6edfad7d54528ab2d8fc26a54954939cdddb136fb530fcb4bbb8c5329bb58cc28a519ec28da7a9a80128a28a0028a28a002a5867685830241151514151938bba3d33c35f139ad560b6b94cc6a305bbd7a769fa943aa5b896ddc3a919c0af99c3608238aed3c3bf10e6d0e08e18e31c1e5bd6bc1c66534eb272a7a48fd678778fb1b964951c53e7a7f91edbed4573ba1f8dad75a54c909237519ae855832e41c8af8aad467425cb347f4ee5b9ae1735a2ab61a57bf40a28a2b9cf6028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a005a339a29b2c8b0c6cedc051934d26dd9113946117293b2467788b588f45d3a49d88dd8e07bd7846bdae5c6b576f2cae48cfad6ef8fbc54fab5f3448ff00b84381835c6b135f7d9660561e9f3c97bccfe48e39e289e6d8b786a12fddc34f51b8ed49db9a93854f526a30a59b1debdc3f29053cd3b71a97eced1ae587d322886d9e66240381c938a766221e693a1a9645258f6c52450bcd20451924fa51618c0453b757416de0fba9a2de463232054127866e626398db03be2aacd6e2b98db4f5a6ed357a5b1922c92381ed55f6e4f4345905caf4a1723356e3b196e188890903a9a8e55687e43c1ef472f70b95e8a91be6000a8c8c540c28cd145005cd3f529ac66478d88c57abf833c702f0a4170d86c000935e3c3a558b3bb7b5943a9208e98ae2c561218983525a9f5990f1062b23c42a94dfbbd51f4c2b065dc3914bed5c7f807c4ebaa58ac123fef57a6e3c9aec2bf3ac450961ea3848fec8c9f35a39c61238aa2f7dc4a28a2b98f7028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a005ae23e23f8a3fb2ed4da42d89641cfd2bb666daa58f6af07f1f6a06fb5e9981e33802bdcca70eab57bcb647e5de20671532bcb39293b4aa69f239f526e2625b9e739a475df210074ab76b6dfb927daa2e2353c73eb5fa0dacac7f1fb93949b7b95963f9b9ad0d36c13ce0f29c20e4e6abdb94f3417e99c9aded2f497f106a11dbdb8c21201c556895d93ac9f2a205863d4ae8f18897a01d6aec7e1cbbba1fb88ca21380bd09af67f0cfc1475b546488bc840cb115dcf81fe0ccfe22f11fd93063b78002ee077ac3db415db677ac1d576496e7855d7c29fb0e870cb29ff49946769eb52f877e08f88b56ba8c595839427fd611c57d5f2feccd2cfe2cb471712cf68982dbcfca3d857d35e11f86d69a758c51470a22a8032179ae3ad8e8422b9356cefa396b6ef55d923e3ef037ecc3782c51f517f9f1cae2b6fc55f016c349d06791e30368ce48e6bed78fc17047161073f4ae17e247c3dd435eb26b2b48d482319ed5c14f1952735ccf43ba585a5183505a9f97de22f00cf75ac1b7b38898f3c902963f831a9ddcc905b5abb3b70485afd14f097ecbf6763324f7a825b83f7b8e335e8fa7fc18d3349903c7691eeec4a8af4ea63a94568aecf269e5f293bcdd8fce2f0efecede238ad5e24b0c6e18f318579ff8efe08ea3a0de94c195fab6d1debf5c2fbc2304366f1c502bc98e368e2b81baf82567a94ed3df5a2bbf5db8e2b8bfb49deed591dcb2d84a3bea7e5de83f01fc4baf60dbd948109c6e60454de30f80fac784edfccb80385c902bf5017c03696103416902a1c11c2e2bcb3e21fc23975e8258277c2364138ed42cc14a567b1b7f64c39747767e633d94aacc3cb63b7ae0540548afb4f5cf809a5e8fa7cd15b44b2100b3c8793915f24f88b4bf235bbc8a342123723a7a1af4a9568d5bf29e2e230b3c3d9cba982bd69d4e65dad8a4dbbab7b1c46bf862fa4b5d560c48c80b004a9e6be86b7612411b2b120a8396fa57ccb0ccd6f2aba1c1539af66f87be269356b610ca77328c024d7cee7187f694d548ad51fb2f86f9c2c1e39e16b4bdd9edea76d451457c29fd5614514500145145001451450014514500145145001451450014514500145145001451450055d5a6f274f9dfa614d7806a83cdd42477eec7ad7b8f8ae4f2f469f9c715e0da95d79970f8e3935f679153b465367f3578a98a72af470eba2b924774238ca81f4aade706c82393d38a4556118e3afad59b4b333ce83debeb4fc06cae3adf4e32a0201c9e98afa1ff0067ff00873f6a9e3b9963cf391915c9781fc0e3589a04099191dabebdf85fe128f42b58936e0e076af2f1588518b4b73decbf0bcf3e691d7e99e1582d6c42220562300e2bacf0678562d29090837b9cb301505b0dce063815d469077638c0e2be66756567aee7d7469a4bcce86cac537062bc7618aebece28d234c70382462b9fb28f28074ae8f4f5558c64e4fd6a212ee7156d51ab1c7f2850bc1ef5243688f21e39f5c71491c9d076fad5c88062303ea2bb2291c2db5b043651a7403dce29af0a953c67b66ae2617af4ed50dd373f28e3daadaee4adec66bdaa46a481cf5e6a9dc2c6c877f071c569bfef063a63ad50bf88300063a7ad73ce2ad746f1d4e4af2cd54b15e0e78c5735abe922f15d1cfe35d75d2ed6391dcd61dc60671d3deb85b69dcf4a9dcf29f11f85e18ed6e238e3077039c8eb5f13f8efe12cf6971acdc0b7c3cf212aa07415fa19a9db89031c67d6bc77c79e194b9fb40daaa2407391cd7a784aee0fd4c715878d68ea7e69eb9a2c9a54db1c720f355e38629adfe5e1c76af6df8d3f0fce9ab3ddc2bf22120f15e151b3432641e33c8afaaa53538dcf86af4dd29b889340d19f9862babf875a81b5d5913380c704562dcc82f60df8c10314ef0bc861d62023fbc33cd2c4454a9b5e475e575e543194ea45d9a68fa1c1f94506996fff001ef19f55cd3ebf2b9ae59347f7ae126ea50849f5484a28a2b33a828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00e6fc78c7fb1d957ab1c578add58b43365fd79e2bdb3c6ac23d3c39e80d7906b5762463815fa064a97d5ee7f24f89927fdb16f2456ba9a32a8aa00c0ab1a437997d18073c8ac5693e5cf39ae8bc0f66d7dac4280672c2bde72b2773f258c6ed23ea9f82fa3c7e54523019c7a57d0ba749e4ec038ed5e65f0d7c326c74b81c8c1c035ea7636acd182074af93c449ce6ec7dc6162a9c11d158c9bb1c735d6e971b79631f9d739a15996c0239fa577da5e967087af4e2bcd9a67a6ea24aecd0d3564650335bf636f26e5e4f5eb4585980a800e738e95d1e9fa7fca491ec2ae9d27269a3cda9562ee430db6ec1273e805685bfdec630ddb357adf4f3e59ce07d29d0d9f7c77c57a2a9b8ea70b9a643b41f5cfad46d19643c7e95a2b6fb573b7da97ec65be9ed57c8ccf99183242549cfa566dc42ec739aeb24d3ce3a5675cd9e33dab095267453a88e32f2d1d9588e6b9cbbb778b248cf1cd7a1dddae17a7e42b99d4ad73bc6ded5c13a7cba9df4aaabd8e06ea4df9e303d315e7be348f2f83ebd6bd335ab47b7e83391d2bcafc5ec567647cf3ef5a518be6d4ea9c935a1e0ff00193434b9d16ee30014da4938e6be2cbcb2f2ee270171b18823dabefcf8816c93e8771dced3fcabe0bf134cd6fad5dc60ff00cb423ebcd7d5e0e578b47c6e6506a69aea096a1f4f322f03a1aa1a5cdf67d4a17f461fceaddbde186cca1fbac3f5aa9a5859352881e9b87f3aee9db95dcf330f75562d6f747d0da4cdf68d3e071dd455aaa9a3a08f4f802f4db572bf29c4595595bb9fdef94b94b0345cf7e542514515ce7ac1451450014514500145145001451450014514500145145001451450014514500729f10b3fd960038e726bc82e14492907a0af6bf1a599bad25f1d54135e2aeaf048e08cf3cd7de64734e838f547f28f89d4250cce355ad1a332e311c840e95eb1f02fc3e750d5d2561c29079af269be6949f7afa07e01db98e3320edcf4af6abb6a0ec7e4d858a954573ea0b1d72df42d3e3595d50281d4d5cb3f8c3a542c230eae7383835f397c43d6359d53525b0b00e4b1c61735d47c3df853ad3420dc594b3dcb8caee240cfb9af2e9e160ece6f73dba98a9df969ad8fa8fc37f13b4a9220e1d58e01ea00fc4d7a568ff13fc3d1ac7f68bc8220c010378cd7ca527ecede3ed72354171069d030c18e2241c1ef9ef55b58fd90be20decb1bc77b0398d405944ecb9007195f5adfeaf865af36a73baf8a92f84fba74bf1a6817522795a8c058f2156415d8586b56a541122383fdd39afcc8bbfd997e2c695219ff00b6208dc0c058e570401e87d6babf02dffc5df03cc0dca36a7127caeb24c49c0ee01a874a095e121c655a4973c59fa4f6b751b3020f0c38c1abcb32640efd78af9e7e1afc40bfd52d226b90d14e464c6dd41af5ed2f5492e15496e7deb0e7e57ca6ee9bdd9d81dbb3e5193dea1f3a38f273c0ed551666d9907ea6b1b5abe3147b50e3d1aadcd69633506f43526d7600ce878e33935ceeade32d2ecc133dd471a8206e66007e75e7de3ef125d5adbf97033f9d8c96515f317c67f0bf8f7e21c623d22568a3c8016597cb19f52055c7967a498dc651578ab9f626b1f10b45b380a3dec058aeedab200d8f51ed5e77af7c70f0fd9abc8d731ba46c164c9e541e87debe33d17f658f8cf73a807feddb5789e331bb34cc4aa9e80122bd0b43fd8cfc70d1dc0d5fc4162629176ac0bbdc281820e4e3273fceb5f6587fb52d0e753c4c7689e8fe22f8e7e1d94971abc368928215b20f3ee2bcd35ef8bba45f49e45edc451ccbcc7708c0a48beb9e99ad4d73f631d46fada3326b7bdd4050a630108ee081ce3deb81f1c7ec6bae7f66c9169faa5bc98c94b7c3285e39c13d3e950e961b4e57a9bc2ae2d2f795d1d15cb5beb5a4cb223acb132fcaca7208af8a7e34f8722f0ef8c1cc63f7731de401c67bd7d03f09f47f14fc3dd664f0c78836c965206f265dfb82b0ec4fa578efed2ac478acc442feefa329e315a6193a751c53ba32c5cfdad15292b33cd5a2824d35d93a839c7b552d0edde7d46309d770a96362f6c38c961e95d1f80747fb5ea41f180a7bd7a15e6a14dc9ec7165b879e2b170a34d6ada3d63458de3d3e20fd715a1c7e34c8d7cb455f4a757e555a5cf37247f7865d46587c2d3a52dd24251451589e9051451400514514005145140051451400514514005145140051451400514514015f50845c59c884678af0ff001162cef254c60e4d7bc95dcb5e39f12b477b6d44cc07cadc838afa7c92b285574df53f10f13b2d9623050c5455f9373832db9f3ef5f50fecd3662eeddc38e3b57cbeaa7cc181dfa57d67fb30c420b505c60b115f5b89d20cfe69c2ff001523dcfc29f0e6da4f107da5e304e72322bdf74c8ecb42b10ee1404193c572de1dd3c471a4aa3b66b9af8b9e30bdd1f47912cad9a795810157d6be75d47295933eb614572e88f419be2800c45b44aa8bd5e43dab7bc27e384d7ae9224d4eca2de40fde4aa833f89af98fe0dfc13d77e33ea8975e2dd7e6b2d2fa8d2aca428ec3b648c1af08f8ddf0c75cfd9ffe337da468d3eaba14770b2db5bde8796dee141fb92007907182320915ead0c242a4d29cec79588c63a4b9630bb3f4a7c49aa416775f649278ae09e0b23075cfb11c5731a95816fdfc09bc7538e6be79fd8bfe177883e2f78f357f14eb515d787fc3d2bb3c7a540f2476b193d151189c01d87a57d59e20f0dda780ef105beaab796cce2336ac72ca0f707d2a31183709b5195d23b3078a8554935691cc693a8476f32108011c640c735ea7e19d47ce58cfa8e6bcd35ed3e3b1be12db8060906e0474cd753e0fbe68f664f1c578bcee2f5677d5a519479a27b35aaab5b8e4038cf35c9f892631ef238c138c8ae8f4db806cf3dc0e08ae3fc5d705a194a8e70462ba6ad45caadb9e653a6f9da679aebda80b8b866e48538c1155ace2da9f6b910055e9bba7e553e931ade6b49048998d4ee7247181ef5d0e9fe15d2be217dae597594b3d3acee05bbdb472056909ef9cf4ed8a9a34655e4eccf56528518ec53d37c5b6de76c92f20b2830332cceb1a01dce49acdf137c64f0c6957022b6f1a6917e4601115ca3609ec79af9d7f6ecfd9ef50f0c6ada578c3c251cfa869f6ed1eeb50ed345b94e46f4c9041c60f183922bc67e0ff00c29f14fed35fb420f10eabe0fb4d1b44370b3dfc16763f65b350aa06d54c0eb8e401d4e6bde86069ba1cd29ea7cdd4c6c956f721ee9f72a7c4efb42a481e2b8818f0f11c823db1c55f1ae41aac7b9304ff0012b7506be7ff00da03e037fc2a6d4df54f871ae4967b8869342321787df6824e33e82ba5f845e21d5f57d1e27d4ed9a0b8c0dcbb7041ef5e1d6a3ecb58bd0f730f2f6f0e6e5b0ff889e0db6d4ae9ef234d93afcc368e38af823f6a88cc1e3483030248b711ef9c57e9c6a5a5992ccc8475538c8afceffdb23c3335af882caf02e63c321c7d722bb32fa9cd3b1e5e651e5a6783e971a7d80ce72c549520f4f6af40f86d66cbbe5742b9e9915cf7c2bf06dff8db581a75bc52490806472a0e001dcd7b1ff640d11bec850218fe53c7a5699b62951a3c96d59f57e1fe4d531f99ac427a5377128a28afcf4fec10a28a29005145140051451400514514005145140051451400514514005145140051451400aa326b375af0c8f13c696ea9be52401eb5a5ef5b1e119921f1158b3fdcf306735d142a3a552335b9e3e6f85863303568d4574d33c13c55f0eef7c37ac22cb032c4cd80c4715f497c03d24c76f110300102bd13f68df8776e9f0d6c75b8a0507786040e715cb7c006f3b4d47038dd8afd0fdbfb5c3f3753f88a786fabe3b916c7d57e19847d922523b735a7abf8520d523cf94bb9470c466a2f0a440c310c73815ddda5a891476ed9c57cb395a7a3b1f511f751e456be01974bba1736cf35a4c09c491311f4aeba1b2bdd62386df5991b55817044734609fcc835dfc7a6c678d991f4ad1b3d2cee18518edc57653a9393d199d4f6735771d4b1a2d8e8e34f580d95c5b26dc058a5d8bd3b8007e7556ebc2fa1796d9b45763cee6258fe66b6a1b311afcfc0c724f4ac5d6f501231b7b5195e8580af5275b963ef1e653a7ef3e5d0e0755b35595eda3c8b743f20ff000abda0c6d0cc98e9db8a9eeac0a819e5f39356ec6d8c722123f2f4af9f9cb99bb1ec46c96a775a2dc3b5b9c9e31d2b9ef10379d90dd338e38ae8747015718e318ac2d72df75c103d49db9a73ba8a673452e7670413fb3efe4401bcb9815623b67ad761a1683a245671a7f6741264e4b05c127dcd51b8d2f76c23f12477ad8d27ccd3d9030dd07a63a56f87c47b396a3ab1e68a5166abe9ba4476f83a424bd0e3ce60b91d300e45717ab6972fef52cdee34f859cb08e07c75f71d6bd3ed6ce1bc88491907239a82e343e4fcb9e3d2bd5ab294a3eeec7053e48caf2dcf0f6f86905f4825963926909e6490927f3aebf4bf0ad96956e0240a0e30c702bb6fece18c6318eb54ef2cf6a1eff8578951492dcef95572565a1c17882dc2db3a28f930485af873f6b4f089d616de3456cc8c555bfdaed5f7878907936ee48e718cd7cdff0016bc32de24d4f458538dd7c9b97d549e6bb72e97255dcf3b1b4fda51b75393fd8dfe025e782fc2fa8eafadc423b8ba888895872106483f8e6bc8be204622f166a0abd04a71f9d7de9e3c9e2f04f853747f2c496c2351d3a0afcfcf115f7f68eb177719cef909fd6bcccd2b3ab2bb3f73f0db09ec6152696865d14515e09fb90514514005145140051451400514514005145140051451400514514005145140051451400b53d8cdf67bc824feeb83fad414534ecee6738a9c5c5f53ec2f8a11c7e2ff00d9a50c041920803607b0af08fd9bf074351dc4a41cfd6bbcf851ad0f167c3ad47409ee9a2904651413c608ae27e08599f0eeb1aa69129f9edee0e3dc13d6bedb0757dae19a3f8ef88702f2fcd6507b5cfb03c1f085862f5c57a2595bee415e73e0db94f250e7b0af47d2eec32803f2af1e715ccee7336d58dbb4b11b466b4e3b748d7a741daaa5acc36815777129c739aeda6f9568724eed99daa3b4cbe5c7d318e2aac3a70b787247279248ada86d8672473ee29b7d01923c01cf73ed4a4a52bb7a89492f74e2b5168e391c91c0aa9a6de25c5c60738e82ab78a75016b746d10e646e78f4a9bc2f63e732cc570738040ed5cea274c748ea77da542447d7b66b335bb7fde647272726b7f4fb731c400193d6b3f5681fcb72473d491d2b79c7dcb1cea7ef339ab7983828e7e607201adab285278c82bc138fa572d7138899cfdd319c907fa5761e1f09716e9223ef4703071c7ffaeb08c2ed1a4a56571f0c5369edfba242938c76ae86c6e04e9f3f071800d576b42f19e33e9c63f2a48e3301e1b06bb69ca54b4e8724ed515fa935e5a8552f5857d85523f2ada92e098c823a573dab5c155200fa9a9ad24caa57ea707e33ba11c241fa1ae07c37a3c5af78c2d03c5e688dbcc1c74c77fc2baef154865f37904638ae77c0f0c6bab4b3c974f6e982a761c123eb4b0deede5d8deb24e2a3d594ff006b9be4d37c0e8913805be5af8219b7b163df9afa63f6aef1b8be7834c8a4df1a93c1393c7ad7ccb5e0e327cf52e8fe98e08c24b0b95c5cd6b2128a28ae03f420a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2803b4f85bad3e97e228a1dfb23988539aedf57d2dfc1ff1544aad983508c393db35e356b70f67711cc8487460c0fd2bd5b5cf1859789ecb47b812edd46df0acbdf15efe5b885197b393d19f8971f64952bb8e36846ed6e7d29e0bd40342983fad7a369ba808dc0cfd39af07f02ea8ed6b110f91804d7aae8f7824553bb24575d6872c9d8fc6a0ef1d4f51b1bd322820f35d169f20b8e0fa735c1e8d79e628e7ea6bb2d2641c1cf27b5452bdf539eadade67470da865cff4a8f5bf22c34c9ae1c6046a493d2ac5ace15327e9587e38125e787eea2846e2464a8ea715eaa5150f33cd577349ec7995968afad5d4b7f2820ca7209ec3b015d9787f4d58088c0f907404f6ae6a19a7bbd3d23d3af61b670029f39738fa8e2a869fe22f12f876f253ad5ac375611b7177644e76fa94ea00ef8af3a34db7cccf565272565a1ee5a5e9e1f0321011d7af154f5cb016ec41c1e2b0f4ff0016417f671cf6b70a636190c8d5575cf171923f2add5aeee7070abebee6bb65c9285ada9e6c63252d4cbd4344fb416650013d78ed567c1e3fb2ef4d8cfc4521cc6c7a03e95e776adf14f50d7a69658b4cd2b4b4198e16cc8ec33d49e00cfa576da55cdc5c5c5aa5c84374ac0b79678e3a9ae68d3953926de87749f3419e9a2d91401d71d326a8de403271c56942c248c11c9c564ea1379648cf3d7ad7555b2573ce85dbb19b7521404138e3bd723ad6a25564f9ba0addd42ebe52739fad79f789b503b5c7735e649b93d0f4a11ee723e20d49a65906703a1a8afb4dfecff04bdfa3ec9705b39c5729e3bf1341e1db533ce781c9af26f1e7ed1cdabe87fd97a7a18e3dbb49aaa9563469d9bd59f5192e478bcd6bc674a37827ab3c97c79ad4fae788aea69e42e439039f435cdd3e691ae267918e4b1c9a8ebe6652726db3faa30d4561e8c29456c828a28a93a828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a005a96de530ca8e0f20d45da8c62a9369dd1954846a45c24b467d13f0a35d1756c899ec075af6cd16e042dd78c74af923e16f893fb3754481ce031e335f4ef876f8dcc48c2be9e9d455a9a91fcabc4195cf2ac7ce9b5eeb7747a76917843020e0576da5df6dc1ce7f1af32d22e0a73fa575da3ddfcb93c566db8bd0f9a9252573d36c75058e0f9ba11deb3f50bf0d924f1d38e95811eaaeaa7246d03d6b16e3c442498a03df1cf4ad9569492491c8a9a8b65ad47c3f6379742e31b25ebb9091fca960b558576296719c1dc723150acce645f2c6e04649ab50dc7ef946d00fbd6d17d19a3949e88d783e1dd95e41f6c8336aecdf3a44c555bdf038cd6ab6836fa1e9c3ece8379e4bf539fad3adfc4496f6b1c2f079813a629b77adbdc599444d832701857637051d3738bf7ae567b1ceddac97cad1b5cbc7cf55356741d3e0d34b323991d8f2cc727f3aa570a660e7ee9cf6a8ed6f7ecf279651ba70c7a5707339753b6eed667796da8796076155358b8f31720e3f1ae7c6b181b57ef62992dfbc909de7e9cd4caa36accce3157e6443a85c6d42335c17886612487e6e9d6ba1d46f8ed393818ae07c497fe5a48f9c000926b1a6aef537499e01fb436bdb6dc5a29e58f2335f3dd77ff001835efed6f113a06caa135c077af1b173e7a8edd0fea6e13c17d4b2ba716ace5a8945145711f641451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145004d6b70f6b3a4ca70ea720d7d39f0a7c5c9ab693165ff0078a00619e41af97abb7f85be283a0eb891bb7eea538c13c57a183abece7caf667c071864eb32c0bab05efc353ec6d3efb681cf279aea74fbedd1fca7f2af36d2f5459edd1c1c82011835d66897424c0cf7c1e6bde9d3ea7f347335a33a49351964fdd8271eb47daade1c2c9b41ea493cd2c300eb9cd626b1a5a5d2b6f2d9ee01c5553e595a2f439dc5b774685f78e20b2464b601c818dcdeb5816fe28bdbe98bb49819e369ac2921d384de54e8c0a923862323deb7f4ef04d8ea0a8f6d3f95263390c4104fa577aa518eda9d7493b6f63abd2fc557960804bfbce382466a4b8d76fee32e4954e48e6a3b5f8697b1c08e350723193f306c8fc4525c7c34bdbcc0fb7b118fe2908007be2b5f66baa2bd9dfed220b5f155dc121120574079c9ad25f14595da0f9c23fa13deb96d53c296da3fc97771e6b29c11131048c7041ae7235b0fb52470c6ecc480599c939ac5e1e12d53b19558bef73d263d444b2e63901f6cd4f71a93aae1ba1ac3d2f484b450416248cf273572f24f941ed5e7d44af65b18c62e3ab296ad7a7cb3cf15e4bf133c4e9a6e8f39df86da40e6bbaf106a42146e40001af963e33f8cfedd78d650be429c360d63524a8d2727b9f51c3d96d4cd7308534bdd4eecf30d52f0df5f4d331c9663c9aa7da8eb457ccb6dbbb3fabe9d354e0a11d9094514549a8514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400bcd490c8d0ca8ebf2b29ce6a3ab1a7d8cfaa5e436d6d1b4d3cac1555464e6aa37be865539791f3ed6d4fa2be15f8ba0d5b4e8e179479eaa015279af5bd2ee3cb914a1e3dcd7c9daaf817c51f0fef239edd585dc28259211dc1e718af62f85df13ad7c596ca8f218afa1c2cd0bf0411ed5f6b4e9cfd8a72dcfe3dce5e1e198d58e15fb97d0fa02daf98460839e2a512099b2fdfad61e9b7693429820fa62b5e3014ae4d7138ea79d1b99dad786a0becb85c719dc2b334f86e34bc0497233d09c1aed6d63fb415006455d7f07c57ff394f9bb115d14eb4a3a15f0bdca5a678d3ecb6e239081c6339a2e3c6c4c2c2390fcc3d7153dc7c397954148b8e98a55f87e638c0fb302318e95dded5db621b8b387bd927d6e7e5f3c9c8cf1f5ab9a4f87d2c58394de73f78f5aec2d7c2496320ff47ef9231daae5fe9eb1db931c6138f4ae3a959caf1d816e63bdcf9788e35278c66b3b569bc884e4f6c9e6ae2dc796d8230fdf35cdf88ef7733206ebd7d2b9a11b84b5d0f28f8b5e361e1fd2e5c3fef640428af962faf24beba92690ee773924d7aafc7ebc79355822cfc801fa66bc8abc6c6d472a9cbd11fd23c119752c2e5d1c425ef4c4a28a2bcd3f480a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2801c06481d6bebdfd92fe078dd1789755b7dd2be0dbc6ebd07ad7ceff073c25ff09978f34eb164df0f981a4e3b035fa8be0fd060d07498888c471c4815140c0000afa6c9b06ab4dd59ec8fc57c46e229e5d87580a0ed29eefc8f95be2b5b86f8b1a8a70446aaac31c74e95e79e38f8277170cbe24f0949f62d5e105de05e1661d7045773e20bc3ad7c4cf105c13d6e8aae4761c576fa0a946e0f7c106bd7c65574eb5e3d0fc230b4d54a094b53c6be117c5e37d72746d6e23a76b50b624b7938048ee09ed5efd67702fa3571e9815c07c56f813a77c42b51a8584bfd97afc20b457118c1247638ea0d79ff0080fe2c6b1f0f7541e1cf1bdbbdbc919db1df30f91c0e0127deb97ddc42e686e6caf4f4dd1f4e69327d9e501871ea6bb1d2eee391b68af2fd2fc4d69aa4693dbceb246e32190e4574b63ac246ea15f27eb5cf694596ed2f53d4eddc346300631839a94c6823232307900d7156bad30c7cff00ad4f36b4f2601703e86baa3595b638dd277d197b54b88e16278e9d6b9abdbaf3036391e9516a7aaa48797e0702b1efb5448232c5c0f6cd72494a72b9d2b962b7d4cfd5a610877270476ae661b17bc324f28c21c919adeb7b39358b8124e0a5b039c9ef4dd736471f9708c2018e2a79bd9e8b7348a72777b1c1dcfc27d23e215e5c5addc7fbc542518751ef5f2e7c57f86b73f0dbc42f672866818e63931c115f67781ee8da78d2ce371f2cc0a1cfd2b0ff00696f8727c65e11bdbcb64df75a7b93951c9039c574627031ad85f6d15ef23eeb84f896be5f9947035e57a53d1791f0a514f911a3919186194e08fa532be3cfe9c5aea145145030a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a280168e2940dc303ad7aefc13f817aafc42d6ad659ed5e1d3b7025d948ddf4ada8d19d69a8415db3cccc330c3e5b42588c4cac91e9dfb17fc35bdbad5a5d727b76483858d9875afb1fe27788a3f06f84e49e4709215db12679271e9e82b73c09e06b0f07f856caced2258d63201da315f3ff00ed21a8de6a7e2cbcb30e7ca8008d573c0e0671f5afd1b0b45606828bdcfe39cfb347c4999cabed1e9e879068b2cb7bad5cddc84979e532161c0cf7af4fd199245c1e1ce0e40ae4b41d28476d182363039ce39fa5761a3c4237007503a578389a9ed24d9dd4e9a84145743a9b7c3280410718071dfdab99f1a781f4bf17da98354b449c630242a33f9d75da7fccbb48e3bfff005aad5e69c5a1f97918e95c11938d9ad0cddaf667ce0df06f5cf0a4ce7c33acc96f113b85bdc1dc9f41e82aed9f88bc7ba448a975a22df9538692da418c7ae0d7b64762cd91d474c1a7ae96a71b50a1ee715d6b1527f10bd9c51e696ff15358b18c7da3c3fa88e07dd8f773f85593f16358b85091f87f50dec71968f031f5af4b5d200d9bce47b8ab71e9702e588cfa7155edd7632708247930f1078a7526023d29a019e1a56fe95d27867c377f7b7492ea72ef39cf96a78aec2f2250b88a303f0e6ace8b62705c9e6b295794b44ac2e48c6377b915c46235f2906d5518e057397d0991b0477ce6bb69adc2b65f073d33581a8439c9c7e02b9d5ef766b092b591e79e229ae34354d4ed87ef6d1c4a31ce40ea2bd23e14ebd69f143c13aaea4887c8bb778ca3ae0ee030463eb5ca788ad526d3e5427ef29041fa5761fb33e9a20f01595a2a08c9bc983281c9193cfe35f49819735395367978cbd39c2bc74699f9e3f14b441a078ef57b309b15276da07b9ae4b9afa57f6c2f83fac68bf12ae751b5b0967b3baf98342a4f3ef8af9c6eac67b198c7710bc0e3f85c106be1f134a54aaca2d1fd8b91e61471f81a356134db4ae57a28a2b90fa00a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a9edace7bc9447044f2b9380a8a49a64ca4a2aef621a2bd3fc1ffb3978e3c68c86d34892289b90f282a31eb5f4a7c2eff827ec8cd15cf89ae77f209857815df47035ebe918e87c9665c5594e5716eb564dae8b567c55a5e877fac4cb1595a4b70ec70046a4d7b3fc3dfd90fc67e366479ad9ac2ddb04b4839c7d2bf463c15f007c25e09b78d2cb4c84ba0e1d94139aef61d3e1b3509144a8a380aa315f4787c8e2b5ad23f1ccd7c52a93bc32fa765dd9f267c38fd847c3ba0c71dc6b6e6f665c121beee7e95ee9a5f83f4df0eb0b6d3ad63b7b78542a855c577da82edb703d4f22b1fc91e5b9ee457d151c2d1c3afddc4fc6f34cfb30cda57c5d56d76e85db38bfe24bbc7254e7f239af9c7e3968c26f1cdcca0031cc23941c738207f857d33a0e24d39e33ea463dabc63e2f686e3508a729f763f2c376c8391f8e0e05678cbfb27639b2e928d6573c6edf4f1b8e06d183d2b62c6c4ed0554678c9c76ab36b6e37001319f515b56f65b7385f6af9295ddd9f67cfcaac8769ca15803d715b71c3b949c67dab3ede33160019ad1b5f41d47381592ecce59bbbb949ec409b206ce79157e1b3438e067d69f34264ea36e3bd496c8e8c01e94d46da12e4ec37ec28edd3207ad364b748c600ad4dc31c71c73503b062536fb66aed66426ec60c900f3865739ec2b5218d228b00727a6053bec21a6c9c900718a9655112e07048e68b34eec6df319f71b998823a0e0d63de5a175c2640c6735aff0036ee417c9e47b525d5b9dbc21031d052dca8cb959c3ead65ba3607e6f535e8bfb39d89bad32490214860ba68d5bb31cf247f2ae4f52d3e791563b74f327998471a6792c7815f41fc38f08c5e15f0fd85846306319761dd8f24fe79af772e8bd65d0f2f32acbd9a8f519e2cd0acf56b8c5cdac73803187506bc9fe217ecb1e10f8a160dbecd2d6f00e24886d39fc2bdb7545cdc39f7c555b390dbdc75e339181dabd7a9469d58f2cd1e660f33c5e5f5154c354716bccfcdcf8a9fb0f789fc1be65c691bb53b704e100f980af9db5af0cea9e1fba7b7d42ca6b6913821d08afdc69238ae530e8b2211dc5705e34f823e14f1b4322df6990c8ec082db066be7b1192425ad1763f64c9fc4fc4514a9e630e75dd6e7e31515fa05e39ff827ae9b7d3cf3e8d78f6c5892233c8fa62be7bf889fb1cf8d3c17be5b7b7fed18141398fae3e95f3d5b2ec451de3747ec39771a64d98d942b28c9f47a1e034568eada06a1a24c61beb296d64070448a456703835e6b4d3b33eda1523512941dd79094514549a0514514005145140051451400bc515b5e15f096a7e31d522b0d32d9ee2690e3e51c0fa9afb0be14fec122ee086efc493b1270c615e07d0d76e1f095712ed4d1f319c71165f9246f8ba893edd4f8aecec2e6fa4096f6f24ee780a8a4ff002af4bf057ecdfe36f1ac91f91a5c96f131ff005930238fa57e95f833f675f07783e08d2db4980bae3e668c139fad7a4586896d62a12dedd2300701540afa2a391eceac8fc7332f14f78e028fcd9f0af80ffe09f72cde5cbae5f1c9c131a0c0fa57d17e00fd94bc19e0968e58f4f8e59d71f3c8a0f35ee71d9f4cf1f41521b7dbd057bb472fc3d1da3a9f95e63c619c6657556b349f45a19fa6e8369a7c612dede38900c0daa0568189500ee6a458ce3ef76e829769dc0019f7af436d8f8d94e537793bbf32158b79c1e3d875a46b725b674ef560a6d9d0e79a6798d7131d9f28ee7a9aa23c8cdd5e22b0c6a38c9e4d65ac7f2e2b5b556fde05ce428c7e3552187e5c9ebd714d8ac2e807cb96442300922b23c79e1f4d4ed6e222b97642e9c73b87a7d6b62c4797312383bb35abaa597daad9644e5d7e603f9d67522a69a7d4da9c9c1a92dd1f31fd8cc770030c9fa74c56a436ff00211919c678abbe38b1fec3f114831e5c17077a0231cf71f9ff003ac7fed58add880416f4cf7af8fad1f6737167d95393ab05244b2c5e5f51f89ab168ede67a646062b3db54f3b81cfd6ae5bb962091823be6b9b4be869adaccd88612ca73cf635623b7dbd81e00aa70dd908148e33d055dfb50917a60750c6b656b193b8d684eec0e45482c4ee00739eb9a9fcf8f6a1ebc72452b5fc7c95c7d3be6aac9ea4ddf413eca234ce41358faa4986c0ebd3357e6bb27249001ed581aa5d10490323b544ad6b22e3177d4d0d3ed830dd919ea73535e2a2c6492a001935cac7af4903608c7e35d0f84ed25f186a22dc0616f190d2b638c7a67deaa8c5d4928244d5fdda7391d47c34f0b2de49fdb373170848b65619f62d8f53d07b57ad59c5b707078524fe3552c2c63b58238900455000551c6056a46a16391bdb1d7d2beb69d354e2a28f93ab55d5939330efa3dccf9f5acdd84363b839ad5b9e5981aa5343dc7045741cc6858112c783c3a9e39ed565a139dc7d3ad6659cc6391587054f22b6e6c88bcc5f9971c83fd2a5948adb06d19e7deabdd69f0dd464491acaa7a82055d55dd189074238a6b400f3c83ed4bd469b8bba3cafc71f007c27e388dc5ee990976046eda01fcebe61f895ff04ff8a6696e3c3d72623d446dd3f0afbc3c9cf5e7dc75a69b61eb91ef5c35f0342baf7a3a9f5796f1466b9535f57aaecba3d8fc78f1afecd1e36f05b4867d3249e1527e78d49af30bcd3aeb4f90c7716f242e0f2aea457ee3ea1a2da5f4652782390370432835e55e3cfd9afc1fe33b59567d3218e5707e74400e6bc1ad91f5a523f5bcafc52da19852f9a3f2168afa97e3a7ec65a9f81e39750d095aeed1724c6392057cbd716f25accf14a8d1c887055bad7ccd7c3d4c3cb96a2b1fb7e579c60f38a2ab612775dba91514515cc7b62f6ae8fc0fe04d57c79acc1a7e996cf2bbb60b0070a3d49aeabe09fc15d4fe2d6bd1c30c6c9608c3cd9b1c63b806bf497e10fc07d03e1ae9d12d95a466e31f348c3273f5af6b0396cf14d49e913f33e29e34c2e4317469fbd59f4edea607ecedfb3b697f0cf41b792e2dd25d459433c8cb939af7b8a10a1401803a52dbc2380074ee6ac08b3eff004afbea3461462a105b1fc9998e6388ccebcb1188936db08d517af35697ee8d82a065299e3e5a7c637f20e067a56c7965855f7a18161803f1a1172c33568001703ad4ec515d5be5391d0726921ccd2633803ae29b2e791ea6a6b55daa28d810cba6f2f791d71b467de9b631e23271f8d17bcc800edc9a9a11e5db13ed9a7d03a98775fbcb863fed50aa064fe54e237313ea734ac36a7d69ea495ed97f7df8d6fd9b0684a1e40ac480625fc6b4ade40ad9e87192450f5452398f889e01b6f17e9af11dd15c4677452af553dbf03debc067f04dd69f7924173b84aac411d463b63dabe94b8f150b5d58c1796cd040ca025c3124313d4103a543afe8365ae5b80f0fef319491793f81ee3dabcec561156575b9ea6131b2c3fbaf58b3c0ec740915be53c770dcd6e5b686f1e090a48fad74173a2b695398e519e7e56e991fe7b54caa1a31f2e7debc1f63eceea4b53dbf6eaa5a4b5307ec11af39d9e9cd4536cda712648e06e5e3f4adabab70d9d841ce0915972c67ccc0041cfddc56538f2ad0d232e6d5941ae1e3006ccfa601fe54f134adc94fe9c54ff666dd8273ec29cf0955e0e3f0acecd1774536f31d95422807b6726a55d0c5c2ee76fc3b53d7e46058d685a8f31408c64b1c00064e6ae31e676dd8a52e55731ffe10d7bab848ed2212cae400a7fad7b2785bc276fe1dd352381115db972bfdeef54bc17a19d364fb4dc0dd70e061473b47a7d6bacb7b2936845fddc60924b724e4e6be8f0b875463ccf73e6f178a759f2a7a21f6f6a3a971c7603bd55b5d7b4cbc9e7b282fe09aee26db2421b0c0fa62b5bece238fcb4eff00c5589ab781f4cd433298161bceab7318daf9f5c8af4159bd4f3bd0af79f24edd473de9ad86c1ce78aceb5babab5bcfec9d5c83704136d778c0947a13eb5714b231471875e083eb56d3241976b6471ce0fd2b76c9fceb5c1eb5931fef24ff007b8ad0d37e41221ea391f4a87b148974fe92c47a64900fa548d198d8819c638cf22a1b77d97841e370eb57665079a5d4114f07711d0e338f5a63abf718e71561903104751de9ee01073e9eb406a674ce79006e3ed55195f3900fae2b419b6fca3927a7d292188b3f5cfad56a1a987a869d16a56ed15c442589860ab0cd7c8dfb447ec6b69e244b8d5fc3b1adb5ef2c635180c7ad7da6d6ff00bcc1e3dea192d03020ae45726230d4f131e59a3deca33bc664b5d56c2c9aeeba1f885e2bf06eabe0cd4a4b2d56d1eda6438f981c1fa562f35fae3f1b7f677d0be27e953a4b6c8977b4949954022be25bcfd8b3c4115dce8921d8aec17e5ec0f15f1789ca6b529da0ae8fe9ec93c40cbb1d87e6c5cb926b73ed2f827f0aec7e1c783ecededadd6390a832363924f5cd7ae5b4657031d8605362b611aa201803008ab8cbe5ba11c738fc2bef69d38d38a8c55923f933158aab8daf2af59b7265b8630ca081dbf5a9638f18a6c3f2e454c07a556fa1c835972ded8a0a8c70307daa465ef4de86958023257eb56579c1f6a876f7fc2a78fa0a4522b5c7caf53db9c8a86ebef0a9ad47c9ef55d05d4af37cd313ef52ccdb2c5fe94797967279a2f3fe3d0fb903eb46a3d4ca64f971ef4d978c0a91dbd07735049d2ac91b1e4c800ebd8d6cdb5a9859378e08dc33eb55f4ab1dede638ff00f556bcca3e43e9c54dfa1455bad3e0bb8d9258c4887395619ac29749bbd072f659b9b3ce5add8f207a8f4aea14734ec734af6d02c72b2456dac5b992302503ef238f994fa1159ade1183503b2da7fb1ca3fe5938ca37d0f51f4ae9352f0f9790ddd8bfd9eec72463e57f622a84778ad304993ec77a87956e037d0fa1a89d3854dd1ac2a4a9bbc5d8e5afbc0fabda9cf90275e81a26cf1f435992787aea3e65b5950f7250d7b05bdc978c14ebdd09e87bf35615d665c8fcbdeb8258383d8ec8e366b73c41b4ef2db1e5303fee9a747a61998048890782154939af6b78d0ff00029fc0540d2450b6c445329e718000f7350b051ee69f5e9763c9d7c277133a27d92440c71971815d2695e13b4d258103ccb803961d067b01fd6bacb98ddb08afbe56e4b7b7a0f4a68d3ee57250c083030cc0b1fe95d14b0b0a7aad59cd531552a2e56ec259daed0084c7b9abab3a3bed4f98e3271d07d6a9dbd8c8ca4dcdc49273c2afcabf90ab7611858dca8c0624815d7ea7212eddbf5cf343fddc53a9add28033b58d1e0d6ac5ade61eeae3aa9ec41ed5cf46b3be6dae462fadc7deff009ea83a30f71debb151f28aa1ab69ab7918746f26e62398e551c83e87d41ee29af311850b8fa7f88ad1898c52861c82304fb1ace47fb44850a791780e5a12786ff690f707d2ac43371b1b8c1e38aad7a925ac6dba07f1e6b4b76e5fc2b3233bdb9fbd8c7e157a2932b8ef52ca4247f78834d933baa465c3eea4906eef486572bb79c7e34b64b9cb1e79eb44dc444fa0f4a7d8ff00a914fa004c3e6cfe5510e24cf63d6ac4ab9c9c543fc548082ea30548239ac936b031cec1f956e4806d24fa62a1dbe8a31db8a7ea1aad8a10aeee3be314f9be6854f421853a35dac0d175f2a640e323f3ad082eaae3b76e6a43eb4d8fb53c7f5a90258f0c3a7b54337cb27e3daa587ef62a3ba187cd4f52ba0e4f9b8a993b71f8557b76f9bf0ab0adce28608ad77f780fe9566d78519f5aab73feb80ab56a3e514fa07509be507eb55af9b31c483d73f90ab575d7f1cd66de49f3119e1063f1349032ac8db8fe3535a599b87048f97a8f7a2d6c5ee64c91f27503fc6b6e384431803af738aa247428234000ff00f5d3a51ba33ed467a7d6958654d2d4b18a7a53fbf4a8173903daa6f7a4c07fad56d434d8752b778e445248e1b1920f622ac7f15397aff5a00e7ac6ea6d3a65b6bd1b24030b27f0c83d41f5f635aecfe5b8953b8e476fc6a7bab586f2331cb1ac887921866b3db4d96dc66da67641cf9321c8fa03d41a377702edc5e22c7194193236d1ec719aac600cb90590e724a9c1a82261712a49c8da49da7d718e7f3abd04665907f747534f5024b4b7d837312e7d5b19a91db7703a548dd30bc76a8fa548114ff2c67f214f8d3cb8c0fc2a39986e45f539fcaacb7dde280194c76a7d32419a004cff009cd0df74d285a194ed34019f269f05fdbec95325492ac38653ea0f6aa37969716bfc3f6c8f1c6085940faf43f8e2b5ad72bbc63bd24e37b629dc56316d671262442c514ed75752aea7d08ad18ced6f6fad22db47f68f30ae1f18dd9ea07afad39976c9c74a186c4d49f7ba8c52d038a432bdce15081e9d29f663f7231e9505f9db1e47a558b0ff0050bf414fa0ba8e99b008ef507f15599875a876fcd8a43229cfeec9a66f1e868b86fba338cb0cd45e693ce2aac2b90c5ca81dfb5175c4041f504629231b5bf1a96f17759b73d3156493c2d9c7d054d17de6fa555b6238fc2ad4632d52c0923ff594dbae4934abfeb3a532ebee9353d408adce14fd6ae22f19f6f5aa56e72bf8d5d760b1d53291564f9eeb8e9576dc6d5aa56e37485bdeafc7dbeb52c111dd1216b36c6d4dc7cee0e739f98743f4ad5b8e569214217de8d90752486311ae00a7b9a545c2814351d46341f96a4fe134d1d29f480acdf2c9532fdd1f4a64cbce7de9ebf745003bd314ea6f614ea005ddc0a4e695572b51ccfe5c2e57efe303ea7a556805258c35c4a53a39c7b71d4d6946bb23c0fc2a9c10ec5da0f38c73c0ff0026af47f7476ed4b4b802a93d69acbf362a406a37fbc69015a4e6e507a024d58615120dd704e3a0c5586a008db85a653d8d3377cb4980ab4a7a522d1fc34c08216f99feb448a3348bf78d3e5fbb4b502164c60e7151759304d4e4fca7f3a8181f3298992514a3ad249f74d0333f507f97f1c62add8f11afd2b3efdbeefd79abd64df28fa629f41752c4dd2a06e1aac4c38aaf27defd690cad74034883a739a8fe5a797ff4a39fe153501504938354896361f997345c37fa2c8454563279b1ae39e2a4b8ff0053281d31cd589925a3702af43d6b3ac5b28bfe7b55f85b152c3a920cf983eb4cba6db17bf27069f1fde1f9d57ba5ca93d48cd00476b27ca055991cedc567db3723f955ff00bded4dee0490c7b501ab71b74a8241b5463e952467a7d2a3ccb164a7afcb8a63f514e1da901283d2969a0f029d40099a7ad33fc696801b28e9f5a55fba2865f96913a50049b78a3f8685e94bd8d002a9e1aabbe64b909d97938f7ffeb54fbb6e7e951d9afcc5cf5624e7fcfb628024963eb8ebf5a585595483c7b549fc5452b0077fc6992704fd69f5148dd698096fcc8e6a5ce2996ebb533eb4a2801ac6994ac6931851400ab4bfc3480d1ba802151f31fce9f20f96907df34e3cad2eb70210334d68fe5a900c3518ed4580846691bee9a7afcad8f7a8666ea3b734c0cbbaf9a418f5cd5cb193a03e98aa4df34df9d4f64d861f5c55bd883525e9f8556b86dadf854f237f2aaf7433f95414ca81775c48075c51ff0001a58be6323fbe2a069be63cd5ea499fa5cbe5978fba922aeb36eb7973e86b3df36f7c4f40e07e756d9f6c4e01e083541a92d837eec7d2b4213c565e9ffeac1f6f4ad28734981623ceeaa970cdbb18e3bd5956c1cfd6aaccc79a480aa9f2b03ef5a109dec3d2b3c751f5ab96cdf3707de9bd80b931e69616f96a391bf952c2d86a9e85752c49c7e54e5fbb4c6e47be053973c7d2a464bc607d29dfc34cfe114a0f1400ef4a5a6f4029d400372b8a6253e99400f5e99a5dd480f5a3b5002337eedcfb1a7dbaed51f4a63ffaa7fa54b1f1400e63fce97f8a9a39634e6fbdf8d00231e6a397ae3de9cdf7bf1a6b7327e34012af0a07b527f17e34bdbf4a6b7dea0089fef0f734e6e94c6ff5829cd40094beb494500307df34abd6971c9a683f31fad00368f5fad2b75a693fce8018bf7bf1aad70d963ed565bef5549bfd6367de92133397ef7e2454b664f983ea6a2c61b3ee696ddb128ad0935246f9b1ed51dc37cbf850cdd33f8d36e3a607a54e972b52bc2dfb973ee6a8b3f26aeeed96adcf7350ac6368e3b551251d4a32ca24ee0e69de606818ff00b356665125be07a565ac86249509ec40aa2763474f3fb907dab4a16accd371e4267ae2b421a18d16377354a66ea6ad6473f8d5299bafe5490c8c76efcd5cb7f515517e651f5356e0fb94d8752c39e9f4e6914d35ba0a456f9aa40baf9dbc7a03446df28a63b7eeff0001490b76fc6a7a145afe1fc28cd373c0fa52e690c7ff0008a5dd4cfe114ec9db400fa63636fe340fbb4bfc2680101eb4e07e5a8d5bafd29d1f4ffeb50039bfd53fd07f3a92a393fd59fc3f9d3875a7d007a9fe74e6fbdf8d357ad0c7e6cd2013be69bf7a6fc69d4c8ffd71fad004a4edfcf348e7e6fc686fbd48ff007bf1a008c1fde53bfc69abf78fd7a539bef1a006fad2d148f40073934dfe2347463487ef034008edf35333cd2c9d8d333d3e94008c7e71e99e6ab5c7df3561db1f5c66ab5c37cc681333836587d4f1483e59b23a669abfebb1ef52491e149f715aea497f76403ed4cb863fa0a646db901f6a2e9bd0f619acd6fa815e66ff004745eec7fad5e587e51c76ace8c79d34483b56cfcbe94d818b6ade60c1f4f4acbd6212a8e47a55d8a4f2e41e87834ed5230f6ce7fd927a5589ea86e96dbad93fdd15a5077ac9d25b36e9feee2b4e1639a1ea327cf3f81aa321f98d5c56cff8d529bef1fa524242293b47d6aec23e5aa28dfceaf42d95a18f5247fbbef4c85be63fe3448df2f1d6a38dbe6a2c05d66ca8fa5323623eb4bfc34c46f9a901701f9473da9d934c56f9452d416480f029ff00c35103f2fe34f53c5003b77cbf8d216e0d26ee0d35a4014e680157a1e6a453f2fe1551243cf153a3165a7611249feaff0011fcea51dea0627cb24f4c8fe753ad218b9c514d27a7d686a007546bc4869699cab714013535dbbfb534c9da9b23718f6e6801cb4a4f3483a0a18e2800dd4d63cd07d691bb1f6a003ebe948cdd3e94c6ec6919b95fa5003a4fe1a69edf4f5a573d298df7413e98a006cdeb54e66f9cf356666e055091bf78467b66ad0994c36d9aadb7311f739aa4dc4c3ea6ae8e517e99aad4919131181525d37f2a8dfef0c7a734972f8ebe94980ba5a799317cf0075ad132f26ab59c7f67b50c4f279cd546ba3b8f1dea4ab94e6eff005ab173ff001eb27fb9fd28a2ad6c4752a68fff001ec3e95a71fdefc28a28044abd7f3aa9375a28a1075191f5fceaec5da8a28631cd512fdf1f5a28a4848b63eed323fbf451486fa1713eeafe34ea28a965201f74d3d7bd145218d93fd59fa0a83d68a2ad6c4b163ab0bda8a28ea1d473ff00aa3f5feb5617a51454b286d2b75a28a402527f1514500364fe2a82527727d68a29a1227a46eb45143183fdda69fba28a29011c9d47d691bef0fa51450038fdd14c93a0a28a04c866ebf8567cbff1f1ff0001fe94515a224a327de1f8d5f5fba28a2983187ef8fa54571feb1be945149817dffe3d4ffbbfd2b268a2901fffd9, 'zulfandridwiputra@gmail.cm', 'Jakarta', '1996-04-30', 'Laki-laki', 'Islam', 'Sekretariat RB', 'Ketua', '081381838687', 1111555566),
(2, 'pilar 1', 'pilar11', 'pilar11', 'abc123', '15978', 28052019, 2, '', '', 'Jakarta', '2019-05-01', 'Laki-laki', 'Islam', 'Statistik Transportasi', 'eselon 3', '456', 789456);

-- --------------------------------------------------------

--
-- Table structure for table `users_detail`
--

CREATE TABLE `users_detail` (
  `id_user_detail` int(5) NOT NULL,
  `id_user_FK` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bab`
--
ALTER TABLE `bab`
  ADD PRIMARY KEY (`id_bab`);

--
-- Indexes for table `bobot`
--
ALTER TABLE `bobot`
  ADD PRIMARY KEY (`id_bobot`);

--
-- Indexes for table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`id_forum`);

--
-- Indexes for table `forum_post`
--
ALTER TABLE `forum_post`
  ADD PRIMARY KEY (`id_forum_post`),
  ADD KEY `id_forum_FK` (`id_forum_FK`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_subkriteria_FK` (`id_subkriteria_FK`),
  ADD KEY `id_kriteria_FK` (`id_kriteria_FK`),
  ADD KEY `id_bobot_FK` (`id_bobot_FK`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`),
  ADD KEY `id_bab_FK` (`id_bab_FK`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `lke`
--
ALTER TABLE `lke`
  ADD PRIMARY KEY (`id_lke`),
  ADD KEY `id_pilar_FK` (`id_pilar_FK`);

--
-- Indexes for table `lke_detail`
--
ALTER TABLE `lke_detail`
  ADD PRIMARY KEY (`id_lke_detail`),
  ADD UNIQUE KEY `id_bab_FK` (`id_bab_FK`),
  ADD KEY `id_lke_FK` (`id_lke_FK`),
  ADD KEY `id_kriteria_FK` (`id_kriteria_FK`),
  ADD KEY `id_subkriteria_FK` (`id_subkriteria_FK`),
  ADD KEY `id_item_FK` (`id_item_FK`),
  ADD KEY `id_bobot_FK` (`id_bobot_FK`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id_notifikasi`),
  ADD KEY `id_user_FK` (`id_user_FK`),
  ADD KEY `id_pengumuman_FK` (`id_pengumuman_FK`);

--
-- Indexes for table `pengaturan`
--
ALTER TABLE `pengaturan`
  ADD PRIMARY KEY (`id_pengaturan`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id_pengumuman`);

--
-- Indexes for table `pengumuman_dituju`
--
ALTER TABLE `pengumuman_dituju`
  ADD PRIMARY KEY (`id_pengumuman_dituju`),
  ADD KEY `id_pengumuman_FK` (`id_pengumuman_FK`),
  ADD KEY `id_level_FK` (`id_level_FK`);

--
-- Indexes for table `pilar`
--
ALTER TABLE `pilar`
  ADD PRIMARY KEY (`id_pilar`);

--
-- Indexes for table `sekretariat_rb`
--
ALTER TABLE `sekretariat_rb`
  ADD PRIMARY KEY (`id_sekretariat_rb`);

--
-- Indexes for table `subkriteria`
--
ALTER TABLE `subkriteria`
  ADD PRIMARY KEY (`id_subkriteria`),
  ADD KEY `id_kriteria_FK` (`id_kriteria_FK`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_level_FK` (`id_level_FK`);

--
-- Indexes for table `users_detail`
--
ALTER TABLE `users_detail`
  ADD PRIMARY KEY (`id_user_detail`),
  ADD KEY `id_user_FK` (`id_user_FK`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bab`
--
ALTER TABLE `bab`
  MODIFY `id_bab` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bobot`
--
ALTER TABLE `bobot`
  MODIFY `id_bobot` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `forum`
--
ALTER TABLE `forum`
  MODIFY `id_forum` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forum_post`
--
ALTER TABLE `forum_post`
  MODIFY `id_forum_post` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id_level` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lke`
--
ALTER TABLE `lke`
  MODIFY `id_lke` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lke_detail`
--
ALTER TABLE `lke_detail`
  MODIFY `id_lke_detail` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id_notifikasi` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengaturan`
--
ALTER TABLE `pengaturan`
  MODIFY `id_pengaturan` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id_pengumuman` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengumuman_dituju`
--
ALTER TABLE `pengumuman_dituju`
  MODIFY `id_pengumuman_dituju` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pilar`
--
ALTER TABLE `pilar`
  MODIFY `id_pilar` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sekretariat_rb`
--
ALTER TABLE `sekretariat_rb`
  MODIFY `id_sekretariat_rb` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subkriteria`
--
ALTER TABLE `subkriteria`
  MODIFY `id_subkriteria` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_detail`
--
ALTER TABLE `users_detail`
  MODIFY `id_user_detail` int(5) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `forum_post`
--
ALTER TABLE `forum_post`
  ADD CONSTRAINT `forum_post_ibfk_1` FOREIGN KEY (`id_forum_FK`) REFERENCES `forum` (`id_forum`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`id_kriteria_FK`) REFERENCES `kriteria` (`id_kriteria`),
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`id_subkriteria_FK`) REFERENCES `subkriteria` (`id_subkriteria`),
  ADD CONSTRAINT `item_ibfk_3` FOREIGN KEY (`id_bobot_FK`) REFERENCES `bobot` (`id_bobot`);

--
-- Constraints for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD CONSTRAINT `kriteria_ibfk_1` FOREIGN KEY (`id_bab_FK`) REFERENCES `bab` (`id_bab`);

--
-- Constraints for table `lke`
--
ALTER TABLE `lke`
  ADD CONSTRAINT `lke_ibfk_1` FOREIGN KEY (`id_pilar_FK`) REFERENCES `pilar` (`id_pilar`);

--
-- Constraints for table `lke_detail`
--
ALTER TABLE `lke_detail`
  ADD CONSTRAINT `lke_detail_ibfk_1` FOREIGN KEY (`id_lke_FK`) REFERENCES `lke` (`id_lke`),
  ADD CONSTRAINT `lke_detail_ibfk_2` FOREIGN KEY (`id_bab_FK`) REFERENCES `bab` (`id_bab`),
  ADD CONSTRAINT `lke_detail_ibfk_3` FOREIGN KEY (`id_kriteria_FK`) REFERENCES `kriteria` (`id_kriteria`),
  ADD CONSTRAINT `lke_detail_ibfk_4` FOREIGN KEY (`id_subkriteria_FK`) REFERENCES `subkriteria` (`id_subkriteria`),
  ADD CONSTRAINT `lke_detail_ibfk_5` FOREIGN KEY (`id_item_FK`) REFERENCES `item` (`id_item`),
  ADD CONSTRAINT `lke_detail_ibfk_6` FOREIGN KEY (`id_bobot_FK`) REFERENCES `bobot` (`id_bobot`);

--
-- Constraints for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD CONSTRAINT `notifikasi_ibfk_1` FOREIGN KEY (`id_user_FK`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notifikasi_ibfk_2` FOREIGN KEY (`id_pengumuman_FK`) REFERENCES `pengumuman` (`id_pengumuman`);

--
-- Constraints for table `pengumuman_dituju`
--
ALTER TABLE `pengumuman_dituju`
  ADD CONSTRAINT `pengumuman_dituju_ibfk_1` FOREIGN KEY (`id_pengumuman_FK`) REFERENCES `pengumuman` (`id_pengumuman`),
  ADD CONSTRAINT `pengumuman_dituju_ibfk_2` FOREIGN KEY (`id_level_FK`) REFERENCES `level` (`id_level`);

--
-- Constraints for table `subkriteria`
--
ALTER TABLE `subkriteria`
  ADD CONSTRAINT `subkriteria_ibfk_1` FOREIGN KEY (`id_kriteria_FK`) REFERENCES `kriteria` (`id_kriteria`);

--
-- Constraints for table `users_detail`
--
ALTER TABLE `users_detail`
  ADD CONSTRAINT `users_detail_ibfk_1` FOREIGN KEY (`id_user_FK`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
