-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-12-2014 a las 03:12:45
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

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
  `idCliente` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `rfc` varchar(20) NOT NULL,
  `razonSocial` varchar(100) NOT NULL,
  `giro` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `notas` text NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `nombre`, `rfc`, `razonSocial`, `giro`, `url`, `notas`, `activo`) VALUES
(1, 'Coca Cola', 'RFD23232RED', 'Coca Cola SA de CV', 'Refrescos', 'www.coca-cola.com', 'Empresa refresquera', 1),
(2, 'BANCOMER', 'BNV2322TRDE', 'Bancomer SA de CV', 'Banco', 'www.bancomer.com', 'Empresa bancaria', 1),
(3, 'IXE BANCO', 'IXE5343YTRH', 'Ixe Banco SA de CV', 'Banco', 'www.ixe.com', 'Banco IXE', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientesareas`
--

CREATE TABLE IF NOT EXISTS `clientesareas` (
  `idArea` int(5) NOT NULL AUTO_INCREMENT,
  `idCliente` int(5) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `comentario` text NOT NULL,
  PRIMARY KEY (`idArea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientesdirecciones`
--

CREATE TABLE IF NOT EXISTS `clientesdirecciones` (
  `idDireccion` int(5) NOT NULL AUTO_INCREMENT,
  `idCliente` int(5) NOT NULL,
  `calleNumero` varchar(100) NOT NULL,
  `colonia` varchar(100) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `codigoPostal` varchar(10) NOT NULL,
  PRIMARY KEY (`idDireccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientestelefonos`
--

CREATE TABLE IF NOT EXISTS `clientestelefonos` (
  `idTelefono` int(5) NOT NULL AUTO_INCREMENT,
  `idCliente` int(5) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `extencion` varchar(5) NOT NULL,
  `tipoTelefono` varchar(20) NOT NULL,
  PRIMARY KEY (`idTelefono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE IF NOT EXISTS `contactos` (
  `idContacto` int(5) NOT NULL AUTO_INCREMENT,
  `idCliente` int(5) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidoPaterno` varchar(100) NOT NULL,
  `apellidoMaterno` varchar(100) NOT NULL,
  `puesto` varchar(100) NOT NULL,
  PRIMARY KEY (`idContacto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  `idEmail` int(5) NOT NULL AUTO_INCREMENT,
  `idCotacto` int(5) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`idEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
