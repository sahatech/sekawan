-- Membuat Schema table Aplikasi SEKAWAN
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


CREATE TABLE IF NOT EXISTS  kategori_campaign(
id int primary key auto_increment,
nama_campaign varchar(255) NULL
);

/*
mysql> desc lokasi_campaign;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| daftar_wilayah | varchar(45) | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
2 rows in set (0,00 sec)
*/

CREATE TABLE IF NOT EXISTS lokasi_campaign(
id int primary key auto_increment,
daftar_wilayah varchar(45) NULL
);

/*
mysql> desc lokasi_provinsi;
+-------------------+-------------+------+-----+---------+----------------+
| Field             | Type        | Null | Key | Default | Extra          |
+-------------------+-------------+------+-----+---------+----------------+
| id                | int(11)     | NO   | PRI | NULL    | auto_increment |
| nama_provinsi     | varchar(50) | YES  |     | NULL    |                |
| id_lokasicampaign | int(11)     | YES  | MUL | NULL    |                |
+-------------------+-------------+------+-----+---------+----------------+
3 rows in set (0,01 sec)
*/

CREATE TABLE IF NOT EXISTS lokasi_provinsi(
id int primary key auto_increment,
nama_provinsi varchar(50) NULL,
id_lokasicampaign int NULL,
FOREIGN KEY (id_lokasicampaign) REFERENCES lokasi_campaign(id)
);

/*
mysql> desc lokasi_kota;
+-------------------+-------------+------+-----+---------+----------------+
| Field             | Type        | Null | Key | Default | Extra          |
+-------------------+-------------+------+-----+---------+----------------+
| id                | int(11)     | NO   | PRI | NULL    | auto_increment |
| nama_kota         | varchar(50) | YES  |     | NULL    |                |
| id_lokasiprovinsi | int(11)     | YES  | MUL | NULL    |                |
+-------------------+-------------+------+-----+---------+----------------+
3 rows in set (0,00 sec)
*/

CREATE TABLE IF NOT EXISTS lokasi_kota(
id int primary key auto_increment,
nama_kota varchar(50) NULL,
id_lokasiprovinsi int NULL,
FOREIGN KEY (id_lokasiprovinsi) REFERENCES lokasi_provinsi(id)
);

/*
mysql> desc lokasi_kecamatan;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| nama_kecamatan | varchar(45) | YES  |     | NULL    |                |
| id_lokasikota  | int(11)     | YES  | MUL | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
3 rows in set (0,00 sec)

*/

CREATE TABLE IF NOT EXISTS lokasi_kecamatan(
id int primary key auto_increment,
nama_kecamatan varchar(45) NULL,
id_lokasikota int NULL,
FOREIGN KEY (id_lokasikota) REFERENCES lokasi_kota(id)
);

/*
mysql> desc lokasi_kecamatan;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| nama_kecamatan | varchar(45) | YES  |     | NULL    |                |
| id_lokasikota  | int(11)     | YES  | MUL | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
3 rows in set (0,00 sec)

*/

CREATE TABLE IF NOT EXISTS lokasi_kelurahan(
id int primary key auto_increment,
nama_kelurahan varchar(45) NULL,
id_lokasikecamatan int NULL,
FOREIGN KEY (id_lokasikecamatan) REFERENCES lokasi_kecamatan(id)
);

/*
mysql> desc user;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| id              | int(11)      | NO   | PRI | NULL    | auto_increment |
| nama_depan      | varchar(50)  | YES  |     | NULL    |                |
| nama_belakang   | varchar(50)  | YES  |     | NULL    |                |
| jenis_kelamin   | varchar(10)  | YES  |     | NULL    |                |
| tanggal_lahir   | date         | YES  |     | NULL    |                |
| alamat          | varchar(100) | YES  |     | NULL    |                |
| lokasi_kota_id  | int(11)      | YES  | MUL | NULL    |                |
| create_by       | int(11)      | YES  |     | NULL    |                |
| update_by       | int(11)      | YES  |     | NULL    |                |
| create_at       | timestamp    | YES  |     | NULL    |                |
| update_at       | timestamp    | YES  |     | NULL    |                |
| email           | varchar(45)  | YES  |     | NULL    |                |
| nomer_hp        | varchar(13)  | YES  |     | NULL    |                |
| deskripsi_minat | longtext     | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
14 rows in set (0,00 sec)
*/

CREATE TABLE IF NOT EXISTS user(
id int primary key auto_increment,
nama_depan varchar(50) NULL,
nama_belakang varchar(50) NULL,
jenis_kelamin varchar(10) NULL,
tanggal_lahir date NULL,
alamat varchar(100) NULL,
lokasi_kota_id int NULL,
FOREIGN KEY (lokasi_kota_id) REFERENCES lokasi_kota(id),
create_by int NULL,
update_by int NULL,
create_at timestamp NULL,
update_at timestamp NULL,
email varchar(45) NULL,
nomer_hp varchar(13) NULL,
deskripsi_minat longtext NULL
);

/*
mysql> desc pembuat_campaign;
+--------------------+--------------+------+-----+---------+----------------+
| Field              | Type         | Null | Key | Default | Extra          |
+--------------------+--------------+------+-----+---------+----------------+
| id                 | int(11)      | NO   | PRI | NULL    | auto_increment |
| judul_campaign     | varchar(255) | YES  |     | NULL    |                |
| deskripsi_campaign | longtext     | YES  |     | NULL    |                |
| jumlah_relawan     | int(11)      | YES  |     | NULL    |                |
| create_by          | int(11)      | YES  |     | NULL    |                |
| update_by          | int(11)      | YES  |     | NULL    |                |
| create_at          | timestamp    | YES  |     | NULL    |                |
| update_at          | timestamp    | YES  |     | NULL    |                |
| user_id            | int(11)      | YES  | MUL | NULL    |                |
| kategori_id        | int(11)      | YES  | MUL | NULL    |                |
| lokasi_campaign_id | int(11)      | YES  | MUL | NULL    |                |
+--------------------+--------------+------+-----+---------+----------------+
11 rows in set (0,01 sec)
*/

CREATE TABLE IF NOT EXISTS pembuat_campaign(
id int primary key auto_increment,
judul_campaign varchar(255) NULL,
deskripsi_campaign longtext NULL,
jumlah_relawan int NULL,
create_by int NULL,
update_by int NULL,
create_at timestamp NULL,
update_at timestamp NULL,
user_id int NULL,
kategori_id int NULL,
lokasi_campaign_id int NULL,
FOREIGN KEY (user_id) REFERENCES user(id),
FOREIGN KEY (kategori_id) REFERENCES kategori_campaign(id),
FOREIGN KEY (lokasi_campaign_id) REFERENCES lokasi_campaign(id)
);

/*
mysql> desc jadwal_campaign;
+---------------------+-----------+------+-----+---------+----------------+
| Field               | Type      | Null | Key | Default | Extra          |
+---------------------+-----------+------+-----+---------+----------------+
| id                  | int(11)   | NO   | PRI | NULL    | auto_increment |
| tanggal_awal        | date      | YES  |     | NULL    |                |
| tanggal_akhir       | date      | YES  |     | NULL    |                |
| create_by           | int(11)   | YES  |     | NULL    |                |
| update_by           | int(11)   | YES  |     | NULL    |                |
| create_at           | timestamp | YES  |     | NULL    |                |
| update_at           | timestamp | YES  |     | NULL    |                |
| pembuat_campaign_id | int(11)   | YES  | MUL | NULL    |                |
+---------------------+-----------+------+-----+---------+----------------+
8 rows in set (0,00 sec)
*/

CREATE TABLE IF NOT EXISTS jadwal_campaign(
id int primary key auto_increment,
tanggal_awal date NULL,
tanggal_akhir date NULL,
create_by int NULL,
update_by int NULL,
create_at timestamp NULL,
update_at timestamp NULL,
pembuat_campaign_id int NULL,
FOREIGN KEY (pembuat_campaign_id) REFERENCES pembuat_campaign(id)
);

/*
mysql> desc jadwal_berangkat;
+---------------------+-----------+------+-----+---------+----------------+
| Field               | Type      | Null | Key | Default | Extra          |
+---------------------+-----------+------+-----+---------+----------------+
| id                  | int(11)   | NO   | PRI | NULL    | auto_increment |
| tanggal_awal        | date      | YES  |     | NULL    |                |
| tanggal_akhir       | date      | YES  |     | NULL    |                |
| create_by           | int(11)   | YES  |     | NULL    |                |
| update_by           | int(11)   | YES  |     | NULL    |                |
| create_at           | timestamp | YES  |     | NULL    |                |
| update_at           | timestamp | YES  |     | NULL    |                |
| pembuat_campaign_id | int(11)   | YES  | MUL | NULL    |                |
+---------------------+-----------+------+-----+---------+----------------+
8 rows in set (0,09 sec)
*/

CREATE TABLE IF NOT EXISTS jadwal_berangkat(
id int primary key auto_increment,
tanggal_awal date NULL,
tanggal_akhir date NULL,
create_by int NULL,
update_by int NULL,
create_at timestamp NULL,
update_at timestamp NULL,
pembuat_campaign_id int NULL,
FOREIGN KEY (pembuat_campaign_id) REFERENCES pembuat_campaign(id)
);

/*
mysql> desc campaign;
+---------------------+-----------+------+-----+---------+----------------+
| Field               | Type      | Null | Key | Default | Extra          |
+---------------------+-----------+------+-----+---------+----------------+
| id                  | int(11)   | NO   | PRI | NULL    | auto_increment |
| create_by           | int(11)   | YES  |     | NULL    |                |
| update_by           | int(11)   | YES  |     | NULL    |                |
| create_at           | timestamp | YES  |     | NULL    |                |
| update_at           | timestamp | YES  |     | NULL    |                |
| pembuat_campaign_id | int(11)   | YES  | MUL | NULL    |                |
| user_id             | int(11)   | YES  | MUL | NULL    |                |
+---------------------+-----------+------+-----+---------+----------------+
7 rows in set (0,00 sec)
*/

CREATE TABLE IF NOT EXISTS campaign(
id int primary key auto_increment,
create_by int NULL,
update_by int NULL,
create_at timestamp NULL,
update_at timestamp NULL,
pembuat_campaign_id int NULL,
user_id int NULL,
FOREIGN KEY (pembuat_campaign_id) REFERENCES pembuat_campaign(id),
FOREIGN KEY (user_id) REFERENCES user(id)
);

/*
mysql> desc transaksi;
+-------------+-----------+------+-----+---------+----------------+
| Field       | Type      | Null | Key | Default | Extra          |
+-------------+-----------+------+-----+---------+----------------+
| id          | int(11)   | NO   | PRI | NULL    | auto_increment |
| jumlah_dana | int(11)   | YES  |     | NULL    |                |
| user_id     | int(11)   | YES  | MUL | NULL    |                |
| create_by   | int(11)   | YES  |     | NULL    |                |
| update_by   | int(11)   | YES  |     | NULL    |                |
| create_at   | timestamp | YES  |     | NULL    |                |
| update_at   | timestamp | YES  |     | NULL    |                |
| campaign_id | int(11)   | YES  | MUL | NULL    |                |
+-------------+-----------+------+-----+---------+----------------+
8 rows in set (0,00 sec)
*/

CREATE TABLE IF NOT EXISTS transaksi(
id int primary key auto_increment,
jumlah_dana int NULL,
user_id int NULL,
create_by int NULL,
update_by int NULL,
create_at timestamp NULL,
update_at timestamp NULL,
campaign_id int NULL,
FOREIGN KEY (user_id) REFERENCES user(id),
FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

/*
mysql> desc history;
+---------------------+-----------+------+-----+---------+----------------+
| Field               | Type      | Null | Key | Default | Extra          |
+---------------------+-----------+------+-----+---------+----------------+
| id                  | int(11)   | NO   | PRI | NULL    | auto_increment |
| user_id             | int(11)   | YES  | MUL | NULL    |                |
| pembuat_campaign_id | int(11)   | YES  | MUL | NULL    |                |
| campaign_id         | int(11)   | YES  | MUL | NULL    |                |
| create_by           | int(11)   | YES  |     | NULL    |                |
| update_by           | int(11)   | YES  |     | NULL    |                |
| create_at           | timestamp | YES  |     | NULL    |                |
| update_at           | timestamp | YES  |     | NULL    |                |
+---------------------+-----------+------+-----+---------+----------------+
8 rows in set (0,00 sec)
*/

CREATE TABLE IF NOT EXISTS history (
id int primary key auto_increment,
user_id int NULL,
pembuat_campaign_id int NULL,
campaign_id int NULL,
FOREIGN KEY (user_id) REFERENCES user(id),
FOREIGN KEY (pembuat_campaign_id) REFERENCES pembuat_campaign(id),
FOREIGN KEY (campaign_id) REFERENCES campaign(id),
create_by int NULL,
update_by int NULL,
create_at timestamp NULL,
update_at timestamp NULL
);


-- ISI DATA DARI TABLE APLIKASI SEKAWAN (SOSIAL EDUKASI ALAM WISATAWAN)

INSERT INTO lokasi_campaign VALUES
(default, "Wilayah I"), (default, "Wilayah II"), (default, "Wilayah III");

/*
mysql> select * from lokasi_campaign;
+----+----------------+
| id | daftar_wilayah |
+----+----------------+
|  1 | Wilayah I      |
|  2 | Wilayah II     |
|  3 | Wilayah III    |
+----+----------------+
3 rows in set (0,09 sec)
*/

INSERT INTO lokasi_provinsi VALUES
(default, "Aceh", 1),
(default, "Sumatera Utara", 1),
(default, "Sumatera Barat", 1),
(default, "Riau", 1),
(default, "Kepulauan Riau (Kepri)", 1),
(default, "Jambi", 1),
(default, "Sumatera Selatan", 1),
(default, "Lampung", 1),
(default, "Bangka Belitung", 1),
(default, "Bengkulu", 1),
(default, "DKI Jakarta", 1),
(default, "Jawa Barat", 1),
(default, "Banten", 1),
(default, "Jawa Tengah", 1),
(default, "DI Yogyakarta", 1),
(default, "Jawa Timur", 1),
(default, "Kalimantan Barat", 1),
(default, "Kalimantan Timur", 1),
(default, "Kalimantan Utara", 2),
(default, "Kalimantan Timur", 2),
(default, "Kalimantan Selatan", 2),
(default, "Bali", 2),
(default, "Nusa Tenggara Barat", 2),
(default, "Nusa Tenggara Timur", 2),
(default, "Sulawesi Barat", 2),
(default, "Sulawesi Tengah", 2),
(default, "Sulawesi Selatan", 2),
(default, "Sulawesi Tenggara", 2),
(default, "Sulawesi Utara", 2),
(default, "Gorontalo", 2),
(default, "Maluku", 3),
(default, "Maluku Utara", 3),
(default, "Papua", 3),
(default, "Papua Barat", 3);

/*
mysql> select * from lokasi_provinsi;
+----+------------------------+-------------------+
| id | nama_provinsi          | id_lokasicampaign |
+----+------------------------+-------------------+
|  1 | Aceh                   |                 1 |
|  2 | Sumatera Utara         |                 1 |
|  3 | Sumatera Barat         |                 1 |
|  4 | Riau                   |                 1 |
|  5 | Kepulauan Riua (Kepri) |                 1 |
|  6 | Jambi                  |                 1 |
|  7 | Sumatera Selatan       |                 1 |
|  8 | Lampung                |                 1 |
|  9 | Bangka Belitung        |                 1 |
| 10 | Bengkulu               |                 1 |
| 11 | DKI Jakarta            |                 1 |
| 12 | Jawa Barat             |                 1 |
| 13 | Banten                 |                 1 |
| 14 | Jawa Tengah            |                 1 |
| 15 | DI Yogyakarta          |                 1 |
| 16 | Jawa Timur             |                 1 |
| 17 | Kalimantan Barat       |                 1 |
| 18 | Kalimantan Timur       |                 1 |
| 19 | Kalimantan Utara       |                 2 |
| 20 | Kalimantan Timur       |                 2 |
| 21 | Kalimantan Selatan     |                 2 |
| 22 | Bali                   |                 2 |
| 23 | Nusa Tenggara Barat    |                 2 |
| 24 | Nusa Tenggara Timur    |                 2 |
| 25 | Sulawesi Barat         |                 2 |
| 26 | Sulawesi Tengah        |                 2 |
| 27 | Sulawesi Selatan       |                 2 |
| 28 | Sulawesi Tenggara      |                 2 |
| 29 | Sulawesi Utara         |                 2 |
| 30 | Gorontalo              |                 2 |
| 31 | Maluku                 |                 3 |
| 32 | Maluku Utara           |                 3 |
| 33 | Papua                  |                 3 |
| 34 | Papua Barat            |                 3 |
+----+------------------------+-------------------+
34 rows in set (0,00 sec)
*/

INSERT INTO lokasi_kota VALUES
(default,"Banda Aceh",1),
(default,"Langsa",1),
(default,"Lhoseumawe",1),
(default,"Meulaboh",1),
(default,"Sabang",1),
(default,"Subulussalam",1),
(default,"Denpasar",22),
(default,"Pangkalpinang",9),
(default,"Cilegon",13),
(default,"Serang",13),
(default,"Tanggerang Selatan",13),
(default,"Tanggerang",13),
(default,"Bengkulu",10),
(default,"Gorontalo",30),
(default,"Jakarta Barat",11),
(default,"Jakarta Pusat",11),
(default,"Jakarta Selatan",11),
(default,"Jakarta Timur",11),
(default,"Jakarta Utara",11),
(default,"Jakarta Barat",11),
(default,"Sungai Penuh",6),
(default,"Jambi",6),
(default,"Sungai Penuh",6),
(default,"Bandung",12),
(default,"Bekasi",12),
(default,"Bogor",12),
(default,"Cimahi",12),
(default,"Cirebon",12),
(default,"Depok",12),
(default,"Sukabumi",12),
(default,"Tasikmalaya",12),
(default,"Banjar",12),
(default,"Magelang",14),
(default,"Pekalongan",14),
(default,"Purwokerto",14),
(default,"Salatiga",14),
(default,"Semarang",14),
(default,"Surakarta",14),
(default,"Tegal",14),
(default,"Batu",16),
(default,"Blitar",16),
(default,"Kediri",16),
(default,"Madiun",16),
(default,"Malang",16),
(default,"Mojokerto",16),
(default,"Pasuruan",16),
(default,"Probolinggo",16),
(default,"Surabaya",16),
(default,"Pontianak",17),
(default,"Singkawang",17),
(default,"BanjarBaru",21),
(default,"Banjarmasin",21),
(default,"Balikpapan",20),
(default,"Bontang",20),
(default,"Samarinda",20),
(default,"Balikpapan",20),
(default,"Tarakan",19),
(default,"Batam",5),
(default,"Tanjungpinang",5),
(default,"Bandar Lampung",8),
(default,"Metro",8),
(default,"Ternate",32),
(default,"Tidore Kepulauan",32),
(default,"Ambon",31),
(default,"Tual",31),
(default,"Bima",23),
(default,"Mataram",23),
(default,"Kupang",24),
(default,"Sorong",34),
(default,"Jayapura",33),
(default,"Dumai",4),
(default,"Pekanbaru",4),
(default,"Makassar",27),
(default,"Palopo",27),
(default,"Pare - pare",27),
(default,"Palu",26),
(default,"Bau - bau",28),
(default,"Kendari",28),
(default,"Bitung",29),
(default,"Kotamobagu",29),
(default,"Manado",29),
(default,"Tomohon",29),
(default,"Bukittinggi",3),
(default,"Padang",3),
(default,"Padangpanjang",3),
(default,"Pariaman",3),
(default,"Payakumbuh",3),
(default,"Sawahlunto",3),
(default,"Solok",3),
(default,"Lubuklinggau",7),
(default,"Pagaralam",7),
(default,"Palembang",7),
(default,"Prabumulih",7),
(default,"Binjai",2),
(default,"Medan",2),
(default,"Padang Sidempuan",2),
(default,"Pematangsiantar",2),
(default,"Sibolga",2),
(default,"Tanjungbalai",2),
(default,"Tebingtinggi",2),
(default,"Yogyakarta",15);

/*
mysql> 
mysql> select *from lokasi_kota;
+-----+--------------------+-------------------+
| id  | nama_kota          | id_lokasiprovinsi |
+-----+--------------------+-------------------+
|   1 | Banda Aceh         |                 1 |
|   2 | Langsa             |                 1 |
|   3 | Lhoseumawe         |                 1 |
|   4 | Meulaboh           |                 1 |
|   5 | Sabang             |                 1 |
|   6 | Subulussalam       |                 1 |
|   7 | Denpasar           |                22 |
|   8 | Pangkalpinang      |                 9 |
|   9 | Cilegon            |                13 |
|  10 | Serang             |                13 |
|  11 | Tanggerang Selatan |                13 |
|  12 | Tanggerang         |                13 |
|  13 | Bengkulu           |                10 |
|  14 | Gorontalo          |                30 |
|  15 | Jakarta Barat      |                11 |
|  16 | Jakarta Pusat      |                11 |
|  17 | Jakarta Selatan    |                11 |
|  18 | Jakarta Timur      |                11 |
|  19 | Jakarta Utara      |                11 |
|  20 | Jakarta Barat      |                11 |
|  21 | Sungai Penuh       |                 6 |
|  22 | Jambi              |                 6 |
|  23 | Sungai Penuh       |                 6 |
|  24 | Bandung            |                12 |
|  25 | Bekasi             |                12 |
|  26 | Bogor              |                12 |
|  27 | Cimahi             |                12 |
|  28 | Cirebon            |                12 |
|  29 | Depok              |                12 |
|  30 | Sukabumi           |                12 |
|  31 | Tasikmalaya        |                12 |
|  32 | Banjar             |                12 |
|  33 | Magelang           |                14 |
|  34 | Pekalongan         |                14 |
|  35 | Purwokerto         |                14 |
|  36 | Salatiga           |                14 |
|  37 | Semarang           |                14 |
|  38 | Surakarta          |                14 |
|  39 | Tegal              |                14 |
|  40 | Batu               |                16 |
|  41 | Blitar             |                16 |
|  42 | Kediri             |                16 |
|  43 | Madiun             |                16 |
|  44 | Malang             |                16 |
|  45 | Mojokerto          |                16 |
|  46 | Pasuruan           |                16 |
|  47 | Probolinggo        |                16 |
|  48 | Surabaya           |                16 |
|  49 | Pontianak          |                17 |
|  50 | Singkawang         |                17 |
|  51 | BanjarBaru         |                21 |
|  52 | Banjarmasin        |                21 |
|  53 | Balikpapan         |                20 |
|  54 | Bontang            |                20 |
|  55 | Samarinda          |                20 |
|  56 | Balikpapan         |                20 |
|  57 | Tarakan            |                19 |
|  58 | Batam              |                 5 |
|  59 | Tanjungpinang      |                 5 |
|  60 | Bandar Lampung     |                 8 |
|  61 | Metro              |                 8 |
|  62 | Ternate            |                32 |
|  63 | Tidore Kepulauan   |                32 |
|  64 | Ambon              |                31 |
|  65 | Tual               |                31 |
|  66 | Bima               |                23 |
|  67 | Mataram            |                23 |
|  68 | Kupang             |                24 |
|  69 | Sorong             |                34 |
|  70 | Jayapura           |                33 |
|  71 | Dumai              |                 4 |
|  72 | Pekanbaru          |                 4 |
|  73 | Makassar           |                27 |
|  74 | Palopo             |                27 |
|  75 | Pare - pare        |                27 |
|  76 | Palu               |                26 |
|  77 | Bau - bau          |                28 |
|  78 | Kendari            |                28 |
|  79 | Bitung             |                29 |
|  80 | Kotamobagu         |                29 |
|  81 | Manado             |                29 |
|  82 | Tomohon            |                29 |
|  83 | Bukittinggi        |                 3 |
|  84 | Padang             |                 3 |
|  85 | Padangpanjang      |                 3 |
|  86 | Pariaman           |                 3 |
|  87 | Payakumbuh         |                 3 |
|  88 | Sawahlunto         |                 3 |
|  89 | Solok              |                 3 |
|  90 | Lubuklinggau       |                 7 |
|  91 | Pagaralam          |                 7 |
|  92 | Palembang          |                 7 |
|  93 | Prabumulih         |                 7 |
|  94 | Binjai             |                 2 |
|  95 | Medan              |                 2 |
|  96 | Padang Sidempuan   |                 2 |
|  97 | Pematangsiantar    |                 2 |
|  98 | Sibolga            |                 2 |
|  99 | Tanjungbalai       |                 2 |
| 100 | Tebingtinggi       |                 2 |
| 101 | Yogyakarta         |                15 |
+-----+--------------------+-------------------+
101 rows in set (0,00 sec)
*/

INSERT INTO lokasi_kecamatan VALUES
(default, "Tanah Abang",16),
(default, "Menteng",16),
(default, "Senen",16),
(default, "Cempaka Putih",16),
(default, "Johar Baru",16),
(default, "Kelapa Gading",19),
(default, "Tanjung Priok",19),
(default, "Pademangan",19),
(default, "Penjaringan",19),
(default, "Cilincing",19),
(default, "Pulo Gadung",18),
(default, "Jatinegara",18),
(default, "Duren Sawit",18),
(default, "Kramat Jati",18),
(default, "Pulo Gadung",18),
(default, "Kebayoran Lama",17),
(default, "Pesanggrahan",17),
(default, "Cilandak",17),
(default, "Pasar Minggu",17),
(default, "Jagakarsa",17),
(default, "Mampang Prapatan",17),
(default, "Pancoran",17),
(default, "Tebet",17),
(default, "Setia Budi",17),
(default, "Cengkareng",20),
(default, "Grogol",20),
(default, "Kalideres",20),
(default, "Kebon Jeruk",20),
(default, "Kembangan",20),
(default, "Palmerah",20),
(default, "Taman Sari",20),
(default, "Tambora",20),
(default, "Bojonggede",26),
(default, "Cibinong",26),
(default, "Ciampea",26),
(default, "Leuwiliang",26),
(default, "Sukaraja",26),
(default, "Ciawi",26),
(default, "Taraju",31),
(default, "Cikuray",31),
(default, "Desa Marunggih",86);

/*
mysql> select *from lokasi_kecamatan;
+----+------------------+---------------+
| id | nama_kecamatan   | id_lokasikota |
+----+------------------+---------------+
|  1 | Tanah Abang      |            16 |
|  2 | Menteng          |            16 |
|  3 | Senen            |            16 |
|  4 | Cempaka Putih    |            16 |
|  5 | Johar Baru       |            16 |
|  6 | Kelapa Gading    |            19 |
|  7 | Tanjung Priok    |            19 |
|  8 | Pademangan       |            19 |
|  9 | Penjaringan      |            19 |
| 10 | Cilincing        |            19 |
| 11 | Pulo Gadung      |            18 |
| 12 | Jatinegara       |            18 |
| 13 | Duren Sawit      |            18 |
| 14 | Kramat Jati      |            18 |
| 15 | Pulo Gadung      |            18 |
| 16 | Kebayoran Lama   |            17 |
| 17 | Pesanggrahan     |            17 |
| 18 | Cilandak         |            17 |
| 19 | Pasar Minggu     |            17 |
| 20 | Jagakarsa        |            17 |
| 21 | Mampang Prapatan |            17 |
| 22 | Pancoran         |            17 |
| 23 | Tebet            |            17 |
| 24 | Setia Budi       |            17 |
| 25 | Cengkareng       |            20 |
| 26 | Grogol           |            20 |
| 27 | Kalideres        |            20 |
| 28 | Kebon Jeruk      |            20 |
| 29 | Kembangan        |            20 |
| 30 | Palmerah         |            20 |
| 31 | Taman Sari       |            20 |
| 32 | Tambora          |            20 |
| 33 | Bojonggede       |            26 |
| 34 | Cibinong         |            26 |
| 35 | Ciampea          |            26 |
| 36 | Leuwiliang       |            26 |
| 37 | Sukaraja         |            26 |
| 38 | Ciawi            |            26 |
| 39 | Taraju           |            31 |
| 40 | Cikuray          |            31 |
| 41 | Desa Marunggih   |            86 |
| 42 | Pasar Rebo       |            18 |
+----+------------------+---------------+
42 rows in set (0,00 sec)
*/

INSERT INTO lokasi_kelurahan VALUES
(default, "Bendungan Hilir",1),
(default, "Kebon Melati",1),
(default, "Menteng",2),
(default, "Cikini",2),
(default, "Senen",3),
(default, "Kampung Rawa",5),
(default, "Johar Baru",5),
(default, "Cililitan",14),
(default, "Cawang",14),
(default, "Kalisari",42),
(default, "Cijantung",42),
(default, "Condet",42),
(default, "Karehkel",36);

/*
mysql> select *from lokasi_kelurahan;
+----+-----------------+--------------------+
| id | nama_kelurahan  | id_lokasikecamatan |
+----+-----------------+--------------------+
|  1 | Bendungan Hilir |                  1 |
|  2 | Kebon Melati    |                  1 |
|  3 | Menteng         |                  2 |
|  4 | Cikini          |                  2 |
|  5 | Senen           |                  3 |
|  6 | Kampung Rawa    |                  5 |
|  7 | Johar Baru      |                  5 |
|  8 | Cililitan       |                 14 |
|  9 | Cawang          |                 14 |
| 10 | Kalisari        |                 42 |
| 11 | Cijantung       |                 42 |
| 12 | Condet          |                 42 |
| 13 | Karehkel        |                 36 |
+----+-----------------+--------------------+
13 rows in set (0,00 sec)
*/

INSERT INTO kategori_campaign VALUES
(default, "Travel Alam"),
(default, "Travel Edukasi"),
(default, "Hiking"),
(default, "Travel");

/*
mysql> select *from kategori_campaign;
+----+----------------+
| id | nama_campaign  |
+----+----------------+
|  1 | Travel Alam    |
|  2 | Travel Edukasi |
|  3 | Hiking         |
|  4 | Travel         |
+----+----------------+
4 rows in set (0,00 sec)
*/

insert into user values
(default,"Muhammad Fadhil","Hilmi","Laki-Laki",19970427,"Jl. H. Sabenih No. 51 rt 05/rw 002",18,1,1,'2018-01-22 14:26:15','2018-01-22 14:26:15',"fadhil.hilmi27@gmail.com","089691565266",""),
(default,"Muhammad","Alwi Mahfud","Laki-Laki",19981227,"Kp. Babakan Empang, Desa Purasari RT 01/001",26,2,2,'2018-01-22 14:26:15','2018-01-22 14:26:15',"muhammadalwi27@gmail.com","085814404153",""),
(default,"Mohammad","Akmaluddin Noviyanto","Laki-Laki",19981005, "Jln. Pemuda No. 17 rt 05/rw 013",25,3,3,'2018-01-22 14:26:15','2018-01-22 14:26:15',"akmalseferagic@gmail.com","085879615275",""),
(default,"Satria","Suryanegara","Laki-Laki",19980624,"cilebut No. 10 rt 01/rw 005",26,4,4,'2018-01-22 14:26:15','2018-01-22 14:26:15',"satriasuryatria@gmail.com","087720793550",""),
(default,"Muhammad","Isfhani Ghiath","Laki-Laki",19970628,"Jln. Margonda No. 52 rt 06/rw 002",29,5,5,'2018-01-22 14:26:15','2018-01-22 14:26:15',"isfaghiath@gmail.com","085211005644",""),
(default,"Putri","Widiastuti","Perempuan",19980624,"Jln. Kayu manis No. 12 rt 07/rw 001",18,6,6,'2018-01-22 14:26:15','2018-01-22 14:26:15',"putridupport@gmail.com","089658730626",""),
(default,"Chairin","Nashrillah","Perempuan",19980322,"Jl. Kebagusan III No.20, RT.01/RW.05",18,7,7,'2018-01-22 14:26:15','2018-01-22 14:26:15',"chairinnash@gmail.com","085778302431",""),
(default,"Syifa","Avicenna","Perempuan",19971203,"Jln. Kampung tengah condet No. 22 rt 02/rw 002",18,8,8,'2018-01-22 14:26:15','2018-01-22 14:26:15',"syifa.avicenna@gmail.com","085832942944",""),
(default,"Stevani","Pangesti","Perempuan",19991112,"Jln. Kelapa dua No. 26 rt 03/rw 005",29,9,9,'2018-01-22 14:26:15','2018-01-22 14:26:15',"stev.pangest@gmail.com","082190642943",""),
(default,"Cica","Nur Latifah","Perempuan",19980429,"Jln. Gempol No. 21 rt 01/rw 005",28,10,10,'2018-01-22 14:26:15','2018-01-22 14:26:15',"cica.latifah29@gmail.com","089646952381",""),
(default,"Arief","Rifky","Laki-Laki",19971115,"Jln. Munggang No. 15 rt 01/rw 004",18,11,11,'2018-01-22 14:26:15','2018-01-22 14:26:15',"ariefrfk@gmail.com","081296866699",""),
(default,"Aditya","Pratama","Laki-Laki",19991101,"Jln. A.H Nasution No. 22 rt 02/rw 002",24,12,12,'2018-01-22 14:26:15','2018-01-22 14:26:15',"adit.pratm@gmail.com","089509163861",""),
(default,"Daud","Haris","Laki-Laki",19950812,"Jln. Kampung rawa No. 18 rt 03/rw 004",16,13,13,'2018-01-22 14:26:15','2018-01-22 14:26:15',"h.daudris@gmail.com","082359315979",""),
(default,"Helvyana","Permatasari","Perempuan",19970808,"Jln. Dewi Sartika No. 14 rt 02/rw 004",18,14,14,'2018-01-22 14:26:15','2018-01-22 14:26:15',"via.permatasari8@gmail.com","089524210425",""),
(default,"Maulidya","Ramadani","Perempuan",19980801,"Jln.Gempol Balai Rakyat No. 13 rt 04/rw 012",18,15,15,'2018-01-22 14:26:15','2018-01-22 14:26:15',"maulidyarmdn@gmail.com","08978675564",""),
(default,"Reza","Pahlevi","Laki-Laki",19960119,"Jln. Raya bojonggede No. 20 rt 04/rw 001",26,16,16,'2018-01-22 14:26:15','2018-01-22 14:26:15',"RezaLuckP19@gmail.com","085295290124",""),
(default,"Wahab","Rahmanto","Laki-Laki",19970312,"Jln. Sawangan No. 61 rt 02/rw 001",29,17,17,'2018-01-22 14:26:15','2018-01-22 14:26:15',"Wahabrahmanto@gmail.com","082299211434",""),
(default,"Reza","Nurahman","Laki-Laki",19980503,"Jln. Sawangan  No. 30 rt 02/rw 001",29,18,18,'2018-01-22 14:26:15','2018-01-22 14:26:15',"mrezanr112@gmail.com","089619311163",""),
(default,"Yuli","Hardiyanti","Perempuan",19960624,"Jln. karehkel RT 02/11",26,19,19,'2018-01-22 14:26:15','2018-01-22 14:26:15',"hyuliflash@gmail.com","087720196367",""),
(default,"Koirun","Nisa","Perempuan",20001223,"Jln. Gempol No. 16 rt 02/rw 005",28,20,20,'2018-01-22 14:26:15','2018-01-22 14:26:15',"khoirnisa@gmail.com","0895377848137","");

/*
mysql> select *from user;
+----+-----------------+----------------------+---------------+---------------+------------------------------------------------+----------------+-----------+-----------+---------------------+---------------------+----------------------------+---------------+-----------------+
| id | nama_depan      | nama_belakang        | jenis_kelamin | tanggal_lahir | alamat                                         | lokasi_kota_id | create_by | update_by | create_at           | update_at           | email                      | nomer_hp      | deskripsi_minat |
+----+-----------------+----------------------+---------------+---------------+------------------------------------------------+----------------+-----------+-----------+---------------------+---------------------+----------------------------+---------------+-----------------+
|  1 | Muhammad Fadhil | Hilmi                | Laki-Laki     | 1997-04-27    | Jl. H. Sabenih No. 51 rt 05/rw 002             |             18 |         1 |         1 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | fadhil.hilmi27@gmail.com   | 089691565266  |                 |
|  2 | Muhammad        | Alwi Mahfud          | Laki-Laki     | 1998-12-27    | Kp. Babakan Empang, Desa Purasari RT 01/001    |             26 |         2 |         2 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | muhammadalwi27@gmail.com   | 085814404153  |                 |
|  3 | Mohammad        | Akmaluddin Noviyanto | Laki-Laki     | 1998-10-05    | Jln. Pemuda No. 17 rt 05/rw 013                |             25 |         3 |         3 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | akmalseferagic@gmail.com   | 085879615275  |                 |
|  4 | Satria          | Suryanegara          | Laki-Laki     | 1998-06-24    | cilebut No. 10 rt 01/rw 005                    |             26 |         4 |         4 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | satriasuryatria@gmail.com  | 087720793550  |                 |
|  5 | Muhammad        | Isfhani Ghiath       | Laki-Laki     | 1997-06-28    | Jln. Margonda No. 52 rt 06/rw 002              |             29 |         5 |         5 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | isfaghiath@gmail.com       | 085211005644  |                 |
|  6 | Putri           | Widiastuti           | Perempuan     | 1998-06-24    | Jln. Kayu manis No. 12 rt 07/rw 001            |             18 |         6 |         6 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | putridupport@gmail.com     | 089658730626  |                 |
|  7 | Chairin         | Nashrillah           | Perempuan     | 1998-03-22    | Jl. Kebagusan III No.20, RT.01/RW.05           |             18 |         7 |         7 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | chairinnash@gmail.com      | 085778302431  |                 |
|  8 | Syifa           | Avicenna             | Perempuan     | 1997-12-03    | Jln. Kampung tengah condet No. 22 rt 02/rw 002 |             18 |         8 |         8 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | syifa.avicenna@gmail.com   | 085832942944  |                 |
|  9 | Stevani         | Pangesti             | Perempuan     | 1999-11-12    | Jln. Kelapa dua No. 26 rt 03/rw 005            |             29 |         9 |         9 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | stev.pangest@gmail.com     | 082190642943  |                 |
| 10 | Cica            | Nur Latifah          | Perempuan     | 1998-04-29    | Jln. Gempol No. 21 rt 01/rw 005                |             28 |        10 |        10 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | cica.latifah29@gmail.com   | 089646952381  |                 |
| 11 | Arief           | Rifky                | Laki-Laki     | 1997-11-15    | Jln. Munggang No. 15 rt 01/rw 004              |             18 |        11 |        11 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | ariefrfk@gmail.com         | 081296866699  |                 |
| 12 | Aditya          | Pratama              | Laki-Laki     | 1999-11-01    | Jln. A.H Nasution No. 22 rt 02/rw 002          |             24 |        12 |        12 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | adit.pratm@gmail.com       | 089509163861  |                 |
| 13 | Daud            | Haris                | Laki-Laki     | 1995-08-12    | Jln. Kampung rawa No. 18 rt 03/rw 004          |             16 |        13 |        13 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | h.daudris@gmail.com        | 082359315979  |                 |
| 14 | Helvyana        | Permatasari          | Perempuan     | 1997-08-08    | Jln. Dewi Sartika No. 14 rt 02/rw 004          |             18 |        14 |        14 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | via.permatasari8@gmail.com | 089524210425  |                 |
| 15 | Maulidya        | Ramadani             | Perempuan     | 1998-08-01    | Jln.Gempol Balai Rakyat No. 13 rt 04/rw 012    |             18 |        15 |        15 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | maulidyarmdn@gmail.com     | 08978675564   |                 |
| 16 | Reza            | Pahlevi              | Laki-Laki     | 1996-01-19    | Jln. Raya bojonggede No. 20 rt 04/rw 001       |             26 |        16 |        16 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | RezaLuckP19@gmail.com      | 085295290124  |                 |
| 17 | Wahab           | Rahmanto             | Laki-Laki     | 1997-03-12    | Jln. Sawangan No. 61 rt 02/rw 001              |             29 |        17 |        17 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | Wahabrahmanto@gmail.com    | 082299211434  |                 |
| 18 | Reza            | Nurahman             | Laki-Laki     | 1998-05-03    | Jln. Sawangan  No. 30 rt 02/rw 001             |             29 |        18 |        18 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | mrezanr112@gmail.com       | 089619311163  |                 |
| 19 | Yuli            | Hardiyanti           | Perempuan     | 1996-06-24    | Jln. karehkel RT 02/11                         |             26 |        19 |        19 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | hyuliflash@gmail.com       | 087720196367  |                 |
| 20 | Koirun          | Nisa                 | Perempuan     | 2000-12-23    | Jln. Gempol No. 16 rt 02/rw 005                |             28 |        20 |        20 | 2018-01-22 14:26:15 | 2018-01-22 14:26:15 | khoirnisa@gmail.com        | 0895377848137 |                 |
+----+-----------------+----------------------+---------------+---------------+------------------------------------------------+----------------+-----------+-----------+---------------------+---------------------+----------------------------+---------------+-----------------+
20 rows in set (0,00 sec)
*/

INSERT INTO pembuat_campaign VALUES
(default,"Mari bantu Pariaman dalam mewujudkan terciptanya masa depan gemilang, generasi emas Indonesia","Salam hormat pada sahabat - sahabat sekalian,

Perkenalkan nama saya Satria suryanegara, saya seorang mahasiswa jurusan teknik informatika di salah satu perguruan tinggi swasta di Jakarta.

Pada tanggal 30 November 2017 lalu, tersebar kabar yang memilukan hati kita sebagai warganegara Indonesia. dimana pariaman pada saat itu terkena bencana gempabumi yang mengakibatkan banyak bangunan yang runtuh dan banyak nyawa yang hilang.

beberapa bantuanpun di kucurkan, mulai dari bantuan logistik hingga hiburan, penyalurbantuan pun berdatangan dari berbagai kalangan. banyak orang tua yang kehilangan anaknya, dan banyak anak - anak yang kehilangan harapannya untuk lanjut sekolah karena sekolah tempat mencari ilmu sudah luluh lantak oleh tanah.

Maka dari itu saya mengajak sahabat - sabahat semua untuk bisa berpartisipasi dalam kegiatan Travel Edukasi ini, yakni bertujuan untuk mengembalikan harapan pada anak - anak di wilayah Pariaman dengan memberi bantuan berupa pengajaran atau sharing ilmu kepada anak - anak dan remaja yang ada di Pariaman. dengan sharing ilmu dan motivasi, akan memberikan efek positif yang akan membantu mereka dalam meraih cita - cita mereka dan dapat mewujudkan terciptanya masa depan gemilang generasi Indonesia.

Jumlah dana yang dibutuhkan dalam tiap - tiap relawan yang ikut yakni @Rp. 1.000.000

#TravelEdukasi #TravelIndonesia #Pariaman #Bantu #Generasi",50,1,1,'2018-01-06 14:26:15','2018-01-07 12:20:10',6,2,1),
(default,"Ayo Bantu Tasik Membaca","Sebanyak 300 Warga Kampung Kadot Desa Kertaharja Kecamatan Taraju Kabupaten Tasikmalaya terindikasi masih banyak yang buta Huruf.

Hanya beberapa orang yang mengenyam pendidikan SD, Keterbatasan Ekonomi dituding menjadi penyebab utama sulitnya anak-anak mendapat pendidikan, Namun pemerintah bukanya tidak berbuat apa-apa , mereka juga sudah berbuat sesuatu untuk memcahkan masalah pendidikan di kampung tersebut.

Namun Pemerintah Kekurangan SDM yang kompeten untuk membantu jalanya program ini , Saya Maulidya Ramadani , Mencoba membantu meringankan permasalahan edukasi yang ada disana

SAYA MOHON BANTUAN” 

Jumlah dana yang dibutuhkan dalam tiap - tiap relawan yang ikut yakni @Rp. 500.000,-
#TravelEdukasi #TravelIndonesia #Bantu #Generasi #Tasik #ButaHuruf",20,2,2,'2018-01-06 14:26:15','2018-01-07 12:20:10',17,2,1),
(default,"Tangan mu menyelamatkan Leuwiliang","Salam hormat pada sahabat - sahabat sekalian,

Perkenalkan saya Muhammad Alwi Mahfud, saya seorang mahasiswa jurusan teknik informatika di salah satu perguruan tinggi swasta di Jakarta.

Pada beberapa bulan lalu di tahun 2018, terdapat kabar bahwa salah satu tempat wisata alam di jawa barat tepatnya di kampung cianten desa purasari kecamatan leuwiliang kabupaten bogor mengalami bencana tanah longsor yang mengakibatkan sebagian kecil pemukiman warga terkena imbasnya, dan memakan satu korban jiwa.

oleh karena itu mari kita sama sama bahu-membahu dalam gerakan tanam 1001 pohon di sekitar tempat wisata yang terkena bencana tersebut, agar tak lagi terjadi bencana yang memakan korban di warga sekitar.

Jumlah dana yang dibutuhkan dalam tiap - tiap relawan yang ikut yakni @Rp. 400.000

#TravelforSosial #TravelIndonesia #Leuwiliang #Bahu-mebahu_UntukNegri #GenerasiBisa #GenerasiSosial #BangkitkanKhilafah",40,3,3,'2018-01-06 14:26:15','2018-01-07 12:20:10',4,1,1),
(default,"Daki puncak galau untuk menghilangkan kegalauan","Salam semangat pada sahabat - sahabat sekalian,

Apakah anda sedang galau ?. jika iya, lebih baik kita hilangkan kegalauan yang membelenggu jiwa dengan kegiatan yang lebih positif, yaitu kita lakukan kegiatan pendakian ke puncak galau gunung kapur untuk melepaskan segala kegalauan dan kegalisahan yang tengah membelenggu jiwa kita.

dengan kegiatan pendakian atau hiking ini kita akan mendapatkan jasmani yang bugar dan juga rohani yang terbebas dari rasa galau.

Jumlah dana yang dibutuhkan dalam tiap - tiap relawan yang ikut yakni @Rp. 250.000
#LepaskanKegalauan #HikingForHealty #ToBePositive 
#HikingIndonesia",15,4,4,'2018-01-06 14:26:15','2018-01-07 12:20:10',5,3,1),
(default,"Camp Mulung Sampah","Salam semangat pada sahabat - sahabat sekalian,

Kali ini kami membuat campaign untuk nge-Camp di gunung cikuray garut. Kegiatan Camp kali ini kita bukan hanya sekedar camp biasa, namun kita mengemban misi mulia guna menjaga keberlangsungan dan kelestarian alam yang ada, misi nya adalah pembersihan sampah di area gunung cikuray.

dikarenakan terdapat fakta bahwa pada jalur pendakian gunung cikuray, salah satunya berada di pos 7, terdapat sampah sampah yang berserakan. Oleh karenanya selain kita memburu pemandangan dan ketenangan puncak gunung cikuray, kita pun akan memburu sampah yang terdapat di gunung cikuray.

Jadi setelah kita dari puncak, sambil turun kita sambil berburu sampah.
yohoohohoo, sekian dari saya. Akhir kata, mari kita sama sama jaga keindahan dari ciptaan sang maha kuasa, karna kebersihan dan kelestarian alam adalah tanggung jawab kita sebagai manusia.

Jumlah dana yang dibutuhkan dalam tiap - tiap relawan yang ikut yakni @Rp. 600.000

#PendakiSehat #CintaLingkungan #LestariAlamIndonesiaku #ToBePositive #NaturalCare",20,5,5,'2018-01-06 14:26:15','2018-01-07 12:20:10',9,4,1);

/*
mysql> select *from pembuat_campaign;
+----+-----------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------+-----------+-----------+---------------------+---------------------+---------+-------------+--------------------+
| id | judul_campaign                                                                                | deskripsi_campaign                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | jumlah_relawan | create_by | update_by | create_at           | update_at           | user_id | kategori_id | lokasi_campaign_id |
+----+-----------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------+-----------+-----------+---------------------+---------------------+---------+-------------+--------------------+
|  1 | Mari bantu Pariaman dalam mewujudkan terciptanya masa depan gemilang, generasi emas Indonesia | Salam hormat pada sahabat - sahabat sekalian,

Perkenalkan nama saya Satria suryanegara, saya seorang mahasiswa jurusan teknik informatika di salah satu perguruan tinggi swasta di Jakarta.

Pada tanggal 30 November 2017 lalu, tersebar kabar yang memilukan hati kita sebagai warganegara Indonesia. dimana pariaman pada saat itu terkena bencana gempabumi yang mengakibatkan banyak bangunan yang runtuh dan banyak nyawa yang hilang.

beberapa bantuanpun di kucurkan, mulai dari bantuan logistik hingga hiburan, penyalurbantuan pun berdatangan dari berbagai kalangan. banyak orang tua yang kehilangan anaknya, dan banyak anak - anak yang kehilangan harapannya untuk lanjut sekolah karena sekolah tempat mencari ilmu sudah luluh lantak oleh tanah.

Maka dari itu saya mengajak sahabat - sabahat semua untuk bisa berpartisipasi dalam kegiatan Travel Edukasi ini, yakni bertujuan untuk mengembalikan harapan pada anak - anak di wilayah Pariaman dengan memberi bantuan berupa pengajaran atau sharing ilmu kepada anak - anak dan remaja yang ada di Pariaman. dengan sharing ilmu dan motivasi, akan memberikan efek positif yang akan membantu mereka dalam meraih cita - cita mereka dan dapat mewujudkan terciptanya masa depan gemilang generasi Indonesia.

Jumlah dana yang dibutuhkan dalam tiap - tiap relawan yang ikut yakni @Rp. 1.000.000

#TravelEdukasi #TravelIndonesia #Pariaman #Bantu #Generasi |             50 |         1 |         1 | 2018-01-06 14:26:15 | 2018-01-07 12:20:10 |       6 |           2 |                  1 |
|  2 | Ayo Bantu Tasik Membaca                                                                       | Sebanyak 300 Warga Kampung Kadot Desa Kertaharja Kecamatan Taraju Kabupaten Tasikmalaya terindikasi masih banyak yang buta Huruf.

Hanya beberapa orang yang mengenyam pendidikan SD, Keterbatasan Ekonomi dituding menjadi penyebab utama sulitnya anak-anak mendapat pendidikan, Namun pemerintah bukanya tidak berbuat apa-apa , mereka juga sudah berbuat sesuatu untuk memcahkan masalah pendidikan di kampung tersebut.

Namun Pemerintah Kekurangan SDM yang kompeten untuk membantu jalanya program ini , Saya Maulidya Ramadani , Mencoba membantu meringankan permasalahan edukasi yang ada disana

SAYA MOHON BANTUAN” 


Jumlah dana yang dibutuhkan dalam tiap - tiap relawan yang ikut yakni @Rp. 500.000,-
#TravelEdukasi #TravelIndonesia #Bantu #Generasi #Tasik #ButaHuruf                                                                                                                                                                                                                                                                     |             20 |         2 |         2 | 2018-01-06 14:26:15 | 2018-01-07 12:20:10 |      17 |           2 |                  1 |
|  3 | Tangan mu menyelamatkan Leuwiliang                                                            | Salam hormat pada sahabat - sahabat sekalian,

Perkenalkan saya Muhammad Alwi Mahfud, saya seorang mahasiswa jurusan teknik informatika di salah satu perguruan tinggi swasta di Jakarta.

Pada beberapa bulan lalu di tahun 2018, terdapat kabar bahwa salah satu tempat wisata alam di jawa barat tepatnya di kampung cianten desa purasari kecamatan leuwiliang kabupaten bogor mengalami bencana tanah longsor yang mengakibatkan sebagian kecil pemukiman warga terkena imbasnya, dan memakan satu korban jiwa.

oleh karena itu mari kita sama sama bahu-membahu dalam gerakan tanam 1001 pohon di sekitar tempat wisata yang terkena bencana tersebut, agar tak lagi terjadi bencana yang memakan korban di warga sekitar.

Jumlah dana yang dibutuhkan dalam tiap - tiap relawan yang ikut yakni @Rp. 400.000

#TravelforSosial #TravelIndonesia #Leuwiliang #Bahu-mebahu_UntukNegri #GenerasiBisa #GenerasiSosial #BangkitkanKhilafah                                                                                                                   |             40 |         3 |         3 | 2018-01-06 14:26:15 | 2018-01-07 12:20:10 |       4 |           1 |                  1 |
|  4 | Daki puncak galau untuk menghilangkan kegalauan                                               | Salam semangat pada sahabat - sahabat sekalian,

Apakah anda sedang galau ?. jika iya, lebih baik kita hilangkan kegalauan yang membelenggu jiwa dengan kegiatan yang lebih positif, yaitu kita lakukan kegiatan pendakian ke puncak galau gunung kapur untuk melepaskan segala kegalauan dan kegalisahan yang tengah membelenggu jiwa kita.

dengan kegiatan pendakian atau hiking ini kita akan mendapatkan jasmani yang bugar dan juga rohani yang terbebas dari rasa galau.

Jumlah dana yang dibutuhkan dalam tiap - tiap relawan yang ikut yakni @Rp. 250.000
#LepaskanKegalauan #HikingForHealty #ToBePositive 
#HikingIndonesia                                                                                                                                                                                                                                                                                                                                                                                                                          |             15 |         4 |         4 | 2018-01-06 14:26:15 | 2018-01-07 12:20:10 |       5 |           3 |                  1 |
|  5 | Camp Mulung Sampah                                                                            | Salam semangat pada sahabat - sahabat sekalian,

Kali ini kami membuat campaign untuk nge-Camp di gunung cikuray garut. Kegiatan Camp kali ini kita bukan hanya sekedar camp biasa, namun kita mengemban misi mulia guna menjaga keberlangsungan dan kelestarian alam yang ada, misi nya adalah pembersihan sampah di area gunung cikuray.

dikarenakan terdapat fakta bahwa pada jalur pendakian gunung cikuray, salah satunya berada di pos 7, terdapat sampah sampah yang berserakan. Oleh karenanya selain kita memburu pemandangan dan ketenangan puncak gunung cikuray, kita pun akan memburu sampah yang terdapat di gunung cikuray.

Jadi setelah kita dari puncak, sambil turun kita sambil berburu sampah.
yohoohohoo, sekian dari saya. Akhir kata, mari kita sama sama jaga keindahan dari ciptaan sang maha kuasa, karna kebersihan dan kelestarian alam adalah tanggung jawab kita sebagai manusia.

Jumlah dana yang dibutuhkan dalam tiap - tiap relawan yang ikut yakni @Rp. 600.000

#PendakiSehat #CintaLingkungan #LestariAlamIndonesiaku #ToBePositive #NaturalCare |             20 |         5 |         5 | 2018-01-06 14:26:15 | 2018-01-07 12:20:10 |       9 |           4 |                  1 |
+----+-----------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------+-----------+-----------+---------------------+---------------------+---------+-------------+--------------------+
5 rows in set (0,00 sec)
*/


INSERT INTO jadwal_campaign VALUES
(default, 20180106, 20180126,1,1,'2018-01-06 14:26:15','2018-01-07 12:20:10',1),
(default, 20180103, 20180322,2,2,'2018-01-03 04:28:33','2018-03-22 19:01:04',2),
(default, 20180220, 20180302,3,3,'2018-02-20 18:09:17','2018-03-21 17:20:10',3),
(default, 20180203, 20180313,4,4,'2018-02-03 11:06:45','2018-01-22 18:26:15',4),
(default, 20180215, 20180325,5,5,'2018-01-15 13:26:55','2018-01-17 05:06:05',5);

/*
mysql> select *from jadwal_campaign;
+----+--------------+---------------+-----------+-----------+---------------------+---------------------+---------------------+
| id | tanggal_awal | tanggal_akhir | create_by | update_by | create_at           | update_at           | pembuat_campaign_id |
+----+--------------+---------------+-----------+-----------+---------------------+---------------------+---------------------+
|  1 | 2018-01-06   | 2018-01-26    |         1 |         1 | 2018-01-06 14:26:15 | 2018-01-07 12:20:10 |                   1 |
|  2 | 2018-01-03   | 2018-03-22    |         2 |         2 | 2018-01-03 04:28:33 | 2018-03-22 19:01:04 |                   2 |
|  3 | 2018-02-20   | 2018-03-02    |         3 |         3 | 2018-02-20 18:09:17 | 2018-03-21 17:20:10 |                   3 |
|  4 | 2018-02-03   | 2018-03-13    |         4 |         4 | 2018-02-03 11:06:45 | 2018-01-22 18:26:15 |                   4 |
|  5 | 2018-02-15   | 2018-03-25    |         5 |         5 | 2018-01-15 13:26:55 | 2018-01-17 05:06:05 |                   5 |
+----+--------------+---------------+-----------+-----------+---------------------+---------------------+---------------------+
5 rows in set (0,00 sec)
*/

INSERT INTO jadwal_berangkat VALUES
(default, 20180129, 20180212,1,1,'2018-01-29 17:20:11','2018-01-29 17:20:11',1),
(default, 20180501, 20180601,2,2,'2018-05-01 14:42:15','2018-05-01 14:42:15',2),
(default, 20180305, 20180312,3,3,'2018-03-05 21:16:35','2018-03-05 21:16:35',3),
(default, 20180315, 20180316,4,4,'2018-03-15 14:36:05','2018-03-15 14:36:05',4),
(default, 20180330, 20180401,5,5,'2018-03-30 12:06:10','2018-03-30 12:06:10',5);

/*
mysql> select *from jadwal_berangkat;
+----+--------------+---------------+-----------+-----------+---------------------+---------------------+---------------------+
| id | tanggal_awal | tanggal_akhir | create_by | update_by | create_at           | update_at           | pembuat_campaign_id |
+----+--------------+---------------+-----------+-----------+---------------------+---------------------+---------------------+
|  6 | 2018-01-29   | 2018-02-12    |         1 |         1 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |                   1 |
|  7 | 2018-05-01   | 2018-06-01    |         2 |         2 | 2018-05-01 14:42:15 | 2018-05-01 14:42:15 |                   2 |
|  8 | 2018-03-05   | 2018-03-12    |         3 |         3 | 2018-03-05 21:16:35 | 2018-03-05 21:16:35 |                   3 |
|  9 | 2018-03-15   | 2018-03-16    |         4 |         4 | 2018-03-15 14:36:05 | 2018-03-15 14:36:05 |                   4 |
| 10 | 2018-03-30   | 2018-04-01    |         5 |         5 | 2018-03-30 12:06:10 | 2018-03-30 12:06:10 |                   5 |
+----+--------------+---------------+-----------+-----------+---------------------+---------------------+---------------------+
5 rows in set (0,00 sec)
*/

INSERT INTO campaign VALUES
(default,1,1,'2018-01-29 17:20:11','2018-01-29 17:20:11',1,1),
(default,1,1,'2018-01-26 05:20:14','2018-01-26 17:20:11',1,14),
(default,1,1,'2018-01-26 02:20:15','2018-01-26 17:20:11',1,18),
(default,1,1,'2018-01-26 11:20:16','2018-01-26 17:20:11',1,8),
(default,1,1,'2018-01-26 18:20:17','2018-01-26 17:20:11',1,11),
(default,1,1,'2018-01-26 12:00:01','2018-01-26 17:20:11',1,5),
(default,2,2,'2018-01-26 10:20:11','2018-01-26 17:20:11',2,17),
(default,2,2,'2018-01-26 11:20:11','2018-01-26 17:20:11',2,20),
(default,2,2,'2018-01-26 13:20:11','2018-01-26 17:20:11',2,13),
(default,2,2,'2018-01-26 14:20:11','2018-01-26 17:20:11',2,6),
(default,2,2,'2018-01-26 15:20:11','2018-01-26 17:20:11',2,16),
(default,2,2,'2018-01-26 16:20:11','2018-01-26 17:20:11',2,4),
(default,3,3,'2018-01-26 17:20:11','2018-01-26 17:20:11',3,19),
(default,3,3,'2018-01-26 18:20:11','2018-01-26 17:20:11',3,12),
(default,3,3,'2018-01-26 19:20:11','2018-01-26 17:20:11',3,10),
(default,3,3,'2018-01-26 20:20:11','2018-01-26 17:20:11',3,9),
(default,3,3,'2018-01-26 21:20:11','2018-01-26 17:20:11',3,3),
(default,3,3,'2018-01-26 22:20:11','2018-01-26 17:20:11',3,1),
(default,4,4,'2018-01-26 23:20:11','2018-01-26 17:20:11',4,19),
(default,4,4,'2018-01-26 00:20:11','2018-01-26 17:20:11',4,17),
(default,4,4,'2018-01-26 02:20:11','2018-01-26 17:20:11',4,18),
(default,4,4,'2018-01-26 03:20:11','2018-01-26 17:20:11',4,4),
(default,4,4,'2018-01-26 05:20:11','2018-01-26 17:20:11',4,7),
(default,4,4,'2018-01-26 07:20:11','2018-01-26 17:20:11',4,2),
(default,5,5,'2018-01-26 09:20:11','2018-01-26 17:20:11',5,2),
(default,5,5,'2018-01-26 10:20:11','2018-01-26 17:20:11',5,1),
(default,5,5,'2018-01-26 10:22:11','2018-01-26 17:20:11',5,3),
(default,5,5,'2018-01-26 12:28:11','2018-01-26 17:20:11',5,10),
(default,5,5,'2018-01-26 11:24:11','2018-01-26 17:20:11',5,20),
(default,5,5,'2018-01-26 10:21:11','2018-01-26 17:20:11',5,9);

/*
mysql> select *from campaign;
+----+-----------+-----------+---------------------+---------------------+---------------------+---------+
| id | create_by | update_by | create_at           | update_at           | pembuat_campaign_id | user_id |
+----+-----------+-----------+---------------------+---------------------+---------------------+---------+
|  1 |         1 |         1 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |                   1 |       1 |
|  2 |         1 |         1 | 2018-01-26 05:20:14 | 2018-01-26 17:20:11 |                   1 |      14 |
|  3 |         1 |         1 | 2018-01-26 02:20:15 | 2018-01-26 17:20:11 |                   1 |      18 |
|  4 |         1 |         1 | 2018-01-26 11:20:16 | 2018-01-26 17:20:11 |                   1 |       8 |
|  5 |         1 |         1 | 2018-01-26 18:20:17 | 2018-01-26 17:20:11 |                   1 |      11 |
|  6 |         1 |         1 | 2018-01-26 12:00:01 | 2018-01-26 17:20:11 |                   1 |       5 |
|  7 |         2 |         2 | 2018-01-26 10:20:11 | 2018-01-26 17:20:11 |                   2 |      17 |
|  8 |         2 |         2 | 2018-01-26 11:20:11 | 2018-01-26 17:20:11 |                   2 |      20 |
|  9 |         2 |         2 | 2018-01-26 13:20:11 | 2018-01-26 17:20:11 |                   2 |      13 |
| 10 |         2 |         2 | 2018-01-26 14:20:11 | 2018-01-26 17:20:11 |                   2 |       6 |
| 11 |         2 |         2 | 2018-01-26 15:20:11 | 2018-01-26 17:20:11 |                   2 |      16 |
| 12 |         2 |         2 | 2018-01-26 16:20:11 | 2018-01-26 17:20:11 |                   2 |       4 |
| 13 |         3 |         3 | 2018-01-26 17:20:11 | 2018-01-26 17:20:11 |                   3 |      19 |
| 14 |         3 |         3 | 2018-01-26 18:20:11 | 2018-01-26 17:20:11 |                   3 |      12 |
| 15 |         3 |         3 | 2018-01-26 19:20:11 | 2018-01-26 17:20:11 |                   3 |      10 |
| 16 |         3 |         3 | 2018-01-26 20:20:11 | 2018-01-26 17:20:11 |                   3 |       9 |
| 17 |         3 |         3 | 2018-01-26 21:20:11 | 2018-01-26 17:20:11 |                   3 |       3 |
| 18 |         3 |         3 | 2018-01-26 22:20:11 | 2018-01-26 17:20:11 |                   3 |       1 |
| 19 |         4 |         4 | 2018-01-26 23:20:11 | 2018-01-26 17:20:11 |                   4 |      19 |
| 20 |         4 |         4 | 2018-01-26 00:20:11 | 2018-01-26 17:20:11 |                   4 |      17 |
| 21 |         4 |         4 | 2018-01-26 02:20:11 | 2018-01-26 17:20:11 |                   4 |      18 |
| 22 |         4 |         4 | 2018-01-26 03:20:11 | 2018-01-26 17:20:11 |                   4 |       4 |
| 23 |         4 |         4 | 2018-01-26 05:20:11 | 2018-01-26 17:20:11 |                   4 |       7 |
| 24 |         4 |         4 | 2018-01-26 07:20:11 | 2018-01-26 17:20:11 |                   4 |       2 |
| 25 |         5 |         5 | 2018-01-26 09:20:11 | 2018-01-26 17:20:11 |                   5 |       2 |
| 26 |         5 |         5 | 2018-01-26 10:20:11 | 2018-01-26 17:20:11 |                   5 |       1 |
| 27 |         5 |         5 | 2018-01-26 10:22:11 | 2018-01-26 17:20:11 |                   5 |       3 |
| 28 |         5 |         5 | 2018-01-26 12:28:11 | 2018-01-26 17:20:11 |                   5 |      10 |
| 29 |         5 |         5 | 2018-01-26 11:24:11 | 2018-01-26 17:20:11 |                   5 |      20 |
| 30 |         5 |         5 | 2018-01-26 10:21:11 | 2018-01-26 17:20:11 |                   5 |       9 |
+----+-----------+-----------+---------------------+---------------------+---------------------+---------+
30 rows in set (0,09 sec)
*/

INSERT INTO transaksi VALUES
(default,1000000,1,1,1,'2018-01-29 17:20:11','2018-01-29 17:20:11',1),
(default,1000000,14,2,2,'2018-01-29 17:20:11','2018-01-29 17:20:11',1),
(default,1000000,18,3,3,'2018-01-29 17:20:11','2018-01-29 17:20:11',1),
(default,1000000,8,4,4,'2018-01-29 17:20:11','2018-01-29 17:20:11',1),
(default,1000000,11,5,5,'2018-01-29 17:20:11','2018-01-29 17:20:11',1),
(default,1000000,5,6,6,'2018-01-29 17:20:11','2018-01-29 17:20:11',1),
(default,500000,17,7,7,'2018-01-29 17:20:11','2018-01-29 17:20:11',2),
(default,500000,20,8,8,'2018-01-29 17:20:11','2018-01-29 17:20:11',2),
(default,500000,13,8,8,'2018-01-29 17:20:11','2018-01-29 17:20:11',2),
(default,500000,6,9,9,'2018-01-29 17:20:11','2018-01-29 17:20:11',2),
(default,500000,16,10,10,'2018-01-29 17:20:11','2018-01-29 17:20:11',2),
(default,500000,4,11,11,'2018-01-29 17:20:11','2018-01-29 17:20:11',2),
(default,400000,19,12,12,'2018-01-29 17:20:11','2018-01-29 17:20:11',3),
(default,400000,12,13,13,'2018-01-29 17:20:11','2018-01-29 17:20:11',3),
(default,400000,10,14,14,'2018-01-29 17:20:11','2018-01-29 17:20:11',3),
(default,400000,9,15,15,'2018-01-29 17:20:11','2018-01-29 17:20:11',3),
(default,400000,3,16,16,'2018-01-29 17:20:11','2018-01-29 17:20:11',3),
(default,400000,1,17,17,'2018-01-29 17:20:11','2018-01-29 17:20:11',3),
(default,250000,19,18,18,'2018-01-29 17:20:11','2018-01-29 17:20:11',4),
(default,250000,17,19,19,'2018-01-29 17:20:11','2018-01-29 17:20:11',4),
(default,250000,18,20,20,'2018-01-29 17:20:11','2018-01-29 17:20:11',4),
(default,250000,4,21,21,'2018-01-29 17:20:11','2018-01-29 17:20:11',4),
(default,250000,7,22,22,'2018-01-29 17:20:11','2018-01-29 17:20:11',4),
(default,250000,2,23,23,'2018-01-29 17:20:11','2018-01-29 17:20:11',4),
(default,600000,2,24,24,'2018-01-29 17:20:11','2018-01-29 17:20:11',5),
(default,600000,1,25,25,'2018-01-29 17:20:11','2018-01-29 17:20:11',5),
(default,600000,3,26,26,'2018-01-29 17:20:11','2018-01-29 17:20:11',5),
(default,600000,10,27,27,'2018-01-29 17:20:11','2018-01-29 17:20:11',5),
(default,600000,20,28,28,'2018-01-29 17:20:11','2018-01-29 17:20:11',5),
(default,600000,9,29,29,'2018-01-29 17:20:11','2018-01-29 17:20:11',5);

/*
mysql> select *from transaksi;
+----+-------------+---------+-----------+-----------+---------------------+---------------------+-------------+
| id | jumlah_dana | user_id | create_by | update_by | create_at           | update_at           | campaign_id |
+----+-------------+---------+-----------+-----------+---------------------+---------------------+-------------+
|  1 |     1000000 |       1 |         1 |         1 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           1 |
|  2 |     1000000 |      14 |         2 |         2 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           1 |
|  3 |     1000000 |      18 |         3 |         3 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           1 |
|  4 |     1000000 |       8 |         4 |         4 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           1 |
|  5 |     1000000 |      11 |         5 |         5 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           1 |
|  6 |     1000000 |       5 |         6 |         6 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           1 |
|  7 |      500000 |      17 |         7 |         7 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           2 |
|  8 |      500000 |      20 |         8 |         8 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           2 |
|  9 |      500000 |      13 |         8 |         8 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           2 |
| 10 |      500000 |       6 |         9 |         9 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           2 |
| 11 |      500000 |      16 |        10 |        10 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           2 |
| 12 |      500000 |       4 |        11 |        11 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           2 |
| 13 |      400000 |      19 |        12 |        12 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           3 |
| 14 |      400000 |      12 |        13 |        13 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           3 |
| 15 |      400000 |      10 |        14 |        14 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           3 |
| 16 |      400000 |       9 |        15 |        15 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           3 |
| 17 |      400000 |       3 |        16 |        16 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           3 |
| 18 |      400000 |       1 |        17 |        17 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           3 |
| 19 |      250000 |      19 |        18 |        18 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           4 |
| 20 |      250000 |      17 |        19 |        19 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           4 |
| 21 |      250000 |      18 |        20 |        20 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           4 |
| 22 |      250000 |       4 |        21 |        21 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           4 |
| 23 |      250000 |       7 |        22 |        22 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           4 |
| 24 |      250000 |       2 |        23 |        23 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           4 |
| 25 |      600000 |       2 |        24 |        24 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           5 |
| 26 |      600000 |       1 |        25 |        25 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           5 |
| 27 |      600000 |       3 |        26 |        26 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           5 |
| 28 |      600000 |      10 |        27 |        27 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           5 |
| 29 |      600000 |      20 |        28 |        28 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           5 |
| 30 |      600000 |       9 |        29 |        29 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |           5 |
+----+-------------+---------+-----------+-----------+---------------------+---------------------+-------------+
30 rows in set (0,00 sec)
*/

INSERT INTO history VALUES
(default,1,1,1,1,1,'2018-01-29 17:20:11','2018-01-29 17:20:11'),
(default,14,1,2,2,2,'2018-01-29 17:20:11','2018-01-29 17:20:11'),
(default,18,1,3,3,3,'2018-01-29 17:20:11','2018-01-29 17:20:11'),
(default,8,1,4,4,4,'2018-01-29 17:20:11','2018-01-29 17:20:11'),
(default,11,1,5,5,5,'2018-01-29 17:20:11','2018-01-29 17:20:11'),
(default,5,1,6,6,6,'2018-01-29 17:20:11','2018-01-29 17:20:11'),
(default,17,1,7,7,7,'2018-01-29 17:20:11','2018-01-29 17:20:11'),
(default,20,2,8,8,8,'2018-01-29 17:20:11','2018-01-29 17:20:11'),
(default,13,1,9,9,9,'2018-01-29 17:20:11','2018-01-29 17:20:11'),
(default,6,2,10,10,10,'2018-01-29 17:20:11','2018-01-29 17:20:11');

/*
mysql> select *from history;
+----+---------+---------------------+-------------+-----------+-----------+---------------------+---------------------+
| id | user_id | pembuat_campaign_id | campaign_id | create_by | update_by | create_at           | update_at           |
+----+---------+---------------------+-------------+-----------+-----------+---------------------+---------------------+
|  1 |       1 |                   1 |           1 |         1 |         1 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |
|  2 |      14 |                   1 |           2 |         2 |         2 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |
|  3 |      18 |                   1 |           3 |         3 |         3 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |
|  4 |       8 |                   1 |           4 |         4 |         4 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |
|  5 |      11 |                   1 |           5 |         5 |         5 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |
|  6 |       5 |                   1 |           6 |         6 |         6 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |
|  7 |      17 |                   1 |           7 |         7 |         7 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |
|  8 |      20 |                   2 |           8 |         8 |         8 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |
|  9 |      13 |                   1 |           9 |         9 |         9 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |
| 10 |       6 |                   2 |          10 |        10 |        10 | 2018-01-29 17:20:11 | 2018-01-29 17:20:11 |
+----+---------+---------------------+-------------+-----------+-----------+---------------------+---------------------+
10 rows in set (0,00 sec)
*/

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
