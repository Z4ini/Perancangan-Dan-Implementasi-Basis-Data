/* Create the database */
CREATE DATABASE  IF NOT EXISTS DB_SiPaket;

/* Switch to the classicmodels database */
USE DB_SiPaket;


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
(1, 'Andi Wijaya', '081234567890', 'Jl. Merpati No. 10'),
(2, 'Budi Santoso', '082112233445', 'Jl. Anggrek No. 5'),
(3, 'Citra Dewi', '083344556677', 'Jl. Melati No. 15'),
(4, 'Dedi Irawan', '084455667788', 'Jl. Kenanga No. 20'),
(5, 'Eka Saputra', '085566778899', 'Jl. Mawar No. 7'),
(6, 'Fajar Pratama', '086677889900', 'Jl. Cendana No. 12'),
(7, 'Gina Lestari', '087788990011', 'Jl. Dahlia No. 17'),
(8, 'Hendra Gunawan', '088899001122', 'Jl. Teratai No. 9'),
(9, 'Indah Permata', '089900112233', 'Jl. Flamboyan No. 2'),
(10, 'Joko Widodo', '081212345678', 'Jl. Sawo No. 8');


-- masukan data kurir
INSERT INTO kurir VALUES
(1, 'Rina Marlina', '081122334455'),
(2, 'Joko Susilo', '082233445566'),
(3, 'Wawan Hermawan', '083344556677'),
(4, 'Lina Agustin', '084455667788'),
(5, 'Doni Firmansyah', '085566778899'),
(6, 'Feri Nugraha', '086677889900'),
(7, 'Rina Apriani', '087788990011'),
(8, 'Bayu Saputra', '088899001122'),
(9, 'Nina Kartika', '089900112233'),
(10, 'Arif Santosa', '080011122233');

-- masukan data gudang 
INSERT INTO gudang VALUES
(1, 'Jl. Industri No. 1', 'Jakarta', '10110'),
(2, 'Jl. Logistik No. 2', 'Bandung', '40212'),
(3, 'Jl. Gudang Raya No. 3', 'Surabaya', '60123'),
(4, 'Jl. Penyimpanan No. 4', 'Semarang', '50245'),
(5, 'Jl. Transit No. 5', 'Yogyakarta', '55111'),
(6, 'Jl. Distribusi No. 6', 'Medan', '20112'),
(7, 'Jl. Pergudangan No. 7', 'Palembang', '30111'),
(8, 'Jl. Warehouse No. 8', 'Makassar', '90123'),
(9, 'Jl. Ekspedisi No. 9', 'Denpasar', '80111'),
(10, 'Jl. Central No. 10', 'Balikpapan', '76111');

-- masukan data paket
INSERT INTO paket VALUES
(10001, 1, 3, '20x15x10', 'Elektronik', '5000000', 'Reguler', 'Dalam Perjalanan'),
(10002, 2, 2, '10x10x10', 'Dokumen', '200000', 'Ekspres', 'Terkirim'),
(10003, 3, 4, '25x20x15', 'Pakaian', '1500000', 'Reguler', 'Dalam Perjalanan'),
(10004, 4, 1, '15x10x5', 'Kosmetik', '300000', 'Ekspres', 'Terkirim'),
(10005, 5, 6, '30x20x20', 'Makanan', '750000', 'Reguler', 'Dalam Perjalanan'),
(10006, 6, 3, '22x22x22', 'Mainan', '600000', 'Reguler', 'Terkirim'),
(10007, 7, 5, '18x12x10', 'Buku', '250000', 'Ekspres', 'Dalam Perjalanan'),
(10008, 8, 7, '40x30x20', 'Peralatan', '1250000', 'Reguler', 'Terkirim'),
(10009, 9, 2, '15x15x15', 'Dokumen', '200000', 'Ekspres', 'Dalam Perjalanan'),
(10010, 10, 8, '35x25x15', 'Elektronik', '3500000', 'Reguler', 'Terkirim');

-- masukan data log pelacakan
INSERT INTO log_pelacakan VALUES
(1, 1, 1, 10001, '2025-05-20 08:00:00', 'Diterima Gudang', 'Jakarta'),
(2, 2, 2, 10002, '2025-05-20 09:00:00', 'Keluar Gudang', 'Bandung'),
(3, 3, 3, 10003, '2025-05-20 10:00:00', 'Dalam Perjalanan', 'Surabaya'),
(4, 4, 4, 10004, '2025-05-20 11:00:00', 'Terkirim', 'Semarang'),
(5, 5, 5, 10005, '2025-05-20 12:00:00', 'Diterima Gudang', 'Yogyakarta'),
(6, 6, 6, 10006, '2025-05-20 13:00:00', 'Terkirim', 'Medan'),
(7, 7, 7, 10007, '2025-05-20 14:00:00', 'Dalam Perjalanan', 'Palembang'),
(8, 8, 8, 10008, '2025-05-20 15:00:00', 'Keluar Gudang', 'Makassar'),
(9, 9, 9, 10009, '2025-05-20 16:00:00', 'Diterima Gudang', 'Denpasar'),
(10, 10, 10, 10010, '2025-05-20 17:00:00', 'Terkirim ', 'Balikpapan');
