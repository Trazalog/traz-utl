-- assetv2.sta_equipos definition

CREATE TABLE `sta_equipos` (
  `descripcion` varchar(255) NOT NULL,
  `fecha_ingreso` varchar(255) DEFAULT NULL,
  `fecha_garantia` varchar(255) DEFAULT NULL,
  `marca` varchar(255) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `sector` varchar(255) NOT NULL,
  `grupo` varchar(255) NOT NULL,
  `criticidad` varchar(255) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `fecha_ultimalectura` varchar(255) DEFAULT NULL,
  `ultima_lectura` varchar(255) DEFAULT NULL,
  `descrip_tecnica` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `area` varchar(255) NOT NULL,
  `proceso` varchar(255) NOT NULL,
  `numero_serie` varchar(255) NOT NULL,
  `meta_disponibilidad` varchar(255) DEFAULT NULL,
  `procesado` tinyint(1) DEFAULT '0',
  `fec_proceso` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- assetv2.sta_orden_trabajo definition

CREATE TABLE `sta_orden_trabajo` (
  `id_orden` varchar(100) NOT NULL,
  `fecha_program` varchar(16) DEFAULT NULL,
  `fecha_inicio` varchar(16) NOT NULL,
  `fecha_terminada` varchar(16) NOT NULL,
  `descripcion` text NOT NULL,
  `estado` varchar(2) NOT NULL,
  `nick_usuario_a` varchar(255) NOT NULL,
  `cod_equipo` varchar(100) NOT NULL,
  `procesado` tinyint(1) DEFAULT '0',
  `fec_proceso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
