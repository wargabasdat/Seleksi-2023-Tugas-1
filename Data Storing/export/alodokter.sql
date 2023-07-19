-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: alodokter
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.5-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `alodokter`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `alodokter` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `alodokter`;

--
-- Table structure for table `dokter`
--

DROP TABLE IF EXISTS `dokter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dokter` (
  `nama` varchar(255) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `rating` varchar(10) DEFAULT NULL,
  `total_rating` int(11) DEFAULT NULL,
  `jumlah_booking` int(11) DEFAULT NULL,
  `rumah_sakit` varchar(255) DEFAULT NULL,
  `kecamatan` varchar(255) DEFAULT NULL,
  `kota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nama`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dokter`
--

LOCK TABLES `dokter` WRITE;
/*!40000 ALTER TABLE `dokter` DISABLE KEYS */;
INSERT INTO `dokter` (`nama`, `harga`, `rating`, `total_rating`, `jumlah_booking`, `rumah_sakit`, `kecamatan`, `kota`) VALUES ('dr. Achcia Thema Maliny',50000,NULL,NULL,16,'RS Onkologi Solo','Laweyan','Solo'),('dr. Adam',70000,'100%',1,3,'Klinik Al Aziz','Panggungrejo','Pasuruan'),('dr. Adhe Pusparani',40000,NULL,NULL,3,'Rumah Sakit Islam Bontang','Bontang Barat','Bontang'),('dr. Aditiawan',70000,'100%',2,7,'Klinik Ayoda','Serpong Utara','Tangerang Selatan'),('dr. Afrialdo',90000,NULL,NULL,0,'Klinik Aqma Cikampek','Cikampek','Karawang'),('dr. Ahmad Nazybullah Irzy',250000,NULL,NULL,0,'Rumah Sakit Royal Progress','Tanjung Priok','Jakarta'),('dr. Aldi Harry Ramdani',50000,NULL,NULL,2,'RSOP Ciamis','Cijeungjing','Ciamis'),('dr. Almahira Az Zahra',40000,NULL,NULL,0,'Klinik Smitra','ciawi','Tasikmalaya'),('dr. Amalia Indah',70000,NULL,NULL,0,'RSJ Dr. Radjiman Wediodiningrat Lawang','Lawang','Malang'),('dr. Ameetha Drupadi, CIMI',NULL,NULL,NULL,29,'Mayapada Hospital Jakarta Selatan','Jakarta Selatan','Jakarta'),('dr. An-Nisaa Islam',60000,'75%',4,38,'Amalia Medical Center','Jakarta Timur','Jakarta'),('dr. Ananda Ulandari',39000,NULL,NULL,10,'Klinik Prima Husada','Bengkong','Batam'),('dr. Andi Afyumita Kumalasari Tenri Allu',100000,NULL,NULL,6,'Rumah Sakit Umum Bahagia Makassar',NULL,'Makassar'),('dr. Andi Yusmawati',110000,'100%',1,4,'Klinik Ratulangi Medical Center','Ujung Pandang','Makassar'),('dr. Ardimansah Nurdin',75000,'100%',4,67,'Klinik HK Medical Center Makassar','Mariso','Makassar'),('dr. Arditia Dwi Putra Ramdhan, MMRS',130000,NULL,NULL,1,'RSIA dr. Hj. Karmini Tasikmalaya','Tawang','Tasikmalaya'),('dr. Aria Kapriyati',90000,NULL,NULL,1,'RSIA Puri Garcia Serang','Taktakan','Serang'),('dr. Arrahmah Haroen',145000,NULL,NULL,7,'RS Islam Jakarta Pondok Kopi','Duren Sawit','Jakarta'),('dr. Arumtyas Cahyaning Wijanarti',90000,'100%',1,16,'RSIA SamMarie Basra','Duren Sawit','Jakarta'),('dr. Aryn Virgianti Rafiqo',75000,NULL,NULL,7,'Klinik Amelia Medika','Cakung','Jakarta'),('dr. Asep Darussalam',75000,NULL,NULL,0,'RS Dadi Keluarga Ciamis','Baregbeg','Ciamis'),('dr. Asep Hidayat',50000,NULL,NULL,0,'RS Sentra Medika Langut','Lohbener','Indramayu'),('dr. Astika Sari',135000,NULL,NULL,7,'Klinik Medika Utama','Balikpapan Kota','Balikpapan'),('dr. Astrid Ignatia Hermawan',250000,NULL,NULL,0,'Rumah Sakit Royal Progress','Tanjung Priok','Jakarta'),('dr. Audrey Desiree',110000,'100%',1,9,'RS EMC Cikarang','Cikarang Selatan','Cikarang'),('dr. Beni Cahyo Kuncoro',70000,'100%',1,7,'RS Aura Syifa Kediri','Ngasem','Kediri'),('dr. Benna Ardiani Renwarin',85000,'100%',2,12,'RS Graha Juanda','Bekasi Timur','Bekasi'),('dr. Benny Pitradjaja Goenawan',80000,'100%',3,19,'RS Happy Land Medical Center','Umbulharjo','Yogyakarta'),('dr. Budiman Murdani L. Tobing',55000,'100%',1,3,'Klinik Pratama Aisyah','Jakarta Barat','Jakarta'),('dr. Christina Dian Rinesti',125000,'100%',1,9,'Rumah Sakit Khusus Bedah Bina Estetika','Menteng','Jakarta'),('dr. Citra Aminah Purnama Sari',85000,NULL,NULL,5,'RS Graha Juanda','Bekasi Timur','Bekasi'),('dr. Clarencia',250000,NULL,NULL,0,'Rumah Sakit Royal Progress','Tanjung Priok','Jakarta'),('dr. Cucu Setiawan Pahrudin',72000,'100%',1,66,'RS Insan Permata','Serpong Utara','Tangerang Selatan'),('dr. Daisy Nataliesye l Kalalo',70000,NULL,NULL,5,'Klinik TriHati Plus Menteng','Tebet','Jakarta'),('dr. David Estrada',250000,NULL,NULL,3,'MRCCC Siloam Hospitals Semanggi','Setiabudi','Jakarta'),('dr. Debby Sartika Mahardhika',60000,NULL,NULL,29,'Sanur Medical Clinic','Denpasar Selatan','Denpasar'),('dr. Delima Cheryka',250000,NULL,NULL,0,'Klinik MHDC Menara Sentraya','Kebayoran Baru','Jakarta'),('dr. Dewi Marlia, MMRS',150000,NULL,NULL,4,'Rumah Sakit Edelweiss','Buah Batu','Bandung'),('dr. Dhiska Brilliana Wibowo',100000,NULL,NULL,1,'Klinik Widya Bhakti Inti','Regol','Bandung'),('dr. Dimas Prasetyo Chandra, MARS',80000,NULL,NULL,5,'GETHealthy Clinic','Kalideres','Jakarta'),('dr. Dina Afilia',90000,'100%',1,31,'RSIA SamMarie Basra','Duren Sawit','Jakarta'),('dr. Dina Zakiah Elhana',175000,'100%',2,13,'Klinik Holicare Bintaro','Pondok Aren','Tangerang Selatan'),('dr. Dinda Prima Asmara',40000,NULL,NULL,0,'Klinik Smitra','ciawi','Tasikmalaya'),('Dr. dr. Carmen Jahja',600000,NULL,NULL,6,'MRCCC Siloam Hospitals Semanggi','Setiabudi','Jakarta'),('dr. Dwi Listya Agustina',75000,NULL,NULL,16,'Klinik TelkoMedika Bandung','Cibeunying Kaler','Bandung'),('dr. Dyah Ayu Safitri',100000,'100%',3,36,'Jakarta Papsmear Center','Menteng','Jakarta'),('dr. Edelwis Christine',85000,'100%',2,0,'RS Graha Juanda','Bekasi Timur','Bekasi'),('dr. Erka Wahyu Kinanda',40000,NULL,NULL,4,'Rumah Sakit Islam Bontang','Bontang Barat','Bontang'),('dr. Fathya Auliannisa',165000,'100%',2,21,'Rumah Sakit Tebet','Tebet','Jakarta'),('dr. Fika Angelina Haliem',110000,'100%',3,34,'Klinik Ratulangi Medical Center','Ujung Pandang','Makassar'),('dr. Firman Pranoto',50000,NULL,NULL,1,'RS Sentra Medika Langut','Lohbener','Indramayu'),('dr. Fitra Sukrita Irsal, IBCLC',160000,NULL,NULL,19,'RS EMC Sentul','Sentul','Bogor'),('dr. Fitri Anggraini Pradityaningsih',82500,'100%',1,28,'SamMarie Clinic @Bassura City','Jatinegara','Jakarta'),('dr. Fiya Yanti Fahma',130000,NULL,NULL,2,'RSIA dr. Hj. Karmini Tasikmalaya','Tawang','Tasikmalaya'),('dr. Francisca Pratiwi',200000,NULL,NULL,1,'Klinik Fajar Farma','Balikpapan Utara','Balikpapan'),('dr. Fransiska Natalia Maharani',50000,NULL,NULL,1,'Klinik Hemodialisis Raycare Tangerang','Karawaci','Tangerang'),('dr. Frederick Lim',50000,NULL,NULL,8,'Klinik Atlantis','Percut Sei Tuan','Medan'),('dr. Habryan Praditya Putra',220000,NULL,NULL,2,'Mitra Keluarga Bekasi Barat','Bekasi Selatan','Bekasi'),('dr. Hendra Mulia',40000,NULL,NULL,8,'RS Suaka Insan','Banjarmasin Barat','Banjarmasin'),('dr. Hotma Parulian Hutabarat',163505,NULL,NULL,21,'Columbia Asia Hospital Pulomas','Pulomas','Jakarta'),('dr. Hotnida Christiawaty S',70000,NULL,NULL,31,'Klinik TriHati Plus Menteng','Tebet','Jakarta'),('dr. I Putu Oka Dharmawan, IBCLC',150000,NULL,NULL,28,'Rumah Sakit Balimed Denpasar','Denpasar Barat','Denpasar'),('dr. Iin Inayah',145000,NULL,NULL,5,'RS Islam Jakarta Pondok Kopi','Duren Sawit','Jakarta'),('dr. Imelia Andianto',110000,NULL,NULL,10,'RS EMC Cikarang','Cikarang Selatan','Cikarang'),('dr. Indrawan Agus Susilo',75000,NULL,NULL,0,'RS Dadi Keluarga Ciamis','Baregbeg','Ciamis'),('dr. Inna Hidajati',100000,'100%',1,9,'RSIA Pondok Tjandra','Waru','Sidoarjo'),('dr. Intan Rhama Safitry',120000,NULL,NULL,1,'NT Clinic','Kelapa Gading','Jakarta'),('dr. Irfan Aktori Abdillah',75000,NULL,NULL,0,'RS Dadi Keluarga Ciamis','Baregbeg','Ciamis'),('dr. Iyan Napitupulu',70000,'100%',1,19,'Klinik Advent Jakarta','Tebet','Jakarta'),('dr. Jonny Burhan Sianipar',75000,'75%',12,90,'RS Pinna','Tambun Utara','Bekasi'),('dr. Junandi Surjautama, SH',50000,NULL,NULL,11,'Rumah Sakit Kebon Jati','Andir','Bandung'),('dr. Juniarti Marheini',100000,NULL,NULL,0,'Klinik Widya Bhakti Inti','Regol','Bandung'),('dr. Karen Afian',110000,NULL,NULL,0,'Klinik Renika','Kemayoran','Jakarta'),('dr. Kaseri Taufiqurrahman, M.MKes',60000,NULL,NULL,0,'Rumah Sakit Umum Islam Madinah Kasembon','Kasembon','Malang'),('dr. Kinanti Putri Larasati, MARS',45000,'100%',1,4,'RSU Ummi Bengkulu','Gading Cempaka','Bengkulu'),('dr. Lora Oktadiana',130000,NULL,NULL,1,'RS Hj. Bunda Halimah','Batam Kota','Batam'),('dr. Lucy Anita',75000,NULL,NULL,9,'RS Permata Cirebon','Kedawung','Cirebon'),('dr. Lukluk Purbaningrum, M.P.H',NULL,NULL,NULL,18,'Klinik Rumah Sunat Jogja RH Medika','Kalasan','Yogyakarta'),('dr. Maghrifah Akriyani Fifti',75000,NULL,NULL,1,'Klinik Utama Depok Medika','Cilodong','Depok'),('dr. Manly Lolowang',100000,'100%',2,95,'Klinik 129 Jayapura','Jayapura Selatan','Jayapura'),('dr. Maria Felicia Suhendra',120000,'100%',1,7,'NT Clinic','Kelapa Gading','Jakarta'),('dr. Maria Tri Irama Ratna Dyah Putranti',50000,NULL,NULL,2,'RS Panti Waluya Sawahan','Klojen','Malang'),('dr. Marina Yunita',50000,NULL,NULL,3,'Rumah Sakit Bunda Mulia','Cikarang Barat','Cikarang'),('dr. Marlina Jaya Diputri',50000,NULL,NULL,2,'RSOP Ciamis','Cijeungjing','Ciamis'),('dr. Megawati Hutapea',130000,NULL,NULL,3,'RS Hj. Bunda Halimah','Batam Kota','Batam'),('dr. Megie Nuzul Aprian',75000,NULL,NULL,0,'RS Dadi Keluarga Ciamis','Baregbeg','Ciamis'),('dr. Meirda Retna Kencana',190000,NULL,NULL,3,'RS EMC Tangerang','Tangerang','Tangerang'),('dr. Merchyondy Zulfa',95000,NULL,NULL,1,'RSIA Aisyah Qurratu\'ain','Bekasi Timur','Bekasi'),('dr. Mochamad Rifqie Nugraha Kamal',130000,NULL,NULL,0,'RSIA dr. Hj. Karmini Tasikmalaya','Tawang','Tasikmalaya'),('dr. Muhammad Aldi Syahputra',50000,NULL,NULL,0,'RS Sentra Medika Langut','Lohbener','Indramayu'),('dr. Muhammad Taqwim Mulwan',130000,NULL,NULL,2,'Klinik Al Hikam','Biringkanaya','Makassar'),('dr. Muthoharrah',50000,'100%',1,18,'RS Annisa Cikarang','Cikarang Utara','Cikarang'),('dr. Muyasyarohtul Amaliah',200000,'100%',1,3,'Klinik Fajar Farma','Balikpapan Utara','Balikpapan'),('dr. Nike Lestari',NULL,NULL,NULL,0,'RSIA Milano','Kuantan Singingi','Riau'),('dr. Niken Widayanti',150000,'100%',1,35,'Takenoko Clinic Pondok Indah','Kebayoran Lama','Jakarta'),('dr. Noor Zaki Abdel Fatah., AIFO-K',100000,'100%',1,15,'Recons Fit Clinic','Kemuning','Palembang'),('dr. Novita Lestari',60000,NULL,NULL,14,'Klinik Pratama Bunda Batam','Lubuk Baja','Batam'),('dr. Nuna Halida',85000,NULL,NULL,5,'RS Graha Juanda','Bekasi Timur','Bekasi'),('dr. Nunul Kristianti',75000,'100%',10,78,'Klinik TelkoMedika Yogyakarta','Umbulharjo','Yogyakarta'),('dr. Nursaidah Lubis',39000,NULL,NULL,11,'Klinik Medika Batam','Sekupang','Batam'),('dr. Priangga Ibrahim Alexander Saputra',125000,NULL,NULL,1,'Westerindo Senayan City','Tanah Abang','Jakarta'),('dr. Putu Andrika Kusuma',50000,'100%',1,2,'Klinik Remedium Care','Denpasar Selatan','Bali'),('dr. Rainy Chandranata',80000,'100%',3,14,'GETHealthy Clinic','Kalideres','Jakarta'),('dr. Ratih Kemala Dewi',82500,'100%',1,11,'SamMarie Clinic @Bassura City','Jatinegara','Jakarta'),('dr. Ratna Wati Halim',80000,NULL,NULL,56,'RS Mulia Pajajaran','Bogor Utara','Bogor'),('dr. Rekha Rakhma Hidayah',90000,NULL,NULL,2,'RSIA Puri Garcia Serang','Taktakan','Serang'),('dr. Ricky Dwi Satria, M.Kes',90000,NULL,NULL,2,'Klinik Aqma Purwakarta','Purwakarta','Purwakarta'),('dr. Rifki Muhamad Faisal',65000,NULL,NULL,6,'Klinik Gardenia Medika','Cakung','Jakarta'),('dr. Rikky Irawan Tulus Manuarang Purba',220000,NULL,NULL,2,'Mitra Keluarga Bekasi Barat','Bekasi Selatan','Bekasi'),('dr. Rini Medyana',75000,NULL,NULL,1,'Klinik Bhumyamca','Cilandak','Jakarta'),('dr. Ritaningsih',250000,NULL,NULL,5,'Rumah Sakit Royal Progress','Tanjung Priok','Jakarta'),('dr. Rizka Azkiyana Adifatama',50000,'100%',1,2,'RS Sentra Medika Langut','Lohbener','Indramayu'),('dr. Rohmani Daiyani',90000,NULL,NULL,0,'RSIA Puri Garcia Serang','Taktakan','Serang'),('dr. S. Fahrulri Rahman',40000,NULL,NULL,3,'Klinik Smitra','ciawi','Tasikmalaya'),('dr. Salim Rifki',90000,NULL,NULL,1,'Klinik Aqma Cikampek','Cikampek','Karawang'),('dr. Samudra Hadi Santosa',90000,NULL,NULL,0,'RSIA Puri Garcia Serang','Taktakan','Serang'),('dr. Sarah Audia Hasna, IBCLC',300000,NULL,NULL,12,'RSIA Bina Medika Bintaro','Pondok Aren','Tangerang Selatan'),('dr. Savian Ravi',100000,NULL,NULL,3,'Klinik Widya Bhakti Inti','Regol','Bandung'),('dr. Siska Ratnasari',85000,NULL,NULL,1,'Klinik Utama Medissina Lohbener','Lohbener','Indramayu'),('dr. Siti Hardiyanti M',53000,NULL,NULL,2,'Klinik Qica Muara Badak','Muara Badak','Kutai Kartanegara'),('dr. Siti Nur Rochmah',145000,NULL,NULL,1,'RS Islam Jakarta Pondok Kopi','Duren Sawit','Jakarta'),('dr. Sylvia Haryeny, IBCLC',NULL,'67%',3,15,'RS Brawijaya Antasari','Kebayoran Baru','Jakarta'),('dr. Tandean Arif Wibowo, MPH',98000,NULL,NULL,3,'Rumah Sakit Panti Rapih','Gondokusuman','Yogyakarta'),('dr. Tia Lestaria Dediprajitno',100000,NULL,NULL,4,'Klinik Widya Bhakti Inti','Regol','Bandung'),('dr. Titik Haryati Hartono',220000,NULL,NULL,29,'Mitra Keluarga Bekasi Barat','Bekasi Selatan','Bekasi'),('dr. Tommy Aritono, MARS',85000,'100%',1,11,'RS Graha Juanda','Bekasi Timur','Bekasi'),('dr. Tri Kusyantini',50000,NULL,NULL,0,'RS Sentra Medika Langut','Lohbener','Indramayu'),('dr. Venita Eng, M.Sc, CT',250000,NULL,NULL,11,'MRCCC Siloam Hospitals Semanggi','Setiabudi','Jakarta'),('dr. Victory Firdaus',250000,NULL,NULL,0,'MRCCC Siloam Hospitals Semanggi','Setiabudi','Jakarta'),('dr. Vincensius Ferdinand',100000,NULL,NULL,3,'Klinik Widya Bhakti Inti','Regol','Bandung'),('dr. Wahyu Lulus Ariyanto, MARS',75000,NULL,NULL,4,'RS Siti Miriam','Lawang','Malang'),('dr. Wicaksono, M.Kes',100000,NULL,NULL,1,'Klinik Widya Bhakti Inti','Regol','Bandung'),('dr. Wilma Najah',55000,'100%',1,21,'Klinik Pratama Aisyah','Jakarta Barat','Jakarta'),('dr. Wilson William',250000,NULL,NULL,1,'Rumah Sakit Royal Progress','Tanjung Priok','Jakarta'),('dr. Wily Kurniadi',100000,NULL,NULL,23,'Siloam Hospitals Bogor','Bogor Tengah','Bogor'),('dr. Witri Abriya',125000,NULL,NULL,5,'Rumah Sakit Umum YARSI','Cempaka Putih','Jakarta'),('dr. Yetty Mulyatie Djoechro',120000,NULL,NULL,50,'Klinik Brawijaya Bandung','Lengkong','Bandung'),('dr. Yolin Marlisa, M.Gizi',75000,NULL,NULL,9,'Mandaya Hospital Karawang','Telukjambe Timur','Karawang'),('dr. Yonathan Ardhana Christanto',50000,'100%',1,30,'Bina Sehat Dental Clinic','Semarang Utara','Semarang'),('dr. Yudhawati Indrianto',75000,NULL,NULL,2,'Klinik Bhumyamca','Cilandak','Jakarta'),('dr. Yudi Wahyudi',50000,NULL,NULL,0,'RS Sentra Medika Langut','Lohbener','Indramayu'),('dr. Yura Pramesti Sahal',75000,NULL,NULL,23,'Klinik TelkoMedika Bandung','Cibeunying Kaler','Bandung'),('Pemeriksaan Diabetes di Rumah Bekasi',479000,NULL,NULL,0,'Alodokter ke Rumah Bekasi','Bekasi Selatan','Bekasi'),('Pemeriksaan Diabetes di Rumah Bogor',479000,NULL,NULL,0,'Alodokter ke Rumah Bogor','Bogor Tengah','Bogor'),('Pemeriksaan Diabetes di Rumah Depok',479000,NULL,NULL,0,'Alodokter ke Rumah Depok','Beji','Depok'),('Pemeriksaan Diabetes di Rumah Jakarta Barat',479000,NULL,NULL,0,'Alodokter ke Rumah Jakarta Barat','Kalideres','Jakarta'),('Pemeriksaan Diabetes di Rumah Jakarta Pusat',479000,NULL,NULL,0,'Alodokter ke Rumah Jakarta Pusat','Menteng','Jakarta'),('Pemeriksaan Diabetes di Rumah Jakarta Selatan',479000,NULL,NULL,1,'Alodokter ke Rumah Jakarta Selatan','Setiabudi','Jakarta'),('Pemeriksaan Diabetes di Rumah Jakarta Timur',479000,NULL,NULL,0,'Alodokter ke Rumah Jakarta Timur','Jakarta Timur','Jakarta'),('Pemeriksaan Diabetes di Rumah Jakarta Utara',479000,NULL,NULL,0,'Alodokter ke Rumah Jakarta Utara','Tanjung Priok','Jakarta');
/*!40000 ALTER TABLE `dokter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konsultasi`
--

DROP TABLE IF EXISTS `konsultasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `konsultasi` (
  `ID_pasien` int(11) NOT NULL,
  `nama_dokter` varchar(255) NOT NULL,
  `waktu_janji` time DEFAULT NULL,
  PRIMARY KEY (`ID_pasien`,`nama_dokter`),
  KEY `nama_dokter` (`nama_dokter`),
  CONSTRAINT `konsultasi_ibfk_1` FOREIGN KEY (`ID_pasien`) REFERENCES `pasien` (`ID_pasien`),
  CONSTRAINT `konsultasi_ibfk_2` FOREIGN KEY (`nama_dokter`) REFERENCES `dokter` (`nama`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konsultasi`
--

LOCK TABLES `konsultasi` WRITE;
/*!40000 ALTER TABLE `konsultasi` DISABLE KEYS */;
/*!40000 ALTER TABLE `konsultasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obat`
--

DROP TABLE IF EXISTS `obat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obat` (
  `id_obat` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_obat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obat`
--

LOCK TABLES `obat` WRITE;
/*!40000 ALTER TABLE `obat` DISABLE KEYS */;
/*!40000 ALTER TABLE `obat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasien`
--

DROP TABLE IF EXISTS `pasien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasien` (
  `ID_pasien` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nomor_telepon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_pasien`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasien`
--

LOCK TABLES `pasien` WRITE;
/*!40000 ALTER TABLE `pasien` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengobatan`
--

DROP TABLE IF EXISTS `pengobatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengobatan` (
  `ID_pasien` int(11) NOT NULL,
  `nama_dokter` varchar(255) NOT NULL,
  `id_obat` int(11) NOT NULL,
  PRIMARY KEY (`ID_pasien`,`nama_dokter`,`id_obat`),
  KEY `nama_dokter` (`nama_dokter`),
  KEY `id_obat` (`id_obat`),
  CONSTRAINT `pengobatan_ibfk_1` FOREIGN KEY (`ID_pasien`) REFERENCES `konsultasi` (`ID_pasien`),
  CONSTRAINT `pengobatan_ibfk_2` FOREIGN KEY (`nama_dokter`) REFERENCES `konsultasi` (`nama_dokter`),
  CONSTRAINT `pengobatan_ibfk_3` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengobatan`
--

LOCK TABLES `pengobatan` WRITE;
/*!40000 ALTER TABLE `pengobatan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengobatan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-19 20:18:55
