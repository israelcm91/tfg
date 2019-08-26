-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-08-2019 a las 08:05:22
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `icm_tfg`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(12) UNSIGNED NOT NULL,
  `titular` text CHARACTER SET utf8 NOT NULL COMMENT 'Titular del artículo.',
  `subtitulo` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Subtitulo del artículo',
  `cuerpo` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Desarrollo del artículo.',
  `categoria_id` int(12) UNSIGNED DEFAULT 0 COMMENT 'Categoria de clasificación del articulo CERO si no existe o aún no está indicada (como si fuera NULL).',
  `fecha_publicacion` datetime NOT NULL COMMENT 'Fecha en la cual se publica el artículo.',
  `imagen` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Imagen del artículo',
  `visible` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Indicador de artículo visible a los usuarios o invisible 0 = invisible 1 = visible',
  `crea_usuario_id` int(12) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Usuario que ha creado el artículo o 0 (NULL) si no existe o lo creo un administrador del sistema.\n',
  `visitas` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Campo para controlar el numero de visitas que recibe el artículo.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;



--
-- Estructura de tabla para la tabla `articulos_comentarios`
--

CREATE TABLE `articulos_comentarios` (
  `id` int(12) UNSIGNED NOT NULL,
  `articulo_id` int(12) UNSIGNED NOT NULL COMMENT 'Artículo relacionado',
  `texto` varchar(240) CHARACTER SET utf8 NOT NULL COMMENT 'Texto del comentario',
  `num_denuncias` int(9) NOT NULL DEFAULT 0 COMMENT 'Contador de denuncias del comentario, o 0 si no ha tenido.',
  `fecha_denuncia1` datetime DEFAULT NULL COMMENT 'Fecha y hora de la primera denuncia, debería estar a NULL si no hay denuncias contador a 0, o si el contador se reinicia).',
  `bloqueado` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Indicador de comentario bloqueado (0=1, 1=si (bloqueado por denuncias), 2 = si (bloqueado por el administrador).',
  `fecha_bloqueo` datetime DEFAULT NULL COMMENT 'Fecha y hora del bloqueo del comentario. Debería estar a null si no está bloqueado o si se desbloquea',
  `notas_bloqueo` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Notas visibles sobre el motivo del bloqueo del comentario, o NULL si no hay.',
  `crea_usuario_id` int(12) UNSIGNED DEFAULT 0 COMMENT 'Usuario que ha creado el comentario, o 0 si no existe o se hizo por un administrador de sistema.',
  `crea_fecha` datetime DEFAULT NULL COMMENT 'Fecha y hora de creación del comentario, o null si no se conoce por algún motivo.',
  `visible` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Visibilidad del comentario. (0 no visible, 1 visible)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci COMMENT='	';



--
-- Estructura de tabla para la tabla `articulos_likes`
--

CREATE TABLE `articulos_likes` (
  `id` int(12) UNSIGNED NOT NULL,
  `articulo_id` int(12) UNSIGNED NOT NULL,
  `usuario_id` int(12) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;



--
-- Estructura de tabla para la tabla `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `user_id` int(12) UNSIGNED NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;


--
-- Estructura de tabla para la tabla `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, NULL, NULL, NULL, 1564980203, 1564980203),
('administrar', 2, 'Permisos de administración', NULL, NULL, 1564980201, 1564980201),
('adminsistema', 2, 'Permisos de administración del sistema', NULL, NULL, 1566181517, 1566181517),
('comentar', 2, 'Crear comentario', NULL, NULL, 1564980200, 1564980200),
('crearCategoria', 2, 'Crear categoria', NULL, NULL, 1565678888, 1565678888),
('eliminar', 2, 'Eliminar artículos', NULL, NULL, 1564980200, 1564980200),
('eliminarComentario', 2, 'Eliminar comentario', NULL, NULL, 1564980200, 1564980200),
('modificar', 2, 'Modificar articulos', NULL, NULL, 1564980200, 1564980200),
('modificarComentario', 2, 'Modificar comentario', NULL, NULL, 1564980200, 1564980200),
('publicar', 2, 'Publicar artículos', NULL, NULL, 1564980200, 1564980200),
('redactor', 1, NULL, NULL, NULL, 1564980202, 1564980202),
('sysadmin', 1, NULL, NULL, NULL, 1564980203, 1564980203),
('usuario', 1, NULL, NULL, NULL, 1564980201, 1564980201),
('votar', 2, 'Permitir votar el articulo', NULL, NULL, 1564980200, 1564980200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `child` varchar(64) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'administrar'),
('admin', 'redactor'),
('redactor', 'crearCategoria'),
('redactor', 'eliminar'),
('redactor', 'modificar'),
('redactor', 'publicar'),
('redactor', 'usuario'),
('sysadmin', 'admin'),
('sysadmin', 'adminsistema'),
('usuario', 'comentar'),
('usuario', 'eliminarComentario'),
('usuario', 'modificarComentario'),
('usuario', 'votar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(12) UNSIGNED NOT NULL,
  `nombre` varchar(25) CHARACTER SET utf8 NOT NULL COMMENT 'Nombre de la categoría/videojuego',
  `descripcion` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Texto adicional que describe la categoría o videojuego.',
  `imagen` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Logotipo de la categoría',
  `stream` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Enlace para ver el juego en streaming',
  `biblioteca` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Establece si la categoría puede ser visible en la biblioteca de juegos ( 0 = no visible, 1 = visible)\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;



--
-- Estructura de tabla para la tabla `categorias_likes`
--

CREATE TABLE `categorias_likes` (
  `id` int(12) UNSIGNED NOT NULL,
  `categoria_id` int(12) UNSIGNED NOT NULL,
  `usuario_id` int(12) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;



--
-- Estructura de tabla para la tabla `categorias_notas`
--

CREATE TABLE `categorias_notas` (
  `id` int(12) UNSIGNED NOT NULL,
  `categoria_id` int(12) UNSIGNED NOT NULL,
  `usuario_id` int(12) UNSIGNED NOT NULL,
  `nota` int(12) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;


--
-- Estructura de tabla para la tabla `configuraciones`
--

CREATE TABLE `configuraciones` (
  `variable` varchar(50) NOT NULL,
  `valor` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `configuraciones`
--

INSERT INTO `configuraciones` (`variable`, `valor`) VALUES
('autobloquear', '5'),
('max_accesos', '5'),
('tiempo_bloqueo', '30'),
('primer_arranque','0'),
('email','icmtfg@gmail.com')
;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE `registros` (
  `id` int(12) UNSIGNED NOT NULL,
  `fecha_registro` datetime NOT NULL COMMENT 'Fecha y Hora del registro de acceso.',
  `clase_log_id` char(1) NOT NULL COMMENT 'código de clase de log: E=Error, A=Aviso, S=Seguimiento, I=Información, D=Depuración, ...',
  `modulo` varchar(50) DEFAULT 'app' COMMENT 'Modulo o Sección de la aplicación que ha generado el mensaje de registro.',
  `texto` text DEFAULT NULL COMMENT 'Texto con el mensaje de registro.',
  `ip` varchar(40) DEFAULT NULL COMMENT 'Dirección IP desde donde accede el usuario (vale para IPv4 e IPv6.',
  `browser` text DEFAULT NULL COMMENT 'Texto con información del navegador utilizado en el acceso.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(12) UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Correo electrónico y login del usuario.',
  `password` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT 'Contraseña de acceso del usuario-',
  `nick` varchar(25) CHARACTER SET utf8 NOT NULL COMMENT 'Nombre identificativo del usuario.',
  `nombre` varchar(50) CHARACTER SET utf8 NOT NULL,
  `apellidos` varchar(100) CHARACTER SET utf8 NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL COMMENT 'Fecha de nacimiento del usuario o NULL si no quiere informar de ello.',
  `fecha_registro` datetime DEFAULT NULL COMMENT 'Fecha y hora de registro del usuario.',
  `confirmado` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Indicador de que el usuario a confirmado su registro.(0 no confirmado, 1 confirmado).',
  `fecha_acceso` datetime DEFAULT NULL COMMENT 'Fecha y hora del ultimo acceso del usuario. Debería estar a null si no se accedió nunca.',
  `num_accesos` int(9) NOT NULL DEFAULT 0 COMMENT 'Contador de accesos fallidos del usuario. 0 si no ha tenido o se reinició por un acceso válido.',
  `bloqueado` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Indicador de usuario bloqueado: 0 = no, 1 = si (bloqueado por accesos), 2 = si (bloqueado por administrador)',
  `fecha_bloqueo` datetime DEFAULT NULL COMMENT 'Fecha y hora del bloqueo del usuario. Debería ser NULL si no esta bloqueada, o si ha sido desbloqueada.',
  `notas_bloqueo` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Notas visibles sobre el motivo del bloqueo del usuario, o NULL si no hay. Se muestra por defecto según indique (bloqueado).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;



--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `articulos_comentarios`
--
ALTER TABLE `articulos_comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_articulos_comentarios` (`articulo_id`),
  ADD KEY `fk_comentarios_usuarios` (`crea_usuario_id`);

--
-- Indices de la tabla `articulos_likes`
--
ALTER TABLE `articulos_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_articulos_likes` (`articulo_id`);

--
-- Indices de la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `auth_assignment_user_id_idx` (`user_id`);

--
-- Indices de la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `type` (`type`);

--
-- Indices de la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indices de la tabla `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias_likes`
--
ALTER TABLE `categorias_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_categorias_likes` (`categoria_id`),
  ADD KEY `FK_categorias_likes_usuarios` (`usuario_id`);

--
-- Indices de la tabla `categorias_notas`
--
ALTER TABLE `categorias_notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_categorias_likes` (`categoria_id`),
  ADD KEY `FK_categorias_usuarios` (`usuario_id`);

--
-- Indices de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  ADD PRIMARY KEY (`variable`);

--
-- Indices de la tabla `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nick_UNIQUE` (`nick`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla `articulos_comentarios`
--
ALTER TABLE `articulos_comentarios`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;;

--
-- AUTO_INCREMENT de la tabla `articulos_likes`
--
ALTER TABLE `articulos_likes`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;;

--
-- AUTO_INCREMENT de la tabla `categorias_likes`
--
ALTER TABLE `categorias_likes`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;;

--
-- AUTO_INCREMENT de la tabla `categorias_notas`
--
ALTER TABLE `categorias_notas`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;;

--
-- AUTO_INCREMENT de la tabla `registros`
--
ALTER TABLE `registros`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos_comentarios`
--
ALTER TABLE `articulos_comentarios`
  ADD CONSTRAINT `FK_articulos_comentarios` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comentarios_usuarios` FOREIGN KEY (`crea_usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_assignment_usfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `categorias_likes`
--
ALTER TABLE `categorias_likes`
  ADD CONSTRAINT `FK_categorias_likes` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_categorias_likes_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `categorias_notas`
--
ALTER TABLE `categorias_notas`
  ADD CONSTRAINT `FK_categorias_notas` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_categorias_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

--
-- Filtros para la tabla `categorias_likes`
--
ALTER TABLE `articulos_likes`
  ADD CONSTRAINT `FK_articulos_likes` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_articulos_likes_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
