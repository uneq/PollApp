-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 10. Jul 2023 um 11:57
-- Server-Version: 10.4.28-MariaDB
-- PHP-Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `rassismusumfrage`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `answer_boolean`
--

CREATE TABLE `answer_boolean` (
  `BooleanAnswer_ID` int(11) NOT NULL,
  `Code_ID` int(11) NOT NULL,
  `BooleanQuestion_ID` int(11) NOT NULL,
  `Value` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `answer_dilemma`
--

CREATE TABLE `answer_dilemma` (
  `DilemmaAnswer_ID` int(11) NOT NULL,
  `Code_ID` int(11) NOT NULL,
  `DilemmaQuestion_ID` int(11) NOT NULL,
  `Value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `answer_scale`
--

CREATE TABLE `answer_scale` (
  `ScaleAnswer_ID` int(11) NOT NULL,
  `Code_ID` int(11) NOT NULL,
  `ScaleQuestion_ID` int(11) NOT NULL,
  `Value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `answer_text`
--

CREATE TABLE `answer_text` (
  `TextForm_ID` int(11) NOT NULL,
  `Code_ID` int(11) NOT NULL,
  `TextQuestion_ID` int(11) NOT NULL,
  `Value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `codes`
--

CREATE TABLE `codes` (
  `Code_ID` int(11) NOT NULL,
  `Code` varchar(25) NOT NULL,
  `Active` tinyint(1) NOT NULL,
  `Admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `codes`
--

INSERT INTO `codes` (`Code_ID`, `Code`, `Active`, `Admin`) VALUES
(1, 'ad$lpa', 0, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `definition`
--

CREATE TABLE `definition` (
  `Definition_ID` int(11) NOT NULL,
  `Caption` text NOT NULL,
  `Definition` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `definition`
--

INSERT INTO `definition` (`Definition_ID`, `Caption`, `Definition`) VALUES
(1, 'Diskriminierung', 'Wenn einzelne Menschen oder Gruppen von Menschen aufgrund bestimmter Merkmale benachteiligt werden, ist das Diskriminierung.\r\n\r\nZu solchen Merkmalen gehören zum Beispiel…\r\n\r\n…Religion, Hautfarbe, sexuelle Orientierung, ein bestimmtes Geschlecht, körperliches Merkmal oder eine gewisse (soziale) Herkunft (z.B. wenn man aus einer weniger wohlhabenden Familie kommt).'),
(2, 'Sexismus', 'Eine sexistische Aussage ist eine abwertende oder beleidigende Äußerung aufgrund des Geschlechts.'),
(3, 'Homophobie', 'Eine homophobe Aussage ist eine abwertende oder beleidigende Äußerung aufgrund einer sexuellen Orientierung.'),
(4, 'Transphobie', 'Eine transphobe Aussage ist eine abwertende oder beleidigende Äußerung gegenüber oder über Menschen, die sich nicht mit ihrem biologischen oder überhaupt mit einem Geschlecht identifizieren (z.B.: Ein Mensch, der biologisch als Mann geboren ist, sich aber selbst nicht als Mann fühlt).'),
(5, 'Rassismus', 'Eine rassistische Aussage ist eine abwertende oder beleidigende Äußerung aufgrund der Herkunft, der Hautfarbe, des Namens oder der Sprache einer anderen Person.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `question_boolean`
--

CREATE TABLE `question_boolean` (
  `BooleanQuestion_ID` int(11) NOT NULL,
  `Question` text NOT NULL,
  `Topic` text NOT NULL,
  `Definition_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `question_boolean`
--

INSERT INTO `question_boolean` (`BooleanQuestion_ID`, `Question`, `Topic`, `Definition_ID`) VALUES
(1, 'Hast du schon einmal trotz gleicher Leistungen eine andere schulische Bewertung bei Mitschüler*innen erlebt, die du auf eine Diskriminierung zurückführst?', 'Eigene Erfahrung', 1),
(2, 'Hast du schon einmal eine Diskriminierung bei anderen erfahren?', 'Eigene Erfahrung', 1),
(3, 'Hast du schon einmal eine Diskriminierung selbst erfahren?', 'Eigene Erfahrung', 1),
(4, 'Wurdest du schon einmal von einer Lehrkraft diskriminiert?', 'Eigene Erfahrung', 1),
(5, 'Hast du schon einmal die Diskriminierung eines/r Mitschüler*in durch eine Lehrkraft miterlebt?', 'Eigene Erfahrung', 1),
(6, 'Hast du schon einmal eine Aussage getätigt, von der dir später klar wurde, dass du damit jemanden diskriminiert hast?', 'Eigene Erfahrung', 1),
(7, 'Ich würde eine diskriminierende Bemerkung melden. ', 'Eigene Einschätzung\r\n', 1),
(8, 'Ich traue mich immer, einer Person zu sagen, dass ihr Verhalten diskriminierend war.', 'Eigene Einschätzung', 1),
(9, 'Ein Thementag am UvH zum Thema Diskriminierung halte ich für notwendig.', 'Eigene Einschätzung', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `question_dilemma`
--

CREATE TABLE `question_dilemma` (
  `Dilemma_ID` int(11) NOT NULL,
  `Question` text NOT NULL,
  `Options` text NOT NULL,
  `Topic` text NOT NULL,
  `Definition_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `question_dilemma`
--

INSERT INTO `question_dilemma` (`Dilemma_ID`, `Question`, `Options`, `Topic`, `Definition_ID`) VALUES
(1, 'In einer Runde von Freundinnen und/oder Freunden hörst du eine sexistische Äußerung.\r\n\r\nDu weißt, dass die Gruppe genervt wäre oder sich angegriffen fühlen würde, wenn du darauf hinweist.\r\n\r\nWie reagierst du?', '[\"Du nimmst das in Kauf und weist die Gruppe darauf hin, dass die Aussage diskriminierend war.\", \"Du sagst nichts und weil sich auch sonst niemand kritisch dazu äußert, wird das Gespräch einfach fortgeführt.\", \"Du sagst nichts und siehst auch kein Problem in dieser Situation.\"]', 'Dilemma', 2),
(2, 'In einer Runde von Freundinnen und/oder Freunden hörst du eine homophobe Äußerung. Du weißt, dass die Gruppe genervt wäre oder sich angegriffen fühlen würde, wenn du darauf hinweist. Wie reagierst du?', '[\"Du nimmst das in Kauf und weist die Gruppe darauf hin, dass die Aussage diskriminierend war.\", \"Du sagst nichts und weil sich auch sonst niemand kritisch dazu äußert, wird das Gespräch einfach fortgeführt.\", \"Du sagst nichts und siehst auch kein Problem in dieser Situation.\"]', 'Dilemma', 3),
(3, 'In einer Runde von Freundinnen und/oder Freunden hörst du eine transphobe Äußerung. Du weißt, dass die Gruppe genervt wäre oder sich angegriffen fühlen würde, wenn du darauf hinweist. Wie reagierst du?', '[\"Du nimmst das in Kauf und weist die Gruppe darauf hin, dass die Aussage diskriminierend war.\" ,\"Du sagst nichts und weil sich auch sonst niemand kritisch dazu äußert, wird das Gespräch einfach fortgeführt.\" ,\"Du sagst nichts und siehst auch kein Problem in dieser Situation.\"]', 'Dilemma', 4),
(4, 'In einer Runde von Freundinnen und/oder Freunden hörst du eine rassistische Äußerung. Du weißt, dass die Gruppe genervt wäre oder sich angegriffen fühlen würde, wenn du darauf hinweist. Wie reagierst du?', '[\"Du nimmst das in Kauf und weist die Gruppe darauf hin, dass die Aussage diskriminierend war.\", \"Du sagst nichts und weil sich auch sonst niemand kritisch dazu äußert, wird das Gespräch einfach fortgeführt.\", \"Du sagst nichts und siehst auch kein Problem in dieser Situation.\"]', 'Dilemma', 5),
(5, 'Eine Lehrkraft macht einen sexistischen Witz in der Klasse.\r\n\r\nWie reagierst du?', '[\"Du weist die Lehrkraft darauf hin, dass die Aussage diskriminierend/rassistisch war.\", \"Du sagst nichts und weil sich auch sonst niemand kritisch dazu äußert, wird der Unterricht fortgeführt.\", \"Du sagst nichts und siehst auch kein Problem in dieser Situation.\"]', 'Dilemma', 2),
(6, 'Eine Lehrkraft macht einen rassistischen Witz in der Klasse.\r\n\r\nWie reagierst du?', '[\"Du weist die Lehrkraft darauf hin, dass die Aussage diskriminierend/rassistisch war.\", \"Du sagst nichts und weil sich auch sonst niemand kritisch dazu äußert, wird der Unterricht fortgeführt.\", \"Du sagst nichts und siehst auch kein Problem in dieser Situation.\"]', 'Dilemma', 5),
(7, 'Der folgende Aspekt von Diskriminierung ist meiner Meinung nach das größte Problem am UvH.', '[\"Antisemitismus (Judenfeindlichkeit)\", \"Bodyshaming\", \"Rassismus\", \"Klassismus (Ausgrenzung aufgrund der finanziellen Verhältnisse)\", \"Homophobie\", \"Transphobie\", \"Sexismus\", \"Ableismus (Ausgrenzung von Menschen mit körperlicher und/oder geistiger Beeinträchtigung)\", \"Ausgrenzung aufgrund religiöser Bekenntnisse\", \"Glorifizierung der NS-Zeit\", \"Ich denke es gibt kein Problem mit Diskriminierung am UvH\", \"Andere (Kategorie nicht aufgeführt)\"]', 'Größtes Problem', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `question_scale`
--

CREATE TABLE `question_scale` (
  `ScaleQuestion_ID` int(11) NOT NULL,
  `Question` text NOT NULL,
  `Options` text NOT NULL,
  `Topic` text NOT NULL,
  `Definition_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `question_scale`
--

INSERT INTO `question_scale` (`ScaleQuestion_ID`, `Question`, `Options`, `Topic`, `Definition_ID`) VALUES
(1, 'Diskriminierung ist am UvH ein Problem.', '[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"]', 'Positionierung | 0 = die Aussage trifft überhaupt nicht zu, 9 = die Aussage trifft vollständig zu  ', 1),
(2, 'Am UvH sollte es mehr Aufklärung über Diskriminierung geben?', '[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"]', 'Positionierung | 0 = die Aussage trifft überhaupt nicht zu, 9 = die Aussage trifft vollständig zu  ', 1),
(3, 'Die Folgen von Diskriminierung (z.B. psychisch) sind den Schüler*innen bekannt?', '[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"]', 'Positionierung | 0 = die Aussage trifft überhaupt nicht zu, 9 = die Aussage trifft vollständig zu  ', 1),
(4, 'Die Schüler*innen wissen, was alles diskriminierend wirken kann?', '[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"]', 'Positionierung | 0 = die Aussage trifft überhaupt nicht zu, 9 = die Aussage trifft vollständig zu  ', 1),
(5, 'Wenn ich einen Fall von Diskriminierung mitbekomme, schreite ich sofort selbst verbal (=mit Worten) ein.', '[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"]', 'Positionierung | 0 = die Aussage trifft überhaupt nicht zu, 9 = die Aussage trifft vollständig zu  ', 1),
(6, 'Wenn ich einen Fall von Diskriminierung mitbekomme, informiere ich auf jeden Fall eine Lehrkraft.', '[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"]', 'Positionierung | 0 = die Aussage trifft überhaupt nicht zu, 9 = die Aussage trifft vollständig zu  ', 1),
(7, 'Am UvH setzen sich genügend Schüler*innen gegen Diskriminierung ein.', '[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"]', 'Positionierung | 0 = die Aussage trifft überhaupt nicht zu, 9 = die Aussage trifft vollständig zu  ', 1),
(8, 'Am UvH setzen sich genügend Lehrkräfte gegen Diskriminierung ein.', '[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"]', 'Positionierung | 0 = die Aussage trifft überhaupt nicht zu, 9 = die Aussage trifft vollständig zu  ', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `question_text`
--

CREATE TABLE `question_text` (
  `TextQuestion_ID` int(11) NOT NULL,
  `Question` text NOT NULL,
  `Topic` text NOT NULL,
  `Definition_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `question_text`
--

INSERT INTO `question_text` (`TextQuestion_ID`, `Question`, `Topic`, `Definition_ID`) VALUES
(1, 'Folgendes möchte ich noch loswerden:', 'Eigene Einschätzung', NULL);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `answer_boolean`
--
ALTER TABLE `answer_boolean`
  ADD PRIMARY KEY (`BooleanAnswer_ID`),
  ADD KEY `FS_C_Bol` (`Code_ID`),
  ADD KEY `FS_F_Bol` (`BooleanQuestion_ID`);

--
-- Indizes für die Tabelle `answer_dilemma`
--
ALTER TABLE `answer_dilemma`
  ADD PRIMARY KEY (`DilemmaAnswer_ID`),
  ADD KEY `FS_Code_Value` (`Code_ID`),
  ADD KEY `FS_Question_Value` (`DilemmaQuestion_ID`);

--
-- Indizes für die Tabelle `answer_scale`
--
ALTER TABLE `answer_scale`
  ADD PRIMARY KEY (`ScaleAnswer_ID`),
  ADD KEY `FS_C_Int` (`Code_ID`),
  ADD KEY `FS_F_Int` (`ScaleQuestion_ID`);

--
-- Indizes für die Tabelle `answer_text`
--
ALTER TABLE `answer_text`
  ADD PRIMARY KEY (`TextForm_ID`),
  ADD KEY `FS_C_Text` (`Code_ID`),
  ADD KEY `FS_F_Text` (`TextQuestion_ID`);

--
-- Indizes für die Tabelle `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`Code_ID`);

--
-- Indizes für die Tabelle `definition`
--
ALTER TABLE `definition`
  ADD PRIMARY KEY (`Definition_ID`);

--
-- Indizes für die Tabelle `question_boolean`
--
ALTER TABLE `question_boolean`
  ADD PRIMARY KEY (`BooleanQuestion_ID`),
  ADD KEY `FS_Definition_BQ` (`Definition_ID`);

--
-- Indizes für die Tabelle `question_dilemma`
--
ALTER TABLE `question_dilemma`
  ADD PRIMARY KEY (`Dilemma_ID`),
  ADD KEY `FS_Definition` (`Definition_ID`);

--
-- Indizes für die Tabelle `question_scale`
--
ALTER TABLE `question_scale`
  ADD PRIMARY KEY (`ScaleQuestion_ID`),
  ADD KEY `FS_Definition_SQ` (`Definition_ID`);

--
-- Indizes für die Tabelle `question_text`
--
ALTER TABLE `question_text`
  ADD PRIMARY KEY (`TextQuestion_ID`),
  ADD KEY `FS_Definition_TQ` (`Definition_ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `answer_boolean`
--
ALTER TABLE `answer_boolean`
  MODIFY `BooleanAnswer_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `answer_dilemma`
--
ALTER TABLE `answer_dilemma`
  MODIFY `DilemmaAnswer_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `answer_scale`
--
ALTER TABLE `answer_scale`
  MODIFY `ScaleAnswer_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `answer_text`
--
ALTER TABLE `answer_text`
  MODIFY `TextForm_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `codes`
--
ALTER TABLE `codes`
  MODIFY `Code_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT für Tabelle `definition`
--
ALTER TABLE `definition`
  MODIFY `Definition_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `question_boolean`
--
ALTER TABLE `question_boolean`
  MODIFY `BooleanQuestion_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `question_dilemma`
--
ALTER TABLE `question_dilemma`
  MODIFY `Dilemma_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `question_scale`
--
ALTER TABLE `question_scale`
  MODIFY `ScaleQuestion_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `question_text`
--
ALTER TABLE `question_text`
  MODIFY `TextQuestion_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `answer_boolean`
--
ALTER TABLE `answer_boolean`
  ADD CONSTRAINT `FS_Code_Boolean` FOREIGN KEY (`Code_ID`) REFERENCES `codes` (`Code_ID`),
  ADD CONSTRAINT `FS_Question_Boolean` FOREIGN KEY (`BooleanQuestion_ID`) REFERENCES `question_boolean` (`BooleanQuestion_ID`);

--
-- Constraints der Tabelle `answer_dilemma`
--
ALTER TABLE `answer_dilemma`
  ADD CONSTRAINT `FS_Code_Dilemma` FOREIGN KEY (`Code_ID`) REFERENCES `codes` (`Code_ID`),
  ADD CONSTRAINT `FS_Question_Dilemma` FOREIGN KEY (`DilemmaQuestion_ID`) REFERENCES `question_dilemma` (`Dilemma_ID`);

--
-- Constraints der Tabelle `answer_scale`
--
ALTER TABLE `answer_scale`
  ADD CONSTRAINT `FS_Code_Scale` FOREIGN KEY (`Code_ID`) REFERENCES `codes` (`Code_ID`),
  ADD CONSTRAINT `FS_Question_Scale` FOREIGN KEY (`ScaleQuestion_ID`) REFERENCES `question_scale` (`ScaleQuestion_ID`);

--
-- Constraints der Tabelle `answer_text`
--
ALTER TABLE `answer_text`
  ADD CONSTRAINT `FS_Code_Text` FOREIGN KEY (`Code_ID`) REFERENCES `codes` (`Code_ID`),
  ADD CONSTRAINT `FS_Question_Text` FOREIGN KEY (`TextQuestion_ID`) REFERENCES `question_text` (`TextQuestion_ID`);

--
-- Constraints der Tabelle `question_boolean`
--
ALTER TABLE `question_boolean`
  ADD CONSTRAINT `FS_Definition_BQ` FOREIGN KEY (`Definition_ID`) REFERENCES `definition` (`Definition_ID`);

--
-- Constraints der Tabelle `question_dilemma`
--
ALTER TABLE `question_dilemma`
  ADD CONSTRAINT `FS_Definition` FOREIGN KEY (`Definition_ID`) REFERENCES `definition` (`Definition_ID`);

--
-- Constraints der Tabelle `question_scale`
--
ALTER TABLE `question_scale`
  ADD CONSTRAINT `FS_Definition_SQ` FOREIGN KEY (`Definition_ID`) REFERENCES `definition` (`Definition_ID`);

--
-- Constraints der Tabelle `question_text`
--
ALTER TABLE `question_text`
  ADD CONSTRAINT `FS_Definition_TQ` FOREIGN KEY (`Definition_ID`) REFERENCES `definition` (`Definition_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
