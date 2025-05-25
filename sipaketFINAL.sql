/* Create the database */
CREATE DATABASE  IF NOT EXISTS DB_SiPaketTEST;

/* Switch to the classicmodels database. */
USE DB_SiPaketTEST;


/* Drop existing tables  */
DROP TABLE IF EXISTS pelanggan;
DROP TABLE IF EXISTS kurir;
DROP TABLE IF EXISTS paket;
DROP TABLE IF EXISTS pembayaran;
DROP TABLE IF EXISTS faktur; 
DROP TABLE IF EXISTS log_pelacakan;
DROP TABLE IF EXISTS gudang;

/* Create the tables */
CREATE TABLE pelanggan (
  id_pelanggan int,
  nama varchar(50),
  nomor_telpon varchar(50),
  alamat varchar(50),
  PRIMARY KEY (id_pelanggan)
);

CREATE TABLE paket (
  no_resi int,
  id_pelanggan int,
  berat int NOT NULL,
  dimensi varchar(50) NOT NULL,
  jenis_barang varchar(50) NOT NULL,
  nilai_deklarasi varchar(50) NOT NULL,
  pengiriman varchar(50) NOT NULL,
  status_pengiriman varchar(50) NOT NULL,
  PRIMARY KEY (no_resi),
  FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan)
);

CREATE TABLE gudang (
  id_gudang int,
  alamat varchar(50) NOT NULL,
  kota varchar(50) NOT NULL,
  kode_pos varchar(15) NOT NULL,
  PRIMARY KEY (id_gudang)
);

CREATE TABLE kurir (
  id_kurir int,
  nama_kurir varchar(50) NOT NULL,
  nomor_kurir varchar(50) NOT NULL,
  PRIMARY KEY (id_kurir)
);

CREATE TABLE log_pelacakan (
  id_log int,
  id_kurir int,
  id_gudang int,
  no_resi int,
  timestamp datetime NOT NULL,
  status varchar(50) NOT NULL,
  lokasi varchar(50) NOT NULL,
  PRIMARY KEY (id_log),
  FOREIGN KEY (id_kurir) REFERENCES kurir (id_kurir),
  FOREIGN KEY (id_gudang) REFERENCES gudang (id_gudang),
  FOREIGN KEY (no_resi) REFERENCES paket (no_resi)
);

CREATE TABLE pembayaran (
  id_pembayaran int,
  no_resi int,
  metode_pembayaran varchar(50) NOT NULL,
  jumlah decimal(10) NOT NULL,
  PRIMARY KEY (id_pembayaran),
  FOREIGN KEY (no_resi) REFERENCES paket (no_resi)
);

CREATE TABLE faktur (
  id_faktur int,
  id_pembayaran int,
  tanggal_terbit date NOT NULL,
  PRIMARY KEY (id_faktur),
  FOREIGN KEY (id_pembayaran) REFERENCES pembayaran (id_pembayaran)
);

-- masukan data pelanggan
INSERT INTO pelanggan VALUES
(1428, 'Bunga Mawar', '08123456789', 'Jl. Anggrek No. 12'),
(3759, 'Sayur Bayam', '08234567890', 'Jl. Melati No. 45'),
(6284, 'Bunga Tulip', '08345678901', 'Jl. Kangkung No. 78'),
(9137, 'Sayur Kangkung', '08456789012', 'Jl. Mawar No. 23'),
(2460, 'Bunga Anggrek', '08567890123', 'Jl. Bayam No. 56'),
(7591, 'Sayur Sawi', '08678901234', 'Jl. Tulip No. 89'),
(4826, 'Bunga Melati', '08789012345', 'Jl. Sawi No. 34'),
(1357, 'Sayur Wortel', '08890123456', 'Jl. Dahlia No. 67'),
(6802, 'Bunga Dahlia', '08901234567', 'Jl. Wortel No. 90'),
(9243, 'Sayur Kol', '08112345678', 'Jl. Kenanga No. 12'),
(3578, 'Bunga Kenanga', '08223456789', 'Jl. Kol No. 45'),
(8015, 'Sayur Brokoli', '08334567890', 'Jl. Teratai No. 78'),
(4639, 'Bunga Teratai', '08445678901', 'Jl. Brokoli No. 23'),
(2964, 'Sayur Selada', '08556789012', 'Jl. Aster No. 56'),
(7180, 'Bunga Aster', '08667890123', 'Jl. Selada No. 89'),
(5427, 'Sayur Kacang', '08778901234', 'Jl. Lavender No. 34'),
(8593, 'Bunga Lavender', '08889012345', 'Jl. Kacang No. 67'),
(3741, 'Sayur Timun', '08990123456', 'Jl. Matahari No. 90'),
(6258, 'Bunga Matahari', '08101234567', 'Jl. Timun No. 12'),
(9372, 'Sayur Terong', '08212345678', 'Jl. Sakura No. 45'),
(1684, 'Bunga Sakura', '08323456789', 'Jl. Terong No. 78'),
(4905, 'Sayur Labu', '08434567890', 'Jl. Kamboja No. 23'),
(7536, 'Bunga Kamboja', '08545678901', 'Jl. Labu No. 56'),
(2179, 'Sayur Buncis', '08656789012', 'Jl. Lili No. 89'),
(6840, 'Bunga Lili', '08767890123', 'Jl. Buncis No. 34'),
(3982, 'Sayur Pakcoy', '08878901234', 'Jl. Anyelir No. 67'),
(5217, 'Bunga Anyelir', '08989012345', 'Jl. Pakcoy No. 90'),
(8463, 'Sayur Lobak', '08190123456', 'Jl. Krisan No. 12'),
(2795, 'Bunga Krisan', '08201234567', 'Jl. Lobak No. 45'),
(6138, 'Sayur Daun', '08312345678', 'Jl. Alamanda No. 78');

-- masukan data paket
INSERT INTO paket VALUES
(12457896, 1428, 2, '30x20x10 cm', 'Elektronik', 'Rp 1.500.000', 'Reguler', 'Dalam proses'),
(33568921, 3759, 5, '40x30x20 cm', 'Pakaian', 'Rp 750.000', 'Express', 'Terkirim'),
(47891234, 6284, 1, '20x15x10 cm', 'Dokumen', 'Rp 100.000', 'Same Day', 'Diterima'),
(56982345, 9137, 3, '35x25x15 cm', 'Kosmetik', 'Rp 350.000', 'Reguler', 'Dalam proses'),
(67213458, 2460, 7, '50x40x30 cm', 'Mainan', 'Rp 1.200.000', 'Express', 'Dalam pengiriman'),
(78546912, 7591, 2, '30x20x10 cm', 'Buku', 'Rp 250.000', 'Reguler', 'Terkirim'),
(89651234, 4826, 4, '40x30x20 cm', 'Alat Rumah Tangga', 'Rp 800.000', 'Express', 'Diterima'),
(90123456, 1357, 1, '20x15x10 cm', 'Aksesoris', 'Rp 150.000', 'Same Day', 'Dalam proses'),
(12345678, 6802, 6, '45x35x25 cm', 'Sepatu', 'Rp 1.000.000', 'Express', 'Dalam pengiriman'),
(23456789, 9243, 3, '35x25x15 cm', 'Tas', 'Rp 600.000', 'Reguler', 'Terkirim'),
(34567891, 1428, 2, '30x20x10 cm', 'Elektronik', 'Rp 900.000', 'Express', 'Diterima'),
(45678912, 3759, 5, '40x30x20 cm', 'Pakaian', 'Rp 1.100.000', 'Reguler', 'Dalam proses'),
(56789123, 6284, 1, '20x15x10 cm', 'Dokumen', 'Rp 50.000', 'Same Day', 'Dalam pengiriman'),
(67891234, 9137, 4, '40x30x20 cm', 'Kosmetik', 'Rp 450.000', 'Express', 'Terkirim'),
(78912345, 2460, 3, '35x25x15 cm', 'Mainan', 'Rp 300.000', 'Reguler', 'Diterima'),
(89123456, 7591, 7, '50x40x30 cm', 'Buku', 'Rp 950.000', 'Express', 'Dalam proses'),
(91234567, 4826, 2, '30x20x10 cm', 'Alat Rumah Tangga', 'Rp 400.000', 'Reguler', 'Dalam pengiriman'),
(98765432, 1357, 5, '40x30x20 cm', 'Aksesoris', 'Rp 700.000', 'Express', 'Terkirim'),
(87654321, 6802, 1, '20x15x10 cm', 'Sepatu', 'Rp 200.000', 'Same Day', 'Diterima'),
(76543219, 9243, 4, '40x30x20 cm', 'Tas', 'Rp 850.000', 'Express', 'Dalam proses'),
(65432198, 1428, 3, '35x25x15 cm', 'Elektronik', 'Rp 1.300.000', 'Reguler', 'Dalam pengiriman'),
(54321987, 3759, 6, '45x35x25 cm', 'Pakaian', 'Rp 1.600.000', 'Express', 'Terkirim'),
(43219876, 6284, 2, '30x20x10 cm', 'Dokumen', 'Rp 120.000', 'Reguler', 'Diterima'),
(32198765, 9137, 5, '40x30x20 cm', 'Kosmetik', 'Rp 550.000', 'Express', 'Dalam proses'),
(21987654, 2460, 1, '20x15x10 cm', 'Mainan', 'Rp 80.000', 'Same Day', 'Dalam pengiriman'),
(19876543, 7591, 4, '40x30x20 cm', 'Buku', 'Rp 500.000', 'Express', 'Terkirim'),
(98761235, 4826, 3, '35x25x15 cm', 'Alat Rumah Tangga', 'Rp 350.000', 'Reguler', 'Diterima'),
(87654329, 1357, 7, '50x40x30 cm', 'Aksesoris', 'Rp 1.200.000', 'Express', 'Dalam proses'),
(76543218, 6802, 2, '30x20x10 cm', 'Sepatu', 'Rp 300.000', 'Reguler', 'Dalam pengiriman'),
(65432197, 9243, 5, '40x30x20 cm', 'Tas', 'Rp 950.000', 'Express', 'Terkirim'),
(54321986, 1428, 1, '20x15x10 cm', 'Elektronik', 'Rp 180.000', 'Same Day', 'Diterima'),
(43219875, 3759, 4, '40x30x20 cm', 'Pakaian', 'Rp 650.000', 'Express', 'Dalam proses'),
(32198764, 6284, 3, '35x25x15 cm', 'Dokumen', 'Rp 90.000', 'Reguler', 'Dalam pengiriman'),
(21987653, 9137, 6, '45x35x25 cm', 'Kosmetik', 'Rp 1.100.000', 'Express', 'Terkirim'),
(19876542, 2460, 2, '30x20x10 cm', 'Mainan', 'Rp 220.000', 'Reguler', 'Diterima'),
(98765431, 7591, 5, '40x30x20 cm', 'Buku', 'Rp 700.000', 'Express', 'Dalam proses'),
(87654328, 4826, 1, '20x15x10 cm', 'Alat Rumah Tangga', 'Rp 130.000', 'Same Day', 'Dalam pengiriman'),
(76543217, 1357, 4, '40x30x20 cm', 'Aksesoris', 'Rp 600.000', 'Express', 'Terkirim'),
(65432196, 6802, 3, '35x25x15 cm', 'Sepatu', 'Rp 450.000', 'Reguler', 'Diterima'),
(54321985, 9243, 7, '50x40x30 cm', 'Tas', 'Rp 1.400.000', 'Express', 'Dalam proses'),
(43219874, 1428, 2, '30x20x10 cm', 'Elektronik', 'Rp 500.000', 'Reguler', 'Dalam pengiriman'),
(32198763, 3759, 5, '40x30x20 cm', 'Pakaian', 'Rp 850.000', 'Express', 'Terkirim'),
(21987652, 6284, 1, '20x15x10 cm', 'Dokumen', 'Rp 70.000', 'Same Day', 'Diterima'),
(19876541, 9137, 4, '40x30x20 cm', 'Kosmetik', 'Rp 400.000', 'Express', 'Dalam proses'),
(98765430, 2460, 3, '35x25x15 cm', 'Mainan', 'Rp 280.000', 'Reguler', 'Dalam pengiriman'),
(87654327, 7591, 6, '45x35x25 cm', 'Buku', 'Rp 1.000.000', 'Express', 'Terkirim'),
(76543216, 4826, 2, '30x20x10 cm', 'Alat Rumah Tangga', 'Rp 350.000', 'Reguler', 'Diterima'),
(65432195, 1357, 5, '40x30x20 cm', 'Aksesoris', 'Rp 750.000', 'Express', 'Dalam proses'),
(54321984, 6802, 1, '20x15x10 cm', 'Sepatu', 'Rp 160.000', 'Same Day', 'Dalam pengiriman'),
(43219873, 9243, 4, '40x30x20 cm', 'Tas', 'Rp 900.000', 'Express', 'Terkirim'),
(32198762, 1428, 3, '35x25x15 cm', 'Elektronik', 'Rp 1.100.000', 'Reguler', 'Diterima'),
(21987651, 3759, 7, '50x40x30 cm', 'Pakaian', 'Rp 1.500.000', 'Express', 'Dalam proses'),
(19876540, 6284, 2, '30x20x10 cm', 'Dokumen', 'Rp 110.000', 'Reguler', 'Dalam pengiriman'),
(98765439, 9137, 5, '40x30x20 cm', 'Kosmetik', 'Rp 650.000', 'Express', 'Terkirim'),
(87654326, 2460, 1, '20x15x10 cm', 'Mainan', 'Rp 95.000', 'Same Day', 'Diterima'),
(76543215, 7591, 4, '40x30x20 cm', 'Buku', 'Rp 550.000', 'Express', 'Dalam proses'),
(65432194, 4826, 3, '35x25x15 cm', 'Alat Rumah Tangga', 'Rp 320.000', 'Reguler', 'Dalam pengiriman'),
(54321983, 1357, 6, '45x35x25 cm', 'Aksesoris', 'Rp 1.300.000', 'Express', 'Terkirim'),
(43219872, 6802, 2, '30x20x10 cm', 'Sepatu', 'Rp 270.000', 'Reguler', 'Diterima'),
(32198761, 9243, 5, '40x30x20 cm', 'Tas', 'Rp 1.100.000', 'Express', 'Dalam proses'),
(21987650, 1428, 1, '20x15x10 cm', 'Elektronik', 'Rp 140.000', 'Same Day', 'Dalam pengiriman'),
(19876539, 3759, 4, '40x30x20 cm', 'Pakaian', 'Rp 700.000', 'Express', 'Terkirim'),
(98765438, 6284, 3, '35x25x15 cm', 'Dokumen', 'Rp 85.000', 'Reguler', 'Diterima'),
(87654325, 9137, 7, '50x40x30 cm', 'Kosmetik', 'Rp 1.600.000', 'Express', 'Dalam proses'),
(76543214, 2460, 2, '30x20x10 cm', 'Mainan', 'Rp 240.000', 'Reguler', 'Dalam pengiriman'),
(65432193, 7591, 5, '40x30x20 cm', 'Buku', 'Rp 800.000', 'Express', 'Terkirim'),
(54321982, 4826, 1, '20x15x10 cm', 'Alat Rumah Tangga', 'Rp 120.000', 'Same Day', 'Diterima'),
(43219871, 1357, 4, '40x30x20 cm', 'Aksesoris', 'Rp 650.000', 'Express', 'Dalam proses'),
(32198760, 6802, 3, '35x25x15 cm', 'Sepatu', 'Rp 380.000', 'Reguler', 'Dalam pengiriman'),
(21987649, 9243, 6, '45x35x25 cm', 'Tas', 'Rp 1.200.000', 'Express', 'Terkirim'),
(19876538, 1428, 2, '30x20x10 cm', 'Elektronik', 'Rp 450.000', 'Reguler', 'Diterima'),
(98765437, 3759, 5, '40x30x20 cm', 'Pakaian', 'Rp 950.000', 'Express', 'Dalam proses'),
(87654324, 6284, 1, '20x15x10 cm', 'Dokumen', 'Rp 60.000', 'Same Day', 'Dalam pengiriman'),
(76543213, 9137, 4, '40x30x20 cm', 'Kosmetik', 'Rp 500.000', 'Express', 'Terkirim'),
(65432192, 2460, 3, '35x25x15 cm', 'Mainan', 'Rp 310.000', 'Reguler', 'Diterima'),
(54321981, 7591, 7, '50x40x30 cm', 'Buku', 'Rp 1.350.000', 'Express', 'Dalam proses'),
(43219870, 4826, 2, '30x20x10 cm', 'Alat Rumah Tangga', 'Rp 290.000', 'Reguler', 'Dalam pengiriman'),
(32198759, 1357, 5, '40x30x20 cm', 'Aksesoris', 'Rp 850.000', 'Express', 'Terkirim'),
(21987648, 6802, 1, '20x15x10 cm', 'Sepatu', 'Rp 170.000', 'Same Day', 'Diterima'),
(19876537, 9243, 4, '40x30x20 cm', 'Tas', 'Rp 1.000.000', 'Express', 'Dalam proses'),
(98765436, 1428, 3, '35x25x15 cm', 'Elektronik', 'Rp 1.200.000', 'Reguler', 'Dalam pengiriman'),
(87654323, 3759, 6, '45x35x25 cm', 'Pakaian', 'Rp 1.400.000', 'Express', 'Terkirim'),
(76543212, 6284, 2, '30x20x10 cm', 'Dokumen', 'Rp 130.000', 'Reguler', 'Diterima'),
(65432191, 9137, 5, '40x30x20 cm', 'Kosmetik', 'Rp 750.000', 'Express', 'Dalam proses'),
(54321980, 2460, 1, '20x15x10 cm', 'Mainan', 'Rp 90.000', 'Same Day', 'Dalam pengiriman'),
(43219869, 7591, 4, '40x30x20 cm', 'Buku', 'Rp 600.000', 'Express', 'Terkirim'),
(32198758, 4826, 3, '35x25x15 cm', 'Alat Rumah Tangga', 'Rp 330.000', 'Reguler', 'Diterima'),
(21987647, 1357, 7, '50x40x30 cm', 'Aksesoris', 'Rp 1.450.000', 'Express', 'Dalam proses'),
(19876536, 6802, 2, '30x20x10 cm', 'Sepatu', 'Rp 260.000', 'Reguler', 'Dalam pengiriman'),
(98765435, 9243, 5, '40x30x20 cm', 'Tas', 'Rp 1.150.000', 'Express', 'Terkirim'),
(87654322, 1428, 1, '20x15x10 cm', 'Elektronik', 'Rp 150.000', 'Same Day', 'Diterima'),
(76543211, 3759, 4, '40x30x20 cm', 'Pakaian', 'Rp 800.000', 'Express', 'Dalam proses'),
(65432190, 6284, 3, '35x25x15 cm', 'Dokumen', 'Rp 95.000', 'Reguler', 'Dalam pengiriman'),
(54321979, 9137, 6, '45x35x25 cm', 'Kosmetik', 'Rp 1.250.000', 'Express', 'Terkirim'),
(43219868, 2460, 2, '30x20x10 cm', 'Mainan', 'Rp 230.000', 'Reguler', 'Diterima'),
(32198757, 7591, 5, '40x30x20 cm', 'Buku', 'Rp 900.000', 'Express', 'Dalam proses'),
(21987646, 4826, 1, '20x15x10 cm', 'Alat Rumah Tangga', 'Rp 110.000', 'Same Day', 'Dalam pengiriman'),
(19876535, 1357, 4, '40x30x20 cm', 'Aksesoris', 'Rp 700.000', 'Express', 'Terkirim'),
(98765434, 6802, 3, '35x25x15 cm', 'Sepatu', 'Rp 420.000', 'Reguler', 'Diterima'),
(87345643, 9243, 7, '50x40x30 cm', 'Tas', 'Rp 1.550.000', 'Express', 'Dalam proses');

-- masukan data pembayaran
INSERT INTO pembayaran VALUES
(1428, 12457896, 'Transfer Bank', 25000),
(3759, 33568921, 'Kartu Kredit', 50000),
(6284, 47891234, 'E-Wallet', 15000),
(9137, 56982345, 'Transfer Bank', 35000),
(2460, 67213458, 'Kartu Debit', 45000),
(7591, 78546912, 'E-Wallet', 20000),
(4826, 89651234, 'Transfer Bank', 40000),
(1357, 90123456, 'Kartu Kredit', 30000),
(6802, 12345678, 'Transfer Bank', 55000),
(9243, 23456789, 'Kartu Debit', 30000),
(3578, 34567891, 'E-Wallet', 25000),
(8015, 45678912, 'Transfer Bank', 50000),
(4639, 56789123, 'Kartu Kredit', 15000),
(2964, 67891234, 'Transfer Bank', 40000),
(7180, 78912345, 'E-Wallet', 30000),
(5427, 89123456, 'Kartu Debit', 65000),
(8593, 91234567, 'Transfer Bank', 20000),
(3741, 98765432, 'Kartu Kredit', 45000),
(6258, 87654321, 'E-Wallet', 30000),
(9372, 76543219, 'Transfer Bank', 35000),
(1684, 65432198, 'Kartu Debit', 25000),
(4905, 54321987, 'Transfer Bank', 60000),
(7536, 43219876, 'E-Wallet', 20000),
(2179, 32198765, 'Kartu Kredit', 55000),
(6840, 21987654, 'Transfer Bank', 15000),
(3982, 19876543, 'E-Wallet', 50000),
(5217, 98761235, 'Kartu Debit', 35000),
(8463, 87654329, 'Transfer Bank', 70000),
(2795, 76543218, 'E-Wallet', 25000),
(6138, 65432197, 'Kartu Kredit', 55000),
(4638, 54321986, 'Transfer Bank', 18000),
(2963, 43219875, 'E-Wallet', 65000),
(7179, 32198764, 'Kartu Debit', 30000),
(5426, 21987653, 'Transfer Bank', 55000),
(8592, 19876542, 'E-Wallet', 22000),
(3740, 98765431, 'Kartu Kredit', 70000),
(6257, 87654328, 'Transfer Bank', 13000),
(9371, 76543217, 'E-Wallet', 60000),
(1683, 65432196, 'Kartu Debit', 45000),
(4904, 54321985, 'Transfer Bank', 140000),
(7535, 43219874, 'E-Wallet', 50000),
(2178, 32198763, 'Kartu Kredit', 85000),
(6839, 21987652, 'Transfer Bank', 70000),
(3981, 19876541, 'E-Wallet', 40000),
(5216, 98765430, 'Kartu Debit', 28000),
(8462, 87654327, 'Transfer Bank', 100000),
(2794, 76543216, 'E-Wallet', 35000),
(6137, 65432195, 'Kartu Kredit', 75000),
(4637, 54321984, 'Transfer Bank', 16000),
(2962, 43219873, 'E-Wallet', 90000),
(7178, 32198762, 'Kartu Debit', 110000),
(5425, 21987651, 'Transfer Bank', 150000),
(8591, 19876540, 'E-Wallet', 110000),
(3739, 98765439, 'Kartu Kredit', 65000),
(6256, 87654326, 'Transfer Bank', 95000),
(9370, 76543215, 'E-Wallet', 55000),
(1682, 65432194, 'Kartu Debit', 32000),
(4903, 54321983, 'Transfer Bank', 130000),
(7534, 43219872, 'E-Wallet', 27000),
(2177, 32198761, 'Kartu Kredit', 110000),
(6838, 21987650, 'Transfer Bank', 140000),
(3980, 19876539, 'E-Wallet', 700000),
(5215, 98765438, 'Kartu Debit', 85000),
(8461, 87654325, 'Transfer Bank', 160000),
(2793, 76543214, 'E-Wallet', 24000),
(6136, 65432193, 'Kartu Kredit', 80000),
(4636, 54321982, 'Transfer Bank', 12000),
(2961, 43219871, 'E-Wallet', 65000),
(7177, 32198760, 'Kartu Debit', 38000),
(5424, 21987649, 'Transfer Bank', 120000),
(8590, 19876538, 'E-Wallet', 45000),
(3738, 98765437, 'Kartu Kredit', 95000),
(6255, 87654324, 'Transfer Bank', 60000),
(9369, 76543213, 'E-Wallet', 50000),
(1681, 65432192, 'Kartu Debit', 31000),
(4902, 54321981, 'Transfer Bank', 135000),
(7533, 43219870, 'E-Wallet', 29000),
(2176, 32198759, 'Kartu Kredit', 85000),
(6837, 21987648, 'Transfer Bank', 17000),
(3979, 19876537, 'E-Wallet', 100000),
(5214, 98765436, 'Kartu Debit', 120000),
(8460, 87654323, 'Transfer Bank', 140000),
(2792, 76543212, 'E-Wallet', 13000),
(6135, 65432191, 'Kartu Kredit', 75000),
(4635, 54321980, 'Transfer Bank', 90000),
(2960, 43219869, 'E-Wallet', 60000),
(7176, 32198758, 'Kartu Debit', 33000),
(5423, 21987647, 'Transfer Bank', 145000),
(8589, 19876536, 'E-Wallet', 26000),
(3737, 98765435, 'Kartu Kredit', 115000),
(6254, 87654322, 'Transfer Bank', 15000),
(9368, 76543211, 'E-Wallet', 80000),
(1680, 65432190, 'Kartu Debit', 95000),
(4901, 54321979, 'Transfer Bank', 125000),
(7532, 43219868, 'E-Wallet', 23000),
(2175, 32198757, 'Kartu Kredit', 90000),
(6836, 21987646, 'Transfer Bank', 11000),
(3978, 19876535, 'E-Wallet', 70000),
(5213, 98765434, 'Kartu Debit', 42000),
(8459, 87345643, 'Transfer Bank', 155000);

-- masukan data faktur
INSERT INTO faktur VALUES
(1428, 1428, '2023-01-15'),
(3759, 3759, '2023-02-20'),
(6284, 6284, '2023-03-10'),
(9137, 9137, '2023-04-05'),
(2460, 2460, '2023-05-12'),
(7591, 7591, '2023-06-18'),
(4826, 4826, '2023-07-22'),
(1357, 1357, '2023-08-30'),
(6802, 6802, '2023-09-05'),
(9243, 9243, '2023-10-11'),
(3578, 3578, '2023-11-19'),
(8015, 8015, '2023-12-25'),
(4639, 4639, '2024-01-03'),
(2964, 2964, '2024-02-08'),
(7180, 7180, '2024-03-14'),
(5427, 5427, '2024-04-20'),
(8593, 8593, '2024-05-26'),
(3741, 3741, '2023-01-30'),
(6258, 6258, '2023-02-14'),
(9372, 9372, '2023-03-22'),
(1684, 1684, '2023-04-18'),
(4905, 4905, '2023-05-24'),
(7536, 7536, '2023-06-29'),
(2179, 2179, '2023-07-07'),
(6840, 6840, '2023-08-13'),
(3982, 3982, '2023-09-17'),
(5217, 5217, '2023-10-23'),
(8463, 8463, '2023-11-28'),
(2795, 2795, '2023-12-02'),
(6138, 6138, '2024-01-07'),
(4638, 4638, '2024-02-11'),
(2963, 2963, '2024-03-19'),
(7179, 7179, '2024-04-25'),
(5426, 5426, '2024-05-31'),
(8592, 8592, '2023-01-09'),
(3740, 3740, '2023-02-15'),
(6257, 6257, '2023-03-21'),
(9371, 9371, '2023-04-27'),
(1683, 1683, '2023-05-03'),
(4904, 4904, '2023-06-09'),
(7535, 7535, '2023-07-15'),
(2178, 2178, '2023-08-21'),
(6839, 6839, '2023-09-27'),
(3981, 3981, '2023-10-04'),
(5216, 5216, '2023-11-10'),
(8462, 8462, '2023-12-16'),
(2794, 2794, '2024-01-22'),
(6137, 6137, '2024-02-28'),
(4637, 4637, '2024-03-06'),
(2962, 2962, '2024-04-12'),
(7178, 7178, '2024-05-18'),
(5425, 5425, '2023-01-24'),
(8591, 8591, '2023-02-01'),
(3739, 3739, '2023-03-09'),
(6256, 6256, '2023-04-15'),
(9370, 9370, '2023-05-21'),
(1682, 1682, '2023-06-27'),
(4903, 4903, '2023-07-03'),
(7534, 7534, '2023-08-09'),
(2177, 2177, '2023-09-15'),
(6838, 6838, '2023-10-21'),
(3980, 3980, '2023-11-27'),
(5215, 5215, '2023-12-03'),
(8461, 8461, '2024-01-09'),
(2793, 2793, '2024-02-15'),
(6136, 6136, '2024-03-23'),
(4636, 4636, '2024-04-29'),
(2961, 2961, '2024-05-05'),
(7177, 7177, '2023-01-11'),
(5424, 5424, '2023-02-17'),
(8590, 8590, '2023-03-25'),
(3738, 3738, '2023-04-01'),
(6255, 6255, '2023-05-07'),
(9369, 9369, '2023-06-13'),
(1681, 1681, '2023-07-19'),
(4902, 4902, '2023-08-25'),
(7533, 7533, '2023-09-30'),
(2176, 2176, '2023-10-06'),
(6837, 6837, '2023-11-12'),
(3979, 3979, '2023-12-18'),
(5214, 5214, '2024-01-24'),
(8460, 8460, '2024-02-29'),
(2792, 2792, '2024-03-07'),
(6135, 6135, '2024-04-13'),
(4635, 4635, '2024-05-19'),
(2960, 2960, '2023-01-25'),
(7176, 7176, '2023-02-28'),
(5423, 5423, '2023-03-08'),
(8589, 8589, '2023-04-14'),
(3737, 3737, '2023-05-20'),
(6254, 6254, '2023-06-26'),
(9368, 9368, '2023-07-02'),
(1680, 1680, '2023-08-08'),
(4901, 4901, '2023-09-14'),
(7532, 7532, '2023-10-20'),
(2175, 2175, '2023-11-26'),
(6836, 6836, '2023-12-01'),
(3978, 3978, '2024-01-07'),
(5213, 5213, '2024-02-13'),
(8459, 8459, '2024-03-21');

-- masukan data kurir
INSERT INTO kurir VALUES
(101, 'Andi Saputra', '08173625418'),
(102, 'Budi Santoso', '08219847263'),
(103, 'Citra Lestari', '08527483615'),
(104, 'Dedi Pratama', '08196537824'),
(105, 'Eka Wulandari', '08962315847'),
(106, 'Fajar Maulana', '08213596472'),
(107, 'Gina Oktaviani', '08784516239'),
(108, 'Hendra Wijaya', '08315478260'),
(109, 'Indah Permata', '08194367285'),
(110, 'Joko Kurniawan', '08872194536');

-- masukan data gudang 
INSERT INTO gudang VALUES
(1, 'Jl. Gatot Subroto No. 12', 'Jakarta', '12930'),
(2, 'Jl. Soekarno Hatta No. 45', 'Bandung', '40235'),
(3, 'Jl. Raya Darmo No. 78', 'Surabaya', '60241'),
(4, 'Jl. Gatot Subroto No. 23', 'Medan', '20112'),
(5, 'Jl. Malioboro No. 56', 'Yogyakarta', '55271'),
(6, 'Jl. Raya Kuta No. 89', 'Denpasar', '80361'),
(7, 'Jl. Urip Sumoharjo No. 34', 'Makassar', '90111');

-- Mengisi data log pelacakan
INSERT INTO log_pelacakan (id_log, id_kurir, id_gudang, no_resi, timestamp, status, lokasi) VALUES

(1, 101, 1, 12457896, '2023-05-01 08:30:00', 'Diterima di gudang', 'Gudang Pusat Jakarta'),
(2, 101, 1, 12457896, '2023-05-01 10:15:00', 'Dalam proses sorting', 'Gudang Pusat Jakarta'),
(3, 101, 1, 12457896, '2023-05-02 09:00:00', 'Dalam perjalanan ke gudang transit', 'Gudang Pusat Jakarta'),

-- Log untuk paket 33568921 (Pakaian, Terkirim)
(4, 102, 2, 33568921, '2023-05-03 11:20:00', 'Diterima di gudang', 'Gudang Bandung'),
(5, 102, 2, 33568921, '2023-05-03 14:45:00', 'Dalam proses pengiriman', 'Gudang Bandung'),
(6, 102, NULL, 33568921, '2023-05-04 09:30:00', 'Sedang diantar kurir', 'Kota Bandung'),
(7, 102, NULL, 33568921, '2023-05-04 12:15:00', 'Terkirim ke penerima', 'Kota Bandung'),

-- Log untuk paket 47891234 (Dokumen, Diterima)
(8, 103, 3, 47891234, '2023-05-05 13:10:00', 'Diterima di gudang', 'Gudang Surabaya'),
(9, 103, NULL, 47891234, '2023-05-05 15:30:00', 'Dalam pengiriman same day', 'Kota Surabaya'),
(10, 103, NULL, 47891234, '2023-05-05 17:45:00', 'Diterima penerima', 'Kota Surabaya'),

-- Log untuk paket 56982345 (Kosmetik, Dalam proses)
(11, 104, 4, 56982345, '2023-05-06 10:00:00', 'Diterima di gudang', 'Gudang Medan'),
(12, 104, 4, 56982345, '2023-05-06 14:20:00', 'Dalam proses packing', 'Gudang Medan'),

-- Log untuk paket 67213458 (Mainan, Dalam pengiriman)
(13, 105, 5, 67213458, '2023-05-07 09:15:00', 'Diterima di gudang', 'Gudang Yogyakarta'),
(14, 105, 5, 67213458, '2023-05-08 08:30:00', 'Dalam perjalanan ke kota tujuan', 'Gudang Yogyakarta'),
(15, 105, NULL, 67213458, '2023-05-08 11:45:00', 'Dalam pengiriman ke alamat', 'Kota Yogyakarta'),

-- Log untuk paket 78546912 (Buku, Terkirim)
(16, 106, 6, 78546912, '2023-05-09 13:20:00', 'Diterima di gudang', 'Gudang Bali'),
(17, 106, 6, 78546912, '2023-05-10 10:00:00', 'Dalam proses pengiriman', 'Gudang Bali'),
(18, 106, NULL, 78546912, '2023-05-10 14:30:00', 'Terkirim ke penerima', 'Kota Denpasar'),

-- Log untuk paket 89651234 (Alat Rumah Tangga, Diterima)
(19, 107, 7, 89651234, '2023-05-11 08:45:00', 'Diterima di gudang', 'Gudang Makassar'),
(20, 107, NULL, 89651234, '2023-05-11 11:30:00', 'Dalam pengiriman express', 'Kota Makassar'),
(21, 107, NULL, 89651234, '2023-05-11 13:15:00', 'Diterima penerima', 'Kota Makassar'),

-- Log untuk paket 90123456 (Aksesoris, Dalam proses)
(22, 108, 1, 90123456, '2023-05-12 14:00:00', 'Diterima di gudang', 'Gudang Pusat Jakarta'),
(23, 108, 1, 90123456, '2023-05-12 16:30:00', 'Dalam proses same day', 'Gudang Pusat Jakarta'),

-- Log untuk paket 12345678 (Sepatu, Dalam pengiriman)
(24, 109, 2, 12345678, '2023-05-13 10:20:00', 'Diterima di gudang', 'Gudang Bandung'),
(25, 109, 2, 12345678, '2023-05-14 09:00:00', 'Dalam perjalanan express', 'Gudang Bandung'),
(26, 109, NULL, 12345678, '2023-05-14 12:45:00', 'Sedang diantar kurir', 'Kota Bandung'),

-- Log untuk paket 23456789 (Tas, Terkirim)
(27, 110, 3, 23456789, '2023-05-15 11:30:00', 'Diterima di gudang', 'Gudang Surabaya'),
(28, 110, 3, 23456789, '2023-05-16 10:15:00', 'Dalam proses pengiriman reguler', 'Gudang Surabaya'),
(29, 110, NULL, 23456789, '2023-05-17 14:00:00', 'Terkirim ke penerima', 'Kota Surabaya'),

-- Log untuk paket 34567891 (Elektronik, Diterima)
(30, 101, 4, 34567891, '2023-05-18 09:45:00', 'Diterima di gudang', 'Gudang Medan'),
(31, 101, NULL, 34567891, '2023-05-18 13:30:00', 'Dalam pengiriman express', 'Kota Medan'),
(32, 101, NULL, 34567891, '2023-05-18 16:00:00', 'Diterima penerima', 'Kota Medan'),

-- Log untuk paket 45678912 (Pakaian, Dalam proses)
(33, 102, 5, 45678912, '2023-05-19 08:30:00', 'Diterima di gudang', 'Gudang Yogyakarta'),
(34, 102, 5, 45678912, '2023-05-19 11:45:00', 'Dalam proses sorting', 'Gudang Yogyakarta'),

-- Log untuk paket 56789123 (Dokumen, Dalam pengiriman)
(35, 103, 6, 56789123, '2023-05-20 14:15:00', 'Diterima di gudang', 'Gudang Bali'),
(36, 103, NULL, 56789123, '2023-05-20 16:30:00', 'Dalam pengiriman same day', 'Kota Denpasar'),

-- Log untuk paket 67891234 (Kosmetik, Terkirim)
(37, 104, 7, 67891234, '2023-05-21 10:00:00', 'Diterima di gudang', 'Gudang Makassar'),
(38, 104, NULL, 67891234, '2023-05-21 13:45:00', 'Dalam pengiriman express', 'Kota Makassar'),
(39, 104, NULL, 67891234, '2023-05-21 15:30:00', 'Terkirim ke penerima', 'Kota Makassar'),

-- Log untuk paket 78912345 (Mainan, Diterima)
(40, 105, 1, 78912345, '2023-05-22 12:30:00', 'Diterima di gudang', 'Gudang Pusat Jakarta'),
(41, 105, NULL, 78912345, '2023-05-22 15:00:00', 'Dalam pengiriman reguler', 'Kota Jakarta'),
(42, 105, NULL, 78912345, '2023-05-22 17:45:00', 'Diterima penerima', 'Kota Jakarta'),

-- Log untuk paket 89123456 (Buku, Dalam proses)
(43, 106, 2, 89123456, '2023-05-23 09:15:00', 'Diterima di gudang', 'Gudang Bandung'),
(44, 106, 2, 89123456, '2023-05-23 14:30:00', 'Dalam proses express', 'Gudang Bandung'),

-- Log untuk paket 91234567 (Alat Rumah Tangga, Dalam pengiriman)
(45, 107, 3, 91234567, '2023-05-24 08:45:00', 'Diterima di gudang', 'Gudang Surabaya'),
(46, 107, 3, 91234567, '2023-05-25 10:00:00', 'Dalam perjalanan reguler', 'Gudang Surabaya'),
(47, 107, NULL, 91234567, '2023-05-25 13:15:00', 'Sedang diantar kurir', 'Kota Surabaya'),

-- Log untuk paket 98765432 (Aksesoris, Terkirim)
(48, 108, 4, 98765432, '2023-05-26 11:30:00', 'Diterima di gudang', 'Gudang Medan'),
(49, 108, NULL, 98765432, '2023-05-26 14:45:00', 'Dalam pengiriman express', 'Kota Medan'),
(50, 108, NULL, 98765432, '2023-05-26 16:30:00', 'Terkirim ke penerima', 'Kota Medan'),

-- Log untuk paket 87654321 (Sepatu, Diterima)
(51, 109, 5, 87654321, '2023-05-27 09:00:00', 'Diterima di gudang', 'Gudang Yogyakarta'),
(52, 109, NULL, 87654321, '2023-05-27 12:30:00', 'Dalam pengiriman same day', 'Kota Yogyakarta'),
(53, 109, NULL, 87654321, '2023-05-27 15:45:00', 'Diterima penerima', 'Kota Yogyakarta'),

-- Log untuk paket 76543219 (Tas, Dalam proses)
(54, 110, 6, 76543219, '2023-05-28 10:15:00', 'Diterima di gudang', 'Gudang Bali'),
(55, 110, 6, 76543219, '2023-05-28 14:00:00', 'Dalam proses packing', 'Gudang Bali'),

-- Log untuk paket 65432198 (Elektronik, Dalam pengiriman)
(56, 101, 7, 65432198, '2023-05-29 08:30:00', 'Diterima di gudang', 'Gudang Makassar'),
(57, 101, 7, 65432198, '2023-05-30 09:45:00', 'Dalam perjalanan reguler', 'Gudang Makassar'),
(58, 101, NULL, 65432198, '2023-05-30 13:15:00', 'Sedang diantar kurir', 'Kota Makassar'),

-- Log untuk paket 54321987 (Pakaian, Terkirim)
(59, 102, 1, 54321987, '2023-05-31 11:00:00', 'Diterima di gudang', 'Gudang Pusat Jakarta'),
(60, 102, NULL, 54321987, '2023-06-01 14:30:00', 'Dalam pengiriman express', 'Kota Jakarta'),
(61, 102, NULL, 54321987, '2023-06-01 17:00:00', 'Terkirim ke penerima', 'Kota Jakarta'),

-- Log untuk paket 43219876 (Dokumen, Diterima)
(62, 103, 2, 43219876, '2023-06-02 13:45:00', 'Diterima di gudang', 'Gudang Bandung'),
(63, 103, NULL, 43219876, '2023-06-02 16:15:00', 'Dalam pengiriman reguler', 'Kota Bandung'),
(64, 103, NULL, 43219876, '2023-06-02 18:30:00', 'Diterima penerima', 'Kota Bandung'),

-- Log untuk paket 32198765 (Kosmetik, Dalam proses)
(65, 104, 3, 32198765, '2023-06-03 09:30:00', 'Diterima di gudang', 'Gudang Surabaya'),
(66, 104, 3, 32198765, '2023-06-03 12:45:00', 'Dalam proses express', 'Gudang Surabaya'),

-- Log untuk paket 21987654 (Mainan, Dalam pengiriman)
(67, 105, 4, 21987654, '2023-06-04 10:15:00', 'Diterima di gudang', 'Gudang Medan'),
(68, 105, NULL, 21987654, '2023-06-04 13:30:00', 'Dalam pengiriman same day', 'Kota Medan'),

-- Log untuk paket 19876543 (Buku, Terkirim)
(69, 106, 5, 19876543, '2023-06-05 08:45:00', 'Diterima di gudang', 'Gudang Yogyakarta'),
(70, 106, NULL, 19876543, '2023-06-05 11:15:00', 'Dalam pengiriman express', 'Kota Yogyakarta'),
(71, 106, NULL, 19876543, '2023-06-05 14:00:00', 'Terkirim ke penerima', 'Kota Yogyakarta'),

-- Log untuk paket 98765432 (Alat Rumah Tangga, Diterima)
(72, 107, 6, 98765432, '2023-06-06 12:00:00', 'Diterima di gudang', 'Gudang Bali'),
(73, 107, NULL, 98765432, '2023-06-06 15:30:00', 'Dalam pengiriman reguler', 'Kota Denpasar'),
(74, 107, NULL, 98765432, '2023-06-06 18:00:00', 'Diterima penerima', 'Kota Denpasar'),

-- Log untuk paket 87654329 (Aksesoris, Dalam proses)
(75, 108, 7, 87654329, '2023-06-07 14:15:00', 'Diterima di gudang', 'Gudang Makassar'),
(76, 108, 7, 87654329, '2023-06-07 16:45:00', 'Dalam proses express', 'Gudang Makassar'),

-- Log untuk paket 76543218 (Sepatu, Dalam pengiriman)
(77, 109, 1, 76543218, '2023-06-08 09:30:00', 'Diterima di gudang', 'Gudang Pusat Jakarta'),
(78, 109, 1, 76543218, '2023-06-09 08:45:00', 'Dalam perjalanan reguler', 'Gudang Pusat Jakarta'),
(79, 109, NULL, 76543218, '2023-06-09 12:00:00', 'Sedang diantar kurir', 'Kota Jakarta'),

-- Log untuk paket 65432197 (Tas, Terkirim)
(80, 110, 2, 65432197, '2023-06-10 11:15:00', 'Diterima di gudang', 'Gudang Bandung'),
(81, 110, NULL, 65432197, '2023-06-10 14:30:00', 'Dalam pengiriman express', 'Kota Bandung'),
(82, 110, NULL, 65432197, '2023-06-10 16:45:00', 'Terkirim ke penerima', 'Kota Bandung'),

-- Log untuk paket 54321986 (Elektronik, Diterima)
(83, 101, 1, 54321986, '2023-06-11 08:15:00', 'Diterima di gudang', 'Gudang Pusat Jakarta'),
(84, 101, NULL, 54321986, '2023-06-11 11:30:00', 'Dalam pengiriman same day', 'Kota Jakarta'),
(85, 101, NULL, 54321986, '2023-06-11 14:45:00', 'Diterima penerima', 'Kota Jakarta'),

-- Log untuk paket 43219875 (Pakaian, Dalam proses)
(86, 102, 4, 43219875, '2023-06-12 09:30:00', 'Diterima di gudang', 'Gudang Medan'),
(87, 102, 4, 43219875, '2023-06-12 13:45:00', 'Dalam proses express', 'Gudang Medan'),

-- Log untuk paket 32198764 (Dokumen, Dalam pengiriman)
(88, 103, 3, 32198764, '2023-06-13 10:00:00', 'Diterima di gudang', 'Gudang Surabaya'),
(89, 103, 3, 32198764, '2023-06-14 08:30:00', 'Dalam perjalanan reguler', 'Gudang Surabaya'),
(90, 103, NULL, 32198764, '2023-06-14 12:15:00', 'Sedang diantar kurir', 'Kota Surabaya'),

-- Log untuk paket 21987653 (Kosmetik, Terkirim)
(91, 104, 6, 21987653, '2023-06-15 11:45:00', 'Diterima di gudang', 'Gudang Bali'),
(92, 104, NULL, 21987653, '2023-06-15 15:00:00', 'Dalam pengiriman express', 'Kota Denpasar'),
(93, 104, NULL, 21987653, '2023-06-15 17:30:00', 'Terkirim ke penerima', 'Kota Denpasar'),

-- Log untuk paket 19876542 (Mainan, Diterima)
(94, 105, 2, 19876542, '2023-06-16 14:15:00', 'Diterima di gudang', 'Gudang Bandung'),
(95, 105, NULL, 19876542, '2023-06-16 16:45:00', 'Dalam pengiriman reguler', 'Kota Bandung'),
(96, 105, NULL, 19876542, '2023-06-16 19:00:00', 'Diterima penerima', 'Kota Bandung'),

-- Log untuk paket 98765431 (Buku, Dalam proses)
(97, 106, 5, 98765431, '2023-06-17 08:30:00', 'Diterima di gudang', 'Gudang Yogyakarta'),
(98, 106, 5, 98765431, '2023-06-17 12:00:00', 'Dalam proses express', 'Gudang Yogyakarta'),

-- Log untuk paket 87654328 (Alat Rumah Tangga, Dalam pengiriman)
(99, 107, 1, 87654328, '2023-06-18 09:45:00', 'Diterima di gudang', 'Gudang Pusat Jakarta'),
(100, 107, NULL, 87654328, '2023-06-18 13:15:00', 'Dalam pengiriman same day', 'Kota Jakarta'),

-- Log untuk paket 76543217 (Aksesoris, Terkirim)
(101, 108, 4, 76543217, '2023-06-19 10:30:00', 'Diterima di gudang', 'Gudang Medan'),
(102, 108, NULL, 76543217, '2023-06-19 14:00:00', 'Dalam pengiriman express', 'Kota Medan'),
(103, 108, NULL, 76543217, '2023-06-19 16:30:00', 'Terkirim ke penerima', 'Kota Medan'),

-- Log untuk paket 65432196 (Sepatu, Diterima)
(104, 109, 3, 65432196, '2023-06-20 11:15:00', 'Diterima di gudang', 'Gudang Surabaya'),
(105, 109, NULL, 65432196, '2023-06-20 15:45:00', 'Dalam pengiriman reguler', 'Kota Surabaya'),
(106, 109, NULL, 65432196, '2023-06-20 18:15:00', 'Diterima penerima', 'Kota Surabaya'),

-- Log untuk paket 54321985 (Tas, Dalam proses)
(107, 110, 7, 54321985, '2023-06-21 13:00:00', 'Diterima di gudang', 'Gudang Makassar'),
(108, 110, 7, 54321985, '2023-06-21 16:30:00', 'Dalam proses express', 'Gudang Makassar'),

-- Log untuk paket 43219874 (Elektronik, Dalam pengiriman)
(109, 101, 2, 43219874, '2023-06-22 08:45:00', 'Diterima di gudang', 'Gudang Bandung'),
(110, 101, 2, 43219874, '2023-06-23 07:30:00', 'Dalam perjalanan reguler', 'Gudang Bandung'),
(111, 101, NULL, 43219874, '2023-06-23 11:00:00', 'Sedang diantar kurir', 'Kota Bandung'),

-- Log untuk paket 32198763 (Pakaian, Terkirim)
(112, 102, 5, 32198763, '2023-06-24 09:15:00', 'Diterima di gudang', 'Gudang Yogyakarta'),
(113, 102, NULL, 32198763, '2023-06-24 13:45:00', 'Dalam pengiriman express', 'Kota Yogyakarta'),
(114, 102, NULL, 32198763, '2023-06-24 16:15:00', 'Terkirim ke penerima', 'Kota Yogyakarta'),

-- Log untuk paket 21987652 (Dokumen, Diterima)
(115, 103, 1, 21987652, '2023-06-25 12:30:00', 'Diterima di gudang', 'Gudang Pusat Jakarta'),
(116, 103, NULL, 21987652, '2023-06-25 15:00:00', 'Dalam pengiriman same day', 'Kota Jakarta'),
(117, 103, NULL, 21987652, '2023-06-25 17:45:00', 'Diterima penerima', 'Kota Jakarta'),

-- Log untuk paket 19876541 (Kosmetik, Dalam proses)
(118, 104, 4, 19876541, '2023-06-26 10:45:00', 'Diterima di gudang', 'Gudang Medan'),
(119, 104, 4, 19876541, '2023-06-26 14:15:00', 'Dalam proses express', 'Gudang Medan'),

-- Log untuk paket 98765430 (Mainan, Dalam pengiriman)
(120, 105, 3, 98765430, '2023-06-27 08:00:00', 'Diterima di gudang', 'Gudang Surabaya'),
(121, 105, 3, 98765430, '2023-06-28 07:15:00', 'Dalam perjalanan reguler', 'Gudang Surabaya'),
(122, 105, NULL, 98765430, '2023-06-28 10:45:00', 'Sedang diantar kurir', 'Kota Surabaya'),

-- Log untuk paket 87654327 (Buku, Terkirim)
(123, 106, 6, 87654327, '2023-06-29 11:30:00', 'Diterima di gudang', 'Gudang Bali'),
(124, 106, NULL, 87654327, '2023-06-29 15:00:00', 'Dalam pengiriman express', 'Kota Denpasar'),
(125, 106, NULL, 87654327, '2023-06-29 17:30:00', 'Terkirim ke penerima', 'Kota Denpasar'),

-- Log untuk paket 76543216 (Alat Rumah Tangga, Diterima)
(126, 107, 2, 76543216, '2023-06-30 13:45:00', 'Diterima di gudang', 'Gudang Bandung'),
(127, 107, NULL, 76543216, '2023-06-30 16:15:00', 'Dalam pengiriman reguler', 'Kota Bandung'),
(128, 107, NULL, 76543216, '2023-06-30 18:45:00', 'Diterima penerima', 'Kota Bandung'),

-- Log untuk paket 65432195 (Aksesoris, Dalam proses)
(129, 108, 5, 65432195, '2023-07-01 09:00:00', 'Diterima di gudang', 'Gudang Yogyakarta'),
(130, 108, 5, 65432195, '2023-07-01 12:30:00', 'Dalam proses express', 'Gudang Yogyakarta'),

-- Log untuk paket 54321984 (Sepatu, Dalam pengiriman)
(131, 109, 1, 54321984, '2023-07-02 10:15:00', 'Diterima di gudang', 'Gudang Pusat Jakarta'),
(132, 109, NULL, 54321984, '2023-07-02 13:45:00', 'Dalam pengiriman same day', 'Kota Jakarta'),

-- Log untuk paket 43219873 (Tas, Terkirim)
(133, 110, 4, 43219873, '2023-07-03 08:30:00', 'Diterima di gudang', 'Gudang Medan'),
(134, 110, NULL, 43219873, '2023-07-03 12:00:00', 'Dalam pengiriman express', 'Kota Medan'),
(135, 110, NULL, 43219873, '2023-07-03 14:30:00', 'Terkirim ke penerima', 'Kota Medan'),

-- Log untuk paket 32198762 (Elektronik, Diterima)
(136, 101, 3, 32198762, '2023-07-04 11:45:00', 'Diterima di gudang', 'Gudang Surabaya'),
(137, 101, NULL, 32198762, '2023-07-04 15:15:00', 'Dalam pengiriman reguler', 'Kota Surabaya'),
(138, 101, NULL, 32198762, '2023-07-04 18:00:00', 'Diterima penerima', 'Kota Surabaya'),

-- Log untuk paket 21987651 (Pakaian, Dalam proses)
(139, 102, 7, 21987651, '2023-07-05 14:00:00', 'Diterima di gudang', 'Gudang Makassar'),
(140, 102, 7, 21987651, '2023-07-05 17:30:00', 'Dalam proses express', 'Gudang Makassar'),

-- Log untuk paket 19876540 (Dokumen, Dalam pengiriman)
(141, 103, 2, 19876540, '2023-07-06 09:15:00', 'Diterima di gudang', 'Gudang Bandung'),
(142, 103, 2, 19876540, '2023-07-07 08:30:00', 'Dalam perjalanan reguler', 'Gudang Bandung'),
(143, 103, NULL, 19876540, '2023-07-07 12:00:00', 'Sedang diantar kurir', 'Kota Bandung'),

-- Log untuk paket 98765439 (Kosmetik, Terkirim)
(144, 104, 5, 98765439, '2023-07-08 10:45:00', 'Diterima di gudang', 'Gudang Yogyakarta'),
(145, 104, NULL, 98765439, '2023-07-08 14:15:00', 'Dalam pengiriman express', 'Kota Yogyakarta'),
(146, 104, NULL, 98765439, '2023-07-08 16:45:00', 'Terkirim ke penerima', 'Kota Yogyakarta'),

-- Log untuk paket 87654326 (Mainan, Diterima)
(147, 105, 1, 87654326, '2023-07-09 13:00:00', 'Diterima di gudang', 'Gudang Pusat Jakarta'),
(148, 105, NULL, 87654326, '2023-07-09 15:30:00', 'Dalam pengiriman same day', 'Kota Jakarta'),
(149, 105, NULL, 87654326, '2023-07-09 18:15:00', 'Diterima penerima', 'Kota Jakarta'),

-- Log untuk paket 76543215 (Buku, Dalam proses)
(150, 106, 4, 76543215, '2023-07-10 08:45:00', 'Diterima di gudang', 'Gudang Medan'),
(151, 106, 4, 76543215, '2023-07-10 12:15:00', 'Dalam proses express', 'Gudang Medan'),

-- Log untuk paket 65432194 (Alat Rumah Tangga, Dalam pengiriman)
(152, 107, 3, 65432194, '2023-07-11 11:30:00', 'Diterima di gudang', 'Gudang Surabaya'),
(153, 107, 3, 65432194, '2023-07-12 10:45:00', 'Dalam perjalanan reguler', 'Gudang Surabaya'),
(154, 107, NULL, 65432194, '2023-07-12 14:15:00', 'Sedang diantar kurir', 'Kota Surabaya'),

-- Log untuk paket 54321983 (Aksesoris, Terkirim)
(155, 108, 6, 54321983, '2023-07-13 09:00:00', 'Diterima di gudang', 'Gudang Bali'),
(156, 108, NULL, 54321983, '2023-07-13 12:30:00', 'Dalam pengiriman express', 'Kota Denpasar'),
(157, 108, NULL, 54321983, '2023-07-13 15:00:00', 'Terkirim ke penerima', 'Kota Denpasar'),

-- Log untuk paket 43219872 (Sepatu, Diterima)
(158, 109, 2, 43219872, '2023-07-14 14:15:00', 'Diterima di gudang', 'Gudang Bandung'),
(159, 109, NULL, 43219872, '2023-07-14 16:45:00', 'Dalam pengiriman reguler', 'Kota Bandung'),
(160, 109, NULL, 43219872, '2023-07-14 19:15:00', 'Diterima penerima', 'Kota Bandung'),

-- Log untuk paket 32198761 (Tas, Dalam proses)
(161, 110, 5, 32198761, '2023-07-15 10:30:00', 'Diterima di gudang', 'Gudang Yogyakarta'),
(162, 110, 5, 32198761, '2023-07-15 14:00:00', 'Dalam proses express', 'Gudang Yogyakarta'),

-- Log untuk paket 21987650 (Elektronik, Dalam pengiriman)
(163, 101, 1, 21987650, '2023-07-16 08:45:00', 'Diterima di gudang', 'Gudang Pusat Jakarta'),
(164, 101, NULL, 21987650, '2023-07-16 12:15:00', 'Dalam pengiriman same day', 'Kota Jakarta'),

-- Log untuk paket 19876539 (Pakaian, Terkirim)
(165, 102, 4, 19876539, '2023-07-17 11:00:00', 'Diterima di gudang', 'Gudang Medan'),
(166, 102, NULL, 19876539, '2023-07-17 14:30:00', 'Dalam pengiriman express', 'Kota Medan'),
(167, 102, NULL, 19876539, '2023-07-17 17:00:00', 'Terkirim ke penerima', 'Kota Medan'),

-- Log untuk paket 98765438 (Dokumen, Diterima)
(168, 103, 3, 98765438, '2023-07-18 13:15:00', 'Diterima di gudang', 'Gudang Surabaya'),
(169, 103, NULL, 98765438, '2023-07-18 15:45:00', 'Dalam pengiriman reguler', 'Kota Surabaya'),
(170, 103, NULL, 98765438, '2023-07-18 18:30:00', 'Diterima penerima', 'Kota Surabaya'),

-- Log untuk paket 87654325 (Kosmetik, Dalam proses)
(171, 104, 7, 87654325, '2023-07-19 09:30:00', 'Diterima di gudang', 'Gudang Makassar'),
(172, 104, 7, 87654325, '2023-07-19 13:00:00', 'Dalam proses express', 'Gudang Makassar'),

-- Log untuk paket 76543214 (Mainan, Dalam pengiriman)
(173, 105, 2, 76543214, '2023-07-20 10:45:00', 'Diterima di gudang', 'Gudang Bandung'),
(174, 105, 2, 76543214, '2023-07-21 10:00:00', 'Dalam perjalanan reguler', 'Gudang Bandung'),
(175, 105, NULL, 76543214, '2023-07-21 13:30:00', 'Sedang diantar kurir', 'Kota Bandung'),

-- Log untuk paket 65432193 (Buku, Terkirim)
(176, 106, 5, 65432193, '2023-07-22 08:15:00', 'Diterima di gudang', 'Gudang Yogyakarta'),
(177, 106, NULL, 65432193, '2023-07-22 11:45:00', 'Dalam pengiriman express', 'Kota Yogyakarta'),
(178, 106, NULL, 65432193, '2023-07-22 14:15:00', 'Terkirim ke penerima', 'Kota Yogyakarta'),

-- Log untuk paket 54321982 (Alat Rumah Tangga, Diterima)
(179, 107, 1, 54321982, '2023-07-23 12:00:00', 'Diterima di gudang', 'Gudang Pusat Jakarta'),
(180, 107, NULL, 54321982, '2023-07-23 14:30:00', 'Dalam pengiriman same day', 'Kota Jakarta'),
(181, 107, NULL, 54321982, '2023-07-23 17:15:00', 'Diterima penerima', 'Kota Jakarta'),

-- Log untuk paket 43219871 (Aksesoris, Dalam proses)
(182, 108, 4, 43219871, '2023-07-24 09:45:00', 'Diterima di gudang', 'Gudang Medan'),
(183, 108, 4, 43219871, '2023-07-24 13:15:00', 'Dalam proses express', 'Gudang Medan'),

-- Log untuk paket 32198760 (Sepatu, Dalam pengiriman)
(184, 109, 3, 32198760, '2023-07-25 11:30:00', 'Diterima di gudang', 'Gudang Surabaya'),
(185, 109, 3, 32198760, '2023-07-26 10:45:00', 'Dalam perjalanan reguler', 'Gudang Surabaya'),
(186, 109, NULL, 32198760, '2023-07-26 14:15:00', 'Sedang diantar kurir', 'Kota Surabaya'),

-- Log untuk paket 21987649 (Tas, Terkirim)
(187, 110, 6, 21987649, '2023-07-27 08:00:00', 'Diterima di gudang', 'Gudang Bali'),
(188, 110, NULL, 21987649, '2023-07-27 11:30:00', 'Dalam pengiriman express', 'Kota Denpasar'),
(189, 110, NULL, 21987649, '2023-07-27 14:00:00', 'Terkirim ke penerima', 'Kota Denpasar'),

-- Log untuk paket 19876538 (Elektronik, Diterima)
(190, 101, 2, 19876538, '2023-07-28 13:15:00', 'Diterima di gudang', 'Gudang Bandung'),
(191, 101, NULL, 19876538, '2023-07-28 15:45:00', 'Dalam pengiriman reguler', 'Kota Bandung'),
(192, 101, NULL, 19876538, '2023-07-28 18:30:00', 'Diterima penerima', 'Kota Bandung'),

-- Log untuk paket 98765437 (Pakaian, Dalam proses)
(193, 102, 5, 98765437, '2023-07-29 10:30:00', 'Diterima di gudang', 'Gudang Yogyakarta'),
(194, 102, 5, 98765437, '2023-07-29 14:00:00', 'Dalam proses express', 'Gudang Yogyakarta'),

-- Log untuk paket 87654324 (Dokumen, Dalam pengiriman)
(195, 103, 1, 87654324, '2023-07-30 08:45:00', 'Diterima di gudang', 'Gudang Pusat Jakarta'),
(196, 103, NULL, 87654324, '2023-07-30 12:15:00', 'Dalam pengiriman same day', 'Kota Jakarta'),

-- Log untuk paket 76543213 (Kosmetik, Terkirim)
(197, 104, 4, 76543213, '2023-07-31 11:00:00', 'Diterima di gudang', 'Gudang Medan'),
(198, 104, NULL, 76543213, '2023-07-31 14:30:00', 'Dalam pengiriman express', 'Kota Medan'),
(199, 104, NULL, 76543213, '2023-07-31 17:00:00', 'Terkirim ke penerima', 'Kota Medan'),

-- Log untuk paket 65432192 (Mainan, Diterima)
(200, 105, 3, 65432192, '2023-08-01 09:15:00', 'Diterima di gudang', 'Gudang Surabaya'),
(201, 105, NULL, 65432192, '2023-08-01 11:45:00', 'Dalam pengiriman reguler', 'Kota Surabaya'),
(202, 105, NULL, 65432192, '2023-08-01 14:30:00', 'Diterima penerima', 'Kota Surabaya'),

-- Log untuk paket 54321981 (Buku, Dalam proses)
(203, 106, 7, 54321981, '2023-08-02 13:00:00', 'Diterima di gudang', 'Gudang Makassar'),
(204, 106, 7, 54321981, '2023-08-02 16:30:00', 'Dalam proses express', 'Gudang Makassar'),

-- Log untuk paket 43219870 (Alat Rumah Tangga, Dalam pengiriman)
(205, 107, 2, 43219870, '2023-08-03 10:45:00', 'Diterima di gudang', 'Gudang Bandung'),
(206, 107, 2, 43219870, '2023-08-04 10:00:00', 'Dalam perjalanan reguler', 'Gudang Bandung'),
(207, 107, NULL, 43219870, '2023-08-04 13:30:00', 'Sedang diantar kurir', 'Kota Bandung'),

-- Log untuk paket 32198759 (Aksesoris, Terkirim)
(208, 108, 5, 32198759, '2023-08-05 08:30:00', 'Diterima di gudang', 'Gudang Yogyakarta'),
(209, 108, NULL, 32198759, '2023-08-05 12:00:00', 'Dalam pengiriman express', 'Kota Yogyakarta'),
(210, 108, NULL, 32198759, '2023-08-05 14:30:00', 'Terkirim ke penerima', 'Kota Yogyakarta'),

-- Log untuk paket 21987648 (Sepatu, Diterima)
(211, 109, 1, 21987648, '2023-08-06 11:15:00', 'Diterima di gudang', 'Gudang Pusat Jakarta'),
(212, 109, NULL, 21987648, '2023-08-06 13:45:00', 'Dalam pengiriman same day', 'Kota Jakarta'),
(213, 109, NULL, 21987648, '2023-08-06 16:30:00', 'Diterima penerima', 'Kota Jakarta'),

-- Log untuk paket 19876537 (Tas, Dalam proses)
(214, 110, 4, 19876537, '2023-08-07 09:00:00', 'Diterima di gudang', 'Gudang Medan'),
(215, 110, 4, 19876537, '2023-08-07 12:30:00', 'Dalam proses express', 'Gudang Medan'),

-- Log untuk paket 98765436 (Elektronik, Dalam pengiriman)
(216, 101, 3, 98765436, '2023-08-08 14:15:00', 'Diterima di gudang', 'Gudang Surabaya'),
(217, 101, 3, 98765436, '2023-08-09 13:30:00', 'Dalam perjalanan reguler', 'Gudang Surabaya'),
(218, 101, NULL, 98765436, '2023-08-09 17:00:00', 'Sedang diantar kurir', 'Kota Surabaya'),

-- Log untuk paket 87654323 (Pakaian, Terkirim)
(219, 102, 6, 87654323, '2023-08-10 10:45:00', 'Diterima di gudang', 'Gudang Bali'),
(220, 102, NULL, 87654323, '2023-08-10 14:15:00', 'Dalam pengiriman express', 'Kota Denpasar'),
(221, 102, NULL, 87654323, '2023-08-10 16:45:00', 'Terkirim ke penerima', 'Kota Denpasar'),

-- Log untuk paket 76543212 (Dokumen, Diterima)
(222, 103, 2, 76543212, '2023-08-11 08:00:00', 'Diterima di gudang', 'Gudang Bandung'),
(223, 103, NULL, 76543212, '2023-08-11 10:30:00', 'Dalam pengiriman reguler', 'Kota Bandung'),
(224, 103, NULL, 76543212, '2023-08-11 13:15:00', 'Diterima penerima', 'Kota Bandung'),

-- Log untuk paket 65432191 (Kosmetik, Dalam proses)
(225, 104, 5, 65432191, '2023-08-12 11:30:00', 'Diterima di gudang', 'Gudang Yogyakarta'),
(226, 104, 5, 65432191, '2023-08-12 15:00:00', 'Dalam proses express', 'Gudang Yogyakarta'),

-- Log untuk paket 54321980 (Mainan, Dalam pengiriman)
(227, 105, 1, 54321980, '2023-08-13 09:45:00', 'Diterima di gudang', 'Gudang Pusat Jakarta'),
(228, 105, NULL, 54321980, '2023-08-13 13:15:00', 'Dalam pengiriman same day', 'Kota Jakarta'),

-- Log untuk paket 43219869 (Buku, Terkirim)
(229, 106, 4, 43219869, '2023-08-14 12:00:00', 'Diterima di gudang', 'Gudang Medan'),
(230, 106, NULL, 43219869, '2023-08-14 15:30:00', 'Dalam pengiriman express', 'Kota Medan'),
(231, 106, NULL, 43219869, '2023-08-14 18:00:00', 'Terkirim ke penerima', 'Kota Medan'),

-- Log untuk paket 32198758 (Alat Rumah Tangga, Diterima)
(232, 107, 3, 32198758, '2023-08-15 10:15:00', 'Diterima di gudang', 'Gudang Surabaya'),
(233, 107, NULL, 32198758, '2023-08-15 12:45:00', 'Dalam pengiriman reguler', 'Kota Surabaya'),
(234, 107, NULL, 32198758, '2023-08-15 15:30:00', 'Diterima penerima', 'Kota Surabaya'),

-- Log untuk paket 21987647 (Aksesoris, Dalam proses)
(235, 108, 7, 21987647, '2023-08-16 08:30:00', 'Diterima di gudang', 'Gudang Makassar'),
(236, 108, 7, 21987647, '2023-08-16 12:00:00', 'Dalam proses express', 'Gudang Makassar'),

-- Log untuk paket 19876536 (Sepatu, Dalam pengiriman)
(237, 109, 2, 19876536, '2023-08-17 11:45:00', 'Diterima di gudang', 'Gudang Bandung'),
(238, 109, 2, 19876536, '2023-08-18 11:00:00', 'Dalam perjalanan reguler', 'Gudang Bandung'),
(239, 109, NULL, 19876536, '2023-08-18 14:30:00', 'Sedang diantar kurir', 'Kota Bandung'),

-- Log untuk paket 98765435 (Tas, Terkirim)
(240, 110, 5, 98765435, '2023-08-19 09:15:00', 'Diterima di gudang', 'Gudang Yogyakarta'),
(241, 110, NULL, 98765435, '2023-08-19 12:45:00', 'Dalam pengiriman express', 'Kota Yogyakarta'),
(242, 110, NULL, 98765435, '2023-08-19 15:15:00', 'Terkirim ke penerima', 'Kota Yogyakarta'),

-- Log untuk paket 87654322 (Elektronik, Diterima)
(243, 101, 1, 87654322, '2023-08-20 13:30:00', 'Diterima di gudang', 'Gudang Pusat Jakarta'),
(244, 101, NULL, 87654322, '2023-08-20 16:00:00', 'Dalam pengiriman same day', 'Kota Jakarta'),
(245, 101, NULL, 87654322, '2023-08-20 18:45:00', 'Diterima penerima', 'Kota Jakarta'),

-- Log untuk paket 76543211 (Pakaian, Dalam proses)
(246, 101, 4, 76543211, '2025-05-20 08:00:00', 'Diterima di gudang', 'Gudang Jakarta'),
(247, 101, 4, 76543211, '2025-05-20 10:30:00', 'Dalam proses sorting', 'Gudang Jakarta'),
(248, 101, 4, 76543211, '2025-05-21 09:00:00', 'Dalam proses pengiriman', 'Jakarta'),

-- Log untuk paket 65432190 (Dokumen, Dalam pengiriman)
(249, 102, 3, 65432190, '2025-05-19 11:20:00', 'Diterima di gudang', 'Gudang Bandung'),
(250, 102, 3, 65432190, '2025-05-19 14:45:00', 'Dalam proses pengiriman', 'Gudang Bandung'),
(251, 102, NULL, 65432190, '2025-05-20 09:30:00', 'Sedang diantar kurir', 'Kota Bandung'),
(252, 102, NULL, 65432190, '2025-05-20 12:15:00', 'Dalam pengiriman', 'Kota Bandung'),

-- Log untuk paket 54321979 (Kosmetik, Terkirim)
(253, 103, 6, 54321979, '2025-05-17 11:00:00', 'Diterima di gudang', 'Gudang Surabaya'),
(254, 103, 6, 54321979, '2025-05-17 13:30:00', 'Dalam proses pengiriman', 'Gudang Surabaya'),
(255, 103, NULL, 54321979, '2025-05-18 10:00:00', 'Paket terkirim', 'Surabaya'),

-- Log untuk paket 43219868 (Mainan, Diterima)
(256, 104, 2, 43219868, '2025-05-16 13:20:00', 'Diterima di gudang', 'Gudang Semarang'),
(257, 104, 2, 43219868, '2025-05-17 15:00:00', 'Dalam pengiriman', 'Semarang'),
(258, 104, NULL, 43219868, '2025-05-18 16:10:00', 'Paket diterima penerima', 'Semarang'),

-- Log untuk paket 32198757 (Buku, Dalam proses)
(259, 105, 5, 32198757, '2025-05-20 08:45:00', 'Diterima di gudang', 'Gudang Yogyakarta'),
(260, 105, 5, 32198757, '2025-05-20 11:00:00', 'Dalam proses pengiriman', 'Yogyakarta'),
(261, 105, 5, 32198757, '2025-05-21 09:30:00', 'Dalam proses', 'Yogyakarta'),

-- Log untuk paket 21987646 (Alat Rumah Tangga, Dalam pengiriman)
(262, 106, 1, 21987646, '2025-05-20 06:30:00', 'Diterima di gudang', 'Gudang Bali'),
(263, 106, 1, 21987646, '2025-05-20 09:00:00', 'Dalam pengiriman', 'Bali'),

-- Log untuk paket 19876535 (Aksesoris, Terkirim)
(264, 107, 4, 19876535, '2025-05-18 08:15:00', 'Diterima di gudang', 'Gudang Jakarta'),
(265, 107, 4, 19876535, '2025-05-18 10:30:00', 'Paket dikirim ke kurir', 'Gudang Jakarta'),
(266, 107, NULL, 19876535, '2025-05-19 13:00:00', 'Paket terkirim', 'Jakarta'),

-- Log untuk paket 98765434 (Sepatu, Diterima)
(267, 108, 3, 98765434, '2025-05-17 07:00:00', 'Diterima di gudang', 'Gudang Bandung'),
(268, 108, 3, 98765434, '2025-05-18 09:00:00', 'Dalam pengiriman', 'Bandung'),
(269, 108, NULL, 98765434, '2025-05-19 11:00:00', 'Paket diterima penerima', 'Bandung'),

-- Log untuk paket 87345643 (Tas, Dalam proses)
(270, 109, 7, 87345643, '2025-05-20 08:00:00', 'Diterima di gudang', 'Gudang Medan'),
(271, 109, 7, 87345643, '2025-05-20 10:30:00', 'Dalam proses pengiriman', 'Medan'),

-- Tambahan log dengan id_kurir 110 untuk contoh lain
(272, 110, 5, 32198757, '2025-05-22 14:00:00', 'Paket sedang transit', 'Gudang Yogyakarta');
