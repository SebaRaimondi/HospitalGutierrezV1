-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 28, 2018 at 05:17 PM
-- Server version: 10.0.32-MariaDB-0+deb8u1
-- PHP Version: 5.6.33-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `grupo46`
--

-- --------------------------------------------------------

--
-- Table structure for table `configuracion`
--

CREATE TABLE IF NOT EXISTS `configuracion` (
  `titulo` varchar(255) NOT NULL,
  `descripcion1` text NOT NULL,
  `descripcion2` text NOT NULL,
  `descripcion3` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `elementos` int(11) NOT NULL,
  `mantenimiento` tinyint(4) NOT NULL,
`id` int(11) NOT NULL,
  `titulo1` varchar(255) NOT NULL,
  `titulo2` varchar(255) NOT NULL,
  `titulo3` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `configuracion`
--

INSERT INTO `configuracion` (`titulo`, `descripcion1`, `descripcion2`, `descripcion3`, `email`, `elementos`, `mantenimiento`, `id`, `titulo1`, `titulo2`, `titulo3`) VALUES
('Hospital Dr. Gutierrez', 'Este centro de salud tiene un programa de residencias de primer nivel en el país. Se ofrecen oportunidades de práctica intensiva y supervisada en ámbitos profesionales y por la misma -por supuesto- se recibe un salario mensual, acorde a lo que la regulación médica profesional lo indica en cada momento.', 'Hospital Dr. Ricardo Gutierrez de La Plata dispone de un sofisticado servicio de guardias médicas las 24 horas para la atención de distintas urgencias. La administración de la institución hace viable una eficiente separación de los pacientes según el nivel de seriedad y tipo de patología.', 'Acorde a una respetable trayectoria en materia de medicina y salud, en Hospital Dr. Ricardo Gutierrez de La Plata podemos encontrar profesionales de las principales especialidades de salud. Del mismo modo se brinda atención programada y de urgencias, se realizan estudios médicos y se brinda soporte en muchas de las ramas comunes de la medicina moderna.', 'hospital@gutierrez.com.ar', 7, 0, 1, 'EL HOSPITAL', 'GUARDIA', 'ESPECIALIDADES');

-- --------------------------------------------------------

--
-- Table structure for table `consulta`
--

CREATE TABLE IF NOT EXISTS `consulta` (
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `peso` decimal(10,3) NOT NULL,
  `vacunas_completas` tinyint(4) NOT NULL,
  `vacunas_obs` text NOT NULL,
  `maduracion_acorde` tinyint(4) NOT NULL,
  `maduracion_obs` text NOT NULL,
  `examen_fisico_normal` tinyint(4) NOT NULL,
  `examen_fisico_obs` text NOT NULL,
  `pc` decimal(10,2) DEFAULT NULL,
  `ppc` decimal(10,2) DEFAULT NULL,
  `talla` decimal(10,2) DEFAULT NULL,
  `alimentacion` text,
  `obs_grales` text,
  `usuario` int(11) DEFAULT NULL,
`idConsulta` int(11) NOT NULL,
  `idPaciente` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='guardara la historia clinica (las distintas consultas) de cada paciente';

--
-- Dumping data for table `consulta`
--

INSERT INTO `consulta` (`fecha`, `peso`, `vacunas_completas`, `vacunas_obs`, `maduracion_acorde`, `maduracion_obs`, `examen_fisico_normal`, `examen_fisico_obs`, `pc`, `ppc`, `talla`, `alimentacion`, `obs_grales`, `usuario`, `idConsulta`, `idPaciente`) VALUES
('2015-11-28 16:47:48', 3.000, 1, 'OK', 1, 'OK', 1, 'OK', 0.00, 0.00, 0.00, '', '', 2, 7, 15),
('2015-12-12 16:47:48', 4.000, 1, 'Completas', 1, 'OK', 1, 'OK', 0.00, 0.00, 0.73, '', '', 8, 8, 15),
('2017-11-19 16:55:29', 4.968, 0, 'Vacunas incompletas', 1, 'Acorde', 0, 'Normal', 0.00, 0.00, 0.00, '', '', 8, 11, 15),
('2017-11-19 16:56:14', 6.000, 1, 'Bien', 1, 'Bien', 1, 'Bien', 60.00, 0.00, 0.75, '', '', 2, 12, 15),
('2017-10-20 17:10:32', 2.750, 0, 'Completar vacunas', 1, 'Sin problema alguno', 1, 'Normal', 35.00, 0.00, 0.50, '', '', 8, 13, 13),
('2017-10-21 17:11:13', 4.350, 1, 'Vacunas completas', 1, 'Acorde', 0, 'Presenta complicaciones leves', 38.00, 0.00, 0.52, '', '', 8, 14, 13),
('2017-10-29 17:11:47', 5.560, 1, 'Bien', 1, 'Acorde', 1, 'Normal', 40.00, 0.00, 0.54, '', '', 8, 15, 13),
('2017-11-01 17:12:21', 6.400, 1, 'Completas', 0, 'No', 1, 'Normal', 41.00, 0.00, 0.57, '', '', 8, 16, 13),
('1997-11-19 17:22:02', 2.750, 1, 'OK', 1, 'OK', 1, 'OK', 4.00, 11.00, 0.35, '', '', 8, 18, 16),
('1997-12-01 17:22:59', 3.250, 1, 'OK', 1, 'OK', 0, 'Presenta inconvenientes', 4.50, 11.50, 0.50, '', '', 8, 19, 16),
('2017-11-19 20:29:52', 40.900, 1, 'OK', 1, 'OK', 1, 'OK', 0.00, 0.00, 0.00, '', '', 8, 20, 16);

-- --------------------------------------------------------

--
-- Table structure for table `genero`
--

CREATE TABLE IF NOT EXISTS `genero` (
`idGenero` int(10) unsigned NOT NULL,
  `nombre` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genero`
--

INSERT INTO `genero` (`idGenero`, `nombre`) VALUES
(1, 'Femenino'),
(2, 'Masculino'),
(3, 'Otro');

-- --------------------------------------------------------

--
-- Table structure for table `horarios`
--

CREATE TABLE IF NOT EXISTS `horarios` (
`idHorario` int(11) NOT NULL,
  `comienzo` time NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `horarios`
--

INSERT INTO `horarios` (`idHorario`, `comienzo`) VALUES
(1, '08:00:00'),
(2, '08:30:00'),
(3, '09:00:00'),
(4, '09:30:00'),
(5, '10:00:00'),
(6, '10:30:00'),
(7, '11:00:00'),
(8, '11:30:00'),
(9, '12:00:00'),
(10, '12:30:00'),
(11, '13:00:00'),
(12, '13:30:00'),
(13, '14:00:00'),
(14, '14:30:00'),
(15, '15:00:00'),
(16, '15:30:00'),
(17, '16:00:00'),
(18, '16:30:00'),
(19, '17:00:00'),
(20, '17:30:00'),
(21, '18:00:00'),
(22, '18:30:00'),
(23, '19:00:00'),
(24, '19:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `obra_social`
--

CREATE TABLE IF NOT EXISTS `obra_social` (
`idObraSocial` int(10) unsigned NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `obra_social`
--

INSERT INTO `obra_social` (`idObraSocial`, `nombre`) VALUES
(1, 'OSPE'),
(2, 'IPENSA'),
(3, 'Ninguna');

-- --------------------------------------------------------

--
-- Table structure for table `paciente`
--

CREATE TABLE IF NOT EXISTS `paciente` (
`idPaciente` int(5) unsigned NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `idGenero` int(1) NOT NULL,
  `idTipoDoc` int(3) NOT NULL,
  `domicilio` varchar(50) NOT NULL,
  `telefono` int(20) DEFAULT NULL,
  `idObraSocial` int(3) DEFAULT NULL,
  `dni` int(10) NOT NULL,
  `heladera` tinyint(4) NOT NULL,
  `electricidad` tinyint(4) NOT NULL,
  `mascota` tinyint(4) NOT NULL,
  `idTipoVivienda` int(3) NOT NULL,
  `idTipoCalefaccion` int(3) NOT NULL,
  `idTipoAgua` int(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paciente`
--

INSERT INTO `paciente` (`idPaciente`, `apellido`, `nombre`, `fecha_nacimiento`, `idGenero`, `idTipoDoc`, `domicilio`, `telefono`, `idObraSocial`, `dni`, `heladera`, `electricidad`, `mascota`, `idTipoVivienda`, `idTipoCalefaccion`, `idTipoAgua`) VALUES
(4, 'Lemos', 'Gabriela Noemi', '2015-11-14', 1, 3, 'City Bell', 4720998, 1, 4586958, 1, 1, 1, 3, 1, 1),
(5, 'Borrelli', 'Clay', '2015-11-14', 2, 1, 'La Plata', 4789658, 3, 4586958, 1, 1, 1, 2, 1, 1),
(6, 'Roca', 'Pedro', '2015-11-14', 2, 2, 'Ringuelet', 4859658, 1, 39599458, 1, 1, 0, 3, 3, 1),
(8, 'Mura', 'Filomena', '2015-11-14', 1, 1, 'City Bell', 0, 1, 1333256, 0, 1, 1, 2, 3, 1),
(9, 'Monteverde', 'Yazmin', '2015-11-14', 1, 1, 'La Plata', 0, 1, 40258963, 1, 0, 0, 1, 3, 1),
(10, 'Onofri', 'Melisa', '2015-11-14', 1, 1, 'City Bell', 0, 3, 40258987, 0, 1, 1, 3, 3, 1),
(11, 'Marini', 'Martina', '2015-11-14', 1, 1, 'La Plata', 0, 1, 39588965, 1, 1, 0, 2, 1, 1),
(12, 'Liptak', 'Franco Emanuel', '2015-11-14', 1, 1, 'Berisso', 0, 2, 5555555, 1, 0, 1, 2, 2, 1),
(13, 'Rios', 'Gaston', '2017-10-01', 2, 4, 'Los hornos', 0, 3, 39588966, 1, 1, 1, 3, 2, 2),
(15, 'Test', 'Test', '2015-11-14', 1, 4, 'lala', 0, 1, 69896658, 1, 1, 0, 3, 2, 1),
(16, 'Onofri', 'Camila', '1997-11-06', 1, 3, '466 e/ 17 y 19', 4720998, 2, 39599149, 1, 1, 1, 1, 2, 1),
(19, 'Purueba', 'pRUEBA', '2017-11-27', 2, 1, '44 4846541', 0, NULL, 54841351, 1, 1, 1, 3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `permiso`
--

CREATE TABLE IF NOT EXISTS `permiso` (
`id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permiso`
--

INSERT INTO `permiso` (`id`, `nombre`) VALUES
(1, 'paciente_index'),
(2, 'paciente_new'),
(3, 'paciente_destroy'),
(4, 'paciente_update'),
(5, 'paciente_show'),
(6, 'usuario_index'),
(7, 'usuario_update'),
(8, 'usuario_new'),
(9, 'usuario_delete'),
(10, 'configuracion_index'),
(11, 'configuracion_update'),
(12, 'consulta_new'),
(13, 'consulta_update'),
(14, 'consulta_destroy'),
(15, 'consulta_show'),
(16, 'consulta_index');

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
`id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`id`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Recepcionista'),
(3, 'Pediatra'),
(4, 'Guest');

-- --------------------------------------------------------

--
-- Table structure for table `rol_tiene_permiso`
--

CREATE TABLE IF NOT EXISTS `rol_tiene_permiso` (
  `rol_id` int(11) NOT NULL,
  `permiso_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `rol_tiene_permiso`
--

INSERT INTO `rol_tiene_permiso` (`rol_id`, `permiso_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(2, 1),
(2, 2),
(2, 4),
(2, 5),
(3, 1),
(3, 2),
(3, 4),
(3, 5),
(3, 12),
(3, 13),
(3, 15),
(3, 15),
(3, 16);

-- --------------------------------------------------------

--
-- Table structure for table `tipo_agua`
--

CREATE TABLE IF NOT EXISTS `tipo_agua` (
`idTipoAgua` int(10) unsigned NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_agua`
--

INSERT INTO `tipo_agua` (`idTipoAgua`, `nombre`) VALUES
(1, 'Corriente'),
(2, 'De subsuelo');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_calefaccion`
--

CREATE TABLE IF NOT EXISTS `tipo_calefaccion` (
`idTipoCalefaccion` int(10) unsigned NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_calefaccion`
--

INSERT INTO `tipo_calefaccion` (`idTipoCalefaccion`, `nombre`) VALUES
(1, 'Gas'),
(2, 'Electrica'),
(3, 'Radiante');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_doc`
--

CREATE TABLE IF NOT EXISTS `tipo_doc` (
`idTipoDoc` int(10) unsigned NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_doc`
--

INSERT INTO `tipo_doc` (`idTipoDoc`, `nombre`) VALUES
(1, 'DNI'),
(2, 'Pasaporte');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_vivienda`
--

CREATE TABLE IF NOT EXISTS `tipo_vivienda` (
`idTipoVivienda` int(10) unsigned NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_vivienda`
--

INSERT INTO `tipo_vivienda` (`idTipoVivienda`, `nombre`) VALUES
(1, 'Departamento'),
(2, 'Casa');

-- --------------------------------------------------------

--
-- Table structure for table `turnos`
--

CREATE TABLE IF NOT EXISTS `turnos` (
`idTurno` int(11) NOT NULL,
  `idHorario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `dni` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `turnos`
--

INSERT INTO `turnos` (`idTurno`, `idHorario`, `fecha`, `dni`) VALUES
(1, 9, '2017-11-17', 40345182),
(3, 1, '2017-11-17', 40345182),
(6, 1, '2017-11-18', 40345182),
(7, 3, '2017-11-18', 40345182),
(10, 5, '2017-11-18', 40345182),
(11, 2, '2017-11-17', 40345182),
(12, 3, '2017-11-17', 40345182),
(13, 4, '2017-11-17', 40345182),
(14, 5, '2017-11-17', 40345182),
(15, 6, '2017-11-17', 40345182),
(18, 7, '2017-11-17', 40345182),
(19, 2, '2017-11-20', 40289549),
(21, 2, '2018-11-20', 40289549),
(22, 23, '2017-11-19', 40345182),
(23, 24, '2017-11-19', 40345182),
(24, 22, '2017-11-19', 40345182),
(25, 21, '2017-11-19', 40345182),
(26, 1, '2017-11-20', 40345182),
(28, 3, '2017-11-20', 40345182),
(29, 4, '2017-11-20', 40345182),
(30, 5, '2017-11-20', 40345182),
(31, 6, '2017-11-20', 40345182),
(32, 8, '2017-11-27', 354332844),
(33, 1, '2018-05-26', 40345182);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
`id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `email`, `username`, `password`, `activo`, `updated_at`, `created_at`, `first_name`, `last_name`) VALUES
(2, 'sebastianraimondi@gmail.com', 'sebaraimondi', '123456', 1, '2017-10-20 23:40:12', '2017-10-10 04:55:17', 'Sebastian', 'Raimondi'),
(5, 'onofricamila2@gmail.com', 'onofri', 'camila', 1, '2017-10-11 17:59:11', '2017-10-11 17:59:11', 'Camila Ayelen', 'Onofri'),
(8, 'flor@gmail.com', 'florraimondi', 'florflorflor', 1, '2017-11-17 18:03:40', '2017-10-11 21:26:56', 'Florencia', 'Raimondi'),
(15, 'pedro.brost97@gmail.com', 'pedrobrost', 'pedro', 1, '2017-11-03 00:22:35', '2017-10-13 05:32:28', 'Pedro', 'Brost'),
(18, 'graimondi@lbs.com.ar', 'Gustavo Raimondi', 'colo', 1, '2017-10-14 02:12:18', '2017-10-14 02:12:18', 'Gustavo', 'Raimondi'),
(24, 'borre@borre.com', 'borre', 'borre', 0, '2017-10-23 11:34:34', '2017-10-14 23:10:31', 'Borre', 'Borre'),
(41, 'proyecto2017@gmail.com', 'proyecto2017', '20proyecto17', 1, '2017-10-23 14:29:22', '2017-10-23 14:29:22', 'proyecto', 'software');

-- --------------------------------------------------------

--
-- Table structure for table `usuario_tiene_rol`
--

CREATE TABLE IF NOT EXISTS `usuario_tiene_rol` (
  `usuario_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario_tiene_rol`
--

INSERT INTO `usuario_tiene_rol` (`usuario_id`, `rol_id`) VALUES
(2, 1),
(2, 2),
(2, 3),
(5, 2),
(8, 2),
(8, 3),
(15, 1),
(18, 2),
(18, 3),
(24, 1),
(41, 1),
(41, 2),
(41, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `configuracion`
--
ALTER TABLE `configuracion`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consulta`
--
ALTER TABLE `consulta`
 ADD PRIMARY KEY (`idConsulta`);

--
-- Indexes for table `genero`
--
ALTER TABLE `genero`
 ADD PRIMARY KEY (`idGenero`);

--
-- Indexes for table `horarios`
--
ALTER TABLE `horarios`
 ADD PRIMARY KEY (`idHorario`), ADD KEY `comienzo` (`comienzo`);

--
-- Indexes for table `obra_social`
--
ALTER TABLE `obra_social`
 ADD PRIMARY KEY (`idObraSocial`);

--
-- Indexes for table `paciente`
--
ALTER TABLE `paciente`
 ADD PRIMARY KEY (`idPaciente`);

--
-- Indexes for table `permiso`
--
ALTER TABLE `permiso`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_2` (`id`), ADD KEY `id` (`id`), ADD KEY `id_3` (`id`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`), ADD KEY `id_2` (`id`);

--
-- Indexes for table `rol_tiene_permiso`
--
ALTER TABLE `rol_tiene_permiso`
 ADD KEY `rol_id` (`rol_id`,`permiso_id`), ADD KEY `permiso_id` (`permiso_id`);

--
-- Indexes for table `tipo_agua`
--
ALTER TABLE `tipo_agua`
 ADD PRIMARY KEY (`idTipoAgua`);

--
-- Indexes for table `tipo_calefaccion`
--
ALTER TABLE `tipo_calefaccion`
 ADD PRIMARY KEY (`idTipoCalefaccion`);

--
-- Indexes for table `tipo_doc`
--
ALTER TABLE `tipo_doc`
 ADD PRIMARY KEY (`idTipoDoc`);

--
-- Indexes for table `tipo_vivienda`
--
ALTER TABLE `tipo_vivienda`
 ADD PRIMARY KEY (`idTipoVivienda`);

--
-- Indexes for table `turnos`
--
ALTER TABLE `turnos`
 ADD PRIMARY KEY (`idTurno`), ADD UNIQUE KEY `idHorario_2` (`idHorario`,`fecha`), ADD KEY `idHorario` (`idHorario`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`), ADD UNIQUE KEY `email` (`email`), ADD UNIQUE KEY `username` (`username`), ADD KEY `id_2` (`id`), ADD KEY `id_3` (`id`);

--
-- Indexes for table `usuario_tiene_rol`
--
ALTER TABLE `usuario_tiene_rol`
 ADD KEY `usuario_id` (`usuario_id`,`rol_id`), ADD KEY `usuario_tiene_rol_ibfk_2` (`rol_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `configuracion`
--
ALTER TABLE `configuracion`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `consulta`
--
ALTER TABLE `consulta`
MODIFY `idConsulta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `genero`
--
ALTER TABLE `genero`
MODIFY `idGenero` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `horarios`
--
ALTER TABLE `horarios`
MODIFY `idHorario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `obra_social`
--
ALTER TABLE `obra_social`
MODIFY `idObraSocial` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `paciente`
--
ALTER TABLE `paciente`
MODIFY `idPaciente` int(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `permiso`
--
ALTER TABLE `permiso`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tipo_agua`
--
ALTER TABLE `tipo_agua`
MODIFY `idTipoAgua` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tipo_calefaccion`
--
ALTER TABLE `tipo_calefaccion`
MODIFY `idTipoCalefaccion` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tipo_doc`
--
ALTER TABLE `tipo_doc`
MODIFY `idTipoDoc` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tipo_vivienda`
--
ALTER TABLE `tipo_vivienda`
MODIFY `idTipoVivienda` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `turnos`
--
ALTER TABLE `turnos`
MODIFY `idTurno` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `rol_tiene_permiso`
--
ALTER TABLE `rol_tiene_permiso`
ADD CONSTRAINT `rol_tiene_permiso_ibfk_1` FOREIGN KEY (`permiso_id`) REFERENCES `permiso` (`id`),
ADD CONSTRAINT `rol_tiene_permiso_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`);

--
-- Constraints for table `turnos`
--
ALTER TABLE `turnos`
ADD CONSTRAINT `turnos_ibfk_1` FOREIGN KEY (`idHorario`) REFERENCES `horarios` (`idHorario`);

--
-- Constraints for table `usuario_tiene_rol`
--
ALTER TABLE `usuario_tiene_rol`
ADD CONSTRAINT `usuario_tiene_rol_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `usuario_tiene_rol_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
