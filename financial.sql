-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2023 at 05:33 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `financial`
--

-- --------------------------------------------------------

--
-- Table structure for table `admininfo`
--

CREATE TABLE `admininfo` (
  `adminIID` int(11) NOT NULL,
  `adminIFullName` varchar(400) NOT NULL,
  `adminIAge` int(11) NOT NULL,
  `adminIAddress` varchar(400) NOT NULL,
  `adminIContact` varchar(400) NOT NULL,
  `adminIEmail` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `adminID` int(11) NOT NULL,
  `adminUsername` varchar(400) NOT NULL,
  `adminPassword` varchar(400) NOT NULL,
  `adminDisplayName` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clientaccounts`
--

CREATE TABLE `clientaccounts` (
  `clientAID` int(11) NOT NULL,
  `clientAUsername` varchar(400) NOT NULL,
  `clientAPassword` varchar(400) NOT NULL,
  `clientAC_ID` int(11) NOT NULL,
  `adminVerified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clientorderslist`
--

CREATE TABLE `clientorderslist` (
  `listID` int(11) NOT NULL,
  `listProjectID` int(11) NOT NULL,
  `listQuantity` int(11) NOT NULL,
  `listRequestID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clientrequests`
--

CREATE TABLE `clientrequests` (
  `requestID` int(11) NOT NULL,
  `requestDescription` varchar(400) NOT NULL,
  `requestDate` date NOT NULL,
  `requestTime` int(11) NOT NULL,
  `requestNote` varchar(400) NOT NULL,
  `requestClientID` int(11) NOT NULL,
  `requestStatusID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `clientID` int(11) NOT NULL,
  `clientFullName` varchar(400) NOT NULL,
  `clientContact` varchar(400) NOT NULL,
  `clientEmail` varchar(400) NOT NULL,
  `clientAddress` varchar(400) NOT NULL,
  `clientAge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projectprofits`
--

CREATE TABLE `projectprofits` (
  `profitID` int(11) NOT NULL,
  `profitRate` int(11) NOT NULL,
  `profitTotalSold` int(11) NOT NULL,
  `profitProjectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `projectID` int(11) NOT NULL,
  `projectName` int(11) NOT NULL,
  `projectDesription` int(11) NOT NULL,
  `projectPrice` double(12,2) NOT NULL,
  `createdBY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `rateID` int(11) NOT NULL,
  `rateName` varchar(400) NOT NULL,
  `rateDescription` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `statusID` int(11) NOT NULL,
  `statusName` varchar(400) NOT NULL,
  `statusDescription` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `times`
--

CREATE TABLE `times` (
  `timeID` int(11) NOT NULL,
  `timeStart` time NOT NULL,
  `timeEnd` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admininfo`
--
ALTER TABLE `admininfo`
  ADD PRIMARY KEY (`adminIID`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`adminID`);

--
-- Indexes for table `clientaccounts`
--
ALTER TABLE `clientaccounts`
  ADD PRIMARY KEY (`clientAID`),
  ADD KEY `item` (`clientAC_ID`),
  ADD KEY `admin` (`adminVerified`);

--
-- Indexes for table `clientorderslist`
--
ALTER TABLE `clientorderslist`
  ADD PRIMARY KEY (`listID`),
  ADD KEY `iuds` (`listRequestID`);

--
-- Indexes for table `clientrequests`
--
ALTER TABLE `clientrequests`
  ADD PRIMARY KEY (`requestID`),
  ADD KEY `stats` (`requestStatusID`),
  ADD KEY `cid` (`requestClientID`),
  ADD KEY `timez` (`requestTime`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`clientID`);

--
-- Indexes for table `projectprofits`
--
ALTER TABLE `projectprofits`
  ADD PRIMARY KEY (`profitID`),
  ADD KEY `proj` (`profitProjectID`),
  ADD KEY `rate` (`profitRate`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`projectID`),
  ADD KEY `admins121` (`createdBY`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`rateID`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`statusID`);

--
-- Indexes for table `times`
--
ALTER TABLE `times`
  ADD PRIMARY KEY (`timeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admininfo`
--
ALTER TABLE `admininfo`
  MODIFY `adminIID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clientaccounts`
--
ALTER TABLE `clientaccounts`
  MODIFY `clientAID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clientorderslist`
--
ALTER TABLE `clientorderslist`
  MODIFY `listID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clientrequests`
--
ALTER TABLE `clientrequests`
  MODIFY `requestID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `clientID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projectprofits`
--
ALTER TABLE `projectprofits`
  MODIFY `profitID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `projectID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `rateID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `statusID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `times`
--
ALTER TABLE `times`
  MODIFY `timeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `iud` FOREIGN KEY (`adminID`) REFERENCES `admininfo` (`adminIID`);

--
-- Constraints for table `clientaccounts`
--
ALTER TABLE `clientaccounts`
  ADD CONSTRAINT `admin` FOREIGN KEY (`adminVerified`) REFERENCES `admins` (`adminID`),
  ADD CONSTRAINT `item` FOREIGN KEY (`clientAC_ID`) REFERENCES `clients` (`clientID`);

--
-- Constraints for table `clientorderslist`
--
ALTER TABLE `clientorderslist`
  ADD CONSTRAINT `iuds` FOREIGN KEY (`listRequestID`) REFERENCES `clientrequests` (`requestID`);

--
-- Constraints for table `clientrequests`
--
ALTER TABLE `clientrequests`
  ADD CONSTRAINT `cid` FOREIGN KEY (`requestClientID`) REFERENCES `clients` (`clientID`),
  ADD CONSTRAINT `stats` FOREIGN KEY (`requestStatusID`) REFERENCES `status` (`statusID`),
  ADD CONSTRAINT `timez` FOREIGN KEY (`requestTime`) REFERENCES `times` (`timeID`);

--
-- Constraints for table `projectprofits`
--
ALTER TABLE `projectprofits`
  ADD CONSTRAINT `proj` FOREIGN KEY (`profitProjectID`) REFERENCES `projects` (`projectID`),
  ADD CONSTRAINT `rate` FOREIGN KEY (`profitRate`) REFERENCES `rates` (`rateID`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `admins121` FOREIGN KEY (`createdBY`) REFERENCES `admins` (`adminID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
