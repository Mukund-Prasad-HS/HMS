-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2023 at 08:14 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myhmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admintb`
--

CREATE TABLE `admintb` (
  `username` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admintb`
--

INSERT INTO `admintb` (`username`, `password`) VALUES
('firsthospitals', 'firstadmin');

-- --------------------------------------------------------

--
-- Table structure for table `appointmenttb`
--

CREATE TABLE `appointmenttb` (
  `pid` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `doctor` varchar(30) NOT NULL,
  `docFees` int(5) NOT NULL,
  `appdate` date NOT NULL,
  `apptime` time NOT NULL,
  `userStatus` int(5) NOT NULL,
  `doctorStatus` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `appointmenttb`
--

INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `apptime`, `userStatus`, `doctorStatus`) VALUES
(16, 22, 'Pratham', 'A', 'Male', 'pratham@gmail.com', '6456451212', 'Dr Shantaraj', 0, '2023-01-16', '14:00:00', 1, 1),
(17, 23, 'Pruthvi', 'S', 'Male', 'pruthvidemo@email.com', '6345456312', 'Dr Shantaraj', 0, '2023-01-19', '08:00:00', 1, 1),
(16, 24, 'Pratham', 'A', 'Male', 'pratham@gmail.com', '6456451212', 'Dr Man', 0, '2023-01-19', '10:00:00', 1, 1),
(19, 25, 'Preetham', 'A', 'Male', 'pretham@email.com', '5565626102', 'Dr Man', 0, '2023-01-20', '08:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `name` varchar(30) NOT NULL,
  `email` text NOT NULL,
  `contact` varchar(10) NOT NULL,
  `message` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`name`, `email`, `contact`, `message`) VALUES
('Preetham', 'preetham@gamil.com', '6362412451', 'Is there a holiday on 26th Jan?');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `new_fee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`new_fee`) VALUES
(475),
(713),
(1425),
(1900),
(1710);

-- --------------------------------------------------------

--
-- Table structure for table `doctb`
--

CREATE TABLE `doctb` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `spec` varchar(50) NOT NULL,
  `docFees` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctb`
--

INSERT INTO `doctb` (`username`, `password`, `email`, `spec`, `docFees`) VALUES
('Dr Shantaraj', 'shantarajfirst', 'shantaraj@firsthospitals.com', 'Pediatrician', 500),
('Dr Man', 'manfirst', 'man@firsthospitals.com', 'General', 750),
('Dr Ravikrishna', 'ravikrishnafirst', 'ravikrishna@firsthospitals.com', 'General', 1500),
('Dr Madhu', 'f444dd8638cdf678e9342408ac890bd8', 'drmadhu@firsthospitals.com', 'General', 2000),
('Dr Raj', '09709f35d663fe6edf4d47c8859c7c1e', 'drraj@firsthospital.com', 'Cardiologist', 1800);

--
-- Triggers `doctb`
--
DELIMITER $$
CREATE TRIGGER `discount` BEFORE INSERT ON `doctb` FOR EACH ROW INSERT INTO discount VALUES (NEW.docFees-(NEW.docFees*0.05))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `patreg`
--

CREATE TABLE `patreg` (
  `pid` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `cpassword` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `patreg`
--

INSERT INTO `patreg` (`pid`, `fname`, `lname`, `gender`, `email`, `contact`, `password`, `cpassword`) VALUES
(16, 'Pratham', 'A', 'Male', 'pratham@gmail.com', '6456451212', 'prathamdemo', 'prathamdemo'),
(17, 'Pruthvi', 'S', 'Male', 'pruthvidemo@email.com', '6345456312', 'pruthvidemo', 'pruthvidemo'),
(18, 'Shashwath', 'A', 'Male', 'shashwath@gmail.com', '7485124541', 'shashwathdemo', 'shashwathdemo'),
(19, 'Preetham', 'A', 'Male', 'pretham@email.com', '5565626102', 'mukund', 'mukund');

-- --------------------------------------------------------

--
-- Table structure for table `prestb`
--

CREATE TABLE `prestb` (
  `doctor` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `appdate` date NOT NULL,
  `apptime` time NOT NULL,
  `disease` varchar(250) NOT NULL,
  `allergy` varchar(250) NOT NULL,
  `prescription` varchar(1000) NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `prestb`
--

INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `apptime`, `disease`, `allergy`, `prescription`, `status`) VALUES
('Dr Shantaraj', 16, 22, 'Pratham', 'A', '2023-01-16', '14:00:00', 'Fever', 'High temperature', 'Dolo-650\r\n1-0-1', 0),
('Dr Shantaraj', 17, 23, 'Pruthvi', 'S', '2023-01-19', '08:00:00', 'Fever', 'High temp', 'Dolo 650', 0),
('Dr Man', 16, 24, 'Pratham', 'A', '2023-01-19', '10:00:00', 'Fracture', 'Sprain at T10', '1 month bed rest', 0),
('Dr Man', 19, 25, 'Preetham', 'A', '2023-01-20', '08:00:00', 'Fever', 'no allergies', 'Dolo\r\n', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointmenttb`
--
ALTER TABLE `appointmenttb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `patreg`
--
ALTER TABLE `patreg`
  ADD PRIMARY KEY (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointmenttb`
--
ALTER TABLE `appointmenttb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `patreg`
--
ALTER TABLE `patreg`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
