-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 13-11-2017 a las 12:41:22
-- Versión del servidor: 5.7.19
-- Versión de PHP: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cft_twk`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actas`
--

CREATE TABLE `actas` (
  `acta_id` int(11) NOT NULL,
  `acta_fecha` date DEFAULT NULL,
  `acta_inicio` time DEFAULT NULL,
  `acta_final` time DEFAULT NULL,
  `acta_lugar` varchar(255) DEFAULT NULL,
  `acta_objetivos` text,
  `acta_temas` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actas`
--

INSERT INTO `actas` (`acta_id`, `acta_fecha`, `acta_inicio`, `acta_final`, `acta_lugar`, `acta_objetivos`, `acta_temas`) VALUES
(1, '2017-07-31', '12:00:00', '14:00:00', 'Sala de reuniones rectoría', '<p>Reuni&oacute;n de Prueba</p>\r\n', '<p>Tematica</p>\r\n'),
(2, '2017-08-29', NULL, NULL, 'Sala de Profesores', '<ul>\r\n	<li>Presentaci&oacute;n de Gesti&oacute;n Academica y Financiera</li>\r\n	<li>Trabajo de Coordinadores en Rubricas</li>\r\n</ul>\r\n', '<p><strong>Eduardo Ch&aacute;vez</strong></p>\r\n\r\n<p>- Se exponen multiples indicadores desde el informe de Gesti&oacute;n Academica y Financiera. (se adjunta)</p>\r\n\r\n<p><strong>Unidad de Apoyo Estudiant&iacute;l (Mar&iacute;a Elena)</strong></p>\r\n\r\n<p>- Se comenta la necesidad de aplicar las Encuestas a Estudiantes, y se propone realizaci&oacute;n virtual.</p>\r\n\r\n<p>- Se esta programando el Mes de Inducci&oacute;n del proximo a&ntilde;o</p>\r\n\r\n<p>- Importante revisar las Asignaturas Criticas</p>\r\n\r\n<p>- Docentes para el proximo a&ntilde;o</p>\r\n\r\n<p>- Este a&ntilde;o se aplica la prueba diagn&oacute;stica de matematicas a las carreras que tienen matem&aacute;ticas, y liguistica a todos los alumnos.</p>\r\n\r\n<p>- Las nivelaciones son con asistencia y nota (primera nota)</p>\r\n\r\n<p>- Se realizaran reuniones con cada coordinador.</p>\r\n\r\n<p>- Se muestra un documento &quot;Itinerario de Suspenci&oacute;n de Estudios&quot;, que deberian recibir los alumnos que busquen esta opci&oacute;n</p>\r\n\r\n<p>- El jueves 7 se realizar&iacute;a las fiestas patrias 2018 a las 12:00&nbsp;y a las 19:00, grupo folkclorico y choripanes, se necesita ayuda logistica, se propone cambio al 13 de septiembre.</p>\r\n'),
(3, '2017-11-07', '18:30:00', '20:00:00', 'Sala de Profesores', '<p>- Trabajo Autonomo Acreditaci&ntilde;on de Carreras</p><ul><li>Nilda</li><li>Monica</li><li>Miriam</li><li>Marcela</li><li>Alma</li><li>Mirella</li><li>Mar&iacute;a Elena</li><li>Claudio</li><li>Arturo</li><li>Servando</li><li>Renan</li><li>Yerko</li></ul>', '<p>- UACE</p><p>1) Campa&ntilde;a Solidaria</p><p>2) Navidad</p><p>3) Reuni&oacute;n de Delegados</p><p>4) Becas 2018</p><p>5) Entrevista a Estudiantes</p>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actas_participantes`
--

CREATE TABLE `actas_participantes` (
  `acta_participantes_id` int(11) NOT NULL,
  `acta_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `aprobacion` tinyint(1) DEFAULT '0',
  `observaciones` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actas_participantes`
--

INSERT INTO `actas_participantes` (`acta_participantes_id`, `acta_id`, `usuario_id`, `aprobacion`, `observaciones`) VALUES
(1, NULL, 3, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `area_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `url_dev` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Areas donde se trabaja (ejm: backend / frontend / clientes';

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`area_id`, `nombre`, `url`, `url_dev`) VALUES
(1, 'Backend Administradores', NULL, NULL),
(2, 'FrontEnd Usuarios', NULL, NULL),
(4, 'APP', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bibliografias`
--

CREATE TABLE `bibliografias` (
  `bibliografia_id` int(11) NOT NULL,
  `nombre` varchar(500) DEFAULT NULL,
  `autor` varchar(300) DEFAULT NULL,
  `unidad_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendarizacion`
--

CREATE TABLE `calendarizacion` (
  `calendarizacion_id` int(11) NOT NULL,
  `unidad_id` int(11) NOT NULL DEFAULT '0',
  `ano` int(11) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `aprendizaje_id` int(11) NOT NULL DEFAULT '0',
  `contenido_id` int(11) NOT NULL DEFAULT '0',
  `actividades_inicio` text,
  `actividades_desarrollo` text,
  `actividades_cierre` text,
  `actividades_aula_virtual` text,
  `materiales` text,
  `evaluacion` text,
  `evidencia` text,
  `usuario_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `carrera_id` int(11) NOT NULL,
  `nombre` varchar(300) DEFAULT NULL,
  `descripcion` longtext,
  `sede_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`carrera_id`, `nombre`, `descripcion`, `sede_id`) VALUES
(1, 'TNS en Programación de Sistemas Informáticos', '<p>El <strong>T&eacute;cnico de Nivel Superior en Programaci&oacute;n de Sistemas Inform&aacute;ticos</strong> ser&aacute; capaz de: desarrollar proyectos, programas o componentes de sistemas de software, utilizando t&eacute;cnicas y herramientas tecnol&oacute;gicas de programaci&oacute;n actualizadas; construir, integrar y mantener plataformas digitales, preferentemente de aplicaciones web; interpretar especificaciones t&eacute;cnicas de dise&ntilde;o de software, para su implementaci&oacute;n; verificar y validar el funcionamiento de componentes de software; mantener, integrar, corregir y/o adaptar sistemas de software; mantener el debido resguardo de la informaci&oacute;n de car&aacute;cter privado de los clientes, de acuerdo a las pol&iacute;ticas de la empresa; realizar emprendimiento en el &aacute;mbito de producci&oacute;n de software.</p>\r\n', 1),
(2, 'TNS en Administración de Empresas', '<p>El <strong>T&eacute;cnico de Nivel Superior en Administraci&oacute;n de Empresas</strong> del CFT Teodoro Wickel ser&aacute; capaz de ejecutar con gran dominio actividades de la gesti&oacute;n administrativa, manejo de operaciones contables, financieras y gestiones tributarias, con una visi&oacute;n estrat&eacute;gica en recursos humanos, innovaci&oacute;n, productividad, interculturalidad y desarrollo de una carrera laboral, para el mejoramiento de los procesos administrativos de empresas de distintos rubros y tama&ntilde;os, p&uacute;blicas o privadas.</p>\r\n', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competencias_tipo`
--

CREATE TABLE `competencias_tipo` (
  `competencia_tipo_id` int(11) NOT NULL,
  `nombre` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `competencias_tipo`
--

INSERT INTO `competencias_tipo` (`competencia_tipo_id`, `nombre`) VALUES
(1, 'Técnicas Específicas'),
(2, 'De Empleabilidad'),
(3, 'Prácticas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunas`
--

CREATE TABLE `comunas` (
  `comuna_id` int(5) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `provincia_id` int(3) DEFAULT NULL,
  `region_id` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comunas`
--

INSERT INTO `comunas` (`comuna_id`, `nombre`, `provincia_id`, `region_id`) VALUES
(1101, 'Iquique', 11, 1),
(1107, 'Alto Hospicio', 11, 1),
(1401, 'Pozo Almonte', 14, 1),
(1402, 'Camiña', 14, 1),
(1403, 'Colchane', 14, 1),
(1404, 'Huara', 14, 1),
(1405, 'Pica', 14, 1),
(2101, 'Antofagasta', 21, 2),
(2102, 'Mejillones', 21, 2),
(2103, 'Sierra Gorda', 21, 2),
(2104, 'Taltal', 21, 2),
(2201, 'Calama', 22, 2),
(2202, 'Ollagüe', 22, 2),
(2203, 'San Pedro de Atacama', 22, 2),
(2301, 'Tocopilla', 23, 2),
(2302, 'María Elena', 23, 2),
(3101, 'Copiapó', 31, 3),
(3102, 'Caldera', 31, 3),
(3103, 'Tierra Amarilla', 31, 3),
(3201, 'Chañaral', 32, 3),
(3202, 'Diego de Almagro', 32, 3),
(3301, 'Vallenar', 33, 3),
(3302, 'Alto del Carmen', 33, 3),
(3303, 'Freirina', 33, 3),
(3304, 'Huasco', 33, 3),
(4101, 'La Serena', 41, 4),
(4102, 'Coquimbo', 41, 4),
(4103, 'Andacollo', 41, 4),
(4104, 'La Higuera', 41, 4),
(4105, 'Paiguano', 41, 4),
(4106, 'Vicuña', 41, 4),
(4201, 'Illapel', 42, 4),
(4202, 'Canela', 42, 4),
(4203, 'Los Vilos', 42, 4),
(4204, 'Salamanca', 42, 4),
(4301, 'Ovalle', 43, 4),
(4302, 'Combarbalá', 43, 4),
(4303, 'Monte Patria', 43, 4),
(4304, 'Punitaqui', 43, 4),
(4305, 'Río Hurtado', 43, 4),
(5101, 'Valparaíso', 51, 5),
(5102, 'Casablanca', 51, 5),
(5103, 'Concón', 51, 5),
(5104, 'Juan Fernández', 51, 5),
(5105, 'Puchuncaví', 51, 5),
(5107, 'Quintero', 51, 5),
(5109, 'Viña del Mar', 51, 5),
(5201, 'Isla  de Pascua', 52, 5),
(5301, 'Los Andes', 53, 5),
(5302, 'Calle Larga', 53, 5),
(5303, 'Rinconada', 53, 5),
(5304, 'San Esteban', 53, 5),
(5401, 'La Ligua', 54, 5),
(5402, 'Cabildo', 54, 5),
(5403, 'Papudo', 54, 5),
(5404, 'Petorca', 54, 5),
(5405, 'Zapallar', 54, 5),
(5501, 'Quillota', 55, 5),
(5502, 'Calera', 55, 5),
(5503, 'Hijuelas', 55, 5),
(5504, 'La Cruz', 55, 5),
(5506, 'Nogales', 55, 5),
(5601, 'San Antonio', 56, 5),
(5602, 'Algarrobo', 56, 5),
(5603, 'Cartagena', 56, 5),
(5604, 'El Quisco', 56, 5),
(5605, 'El Tabo', 56, 5),
(5606, 'Santo Domingo', 56, 5),
(5701, 'San Felipe', 57, 5),
(5702, 'Catemu', 57, 5),
(5703, 'Llaillay', 57, 5),
(5704, 'Panquehue', 57, 5),
(5705, 'Putaendo', 57, 5),
(5706, 'Santa María', 57, 5),
(5801, 'Quilpué', 58, 5),
(5802, 'Limache', 58, 5),
(5803, 'Olmué', 58, 5),
(5804, 'Villa Alemana', 58, 5),
(6101, 'Rancagua', 61, 6),
(6102, 'Codegua', 61, 6),
(6103, 'Coinco', 61, 6),
(6104, 'Coltauco', 61, 6),
(6105, 'Doñihue', 61, 6),
(6106, 'Graneros', 61, 6),
(6107, 'Las Cabras', 61, 6),
(6108, 'Machalí', 61, 6),
(6109, 'Malloa', 61, 6),
(6110, 'Mostazal', 61, 6),
(6111, 'Olivar', 61, 6),
(6112, 'Peumo', 61, 6),
(6113, 'Pichidegua', 61, 6),
(6114, 'Quinta de Tilcoco', 61, 6),
(6115, 'Rengo', 61, 6),
(6116, 'Requínoa', 61, 6),
(6117, 'San Vicente', 61, 6),
(6201, 'Pichilemu', 62, 6),
(6202, 'La Estrella', 62, 6),
(6203, 'Litueche', 62, 6),
(6204, 'Marchihue', 62, 6),
(6205, 'Navidad', 62, 6),
(6206, 'Paredones', 62, 6),
(6301, 'San Fernando', 63, 6),
(6302, 'Chépica', 63, 6),
(6303, 'Chimbarongo', 63, 6),
(6304, 'Lolol', 63, 6),
(6305, 'Nancagua', 63, 6),
(6306, 'Palmilla', 63, 6),
(6307, 'Peralillo', 63, 6),
(6308, 'Placilla', 63, 6),
(6309, 'Pumanque', 63, 6),
(6310, 'Santa Cruz', 63, 6),
(7101, 'Talca', 71, 7),
(7102, 'Constitución', 71, 7),
(7103, 'Curepto', 71, 7),
(7104, 'Empedrado', 71, 7),
(7105, 'Maule', 71, 7),
(7106, 'Pelarco', 71, 7),
(7107, 'Pencahue', 71, 7),
(7108, 'Río Claro', 71, 7),
(7109, 'San Clemente', 71, 7),
(7110, 'San Rafael', 71, 7),
(7201, 'Cauquenes', 72, 7),
(7202, 'Chanco', 72, 7),
(7203, 'Pelluhue', 72, 7),
(7301, 'Curicó', 73, 7),
(7302, 'Hualañé', 73, 7),
(7303, 'Licantén', 73, 7),
(7304, 'Molina', 73, 7),
(7305, 'Rauco', 73, 7),
(7306, 'Romeral', 73, 7),
(7307, 'Sagrada Familia', 73, 7),
(7308, 'Teno', 73, 7),
(7309, 'Vichuquén', 73, 7),
(7401, 'Linares', 74, 7),
(7402, 'Colbún', 74, 7),
(7403, 'Longaví', 74, 7),
(7404, 'Parral', 74, 7),
(7405, 'Retiro', 74, 7),
(7406, 'San Javier', 74, 7),
(7407, 'Villa Alegre', 74, 7),
(7408, 'Yerbas Buenas', 74, 7),
(8101, 'Concepción', 81, 8),
(8102, 'Coronel', 81, 8),
(8103, 'Chiguayante', 81, 8),
(8104, 'Florida', 81, 8),
(8105, 'Hualqui', 81, 8),
(8106, 'Lota', 81, 8),
(8107, 'Penco', 81, 8),
(8108, 'San Pedro de la Paz', 81, 8),
(8109, 'Santa Juana', 81, 8),
(8110, 'Talcahuano', 81, 8),
(8111, 'Tomé', 81, 8),
(8112, 'Hualpén', 81, 8),
(8201, 'Lebu', 82, 8),
(8202, 'Arauco', 82, 8),
(8203, 'Cañete', 82, 8),
(8204, 'Contulmo', 82, 8),
(8205, 'Curanilahue', 82, 8),
(8206, 'Los Álamos', 82, 8),
(8207, 'Tirúa', 82, 8),
(8301, 'Los Ángeles', 83, 8),
(8302, 'Antuco', 83, 8),
(8303, 'Cabrero', 83, 8),
(8304, 'Laja', 83, 8),
(8305, 'Mulchén', 83, 8),
(8306, 'Nacimiento', 83, 8),
(8307, 'Negrete', 83, 8),
(8308, 'Quilaco', 83, 8),
(8309, 'Quilleco', 83, 8),
(8310, 'San Rosendo', 83, 8),
(8311, 'Santa Bárbara', 83, 8),
(8312, 'Tucapel', 83, 8),
(8313, 'Yumbel', 83, 8),
(8314, 'Alto Biobío', 83, 8),
(8401, 'Chillán', 84, 8),
(8402, 'Bulnes', 84, 8),
(8403, 'Cobquecura', 84, 8),
(8404, 'Coelemu', 84, 8),
(8405, 'Coihueco', 84, 8),
(8406, 'Chillán Viejo', 84, 8),
(8407, 'El Carmen', 84, 8),
(8408, 'Ninhue', 84, 8),
(8409, 'Ñiquén', 84, 8),
(8410, 'Pemuco', 84, 8),
(8411, 'Pinto', 84, 8),
(8412, 'Portezuelo', 84, 8),
(8413, 'Quillón', 84, 8),
(8414, 'Quirihue', 84, 8),
(8415, 'Ránquil', 84, 8),
(8416, 'San Carlos', 84, 8),
(8417, 'San Fabián', 84, 8),
(8418, 'San Ignacio', 84, 8),
(8419, 'San Nicolás', 84, 8),
(8420, 'Treguaco', 84, 8),
(8421, 'Yungay', 84, 8),
(9101, 'Temuco', 91, 9),
(9102, 'Carahue', 91, 9),
(9103, 'Cunco', 91, 9),
(9104, 'Curarrehue', 91, 9),
(9105, 'Freire', 91, 9),
(9106, 'Galvarino', 91, 9),
(9107, 'Gorbea', 91, 9),
(9108, 'Lautaro', 91, 9),
(9109, 'Loncoche', 91, 9),
(9110, 'Melipeuco', 91, 9),
(9111, 'Nueva Imperial', 91, 9),
(9112, 'Padre Las Casas', 91, 9),
(9113, 'Perquenco', 91, 9),
(9114, 'Pitrufquén', 91, 9),
(9115, 'Pucón', 91, 9),
(9116, 'Saavedra', 91, 9),
(9117, 'Teodoro Schmidt', 91, 9),
(9118, 'Toltén', 91, 9),
(9119, 'Vilcún', 91, 9),
(9120, 'Villarrica', 91, 9),
(9121, 'Cholchol', 91, 9),
(9201, 'Angol', 92, 9),
(9202, 'Collipulli', 92, 9),
(9203, 'Curacautín', 92, 9),
(9204, 'Ercilla', 92, 9),
(9205, 'Lonquimay', 92, 9),
(9206, 'Los Sauces', 92, 9),
(9207, 'Lumaco', 92, 9),
(9208, 'Purén', 92, 9),
(9209, 'Renaico', 92, 9),
(9210, 'Traiguén', 92, 9),
(9211, 'Victoria', 92, 9),
(10101, 'Puerto Montt', 101, 10),
(10102, 'Calbuco', 101, 10),
(10103, 'Cochamó', 101, 10),
(10104, 'Fresia', 101, 10),
(10105, 'Frutillar', 101, 10),
(10106, 'Los Muermos', 101, 10),
(10107, 'Llanquihue', 101, 10),
(10108, 'Maullín', 101, 10),
(10109, 'Puerto Varas', 101, 10),
(10201, 'Castro', 102, 10),
(10202, 'Ancud', 102, 10),
(10203, 'Chonchi', 102, 10),
(10204, 'Curaco de Vélez', 102, 10),
(10205, 'Dalcahue', 102, 10),
(10206, 'Puqueldón', 102, 10),
(10207, 'Queilén', 102, 10),
(10208, 'Quellón', 102, 10),
(10209, 'Quemchi', 102, 10),
(10210, 'Quinchao', 102, 10),
(10301, 'Osorno', 103, 10),
(10302, 'Puerto Octay', 103, 10),
(10303, 'Purranque', 103, 10),
(10304, 'Puyehue', 103, 10),
(10305, 'Río Negro', 103, 10),
(10306, 'San Juan de la Costa', 103, 10),
(10307, 'San Pablo', 103, 10),
(10401, 'Chaitén', 104, 10),
(10402, 'Futaleufú', 104, 10),
(10403, 'Hualaihué', 104, 10),
(10404, 'Palena', 104, 10),
(11101, 'Coihaique', 111, 11),
(11102, 'Lago Verde', 111, 11),
(11201, 'Aisén', 112, 11),
(11202, 'Cisnes', 112, 11),
(11203, 'Guaitecas', 112, 11),
(11301, 'Cochrane', 113, 11),
(11302, 'O\'Higgins', 113, 11),
(11303, 'Tortel', 113, 11),
(11401, 'Chile Chico', 114, 11),
(11402, 'Río Ibáñez', 114, 11),
(12101, 'Punta Arenas', 121, 12),
(12102, 'Laguna Blanca', 121, 12),
(12103, 'Río Verde', 121, 12),
(12104, 'San Gregorio', 121, 12),
(12201, 'Cabo de Hornos', 122, 12),
(12202, 'Antártica', 122, 12),
(12301, 'Porvenir', 123, 12),
(12302, 'Primavera', 123, 12),
(12303, 'Timaukel', 123, 12),
(12401, 'Natales', 124, 12),
(12402, 'Torres del Paine', 124, 12),
(13101, 'Santiago', 131, 13),
(13102, 'Cerrillos', 131, 13),
(13103, 'Cerro Navia', 131, 13),
(13104, 'Conchalí', 131, 13),
(13105, 'El Bosque', 131, 13),
(13106, 'Estación Central', 131, 13),
(13107, 'Huechuraba', 131, 13),
(13108, 'Independencia', 131, 13),
(13109, 'La Cisterna', 131, 13),
(13110, 'La Florida', 131, 13),
(13111, 'La Granja', 131, 13),
(13112, 'La Pintana', 131, 13),
(13113, 'La Reina', 131, 13),
(13114, 'Las Condes', 131, 13),
(13115, 'Lo Barnechea', 131, 13),
(13116, 'Lo Espejo', 131, 13),
(13117, 'Lo Prado', 131, 13),
(13118, 'Macul', 131, 13),
(13119, 'Maipú', 131, 13),
(13120, 'Ñuñoa', 131, 13),
(13121, 'Pedro Aguirre Cerda', 131, 13),
(13122, 'Peñalolén', 131, 13),
(13123, 'Providencia', 131, 13),
(13124, 'Pudahuel', 131, 13),
(13125, 'Quilicura', 131, 13),
(13126, 'Quinta Normal', 131, 13),
(13127, 'Recoleta', 131, 13),
(13128, 'Renca', 131, 13),
(13129, 'San Joaquín', 131, 13),
(13130, 'San Miguel', 131, 13),
(13131, 'San Ramón', 131, 13),
(13132, 'Vitacura', 131, 13),
(13201, 'Puente Alto', 132, 13),
(13202, 'Pirque', 132, 13),
(13203, 'San José de Maipo', 132, 13),
(13301, 'Colina', 133, 13),
(13302, 'Lampa', 133, 13),
(13303, 'Tiltil', 133, 13),
(13401, 'San Bernardo', 134, 13),
(13402, 'Buin', 134, 13),
(13403, 'Calera de Tango', 134, 13),
(13404, 'Paine', 134, 13),
(13501, 'Melipilla', 135, 13),
(13502, 'Alhué', 135, 13),
(13503, 'Curacaví', 135, 13),
(13504, 'María Pinto', 135, 13),
(13505, 'San Pedro', 135, 13),
(13601, 'Talagante', 136, 13),
(13602, 'El Monte', 136, 13),
(13603, 'Isla de Maipo', 136, 13),
(13604, 'Padre Hurtado', 136, 13),
(13605, 'Peñaflor', 136, 13),
(14101, 'Valdivia', 141, 14),
(14102, 'Corral', 141, 14),
(14103, 'Lanco', 141, 14),
(14104, 'Los Lagos', 141, 14),
(14105, 'Máfil', 141, 14),
(14106, 'Mariquina', 141, 14),
(14107, 'Paillaco', 141, 14),
(14108, 'Panguipulli', 141, 14),
(14201, 'La Unión', 142, 14),
(14202, 'Futrono', 142, 14),
(14203, 'Lago Ranco', 142, 14),
(14204, 'Río Bueno', 142, 14),
(15101, 'Arica', 151, 15),
(15102, 'Camarones', 151, 15),
(15201, 'Putre', 152, 15),
(15202, 'General Lagos', 152, 15),
(99999, 'Ignorada', 999, 99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciones`
--

CREATE TABLE `configuraciones` (
  `configuracion_id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `configuraciones`
--

INSERT INTO `configuraciones` (`configuracion_id`, `title`) VALUES
(1, 'CFT TWK');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenidos`
--

CREATE TABLE `contenidos` (
  `contenido_id` int(11) NOT NULL,
  `contenido` text,
  `actividades` text,
  `orden` int(11) DEFAULT NULL,
  `unidad_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `contenidos`
--

INSERT INTO `contenidos` (`contenido_id`, `contenido`, `actividades`, `orden`, `unidad_id`) VALUES
(2, '<p>Introducci&oacute;n a la administraci&oacute;n</p>\r\n\r\n<ul>\r\n	<li>Conceptos de administraci&oacute;n</li>\r\n	<li>Historia de la administraci&oacute;n</li>\r\n	<li>Teor&iacute;a cient&iacute;fica y teor&iacute;a cl&aacute;sica: Fayol&nbsp; y Taylor</li>\r\n	<li>La eficacia y la eficiencia.</li>\r\n	<li>La administraci&oacute;n como t&eacute;cnica, arte o ciencia</li>\r\n	<li>Principios generales de administraci&oacute;n.</li>\r\n	<li>El pensamiento sist&eacute;mico</li>\r\n	<li>Concepto de Direcci&oacute;n.</li>\r\n	<li>Teor&iacute;as del comportamiento humano; estilos de liderazgo.</li>\r\n	<li>La Teor&iacute;a X&nbsp; y la teor&iacute;a Y de Maslow</li>\r\n</ul>\r\n\r\n<p>Nuevos enfoques de la administraci&oacute;n:</p>\r\n\r\n<ul>\r\n	<li>La Reingenier&iacute;a, Calidad Total, Benchmarcking</li>\r\n	<li>Downzising, Outsourcing, Empowerment.</li>\r\n</ul>\r\n\r\n<p>El proceso administrativo:</p>\r\n\r\n<ul>\r\n	<li>Planificar,&nbsp;Objetivos y principios</li>\r\n	<li>Organizar, tipos organizaci&oacute;n, estructura, departamentalizaci&oacute;n,&nbsp;</li>\r\n	<li>Dirigir,&nbsp;Delegaci&oacute;n, descentralizaci&oacute;n, poder formar, poder informal,&nbsp; la motivaci&oacute;n y sus teor&iacute;as.</li>\r\n</ul>\r\n\r\n<p>El proceso de comunicaci&oacute;n en las empresas.</p>\r\n\r\n<p>Control,&nbsp;principios,&nbsp; sus etapas, tipos de control y su nexo con la planificaci&oacute;n.</p>\r\n', '<p>Discusi&oacute;n y trabajo en equipo: en grupo analizar un Caso de estudios.</p>\r\n\r\n<p>Trabajo individual: b&uacute;squeda de informaci&oacute;n sobre los conceptos de la empresa como un sistema.</p>\r\n\r\n<p>Discusi&oacute;n y trabajo en equipo: asociaci&oacute;n de ideas sobre&nbsp; el tipo de empresa.</p>\r\n\r\n<p>Exposici&oacute;n dialogada sobre los criterios de clasificaci&oacute;n de las empresas.</p>\r\n\r\n<p>Trabajo de taller: discusi&oacute;n en grupo sobre &iquest;Cu&aacute;les son los componentes b&aacute;sicos de una empresa?</p>\r\n', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `estudiante_id` int(11) NOT NULL,
  `nombres` varchar(200) DEFAULT NULL,
  `apellidos` varchar(200) DEFAULT NULL,
  `rut` varchar(12) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `direccion` varchar(300) DEFAULT NULL,
  `comuna_id` int(5) NOT NULL DEFAULT '0',
  `celular` int(12) DEFAULT NULL,
  `telefono` int(12) DEFAULT NULL,
  `cohorte` int(4) DEFAULT NULL,
  `carrera_id_FK` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `icons`
--

CREATE TABLE `icons` (
  `id` int(11) NOT NULL,
  `icon` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `icons`
--

INSERT INTO `icons` (`id`, `icon`) VALUES
(1, 'fa-glass'),
(2, 'fa-music'),
(3, 'fa-search'),
(4, 'fa-envelope-o'),
(5, 'fa-heart'),
(6, 'fa-star'),
(7, 'fa-star-o'),
(8, 'fa-user'),
(9, 'fa-film'),
(10, 'fa-th-large'),
(11, 'fa-th'),
(12, 'fa-th-list'),
(13, 'fa-check'),
(14, 'fa-remove'),
(15, 'fa-close'),
(16, 'fa-times'),
(17, 'fa-search-plus'),
(18, 'fa-search-minus'),
(19, 'fa-power-off'),
(20, 'fa-signal'),
(21, 'fa-gear'),
(22, 'fa-cog'),
(23, 'fa-trash-o'),
(24, 'fa-home'),
(25, 'fa-file-o'),
(26, 'fa-clock-o'),
(27, 'fa-road'),
(28, 'fa-download'),
(29, 'fa-arrow-circle-o-do'),
(30, 'fa-arrow-circle-o-up'),
(31, 'fa-inbox'),
(32, 'fa-play-circle-o'),
(33, 'fa-rotate-right'),
(34, 'fa-repeat'),
(35, 'fa-refresh'),
(36, 'fa-list-alt'),
(37, 'fa-lock'),
(38, 'fa-flag'),
(39, 'fa-headphones'),
(40, 'fa-volume-off'),
(41, 'fa-volume-down'),
(42, 'fa-volume-up'),
(43, 'fa-qrcode'),
(44, 'fa-barcode'),
(45, 'fa-tag'),
(46, 'fa-tags'),
(47, 'fa-book'),
(48, 'fa-bookmark'),
(49, 'fa-print f'),
(50, 'fa-camera'),
(51, 'fa-font'),
(52, 'fa-bold'),
(53, 'fa-italic'),
(54, 'fa-text-height'),
(55, 'fa-text-width'),
(56, 'fa-align-left'),
(57, 'fa-align-center'),
(58, 'fa-align-right'),
(59, 'fa-align-justify'),
(60, 'fa-list'),
(61, 'fa-dedent'),
(62, 'fa-outdent'),
(63, 'fa-indent'),
(64, 'fa-video-camera'),
(65, 'fa-photo'),
(66, 'fa-image'),
(67, 'fa-picture-o'),
(68, 'fa-pencil'),
(69, 'fa-map-marker'),
(70, 'fa-adjust'),
(71, 'fa-tint'),
(72, 'fa-edit'),
(73, 'fa-pencil-square-o'),
(74, 'fa-share-square-o'),
(75, 'fa-check-square-o'),
(76, 'fa-arrows'),
(77, 'fa-step-backward'),
(78, 'fa-fast-backward'),
(79, 'fa-backward'),
(80, 'fa-play'),
(81, 'fa-pause'),
(82, 'fa-stop'),
(83, 'fa-forward'),
(84, 'fa-fast-forward'),
(85, 'fa-step-forward'),
(86, 'fa-eject'),
(87, 'fa-chevron-left'),
(88, 'fa-chevron-right'),
(89, 'fa-plus-circle'),
(90, 'fa-minus-circle'),
(91, 'fa-times-circle'),
(92, 'fa-check-circle'),
(93, 'fa-question-circle'),
(94, 'fa-info-circle'),
(95, 'fa-crosshairs'),
(96, 'fa-times-circle-o'),
(97, 'fa-check-circle-o'),
(98, 'fa-ban'),
(99, 'fa-arrow-left'),
(100, 'fa-arrow-right'),
(101, 'fa-arrow-up'),
(102, 'fa-arrow-down'),
(103, 'fa-mail-forward'),
(104, 'fa-share'),
(105, 'fa-expand'),
(106, 'fa-compress'),
(107, 'fa-plus'),
(108, 'fa-minus'),
(109, 'fa-asterisk'),
(110, 'fa-exclamation-circle'),
(111, 'fa-gift'),
(112, 'fa-leaf'),
(113, 'fa-fire'),
(114, 'fa-eye'),
(115, 'fa-eye-slash'),
(116, 'fa-warning'),
(117, 'fa-exclamation-triangle'),
(118, 'fa-plane'),
(119, 'fa-calendar'),
(120, 'fa-random'),
(121, 'fa-comment'),
(122, 'fa-magnet'),
(123, 'fa-chevron-up'),
(124, 'fa-chevron-down'),
(125, 'fa-retweet'),
(126, 'fa-shopping-cart'),
(127, 'fa-folder'),
(128, 'fa-folder-open'),
(129, 'fa-arrows-v'),
(130, 'fa-arrows-h'),
(131, 'fa-bar-chart-o'),
(132, 'fa-bar-chart'),
(133, 'fa-twitter-square'),
(134, 'fa-facebook-square'),
(135, 'fa-camera-retro'),
(136, 'fa-key'),
(137, 'fa-gears'),
(138, 'fa-cogs'),
(139, 'fa-comments'),
(140, 'fa-thumbs-o-up'),
(141, 'fa-thumbs-o-down'),
(142, 'fa-star-half'),
(143, 'fa-heart-o'),
(144, 'fa-sign-out'),
(145, 'fa-linkedin-square'),
(146, 'fa-thumb-tack'),
(147, 'fa-external-link'),
(148, 'fa-sign-in'),
(149, 'fa-trophy'),
(150, 'fa-github-square'),
(151, 'fa-upload'),
(152, 'fa-lemon-o'),
(153, 'fa-phone'),
(154, 'fa-square-o'),
(155, 'fa-bookmark-o'),
(156, 'fa-phone-square'),
(157, 'fa-twitter'),
(158, 'fa-facebook-f'),
(159, 'fa-facebook'),
(160, 'fa-github'),
(161, 'fa-unlock'),
(162, 'fa-credit-card'),
(163, 'fa-rss'),
(164, 'fa-hdd-o'),
(165, 'fa-bullhorn'),
(166, 'fa-bell'),
(167, 'fa-certificate'),
(168, 'fa-hand-o-right'),
(169, 'fa-hand-o-left'),
(170, 'fa-hand-o-up'),
(171, 'fa-hand-o-down'),
(172, 'fa-arrow-circle-left'),
(173, 'fa-arrow-circle-righ'),
(174, 'fa-arrow-circle-up'),
(175, 'fa-arrow-circle-down'),
(176, 'fa-globe'),
(177, 'fa-wrench'),
(178, 'fa-tasks'),
(179, 'fa-filter'),
(180, 'fa-briefcase'),
(181, 'fa-arrows-alt'),
(182, 'fa-group'),
(183, 'fa-users'),
(184, 'fa-chain'),
(185, 'fa-link'),
(186, 'fa-cloud'),
(187, 'fa-flask'),
(188, 'fa-cut'),
(189, 'fa-scissors'),
(190, 'fa-copy'),
(191, 'fa-files-o'),
(192, 'fa-paperclip'),
(193, 'fa-save'),
(194, 'fa-floppy-o'),
(195, 'fa-square'),
(196, 'fa-navicon'),
(197, 'fa-reorder'),
(198, 'fa-bars'),
(199, 'fa-list-ul'),
(200, 'fa-list-ol'),
(201, 'fa-strikethrough'),
(202, 'fa-underline'),
(203, 'fa-table'),
(204, 'fa-magic'),
(205, 'fa-truck'),
(206, 'fa-pinterest'),
(207, 'fa-pinterest-square'),
(208, 'fa-google-plus-squar'),
(209, 'fa-google-plus'),
(210, 'fa-money'),
(211, 'fa-caret-down'),
(212, 'fa-caret-up'),
(213, 'fa-caret-left'),
(214, 'fa-caret-right'),
(215, 'fa-columns'),
(216, 'fa-unsorted'),
(217, 'fa-sort'),
(218, 'fa-sort-down'),
(219, 'fa-sort-desc'),
(220, 'fa-sort-up'),
(221, 'fa-sort-asc'),
(222, 'fa-envelope'),
(223, 'fa-linkedin'),
(224, 'fa-rotate-left'),
(225, 'fa-undo'),
(226, 'fa-legal'),
(227, 'fa-gavel'),
(228, 'fa-dashboard'),
(229, 'fa-tachometer'),
(230, 'fa-comment-o'),
(231, 'fa-comments-o'),
(232, 'fa-flash'),
(233, 'fa-bolt'),
(234, 'fa-sitemap'),
(235, 'fa-umbrella'),
(236, 'fa-paste'),
(237, 'fa-clipboard'),
(238, 'fa-lightbulb-o'),
(239, 'fa-exchange'),
(240, 'fa-cloud-download'),
(241, 'fa-cloud-upload'),
(242, 'fa-user-md'),
(243, 'fa-stethoscope'),
(244, 'fa-suitcase'),
(245, 'fa-bell-o'),
(246, 'fa-coffee'),
(247, 'fa-cutlery'),
(248, 'fa-file-text-o'),
(249, 'fa-building-o'),
(250, 'fa-hospital-o'),
(251, 'fa-ambulance'),
(252, 'fa-medkit'),
(253, 'fa-fighter-jet'),
(254, 'fa-beer'),
(255, 'fa-h-square'),
(256, 'fa-plus-square'),
(257, 'fa-angle-double-left'),
(258, 'fa-angle-double-righ'),
(259, 'fa-angle-double-up'),
(260, 'fa-angle-double-down'),
(261, 'fa-angle-left'),
(262, 'fa-angle-right'),
(263, 'fa-angle-up'),
(264, 'fa-angle-down'),
(265, 'fa-desktop'),
(266, 'fa-laptop'),
(267, 'fa-tablet'),
(268, 'fa-mobile-phone'),
(269, 'fa-mobile'),
(270, 'fa-circle-o'),
(271, 'fa-quote-left'),
(272, 'fa-quote-right'),
(273, 'fa-spinner'),
(274, 'fa-circle'),
(275, 'fa-mail-reply'),
(276, 'fa-reply'),
(277, 'fa-github-alt'),
(278, 'fa-folder-o'),
(279, 'fa-folder-open-o'),
(280, 'fa-smile-o'),
(281, 'fa-frown-o'),
(282, 'fa-meh-o'),
(283, 'fa-gamepad'),
(284, 'fa-keyboard-o'),
(285, 'fa-flag-o'),
(286, 'fa-flag-checkered'),
(287, 'fa-terminal'),
(288, 'fa-code'),
(289, 'fa-mail-reply-all'),
(290, 'fa-reply-all'),
(291, 'fa-star-half-empty'),
(292, 'fa-star-half-full'),
(293, 'fa-star-half-o'),
(294, 'fa-location-arrow'),
(295, 'fa-crop'),
(296, 'fa-code-fork'),
(297, 'fa-unlink'),
(298, 'fa-chain-broken'),
(299, 'fa-question'),
(300, 'fa-info'),
(301, 'fa-exclamation'),
(302, 'fa-superscript'),
(303, 'fa-subscript'),
(304, 'fa-eraser'),
(305, 'fa-puzzle-piece'),
(306, 'fa-microphone'),
(307, 'fa-microphone-slash'),
(308, 'fa-shield'),
(309, 'fa-calendar-o'),
(310, 'fa-fire-extinguisher'),
(311, 'fa-rocket'),
(312, 'fa-maxcdn'),
(313, 'fa-chevron-circle-le'),
(314, 'fa-chevron-circle-ri'),
(315, 'fa-chevron-circle-up'),
(316, 'fa-chevron-circle-do'),
(317, 'fa-html5'),
(318, 'fa-css3'),
(319, 'fa-anchor'),
(320, 'fa-unlock-alt'),
(321, 'fa-bullseye'),
(322, 'fa-ellipsis-h'),
(323, 'fa-ellipsis-v'),
(324, 'fa-rss-square'),
(325, 'fa-play-circle'),
(326, 'fa-ticket'),
(327, 'fa-minus-square'),
(328, 'fa-minus-square-o'),
(329, 'fa-level-up'),
(330, 'fa-level-down'),
(331, 'fa-check-square'),
(332, 'fa-pencil-square'),
(333, 'fa-external-link-squ'),
(334, 'fa-share-square'),
(335, 'fa-compass'),
(336, 'fa-toggle-down'),
(337, 'fa-caret-square-o-do'),
(338, 'fa-toggle-up'),
(339, 'fa-caret-square-o-up'),
(340, 'fa-toggle-right'),
(341, 'fa-caret-square-o-ri'),
(342, 'fa-euro'),
(343, 'fa-eur'),
(344, 'fa-gbp'),
(345, 'fa-dollar'),
(346, 'fa-usd'),
(347, 'fa-rupee'),
(348, 'fa-inr'),
(349, 'fa-cny'),
(350, 'fa-rmb'),
(351, 'fa-yen'),
(352, 'fa-jpy'),
(353, 'fa-ruble'),
(354, 'fa-rouble'),
(355, 'fa-rub'),
(356, 'fa-won'),
(357, 'fa-krw'),
(358, 'fa-bitcoin'),
(359, 'fa-btc'),
(360, 'fa-file'),
(361, 'fa-file-text'),
(362, 'fa-sort-alpha-asc'),
(363, 'fa-sort-alpha-desc'),
(364, 'fa-sort-amount-asc'),
(365, 'fa-sort-amount-desc'),
(366, 'fa-sort-numeric-asc'),
(367, 'fa-sort-numeric-desc'),
(368, 'fa-thumbs-up'),
(369, 'fa-thumbs-down'),
(370, 'fa-youtube-square'),
(371, 'fa-youtube'),
(372, 'fa-xing'),
(373, 'fa-xing-square'),
(374, 'fa-youtube-play'),
(375, 'fa-dropbox'),
(376, 'fa-stack-overflow'),
(377, 'fa-instagram'),
(378, 'fa-flickr'),
(379, 'fa-adn'),
(380, 'fa-bitbucket'),
(381, 'fa-bitbucket-square'),
(382, 'fa-tumblr'),
(383, 'fa-tumblr-square'),
(384, 'fa-long-arrow-down'),
(385, 'fa-long-arrow-up'),
(386, 'fa-long-arrow-left'),
(387, 'fa-long-arrow-right'),
(388, 'fa-apple'),
(389, 'fa-windows'),
(390, 'fa-android'),
(391, 'fa-linux'),
(392, 'fa-dribbble'),
(393, 'fa-skype'),
(394, 'fa-foursquare'),
(395, 'fa-trello'),
(396, 'fa-female'),
(397, 'fa-male'),
(398, 'fa-gittip'),
(399, 'fa-gratipay'),
(400, 'fa-sun-o'),
(401, 'fa-moon-o'),
(402, 'fa-archive'),
(403, 'fa-bug'),
(404, 'fa-vk'),
(405, 'fa-weibo'),
(406, 'fa-renren'),
(407, 'fa-pagelines'),
(408, 'fa-stack-exchange'),
(409, 'fa-arrow-circle-o-ri'),
(410, 'fa-arrow-circle-o-le'),
(411, 'fa-toggle-left'),
(412, 'fa-caret-square-o-le'),
(413, 'fa-dot-circle-o'),
(414, 'fa-wheelchair'),
(415, 'fa-vimeo-square'),
(416, 'fa-turkish-lira'),
(417, 'fa-try'),
(418, 'fa-plus-square-o'),
(419, 'fa-space-shuttle'),
(420, 'fa-slack'),
(421, 'fa-envelope-square'),
(422, 'fa-wordpress'),
(423, 'fa-openid'),
(424, 'fa-institution'),
(425, 'fa-bank'),
(426, 'fa-university'),
(427, 'fa-mortar-board'),
(428, 'fa-graduation-cap'),
(429, 'fa-yahoo'),
(430, 'fa-google'),
(431, 'fa-reddit'),
(432, 'fa-reddit-square'),
(433, 'fa-stumbleupon-circl'),
(434, 'fa-stumbleupon'),
(435, 'fa-delicious'),
(436, 'fa-digg'),
(437, 'fa-pied-piper'),
(438, 'fa-pied-piper-alt'),
(439, 'fa-drupal'),
(440, 'fa-joomla'),
(441, 'fa-language'),
(442, 'fa-fax'),
(443, 'fa-building'),
(444, 'fa-child'),
(445, 'fa-paw'),
(446, 'fa-spoon'),
(447, 'fa-cube'),
(448, 'fa-cubes'),
(449, 'fa-behance'),
(450, 'fa-behance-square'),
(451, 'fa-steam'),
(452, 'fa-steam-square'),
(453, 'fa-recycle'),
(454, 'fa-automobile'),
(455, 'fa-car'),
(456, 'fa-cab'),
(457, 'fa-taxi'),
(458, 'fa-tree'),
(459, 'fa-spotify'),
(460, 'fa-deviantart'),
(461, 'fa-soundcloud'),
(462, 'fa-database'),
(463, 'fa-file-pdf-o'),
(464, 'fa-file-word-o'),
(465, 'fa-file-excel-o'),
(466, 'fa-file-powerpoint-o'),
(467, 'fa-file-photo-o'),
(468, 'fa-file-picture-o'),
(469, 'fa-file-image-o'),
(470, 'fa-file-zip-o'),
(471, 'fa-file-archive-o'),
(472, 'fa-file-sound-o'),
(473, 'fa-file-audio-o'),
(474, 'fa-file-movie-o'),
(475, 'fa-file-video-o'),
(476, 'fa-file-code-o'),
(477, 'fa-vine'),
(478, 'fa-codepen'),
(479, 'fa-jsfiddle'),
(480, 'fa-life-bouy'),
(481, 'fa-life-buoy'),
(482, 'fa-life-saver'),
(483, 'fa-support'),
(484, 'fa-life-ring'),
(485, 'fa-circle-o-notch'),
(486, 'fa-ra'),
(487, 'fa-rebel'),
(488, 'fa-ge'),
(489, 'fa-empire'),
(490, 'fa-git-square'),
(491, 'fa-git'),
(492, 'fa-hacker-news'),
(493, 'fa-tencent-weibo'),
(494, 'fa-qq'),
(495, 'fa-wechat'),
(496, 'fa-weixin'),
(497, 'fa-send'),
(498, 'fa-paper-plane'),
(499, 'fa-send-o'),
(500, 'fa-paper-plane-o'),
(501, 'fa-history'),
(502, 'fa-genderless'),
(503, 'fa-circle-thin'),
(504, 'fa-header'),
(505, 'fa-paragraph'),
(506, 'fa-sliders'),
(507, 'fa-share-alt'),
(508, 'fa-share-alt-square'),
(509, 'fa-bomb'),
(510, 'fa-soccer-ball-o'),
(511, 'fa-futbol-o'),
(512, 'fa-tty'),
(513, 'fa-binoculars'),
(514, 'fa-plug'),
(515, 'fa-slideshare'),
(516, 'fa-twitch'),
(517, 'fa-yelp'),
(518, 'fa-newspaper-o'),
(519, 'fa-wifi'),
(520, 'fa-calculator'),
(521, 'fa-paypal'),
(522, 'fa-google-wallet'),
(523, 'fa-cc-visa'),
(524, 'fa-cc-mastercard'),
(525, 'fa-cc-discover'),
(526, 'fa-cc-amex'),
(527, 'fa-cc-paypal'),
(528, 'fa-cc-stripe'),
(529, 'fa-bell-slash'),
(530, 'fa-bell-slash-o'),
(531, 'fa-trash'),
(532, 'fa-copyright'),
(533, 'fa-at'),
(534, 'fa-eyedropper'),
(535, 'fa-paint-brush'),
(536, 'fa-birthday-cake'),
(537, 'fa-area-chart'),
(538, 'fa-pie-chart'),
(539, 'fa-line-chart'),
(540, 'fa-lastfm'),
(541, 'fa-lastfm-square'),
(542, 'fa-toggle-off'),
(543, 'fa-toggle-on'),
(544, 'fa-bicycle'),
(545, 'fa-bus'),
(546, 'fa-ioxhost'),
(547, 'fa-angellist'),
(548, 'fa-cc za'),
(549, 'fa-shekel'),
(550, 'fa-sheqel'),
(551, 'fa-ils'),
(552, 'fa-meanpath'),
(553, 'fa-buysellads'),
(554, 'fa-connectdevelop'),
(555, 'fa-dashcube'),
(556, 'fa-forumbee'),
(557, 'fa-leanpub'),
(558, 'fa-sellsy'),
(559, 'fa-shirtsinbulk'),
(560, 'fa-simplybuilt'),
(561, 'fa-skyatlas'),
(562, 'fa-cart-plus'),
(563, 'fa-cart-arrow-down'),
(564, 'fa-diamond'),
(565, 'fa-ship'),
(566, 'fa-user-secret'),
(567, 'fa-motorcycle'),
(568, 'fa-street-view'),
(569, 'fa-heartbeat'),
(570, 'fa-venus'),
(571, 'fa-mars'),
(572, 'fa-mercury'),
(573, 'fa-transgender'),
(574, 'fa-transgender-alt'),
(575, 'fa-venus-double'),
(576, 'fa-mars-double'),
(577, 'fa-venus-mars'),
(578, 'fa-mars-stroke'),
(579, 'fa-mars-stroke-v'),
(580, 'fa-mars-stroke-h'),
(581, 'fa-neuter'),
(582, 'fa-facebook-official'),
(583, 'fa-pinterest-p'),
(584, 'fa-whatsapp'),
(585, 'fa-server'),
(586, 'fa-user-plus'),
(587, 'fa-user-times'),
(588, 'fa-hotel'),
(589, 'fa-bed'),
(590, 'fa-viacoin'),
(591, 'fa-train'),
(592, 'fa-subway'),
(593, 'fa-medium');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `caption` varchar(60) NOT NULL,
  `link` varchar(255) NOT NULL,
  `target` varchar(20) NOT NULL,
  `nivel_minimo` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `icono` varchar(255) DEFAULT NULL,
  `orden` int(11) NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '0',
  `separador` tinyint(1) NOT NULL DEFAULT '0',
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT 'area donde se muestra (backend/frontend/clientes/app)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Menu';

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`menu_id`, `caption`, `link`, `target`, `nivel_minimo`, `parent_id`, `icono`, `orden`, `activo`, `separador`, `area_id`) VALUES
(1, 'Raiz', '#', '_self', 0, 1, NULL, 0, 1, 0, 1),
(4, 'Pérdidas por Tratamiento', 'calculadora_perdida_tratamiento.php', '_self', 1, 3, 'fa fa-calculator', 21, 1, 0, 2),
(5, 'Panel de Control', '#', '_self', 10, 1, 'fa fa-cog', 1000, 1, 0, 1),
(7, 'Editar Menu de Usuarios', 'adm_menu.php?s_area_id=2', '_self', 15, 5, 'fa-cog', 1510, 1, 0, 1),
(13, 'Herramientas', '#', '_self', 1, 1, 'fa fa-cog', 3000, 1, 0, 2),
(14, 'Editar Menu de Administradores', 'adm_menu.php?s_area_id=1', '_self', 10, 5, 'fa-cog', 1520, 1, 0, 1),
(15, 'Informes', '#', '_self', 1, 1, 'fa fa-file-o', 4000, 1, 0, 2),
(19, 'Cuenta', '#', '_self', 1, 1, 'fa-briefcase', 1000, 1, 0, 3),
(22, 'Lorem Ipsum', '#', '_self', 1, 1, 'fa-american-sign-language-interpreting', 100, 1, 0, 3),
(23, 'Usuarios', 'usuarios.php', '_self', 10, 5, 'fa-users', 1100, 1, 0, 1),
(24, '-', '#', '_self', 10, 5, NULL, 1500, 1, 0, 1),
(25, 'Niveles', 'niveles.php', '_self', 15, 5, 'fa-bars', 1450, 1, 0, 1),
(27, 'Carreras TWK', 'carreras.php', '_self', 2, 1, 'fa-graduation-cap', 100, 1, 0, 1),
(28, 'Sedes', 'sedes.php', '_self', 2, 5, 'fa-building', 1050, 1, 0, 1),
(29, 'Tipo de Competencia (Unidad de Aprendizaje)', 'competencias_tipo.php', '_self', 10, 5, 'fa-ellipsis-h', 1460, 1, 0, 1),
(30, 'Bibliografias', 'bibliografias.php', '_self', 10, 1, 'fa-archive', 900, 1, 0, 1),
(31, 'Administración', '#', '_self', 5, 1, NULL, 50, 1, 0, 1),
(32, 'Consulta de Documentos Institucionales', 'documentos.php', '_self', 5, 31, NULL, 50, 1, 0, 1),
(33, 'Listado de Estudiantes', 'estudiantes.php', '_self', 5, 31, NULL, 55, 1, 0, 1),
(34, 'Actas', 'actas.php', '_self', 5, 31, NULL, 45, 1, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_pos`
--

CREATE TABLE `menu_pos` (
  `menu_pos_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Posición dentro de la pagina para mostrar el menu';

--
-- Volcado de datos para la tabla `menu_pos`
--

INSERT INTO `menu_pos` (`menu_pos_id`, `nombre`) VALUES
(1, 'Top'),
(2, 'Body');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_pos_menu`
--

CREATE TABLE `menu_pos_menu` (
  `menu_pos_menu_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `menu_pos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que guarda que posiciones ocupa cada item de menu';

--
-- Volcado de datos para la tabla `menu_pos_menu`
--

INSERT INTO `menu_pos_menu` (`menu_pos_menu_id`, `menu_id`, `menu_pos_id`) VALUES
(5, 1, 1),
(8, 5, 1),
(10, 13, 1),
(36, 19, 1),
(37, 19, 2),
(38, 22, 2),
(39, 4, 1),
(60, 15, 1),
(86, 24, 1),
(88, 7, 1),
(89, 23, 1),
(90, 14, 1),
(99, 25, 1),
(100, 29, 1),
(103, 28, 1),
(104, 27, 1),
(105, 30, 1),
(107, 32, 1),
(108, 33, 1),
(109, 31, 1),
(111, 34, 1),
(112, 34, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `modulo_id` int(11) NOT NULL,
  `nombre` varchar(300) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `carrera_id` int(11) NOT NULL DEFAULT '0',
  `descripcion` text,
  `componente_tecnico` text COMMENT 'Competencias Tecnicas',
  `horas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`modulo_id`, `nombre`, `codigo`, `carrera_id`, `descripcion`, `componente_tecnico`, `horas`) VALUES
(1, 'Administración en la Empresas', 'MOD1', 2, '<p>Administración en la Empresas</p>\n', '<p>Manejar las actividades propias de la función administrativa, e impulsar el desempeño organizacional reconociendo el aporte del recurso humano a la competitividad de la empresa de diversos tipos y tamaños.</p>\n', 288),
(2, 'Ciencias Básicas', 'MOD2', 2, '<p>Ciencias Básicas</p>\n', '<p>Utilizar la estadística y matemática financiera en la resolución de problemas propios de la administraci&oacute;n Utilizar la estad&iacute;stica y matem&aacute;tica financiera en la resoluci&oacute;n de problemas propios de la administraci&oacute;n.</p>\n', 108),
(3, 'Tecnologías de la Información', 'MOD3', 2, '<p>Tecnologías de la Información</p>\n', '<p>Manejar Sistema de información contable correspondientes a las necesidades administrativas de cada área de la empresa, para facilitar sus funciones de planificación, control y toma de decisiones.</p>\n', 126),
(4, 'Gestión Contable', 'MOD4', 2, '<p>Gestión Contable</p>\n', 'Manejar Sistema de información contable correspondientes a las necesidades administrativas de cada Área de la empresa, para facilitar sus  funciones de planificación, control y toma de decisiones.', 288),
(5, 'Gestión Financiera', 'MOD5', 2, '<p>Gestión Financiera</p>\n', 'Colaborar en la ejecución y apoyo  de operaciones  comerciales y financieras  para el normal funcionamiento de la organización y su mejora continua..\n', 216),
(6, 'Gestión Tributaria', 'MOD6', 2, '<p>Gestión Tributaria</p>\n', '<p>Manejar y aplicar conceptualización propia de la legislación tributaria para orientar responsablemente la tributación de la empresa.</p>\n', 144),
(7, 'Prevención de Riesgos Laborales y Seguridad Social', 'MOD7', 2, '<p>Prevención de Riesgos Laborales y Seguridad Social</p>\n', '<p>Manejar y aplicar técnicas de prevención de riesgos laborales para reducir las situaciones de riesgo e impulsar ambientes laborales estables.</p>\n', 54),
(8, 'Competencias de Empleabilidad', 'MOD8', 2, '<p>Competencias de Empleabilidad</p>\r\n', 'Capacidad para adaptarse y desempeñarse en los diferentes campos laborales referidos a la administración de empresas', 324),
(9, 'Pre Práctica y Práctica Profesional', 'MOD9', 2, '<p>Pre Práctica y Práctica Profesional</p>\n', '<p>Relacionar y aplicar conceptos de la Administración de empresas en un contexto real, demostrando en forma teórica y práctica las competencias adquiridas.</p>\n', 454);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

CREATE TABLE `niveles` (
  `nivel_id` int(11) NOT NULL,
  `nom_nivel` varchar(50) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Niveles de Acceso de los Usuarios';

--
-- Volcado de datos para la tabla `niveles`
--

INSERT INTO `niveles` (`nivel_id`, `nom_nivel`, `visible`) VALUES
(1, 'Usuario Básico', 1),
(2, 'Usuario Avanzado', 1),
(5, 'Consultor', 1),
(10, 'Administrador', 1),
(15, 'Super Administrador', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prerrequisitos`
--

CREATE TABLE `prerrequisitos` (
  `prerrequisito_id` int(11) NOT NULL,
  `unidad_id` int(11) NOT NULL DEFAULT '0',
  `unidad_prerrequisito` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `provincia_id` int(3) NOT NULL,
  `nombre` varchar(17) DEFAULT NULL,
  `region_id` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`provincia_id`, `nombre`, `region_id`) VALUES
(11, 'Iquique  ', 1),
(14, 'Tamarugal', 1),
(21, 'Antofagasta', 2),
(22, 'El Loa', 2),
(23, 'Tocopilla  ', 2),
(31, 'Copiapó  ', 3),
(32, 'Chañaral  ', 3),
(33, 'Huasco', 3),
(41, 'Elqui', 4),
(42, 'Choapa', 4),
(43, 'Limari', 4),
(51, 'Valparaíso  ', 5),
(52, 'Isla de Pascua  ', 5),
(53, 'Los Andes  ', 5),
(54, 'Petorca', 5),
(55, 'Quillota  ', 5),
(56, 'San Antonio  ', 5),
(57, 'San Felipe  ', 5),
(58, 'Marga Marga', 5),
(61, 'Cachapoal', 6),
(62, 'Cardenal Caro', 6),
(63, 'Colchagua', 6),
(71, 'Talca', 7),
(72, 'Cauquenes', 7),
(73, 'Curico', 7),
(74, 'Linares  ', 7),
(81, 'Concepción  ', 8),
(82, 'Arauco', 8),
(83, 'Bío- Bío', 8),
(84, 'Ñuble', 8),
(91, 'Cautín', 9),
(92, 'Malleco', 9),
(101, 'Llanquihue', 10),
(102, 'Chiloe', 10),
(103, 'Osorno  ', 10),
(104, 'Palena', 10),
(111, 'Coihaique  ', 11),
(112, 'Aisén  ', 11),
(113, 'Capitan Prat', 11),
(114, 'General Carrera', 11),
(121, 'Magallanes', 12),
(122, 'Antártica Chilena', 12),
(123, 'Tierra del Fuego', 12),
(124, 'Ultima Esperanza', 12),
(131, 'Santiago  ', 13),
(132, 'Cordillera', 13),
(133, 'Chacabuco', 13),
(134, 'Maipo', 13),
(135, 'Melipilla', 13),
(136, 'Talagante  ', 13),
(141, 'Valdivia  ', 14),
(142, 'Ranco', 14),
(151, 'Arica  ', 15),
(152, 'Parinacota', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revisiones`
--

CREATE TABLE `revisiones` (
  `revision_id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `responsable` int(11) DEFAULT NULL,
  `observaciones` text,
  `carrera_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `sede_id` int(11) NOT NULL,
  `nombre` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`sede_id`, `nombre`) VALUES
(1, 'Temuco'),
(2, 'Angol');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `unidad_id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL DEFAULT '0',
  `competencia_tipo_id` int(11) NOT NULL DEFAULT '0',
  `codigo` varchar(300) DEFAULT NULL,
  `nombre` varchar(300) DEFAULT NULL,
  `descripcion` text,
  `capacidades` text,
  `horas_teoricas` int(11) DEFAULT NULL,
  `horas_practicas` int(11) DEFAULT NULL,
  `estrategia` text,
  `evaluacion` text,
  `metodologia` text,
  `observaciones` text,
  `ap_s` text,
  `ap_s_ce_s` text,
  `ap_s_ce_sh` text,
  `ap_s_ce_ss` text,
  `ap_sh` text,
  `ap_sh_ce_s` text,
  `ap_sh_ce_sh` text,
  `ap_sh_ce_ss` text,
  `ap_ss` text,
  `ap_ss_ce_s` text,
  `ap_ss_ce_sh` text,
  `ap_ss_ce_ss` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`unidad_id`, `modulo_id`, `competencia_tipo_id`, `codigo`, `nombre`, `descripcion`, `capacidades`, `horas_teoricas`, `horas_practicas`, `estrategia`, `evaluacion`, `metodologia`, `observaciones`, `ap_s`, `ap_s_ce_s`, `ap_s_ce_sh`, `ap_s_ce_ss`, `ap_sh`, `ap_sh_ce_s`, `ap_sh_ce_sh`, `ap_sh_ce_ss`, `ap_ss`, `ap_ss_ce_s`, `ap_ss_ce_sh`, `ap_ss_ce_ss`) VALUES
(1, 1, 1, 'ADE1M1ADG', 'Administración General', NULL, '<p>Colaborar en la organizaci&oacute;n de la funci&oacute;n administrativa, para el futuro desempe&ntilde;o de la organizaci&oacute;n y decidir sobre las tareas y los recursos necesarios para alcanzar los objetivos propuestos</p>', 29, 43, '<p><strong>M&eacute;todos vinculados al &ldquo;Saber&rdquo;</strong></p><p>En relaci&oacute;n al saber&nbsp; se utilizar&aacute;n los siguientes m&eacute;todos:&nbsp;</p><p>Expositivos:</p><ul><li>Exposici&oacute;n Magistral - Presentaciones del docente de la conceptualizaci&oacute;n del m&oacute;dulo cy de su aplicaci&oacute;n a situaciones</li></ul><p>Discusi&oacute;n y trabajo en equipo:</p><ul><li>Visitas a terreno, foro de discusi&oacute;n.</li><li>Debates en grupo para compartir experiencias e ideas.</li></ul><p>Trabajo individual:</p><ul><li>Investigaci&oacute;n bibliogr&aacute;fica</li><li>B&uacute;squeda de informaci&oacute;n</li></ul><p>Verificaci&oacute;n escrita del saber en el contexto de ex&aacute;menes.</p><p><strong>Problematizaci&oacute;n.</strong></p><p>Como Aplicamos estrategias y m&eacute;todos educativos a la resoluci&oacute;n de problemas del m&oacute;dulo.</p><p><strong>M&eacute;todos vinculados al &ldquo;Saber Hacer&rdquo;</strong></p><p>A Continuaci&oacute;n se presenta una serie de herramientas&nbsp; a desarrollar con los estudiantes para aplicar la&nbsp; conceptualizaci&oacute;n del m&oacute;dulo y de esta manera facilitar el aprendizaje de los estudiantes</p><ul><li>Ejercicios en laboratorios.</li><li>Trabajos de taller.</li><li>Ejercicios en aula.</li><li>Ejercicios de simulaci&oacute;n con los computadores.</li><li>Trabajos en grupo.</li><li>Escenificaci&oacute;n de contexto educativo</li></ul><p><strong>M&eacute;todos vinculados al &ldquo;Saber ser&rdquo;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></p><p>Se basar&aacute; en m&eacute;todos expositivos como exposici&oacute;n dialogada, m&eacute;todo interrogativo, desarrollar discusiones&nbsp; y trabajo en equipo:</p><ul><li>Juegos de roles</li><li>Asociaci&oacute;n de ideas</li><li>Foro de discusi&oacute;n</li><li>Caso de estudio</li><li>Juegos</li></ul><p>Y desarrollo de Trabajo individual como:</p><ul><li>Investigaci&oacute;n bibliogr&aacute;fica.</li><li>B&uacute;squeda de informaci&oacute;n</li></ul><p><strong>Uso de Plataforma Moodle:</strong></p><p>Programa, contenidos, Actividades a desarrollar con los estudiantes, planificaci&oacute;n docente ( foros, tareas, controles)</p>', '<p><strong>Evaluaci&oacute;n: </strong></p><p>Existir&aacute;n tres tipos de evaluaciones para los&nbsp; m&oacute;dulos&nbsp; unidades de aprendizaje:</p><p><strong>&nbsp;a)&nbsp; Diagn&oacute;stica</strong>: Se administra al inicio del per&iacute;odo acad&eacute;mico y permite identificar las conductas de entrada de los estudiantes. La calificaci&oacute;n obtenida no incidir&aacute; en el promedio final.</p><p><strong>b)&nbsp; Formativa:</strong> Dar&aacute; cuenta del estado de avance del proceso formativo, con el fin de identificar los aspectos d&eacute;biles necesarios de reforzar. La calificaci&oacute;n obtenida no incidir&aacute; en el promedio final.</p><p><strong>c)&nbsp; Sumativa</strong>: Dar&aacute; cuenta del resultado de la evaluaci&oacute;n o nivel de logro de los aprendizajes esperados, expresados en una calificaci&oacute;n que incide en la nota final.</p><p>El primer&nbsp; d&iacute;a de clases se realizar&aacute;&nbsp; una evaluaci&oacute;n diagn&oacute;stica, con el fin determinar las competencias de entrada y disponer de referencia comparativa despu&eacute;s de la formaci&oacute;n, para efectos de analizar el real logro alcanzado por los estudiantes a partir de su participaci&oacute;n en el m&oacute;dulo.</p><p>Se efectuar&aacute;n tantas evaluaciones como sean necesarias y se organizar&aacute;n como m&iacute;nimo:</p><p><strong>HR. MODULOS</strong></p><p><strong>EVALUACI&Oacute;N TEORICA</strong></p><p><strong>EVALUACI&Oacute;N PR&Aacute;CTICA</strong></p><p><strong>36</strong></p><p><strong>1</strong></p><p><strong>1</strong></p><p><strong>54</strong></p><p><strong>1</strong></p><p><strong>2</strong></p><p><strong>72</strong></p><p><strong>2</strong></p><p><strong>2</strong></p><p><strong>90</strong></p><p><strong>2</strong></p><p><strong>2</strong></p><p><strong>108</strong></p><p><strong>2</strong></p><p><strong>3</strong></p><p>&nbsp;</p><p>El peso o valor porcentual de cada calificaci&oacute;n parcial ser&aacute; asignada por cada docente, dependiendo de la complejidad del aprendizaje esperado, pero la sumatoria total deber&aacute; ser 100%.</p><p><strong>Se sugiere que las pruebas te&oacute;ricas tengan una ponderaci&oacute;n de un 40% de la nota final y pruebas pr&aacute;cticas en sesiones de laboratorio con una ponderaci&oacute;n de un 60% de la nota final</strong></p><p><strong>DISTRIBUCI&Oacute;N EVALUACIONES PARCIALES</strong></p><p>El docente&nbsp; deber&aacute; distribuir sus calificaciones parciales de la siguiente manera:</p><p>Primera&nbsp; semana<strong>.</strong></p><p>&nbsp;</p><p>semana S&eacute;ptima Y Octava</p><p>Decima Sexta semana</p><p>Decima S&eacute;ptima&nbsp; semana</p><p>Decima Octava&nbsp; semana</p><p>evaluaci&oacute;n&nbsp; <strong>diagn&oacute;stica</strong></p><p><strong>Calificaci&oacute;n parcial.</strong></p><p>&nbsp;</p><p>&nbsp;<strong>&Uacute;ltimas&nbsp; evaluaciones semestrales</strong>.</p><p><strong>Laboratorios, pruebas escritas, pruebas orales y trabajos&nbsp; pendientes.</strong></p><p><strong>Examen de estudiantes que tienen promedio entre 3.0 y 3,9.</strong></p><p>Los instrumentos de evaluaci&oacute;n constituir&aacute;n evidencias acerca del nivel de logro de los aprendizajes esperados en cada m&oacute;dulo o unidad de aprendizaje.</p><p><strong>Para el seguimiento y verificaci&oacute;n de los resultados</strong> durante el proceso de aprendizaje, se realizar&aacute; la aplicaci&oacute;n de los siguientes instrumentos,</p><p><strong>1) Pauta de cotejo</strong>: Su estructura permitir&aacute; una f&aacute;cil tabulaci&oacute;n, de acuerdo a la obtenci&oacute;n de los resultados de los indicadores. A trav&eacute;s de este instrumento, se podr&aacute; verificar el nivel de desarrollo de los participantes, en t&eacute;rminos de desarrollo de competencias t&eacute;cnicas. Con este instrumento, adem&aacute;s, se analizar&aacute;n aspectos Actitudinales, habilidades, destrezas, conocimientos aplicados, entre otros.</p><p><strong>2) Controles escritos</strong>: Consistentes en pruebas o test, que combinan preguntas abiertas y cerradas, en las cuales se eval&uacute;a el nivel de adquisici&oacute;n de los contenido te&oacute;rico-pr&aacute;cticos, demostrando el manejo adecuado de conceptos y t&eacute;rminos t&eacute;cnicos.</p><p><strong>3) Controles pr&aacute;cticos</strong>: evalu&aacute;ndose la habilidad en la pr&aacute;ctica del alumno tanto en aulas, talleres, como en visitas a terreno.</p><p><strong>4) Portafolio:</strong> consiste en la recopilaci&oacute;n de&nbsp; informaci&oacute;n que demuestre las habilidades y logros del estudiante, permitiendo monitorear el&nbsp; proceso de aprendizaje,&nbsp; de tal manera que se puedan ir introduciendo cambios en &eacute;l.</p><p><strong>5) R&uacute;bricas</strong>: consiste en&nbsp; evaluar el funcionamiento del estudiante basado en la suma de una gama completa de criterios en lugar de una sola cuenta num&eacute;rica. Se entrega a los estudiantes antes de iniciar un determinado trabajo para ayudar a los estudiantes a pensar sobre los criterios en los cuales su trabajo ser&aacute; juzgado</p>', '<ol><li>Investigaci&oacute;n de la literatura pertinente.</li><li>Revisi&oacute;n de documentos de M&oacute;dulos desarrollados en otros centros de ense&ntilde;anza.</li><li>Experiencia docente en metodolog&iacute;as interactivas y en la formaci&oacute;n basada en competencias.</li><li>Experiencia en trabajos desarrollados a trav&eacute;s de la pr&aacute;ctica profesional.</li><li>Aplicaci&oacute;n de diagn&oacute;sticos a estudiantes, profesores, empresarios</li><li>Validaci&oacute;n del m&oacute;dulo&nbsp; taller de consulta y revisi&oacute;n con empresarios, docentes y equipo acad&eacute;mico CFT.</li></ol>', NULL, NULL, '<p>Saber aqui</p>', '<p>Saber Hacer Aqui</p>', '<p>Saber Ser&nbsp;Aqui</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 1, NULL, 'Administración de Recursos Humanos', NULL, 'Impulsar el desempeño organizacional, reconociendo  el aporte del recurso Humano a la competitividad de la organización, Aplicando procesos de desarrollo del personal dentro de una empresa.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 1, NULL, 'Normativa Laboral de Personas y Empresas', NULL, 'Manejar y aplicar normativa laboral vigente', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 2, 1, NULL, 'Planificación Estratégica', NULL, 'Apoyar el proceso de desarrollo de la planificación estratégica  que da sentido de dirección y continuidad a las actividades diarias de una organización.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 2, 1, NULL, 'Matemática y Estadística Aplicada a la Administración', NULL, 'Utilizar las matemáticas y estadística aplicadas en la recolección e interpretación de los datos cuantitativos, así como en la resolución de problemas propios de la administración-                                                                                                                                                                                                            ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 2, 1, NULL, 'Matemática Financiera', NULL, 'Resolver problemas de tipo financiero en una empresa, clasificando datos, interpretarlos, y comunicarlos en forma clara y oportuna para su buen uso. - ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 3, 1, NULL, 'Aplicaciones Informáticas Generales', NULL, 'Usar  herramientas informáticas en procesos administrativos y  8optimización de los procesos productivos.                                                                                                                                                                                                            ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 3, 1, NULL, 'Aplicaciones Informáticas en la Gestión Administrativa', NULL, 'Incorporar mejoras tecnológicas y aportes metodológicos al interior de las organizaciones, producto de su ámbito de competencias  y actualización de sus estándares tecnológicos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 4, 1, NULL, 'Contabilidad General', NULL, 'Aplicar conocimientos básicos de contabilidad  para la toma de decisiones  en la organización.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 4, 1, NULL, 'Contabilidad Internacional', NULL, 'Manejar y ejecutar normativa internacional de contabilidad  para la estandarización de lenguaje contable', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 4, 1, NULL, 'Contabilidad de Costos', NULL, 'Utilizar sistemas de contabilidad de costos  para contabilizar  la fabricación de  un producto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 4, 1, NULL, 'Finanzas Públicas y Presupuesto', NULL, 'Manejar  gestión financiera presupuestaria  y nociones  actualizadas  de la política fiscal.  ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 5, 1, NULL, 'Introducción a la Gestión Financiera', NULL, 'Manejar  y aplicar, conceptualización relacionados con las finanzas, así como las estrategias con las que las empresas deben y pueden contar para seguir permaneciendo en el mundo productivo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 5, 1, NULL, 'Manejo de Operaciones Financieras', NULL, 'Analizar y  ejecutar  operaciones financieras que permitan  determinar las necesidades de financiamiento, la composición de la estructura de capital, para la adecuada toma de  decisiones y funcionamiento de la organización.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 5, 1, NULL, 'Comercio Exterior', NULL, 'Manejar operaciones de comercio exterior e instrumentos de fomento a las exportaciones', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 6, 1, NULL, 'Introducción a la Gestión Tributaria', NULL, 'Aplicar conceptos propios de la legislación tributaria que le permitan calcular impuestos,  reconocer aspectos importantes de la gestión tributaria y  manejo de  documentos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 6, 1, NULL, 'Gestión Tributaria, Internalización y Procesos', NULL, 'Analizar  y aplicar con equidad los derechos y obligaciones de  la administración tributaria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 7, 1, NULL, 'Prevención de Riesgos Laborales y seguridad Social', NULL, 'Manejar y aplicar técnicas de prevención de riesgos laborales para reducir las situaciones de riesgo en la organización y ambientes laborales estables', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 8, 2, NULL, 'Comunicación asertiva', NULL, 'Capacidad de entregar y recibir información que contribuya a la inserción laboral, al mejoramiento del desempeño y  desarrollo de relaciones armónicas en el lugar de trabajo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 8, 2, NULL, 'Enfoque intercultural de la Administración', NULL, 'Demostrar habilidad para relacionarse  entre culturas, respetando y valorando la diversidad cultural  e  inclusión en la administración  de los negocios  en las organizaciones.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 8, 2, NULL, 'Inglés Aplicado en la Administración de Empresas', NULL, 'Manejar conceptualización técnica del Idioma Inglés para aplicar en la administración de empresas.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 8, 2, NULL, 'Ética Liderazgo y Trabajo en Equipo en la Administración de Empresas', NULL, 'Manejar habilidades personales para el liderazgo y trabajo en equipo bajo principios éticos, respondiendo de manera coherente a situaciones que requieren honestidad y franqueza.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 8, 2, NULL, 'Innovación y Emprendimiento', NULL, 'Impulsar una  idea de emprendimiento, para pequeña o mediana empresa, generando capacidades  para fortalecer la autonomía laboral.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 8, 2, NULL, 'Atención al cliente', NULL, 'Manejar  relación con sus clientes y   desarrollar una actitud de servicio y satisfacer necesidades de  los  clientes.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 9, 3, NULL, 'Pre-Práctica', NULL, 'Aplica técnicas  y estrategias de la administración de empresas  y la resolución de problemas en el  contexto laboral-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 9, 3, NULL, 'Práctica integrada Final', NULL, 'Aplica técnicas  y procedimientos propios de la administración de empresas en la práctica integral pertinente a la organización y contexto laboral.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL,
  `usuario_apellido_paterno` varchar(100) DEFAULT NULL,
  `usuario_apellido_materno` varchar(100) DEFAULT NULL,
  `usuario_nombre` varchar(100) DEFAULT NULL,
  `usuario_celular` varchar(50) DEFAULT NULL,
  `usuario_email` varchar(100) DEFAULT NULL,
  `usuario_usuario` varchar(50) DEFAULT NULL,
  `usuario_password` varchar(50) DEFAULT NULL,
  `usuario_nivel` int(11) DEFAULT NULL,
  `can_login` tinyint(1) DEFAULT '0',
  `docente` tinyint(4) DEFAULT NULL,
  `diseno` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `usuario_apellido_paterno`, `usuario_apellido_materno`, `usuario_nombre`, `usuario_celular`, `usuario_email`, `usuario_usuario`, `usuario_password`, `usuario_nivel`, `can_login`, `docente`, `diseno`) VALUES
(2, 'Leyan', 'Bravo', 'Carlos', '994713246', 'cleyan@gmail.com', 'cleyan', '5687c0a7eecb4c79806e817f941aeb1d', 10, 1, 0, NULL),
(3, 'Bravo', 'ChÃ¡vez', 'Yerko', '994997516', 'yerkob@gmail.com', 'yerkob', '827ccb0eea8a706c4c34a16891f84e7b', 10, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_has_unidades`
--

CREATE TABLE `usuarios_has_unidades` (
  `NMID` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `unidad_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valores`
--

CREATE TABLE `valores` (
  `valor_id` int(11) NOT NULL,
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valores_has_modulos`
--

CREATE TABLE `valores_has_modulos` (
  `NMID` int(11) NOT NULL,
  `valor_id` int(11) NOT NULL DEFAULT '0',
  `modulo_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actas`
--
ALTER TABLE `actas`
  ADD PRIMARY KEY (`acta_id`) USING BTREE;

--
-- Indices de la tabla `actas_participantes`
--
ALTER TABLE `actas_participantes`
  ADD PRIMARY KEY (`acta_participantes_id`) USING BTREE,
  ADD KEY `acta_id` (`acta_id`) USING BTREE,
  ADD KEY `usuario_id` (`usuario_id`) USING BTREE;

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`area_id`) USING BTREE;

--
-- Indices de la tabla `bibliografias`
--
ALTER TABLE `bibliografias`
  ADD PRIMARY KEY (`bibliografia_id`) USING BTREE,
  ADD KEY `Ref_19` (`unidad_id`) USING BTREE;

--
-- Indices de la tabla `calendarizacion`
--
ALTER TABLE `calendarizacion`
  ADD PRIMARY KEY (`calendarizacion_id`) USING BTREE,
  ADD KEY `Ref_16` (`usuario_id`) USING BTREE,
  ADD KEY `Ref_20` (`aprendizaje_id`) USING BTREE,
  ADD KEY `Ref_21` (`contenido_id`) USING BTREE,
  ADD KEY `Ref_22` (`unidad_id`) USING BTREE;

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`carrera_id`) USING BTREE,
  ADD KEY `Ref_05` (`sede_id`) USING BTREE;

--
-- Indices de la tabla `competencias_tipo`
--
ALTER TABLE `competencias_tipo`
  ADD PRIMARY KEY (`competencia_tipo_id`) USING BTREE;

--
-- Indices de la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD PRIMARY KEY (`comuna_id`) USING BTREE,
  ADD KEY `provincia_id` (`provincia_id`) USING BTREE,
  ADD KEY `region_id` (`region_id`) USING BTREE;

--
-- Indices de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  ADD PRIMARY KEY (`configuracion_id`) USING BTREE;

--
-- Indices de la tabla `contenidos`
--
ALTER TABLE `contenidos`
  ADD PRIMARY KEY (`contenido_id`) USING BTREE,
  ADD KEY `Ref_18` (`unidad_id`) USING BTREE;

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`estudiante_id`) USING BTREE,
  ADD KEY `Ref_23` (`comuna_id`) USING BTREE,
  ADD KEY `Ref_24` (`carrera_id_FK`) USING BTREE;

--
-- Indices de la tabla `icons`
--
ALTER TABLE `icons`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`) USING BTREE,
  ADD KEY `parent_id` (`parent_id`) USING BTREE;

--
-- Indices de la tabla `menu_pos`
--
ALTER TABLE `menu_pos`
  ADD PRIMARY KEY (`menu_pos_id`) USING BTREE;

--
-- Indices de la tabla `menu_pos_menu`
--
ALTER TABLE `menu_pos_menu`
  ADD PRIMARY KEY (`menu_pos_menu_id`) USING BTREE;

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`modulo_id`) USING BTREE,
  ADD KEY `Ref_06` (`carrera_id`) USING BTREE;

--
-- Indices de la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD PRIMARY KEY (`nivel_id`) USING BTREE;

--
-- Indices de la tabla `prerrequisitos`
--
ALTER TABLE `prerrequisitos`
  ADD PRIMARY KEY (`prerrequisito_id`) USING BTREE,
  ADD KEY `Ref_15` (`unidad_id`) USING BTREE;

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`provincia_id`) USING BTREE,
  ADD KEY `region_id` (`region_id`) USING BTREE;

--
-- Indices de la tabla `revisiones`
--
ALTER TABLE `revisiones`
  ADD PRIMARY KEY (`revision_id`) USING BTREE,
  ADD KEY `Ref_09` (`carrera_id`) USING BTREE;

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`sede_id`) USING BTREE;

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`unidad_id`) USING BTREE,
  ADD KEY `Ref_10` (`modulo_id`) USING BTREE,
  ADD KEY `Ref_14` (`competencia_tipo_id`) USING BTREE;

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`) USING BTREE;

--
-- Indices de la tabla `usuarios_has_unidades`
--
ALTER TABLE `usuarios_has_unidades`
  ADD PRIMARY KEY (`NMID`) USING BTREE,
  ADD KEY `Ref_11` (`usuario_id`) USING BTREE,
  ADD KEY `Ref_12` (`unidad_id`) USING BTREE;

--
-- Indices de la tabla `valores`
--
ALTER TABLE `valores`
  ADD PRIMARY KEY (`valor_id`) USING BTREE;

--
-- Indices de la tabla `valores_has_modulos`
--
ALTER TABLE `valores_has_modulos`
  ADD PRIMARY KEY (`NMID`) USING BTREE,
  ADD KEY `Ref_07` (`valor_id`) USING BTREE,
  ADD KEY `Ref_08` (`modulo_id`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actas`
--
ALTER TABLE `actas`
  MODIFY `acta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `actas_participantes`
--
ALTER TABLE `actas_participantes`
  MODIFY `acta_participantes_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `bibliografias`
--
ALTER TABLE `bibliografias`
  MODIFY `bibliografia_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calendarizacion`
--
ALTER TABLE `calendarizacion`
  MODIFY `calendarizacion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `carrera_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `competencias_tipo`
--
ALTER TABLE `competencias_tipo`
  MODIFY `competencia_tipo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  MODIFY `configuracion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `contenidos`
--
ALTER TABLE `contenidos`
  MODIFY `contenido_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `estudiante_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `menu_pos_menu`
--
ALTER TABLE `menu_pos_menu`
  MODIFY `menu_pos_menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `modulo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `prerrequisitos`
--
ALTER TABLE `prerrequisitos`
  MODIFY `prerrequisito_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `revisiones`
--
ALTER TABLE `revisiones`
  MODIFY `revision_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `sede_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `unidad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `valores`
--
ALTER TABLE `valores`
  MODIFY `valor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bibliografias`
--
ALTER TABLE `bibliografias`
  ADD CONSTRAINT `Ref_19` FOREIGN KEY (`unidad_id`) REFERENCES `unidades` (`unidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `calendarizacion`
--
ALTER TABLE `calendarizacion`
  ADD CONSTRAINT `Ref_16` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Ref_21` FOREIGN KEY (`contenido_id`) REFERENCES `contenidos` (`contenido_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Ref_22` FOREIGN KEY (`unidad_id`) REFERENCES `unidades` (`unidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD CONSTRAINT `Ref_05` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`sede_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `contenidos`
--
ALTER TABLE `contenidos`
  ADD CONSTRAINT `Ref_18` FOREIGN KEY (`unidad_id`) REFERENCES `unidades` (`unidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `Ref_23` FOREIGN KEY (`comuna_id`) REFERENCES `comunas` (`comuna_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Ref_24` FOREIGN KEY (`carrera_id_FK`) REFERENCES `carreras` (`carrera_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD CONSTRAINT `Ref_06` FOREIGN KEY (`carrera_id`) REFERENCES `carreras` (`carrera_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `prerrequisitos`
--
ALTER TABLE `prerrequisitos`
  ADD CONSTRAINT `Ref_15` FOREIGN KEY (`unidad_id`) REFERENCES `unidades` (`unidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `revisiones`
--
ALTER TABLE `revisiones`
  ADD CONSTRAINT `Ref_09` FOREIGN KEY (`carrera_id`) REFERENCES `carreras` (`carrera_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD CONSTRAINT `Ref_10` FOREIGN KEY (`modulo_id`) REFERENCES `modulos` (`modulo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Ref_14` FOREIGN KEY (`competencia_tipo_id`) REFERENCES `competencias_tipo` (`competencia_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios_has_unidades`
--
ALTER TABLE `usuarios_has_unidades`
  ADD CONSTRAINT `Ref_11` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Ref_12` FOREIGN KEY (`unidad_id`) REFERENCES `unidades` (`unidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `valores_has_modulos`
--
ALTER TABLE `valores_has_modulos`
  ADD CONSTRAINT `Ref_07` FOREIGN KEY (`valor_id`) REFERENCES `valores` (`valor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Ref_08` FOREIGN KEY (`modulo_id`) REFERENCES `modulos` (`modulo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
