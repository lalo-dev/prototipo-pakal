-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2014 a las 01:09:20
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `pakaldb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
`idCliente` int(5) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `rfc` varchar(20) NOT NULL,
  `razonSocial` varchar(100) NOT NULL,
  `giro` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `notas` text NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `nombre`, `rfc`, `razonSocial`, `giro`, `url`, `notas`, `activo`) VALUES
(1, 'Coca Cola', 'RFD23232RED', 'Coca Cola SA de CV', 'Refrescos', 'www.coca-cola.com', 'Empresa refresquera', 1),
(2, 'BANCOMER', 'BNV2322TRDE', 'Bancomer SA de CV', 'Banco', 'www.bancomer.com', 'Empresa bancaria', 1),
(3, 'IXE BANCO', 'IXE5343YTRH', 'Ixe Banco SA de CV', 'Banco', 'www.ixe.com', 'Banco IXE', 1),
(14, 'q', 'q', 'q', 'q', 'q', 'q', 1),
(15, 'qa', 'qa', 'qa', 'qa', 'qa', 'qa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientesareas`
--

CREATE TABLE IF NOT EXISTS `clientesareas` (
`idArea` int(5) NOT NULL,
  `idCliente` int(5) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `comentario` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientesareas`
--

INSERT INTO `clientesareas` (`idArea`, `idCliente`, `descripcion`, `comentario`) VALUES
(1, 1, '[Recursos humanos]', '[Área encargada de todo lo relacionado al capital humano de la empresa]'),
(2, 1, '[Finanzas]', '[Área encargada del $ de la empresa]'),
(4, 15, '[Finanzas]', '[Área encargada del $ de la empresa]'),
(6, 16, '[Finanzas]', '[Área encargada del $ de la empresa]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientesdirecciones`
--

CREATE TABLE IF NOT EXISTS `clientesdirecciones` (
`idDireccion` int(5) NOT NULL,
  `idCliente` int(5) NOT NULL,
  `calleNumero` varchar(100) NOT NULL,
  `colonia` varchar(100) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `codigoPostal` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientestelefonos`
--

CREATE TABLE IF NOT EXISTS `clientestelefonos` (
`idTelefono` int(5) NOT NULL,
  `idCliente` int(5) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `extencion` varchar(5) NOT NULL,
  `tipoTelefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE IF NOT EXISTS `contactos` (
`idContacto` int(5) NOT NULL,
  `idCliente` int(5) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidoPaterno` varchar(100) NOT NULL,
  `apellidoMaterno` varchar(100) NOT NULL,
  `puesto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactostelefonos`
--

CREATE TABLE IF NOT EXISTS `contactostelefonos` (
  `idTelefono` int(5) NOT NULL,
  `idContacto` int(5) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `extencion` varchar(5) NOT NULL,
  `tipoTelefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contatosemails`
--

CREATE TABLE IF NOT EXISTS `contatosemails` (
`idEmail` int(5) NOT NULL,
  `idCotacto` int(5) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE IF NOT EXISTS `contratos` (
`idContrato` int(5) NOT NULL,
  `idCliente` int(5) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fechaInicio` varchar(10) NOT NULL,
  `fechaFin` varchar(10) NOT NULL,
  `estatus` int(1) NOT NULL,
  `duracion` varchar(100) NOT NULL,
  `monto` varchar(100) NOT NULL,
  `directorResponsable` varchar(100) NOT NULL,
  `gerenteResponsable` varchar(100) NOT NULL,
  `directorCliente` varchar(100) NOT NULL,
  `administradorCliente` varchar(100) NOT NULL,
  `tipoServicio` varchar(20) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `contratos`
--

INSERT INTO `contratos` (`idContrato`, `idCliente`, `nombre`, `fechaInicio`, `fechaFin`, `estatus`, `duracion`, `monto`, `directorResponsable`, `gerenteResponsable`, `directorCliente`, `administradorCliente`, `tipoServicio`, `descripcion`) VALUES
(1, 1, 'Coca Cola - Supervisión', '01-01-2015', '31-12-2016', 1, '1 año', '$ 1,000,000.00', 'Eduardo Martínez Martínez', 'Eduardo Martínez Martínez', 'Eduardo Martínez Martínez', 'Eduardo Martínez Martínez', 'Supervisión', 'Contrato por un año para supervisión'),
(2, 1, 'Coca Cola - Aseguramiento', '01-01-2015', '31-12-2016', 1, '1 año', '$ 2,000,000.00', 'Eduardo Martínez Martínez', 'Eduardo Martínez Martínez', 'Eduardo Martínez Martínez', 'Eduardo Martínez Martínez', 'Aseguramiento', 'Contrato por un año de aseguramiento'),
(3, 2, 'BANCOMER - Supervisión', '01-01-2015', '31-12-2016', 1, '1 año', '$ 1,000,000.00', 'Eduardo Martínez Martínez', 'Eduardo Martínez Martínez', 'Eduardo Martínez Martínez', 'Eduardo Martínez Martínez', 'Supervisión', 'Contrato por un año para supervisión'),
(4, 2, 'BANCOMER - Aseguramiento', '01-01-2015', '31-12-2016', 1, '1 año', '$ 2,000,000.00', 'Eduardo Martínez Martínez', 'Eduardo Martínez Martínez', 'Eduardo Martínez Martínez', 'Eduardo Martínez Martínez', 'Aseguramiento', 'Contrato por un año de aseguramiento'),
(5, 3, 'IXE - Supervisión', '01-01-2015', '31-12-2016', 1, '1 año', '$ 1,000,000.00', 'Eduardo Martínez Martínez', 'Eduardo Martínez Martínez', 'Eduardo Martínez Martínez', 'Eduardo Martínez Martínez', 'Supervisión', 'Contrato por un año para supervisión'),
(6, 3, 'IXE - Aseguramiento', '01-01-2015', '31-12-2016', 1, '1 año', '$ 2,000,000.00', 'Eduardo Martínez Martínez', 'Eduardo Martínez Martínez', 'Eduardo Martínez Martínez', 'Eduardo Martínez Martínez', 'Aseguramiento', 'Contrato por un año de aseguramiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE IF NOT EXISTS `proyectos` (
`idProyecto` int(5) NOT NULL,
  `idContrato` int(5) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `fechaFin` varchar(20) NOT NULL,
  `monto` varchar(20) NOT NULL,
  `duracion` varchar(20) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`idProyecto`, `idContrato`, `nombre`, `fecha`, `fechaFin`, `monto`, `duracion`, `descripcion`) VALUES
(1, 1, 'Supervisión - Fase uno', '01-01-2015', '31-12-2016', '$ 1,000,000.00', '1 año', 'Proyecto de aseguramiento'),
(2, 1, 'Supervisión - Fase dos', '01-01-2015', '31-12-2016', '$ 1,000,000.00', '1 año', 'Proyecto de aseguramiento'),
(3, 1, 'Supervisión - Fase tres', '01-01-2015', '31-12-2016', '$ 1,000,000.00', '1 año', 'Proyecto de aseguramiento'),
(4, 2, 'Aseguramiento - Fase uno', '01-01-2015', '31-12-2016', '$ 1,000,000.00', '1 año', 'Proyecto de aseguramiento'),
(5, 2, 'Aseguramiento - Fase dos', '01-01-2015', '31-12-2016', '$ 1,000,000.00', '1 año', 'Proyecto de aseguramiento'),
(6, 3, 'Supervisión - Fase uno', '01-01-2015', '31-12-2016', '$ 1,000,000.00', '1 año', 'Proyecto de aseguramiento'),
(7, 4, 'Aseguramiento - Fase uno', '01-01-2015', '31-12-2016', '$ 1,000,000.00', '1 año', 'Proyecto de aseguramiento'),
(8, 5, 'Supervisión - Fase uno', '01-01-2015', '31-12-2016', '$ 1,000,000.00', '1 año', 'Proyecto de aseguramiento'),
(9, 6, 'Aseguramiento - Fase uno', '01-01-2015', '31-12-2016', '$ 1,000,000.00', '1 año', 'Proyecto de aseguramiento');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
 ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `clientesareas`
--
ALTER TABLE `clientesareas`
 ADD PRIMARY KEY (`idArea`);

--
-- Indices de la tabla `clientesdirecciones`
--
ALTER TABLE `clientesdirecciones`
 ADD PRIMARY KEY (`idDireccion`);

--
-- Indices de la tabla `clientestelefonos`
--
ALTER TABLE `clientestelefonos`
 ADD PRIMARY KEY (`idTelefono`);

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
 ADD PRIMARY KEY (`idContacto`);

--
-- Indices de la tabla `contatosemails`
--
ALTER TABLE `contatosemails`
 ADD PRIMARY KEY (`idEmail`);

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
 ADD PRIMARY KEY (`idContrato`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
 ADD PRIMARY KEY (`idProyecto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
MODIFY `idCliente` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `clientesareas`
--
ALTER TABLE `clientesareas`
MODIFY `idArea` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `clientesdirecciones`
--
ALTER TABLE `clientesdirecciones`
MODIFY `idDireccion` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `clientestelefonos`
--
ALTER TABLE `clientestelefonos`
MODIFY `idTelefono` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
MODIFY `idContacto` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `contatosemails`
--
ALTER TABLE `contatosemails`
MODIFY `idEmail` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
MODIFY `idContrato` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
MODIFY `idProyecto` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
