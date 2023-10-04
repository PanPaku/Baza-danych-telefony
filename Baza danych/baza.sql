-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Wersja serwera:               11.0.2-MariaDB - mariadb.org binary distribution
-- Serwer OS:                    Win64
-- HeidiSQL Wersja:              12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Zrzucanie danych dla tabeli sklep telefoniczny.gwarancje: ~3 rows (około)
INSERT INTO `gwarancje` (`gwarancja_ID`, `telefon_ID`, `data_oddania`) VALUES
	(1, 1, '2023-09-25'),
	(2, 8, '2023-10-14'),
	(3, 10, '2023-09-22');

-- Zrzucanie danych dla tabeli sklep telefoniczny.klienci: ~8 rows (około)
INSERT INTO `klienci` (`klient_ID`, `imie`, `nazwisko`, `adres`, `miasto`, `email`, `nr_telefonu`, `kod_pocztowy`, `data_rej`) VALUES
	(1, 'Paweł', 'Dudziak', 'Leszno 129', 'Przemyśl', 'paweldudziak@spoko.pl', 843048374, '37-723', '2023-06-12 08:12:34'),
	(2, 'Antoni', 'Noga', 'Jagiellońska 24', 'Kraków', 'antoninoga@op.pl', 983294820, '30-000', '2023-07-25 16:15:45'),
	(3, 'Krzysztof', 'Tomczyk', 'Mickiewicza 15', 'Warszawa', 'krzysztoftomczyk@amorki.pl', 392074682, '00-001', '2023-08-02 13:56:25'),
	(4, 'Krystian', 'Lewandowski', 'Dworskiego 34', 'Gdańsk', 'krystianlewandowski@amorki.pl', 382094622, '80-000', '2022-10-02 10:26:25'),
	(5, 'Andrzej', 'Lewicki', 'Sportowa 96', 'Przemyśl', 'andrzejlewicki@amorki.pl', 290376495, '37-723', '2023-09-12 18:22:02'),
	(6, 'Krzysztof', 'Stanowski', 'Tatarska 15', 'Białystok', 'krzysztofstanowski@op.pl', 482097345, '15-000', '2023-10-03 10:52:06'),
	(7, 'Mariusz', 'Pudzianowski', 'Grzybiarska 12', 'Szczecin', 'mariuszpudzianowski@op.pl', 263849267, '70-000', '2023-07-17 12:43:18'),
	(8, 'Tomek', 'Prawicki', 'Domkowa 125', 'Poznań', 'tomekprawicki@amorki.pl', 273948726, '60-001', '2022-12-02 19:54:38'),
	(9, 'Paweł', 'Dudziak', 'Leszno 129', 'Przemyśl', 'paweldudziak@spoko.pl', 843048374, '37-723', '2023-06-12 08:12:34');

-- Zrzucanie danych dla tabeli sklep telefoniczny.telefony: ~8 rows (około)
INSERT INTO `telefony` (`telefon_ID`, `gwarancja_ID`, `marka`, `model`, `system_operacyjny`, `cena`, `pamięć_ram`, `procesor`, `pamięć_wbudowana`, `kolor`, `port_ładowania`, `dostępność`, `sztuki`) VALUES
	(1, 1, 'xiaomi', 'note 8t', 'android', 1000.00, '4 GB', 'qualcomm Snapdragon 665', '64 GB', 'czarny', 'USB C', b'1', 3),
	(2, 0, 'iphone', '13', 'ios', 3000.00, '4 GB', 'apple A15 Bionic', '128 GB', 'złoty', 'USB C', b'1', 3),
	(3, 0, 'samsung', 'S22', 'android', 2590.00, '2 GB', 'samsung Exynos 2200', '32 GB', 'biały', 'USB C', b'1', 2),
	(4, 0, 'xiaomi', '9C', 'android', 521.00, '2 GB', 'mediaTek Helio G35', '64 GB', 'czarny', 'micro USB', b'0', 0),
	(5, 0, 'iphone', '15', 'ios', 6000.00, '6 GB', 'apple A16 Bionic', '512 GB', 'srebrny', 'USB C', b'1', 5),
	(6, 0, 'asus rog', '6', 'android', 2999.00, '6 GB', 'qualcomm Snapdragon 8+ gen 1', '512 GB', 'złoty', 'USB C', b'1', 4),
	(7, 0, 'xiaomi', '12', 'android', 650.00, '2 GB', 'mediaTek Helio G88', '128 GB', 'biały', 'micro USB', b'1', 4),
	(8, 0, 'iphone', '11', 'ios', 1499.00, '4 GB', 'apple A13 Bionic', '64 GB', 'czarny', 'USB C', b'1', 9);

-- Zrzucanie danych dla tabeli sklep telefoniczny.wypożyczenia: ~3 rows (około)
INSERT INTO `wypożyczenia` (`wypożyczenie_ID`, `klient_ID`, `telefon_ID`, `opłata`, `data_wyp`, `data_zwr`) VALUES
	(1, 4, 6, 300.00, '2023-09-13 11:23:32', '2023-10-02 10:59:43'),
	(2, 7, 1, 500.00, '2023-08-29 23:00:11', '2023-09-20 18:15:12'),
	(3, 4, 6, 300.00, '2023-09-13 11:23:32', '2023-10-02 10:59:43');

-- Zrzucanie danych dla tabeli sklep telefoniczny.zamówienia: ~5 rows (około)
INSERT INTO `zamówienia` (`zamówienie_ID`, `klient_ID`, `telefon_ID`, `rodzaj_plat`, `cena`, `data_zam`) VALUES
	(1, 8, 5, 'blik', 5999, '2023-08-13 01:01:06'),
	(2, 7, 7, 'paypal', 649, '2023-07-26 23:02:02'),
	(3, 3, 2, 'blik', 3000, '2023-04-07 09:08:54'),
	(4, 3, 2, 'paypal', 3000, '2023-10-10 19:23:02'),
	(5, 1, 2, 'blik', 3000, '2023-10-02 09:44:21');

-- Zrzucanie danych dla tabeli sklep telefoniczny.zwroty: ~3 rows (około)
INSERT INTO `zwroty` (`zwrot_ID`, `klient_ID`, `telefon_ID`, `zamówienie_ID`, `stan_telefonu`, `data_zwrotu`) VALUES
	(1, 8, 5, 1, 'GREAT', '2023-09-12 12:09:45'),
	(2, 3, 2, 4, 'AVERAGE', '2023-10-02 19:12:05'),
	(3, 8, 5, 1, 'GREAT', '2023-09-12 12:09:45');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
