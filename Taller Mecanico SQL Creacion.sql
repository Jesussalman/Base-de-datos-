-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2024 at 12:46 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taller_mecanico`
--

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `ID_Cliente` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Correo_Electronico` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `ID_Empleado` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Correo_Electronico` varchar(50) NOT NULL,
  `Cargo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `factura`
--

CREATE TABLE `factura` (
  `ID_Factura` int(11) NOT NULL,
  `ID_Cliente` int(11) NOT NULL,
  `ID_Servicio` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Monto` decimal(10,2) NOT NULL,
  `Impuestos` decimal(5,2) NOT NULL,
  `Metodo_Pago` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `horas_servicio`
--

CREATE TABLE `horas_servicio` (
  `ID_Horario` int(11) NOT NULL,
  `ID_Empleado` int(11) NOT NULL,
  `ID_Servicio` int(11) NOT NULL,
  `ID_Vehiculo` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora_Inicio` time NOT NULL,
  `Hora_Fin` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `repuesto`
--

CREATE TABLE `repuesto` (
  `ID_Repuesto` int(11) NOT NULL,
  `Codigo` varchar(20) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `servicio`
--

CREATE TABLE `servicio` (
  `ID_Servicio` int(11) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehiculo`
--

CREATE TABLE `vehiculo` (
  `ID_Vehiculo` int(11) NOT NULL,
  `Placa` varchar(20) NOT NULL,
  `Marca` varchar(50) NOT NULL,
  `Modelo` varchar(50) NOT NULL,
  `Año` int(11) NOT NULL,
  `Color` varchar(50) NOT NULL,
  `ID_Cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`ID_Empleado`);

--
-- Indexes for table `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`ID_Factura`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_Servicio` (`ID_Servicio`);

--
-- Indexes for table `horas_servicio`
--
ALTER TABLE `horas_servicio`
  ADD PRIMARY KEY (`ID_Horario`),
  ADD KEY `ID_Empleado` (`ID_Empleado`),
  ADD KEY `ID_Servicio` (`ID_Servicio`),
  ADD KEY `ID_Vehiculo` (`ID_Vehiculo`);

--
-- Indexes for table `repuesto`
--
ALTER TABLE `repuesto`
  ADD PRIMARY KEY (`ID_Repuesto`),
  ADD UNIQUE KEY `Codigo` (`Codigo`);

--
-- Indexes for table `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`ID_Servicio`);

--
-- Indexes for table `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`ID_Vehiculo`),
  ADD UNIQUE KEY `Placa` (`Placa`),
  ADD KEY `ID_Cliente` (`ID_Cliente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `empleado`
--
ALTER TABLE `empleado`
  MODIFY `ID_Empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `factura`
--
ALTER TABLE `factura`
  MODIFY `ID_Factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `horas_servicio`
--
ALTER TABLE `horas_servicio`
  MODIFY `ID_Horario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `repuesto`
--
ALTER TABLE `repuesto`
  MODIFY `ID_Repuesto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `servicio`
--
ALTER TABLE `servicio`
  MODIFY `ID_Servicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `ID_Vehiculo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`ID_Servicio`) REFERENCES `servicio` (`ID_Servicio`);

--
-- Constraints for table `horas_servicio`
--
ALTER TABLE `horas_servicio`
  ADD CONSTRAINT `horas_servicio_ibfk_1` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`),
  ADD CONSTRAINT `horas_servicio_ibfk_2` FOREIGN KEY (`ID_Servicio`) REFERENCES `servicio` (`ID_Servicio`),
  ADD CONSTRAINT `horas_servicio_ibfk_3` FOREIGN KEY (`ID_Vehiculo`) REFERENCES `vehiculo` (`ID_Vehiculo`);

--
-- Constraints for table `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
