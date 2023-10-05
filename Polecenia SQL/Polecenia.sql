gwarancje

CREATE TABLE `gwarancje` (
	`gwarancja_ID` BIGINT(20) UNSIGNED NOT NULL,
	`zamówienie_ID` BIGINT(20) NOT NULL,
	`data_oddania` DATE NOT NULL,
	PRIMARY KEY (`gwarancja_ID`) USING BTREE,
	INDEX `telefon_ID` (`zamówienie_ID`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;


INSERT INTO gwarancje (gwarancja_ID, zamówienie_ID, data_oddania) VALUES (1, 1, '2023-09-25')

klienci

CREATE TABLE `klienci` (
	`klient_ID` BIGINT(20) UNSIGNED NOT NULL,
	`imie` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`nazwisko` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`adres` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`miasto` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`email` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`nr_telefonu` INT(11) NOT NULL DEFAULT '0',
	`kod_pocztowy` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`data_rej` DATETIME NOT NULL,
	PRIMARY KEY (`klient_ID`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

INSERT INTO klienci (klient_ID, imie, nazwisko, adres, miasto, email, nr_telefonu, kod_pocztowy, data_rej) VALUES (1, 'Paweł', 'Dudziak', 'Leszno 129', 'Przemyśl', 'paweldudziak@spoko.pl', 843048374, '37-723', '2023-06-12 08:12:34');

telefony

CREATE TABLE `telefony` (
	`telefon_ID` BIGINT(20) UNSIGNED NOT NULL,
	`marka` BIGINT(20) NOT NULL DEFAULT '0',
	`model` BIGINT(20) NOT NULL DEFAULT '0',
	`cena` DECIMAL(10,2) NOT NULL DEFAULT '0.00',
	`dostępność` BIT(1) NOT NULL,
	PRIMARY KEY (`telefon_ID`) USING BTREE,
	INDEX `marka` (`marka`) USING BTREE,
	INDEX `model` (`model`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;


INSERT INTO telefony (telefon_ID, marka, model, cena, dostępność) VALUES (1, 1, 1, 1000, 1)

wypożyczenia

CREATE TABLE `wypożyczenia` (
	`wypożyczenie_ID` BIGINT(20) UNSIGNED NOT NULL,
	`klient_ID` BIGINT(20) NOT NULL,
	`telefon_ID` BIGINT(20) NOT NULL,
	`opłata` DECIMAL(10,2) NOT NULL,
	`data_wyp` DATETIME NOT NULL,
	`data_zwr` DATETIME NOT NULL,
	PRIMARY KEY (`wypożyczenie_ID`) USING BTREE,
	INDEX `klient_ID` (`klient_ID`) USING BTREE,
	INDEX `telefon_ID` (`telefon_ID`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

INSERT INTO wypożyczenia (wypożyczenie_ID, klient_ID, telefon_ID, opłata, data_wyp, data_zwr) VALUES(1, 4, 6, 300, '2023-09-13 11:23:32', '2023-10-02 10:59:43')

zamówienia

CREATE TABLE `zamówienia` (
	`zamówienie_ID` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
	`gwarancja_ID` BIGINT(20) NOT NULL,
	`klient_ID` BIGINT(20) NOT NULL DEFAULT '0',
	`telefon_ID` BIGINT(20) NOT NULL DEFAULT '0',
	`rodzaj_plat` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`cena` DECIMAL(10,0) NOT NULL DEFAULT '0',
	`data_zam` DATETIME NOT NULL,
	PRIMARY KEY (`zamówienie_ID`) USING BTREE,
	INDEX `klient_ID` (`klient_ID`) USING BTREE,
	INDEX `telefon_ID` (`telefon_ID`) USING BTREE,
	INDEX `gwarancja_ID` (`gwarancja_ID`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

INSERT INTO zamówienia (zamówienie_ID, gwarancja_ID, klient_ID, telefon_ID, rodzaj_plat, cena, data_zam) VALUES (1, 1, 8, 5, 'blik', 5999, '2023-08-13 01:01:06')

zwroty

CREATE TABLE `zwroty` (
	`zwrot_ID` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
	`klient_ID` BIGINT(20) NOT NULL,
	`telefon_ID` BIGINT(20) NOT NULL,
	`zamówienie_ID` BIGINT(20) NOT NULL,
	`stan_telefonu` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`data_zwrotu` DATETIME NOT NULL,
	PRIMARY KEY (`zwrot_ID`) USING BTREE,
	INDEX `klient_ID` (`klient_ID`) USING BTREE,
	INDEX `telefon_ID` (`telefon_ID`) USING BTREE,
	INDEX `zamówienie_ID` (`zamówienie_ID`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

INSERT INTO zwroty (zwrot_ID, klient_ID, telefon_ID, zamówienie_ID, stan_telefonu, data_zwrotu) VALUES (1, 8, 5, 1, 'GREAT', '2023-09-12 12:09:45')

marki

CREATE TABLE `marki` (
	`marka_ID` BIGINT(20) NOT NULL,
	`marka` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`marka_ID`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

INSERT INTO marki (marka_ID, marka) VALUES (1, 'iphone')

modele

CREATE TABLE `modele` (
	`model_ID` BIGINT(20) UNSIGNED NOT NULL,
	`model` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`model_ID`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

INSERT INTO modele (model_ID, model) VALUES (1, 'note 8t')






