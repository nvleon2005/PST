-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 22-10-2025 a las 23:43:28
-- Versión del servidor: 9.3.0
-- Versión de PHP: 8.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Administracion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int NOT NULL,
  `lugar_nac` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `representante_1` int DEFAULT NULL,
  `representante_2` int DEFAULT NULL,
  `nivel_actual` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `lugar_nac`, `representante_1`, `representante_2`, `nivel_actual`) VALUES
(31399589, 'Maturin estado Monagas', 14703500, 15030586, 1),
(36874683, 'Maturin estado Monagas', 14703500, 15030586, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth`
--

CREATE TABLE `auth` (
  `id` int NOT NULL,
  `usuario` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contraseña` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `auth`
--

INSERT INTO `auth` (`id`, `usuario`, `contraseña`) VALUES
(1, 'admin', '$2b$06$6p5gHcH5AzP5XtkavnB3vuOclcRoA4A9ZZOcKe962enWkbQ8UnMvy'),
(2, 'Victor Leon', '$2b$06$SGJ78zfdrHp/aaCFg8mCb.1PCxV27b4y5jWYOxDbumXnw1H1UOJBa'),
(3, 'Victoria Guevara', '$2b$06$tQydV9hyCL8/9fxbxEJjLuTFm84v8Ywqk2zbu19ILtC49eLu1q8FS'),
(4, 'Belkys Salazar', '$2b$06$C04FEi68HHZDbUjl8zKg/eWvEXmsnCXSf0k5eHTP3t8dsir710o8K');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conceptos`
--

CREATE TABLE `conceptos` (
  `id` int NOT NULL,
  `transacciones` int NOT NULL,
  `descripcion` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `divisa`
--

CREATE TABLE `divisa` (
  `id` int NOT NULL,
  `transaccion` int NOT NULL,
  `fecha_hora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_bs` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int NOT NULL,
  `tipo_personal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grado_academico` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado_civil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `tipo_personal`, `grado_academico`, `estado_civil`, `telefono`) VALUES
(10325598, 'Profesor asistente', 'nivel 3', 'Soltero', '0426-1587802'),
(11309568, 'Profesor', 'nivel 3', 'Soltero', '0414-9980745');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

CREATE TABLE `niveles` (
  `id` int NOT NULL,
  `edad_min` int DEFAULT NULL,
  `edad_max` int DEFAULT NULL,
  `seccion` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maestra` int DEFAULT NULL,
  `maestra_asistente` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `niveles`
--

INSERT INTO `niveles` (`id`, `edad_min`, `edad_max`, `seccion`, `maestra`, `maestra_asistente`) VALUES
(1, 5, 6, 'Nivel 3 seccion 1', 10325598, 11309568);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id` int NOT NULL,
  `user` int DEFAULT NULL,
  `modo_oscuro` tinyint(1) DEFAULT NULL,
  `current_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_conection` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `time_conection` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `duration_of_login` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int NOT NULL,
  `sexo` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombres` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nac` timestamp NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `sexo`, `nombres`, `apellidos`, `direccion`, `fecha_nac`, `user_id`) VALUES
(10325598, 'Femenino', 'Lucia', 'Josefina del Carmen', 'Tipuro sector valle del sol casa 50', '1973-07-16 04:00:00', 4),
(11309568, 'Femenino', 'Maria', 'Martinez del Carmen', 'Tipuro sector valle de luna casa 35', '1976-05-11 04:00:00', 4),
(14703500, 'Femenino', 'Victoria', 'Guervara Salazar', 'Los Guaritos 4 vereda 28 casa 40', '1981-03-24 04:00:00', 2),
(15030586, 'Mascuino', 'Victor Jose', 'Leon Aparicio', 'Los Guaritos 4 vereda 28 casa 40', '1980-10-08 04:00:00', 2),
(31399589, 'Femenino', 'Nirvana Veronika', 'Leon Guevara', 'Los Guaritos 4 vereda 28 casa 40', '2005-12-19 04:00:00', 3),
(36874683, 'Femenino', 'Maia Isabella', 'Leon Guevara', 'Los Guaritos 4 vereda 28 casa 40', '2015-06-08 04:30:00', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representantes`
--

CREATE TABLE `representantes` (
  `id` int NOT NULL,
  `profesion` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ocupacion` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir_empleo` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cargo` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado_civil` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `representantes`
--

INSERT INTO `representantes` (`id`, `profesion`, `ocupacion`, `dir_empleo`, `cargo`, `estado_civil`, `telefono`) VALUES
(14703500, 'Ingeniero en informatica', 'Trabajador de Corpoelec', 'Maturin, calle la planta', 'Administrador en gestion de energia', 'Casado', '0412-1119168'),
(15030586, 'Ingeniero en informatica', 'Profesor', 'Maturin, calle la planta', 'Profesor de informatica', 'Casado', '0412-1119139');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_log`
--

CREATE TABLE `system_log` (
  `id` int NOT NULL,
  `action` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `made_it_by` int DEFAULT NULL,
  `made_it_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `id` int NOT NULL,
  `alumno` int DEFAULT NULL,
  `representante` int DEFAULT NULL,
  `fecha_hora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `monto_total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `id` int NOT NULL,
  `nombre_usu` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creado_en` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`id`, `nombre_usu`, `email`, `role`, `creado_en`, `status`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', '2025-10-15 13:31:48.231533', 1),
(2, 'Victor Leon', 'vgla@gmail.com', 'admin', '2025-10-15 13:33:26.012937', 1),
(3, 'Victoria Guevara', 'vga2000@gmail.com', 'usuario', '2025-10-15 13:53:09.265873', 1),
(4, 'Belkys Salazar', 'Batty1987@gmail.com', 'usuario', '2025-10-15 13:54:59.676055', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_alum` (`id`),
  ADD KEY `FK_repre1` (`representante_1`),
  ADD KEY `FK_repre2` (`representante_2`),
  ADD KEY `FK_nivel` (`nivel_actual`);

--
-- Indices de la tabla `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `conceptos`
--
ALTER TABLE `conceptos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_transc` (`transacciones`);

--
-- Indices de la tabla `divisa`
--
ALTER TABLE `divisa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_transacc` (`transaccion`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_emple` (`id`);

--
-- Indices de la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_maestra` (`maestra`),
  ADD KEY `FK_maestra_asis` (`maestra_asistente`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user` (`user`) USING BTREE;

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`user_id`);

--
-- Indices de la tabla `representantes`
--
ALTER TABLE `representantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_repre` (`id`);

--
-- Indices de la tabla `system_log`
--
ALTER TABLE `system_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_madeitby` (`made_it_by`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `FK_alum` (`alumno`),
  ADD UNIQUE KEY `FK_repre` (`representante`) USING BTREE;

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `conceptos`
--
ALTER TABLE `conceptos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `divisa`
--
ALTER TABLE `divisa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `niveles`
--
ALTER TABLE `niveles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `system_log`
--
ALTER TABLE `system_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `FK_alum_nivel` FOREIGN KEY (`nivel_actual`) REFERENCES `niveles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_alum_perso` FOREIGN KEY (`id`) REFERENCES `persona` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_alum_re1` FOREIGN KEY (`representante_1`) REFERENCES `representantes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_alum_re2` FOREIGN KEY (`representante_2`) REFERENCES `representantes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `auth`
--
ALTER TABLE `auth`
  ADD CONSTRAINT `FK_auth_usu` FOREIGN KEY (`id`) REFERENCES `Usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `conceptos`
--
ALTER TABLE `conceptos`
  ADD CONSTRAINT `FK_concep_trans` FOREIGN KEY (`transacciones`) REFERENCES `transacciones` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `divisa`
--
ALTER TABLE `divisa`
  ADD CONSTRAINT `FK_divi_repre` FOREIGN KEY (`transaccion`) REFERENCES `transacciones` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `FK_emple_perso` FOREIGN KEY (`id`) REFERENCES `persona` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD CONSTRAINT `FK_nivel_maes1_em` FOREIGN KEY (`maestra`) REFERENCES `empleados` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_nivel_maes_asis_em` FOREIGN KEY (`maestra_asistente`) REFERENCES `empleados` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD CONSTRAINT `FK_perfil_user` FOREIGN KEY (`user`) REFERENCES `Usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `FK_per_usu` FOREIGN KEY (`user_id`) REFERENCES `Usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `representantes`
--
ALTER TABLE `representantes`
  ADD CONSTRAINT `FK_repre_perso` FOREIGN KEY (`id`) REFERENCES `persona` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `system_log`
--
ALTER TABLE `system_log`
  ADD CONSTRAINT `FK_sislog_user` FOREIGN KEY (`made_it_by`) REFERENCES `Usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD CONSTRAINT `FK_transc_alum` FOREIGN KEY (`alumno`) REFERENCES `alumnos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_transc_repre` FOREIGN KEY (`representante`) REFERENCES `representantes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
