-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 22-05-2021 a las 14:43:53
-- Versión del servidor: 8.0.21
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gimnasio_fss`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

DROP TABLE IF EXISTS `administrador`;
CREATE TABLE IF NOT EXISTS `administrador` (
  `Doc_identidad` int NOT NULL,
  `Tipo_doc` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `Nombres` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `Apellidos` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `Tel_contacto` varchar(7) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Cel_contacto` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `Email` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`Doc_identidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `Doc_identidad` int NOT NULL,
  `Tipo_doc` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `Nombres` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `Apellidos` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `Tel_contacto` varchar(7) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Cel_contacto` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `Email` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`Doc_identidad`,`Tipo_doc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Doc_identidad`, `Tipo_doc`, `Nombres`, `Apellidos`, `Tel_contacto`, `Cel_contacto`, `Email`) VALUES
(52765974, 'CC', 'Jennie', 'Gonzalez', '7235481', '3142564012', 'jennie@gmail.com'),
(58714915, 'CC', 'Carlos Javier', 'Lopez', '3542438', '3142551006', 'carloslopez@gmail.com'),
(85412359, 'CC', 'María', 'Sanchez', '', '3204887156', 'mariasanchez@gmail.com'),
(96784126, 'CC', 'Johana', 'Perez', NULL, '3135497152', 'johanaperez@gmail.com'),
(104578665, 'CC', 'Irene', 'Rodriguez', '', '3134568241', 'irene@gmail.com'),
(1004686774, 'TI', 'Wendy', 'Velvet', '3542470', '3134001547', 'wendy@gmail.com'),
(1007646008, 'CC', 'Lisa', 'Manoban', '3542438', '3142551006', 'lalisa@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_has_entrenador`
--

DROP TABLE IF EXISTS `cliente_has_entrenador`;
CREATE TABLE IF NOT EXISTS `cliente_has_entrenador` (
  `CLIENTE_Doc_identidad` int NOT NULL,
  `ENTRENADOR_Doc_identidad` int NOT NULL,
  PRIMARY KEY (`CLIENTE_Doc_identidad`,`ENTRENADOR_Doc_identidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenador`
--

DROP TABLE IF EXISTS `entrenador`;
CREATE TABLE IF NOT EXISTS `entrenador` (
  `Doc_identidad` int NOT NULL,
  `Tipo_doc` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `Nombres` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `Apellidos` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `Tel_contacto` varchar(7) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Cel_contacto` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `Email` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`Doc_identidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `entrenador`
--

INSERT INTO `entrenador` (`Doc_identidad`, `Tipo_doc`, `Nombres`, `Apellidos`, `Tel_contacto`, `Cel_contacto`, `Email`) VALUES
(63487518, 'CC', 'Luis', 'Martinez', '2418759', '3204887156', 'luismartinez@gmail.com'),
(94321657, 'CC', 'Alexander', 'Gomez', '5487961', '3215487574', 'alexandergomez@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

DROP TABLE IF EXISTS `gastos`;
CREATE TABLE IF NOT EXISTS `gastos` (
  `Cod_gasto` int NOT NULL,
  `Fecha_gasto` date NOT NULL,
  `Valor_gasto` varchar(7) COLLATE utf8_spanish2_ci NOT NULL,
  `Tipo_gasto` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `Descrip_gasto` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `ADMINISTRADOR_Doc_identidad` int NOT NULL,
  PRIMARY KEY (`ADMINISTRADOR_Doc_identidad`,`Cod_gasto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `Doc_identidad` int NOT NULL,
  `Nom_usuario` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `Password` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `Tipo_usuario` varchar(1) COLLATE utf8_spanish2_ci NOT NULL,
  `ADMINISTRADOR_Doc_identidad` int NOT NULL,
  `ENTRENADOR_Doc_identidad` int NOT NULL,
  `CLIENTE_Doc_identidad` int NOT NULL,
  PRIMARY KEY (`ADMINISTRADOR_Doc_identidad`,`ENTRENADOR_Doc_identidad`,`CLIENTE_Doc_identidad`,`Doc_identidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`Doc_identidad`, `Nom_usuario`, `Password`, `Tipo_usuario`, `ADMINISTRADOR_Doc_identidad`, `ENTRENADOR_Doc_identidad`, `CLIENTE_Doc_identidad`) VALUES
(52487102, 'Diego Rodriguez', '12345', '1', 0, 0, 0),
(1007646008, 'Nay S', '123', '1', 0, 0, 0),
(1008646007, 'Irene R', '1122', '1', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina`
--

DROP TABLE IF EXISTS `nomina`;
CREATE TABLE IF NOT EXISTS `nomina` (
  `Cod_pago` int NOT NULL,
  `Fecha_pago` date NOT NULL,
  `Valor_pago` varchar(7) COLLATE utf8_spanish2_ci NOT NULL,
  `Tipo_cargo` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `Descrip_pago` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `ADMINISTRADOR_Doc_identidad` int NOT NULL,
  PRIMARY KEY (`ADMINISTRADOR_Doc_identidad`,`Cod_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_clientes`
--

DROP TABLE IF EXISTS `pago_clientes`;
CREATE TABLE IF NOT EXISTS `pago_clientes` (
  `Núm_factura` int NOT NULL,
  `Fecha_pago` date NOT NULL,
  `Valor_pago` varchar(6) COLLATE utf8_spanish2_ci NOT NULL,
  `Descrip_pago` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `CLIENTE_Doc_identidad` int NOT NULL,
  `ADMINISTRADOR_Doc_identidad` int NOT NULL,
  PRIMARY KEY (`CLIENTE_Doc_identidad`,`ADMINISTRADOR_Doc_identidad`,`Núm_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
