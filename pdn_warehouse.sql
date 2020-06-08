-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2020 at 04:03 PM
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
-- Database: `pdn_warehouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `sm_buyer`
--

CREATE TABLE `sm_buyer` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sm_employee`
--

CREATE TABLE `sm_employee` (
  `id` bigint(20) NOT NULL,
  `age` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sm_employee_warehouses`
--

CREATE TABLE `sm_employee_warehouses` (
  `employee_id` bigint(20) NOT NULL,
  `warehouses_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sm_order`
--

CREATE TABLE `sm_order` (
  `id` bigint(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `delivery_status` varchar(255) DEFAULT NULL,
  `late_delivery_status` varchar(255) DEFAULT NULL,
  `order_type` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `buyer_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sm_order_products`
--

CREATE TABLE `sm_order_products` (
  `order_id` bigint(20) NOT NULL,
  `products_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sm_product`
--

CREATE TABLE `sm_product` (
  `id` bigint(20) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `store_date` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sm_product_suppliers`
--

CREATE TABLE `sm_product_suppliers` (
  `product_id` bigint(20) NOT NULL,
  `suppliers_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sm_product_warehouses`
--

CREATE TABLE `sm_product_warehouses` (
  `product_id` bigint(20) NOT NULL,
  `warehouses_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sm_rack`
--

CREATE TABLE `sm_rack` (
  `id` bigint(20) NOT NULL,
  `row_number` int(11) DEFAULT NULL,
  `section_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sm_section`
--

CREATE TABLE `sm_section` (
  `id` bigint(20) NOT NULL,
  `coordinates` varchar(255) DEFAULT NULL,
  `warehouse_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sm_supplier`
--

CREATE TABLE `sm_supplier` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sm_warehouse`
--

CREATE TABLE `sm_warehouse` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `coordinates` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sm_buyer`
--
ALTER TABLE `sm_buyer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sm_employee`
--
ALTER TABLE `sm_employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sm_employee_warehouses`
--
ALTER TABLE `sm_employee_warehouses`
  ADD KEY `FK7plm9oncvrtvq3hymg1fhysux` (`warehouses_id`),
  ADD KEY `FKmb6wcjv7hx00ldvayl0ljpbu3` (`employee_id`);

--
-- Indexes for table `sm_order`
--
ALTER TABLE `sm_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3yxat48q4ve0v4jhc5glh7bep` (`buyer_id`);

--
-- Indexes for table `sm_order_products`
--
ALTER TABLE `sm_order_products`
  ADD KEY `FKeyp29ys36k4jgspmaymu4e24k` (`products_id`),
  ADD KEY `FKarl5vndc6mb64j1dka6tesb7` (`order_id`);

--
-- Indexes for table `sm_product`
--
ALTER TABLE `sm_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sm_product_suppliers`
--
ALTER TABLE `sm_product_suppliers`
  ADD KEY `FK6pc5fxka7l52mx7u9ky1o6bsa` (`suppliers_id`),
  ADD KEY `FKlfx4ochxtjlcsb2urnvasco7q` (`product_id`);

--
-- Indexes for table `sm_product_warehouses`
--
ALTER TABLE `sm_product_warehouses`
  ADD KEY `FK97uw2ombktfmcun36x9xqkfs1` (`warehouses_id`),
  ADD KEY `FKh7iqdqxx2dj1p06jl14pgh7a2` (`product_id`);

--
-- Indexes for table `sm_rack`
--
ALTER TABLE `sm_rack`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkpbgax19x3m2mvul7ooixo06b` (`section_id`);

--
-- Indexes for table `sm_section`
--
ALTER TABLE `sm_section`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKotm4c8pvahi92avsu0d5omudy` (`warehouse_id`);

--
-- Indexes for table `sm_supplier`
--
ALTER TABLE `sm_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sm_warehouse`
--
ALTER TABLE `sm_warehouse`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sm_buyer`
--
ALTER TABLE `sm_buyer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sm_employee`
--
ALTER TABLE `sm_employee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sm_order`
--
ALTER TABLE `sm_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sm_product`
--
ALTER TABLE `sm_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sm_rack`
--
ALTER TABLE `sm_rack`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sm_section`
--
ALTER TABLE `sm_section`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sm_supplier`
--
ALTER TABLE `sm_supplier`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sm_warehouse`
--
ALTER TABLE `sm_warehouse`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sm_employee_warehouses`
--
ALTER TABLE `sm_employee_warehouses`
  ADD CONSTRAINT `FK7plm9oncvrtvq3hymg1fhysux` FOREIGN KEY (`warehouses_id`) REFERENCES `sm_warehouse` (`id`),
  ADD CONSTRAINT `FKmb6wcjv7hx00ldvayl0ljpbu3` FOREIGN KEY (`employee_id`) REFERENCES `sm_employee` (`id`);

--
-- Constraints for table `sm_order`
--
ALTER TABLE `sm_order`
  ADD CONSTRAINT `FK3yxat48q4ve0v4jhc5glh7bep` FOREIGN KEY (`buyer_id`) REFERENCES `sm_buyer` (`id`);

--
-- Constraints for table `sm_order_products`
--
ALTER TABLE `sm_order_products`
  ADD CONSTRAINT `FKarl5vndc6mb64j1dka6tesb7` FOREIGN KEY (`order_id`) REFERENCES `sm_order` (`id`),
  ADD CONSTRAINT `FKeyp29ys36k4jgspmaymu4e24k` FOREIGN KEY (`products_id`) REFERENCES `sm_product` (`id`);

--
-- Constraints for table `sm_product_suppliers`
--
ALTER TABLE `sm_product_suppliers`
  ADD CONSTRAINT `FK6pc5fxka7l52mx7u9ky1o6bsa` FOREIGN KEY (`suppliers_id`) REFERENCES `sm_supplier` (`id`),
  ADD CONSTRAINT `FKlfx4ochxtjlcsb2urnvasco7q` FOREIGN KEY (`product_id`) REFERENCES `sm_product` (`id`);

--
-- Constraints for table `sm_product_warehouses`
--
ALTER TABLE `sm_product_warehouses`
  ADD CONSTRAINT `FK97uw2ombktfmcun36x9xqkfs1` FOREIGN KEY (`warehouses_id`) REFERENCES `sm_warehouse` (`id`),
  ADD CONSTRAINT `FKh7iqdqxx2dj1p06jl14pgh7a2` FOREIGN KEY (`product_id`) REFERENCES `sm_product` (`id`);

--
-- Constraints for table `sm_rack`
--
ALTER TABLE `sm_rack`
  ADD CONSTRAINT `FKkpbgax19x3m2mvul7ooixo06b` FOREIGN KEY (`section_id`) REFERENCES `sm_section` (`id`);

--
-- Constraints for table `sm_section`
--
ALTER TABLE `sm_section`
  ADD CONSTRAINT `FKotm4c8pvahi92avsu0d5omudy` FOREIGN KEY (`warehouse_id`) REFERENCES `sm_warehouse` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
