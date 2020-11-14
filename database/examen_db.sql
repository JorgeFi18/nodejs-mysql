-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2020 a las 02:57:12
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `examen_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `carnet` int(11) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `nombres` varchar(40) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`carnet`, `apellidos`, `nombres`, `direccion`, `telefono`) VALUES
(1, 'Figueroa', 'Jorge', 'chimaltenango', '42383988'),
(3, 'Guerra', 'Hector', 'Zaragoza', '45698741'),
(5, 'Ruiz', 'Milton', 'San Martin', '99663322');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `codigo_libro` int(10) NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `editorial` varchar(30) NOT NULL,
  `edicion` int(6) NOT NULL,
  `nombre_autor` varchar(50) NOT NULL,
  `nacionalidad` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`codigo_libro`, `titulo`, `editorial`, `edicion`, `nombre_autor`, `nacionalidad`) VALUES
(1, 'El Mercado', 'Piedra Santa', 2018, 'Luis Pazos', 'Canadiense'),
(3, 'Leyendas de Guatemala', 'Ediciones Oriente', 1930, 'Miguel Angel Asturias', 'Guatemalteca'),
(5, 'Los presidentes de Guatemala', 'Ediciones Oriente', 1999, 'Hector Gaitan', 'Guatemalteca'),
(7, 'Barbuchin', 'Edesa', 2020, 'Jorge Figueroa', 'Guatemalteco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id_prestamo` int(11) NOT NULL,
  `fecha_prestamo` varchar(20) NOT NULL,
  `fecha_devolucion` varchar(20) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`id_prestamo`, `fecha_prestamo`, `fecha_devolucion`, `id_libro`, `id_alumno`) VALUES
(1, '01/02/2020', '01/03/2020', 1, 1),
(2, '03/04/2020', '03/05/2020', 1, 3),
(3, '10/11/2020', '10/12/2020', 1, 5),
(4, '12/11/2020', '12/12/2020', 3, 1),
(5, '15/11/2020', '30/11/2020', 7, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`carnet`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`codigo_libro`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `id_alumno` (`id_alumno`),
  ADD KEY `id_libro` (`id_libro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `carnet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `codigo_libro` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`codigo_libro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`carnet`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
