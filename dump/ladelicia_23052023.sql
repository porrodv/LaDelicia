-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2023 a las 18:53:23
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
(1, 'PLATILLO', 'SEGUNDO', 'Tallarines con Lomo Saltado', 'Tallarines salteados con trozos de filete de res, cebolla, tomate, ají amarillo y papas fritas', 19.90, 10, 'https://i.pinimg.com/736x/67/2a/e3/672ae3f83b4d0c09e131742a58bda09a.jpg'),
(2, 'PLATILLO', 'SEGUNDO', 'Pachamanca 5 sabores', 'Preparados con carnes de cerdo, pollo, cordero y alpaca, sazonado con hierbas aromáticas y cocido a la leña. Acompañado con papas y choclo', 89.99, 10, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoGBxQTExYUFBQWGBYWGRoaGhoaGhoaGhwaHRofHBwaGiAaHy0iIB8oIBoZJDQjKC0uMTExGSI3PDcwOyswMTABCwsLDw4PHRERHDAoIik8MDMwPDkwMDAwMDkwMDAyMDAwMDAwMDIwMDAwMDAwOTAwMDAwMDAwMDAwMDAwMDAwMP/AABEIAKgBLAMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAFBgMEAAIHAQj/xABAEAABAgQEBAQDBgUCBgMBAAABAhEAAyExBAUSQQYiUWETcYGRMqGxByNCUtHwFGLB4fFyghUzkqKywiRDY1P/xAAaAQACAwEBAAAAAAAAAAAAAAACAwABBAUG/8QAMREAAgIBBAECBAQFBQAAAAAAAQIAEQMEEiExIhNBMlFhoQVxgZFCseHw8RQjUsHR/9oADAMBAAIRAxEAPwBcIjwiJFRoTHLnpJq0etHoj0xDJNYyN5UoqOlIKibAAknyAhky7g0qkibNmKl6qgabB25nN+2zwt8ioLMFmC9wXw7lasROCEkJbmJOwHbcw4jIjKLvqSLAku3pvaAaeFVSta0TZagnSoLKly1IAJ1HkSqthvvSkHjjZ2GQDNT4kslysMoJSQSHID0oHIr2jBqf9yipiWyHdwZL/Dqaqm6162YmrxGnDFagjqaeTX8qMI9wecS5vMCkoIoHrXrSkEpGHUxXLYO9Tcho5XkG20ZbOVHMzD5ZKloLsmrOp9+5oLPCLxkgImgBaSVAk6ag9DfoD8oL5/n/AIet0MoEAu/NRrA0DAVtUbuydLmmaDNVcigszkBm2HKfaOlo8HTn/MpQwPJ7ngj0RvhMOqYpkgm1m/qQOu8NMnLMPJABGtZq6k6qdBYRty6hENHuPLARUUY1hrnYWWsl0IUmwYaCOtRc+fSA2IygpUNJJQeoZQ6AiKx6hX4lhxBZjyLczBl1AfEFBOm5JNma7xewPCuKm2lFIs6yEV9a/KNA56leotWTBKY9g4eEp4VpK5Oq2nxE6n6NeMncH4pP/wBYU35FJJ9neL2t8pBlT5iBUxII2xGFXLLLQpJ6KBH1iMxIXc3BjxUYI9MSXNGjZo9Aj1okqaiGTgvhn+KUVrcSkFi1CpV9IOwZnPcQupTHVPs+0jAy2/Mt/PWf6NDcKgtzM2ryFEtezxDeGw8uUgJQlKECwAAEQzc1ljd/KBmY4srUR+EUAikpfSOfn/F23FcYFD37v8phx6axbQ2c6T+VXyiZGZJIdle0LqlqoLRKnWn8W0LT8UzXzz+kNtMsYEZhLP4m86fWLCVg9xCr/Edn843k40p+EkdhGjH+Lc+QB/KA2k+RhfNMhkTx95LST+YUV7isJHEPAsyUCuSTMQPw/jA9Pi9Kw5YbONlV7i8E5M0KDpLiN6ZsOpHB5+8BcmXAfp9pw0paPI6NxzwoJiVTpQaYA6kj8Y3P+r6xzmFZMZQ0Z1MGdci3KykxooRMRGhTAR00Ai1lmXqnTUykM6tzYDcn97iIdMPPDXDA8E6khcxd0ksAWLIdizVJNfpC8r7RQ7PUXlyBFuWOH8PLkSx4Q1kh1Ltre1qt0FvrF3FZkn+H1KRygBWkV5QXYW6O3Zolw+HVKk+CtLEJ06g7HbU9C4A2q8B8bLlzpiVOWlqYyyKLJBDJBDmhJcbmOWeGO4m/eYwd/Ms5ThJM9IXLSsSzMBFro6guAks2xO96Q5xMn4dailKVSVlIC0FlJAclKwLtWvcO7ERcy/M5ctfg+FiEKmuE60q0jSD8J2BAep+Zj3McEpRIlvLCwywE6kqDszG1KOKw5tqUCP58QVJYynlgwikhBl6CTfSEgqU/NYaXLjpSCqpIwwLElJtWx3qYXsJqkIXJ1uquhKrgkuSPcB2Zw8EswwUxcpEu58PSkOQdQTQ9Nr7NatFNtY8d+xjSD7nic+45x2qcSFVP+GEVMrmpVLWkhapnKyh8CE8xW7Fyo8jUoHMC+IAtE9aJiVBadlUPV/KrvDRwnlqUy0KU7mpbc13vHRasGEXIp3NxC2WpTLlJTKcrLFmD1rYny71MXcFhlsSoEqKiAgkv/wBR5XcEXpvF/LsqQGmqppBS1g5t5lhA3inOZICEMVGWQoGoZVaoLgF1BNA+9HEZcGNGsuLv94TZDdLKuKxSVmrOC9wWI5XBFCCQpjA6ViedJNQFb2Hm1dzAXE5sUEoIYhKQCGqKn6k073gpleZIlqEtQ3qai1Bd6X+XSGppwp59+pZyS7mYCymZLXoWFpbqFIcgvZ6U6sPKG7LsDMxUhK0T5Jngv4nhALCWoFByyn/EIRcfOBSoS20atQaxYuAa0eot+KC2RoBTpJIKaAg0961t9Yd6noL5DiAynJ8J5EZ5WR4tEuZ40wKUQyJktAVNTWtWDgjs8D8u4cEnxVqnrKpqFS/vNco7FypYcENQxLgeKMRJXoUfElg3Vc0tqFQR1L/oz5PxNIxBCA6JhBIQsM4BY6TZXpWNeLJiy1tMzZDlx3uHH0izi0TZEoa0zcYhbgIWEKCfNaXVXaBmMyXC65TrmyjOTqEspcJJ/CVGgrSOmqwksgp0BlXADP7QPTw1JSCEg3caiZgSrqkLJaHNhMHHqgPmJz+Twugr0f8AyEl2rLSw7kgs0eSOH8PM1iViSpSCxHhKJb8wCakPuIdUZHiELK/FlrSxOnw9CipqOpzT0gRhMFPExXjYQS5ikKSMRKKSlDipIJoaXrCzirsR41JPTQEeDJpTqlzJahaupBfpzC8B8dl02QdM1CknvY+RsYN5VNlS5/PjlLBCkaFpX4aybBZW4FdxBDDLx3iCTNkSDIeqSeXT1SoknypAlAeowZ2U80ftExobfs+z0SlmQssiaXSfyrZvYgD1HeA+eZcgAzsMSuUVEHdSCCxB3aAX8SUEKFwQR6RSgq0ZlZMuMidYxuHKFEGxLg9YriCGWY9M2UgkBSFpCh6jaMnZY9Zan/lN45Oq/DHU78XI+4mTFqB0/Bg00jzUSdommySn4kkHvGukMXJfZhT1jlkMDtbj7TSCOxISY1erR6ERsEtCwx7hT1Ji5hMWUKBFtx2iokRuEvTrDMeVla17gsoIoxqSpw+xji/FWHTLxU5CbBZ9Hq3zjqmZ5rLwkjXMNgyU7qU1hHHcdjjMmLmKHMtRUfMmPW5XBRd3cz6JG3NXU8SmDWQ8KT8UxSNMv/8Aoq3+0XV6U7wycJcCCk3FJ7iX/VfX/T79Ie0oAAADAWAoIvHgJ5aHqNcB44+frE2bwxhsHLcJ8Saqylh2DjUUpsGHr3iDE5p4ExExNZZXzgfhdJOtXQUIfqr2KcQTFKm6kgESgUkPWrElv6wAzidLUFGWdJ3ah6Me3aOJrMt6jx6HA/8AYrGSwtubkmFzLXiVhY1JmJJ1OdISFMkD8IcDzoX6klk6sPLmLMojUVBKyouw6JegcmrfpCDhMXOnT0yJTC6trNV6UAvRjSOm5ZKRKkolkCg0kFmJZya3JqYmwhtzGif3luQBQlydiUqB1bdRRuvSKWCwc1IKlTHSdWlJDkJJcAnqPKxasDeJJQEvVKSRMQpK0hKilJKVAspL6SDXb5wVTm6dLqUEg15qf+UWMyk25+nH/cHaQPERexEjTPVNVLdSEllAPyu9x5QVl4RU5MuYoqTp5hpJ1PXcbMWaMRikTZwCVAskksaVZuxsYuy8OqUnSlbgWBbzZ026W2hePHfPJH91Gu/A+cQ/tbyo+HLxCUhS0EIWWDlCywfb4gPIq7xU4QzmXKKgpLq0gJdtKTSpqKX8oI8d56P4eckpUF6Q6S7fE4PR36V9qIMnEobsured3Ir/AJjdjO9OujxLXgUY7Y3Pky306iE9HcmrlL061P6wtZmZypuqZyhBJKFAgFTA6VV1EM7soG7NeB+GSoOCvUmoDXqbPv8AWKeahSdIdRNHU+/rff2hmLEoY13LJ4lTMsUokqU3ZmA6UaGbL0r/AIeWtcrxAEhRLixULqdwOobaE3FzdfKKk0Dbm0PGGwauWX4iQAlB0qchZDOFEEdDZixp30uooXEhjZqTy1yAgBP3a1aVBOp0s7amNUgVFflG+AnGUnQDqHhghwRqSzVAGx38hEOMnp8BWkMtJSUbgCoIchlah2DsC0VcrxKZ0xJWn7tKFgnmADAUDKFQP1vWEsi5AV9oxHK8xxwCUzEOQVOxKemz7H2ihiNMtSgSSDQX5TVq3H9r2inLzAyihZJolKNhUMklhu6Tdnr2ifGYiXOAWCHXLGpL0c2qzXa/S9I5fpviye+2bA4YQ1geOZ8pfhq0zUigKuVZ7ah0rUi1+sMuC47wy31+JLI2Ul3tbQ/UXaOTLmFClufhUC1wku4I+Y/zBnAThMUAnQS9WOpm3B/d46n+pyIu4ciY20+NjXRnTJXFeFV/9jO3xJWL+Ygrh56VgKQpKkmxSQR7iOO5nMCpwQQAx06rOqhLeQKSYI8O8UzMJMVL0Fcsk8jsQotzBx2Zvo8Pw6ouAWEz5NNQ8Z0zE5bKmEKXLQoioJSCQexvCznX2ey5qjMlzpkuY+oFRKwFbEOdQ94O5JnkrEpKkEuG1JPxJeodtu4gnGulYXMwZ1NRbwuTKlJIKUqUarWlI51MxUQNzCXxvhpSDr8HVUBWl0nzpHWYpZhlsqcNMxAL72V6EVgGx/KMTMQeYgcHZolMtEo6katRlpmfEQLt1Dm8NUjFDeAebfZ8oAqlTVLUnmliYplpP5RMaqexHrAzB5zOlr8HFSVypgsVDlWBukih9DFqSODKcBuVjv8Axxs4I6GsQLnSj8UsD/SWgInHPUGNZmK6F4DJjxsPIA/mLkWx1C65mH6zB5AH+kQTMXhUhzNW3+mF/GY9QNIFYzEqYuq5t2jI+j05/hH3mhC//IxqncQ4NG8xfYAD6wKx/HugfcSUpOylnUr2hRxmOSnevSBhxJUXMRdPjTlVA/SOCgnyNwpj80mz1lc1ZWrvYdgLCK0VyqNxMijNqUBQn0TEWImaUk+g8zQRLAfN8UnWEFVmcdy7etveNuoyenjLTgKLNQUvLSsrmBZC1vqALB3qw8/p1qU7iuSpLhqgE3rXcVhrzPOPCJBGos9KNQsVUsSGpWrtC5gCrFTkTFBWiWFFzRK6kJ5QqqQQebqktuI82AGf1P3m1Cwl7hLhkYaSsTazpw1KULpDP4Wrsfcv2i9mWaqTcE7BSE9vxjzf9It42YagmosR0v7dIV8zxBUoJDkm/lYk+UJbK2Vjf6w0X3MmwGbTZkwKAC5aElRSN1Egp3qwen8wgt/xJKkfelDl3APn+atogTliZAC5aiXHMDRybnuaC8LedZqlRKQkhXdvJ/rDAP4VH8oYpjcuys6CMSCgfdadJULanJbyD+7wzzs7SEPqHvCTgJYlgBZBStyDS71SRsbFjsRGmaqlJBUCAQ7NDChBpT/X6yzR7lD7TsVqly1hTFS2KdigJJD+Rr6wjSca5CfQQazdS8QtOoHRLu91Es4A8m9zFyRlclI1EAKU70LjfSlhTo/b36+HbjxBW7iDZaxB6AocpSpzblID/wC5rb71tEGMwMwpB1aiTYqDs1+oDvf+0MicM4SAKDfUAQAxZI/DRn8osTFCWmnMaA0J0valPetvWCDVyBJ33ErL8sXqC1KCNJcE1tWwq36wRVjUpQpSlaVAsLgv1D1uHgxmGG1iiipSdRIehLjU1dnFaiBIxUlc/VNSV6FKCEM4ZnB2JFKD+b3bXqVcEnaOIcwklCkoVMUCTLHwpGkL0uCerUDXLO9IF4XL0yZylKK/CoEEEmmk6tqElrteLWF4hVNA1JSzKDDd7Fuz0Bve0XZExgmhqDfcbn6wjIxxdcxiDf3KKsxmTSlKkEImLJuapKttRYFrgW7xWzHNwhQTKOpNUlRSKsdgd6XvBrFYFBZaSEaOiQzW27VgdneA0ypWnSyAQrq9G9wX716QnejMLEZTAcGZhwVFWsDSoAXarUIbozl4MZSTh8QWCZiJQBSAQ9U0KzQmiSTs471CYxakICwRpIGofylhtbpBbIZiZiTKImIcJICtKTMBYqUHJJcVuojYB4JVBUn2kZvKoWSgGYQxUoqJoCE6g692IIBNns96RLmuBKVKVpKQsBJrfmBq1mAFxtvG2XS5eGmTCtRQtYTqUQhJ1uFaQVKJUGZWoFi9XMWcwxyFpdi5olIBIqWTzCgf1MZ87MHAQdQ8RtfKDMrxq8LPTMlkKAABIDakgEkKahcC/VILUjrOX4xM2WmYmyg9bjqD3Fo4/PS5AAAWBfUnVQ6kgt0o79GpaDHCHFwkzxLmqaXNAJUTQE/CS9hcE/OkbtNlINH+zM+owgixC/2j4tXiypSFrDS1rWlJZOkqCQpXVmVeEDxtR5Uim5F+/eHT7W2QJcxJIVOSZSiN0JOsW7q9aQhFQ0PZhYUptB5fjl6f4ITkYmYAyVqSbcilBvJi4/URcwudTwkoVM8RBJdMwCaFHq63L+REB8MSGagItQOf6Wglhg9QDZ7N7tGV8rIe5sXEjDkS0qbLX8CjJX0JKpR9aqR/u1DuIHZlnE6QoonSyk6dQJHKpP5kKS6VDuCYknySHJrqpTY+1/1ifAZgpCfDWlMySS5lzPhPUoN0KvUexg01Q6aIyaWuUi3P4v6B/eBeI4gmrOw8odcVwNJxCDNwYKkj45ROmcjyYFKxSnVrmASOBVTtRwy9RSWKVjSQfyndJ7KAjXxMwJ6giXN1BzeJ5IjJ2Rz5C9E6WqWe4ofIihi0nDsIBmAmjEhPM0iQCPUyo2aEMZsUT6IeFbNMSlSjrCg6uUh2LkgVFKhINbOLOIZlGkI3FeJmy0hSRql11ANqAahTQuQ522v1PXnwCzh4hbSnjJCpyynWfDSHWzOxoKgUrvBPB4JCNMxjqKQhQJNh8KQ9gOnV+pgfwxg1jDLWpSgqcAoamcIuklgN9unrGuYZsZYIVdtiFD3LGOE4K+ImsDdwJtmk0p1AAhti49ngTkktfi+LqDLDAAA0BcGtxt6wCGOnT54NRKQSSAVc3Uq7B3a1DSHRGMly5SUOwDEBTOKW87iJ6PpCye/7qGSehKub4/QLpc7NX09IQc2zNSpoAsm/mf7fWDXE+aq1D4d7Fn6Bum79u8Kq1FyV77xr0mGhuI7hHgVC+IzEKRp2a1XgRMxBBckqANA7t0p2jzmUQkEVIAsblmg3iMPJKAJRGlJGqYqgJOwdtVx5xsRAtCAxuBlrUVpCSmmhTgFVWer11dRuSdoOSMRqKkqUNRqov66a03+Rijh8tV4hCBq5So8wD6Q6lcwpvBPL5U1V0lQqoAWSGCWLKIDkGp/xpPp15RPl7SvizrOhIKEJYD7wHWpnqQCWANLXNt4vAUlSXKnTUAlkJPWg7kV6dIu4zDrQXKQkGhAILkbuDsS48+0Yy/CI0EkoLMxU1U2cE2Jf53iiyMPEyAEdypjEpTOJVTxACSzmpcg+e192o8DMfl0sqKkqTzpVpSQXI038rftjBjK8v1HUSSv4dLaqCrMeXcn1MUsxy6VIda1iWouzIAW9xY+u3mIoZATtHcsrxcWhMmSl6VioLVI9tT29YO4PMwQlKZakkElRUpwS4AcFJsAT15qHaF7ETQo8tVUsKk72qWghlmBnKFRpFfid6dPp6Q3Io22YKNzUYcTiCpBJD7kVatwPRqfrG8vEEIAUl0kN+rH294ikYUpKQA6mqSXY+gu7Uv8ASL/8FpAKw5Ll6uzPXbr5bxjKA9zRvkEibNlJ8NJo1wAVWbezdR1iSVizR6gA7itqcvp7REJZL8xJYuf3v6i7UieUg/C3M41E3Jcgs9DX90o0LYqAWrmWkypZS40V20rHzqXjdOF5k8hQeocuNiKVNDt5VEQnDrSzFgsO2pjR3d7GhPpVqAzyZ4lpKxNT+YClyfVjcP5UhDYmXoxgyK03x0zSCCHLAA2AFjQUJ/bVMDs2WhZBACSGqk6gpno5N+oYC0VcVxMkEh9VSXLP73f5eUHeD8X4qZqJiQARrSgkPQEFbdmSGpYmKa8a7iORCLWaBgbibPpk+XhZUwB5CVpJd3coYVGyQmouFCKMqY71r0tbb6RHxBI0TlABWklhqDV6V9+8VZM/Qqg7v3H+DGlW9QAxY8OBGPLpOpQfau7sSQB2q9TBiXJKSNNnNDQitf0heyvN0kipTW9UuG6gdWv3pBiRiiEp1KBFwyifxUFH2INjQC94p8O7mNTLXEYZeRpmIJC02NTUDcvUWfz+YhczDBK0kMUkkWZRBegoS6e4i2jiISxpDipSSlwnU3w1SaVSdTR6MQJvMQpPxCpoQ4LgCmwYkCkD6agfUQhka+TwZQyvNpuHWiYgsoeyhulTUKT8to6LisskZphtaSZapoTqWhgsFB+BZHxAF6RzadgVvQXJ1fCB1o5taGL7N84VJn+Cs/dzvhrZYFD/ALhy+emDwuA232MVqEtd69iaJyo4JsPjsSJkmYWlhUuaSFE0KJrEJPUEwuZvl5kTlyVV0mh6pNUn2jtWYYGXPlqlTEBaFBikin9j3jnn2h8PrleHMQCuWlAQpV1Bjy6/SmrtDcuKhYg6XUeW0+8SliIzE6g8RGMs6U+gzC/xBlalJUXBl3UndvxAeY2paGGNJiHBHWN+bEuRaM86rFTYiarErAUCjSUOBbSUtQgkj1D9esJnE2a82gJBWqiQnmr3b9jqYduIsFPlIUZaPESBYByB5XMJPDJRMmTpy3MyWUsCGIl7sLXd+17xw/8ATMrkuJtxsG6M94byybLQyknWrUS7AObpJNd3p2FqRDnxnyyfE1adiUu3bULi394asIlKpilqdzUMSQNiX3N404kxGHw0rxJksq1FgkEupXm9O8ZTmZs23bc0hFUTlsxRWrU1Pp3jSa7sQkhr1p/SHzL8jl4uWmcoGWVPyoSlNASL6eYUuRHq+A5ZNVzCHsdLHsdIeNg12FW2sarg9wSjEWIq5DkoxUtQRyqSXBiRctSQcOsJppC0KehANQQaUN336QxYoS8tlnw5M1SlPViUJ6OWpADCJnrUuarSQXUUhnrcp79o6IKuoZOZn5UkNNJEtchZdJmgp0VJ5QBdwxtcdoJZbmPgnXp1JAUFJIYAmtGJ1W1Cov1eAmZYpYZSpJR/Kpi5cgtd6io2ItFvL8wVLkqUtK1JmoGlLpARV+UltgSCz3vSJsscyiflL+ImeKhU1tLuQKgMLDSA/q/SAi89DgaAzUdQck1enK3b5mBmLmKmB6BALkOVEKZrqoBe28bzFy0ILFQJAA6HqXHb+kNXGq1QgFiZ5js/XLV92yVUKmJId7Bx0rbe5gLiZq5hdSitay5dySrrFzLMtOImB1BIpcEmp7U9yLQyYfKESkggBZsGCXJN+rFtu3aDLJj/ADkVGeD8iwMuW3iISZjfmNibF6PUCncdYPApcEDTfyqdun9zaIVSzLTrSwNatSoZmbp16d49AJHMC5+Lao3t5/SMmRzk6jlQJLXjgJq39anuXHzjdKtRDq6OC6fxMx94H4taUtyKUbtYANRzvX/xgTjs3UdJJLMAQBSgZ+b0tSnaIuMSFow4/FSUJdQZgwO5S7MNJ1Aq1A9gDWwIaZnQT/ywtmYhRHqwqdzUkv06icNh1TGI0JCnqp6bEgCgqDUtv5wUl5Xh0DnmFaqcrsKkioZ+9Ce7XjSVoRQIleZj5s5XwlVSAlNAl9mHk3oOwjadJcjxlGjgpHwp7KJbSaEM34elYITJqSlaJQJSAUlSvif8ruXDAC9QkXvFfC4ZSyAkOd1W00ayai/UU9XWXXuGAZqSlA+7SHDGj3am9SxsSzkxLlGMUialSNR0FyBUqBoUkB6sT+6wz5Pw5JH3ig5P5rexp/W8GESZYDAAU2H6bRz8mqU+O0mMVYIxmATO1BaVK5dIUDbcMFFhtvFXCcISbzDMWT5JHsN/WGJUpgSLfp/iKs3MUyw3xE0A7nq+zQhGyfCpqMYg8yOVlWHlg/cI81DUTS51OTGaUgckqWOh0s/RgBUNu8EMLiHS6qk/pYUZh+6mIAmWtTatJdwXApvv++0MTE7GyT+sHcBBONw38qQBsEsPl6xOnSEAs/l/UN1ifFuk0IKD2A+XaKCsYkEgkN+6wyyviwl3Y4hUJlqTQBwHCgSwPr7GxfaBU0lICwQCkkpO4Uk0UPl7RtNzKWEhILAhh0oXS4uC7exgNjMVVn7f2p+6wwkEjaJFv3jVlP2gz5alhYlzFKVqVqTpJoE0KWFgKNtD9w9ncvGyioJYjlmS1MWJH/ckix37WjkGTZNicSppMskhnNAEvYqJtY+1I6pwRw0cGhZmL1zZunUQ+kBLskPeqlF+8dHGXPfUx5Qg67ijxxwj/DkzpQeUTUbyyf8A177QoFEd7nSgpJSoApUCCDUEG4MczzzgSeicoYcapRqmtQ/4T1br0aF5cHNia9Nq+KczqTRkbR5GucuRqRCRxhwvLKjNQNBUXKwLH+YC4Lt1+kPbRFiJIUCCHBvAuoYUZasVNiIeElPLTzArDBSgxBIAGoWu3vHuHQkq8RYdSgwcuEgH8ANA9yf0ET5tli8NM8RAKpRuOgN4woTNCVptcDux/Ux5vX6VsTF0951cGUOKMm8Miqav7xqtz1HW1uhcWrFXD4hnJLDqegcf0Ma4DMQtS6coVpFfy3b1f2jlri53XU0EH85JMkakBKedh+JRJI2csT7iFXiXLhJBmS0lJAchJ6lrAsa7iGrGY0kBCDzK1fhLJY81D8tqg+dRGVIuorWanmWogE3YEsPSNeLKNOdxJv8AnBreKI4nPc5xE1ctDy5gUnmSdNQbEb0I+g6QvTMQuYQFrUEp1Fq3Jtv2Fdo7JOy9KqEW3IpYfrFGbwVhlqK1S3o1yB3LpY+5IraOji/FlY+Y5+kRk0wA8TOd4NYUw+MUqSBuzb9AwP8AmpmaFIUUakoAJdJqXDO3d/IUhiz7IFYVInYYa0TFaDKIVMLsapYOQwLv77Qk/wDEZjECYoBtiWOzHs1I62NxkUMsxupU0Yx8PLEpOqayUqJAO5rfr19AIakaWJcWqKM+zdD+rC8KWWT0TpKElysOOaqQXoL2NyWBizJxa5bpUlWgfivpBppf26RnzJuv5x2N9oHyhifIJBIIIIcimkbRWx08oQNKgVltIolkvcO6QB1NGfzitMzUabkIqpkJ5i5rvRLUeBszGGYrRKQEqUQSXDltujBxYbWiYsdS3cHmRYpatBUSQmmpjc9zdVX8ozLsImcQpKrMAkBqgF1Hq7Wpf3vzMmlI5Jk8LXR0OdPQEaTpcKO/5h1iziJiJMvToYfABsauoEOaN7Ejzh9gRZNyOfiUptpc/GoFZ5QdIqCkgbs7VLhi8U041AUkDku6UuBpSHqVG5Au247xVxmZJSkJlp06C6SGGlxViC5NmLg0fq+ZVlapiBMWWetDzEDzs5Dv8otqrmCO6hXLELnKPKWJJ7ByWD3JZq3pfqz5XlyUJalbmxNfe7xFhFIQkMwPpeI8TmyRY9f39Y5mRixM0iFjpCgdYAHQOzAu4G7fu8b4nN5YQAC5ahLfIPb+u0J+a8RMKKI2oSD02MLs3OFr5UufJ3PmYNMLOvVQCwBj7OzwrIlpOon5Bu1GH0aIZMnndStR/lDtWxq4NveB/DmG8MAqJM1Y1KFT5B7f39BBieyHNQTRi9AQzswb+sWMVE3+8sNLusgBtTlRDaWem1hVwLH130xKxKQ8wgFB/Ez3agBo4Z+wozQJVm6UOwB6G3+P35wAzzMddVKPLYPW1hDV+QlEe5hnOM8WouFahQMDR/S4qfUvvC9ic4DklVa2c/oPnGZTlc3EkqAX4TsSlgpVWoHrcPfo8NOZcPYeXKlgBHMkn4Q9tQqa0cguX5a0aD9ILy3MgYk0OIqy83QoDUqZTZKEj5lX9N4nl44laUpHhg11Gqm3YsAPQUg3wflWGUVakJKhQKUQRfo7dPeLWZ5ekHTpBHQgdG9eriLJVTdQwjMO51DgvApl4WQdI1GWOdhqKSdQdVzcGDsA+Gc3lzpCdACSkBJQPwMGA8qUgpLmvGxSK4nPYGzcsRkRpMSQUGLHAPGUvHIKOZM2WBqSpi4NlAihsdh5Q1xxGUidOwkrE4JIkzJE4+IiWUy0KUEgibzmrAhJBJDEx03g/iNWJlDxUpROHKoJXLWklndJQpTP+U1obgPAI1jmNy49pJEYo8Ij2Mg4mQzpIUCCHBhXzXKVyNS5SSpBcqQHcdSlq+0N0aLRC8mJci00NHKGxOcZkmWJM2bLAUChagAWFiSk+t4FcDYed4c3xkqDzCUOXcWJFbUDdamHvNuHCSqZhyELV8ST8C+5Gyv5h6wuYbEmUpMmcgylgMl/hWwblVY+hji6nTMiMALB950sWZXqj1JSkhXTahvYt1a9K7RZmqSEpV1BfzBv++kazFMGo5IFev7cwN4mXMEhYlqIJDBjUEkCjb1jlLiJIB6P25mgm4Qwc/WVawoaSyRZgNx1cl+tQ9mixPlhYAZkv8JYufzH0A9oB5KlUtKBMIAFamrtUqUbt7dBF8Y0lCShaWVp0rG6TUN+YbVh7qpsKeDxf5RZUgyXHZahcsjw0qLUBA/qPr0hMzXgCTPJWgKlFy5S2gsbgf4/V7lYtL6tQCerivkA9HiDDSlEKBSU86gARcEu/Tq1drQOFsuFLRuQef8AEjANwwnIMfw1MwayQrWihJbTSrEVIPu/aLGHxAWgBRFLXa1j+946bNymUqW0xIVS6mKrNVnfz+cc24syISFhUhRKFAqCbsAR8PrtHV0+rGc7W+Ie8Q2PaPHqeIwBmaqgkmhDJYuAWbt/iLUjLPBlqWqYAD8ZevKbubigGkOObcmBGBzAsGWpgXHR7u3mBFjGY2aGCVAJZ9qnqX7H9mOgDXEz1cr43AB06Vo5iD4gSUgC/Kl+4Nht5xXzCazDWC6QDSzEsH+dL6iHaLU+apYJWak0NSE9QwcNAHEqctc/4iLbGWaAkuJ0fClQU9dTEMH+Gu7VN7ADeMBmEJdWlAfSexOwvexI+lPJGGWhQVoUSC2kpIr33DUNoJYLKJi1alk6QSaO9Ow+kMJCjmAqljxKM3M1Ek61XL9B0b5RmFE6dRJLetobcHwzKCeVIJG5Ds4Iq+72FLVgujACUUqUEqlkOsJQNQvpLrvv0tCN4JpRH+kRyzRMl8N6azNSiztVvU7epgrleBlBLaEpmVZJBvq0gpB+I1FL0MOclElLHUtSRVYJYpqbu/Qt6Qu8biSdJkLqynCXZOwDkCrEuNrvWB3NXlGbVulluZjkSXF1OQ9g7tQkEPf2gBmmaEkKJO43f3uaQNOICgyUqCmrrVqqD+FmPvBfJshQfvMQSpTFkkskPSzVa9Gr7xRAHxHiCAT0IFOImLP3aSB+2pYReynJEqIVNL7kF6tsSK1oKd4L4+ehCSEtSjMwsC42asUMFigpTEl3gPU8SVEaMXPMZ0ZimTLPhMBQgAFLMLVpYp2snyYZicxK9RIChsX0sGDV3DA16q9IrhQBIcmnZru5a29T02gejFkEBJ5eY9R0BBfTbvtBF2YfSUqKphHhrGy5U7UoAJNi5GkkEC7OA5aLmPx+pVUD8yXAPkQfcOICawoXcAULVvG0qTR25gTWvXe7/WIz7low1Xa1iO/2Z4/7+agn40hQ/wBqiG/7/wB1jo8hMct+zauKSGblWbdmIP8A1COsS414vhE5+o4czZKY9jIyGRE4hxTks6eMPMw8lRw6pCFS5YtKP4wX3JrrPxVMX+BMlxEj+IM4KlStMtTpUlSgtK9QICSdJ06hVviEDuO8oxCsVNV4cyagkeGpMtSkaCkaAhnSBppS5BLVghwfowsmZIxSkSDiSDLSsaVBkqBWvZKXYAlqjyjKD5TovfpVY5/edKyjPQpkzKO+lTu4AFVEADe9vI0g6DCPOk3SoMSAghOrSlAuQQDfpegGzx7huJVyZkuXoVMlrBUpin7lATS9VE05R+cDoDoDfOc8rHeMivg8YianUhQP1HY9IsQcGY0VMxy6XOQUTUJWk7EPFuMiSA1ETiDhrES5f/xvvAmqEqI1pYUAJooeZFKVhdwnEaVKTLxEqZJnpNUzEkB2bUlXwlNTdj0eOtlMUcyyaTPTpmy0qHe48jcRkyaPG4PFTTj1LL3EnM8OVy+Rq92ob7RSyFGmV4JH/K5QCQXR+FX1HmDaGDEcLTZCVCQrxJZBaWsspJ/kVYj+U+/VGzzNZmGUNUibLUCzqSQG3YtpVawPeOXk0TqCvsZtx51bkRnlBlO3l27j03jQ4uYgETNSkoSkiYSDqo6tQFiIoYLiDDztBVM0aSb8t0lNelzXrF7N5mmUo6kqBDJbcmlGu9PeOecOQDYeQe/pHkgm5KZzvRzZvOAHFEhkFZXysQUlNB3TveDGAlrAT4iRZyxZ+jd7v6X2TOKcw8KWqWqaZpVqKQEskOXDjUQ1i3TzeNWhwMjEAxeRh3FLL0AKWSRpqaEM79/39Yv4yYJYZVdw1fJxToennSB2WTCin4Tc19QO9oPrwQmp1IUgOWUakpSXJozepIuY7pIHcw0faCEy1TTplA6izpYMd6qBIbtQu0eYTBqQrWWTprUgl3AoAXep/tDMRKw8vw0VUaqIAIYgEMauWP7aFzEp0jUoAOXbtUEVPce0Aj2euJZXibYELnzm1ctByjS9gXAJc0HWHKSrDSFBBISoB3NQHv0p+u+ypwwtSVFaUihZi3RiCFecXc6m+LMStIOtLAMzEdNI3HfYQZUE2ZakhaEZlZqhExlpSoJcundiphRqu7+0R43HiaClyBd7F61pU3NNvotKxJ/CDZiGoGJ3r+lY0mzlJoAOm6qg1tCMhawBHIFrmE1Y1YLa1nRTSEg0qUpUpqh6s9LvVhmKzGWRoUoBRYOOYAv1DgQHw2YKKiQ1SXYlx5jr0jZUyo8/pvAOLYFh1DQUCAYQy9MtI1M5NHuQHamzvE+Jn17N3J7Xgf4wboAHipPxgalet2HT6f3hfps5oRu9UFmXsWtK0KCb/p/iAmCCkqY3g3k+EUaroBfpuW84qYjCsrUEuLt9KmHIhAKwHYEhptNUthooSfick92A3+e0RaGABox2q3VwDS/zi8gIlI1LqfwhquenpR+8eYBCZhcoCAB0v9IYq0OYkmzxK6pNA7UtSlN94nwUwk6a+z9uv6wROG5mDMoflFPKkWZGASirgKWeUPzKNgwufSIUBhB6jd9nGCCVKV+IJY3/ABKe7N+HY+e0PcowJyDB+HKSkAhhVxUncmDMtEalFCpgyNuYmbRjR7GQUVOcYjLzmCVTcFipyCGBkKmKlhA2CRLLJTdqEbOGgtkuXzBh5AxiEKnS1LSFr0qWiXVjqq6iAkPeo3jmEnFKlHWhSkKSPiQSlQG7EVh6zbi9eCUiQtInqTLT4qlKZWs8zAgG3cPaMaODyf6TpZsDLSrz8vnGpUtQ6fELVHkf9KRq/wBTeoDOMm1zETpT6kJLpDMqUaaFKIL6gAqzuE1DPE2aZtPCUHD4ebNSuWFBUxcqXLAXdKivn1Mz1e1YsYKdM8KVMn6SSjnCCDLM0KdNRYbXalX3bcx7SOYEwKsbLU58NCknTyrKiokcr6k2tQqNOhhnyjixKuSeAhYJSVD4CUs5dzpuKE0e8Q4yQACdQBSLpZzNWCSWPZ2HRZ6UTeL80lYWeiSpKwpcoKUpICgWUyXSqinY2Lhqu9C3VBC7jVTriFghwXEexyPh7ifFJ1GTKnqSlKlATZYRKJdwlJAKnPUGj1dodeH+NUTkgT5S5Ez8sxmfsoU92PaDDAymxkRnjI1lzQoOCDG0FAmNEU/DpWClSQoG4IBHziWMiSRTzT7PcLNcoSZSv/zPL/0l0+wEKWa/ZZNBdIRNAtpPhr9jy/OOsx5AlAYwZGHvOOGXisMnQRNQ1B4qCoeQUGf3MAcfkOIxEwrJ1rOzMw2YbCPoBQehrFOblUlV0AHtT+0LXCimwIRzMZwKVw3OGpKpRZq9ozBgS9EpZUgvVRDAuB1rt847wvJkMwPvAnH8GypoZaQRf4Un6xbYgZYzETkeYzpcr/ljWpjWgbvQsB7nvALESfEVqUVKVuBUP2pHbcN9nWClq1mU5YBlfCG6Cwi5/wAGwyCyZMtPQsIiY9vcpst+04xk2BmJOpUtaUVQFEEAuCW6Pyv7xJNQUKBS4LtQ3Hn07R1vOZCZ0tUlTBJFGblIqCPIxzvNcCZKucOHbWPhJsH6H2iPjjcWQdGA5qApzudnuelI1lBYIIcGpBJq9q93Y2/sWGERsRU3a3mbV/pGxyslXxHenW1R8hCCDc0cVAeDkqKmIJfdrUZvIAWjTDzStcxJDaVMPQw0fwAST+ECg6CBowkpJVzByS5ck1Ny9T/aLA7uQ+1SicCSHDMz1LDz6n0i1gMn0sfiG5IbyNBWsS4nNpEsUIUobB/6u0BsVnE6afi0p2Slm9esEgPtAcr7xmX4SUuoi3Zq7F9vf1gfOzaSmtFHsCf61Pr+kCJOFmziwC5h7Aqb2tDDlX2e4uc33egdV/oHMEMZgNlEV8wx65i9TMBYdBeJZOaTU0SB28+1Lx1DLPsil0M6ao9Qlkj6E/OG/JOD8JhmMqSnV+Y8yvdTmD2D3ivWI6nJMg4OzLGEKLypZ/Gt007C59o6Twt9nmHwhExSlTpw/GvY9hDaBGQYUDqLbIzdmYlIFo9jGjIuLmRkYTCfn/2l4PCzjJWslSQH0h2fY0oe0USBCCk9Tlj0s9Lde0P2ZScLMzGWqamY85EtctSiPCUopaWFJ06rpAZ6kgEVaMjIwYuj+k7Gr8WWvkYm51hJwnrGJBVOJ5jd9wUEfh6NSDWWZwvLsMZcxOtU465cpTpVLQxBWs3TqIDJZ6E70yMixwWkIDBVMN5DjMNiBrlJZSeZUotrSaMofnRSpFRSDczCpZekJIZKUrs6zVSnHmj1BEZGQ9OhMGdQrECDM84Zlz0kBUwjVpT94qtHUQQp2ozGjguDSEGfweqQubOUfETh0GYlL86lJcgKIFgQSWqWsHjIyCMWrEXBmWcc47Dq1InU3QUI8M+gAPqC/eOlZF9qksyZczFAS9ZUlwaOksSAakVFQ9SRsYyMiIxj8uNajjlHEWHxKdUmchY/lUC3Y9D5wTBeMjIcOpjYVPYyMjIkGZHkZGRJJkZGRkXJMiNclJuAfSMjIqSVZ2UylXT7Ej6GB2J4RkqJIVMST0U/1jyMiwZUXcz+yqXMconzJb/lCAPZKRAlX2PzgeXGTPUD9IyMijLDkSQfY3MX/wA3HTW6JAidH2JYYXxOIP8A0D/0jIyJQk9Rpfw32P4BNzPX5rA/8UiCuD+zzLpdsMlX+tS1/JRb5R7GRJe4w5hMtkygBLlS0AbJQlP0EWWjIyJKmNGNGRkSSexkZGRJJkQYzGolJKlqCQOpaMjIhlgWROT8ffatqCpODPYzdh/o6nvbzjlipiiSakkuSaknck9YyMhJmxVAn//Z'),
(7, 'PLATILLO', 'SEGUNDO', 'Trío Marino', 'Selección de platillos marinos peruanos que incluye ceviche de pescado fresco, arroz con mariscos y chicharrón mixto. Acompañado con salsa criolla', 59.90, 10, 'mimg/trio-marino.png'),
(8, 'PLATILLO', 'SEGUNDO', 'Ají de Gallina', 'Pollo deshilachado en una cremosa y picante salsa amarilla hecha con ají amarillo, leche, pan y nueces. Servido con papas cocidas y arroz', 17.90, 10, 'mimg/receta-de-aji-de-gallina.jpg'),
(9, 'PLATILLO', 'ENTRADA', 'Causa Rellena', 'Terrina de papa rellena de ensalada de pollo o atún, aguacate y huevo duro. Servida con lechuga, papas cocidas y salsa de ají amarillo', 15.90, 10, 'mimg/causa.png'),
(12, 'PLATILLO', 'SEGUNDO', 'Tacu Tacu con Lomo Saltado', 'Tortilla de arroz y frijoles cubierta con tiras salteadas de carne de res, cebolla, tomate y papas fritas. Servido con salsa criolla', 22.90, 10, 'mimg/photo.jpg'),
(15, 'PLATILLO', 'SEGUNDO', 'Seco de Cordero', 'Tierno muslo de cordero cocido en una salsa a base de cilantro, servido con frijoles canarios y arroz', 25.90, 10, 'https://img-global.cpcdn.com/recipes/7b309e5f07ea5302/1200x630cq70/photo.jpg'),
(16, 'PLATILLO', 'SEGUNDO', 'Chaufa de Mariscos', 'Arroz frito al estilo peruano con mariscos variados, huevos y cebolla verde. Servido con salsa de soja y salsa criolla', 21.90, 10, 'https://www.comedera.com/wp-content/uploads/2022/02/arroz-chaufa-de-mariscos.jpg');

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
  MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `checkout`
--
ALTER TABLE `checkout`
  MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
