-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 04 Tem 2023, 16:48:27
-- Sunucu sürümü: 10.4.28-MariaDB
-- PHP Sürümü: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `shop_db`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(1, 1, 'mustafa', 'mmustafakopmazz@gmail.com', '1', 'merhaba');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(3, 1, 'asdasd', '4525245452', 'mmustafakopmazz@gmail.com', 'cash on delivery', 'flat no. awdadawd, adawdawdawd, adwadwawda, dadwawd, adwadawd - 554564', 'Kamera Nikon Z7 Iı + 24-70 F/4 S Kit NVOA070K001 (100000 x 1) - ', 100000, '2023-07-04', 'pending');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `image_01`, `image_02`, `image_03`) VALUES
(4, 'Kamera Nikon Z7 Iı + 24-70 F/4 S Kit NVOA070K001', 'ÜRÜN 2 YIL GARANTİLİDİR. Nikon Z7 II + 24-70 f/4 S Kit Aynasız Fotoğraf Makinesi Yüksek çözünürlüklü 45,7 MP FX biçimli BSI CMOS sensör ve çift EXPEED 6 görüntü işlemcisine sahip olan Nikon Z7 II gelişmiş özellikleriyle fotoğraf tutkunlarının gözdesi olacak. Genel Özellikler 45.7 Megapiksel FX-Format BSI CMOS Sensör Çift EXPEED 6 Görüntü İşlemcisi 493 Noktalı Faz Algılamalı AF Sistemi UHD 4K60 Video N-Log ve 10-Bit HDMI Çıkışı 10 fps Sürekli Çekim ISO 64-25600 Işık Hassasiyeti Çift Hafıza Kartı ', 100000, 'kamera1.webp', 'kamera1.1.webp', 'kamera1.2.webp'),
(5, 'Kamera Hikvision Ds-2ce76d0t-exıpf 2mp DS-2CE76D0T-EXIPF 2MP', '2MP CMOS Sensör ile 1080p çözünürlük, 2.8mm Sabit Lens, ICR, 1x Analog HD çıkış, Smart IR ile 20 Mt. Gece Görüş Mesafesi, 12V DC, TVI / AHD / CVI / CVBS desteği ile tüm kayıt cihazlarında çalışabilir. DS 2CE76D0T EXIPF 2MP', 600, 'kamera2.webp', 'kamera2.webp', 'kamera2.webp'),
(6, 'Kamera Hikvision Hıkvısıon Bullet Kamera 4mp DS-2CD1043GOE-IF', '1/2.8&#34; PS CMOS, 0,01Lux renkli, 4mm sabit lens, 30mt IR aydınlatma mesafesi, H265, ICR, 3D DNR, DWDR, ROI, Antiflicker, maskeleme, aynalama, ONVIF, IP67, 12V DC veya PoE', 2000, 'kamera3.webp', 'kamera3.webp', 'kamera3.webp'),
(7, 'Kamera Xiaomi Mi Home Security Camera 360° Ev Güvenlik Kamerası Ip 1080p ke283582385235', 'GÜVENLİK Alarm (Uyarı): Var Alarm Şekli: Uygulama Bildirimi Gece Görüşü (Kızılötesi): Var Kızılötesi LED: 8 adet Dalga Boyu: 940 nm İki Yönlü Sesli İletişim: Var GÖRÜNTÜ & KAYIT Çözünürlük Biçimi: FHD Piksel Sayısı: 1080 p Görüş Açısı: 110 ° Panoramik Çekim: Var Panoramik Çekim Yönü:Yatay-Dikey Panoramik Çekim Açısı (Yatay): 360 ° Panoramik Çekim Açısı (Dikey): 96 ° Odak Mesafesi: 3.9 mm Kayıt Türü: Bulut Depolama-NAS-Hafıza Kartı BAĞLANTILAR Hafıza Kartı Desteği: Var Hafıza Kartı Tipi: MicroSD ', 1250, 'kamera4.webp', 'kamera4.1.webp', 'kamera4.2.webp'),
(8, 'Kamera A4 Tech PK-635K TAK CALISTIR/ YUZ TAKIPLI WEB CAM 210126803', 'cmos, 640×480 piksel çerçeve oranı 30fps@640x480, @600x800, @320x240, @160x120 lens f=2.4,f=4.9mm görüş açısı 54 derece odak mesafesi otomatik focus, 30cm den sonsuza pozlama kontrolü otomatik beyaz dengesi otomatik görüntü çekme tuşu donanım görüntü çözünürlüğü 1280x960,600x800, 640x480, 352x288, 320x240, 160x1 mikrofon var titreme kontrolü 50hz, 60hz garanti 2 yıl', 400, 'kamera5.webp', 'kamera5.webp', 'kamera5.webp'),
(9, 'Kamera xmldünyası CATA CT-4051 AKILLI DIŞ MEKAN IP KAMERA XD-ARAS-TCT4051', 'Güvenlik Kamerası', 3000, 'kamera6.2.webp', 'kamera6.webp', 'kamera6.1.webp'),
(10, 'TV TCL 50p615 50&#34; 127 Ekran Android Uydu Alıcılı 4k Ultra Hd Smart Led Tv TV-P615', '4K Ultra HD 127 Ekran', 9000, 'tv1.webp', 'tv1.1.webp', 'tv1.2.webp'),
(11, 'TV LG 55UP77006 55&#39;&#39; 139 Ekran Uydu Alıcılı 4K Ultra HD Smart LED TV TV-UP77006', '4K Ultra HD 139 Ekran', 16000, 'tv2.webp', 'tv2.1.webp', 'tv2.2.webp'),
(12, 'TV Samsung 50BU8100 50&#34; 127 Ekran Uydu Alıcılı 4K Ultra HD Smart LED TV TV-BU8100', 'Crystal UHD 127 Ekran', 15000, 'televizyon3.webp', 'televizyon4.webp', 'televizyon5.webp'),
(13, 'TV Philips 58PUS8507 58&#34; 147 Ekran Uydu Alıcılı 4K Ultra HD Smart LED TV TV-PUS8507', 'Ambilight TV 147 Ekran', 20000, 'televizyon1.webp', 'televizyon1.1.webp', 'televizyon1.2.webp'),
(14, 'TV Regal 43R654FC 43&#34; 109 Ekran Uydu Alıcılı Full HD Smart LED TV', 'Full HD 109 Ekran', 6000, 'televizyon6.webp', 'televizyon6.webp', 'televizyon6.webp'),
(15, 'Laptop Apple Macbook Pro 13.3&#34; M2 10c Gpu 8gb 256 Gb Ssd Uzay Grisi MNEP3TU/A', '13 inç MacBook Pro M2 - 2022 8 çekirdekli CPU’ya, 10 çekirdekli GPU’ya ve 16 çekirdekli Neural Engine’a sahip Apple M2 çip\r\n8 GB birleşik bellek\r\n256 GB SSD depolama\r\nTrue Tone özelliğine sahip 13 inç Retina ekran\r\nİki adet Thunderbolt/USB 4 bağlantı noktası\r\nTouch Bar ve Touch ID\r\nArkadan Aydınlatmalı Magic Keyboard - Türkçe Q Klavye\r\nForce Touch trackpad\r\n2 Yıl Apple Türkiye Garantili', 40000, 'apple1.webp', 'apple2.webp', 'apple3.webp'),
(16, 'Laptop LENOVO IdeaPad3 Intel Pentium Silver-N5030 8GB 256GB SSD DOS 15.6&#34; FHD Laptop (Lenovo Tür', 'İşlemci : İntel Core i7 10.Nesil\r\nRam : 8 GB\r\nHafıza : 256 GB SSD\r\nEkran Kartı : Nvidia 1050 4GB', 7000, 'lenova1.webp', 'lenova2.webp', 'lenova3.webp'),
(17, 'Laptop Monster Abra A5 V17.3.4 Intel Core i7 11800H 32GB RAM 1 TB SSD RTX 3050 Ti FreeDOS 15,6 inç F', 'İşlemci : İntel Core i7 10.Nesil \r\nRam : 8 GB \r\nHafıza : 256 GB SSD \r\nEkran Kartı : Nvidia 1050 4GB', 25000, 'mon1.webp', 'mon2.webp', 'mon3.webp'),
(18, 'Telefon ULEFONE Armor 20WT 10850 mAh IP68/69K Cep Telefonu (yurtdışı) Armor 20T', 'RAM: 12GB large memory Flash storage: 256GB phone storage microSD memory card Up to 2TB', 33000, 'tel4.webp', 'tel5.webp', 'tel6.webp'),
(19, 'Telefon Xiaomi Redmi Note 8 Pro 6 GB+128 GB Akıllı Cep Telefonu - Turuncu (İthalatçı Garantili)', 'Ağırlık 199 g arttırılabilir hafıza 256 gb&#39;a kadar assisted gps (baz istasyon destekli küresel konumlama sistemi) var bağlantı hızı 42.2 mbps bekleme süresi bekleme süresi ile ilgili kesin bir bilgi bulunmamaktadır, ürünün modeline göre değişiklik gösterebilmektedir. Bluetooth var boyutlar 161.3 x 76.4 x 8.8 mm çift hatlı var ( tek işlemcili ) dahili hafıza 128 gb dahili modem var dokunmatik ekran var ekran boyut aralığı 6 inç ve üzeri ekran boyutu 6,53 inç ', 8000, 'tel1.webp', 'tel2.webp', 'tel3.webp'),
(20, 'Telefon Apple Yenilenmiş Iphone 7 Plus 32 Gb Black (12 Ay Garantili) B Grade i7plus32black', 'Dahili Hafıza : 32 GB\r\nRAM Kapasitesi : 3 GB\r\nPil Gücü (mAh) : 1500 - 1800', 6000, 'tel7.webp', 'tel7.webp', 'tel7.webp'),
(21, 'Buzdolabı Dijitsu DB100 A Büro Tipi Mini Buzdolabı', 'Enerji Sınıfı A+\r\nDondurucu Bölme Kapasitesi (Lt) 12\r\nDondurucu Özelliği Statik\r\nHacim (L) 93\r\nHızlı Dondurma Yok\r\nHızlı Soğutma Yok\r\nKapı Açık Uyarısı Yok\r\nAydınlatma Var\r\nKontrol Paneli Mekanik\r\nKullanım Şekli Solo\r\nSes Seviyesi (dB) 38\r\nSoğutucu Bölme Kapasitesi (Lt) 93\r\nSu & Buz Pınarı Yok', 4000, 'buz1.webp', 'buz2.webp', 'buz3.webp'),
(22, 'Altus AL 6103 L 6 Kg 1000 Devir Çamaşır Makinesi', 'Ürün Rengi Beyaz\r\nKapasite (kg) (ÇM) 6.0\r\nEnerji Sınıfı E\r\nSes Seviyesi(dB(A)) 76 dBA\r\nProgram Sayısı 15\r\nEnerji Tüketimi (100 Çevrim) 73 kWh\r\nSu Tüketimi (1 Çevrim) 43 L\r\nMax. Sıkma Devri (rpm) 1000\r\nSu Girişi Tek (soğuk)\r\nYıllık enerji tüketimi (AE_c) (kWh) 152 kWh\r\nYıllık Su Tüketimi (AW_c) (l) 8799 L\r\nMotor Tipi Universal\r\nÇocuk Kilidi Var', 7000, 'maki.webp', 'maki.webp', 'maki.webp');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'mustafa', 'mmustafakopmazz@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elaktar` (`user_id`),
  ADD KEY `elaktar2` (`pid`);

--
-- Tablo için indeksler `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Tablo için indeksler `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pid` (`pid`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `elaktar` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `elaktar2` FOREIGN KEY (`pid`) REFERENCES `products` (`id`);

--
-- Tablo kısıtlamaları `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Tablo kısıtlamaları `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Tablo kısıtlamaları `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
