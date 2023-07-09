-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-07-2023 a las 19:39:02
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
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `dni` int(8) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `dni`, `nombre`, `direccion`, `telefono`) VALUES
(1, 45863644, 'Jose', 'jr. alameda 192', 974522322),
(2, 74156615, 'Maria', 'av. antunes 10', 989561255),
(25, 1, 'AAAA', '1', 1),
(26, 1, 'AAAA', '1', 1),
(27, 19999999, 'A', 'A', 199999999),
(28, 12312331, 'alexander', 'test', 213213132),
(29, 12231231, 'alexander', 'test', 133213212),
(30, 12231231, 'alexander', 'test', 133213212),
(31, 11221331, 'test', 'test', 212213312);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `clientes_id` int(11) NOT NULL,
  `cantidad` int(5) NOT NULL,
  `preciofinal` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `menu_id`, `clientes_id`, `cantidad`, `preciofinal`) VALUES
(4, 1, 1, 1, '19.90'),
(6, 1, 2, 2, '39.80'),
(7, 2, 25, 3, '269.97'),
(8, 2, 26, 3, '269.97'),
(9, 2, 27, 2, '179.98'),
(10, 2, 28, 1, '89.99'),
(11, 2, 29, 1, '89.99'),
(12, 2, 30, 1, '89.99'),
(13, 2, 31, 1, '89.99');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mensaje` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`id`, `nombre`, `email`, `mensaje`) VALUES
(1, 'Jorge', 'jorge@gmail.com', 'la comida estuvo muy rica y la atencion fue excelente, gracias!!'),
(2, 'Miguel', 'miguel@gmail.com', 'los dias feriados, ¿los precios son los mismos o cambian?');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locales`
--

CREATE TABLE `locales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `fecha_creacion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `locales`
--

INSERT INTO `locales` (`id`, `nombre`, `direccion`, `telefono`, `fecha_creacion`) VALUES
(1, 'ladelicia ', 'av alfredo mendiola 3755 los olivos', '7215558', '14/08/18'),
(2, 'ladelicia-san isidro', 'Amador Merino Reyna 285', '8663234', '25/04/19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
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
(1, 'PLATILLO', 'SEGUNDO', 'Tallarines con Lomo Saltado', 'Tallarines salteados con trozos de filete de res, cebolla, tomate, ají amarillo y papas fritas', 19.90, 8, 'mimg/lomo.png'),
(2, 'PLATILLO', 'SEGUNDO', 'Pachamanca 5 sabores', 'Preparados con carnes de cerdo, pollo, cordero y alpaca, sazonado con hierbas aromáticas y cocido a la leña. Acompañado con papas y choclo', 89.99, 8, 'mimg/pachamanca.png'),
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaciones`
--

CREATE TABLE `reservaciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` int(9) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time(6) NOT NULL,
  `persona` int(10) NOT NULL,
  `mensaje` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservaciones`
--

INSERT INTO `reservaciones` (`id`, `nombre`, `email`, `telefono`, `fecha`, `hora`, `persona`, `mensaje`) VALUES
(1, 'Diego', 'diego@gmail.com', 988512332, '2025-06-23', '14:00:00.000000', 4, 'quiero reservar una mesa para 4 personas para el 25 de junio a las 14:00 horas'),
(2, 'Alicia', 'alicia@gmail.com', 955252114, '2028-06-23', '12:00:00.000000', 2, 'necesito una mesa para 2 personas para el medio dia del 28 de junio ');

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
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_clientes_id_compras` (`clientes_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `locales`
--
ALTER TABLE `locales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
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
  MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `checkout`
--
ALTER TABLE `checkout`
  MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `locales`
--
ALTER TABLE `locales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_3` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
