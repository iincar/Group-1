-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2018 at 04:47 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_id` varchar(10) NOT NULL,
  `location` varchar(50) NOT NULL,
  `cash_on_hand` double(12,0) NOT NULL,
  `cash_on_bank` double(12,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ci_rep`
--

CREATE TABLE `ci_rep` (
  `ci_rep_id` varchar(10) NOT NULL,
  `emp_id` varchar(10) NOT NULL,
  `client_id` varchar(10) NOT NULL,
  `approval` int(1) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `remarks` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` varchar(10) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `status_type` varchar(10) DEFAULT NULL,
  `branch_id` varchar(10) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `mid_name` varchar(20) DEFAULT NULL,
  `age` int(3) NOT NULL,
  `sex` varchar(6) NOT NULL,
  `con_no` varchar(11) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `civil_stat` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `collateral`
--

CREATE TABLE `collateral` (
  `loans_trans_no` varchar(10) NOT NULL,
  `amount` double(12,0) NOT NULL,
  `document` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

CREATE TABLE `collection` (
  `col_id` varchar(10) NOT NULL,
  `emp_id` varchar(10) NOT NULL,
  `amount` double(12,0) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comaker`
--

CREATE TABLE `comaker` (
  `client_id` varchar(10) DEFAULT NULL,
  `loans_trans_no` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` varchar(10) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `branch_id` varchar(10) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `mid_name` varchar(20) NOT NULL,
  `age` int(3) NOT NULL,
  `sex` varchar(6) NOT NULL,
  `con_no` varchar(11) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `civil_stat` varchar(10) NOT NULL,
  `position` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `exp_id` varchar(10) NOT NULL,
  `emp_id` varchar(10) NOT NULL,
  `exp_type_id` varchar(10) NOT NULL,
  `other_type_exp` varchar(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` double(12,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exp_type`
--

CREATE TABLE `exp_type` (
  `exp_type_id` varchar(10) NOT NULL,
  `exp_desc` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `income_no` varchar(10) NOT NULL,
  `client_id` varchar(10) DEFAULT NULL,
  `inc_type_id` varchar(10) DEFAULT NULL,
  `firm_name` varchar(30) NOT NULL,
  `firm_nature` varchar(20) NOT NULL,
  `position` varchar(20) NOT NULL,
  `firm_location` varchar(30) NOT NULL,
  `bus_per` blob,
  `bus_per_xp_dt` date DEFAULT NULL,
  `mo_income` double(12,0) NOT NULL,
  `yrly_income` double(12,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `income_type`
--

CREATE TABLE `income_type` (
  `inc_type_id` varchar(10) NOT NULL,
  `income_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interest`
--

CREATE TABLE `interest` (
  `int_rate_id` varchar(10) NOT NULL,
  `int_rate` double(12,0) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loan_trans`
--

CREATE TABLE `loan_trans` (
  `loan_trans_no` varchar(10) NOT NULL,
  `client_id` varchar(10) NOT NULL,
  `status_type_id` varchar(10) NOT NULL,
  `emp_id` varchar(10) NOT NULL,
  `int_rate_id` varchar(10) NOT NULL,
  `apv_date` date DEFAULT NULL,
  `date` date NOT NULL,
  `amount` double(12,0) NOT NULL,
  `mo_to_pay` int(2) NOT NULL,
  `balance` double(12,0) NOT NULL,
  `prom_note` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` varchar(10) NOT NULL,
  `loans_trans_no` varchar(10) NOT NULL,
  `emp_id` varchar(10) DEFAULT NULL,
  `client_id` varchar(10) DEFAULT NULL,
  `amount` double(12,0) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `released`
--

CREATE TABLE `released` (
  `rel_id` varchar(10) NOT NULL,
  `loan_trans_no` varchar(10) NOT NULL,
  `emp_id` varchar(10) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` double(12,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `req_docu`
--

CREATE TABLE `req_docu` (
  `client_id` varchar(10) DEFAULT NULL,
  `docu` blob NOT NULL,
  `exp_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status_type`
--

CREATE TABLE `status_type` (
  `status_type` varchar(10) NOT NULL,
  `status_desc` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trans_status_type`
--

CREATE TABLE `trans_status_type` (
  `status_type_id` varchar(10) NOT NULL,
  `trans_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_priv`
--

CREATE TABLE `user_priv` (
  `user_id` varchar(10) NOT NULL,
  `priv_type_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_priv_type`
--

CREATE TABLE `user_priv_type` (
  `priv_type_id` varchar(10) NOT NULL,
  `priv_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `ci_rep`
--
ALTER TABLE `ci_rep`
  ADD PRIMARY KEY (`ci_rep_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`col_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`exp_id`);

--
-- Indexes for table `exp_type`
--
ALTER TABLE `exp_type`
  ADD PRIMARY KEY (`exp_type_id`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`income_no`);

--
-- Indexes for table `income_type`
--
ALTER TABLE `income_type`
  ADD PRIMARY KEY (`inc_type_id`);

--
-- Indexes for table `interest`
--
ALTER TABLE `interest`
  ADD PRIMARY KEY (`int_rate_id`);

--
-- Indexes for table `loan_trans`
--
ALTER TABLE `loan_trans`
  ADD PRIMARY KEY (`loan_trans_no`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `released`
--
ALTER TABLE `released`
  ADD PRIMARY KEY (`rel_id`);

--
-- Indexes for table `status_type`
--
ALTER TABLE `status_type`
  ADD PRIMARY KEY (`status_type`);

--
-- Indexes for table `trans_status_type`
--
ALTER TABLE `trans_status_type`
  ADD PRIMARY KEY (`status_type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_priv_type`
--
ALTER TABLE `user_priv_type`
  ADD PRIMARY KEY (`priv_type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
