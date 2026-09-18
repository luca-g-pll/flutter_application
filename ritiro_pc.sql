-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 13, 2024 alle 22:48
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ritiro_pc`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `armadi`
--

CREATE TABLE `armadi` (
  `id` int(11) NOT NULL,
  `capienza` int(11) DEFAULT NULL,
  `aula` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `armadi`
--

INSERT INTO `armadi` (`id`, `capienza`, `aula`, `nome`) VALUES
(1, 30, 1, 'A1');

-- --------------------------------------------------------

--
-- Struttura della tabella `aule`
--

CREATE TABLE `aule` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `piano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `aule`
--

INSERT INTO `aule` (`id`, `nome`, `piano`) VALUES
(1, 'DOCENTIINFO', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `utente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `utente`) VALUES
(1, 'bellux', '$argon2id$v=19$m=65536,t=3,p=4$k0L1JLW7hm4FGRgaxglE6w$GJx5B9MTwjnC/k0nC0fGbashWLayoeUJNamMtVXGm30', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `pc`
--

CREATE TABLE `pc` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `numero_inventario` int(11) NOT NULL,
  `mac_address_wifi` varchar(100) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `data_ultimo_aggiornamento` date DEFAULT NULL,
  `osservazioni` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `armadio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `pc`
--

INSERT INTO `pc` (`id`, `nome`, `numero_inventario`, `mac_address_wifi`, `note`, `data_ultimo_aggiornamento`, `osservazioni`, `status`, `armadio`) VALUES
(1, 'HP-14', 3370, '5C-BA-EF-4C-7C-31', 'PC notebook HP 255 G7 - AMD Ryzen 5 3500U with Radeon Vega Mobile Gfx 2.10 GHz – RAM 8 GB – WIN10PRO 22H2 – H.D.250 GB - N. serie: CND038030P N. prodotto: 3C248EA#ABZ', '2023-12-12', NULL, 'disponibile', 1),
(2, 'HP-1', 3241, '70-66-55-6D-E9-85', 'PC notebook HP 255 G7 - AMD Ryzen 3 3200U with Radeon Vega Mobile Gfx 2.60 GHz - RAM 8 GB – WIN10PRO 22H2 – H.D.250 GB - N. serie: CND01624SQ - N. prodotto: 2D318EA', '2023-06-12', NULL, 'disponibile', 1),
(3, 'LENOVO-2', 3094, 'D0-AB-D5-0B-FF-E5', 'INTEL CORE I5-7200U 2.50GHZ - 8 GB RAM - WIN 10 PRO. 22H2 -MODELL V130-15IKB - TYPE 81HN - N. SERIE R90V0ZJN', '2023-05-12', NULL, 'disponibile', 1),
(4, 'LENOVO-1', 3113, 'D0-AB-D5-08-C1-C2', 'INTEL CORE I5-7200U 2.50GHZ - 8 GB RAM - WIN 10 PRO. 22H2 -MODELL V130-15IKB - TYPE 81HN - N. SERIE R90V0ZR5', '2023-05-12', NULL, 'disponibile', 1),
(5, 'HP-4', 3491, '90-E8-68-82-8A-99', 'NUMERO PRODOTTO: HP 250 G8 Notebook PC – NUMERO DI SERIE: CND1377PCR – COD. PRODOTTO: 3V5P1EA#ABZ - 11th Gen Intel(R) Core(TM) i5-1135G7 @ 2.40GHz - Windows 10 Pro Education 64 bit  Versione: 19045.2546 – 8 GB RAM – 500 GB H.D.', '2023-06-12', 'senza veyon tutti hp grigio chiari', 'disponibile', 1),
(6, 'HP-5', 3492, '90-E8-68-82-8A-9D', 'NUMERO PRODOTTO: HP 250 G8 Notebook PC – NUMERO DI SERIE: CND1377P8S – COD. PRODOTTO: 3V5P1EA#ABZ - 11th Gen Intel(R) Core(TM) i5-1135G7 @ 2.40GHz - Windows 10 Pro Education 64 bit  Versione: 19045.2546 – 8 GB RAM – 500 GB H.D', '2023-06-12', NULL, 'disponibile', 1),
(7, 'HP-6', 3493, '90-E8-68-82-8A-8F', 'NUMERO PRODOTTO: HP 250 G8 Notebook PC – NUMERO DI SERIE: CND1377P95 – COD. PRODOTTO: 3V5P1EA#ABZ - 11th Gen Intel(R) Core(TM) i5-1135G7 @ 2.40GHz - Windows 10 Pro Education 64 bit  Versione: 19045.2546 – 8 GB RAM – 500 GB H.D', '2023-06-12', NULL, 'disponibile', 1),
(8, 'ASUS-5', 3247, '9C-FC-E8-B0-03-F6', 'INTEL CORE I3 10TH GEN. -', '2023-05-12', NULL, 'disponibile', 1),
(9, 'HP-8', 3367, '5C-BA-EF-4C-94-8B', 'PC notebook HP 255 G7 - AMD Ryzen 5 3500U with Radeon Vega Mobile Gfx 2.10 GHz – RAM 8 GB – WIN10PRO 22H2 – H.D.250 GB - N. serie: CND0380366 N. prodotto: 3C248EA#ABZ', '2023-07-12', NULL, 'disponibile', 1),
(10, 'HP-9', 3363, '5C-BA-EF-4C-BE-89', 'PC notebook HP 255 G7 - AMD Ryzen 5 3500U with Radeon Vega Mobile Gfx 2.10 GHz – RAM 8 GB – WIN10PRO 22H2 – H.D.250 GB - N. serie: CND0380366 N. prodotto: 3C248EA#ABZ', '2023-07-12', NULL, 'disponibile', 1),
(11, 'HP-10', 3365, '5C-BA-EF-48-CE-59', 'PC notebook HP 255 G7 - AMD Ryzen 5 3500U with Radeon Vega Mobile Gfx 2.10 GHz – RAM 8 GB – WIN10PRO 22H2 – H.D.250 GB - N. serie: ? N. prodotto: 3C248EA#ABZ - NON FUNZIONA SCHEDA DI RETE ETHERNET.', '2023-07-12', 'NON FUNZIONA LA SCHEDA LAN', 'disponibile', 1),
(12, 'HP-11', 3368, '5C-BA-EF-4B-EC-61', 'PC notebook HP 255 G7 - AMD Ryzen 5 3500U with Radeon Vega Mobile Gfx 2.10 GHz – RAM 8 GB – WIN10PRO 22H2 – H.D.250 GB - N. serie: ? N. prodotto: 3C248EA#ABZ', '2023-07-12', NULL, 'disponibile', 1),
(13, 'HP-12', 3366, '5C-BA-EF-4B-DA-D7', 'PC notebook HP 255 G7 - AMD Ryzen 5 3500U with Radeon Vega Mobile Gfx 2.10 GHz – RAM 8 GB – WIN10PRO 22H2 – H.D.250 GB - N. serie: ? N. prodotto: 3C248EA#ABZ', '2023-06-12', NULL, 'disponibile', 1),
(14, 'HP-2', 3242, '70-66-55-7A-C8-07', 'PC notebook HP 255 G7 - AMD Ryzen 3 3200U with Radeon Vega Mobile Gfx 2.60 GHz - RAM 8 GB – WIN10PRO 22H2 – H.D.250 GB - N. serie: ? - N. prodotto: 2D318EA', '2023-06-12', NULL, 'disponibile', 1),
(15, 'HP-7', 3364, '5C-BA-EF-4B-CF-0D', 'PC notebook HP 255 G7 - AMD Ryzen 5 3500U with Radeon Vega Mobile Gfx 2.10 GHz – RAM 8 GB – WIN10PRO 22H2 – H.D.250 GB - N. serie: ? N. prodotto: 3C248EA#ABZ', '2023-07-12', 'veyon da rivedere', 'disponibile', 1),
(16, 'ASUS-4', 3246, '9C-FC-E8-B0-84-BB', 'INTEL CORE I3-1005G1 - 1,20 GHZ - 8 GB RAM - H.D. 250 GB', '2023-05-12', NULL, 'disponibile', 1),
(17, 'ASUS-7', 3249, '9C-FC-E8-AF-80-61', 'INTEL CORE I3-1005G1 - 1,20 GHZ - 8 GB RAM - H.D. 250 GB', '2023-05-12', NULL, 'disponibile', 1),
(18, 'HP-13', 3361, '5C-BA-EF-4C-03-17', 'PC notebook HP 255 G7 - AMD Ryzen 5 3500U with Radeon Vega Mobile Gfx 2.10 GHz – RAM 8 GB – WIN10PRO 22H2 – H.D.250 GB - N. serie: ? N. prodotto: 3C248EA#ABZ', '2023-07-12', NULL, 'disponibile', 1),
(19, 'ASUS-3', 3245, '9C-FC-E8-AF-99-39', 'INTEL CORE I3-1005G1 - 1,20 GHZ - 8 GB RAM - H.D. 250 GB', '2023-05-12', NULL, 'disponibile', 1),
(20, 'HP-3', 3490, '90-E8-68-81-EB-A5', 'NUMERO PRODOTTO: HP 250 G8 Notebook PC – NUMERO DI SERIE: ? – COD. PRODOTTO: 3V5P1EA#ABZ - 11th Gen Intel(R) Core(TM) i5-1135G7 @ 2.40GHz - Windows 10 Pro Education 64 bit  Versione: 19045.2546 – 8 GB RAM – 500 GB H.D', '2023-06-12', NULL, 'disponibile', 1),
(21, 'ASUS-9', 3251, '9C-FC-E8-AF-98-85', 'INTEL CORE I3-1005G1 - 1,20 GHZ - 8 GB RAM - H.D. 250 GB', '2023-06-12', 'Lettera M della tastiera mancante', 'disponibile', 1),
(22, 'ASUS-8', 3250, '9C-FC-E8-AF-6C-57', 'INTEL CORE I3-1005G1 - 1,20 GHZ - 8 GB RAM - H.D. 250 GB', '2023-06-12', NULL, 'disponibile', 1),
(23, 'ASUS-6', 3248, '9C-FC-E8-AF-98-8F', 'INTEL CORE I3-1005G1 - 1,20 GHZ - 8 GB RAM - H.D. 250 GB', '2023-05-12', NULL, 'disponibile', 1),
(24, 'ASUS-2', 3244, '9C-FC-E8-AF-80-48', 'INTEL CORE I3-1005G1 - 1,20 GHZ - 8 GB RAM - H.D. 250 GB', '2023-06-12', NULL, 'disponibile', 1),
(25, 'ASUS-1', 3243, '9C-FC-E8-AF-A7-DF', 'INTEL CORE I3-1005G1 - 1,20 GHZ - 8 GB RAM - H.D. 250 GB', '2023-05-12', NULL, 'disponibile', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `ritiri`
--

CREATE TABLE `ritiri` (
  `id` int(11) NOT NULL,
  `ora_ritiro` time NOT NULL,
  `ora_consegna` time NOT NULL,
  `data` date NOT NULL,
  `pc` int(11) NOT NULL,
  `insegnante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cognome` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ruolo` varchar(50) NOT NULL,
  `id_login` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `armadi`
--
ALTER TABLE `armadi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aula` (`aula`);

--
-- Indici per le tabelle `aule`
--
ALTER TABLE `aule`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `pc`
--
ALTER TABLE `pc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `armadio` (`armadio`);

--
-- Indici per le tabelle `ritiri`
--
ALTER TABLE `ritiri`
  ADD PRIMARY KEY (`id`),
  ADD KEY `insegnante` (`insegnante`),
  ADD KEY `pc` (`pc`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_login` (`id_login`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `armadi`
--
ALTER TABLE `armadi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `aule`
--
ALTER TABLE `aule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `pc`
--
ALTER TABLE `pc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT per la tabella `ritiri`
--
ALTER TABLE `ritiri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `armadi`
--
ALTER TABLE `armadi`
  ADD CONSTRAINT `armadi_ibfk_1` FOREIGN KEY (`aula`) REFERENCES `aule` (`id`);

--
-- Limiti per la tabella `pc`
--
ALTER TABLE `pc`
  ADD CONSTRAINT `pc_ibfk_1` FOREIGN KEY (`armadio`) REFERENCES `armadi` (`id`);

--
-- Limiti per la tabella `ritiri`
--
ALTER TABLE `ritiri`
  ADD CONSTRAINT `ritiri_ibfk_1` FOREIGN KEY (`insegnante`) REFERENCES `utenti` (`id`),
  ADD CONSTRAINT `ritiri_ibfk_2` FOREIGN KEY (`pc`) REFERENCES `pc` (`id`);

--
-- Limiti per la tabella `utenti`
--
ALTER TABLE `utenti`
  ADD CONSTRAINT `utenti_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `login` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
