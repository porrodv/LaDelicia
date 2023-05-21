-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2023 a las 01:14:22
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
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `precio` float(10,2) NOT NULL,
  `cantidad` int(10) NOT NULL DEFAULT 1,
  `imagen` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `imagen`) VALUES
(1, 'Tallarines con Lomo saltado', 'Tallarines salteados con trozos de filete de res, cebolla, tomate, ají amarillo y papas fritas', 19.99, 10, './img/lomo.png'),
(2, 'Pachamanca 5 sabores', 'Preparados con carnes de cerdo, pollo, cordero y alpaca, sazonado con hierbas aromáticas y cocido a la leña. Acompañado con papas y choclo', 89.99, 10, './img/pachamanca.png'),
(3, 'Trío Marino', 'Selección de platillos marinos peruanos que incluye ceviche de pescado fresco, arroz con mariscos y chicharrón mixto. Acompañado con salsa criolla', 59.99, 10, './img/trio-marino.png'),
(4, 'Ají de Gallina', 'Pollo deshilachado en una cremosa y picante salsa amarilla hecha con ají amarillo, leche, pan y nueces. Servido con papas cocidas y arroz', 17.99, 10, 'https://decomidaperuana.com/wp-content/uploads/2017/09/receta-de-aji-de-gallina.jpg'),
(5, 'Causa Rellena', 'Terrina de papa rellena de ensalada de pollo o atún, aguacate y huevo duro. Servida con lechuga, papas cocidas y salsa de ají amarillo', 15.99, 10, 'https://i0.wp.com/comidasdelperu.com/wp-content/uploads/2021/06/Receta-de-Causa-Rellena-Paso-a-paso-1.jpg?fit=1280%2C720&ssl=1'),
(6, 'Tacu Tacu con Lomo Saltado', 'Tortilla de arroz y frijoles cubierta con tiras salteadas de carne de res, cebolla, tomate y papas fritas. Servido con salsa criolla', 22.99, 10, 'https://img-global.cpcdn.com/recipes/d494972755b95ef9/1200x630cq70/photo.jpg'),
(7, 'Seco de Cordero', 'Tierno muslo de cordero cocido en una salsa a base de cilantro, servido con frijoles canarios y arroz', 25.99, 10, 'https://img-global.cpcdn.com/recipes/7b309e5f07ea5302/1200x630cq70/photo.jpg'),
(8, 'Chaufa de Mariscos', 'Arroz frito al estilo peruano con mariscos variados, huevos y cebolla verde. Servido con salsa de soja y salsa criolla', 21.99, 10, 'https://www.comedera.com/wp-content/uploads/2022/02/arroz-chaufa-de-mariscos.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(10) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contra` varbinary(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `correo`, `contra`) VALUES
(1, 'admin', 'admin@ladelicia.com', 0x020000001d09b06008fad41935c859756e1c7691e390c828ed75c389884ec78fe9e7a136);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD UNIQUE KEY `id_3` (`id`),
  ADD UNIQUE KEY `id_4` (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
