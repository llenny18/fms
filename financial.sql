-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2023 at 02:58 PM
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

--
-- Dumping data for table `admininfo`
--

INSERT INTO `admininfo` (`adminIID`, `adminIFullName`, `adminIAge`, `adminIAddress`, `adminIContact`, `adminIEmail`) VALUES
(1, 'Warren Balbin', 22, 'Tanauan Batangas', '09876635524', 'admin@email.com');

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

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`adminID`, `adminUsername`, `adminPassword`, `adminDisplayName`) VALUES
(1, 'admin1', 'admin1', 'Administrator 1');

-- --------------------------------------------------------

--
-- Stand-in structure for view `admin_view`
-- (See below for the actual view)
--
CREATE TABLE `admin_view` (
`adminIID` int(11)
,`adminIFullName` varchar(400)
,`adminIAge` int(11)
,`adminIAddress` varchar(400)
,`adminIContact` varchar(400)
,`adminIEmail` varchar(400)
,`adminID` int(11)
,`adminUsername` varchar(400)
,`adminPassword` varchar(400)
,`adminDisplayName` varchar(400)
);

-- --------------------------------------------------------

--
-- Table structure for table `cashflow`
--

CREATE TABLE `cashflow` (
  `cf_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `investment` decimal(15,2) NOT NULL,
  `cash_flow_type` enum('Operating','Investing','Financing') NOT NULL,
  `category` varchar(50) NOT NULL,
  `adminCreator` int(11) DEFAULT NULL,
  `tax_category` varchar(50) DEFAULT NULL,
  `notes` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `inc_ID` int(11) NOT NULL,
  `f_id` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cashflow`
--

INSERT INTO `cashflow` (`cf_id`, `description`, `investment`, `cash_flow_type`, `category`, `adminCreator`, `tax_category`, `notes`, `created_at`, `inc_ID`, `f_id`) VALUES
(1, 'Plywooods', 30000.00, 'Operating', 'WOods', 1, 'Sample', 'Sample', '2023-12-28 08:05:28', 1, 'G2F3JH1G2V3JH12'),
(2, 'Plywooods', 30000.00, 'Operating', 'WOods', 1, 'Sample', 'Sample', '2023-12-28 08:05:28', 1, 'G2F3JH1G2V3JH12');

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

--
-- Dumping data for table `clientaccounts`
--

INSERT INTO `clientaccounts` (`clientAID`, `clientAUsername`, `clientAPassword`, `clientAC_ID`, `adminVerified`) VALUES
(1, 'Client 1', 'Client 1', 1, 1);

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

--
-- Dumping data for table `clientorderslist`
--

INSERT INTO `clientorderslist` (`listID`, `listProjectID`, `listQuantity`, `listRequestID`) VALUES
(1, 1, 1, 1),
(2, 1, 34, 1);

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

--
-- Dumping data for table `clientrequests`
--

INSERT INTO `clientrequests` (`requestID`, `requestDescription`, `requestDate`, `requestTime`, `requestNote`, `requestClientID`, `requestStatusID`) VALUES
(1, 'Plywood', '2023-12-29', 2, 'Plywood', 1, 1);

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

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`clientID`, `clientFullName`, `clientContact`, `clientEmail`, `clientAddress`, `clientAge`) VALUES
(1, 'Client 1', '093667232112', 'client@email.com', 'Tanauan Batangas', 34);

-- --------------------------------------------------------

--
-- Stand-in structure for view `client_view`
-- (See below for the actual view)
--
CREATE TABLE `client_view` (
`clientID` int(11)
,`clientFullName` varchar(400)
,`clientContact` varchar(400)
,`clientEmail` varchar(400)
,`clientAddress` varchar(400)
,`clientAge` int(11)
,`clientAID` int(11)
,`clientAUsername` varchar(400)
,`clientAPassword` varchar(400)
,`clientAC_ID` int(11)
,`adminVerified` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `financial_infos`
-- (See below for the actual view)
--
CREATE TABLE `financial_infos` (
`is_id` int(11)
,`revenue` decimal(15,2)
,`cost_of_goods_sold` decimal(15,2)
,`operating_expenses` decimal(15,2)
,`other_expenses` decimal(15,2)
,`taxes` decimal(15,2)
,`createdBY` int(11)
,`fi_id` varchar(250)
,`cf_id` int(11)
,`description` varchar(255)
,`investment` decimal(15,2)
,`cash_flow_type` enum('Operating','Investing','Financing')
,`category` varchar(50)
,`adminCreator` int(11)
,`tax_category` varchar(50)
,`notes` varchar(50)
,`created_at` timestamp
,`inc_ID` int(11)
,`f_id` varchar(250)
);

-- --------------------------------------------------------

--
-- Table structure for table `financial_records`
--

CREATE TABLE `financial_records` (
  `f_id` int(11) NOT NULL,
  `f_transaction_date` date NOT NULL,
  `unique_id` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `financial_records`
--

INSERT INTO `financial_records` (`f_id`, `f_transaction_date`, `unique_id`) VALUES
(1, '2023-12-27', 'G2F3JH1G2V3JH12');

-- --------------------------------------------------------

--
-- Stand-in structure for view `financial_statements`
-- (See below for the actual view)
--
CREATE TABLE `financial_statements` (
);

-- --------------------------------------------------------

--
-- Table structure for table `income_statement`
--

CREATE TABLE `income_statement` (
  `is_id` int(11) NOT NULL,
  `revenue` decimal(15,2) DEFAULT NULL,
  `cost_of_goods_sold` decimal(15,2) DEFAULT NULL,
  `operating_expenses` decimal(15,2) DEFAULT NULL,
  `other_expenses` decimal(15,2) DEFAULT NULL,
  `taxes` decimal(15,2) DEFAULT NULL,
  `createdBY` int(11) NOT NULL,
  `fi_id` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `income_statement`
--

INSERT INTO `income_statement` (`is_id`, `revenue`, `cost_of_goods_sold`, `operating_expenses`, `other_expenses`, `taxes`, `createdBY`, `fi_id`) VALUES
(1, 400034.00, 23123.00, 4232.00, 7439.00, 2334.00, 1, 'G2F3JH1G2V3JH12'),
(2, 400034.00, 23123.00, 4232.00, 7439.00, 2334.00, 1, 'G2F3JH1G2V3JH12');

-- --------------------------------------------------------

--
-- Table structure for table `projectestimates`
--

CREATE TABLE `projectestimates` (
  `est_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `estimated_hours` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
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

--
-- Dumping data for table `projectprofits`
--

INSERT INTO `projectprofits` (`profitID`, `profitRate`, `profitTotalSold`, `profitProjectID`) VALUES
(1, 4, 4, 2),
(2, 5, 39, 1);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `projectID` int(11) NOT NULL,
  `projectName` varchar(250) NOT NULL,
  `projectDescription` varchar(250) NOT NULL,
  `projectPrice` double(12,2) NOT NULL,
  `createdBY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`projectID`, `projectName`, `projectDescription`, `projectPrice`, `createdBY`) VALUES
(1, 'Plywood', 'Plywood', 100.45, 1),
(2, 'Hammer', 'Hammer', 50.98, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `project_profits_view`
-- (See below for the actual view)
--
CREATE TABLE `project_profits_view` (
);

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `rateID` int(11) NOT NULL,
  `rateName` varchar(400) NOT NULL,
  `rateDescription` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`rateID`, `rateName`, `rateDescription`) VALUES
(1, 'Not good', 'Not good'),
(2, 'Good', 'Good'),
(3, 'Satisfying', 'Satisfying'),
(4, 'Profitable', 'Profitable'),
(5, 'Extra Profitable', 'Extra Profitable');

-- --------------------------------------------------------

--
-- Stand-in structure for view `request_and_orders`
-- (See below for the actual view)
--
CREATE TABLE `request_and_orders` (
`listID` int(11)
,`listProjectID` int(11)
,`listQuantity` int(11)
,`listRequestID` int(11)
,`requestID` int(11)
,`requestDescription` varchar(400)
,`requestDate` date
,`requestTime` int(11)
,`requestNote` varchar(400)
,`requestClientID` int(11)
,`requestStatusID` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `statusID` int(11) NOT NULL,
  `statusName` varchar(400) NOT NULL,
  `statusDescription` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`statusID`, `statusName`, `statusDescription`) VALUES
(1, 'Requested', 'Requested'),
(2, 'Approved', 'Approved'),
(3, 'Disapproved', 'Disapproved'),
(4, 'Finished', 'Finished');

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
-- Dumping data for table `times`
--

INSERT INTO `times` (`timeID`, `timeStart`, `timeEnd`) VALUES
(1, '07:00:00', '08:00:00'),
(2, '08:00:00', '09:00:00'),
(3, '09:00:00', '10:00:00'),
(4, '10:00:00', '11:00:00'),
(5, '11:00:00', '12:00:00'),
(6, '12:00:00', '13:00:00'),
(7, '13:00:00', '14:00:00'),
(8, '14:00:00', '15:00:00'),
(9, '15:00:00', '16:00:00'),
(10, '16:00:00', '17:00:00'),
(11, '17:00:00', '18:00:00'),
(12, '18:00:00', '19:00:00'),
(13, '19:00:00', '20:00:00');

-- --------------------------------------------------------

--
-- Structure for view `admin_view`
--
DROP TABLE IF EXISTS `admin_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `admin_view`  AS SELECT `admininfo`.`adminIID` AS `adminIID`, `admininfo`.`adminIFullName` AS `adminIFullName`, `admininfo`.`adminIAge` AS `adminIAge`, `admininfo`.`adminIAddress` AS `adminIAddress`, `admininfo`.`adminIContact` AS `adminIContact`, `admininfo`.`adminIEmail` AS `adminIEmail`, `admins`.`adminID` AS `adminID`, `admins`.`adminUsername` AS `adminUsername`, `admins`.`adminPassword` AS `adminPassword`, `admins`.`adminDisplayName` AS `adminDisplayName` FROM (`admininfo` join `admins` on(`admins`.`adminID` = `admininfo`.`adminIID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `client_view`
--
DROP TABLE IF EXISTS `client_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_view`  AS SELECT `clients`.`clientID` AS `clientID`, `clients`.`clientFullName` AS `clientFullName`, `clients`.`clientContact` AS `clientContact`, `clients`.`clientEmail` AS `clientEmail`, `clients`.`clientAddress` AS `clientAddress`, `clients`.`clientAge` AS `clientAge`, `clientaccounts`.`clientAID` AS `clientAID`, `clientaccounts`.`clientAUsername` AS `clientAUsername`, `clientaccounts`.`clientAPassword` AS `clientAPassword`, `clientaccounts`.`clientAC_ID` AS `clientAC_ID`, `clientaccounts`.`adminVerified` AS `adminVerified` FROM (`clients` join `clientaccounts` on(`clientaccounts`.`clientAC_ID` = `clients`.`clientID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `financial_infos`
--
DROP TABLE IF EXISTS `financial_infos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `financial_infos`  AS SELECT `income_statement`.`is_id` AS `is_id`, `income_statement`.`revenue` AS `revenue`, `income_statement`.`cost_of_goods_sold` AS `cost_of_goods_sold`, `income_statement`.`operating_expenses` AS `operating_expenses`, `income_statement`.`other_expenses` AS `other_expenses`, `income_statement`.`taxes` AS `taxes`, `income_statement`.`createdBY` AS `createdBY`, `income_statement`.`fi_id` AS `fi_id`, `cashflow`.`cf_id` AS `cf_id`, `cashflow`.`description` AS `description`, `cashflow`.`investment` AS `investment`, `cashflow`.`cash_flow_type` AS `cash_flow_type`, `cashflow`.`category` AS `category`, `cashflow`.`adminCreator` AS `adminCreator`, `cashflow`.`tax_category` AS `tax_category`, `cashflow`.`notes` AS `notes`, `cashflow`.`created_at` AS `created_at`, `cashflow`.`inc_ID` AS `inc_ID`, `cashflow`.`f_id` AS `f_id` FROM (`income_statement` join `cashflow` on(`cashflow`.`f_id` = `income_statement`.`fi_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `financial_statements`
--
DROP TABLE IF EXISTS `financial_statements`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `financial_statements`  AS SELECT `income_statement`.`is_id` AS `is_id`, `income_statement`.`transaction_date` AS `transaction_date`, `income_statement`.`revenue` AS `revenue`, `income_statement`.`cost_of_goods_sold` AS `cost_of_goods_sold`, `income_statement`.`operating_expenses` AS `operating_expenses`, `income_statement`.`taxes` AS `taxes`, `income_statement`.`other_expenses` AS `other_expenses`, `income_statement`.`revenue`- `income_statement`.`cost_of_goods_sold` AS `gross_profit`, `income_statement`.`revenue`- `income_statement`.`cost_of_goods_sold` - `income_statement`.`operating_expenses` - `income_statement`.`taxes` - `income_statement`.`other_expenses` AS `net_income`, `income_statement`.`createdBY` AS `createdBY` FROM `income_statement` ;

-- --------------------------------------------------------

--
-- Structure for view `project_profits_view`
--
DROP TABLE IF EXISTS `project_profits_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `project_profits_view`  AS SELECT `projectprofits`.`profitID` AS `profitID`, `projectprofits`.`profitRate` AS `profitRate`, `projectprofits`.`profitTotalSold` AS `profitTotalSold`, `projectprofits`.`profitProjectID` AS `profitProjectID`, `projects`.`projectID` AS `projectID`, `projects`.`projectName` AS `projectName`, `projects`.`projectDesription` AS `projectDesription`, `projects`.`projectPrice` AS `projectPrice`, `projects`.`createdBY` AS `createdBY`, `rates`.`rateID` AS `rateID`, `rates`.`rateName` AS `rateName`, `rates`.`rateDescription` AS `rateDescription`, `projects`.`projectPrice`* `projectprofits`.`profitTotalSold` AS `Total_price` FROM ((`projectprofits` join `projects` on(`projects`.`projectID` = `projectprofits`.`profitProjectID`)) join `rates` on(`rates`.`rateID` = `projectprofits`.`profitRate`)) ;

-- --------------------------------------------------------

--
-- Structure for view `request_and_orders`
--
DROP TABLE IF EXISTS `request_and_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `request_and_orders`  AS SELECT `clientorderslist`.`listID` AS `listID`, `clientorderslist`.`listProjectID` AS `listProjectID`, `clientorderslist`.`listQuantity` AS `listQuantity`, `clientorderslist`.`listRequestID` AS `listRequestID`, `clientrequests`.`requestID` AS `requestID`, `clientrequests`.`requestDescription` AS `requestDescription`, `clientrequests`.`requestDate` AS `requestDate`, `clientrequests`.`requestTime` AS `requestTime`, `clientrequests`.`requestNote` AS `requestNote`, `clientrequests`.`requestClientID` AS `requestClientID`, `clientrequests`.`requestStatusID` AS `requestStatusID` FROM (`clientorderslist` join `clientrequests` on(`clientrequests`.`requestID` = `clientorderslist`.`listRequestID`)) ;

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
-- Indexes for table `cashflow`
--
ALTER TABLE `cashflow`
  ADD PRIMARY KEY (`cf_id`),
  ADD KEY `incsed` (`inc_ID`),
  ADD KEY `ifd232` (`f_id`);

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
-- Indexes for table `financial_records`
--
ALTER TABLE `financial_records`
  ADD PRIMARY KEY (`f_id`),
  ADD UNIQUE KEY `unique_id` (`unique_id`);

--
-- Indexes for table `income_statement`
--
ALTER TABLE `income_statement`
  ADD PRIMARY KEY (`is_id`),
  ADD KEY `sdafsdfsd` (`createdBY`),
  ADD KEY `fids` (`fi_id`);

--
-- Indexes for table `projectestimates`
--
ALTER TABLE `projectestimates`
  ADD PRIMARY KEY (`est_id`),
  ADD KEY `cidd` (`client_id`),
  ADD KEY `projid` (`project_id`);

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
  MODIFY `adminIID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cashflow`
--
ALTER TABLE `cashflow`
  MODIFY `cf_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clientaccounts`
--
ALTER TABLE `clientaccounts`
  MODIFY `clientAID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `clientorderslist`
--
ALTER TABLE `clientorderslist`
  MODIFY `listID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clientrequests`
--
ALTER TABLE `clientrequests`
  MODIFY `requestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `clientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `financial_records`
--
ALTER TABLE `financial_records`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `income_statement`
--
ALTER TABLE `income_statement`
  MODIFY `is_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `projectestimates`
--
ALTER TABLE `projectestimates`
  MODIFY `est_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projectprofits`
--
ALTER TABLE `projectprofits`
  MODIFY `profitID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `projectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `rateID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `statusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `times`
--
ALTER TABLE `times`
  MODIFY `timeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `iud` FOREIGN KEY (`adminID`) REFERENCES `admininfo` (`adminIID`);

--
-- Constraints for table `cashflow`
--
ALTER TABLE `cashflow`
  ADD CONSTRAINT `adminid` FOREIGN KEY (`adminCreator`) REFERENCES `admins` (`adminID`),
  ADD CONSTRAINT `ifd232` FOREIGN KEY (`f_id`) REFERENCES `financial_records` (`unique_id`),
  ADD CONSTRAINT `incsed` FOREIGN KEY (`inc_ID`) REFERENCES `income_statement` (`is_id`);

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
-- Constraints for table `income_statement`
--
ALTER TABLE `income_statement`
  ADD CONSTRAINT `fids` FOREIGN KEY (`fi_id`) REFERENCES `financial_records` (`unique_id`),
  ADD CONSTRAINT `sdafsdfsd` FOREIGN KEY (`createdBY`) REFERENCES `admins` (`adminID`);

--
-- Constraints for table `projectestimates`
--
ALTER TABLE `projectestimates`
  ADD CONSTRAINT `cidd` FOREIGN KEY (`client_id`) REFERENCES `clients` (`clientID`),
  ADD CONSTRAINT `projid` FOREIGN KEY (`project_id`) REFERENCES `projects` (`projectID`);

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
