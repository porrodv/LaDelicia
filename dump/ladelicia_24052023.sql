-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2023 a las 18:56:31
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ladelicia`
--
CREATE DATABASE IF NOT EXISTS `ladelicia` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ladelicia`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addcarta`
--

CREATE TABLE `addcarta` (
  `id` bigint(12) NOT NULL,
  `produc_id` bigint(12) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `precio` bigint(12) NOT NULL,
  `cantidad` bigint(12) NOT NULL,
  `total` bigint(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id` int(12) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `contrasena` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `usuario`, `contrasena`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_food`
--

CREATE TABLE `cat_food` (
  `id` bigint(12) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `sub_categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cat_food`
--

INSERT INTO `cat_food` (`id`, `categoria`, `sub_categoria`) VALUES
(1, 'PLATILLO', 'ENTRADA'),
(2, 'PLATILLO', 'SEGUNDO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `checkout`
--

CREATE TABLE `checkout` (
  `id` bigint(12) NOT NULL,
  `produc_id` bigint(12) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` bigint(12) NOT NULL,
  `email` varchar(150) NOT NULL,
  `ubicacion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(12) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `sub_categoria` varchar(120) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` float(10,2) NOT NULL,
  `cantidad` int(12) NOT NULL DEFAULT 1,
  `imagen` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `categoria`, `sub_categoria`, `nombre`, `descripcion`, `precio`, `cantidad`, `imagen`) VALUES
(1, 'PLATILLO', 'SEGUNDO', 'Tallarines con Lomo Saltado', 'Tallarines salteados con trozos de filete de res, cebolla, tomate, ají amarillo y papas fritas', 19.90, 10, 'mimg/lomo.png'),
(2, 'PLATILLO', 'SEGUNDO', 'Pachamanca 5 sabores', 'Preparados con carnes de cerdo, pollo, cordero y alpaca, sazonado con hierbas aromáticas y cocido a la leña. Acompañado con papas y choclo', 89.99, 10, 'mimg/pachamanca.png'),
(7, 'PLATILLO', 'SEGUNDO', 'Trío Marino', 'Selección de platillos marinos peruanos que incluye ceviche de pescado fresco, arroz con mariscos y chicharrón mixto. Acompañado con salsa criolla', 59.90, 10, 'mimg/trio-marino.png'),
(8, 'PLATILLO', 'SEGUNDO', 'Ají de Gallina', 'Pollo deshilachado en una cremosa y picante salsa amarilla hecha con ají amarillo, leche, pan y nueces. Servido con papas cocidas y arroz', 17.90, 10, 'mimg/receta-de-aji-de-gallina.jpg'),
(9, 'PLATILLO', 'ENTRADA', 'Causa Rellena', 'Terrina de papa rellena de ensalada de pollo o atún, aguacate y huevo duro. Servida con lechuga, papas cocidas y salsa de ají amarillo', 15.90, 10, 'mimg/causa.png'),
(12, 'PLATILLO', 'SEGUNDO', 'Tacu Tacu con Lomo Saltado', 'Tortilla de arroz y frijoles cubierta con tiras salteadas de carne de res, cebolla, tomate y papas fritas. Servido con salsa criolla', 22.90, 10, 'mimg/tacu-tacu-lomo.jpg'),
(15, 'PLATILLO', 'SEGUNDO', 'Seco de Cordero', 'Tierno muslo de cordero cocido en una salsa a base de cilantro, servido con frijoles canarios y arroz', 25.90, 10, 'mimg/seco-cordero.jpg'),
(16, 'PLATILLO', 'SEGUNDO', 'Chaufa de Mariscos', 'Arroz frito al estilo peruano con mariscos variados, huevos y cebolla verde. Servido con salsa de soja y salsa criolla', 21.90, 10, 'mimg/arroz-chaufa-de-mariscos.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parcel_food`
--

CREATE TABLE `parcel_food` (
  `id` bigint(12) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` bigint(12) NOT NULL,
  `email` varchar(150) NOT NULL,
  `direccion` text NOT NULL,
  `food_id` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `addcarta`
--
ALTER TABLE `addcarta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cat_food`
--
ALTER TABLE `cat_food`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `addcarta`
--
ALTER TABLE `addcarta`
  MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cat_food`
--
ALTER TABLE `cat_food`
  MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `checkout`
--
ALTER TABLE `checkout`
  MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
