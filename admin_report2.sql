-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 24-05-2023 a las 16:32:06
-- Versión del servidor: 10.6.12-MariaDB-0ubuntu0.22.04.1
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `admin_report2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Guayaberas', '2022-06-18 10:05:12', '2022-06-18 10:05:12', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colors`
--

DROP TABLE IF EXISTS `colors`;
CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `colors`
--

INSERT INTO `colors` (`id`, `nombre`, `name`, `codigo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Rojo', 'Red', '#FF0000', '2022-06-18 10:06:18', '2022-06-18 10:06:18', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conekta`
--

DROP TABLE IF EXISTS `conekta`;
CREATE TABLE `conekta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `metodo` varchar(255) NOT NULL,
  `private_key` varchar(255) NOT NULL,
  `public_key` varchar(255) NOT NULL,
  `private_key_test` varchar(255) NOT NULL,
  `public_key_test` varchar(255) NOT NULL,
  `estatus` int(11) NOT NULL,
  `produccion` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `conekta`
--

INSERT INTO `conekta` (`id`, `metodo`, `private_key`, `public_key`, `private_key_test`, `public_key_test`, `estatus`, `produccion`, `created_at`, `updated_at`) VALUES
(1, 'conekta', 'key_gsGvcKwhYqCMxDAg7hvXZw', 'key_UGmRuij9GxpmwFmdyjzCsew', 'key_tCndwqB3DeVNWsLtPEzA5Q', 'key_CxJnPNWiwCgLyyaG6RrLjxA', 1, 0, '2022-06-24 18:20:03', '2022-06-24 18:20:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidad`
--

DROP TABLE IF EXISTS `entidad`;
CREATE TABLE `entidad` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `orden` varchar(255) NOT NULL,
  `ruta` varchar(255) NOT NULL,
  `icono` varchar(255) NOT NULL,
  `modulo_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permiso` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `entidad`
--

INSERT INTO `entidad` (`id`, `nombre`, `orden`, `ruta`, `icono`, `modulo_id`, `created_at`, `updated_at`, `permiso`) VALUES
(1, 'Usuarios', '1', '/admin/users', 'fa fa-circle', 1, '2022-06-17 21:04:36', '2022-06-19 23:48:09', 'users_access'),
(2, 'Roles', '2', '/admin/roles', 'fa fa-circle', 1, '2022-06-17 21:04:54', '2022-06-19 23:47:51', 'roles_access'),
(3, 'Permisos', '3', '/admin/permisos', 'fa fa-circle', 1, '2022-06-17 21:05:28', '2022-06-19 23:47:35', 'Permission_access'),
(4, 'Modulos', '1', '/admin/modulos', 'fa fa-circle', 2, '2022-06-17 21:06:03', '2022-06-20 00:33:09', 'Modulo_access'),
(5, 'Entidades', '2', '/admin/entidades', 'fa fa-circle', 2, '2022-06-17 21:06:18', '2022-06-19 23:47:07', 'Entidad_access'),
(8, 'Colores', '1', '/admin/colores', 'fa fa-circle	', 5, '2022-06-18 09:58:31', '2022-06-19 23:47:22', 'Color_access'),
(9, 'Tallas', '2', '/admin/tallas', 'fa fa-circle	', 5, '2022-06-18 09:58:45', '2022-06-19 23:46:34', 'Size_access'),
(10, 'Categorías', '3', '/admin/categorias', 'fa fa-circle	', 5, '2022-06-18 09:59:10', '2022-06-19 23:46:05', 'Category_access'),
(12, 'Conekta', '1', '/admin/conekta', 'fa fa-circle', 10, '2022-06-25 02:27:27', '2022-06-25 02:35:07', 'Pasarelas_access');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `firstlogin`
--

DROP TABLE IF EXISTS `firstlogin`;
CREATE TABLE `firstlogin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `firstlogin`
--

INSERT INTO `firstlogin` (`id`, `id_usuario`, `id_role`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 6, 1, '2022-06-24 03:35:17', '2022-06-24 03:35:17', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(16, 'App\\Models\\User', 1, '65974977-aa3d-4251-a555-de4668eed448', 'profile_picture', 'fNmzOZwme1jLcsp05gFmFz5OrfFyTH-metaQ29vbC1Qcm9maWxlLVBpY3R1cmUtRm9yLURpc2NvcmQtODg0eDEwMjQuanBn-', 'fNmzOZwme1jLcsp05gFmFz5OrfFyTH-metaQ29vbC1Qcm9maWxlLVBpY3R1cmUtRm9yLURpc2NvcmQtODg0eDEwMjQuanBn-.jpg', 'image/jpeg', 'public', 'public', 95897, '[]', '[]', '[]', '[]', 16, '2022-06-22 03:55:20', '2022-06-22 03:55:20'),
(25, 'App\\Models\\User', 5, '81ffd52e-804f-4531-9298-d3226357ce4c', 'profile_picture', 'TeXuoMxRIMG9XtVxjA42cIf3VhsJyC-metaQ29vbC1Qcm9maWxlLVBpY3R1cmUtRm9yLURpc2NvcmQtODg0eDEwMjQuanBn-', 'TeXuoMxRIMG9XtVxjA42cIf3VhsJyC-metaQ29vbC1Qcm9maWxlLVBpY3R1cmUtRm9yLURpc2NvcmQtODg0eDEwMjQuanBn-.jpg', 'image/jpeg', 'public', 'public', 95897, '[]', '[]', '[]', '[]', 25, '2022-06-24 03:34:40', '2022-06-24 03:34:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_12_17_055226_create_roles_table', 1),
(4, '2020_12_17_055308_create_permissions_table', 1),
(5, '2020_12_17_060416_create_role_permissions_pivot_table', 1),
(6, '2020_12_17_061340_add_relationship_fields_to_users_table', 1),
(7, '2022_06_16_143808_create_post_table', 2),
(8, '2022_06_17_151822_create_modulo_table', 3),
(9, '2022_06_17_153625_create_entidad_table', 3),
(11, '2022_06_17_161140_update_permissions_table', 4),
(12, '2022_06_18_043820_create_colors_table', 5),
(13, '2022_06_18_043836_create_sizes_table', 5),
(14, '2022_06_18_043851_create_categories_table', 5),
(15, '2022_06_18_050808_update_sizes_table', 6),
(16, '2022_06_19_054100_update_modulos_table', 7),
(17, '2022_06_19_174847_update_entidad_table', 8),
(18, '2022_06_21_165809_create_media_table', 9),
(19, '2022_06_23_165120_create_firstlogin_table', 10),
(21, '2022_06_24_165504_create_conekta_table', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

DROP TABLE IF EXISTS `modulo`;
CREATE TABLE `modulo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `orden` varchar(255) NOT NULL,
  `ruta` varchar(255) NOT NULL,
  `icono` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nomod` int(11) DEFAULT NULL,
  `permiso` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id`, `nombre`, `orden`, `ruta`, `icono`, `created_at`, `updated_at`, `nomod`, `permiso`) VALUES
(1, 'Roles y Permisos', '5', '#', 'fa fa-circle', '2022-06-17 20:57:08', '2022-06-20 00:07:13', 0, 'RyP_access'),
(2, 'Modulos y Entidades', '3', '#', 'fa fa-circle', '2022-06-17 20:57:45', '2022-06-20 00:07:40', 0, 'ModYEnt_access'),
(5, 'Catalogos', '1', '#', 'fa fa-circle	', '2022-06-18 09:58:00', '2022-06-20 00:07:53', 0, 'Catalogos_access'),
(10, 'APIS Metodos de Pago', '6', '#', 'fa fa-circle', '2022-06-25 02:24:21', '2022-06-25 02:35:25', 0, 'Pasarelas_access');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `entidad_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `created_at`, `updated_at`, `entidad_id`) VALUES
(1, 'admin_panel_access', '2022-06-16 03:02:07', '2022-06-16 03:02:07', 0),
(2, 'users_access', '2022-06-16 03:02:07', '2022-06-17 21:52:27', 1),
(3, 'user_edit', '2022-06-16 03:02:07', '2022-06-16 03:02:07', 1),
(4, 'user_delete', '2022-06-16 03:02:07', '2022-06-16 03:02:07', 1),
(5, 'user_create', '2022-06-16 03:02:07', '2022-06-16 03:02:07', 1),
(6, 'user_show', '2022-06-16 03:02:07', '2022-06-16 03:02:07', 1),
(7, 'roles_access', '2022-06-16 03:02:07', '2022-06-16 03:02:07', 2),
(8, 'role_edit', '2022-06-16 03:02:07', '2022-06-17 21:53:03', 2),
(9, 'role_delete', '2022-06-16 03:02:07', '2022-06-19 23:49:12', 2),
(10, 'role_create', '2022-06-16 03:02:07', '2022-06-19 23:49:25', 2),
(11, 'role_show', '2022-06-16 03:02:07', '2022-06-19 23:49:19', 2),
(17, 'Post_access', '2022-06-17 02:05:15', '2022-06-17 02:05:15', 0),
(18, 'Post_create', '2022-06-17 02:05:57', '2022-06-17 02:05:57', 0),
(19, 'Post_delete', '2022-06-17 02:06:55', '2022-06-17 02:06:55', 0),
(25, 'Entidad_access', '2022-06-17 20:53:46', '2022-06-17 21:51:44', 5),
(26, 'Entidad_edit', '2022-06-17 20:53:46', '2022-06-17 20:53:46', 5),
(27, 'Entidad_delete', '2022-06-17 20:53:46', '2022-06-17 20:53:46', 5),
(28, 'Entidad_create', '2022-06-17 20:53:46', '2022-06-17 20:53:46', 5),
(29, 'Entidad_show', '2022-06-17 20:53:46', '2022-06-17 20:53:46', 5),
(30, 'Modulo_access', '2022-06-17 20:53:54', '2022-06-17 21:51:37', 4),
(31, 'Modulo_edit', '2022-06-17 20:53:54', '2022-06-17 20:53:54', 4),
(32, 'Modulo_delete', '2022-06-17 20:53:54', '2022-06-17 20:53:54', 4),
(33, 'Modulo_create', '2022-06-17 20:53:54', '2022-06-17 20:53:54', 4),
(34, 'Modulo_show', '2022-06-17 20:53:54', '2022-06-17 20:53:54', 4),
(36, 'Permission_access', '2022-06-17 21:34:25', '2022-06-17 21:51:09', 3),
(37, 'Permission_edit', '2022-06-17 21:34:25', '2022-06-17 21:51:15', 3),
(38, 'Permission_delete', '2022-06-17 21:34:25', '2022-06-17 21:34:25', 3),
(39, 'Permission_create', '2022-06-17 21:34:25', '2022-06-17 21:34:25', 3),
(40, 'Permission_show', '2022-06-17 21:34:25', '2022-06-17 21:34:25', 3),
(53, 'Color_access', '2022-06-18 09:59:31', '2022-06-18 09:59:31', 8),
(54, 'Color_edit', '2022-06-18 09:59:31', '2022-06-18 09:59:31', 8),
(55, 'Color_delete', '2022-06-18 09:59:31', '2022-06-18 09:59:31', 8),
(56, 'Color_create', '2022-06-18 09:59:31', '2022-06-18 09:59:31', 8),
(57, 'Color_show', '2022-06-18 09:59:31', '2022-06-18 09:59:31', 8),
(58, 'Size_access', '2022-06-18 09:59:42', '2022-06-18 09:59:42', 9),
(59, 'Size_edit', '2022-06-18 09:59:42', '2022-06-18 09:59:42', 9),
(60, 'Size_delete', '2022-06-18 09:59:42', '2022-06-18 09:59:42', 9),
(61, 'Size_create', '2022-06-18 09:59:42', '2022-06-18 09:59:42', 9),
(62, 'Size_show', '2022-06-18 09:59:42', '2022-06-18 09:59:42', 9),
(63, 'Category_access', '2022-06-18 10:00:01', '2022-06-18 10:00:01', 10),
(64, 'Category_edit', '2022-06-18 10:00:01', '2022-06-18 10:00:01', 10),
(65, 'Category_delete', '2022-06-18 10:00:01', '2022-06-18 10:00:01', 10),
(66, 'Category_create', '2022-06-18 10:00:01', '2022-06-18 10:00:01', 10),
(67, 'Category_show', '2022-06-18 10:00:01', '2022-06-18 10:00:01', 10),
(68, 'RyP_access', '2022-06-19 23:58:35', '2022-06-19 23:58:35', 0),
(69, 'ModYEnt_access', '2022-06-20 00:05:21', '2022-06-20 00:05:21', 0),
(70, 'Catalogos_access', '2022-06-20 00:05:35', '2022-06-20 00:05:43', 0),
(71, 'conekta_access', '2022-06-25 02:29:15', '2022-06-25 02:29:55', 12),
(72, 'Pasarelas_access', '2022-06-25 02:30:41', '2022-06-25 02:30:48', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `post`
--

INSERT INTO `post` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Ejemplo11', 'Ejemplo2', '2022-06-16 19:55:50', '2022-06-16 22:26:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

DROP TABLE IF EXISTS `reportes`;
CREATE TABLE `reportes` (
  `id_rpt` int(10) UNSIGNED NOT NULL,
  `clave` varchar(45) DEFAULT NULL,
  `descripcion` longtext DEFAULT NULL,
  `archivo` longtext NOT NULL,
  `hace_consulta` tinyint(1) NOT NULL DEFAULT 0,
  `user_session` tinyint(1) NOT NULL DEFAULT 0,
  `modulo` int(255) NOT NULL,
  `roles` longtext NOT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `reportes`
--

INSERT INTO `reportes` (`id_rpt`, `clave`, `descripcion`, `archivo`, `hace_consulta`, `user_session`, `modulo`, `roles`, `estatus`) VALUES
(4, '0', '0', '0', 0, 0, 0, '', 0),
(1, NULL, NULL, 'recetas_insumos', 0, 0, 0, '', 0),
(2, NULL, NULL, 'reporte_2', 0, 0, 0, '', 0),
(3, 'RPT-2', 'REPORTE DE USUARIOS', 'Prueba.jrxml', 1, 0, 1, '[\"22\",\"23\"]', 0),
(5, 'RPT-3', 'HelloWorld', 'hello_world.jrxml', 0, 0, 1, '[\"1\"]', 0),
(6, 'Productos Pedidos', 'Productos Pedidos', 'pro_ped_dia_con.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"27\",\"29\",\"33\",\"35\",\"36\",\"37\"]', 1),
(62, 'Pedidos Especiales por Estado', 'Pedidos Especiales por Estado', 'suc_ped_esp_edo.jrxml', 1, 0, 1, '[\"1\",\"24\",\"27\",\"28\",\"29\",\"31\",\"32\",\"33\",\"34\",\"35\"]', 1),
(7, 'pro_ped_sin_sur', 'Seguimiento a Pedidos', 'pro_seg_ped_suc.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\"]', 0),
(8, 'Seguimiento a Pedidos por Sucursal', 'Seguimiento a Pedidos por Sucursal', 'pro_seg_ped_suc.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"27\",\"28\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\"]', 1),
(9, 'Catálogo de Almacenes', 'Catálogo de Almacenes', 'cat_alm.jrxml', 1, 0, 1, '[\"1\",\"31\",\"32\",\"33\"]', 1),
(10, 'Existencias por Almacén', 'Existencias por Almacén', 'inv_exi_alm.jrxml', 1, 0, 1, '[\"1\",\"23\",\"24\",\"27\",\"30\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\",\"41\"]', 1),
(11, 'Catálogo de Categorías', 'Catálogo de  Categorías', 'cat_categorias.jrxml', 1, 0, 1, '[\"1\",\"31\",\"32\",\"33\"]', 1),
(12, 'Apertura de Sucursal', 'Apertura de Sucursal', 'suc_ape_ini.jrxml', 1, 0, 1, '[\"1\",\"24\",\"31\",\"32\",\"33\",\"37\"]', 1),
(13, 'Productos Pedidos por Sucursal', 'Productos Pedidos por Sucursal', 'pro_ped_dia_suc.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"27\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\"]', 1),
(14, 'Kárdex', 'Kárdex', 'inv_kar.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"27\",\"31\",\"32\",\"33\",\"35\",\"36\"]', 1),
(15, 'Productos de Pedidos sin Autorizar', 'Productos de Pedidos sin Autorizar', 'pro_ped_dia_sin_aut.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"27\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\"]', 1),
(16, 'Cierre de Sucursal', 'Cierre de Sucursal', 'suc_ape_fin.jrxml', 1, 0, 1, '[\"1\",\"24\",\"31\",\"32\",\"33\",\"37\"]', 1),
(17, 'Detalle de Operaciones por Sucursal', 'Detalle de Operaciones por Sucursal', 'suc_det_dia.jrxml', 1, 0, 1, '[\"1\",\"22\",\"24\",\"30\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\"]', 1),
(18, 'Ventas por Rango de Fechas', 'Ventas por Rango de Fechas', 'suc_vta_dia.jrxml', 1, 0, 1, '[\"1\",\"22\",\"24\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\"]', 1),
(19, 'Productos Surtidos por Etiqueta', 'Productos Surtidos por Etiqueta', 'log_pro_sur_eti.jrxml', 1, 0, 1, '[\"1\",\"24\",\"27\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\"]', 1),
(20, 'Productos Surtidos por Fecha de Caducidad', 'Productos Surtidos por Fecha de Caducidad', 'log_pro_sur_fc.jrxml', 1, 0, 1, '[\"1\",\"23\",\"24\",\"27\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\"]', 1),
(21, 'Existencias de Productos en Sucursales', 'Existencias de Productos en Sucursales', 'inv_exi_pro.jrxml', 1, 0, 1, '[\"1\",\"23\",\"24\",\"27\",\"29\",\"30\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\"]', 1),
(22, 'Movimientos al Inventario', 'Movimientos al Inventario', 'inv_mov_alm.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\"]', 1),
(23, 'Retiros de Caja', 'Retiros de Caja', 'suc_ret_caj.jrxml', 1, 0, 1, '[\"1\",\"24\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\"]', 1),
(24, 'Devoluciones de Productos por Sucursal', 'Devoluciones de Productos por Sucursal', 'suc_dev_cli.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"27\",\"29\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\"]', 1),
(25, 'Mermas por Sucursal', 'Mermas por Sucursal', 'suc_mer_pro.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"29\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\"]', 1),
(26, 'Oportunidades de Venta', 'Oportunidades de Venta', 'suc_opo_vta.jrxml', 1, 0, 1, '[\"1\",\"22\",\"24\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\",\"41\"]', 1),
(27, 'Traspasos y Transferencias entre Sucursales', 'Traspasos y Transferencias entre Sucursales', 'suc_tra_pro.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"27\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\"]', 1),
(28, 'Vales a Clientes por Sucursal', 'Vales a Clientes por Sucursal', 'suc_val_cli.jrxml', 1, 0, 1, '[\"1\",\"22\",\"24\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\"]', 1),
(29, 'Saldo de Cuentas por Cobrar', 'Saldo de Cuentas por Cobrar', 'suc_vta_cxc.jrxml', 1, 0, 1, '[\"1\",\"22\",\"24\",\"26\",\"30\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\",\"41\"]', 1),
(30, 'Pedido EspecialPDF', 'Pedido EspecialPDF', 'ped_esp_pdf.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"41\"]', 3),
(31, 'Catálogo de Usuarios', 'Catálogo de Usuarios', 'CatalogoUsuarios.jrxml', 1, 0, 1, '[\"1\",\"31\",\"32\",\"33\"]', 1),
(32, 'Catálogo de Clientes', 'Catálogo de Clientes', 'Clientes.jrxml', 1, 0, 1, '[\"1\",\"31\",\"32\",\"33\"]', 1),
(33, 'Catálogo de Choferes', 'Catálogo de Choferes', 'cat_chof.jrxml', 1, 0, 1, '[\"1\",\"31\",\"32\",\"33\"]', 1),
(34, 'Catálogo de Vehículos', 'Catálogo de Vehículos', 'cat_vehj.jrxml', 1, 0, 1, '[\"1\",\"31\",\"32\",\"33\"]', 1),
(35, 'Catálogo de Sucursales', 'Catálogo de Sucursales', 'cat_suc.jrxml', 0, 0, 1, '[\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\"]', 0),
(36, 'Catálogo de Sucursales', 'Catálogo de Sucursales', 'cat_suc.jrxml', 1, 0, 1, '[\"1\",\"31\",\"32\",\"33\"]', 1),
(37, 'Catálogo de Productos', 'Catálogo de Productos', 'cat_prod.jrxml', 1, 0, 1, '[\"1\",\"31\",\"32\",\"33\"]', 1),
(38, 'Existencias en Almacenes y Sucursales', 'Existencias en Almacenes y Sucursales', 'suc_exi_pro_sur.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"27\",\"30\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\",\"41\"]', 1),
(39, 'Ventas de Sucursal', 'Ventas de Sucursal', 'dir_rev_suc.jrxml', 1, 0, 1, '[\"1\",\"22\",\"24\",\"31\",\"33\",\"35\",\"36\",\"37\"]', 2),
(40, 'Ticket de Venta', 'Ticket de Venta', 'suc_tic_vta.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"30\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\",\"41\"]', 1),
(41, 'Análisis de Operación por Ticket', 'Análisis de Operación por Ticket', 'bar_det_ope.jrxml', 1, 0, 1, '[\"1\",\"22\",\"25\",\"26\",\"32\",\"33\",\"35\",\"36\",\"42\"]', 1),
(42, 'Recepción de Mercancía por Sucursal', 'Recepción de Mercancía por Sucursal', 'suc_ped_rec_sur.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"27\",\"31\",\"32\",\"33\",\"35\",\"36\",\"37\"]', 1),
(43, 'Preferencias de Consumo', 'Preferencias de Consumo', 'suc_vta_pre_con.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\"]', 1),
(44, 'Consulta de Pedidos Especiales', 'Consulta de Pedidos Especiales', 'suc_son_ped_esp.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\"]', 1),
(45, 'Gastos por Sucursal', 'Gastos por Sucursal', 'suc_gto_det.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\"]', 1),
(46, 'Listas de Precios de Productos', 'Listas de Precios de Productos', 'cat_pro_lis_pre.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\"]', 1),
(47, 'Análisis de Ventas de la Sucursal', 'Análisis de Ventas de la Sucursal', 'dir_vta_sem_suc.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\"]', 1),
(48, 'Pedidos Especiales Programados', 'Pedidos Especiales Programados', 'log_ped_esp_pro.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\"]', 1),
(49, 'categorias', 'categorias', 'categorias.jrxml', 1, 0, 1, '[\"1\",\"32\",\"33\"]', 1),
(50, 'Promociones por Sucursal', 'Promociones por Sucursal', 'suc_prom_pro.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\"]', 1),
(51, 'Pedidos Especiales por Estado', 'Pedidos Especiales por Estado', 'suc_ped_esp_edo.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\"]', 3),
(52, 'Solicitudes de Facturación', 'Solicitudes de Facturación', 'fac_sol_fac_tik.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\"]', 1),
(53, 'Asignación de Rutas a Sucursales', 'Asignación de Rutas a Sucursales', 'log_cat_rut_suc.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\"]', 1),
(54, 'Tickets Facturados', 'Tickets Facturados', 'fac_nta_vta_fac.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\"]', 1),
(55, 'Diferencias en Caja', 'Diferencias en Caja', 'suc_dif_ape_cie_caj.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\"]', 1),
(56, 'Diferencias en Inventarios', 'Diferencias en Inventarios', 'suc_dif_ape_cie_inv.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\"]', 1),
(57, 'Pedido Especial PDF', 'Pedido Especial PDF', 'ped_esp_pdf.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\"]', 1),
(58, 'Ventas con Desglose de Impuestos', 'Ventas con Desglose de Impuestos', 'suc_vta_dia_raz_soc.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\"]', 1),
(59, 'Precios de Formas para Pedido Especial', 'Precios de Formas para Pedido Especial', 'ped_esp_pre_for.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\"]', 1),
(60, 'Total de Productos Pedidos', 'Total de Productos Pedidos', 'pro_tot_pro_ped.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"35\"]', 1),
(61, 'Surtido a Sucursal', 'Surtido a Sucursal', 'log_sur_ped_suc.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"31\",\"32\",\"33\"]', 1),
(63, 'Existencias por Almacén por Fecha de Corte', 'Existencias por Almacén por Fecha de Corte', 'inv_exi_alm_fec_cor.jrxml', 1, 0, 1, '[\"1\",\"22\",\"24\",\"26\",\"33\"]', 1),
(64, 'Monitor de Autorización de Pedidos', 'Monitor de Autorización de Pedidos', 'mon_aut_ped_dia.jrxml', 1, 0, 1, '[\"1\",\"22\",\"23\",\"24\",\"25\",\"26\",\"28\",\"31\",\"32\",\"33\",\"35\"]', 1),
(65, 'Ventas por Producto', 'Ventas por Producto', 'suc_vta_pro.jrxml', 1, 0, 1, '[\"1\",\"24\",\"25\",\"26\",\"31\",\"32\",\"33\",\"37\"]', 1),
(66, 'Carga para Facturación de Tickets', 'Carga para Facturación de Tickets', 'ado_fac_not_vta.jrxml', 1, 0, 1, '[\"1\",\"22\",\"31\",\"32\",\"33\"]', 1),
(67, 'Resultado de Análisis de Operación', 'Resultado de Análisis de Operación', 'dir_ado_tot.jrxml', 1, 0, 1, '[\"1\",\"22\",\"25\",\"31\",\"32\",\"33\"]', 1),
(68, 'Prefactura', 'Prefactura', 'dir_ado_pre_fac.jrxml', 1, 0, 1, '[\"1\",\"22\",\"25\",\"31\",\"32\",\"33\"]', 1),
(69, 'Pedidos', 'Pedidos', 'pro_ped_dia_con.jrxml', 1, 1, 5, '[\"1\",\"2\",\"3\"]', 1),
(70, 'Pedidos', 'Pedidos', 'pro_ped_dia_con.jrxml', 1, 1, 5, '[\"1\",\"2\",\"3\"]', 1),
(71, 'Pedidos', 'Pedidos', 'pro_ped_dia_con.jrxml', 1, 1, 5, '[\"1\",\"2\",\"3\"]', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `title`, `short_code`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'Admin', '2022-06-16 03:02:07', '2022-06-16 03:02:07'),
(2, 'User', NULL, '2022-06-16 03:02:07', '2022-06-16 03:02:07'),
(3, 'Normal', 'normal', '2022-06-16 03:09:16', '2022-06-16 03:09:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
CREATE TABLE `role_permissions` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_permissions`
--

INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES
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
(2, 2),
(1, 17),
(1, 18),
(1, 19),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 9),
(2, 10),
(2, 11),
(2, 7),
(2, 8),
(2, 36),
(2, 37),
(2, 38),
(2, 39),
(2, 40),
(2, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(3, 1),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rptemail`
--

DROP TABLE IF EXISTS `rptemail`;
CREATE TABLE `rptemail` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL DEFAULT '',
  `ruta` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `cc` varchar(255) DEFAULT '',
  `asunto` varchar(255) NOT NULL DEFAULT '',
  `id_estatus` int(11) NOT NULL,
  `id_rpt` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rptemail`
--

INSERT INTO `rptemail` (`id`, `nombre`, `ruta`, `email`, `cc`, `asunto`, `id_estatus`, `id_rpt`, `updated_at`, `created_at`) VALUES
(1, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-02_12.pdf', 'mecott_rsl@hotmail.com', '', 'Apertura de Sucursal', 1, 12, '2022-02-02 17:04:36', '2022-02-02 17:04:36'),
(2, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-02_1.pdf', 'mecott_rsl@hotmail.com', '', 'Apertura de Sucursal', 1, 12, '2022-02-02 17:25:50', '2022-02-02 17:25:50'),
(3, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-02_12.pdf', 'mecott_rsl@hotmail.com', 'andres.lopez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-02 17:29:21', '2022-02-02 17:29:21'),
(4, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-02_63.pdf', 'mecott_rsl@hotmail.com', 'andres.lopez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-02 17:36:11', '2022-02-02 17:36:11'),
(5, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-02_95.pdf', 'mecott_rsl@hotmail.com', 'andres.lopez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-02 17:51:55', '2022-02-02 17:51:55'),
(6, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-02_88.pdf', 'mecott_rsl@hotmail.com', 'andres.lopez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-02 18:59:29', '2022-02-02 18:59:29'),
(7, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-03_58.pdf', 'mecott_rsl@hotmail.com', 'andres.lopez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-03 15:14:46', '2022-02-03 15:14:46'),
(8, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-03_13.pdf', 'mario.martinez@deuxestudio.com', 'andres.lopez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-03 19:08:57', '2022-02-03 19:08:57'),
(9, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-03_69.pdf', 'mario.martinez@deuxestudio.com', 'andres.lopez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-03 19:15:55', '2022-02-03 19:15:55'),
(10, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-03_6.pdf', 'mario.martinez@deuxestudio.com', 'andres.lopez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-03 19:18:59', '2022-02-03 19:18:59'),
(11, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-03_70.pdf', 'mario.martinez@deuxestudio.com', 'andres.lopez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-03 19:44:29', '2022-02-03 19:44:29'),
(12, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-03_53.pdf', 'mecott_rsl@hotmail.com', 'andres.lopez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-03 20:17:35', '2022-02-03 20:17:35'),
(13, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-03_20.pdf', 'mecott_rsl@hotmail.com', 'andres.lopez@deuxestudio.com, osmar.mecott@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-03 20:31:16', '2022-02-03 20:31:16'),
(14, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-03_52.pdf', 'mario.martinez@deuxestudio.com', 'andres.lopez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-03 21:49:16', '2022-02-03 21:49:16'),
(15, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-03_92.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-03 23:53:15', '2022-02-03 23:53:15'),
(16, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-03_75.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-03 23:54:13', '2022-02-03 23:54:13'),
(17, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-03_11.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-04 01:39:08', '2022-02-04 01:39:08'),
(18, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-03_62.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-04 02:04:34', '2022-02-04 02:04:34'),
(19, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-04_50.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-04 19:26:23', '2022-02-04 19:26:23'),
(20, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-04_54.pdf', 'rosariot_60@hotmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-04 22:38:17', '2022-02-04 22:38:17'),
(21, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-05_13.pdf', 'rosariot_60@hotmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-05 14:31:39', '2022-02-05 14:31:39'),
(22, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-05_19.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-05 14:32:48', '2022-02-05 14:32:48'),
(23, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-05_63.pdf', 'rosariot_60@hotmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-05 14:36:30', '2022-02-05 14:36:30'),
(24, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-05_26.pdf', 'rosariot_60@hotmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-05 14:37:39', '2022-02-05 14:37:39'),
(25, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-06_9.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-06 21:58:20', '2022-02-06 21:58:20'),
(26, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-09_30.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-09 19:39:54', '2022-02-09 19:39:54'),
(27, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-09_3.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-09 21:37:27', '2022-02-09 21:37:27'),
(28, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-09_72.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-09 21:37:33', '2022-02-09 21:37:33'),
(29, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-09_95.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-09 21:51:47', '2022-02-09 21:51:47'),
(30, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-09_18.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-10 00:52:51', '2022-02-10 00:52:51'),
(31, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-09_11.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-10 00:54:21', '2022-02-10 00:54:21'),
(32, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-10_31.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-10 17:44:17', '2022-02-10 17:44:17'),
(33, 'ped_esp_pdf', 'files/reportesmail/ped_esp_pdf_2022-02-10_80.pdf', 'themariomarvel@gmail.com', NULL, 'Pedido Especial PDF', 1, 30, '2022-02-10 21:45:18', '2022-02-10 21:45:18'),
(34, 'ped_esp_pdf', 'files/reportesmail/ped_esp_pdf_2022-02-10_2.pdf', 'themariomarvel@gmail.com', NULL, 'Pedido Especial PDF', 1, 30, '2022-02-10 21:47:48', '2022-02-10 21:47:48'),
(35, 'ped_esp_pdf', 'files/reportesmail/ped_esp_pdf_2022-02-10_36.pdf', 'themariomarvel@gmail.com', NULL, 'Pedido Especial PDF', 1, 30, '2022-02-10 21:48:53', '2022-02-10 21:48:53'),
(36, 'ped_esp_pdf', 'files/reportesmail/ped_esp_pdf_2022-02-10_43.pdf', 'themariomarvel@gmail.com', NULL, 'Pedido Especial PDF', 1, 30, '2022-02-10 21:51:05', '2022-02-10 21:51:05'),
(37, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-10_17.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-10 21:56:31', '2022-02-10 21:56:31'),
(38, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-10_69.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-10 22:02:12', '2022-02-10 22:02:12'),
(39, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-10_55.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-10 22:49:34', '2022-02-10 22:49:34'),
(40, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-10_59.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-10 22:54:19', '2022-02-10 22:54:19'),
(41, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-10_47.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-11 01:02:39', '2022-02-11 01:02:39'),
(42, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-10_71.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-11 01:12:46', '2022-02-11 01:12:46'),
(43, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-10_61.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-11 03:36:39', '2022-02-11 03:36:39'),
(44, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-10_72.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-11 04:31:14', '2022-02-11 04:31:14'),
(45, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-10_93.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-11 05:40:48', '2022-02-11 05:40:48'),
(46, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-11_69.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-11 15:52:46', '2022-02-11 15:52:46'),
(47, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-11_1.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-12 00:56:27', '2022-02-12 00:56:27'),
(48, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-14_61.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-14 15:38:54', '2022-02-14 15:38:54'),
(49, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-14_80.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-14 15:52:41', '2022-02-14 15:52:41'),
(50, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-14_56.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-14 16:17:55', '2022-02-14 16:17:55'),
(51, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-14_6.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-14 16:25:12', '2022-02-14 16:25:12'),
(52, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-14_44.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-15 01:59:47', '2022-02-15 01:59:47'),
(53, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-15_50.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-15 19:55:13', '2022-02-15 19:55:13'),
(54, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-16_60.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-16 17:04:36', '2022-02-16 17:04:36'),
(55, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-17_96.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-17 16:11:03', '2022-02-17 16:11:03'),
(56, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-17_46.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-17 17:46:44', '2022-02-17 17:46:44'),
(57, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-18_7.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-18 16:10:42', '2022-02-18 16:10:42'),
(58, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-18_36.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-18 16:12:51', '2022-02-18 16:12:51'),
(59, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-18_60.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-18 16:14:18', '2022-02-18 16:14:18'),
(60, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-18_19.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-18 16:16:02', '2022-02-18 16:16:02'),
(61, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-18_6.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-18 16:16:12', '2022-02-18 16:16:12'),
(62, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-18_18.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-18 16:19:13', '2022-02-18 16:19:13'),
(63, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-18_5.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-18 16:20:19', '2022-02-18 16:20:19'),
(64, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-18_35.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-18 16:20:36', '2022-02-18 16:20:36'),
(65, 'ped_esp_pdf', 'files/reportesmail/ped_esp_pdf_2022-02-18_32.pdf', 'themariomarvel@gmail.com', NULL, 'Pedido Especial PDF', 1, 30, '2022-02-18 19:19:27', '2022-02-18 19:19:27'),
(66, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-18_48.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-18 23:58:30', '2022-02-18 23:58:30'),
(67, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-18_74.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-19 00:04:10', '2022-02-19 00:04:10'),
(68, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-18_94.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-19 00:07:04', '2022-02-19 00:07:04'),
(69, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-19_54.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-19 19:33:10', '2022-02-19 19:33:10'),
(70, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-19_6.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-19 19:35:58', '2022-02-19 19:35:58'),
(71, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-19_9.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-19 19:38:38', '2022-02-19 19:38:38'),
(72, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-19_94.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-19 19:39:51', '2022-02-19 19:39:51'),
(73, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-19_60.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-19 19:40:59', '2022-02-19 19:40:59'),
(74, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-19_57.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-19 19:43:23', '2022-02-19 19:43:23'),
(75, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-19_96.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-19 19:49:35', '2022-02-19 19:49:35'),
(76, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-19_99.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-19 19:50:45', '2022-02-19 19:50:45'),
(77, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-19_85.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-19 19:50:47', '2022-02-19 19:50:47'),
(78, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-19_18.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-19 21:18:47', '2022-02-19 21:18:47'),
(79, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-19_23.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-19 21:39:06', '2022-02-19 21:39:06'),
(80, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-21_12.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-21 16:40:19', '2022-02-21 16:40:19'),
(81, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-21_59.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-21 17:22:11', '2022-02-21 17:22:11'),
(82, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-21_91.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-21 17:32:34', '2022-02-21 17:32:34'),
(83, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-21_64.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-21 17:33:29', '2022-02-21 17:33:29'),
(84, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-21_73.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-21 17:55:18', '2022-02-21 17:55:18'),
(85, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-21_54.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-21 17:57:16', '2022-02-21 17:57:16'),
(86, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-21_26.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-21 23:54:48', '2022-02-21 23:54:48'),
(87, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-21_29.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-22 02:13:01', '2022-02-22 02:13:01'),
(88, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-21_47.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-22 02:56:16', '2022-02-22 02:56:16'),
(89, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-21_89.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-22 03:35:35', '2022-02-22 03:35:35'),
(90, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-21_34.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-22 04:46:46', '2022-02-22 04:46:46'),
(91, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-22_2.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-22 16:35:29', '2022-02-22 16:35:29'),
(92, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-22_94.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-22 17:29:39', '2022-02-22 17:29:39'),
(93, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-22_45.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-22 20:34:51', '2022-02-22 20:34:51'),
(94, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-22_75.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-22 20:43:16', '2022-02-22 20:43:16'),
(95, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-22_70.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-23 00:15:16', '2022-02-23 00:15:16'),
(96, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-22_58.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-23 00:19:21', '2022-02-23 00:19:21'),
(97, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-22_3.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-23 04:49:21', '2022-02-23 04:49:21'),
(98, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-22_31.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-23 04:51:10', '2022-02-23 04:51:10'),
(99, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-23_91.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-23 16:19:05', '2022-02-23 16:19:05'),
(100, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-23_4.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-23 17:23:47', '2022-02-23 17:23:47'),
(101, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-23_98.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-23 18:14:17', '2022-02-23 18:14:17'),
(102, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-23_33.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal', 1, 16, '2022-02-23 21:10:44', '2022-02-23 21:10:44'),
(103, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-23_74.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal', 1, 12, '2022-02-23 22:23:43', '2022-02-23 22:23:43'),
(104, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-23_63.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-02-24 00:50:17', '2022-02-24 00:50:17'),
(105, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-24_9.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-02-24 16:11:20', '2022-02-24 16:11:20'),
(106, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-24_89.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-02-24 18:34:36', '2022-02-24 18:34:36'),
(107, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-24_18.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-02-24 22:10:58', '2022-02-24 22:10:58'),
(108, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-24_77.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-02-24 22:15:26', '2022-02-24 22:15:26'),
(109, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-25_79.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-02-25 16:04:40', '2022-02-25 16:04:40'),
(110, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-25_39.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-02-25 18:52:41', '2022-02-25 18:52:41'),
(111, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-25_71.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-02-25 20:23:46', '2022-02-25 20:23:46'),
(112, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-25_68.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-02-25 21:56:50', '2022-02-25 21:56:50'),
(113, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-25_51.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-02-26 00:16:31', '2022-02-26 00:16:31'),
(114, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-25_82.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-02-26 00:21:53', '2022-02-26 00:21:53'),
(115, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-25_98.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-02-26 00:34:19', '2022-02-26 00:34:19'),
(116, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-25_93.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-02-26 04:07:59', '2022-02-26 04:07:59'),
(117, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-26_49.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-02-26 15:54:42', '2022-02-26 15:54:42'),
(118, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-26_43.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-02-26 16:22:08', '2022-02-26 16:22:08'),
(119, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-26_73.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-02-26 21:01:33', '2022-02-26 21:01:33'),
(120, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-26_28.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-02-26 21:11:41', '2022-02-26 21:11:41'),
(121, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-26_84.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-02-27 05:12:16', '2022-02-27 05:12:16'),
(122, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-27_47.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-02-27 19:16:59', '2022-02-27 19:16:59'),
(123, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-27_79.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-02-28 02:34:13', '2022-02-28 02:34:13'),
(124, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-27_86.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-02-28 02:42:49', '2022-02-28 02:42:49'),
(125, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-27_73.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-02-28 02:53:32', '2022-02-28 02:53:32'),
(126, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-27_91.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-02-28 02:56:29', '2022-02-28 02:56:29'),
(127, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-02-27_38.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-02-28 02:58:37', '2022-02-28 02:58:37'),
(128, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-27_78.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-02-28 03:00:18', '2022-02-28 03:00:18'),
(129, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-02-28_18.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-02-28 15:09:34', '2022-02-28 15:09:34'),
(130, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-02_41.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-02 14:48:41', '2022-03-02 14:48:41'),
(131, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-02_24.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-02 16:51:37', '2022-03-02 16:51:37'),
(132, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-03_45.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-03 18:20:42', '2022-03-03 18:20:42'),
(133, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-03_96.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-03-03 19:10:48', '2022-03-03 19:10:48'),
(134, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-03_31.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-03 22:55:38', '2022-03-03 22:55:38'),
(135, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-04_22.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-04 16:40:45', '2022-03-04 16:40:45'),
(136, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-04_65.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-04 16:44:03', '2022-03-04 16:44:03'),
(137, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-04_56.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-03-05 00:15:54', '2022-03-05 00:15:54'),
(138, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-04_63.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-05 00:17:28', '2022-03-05 00:17:28'),
(139, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-06_84.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-06 17:55:56', '2022-03-06 17:55:56'),
(140, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-07_71.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-07 15:00:13', '2022-03-07 15:00:13'),
(141, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-07_31.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-07 21:13:29', '2022-03-07 21:13:29'),
(142, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-07_66.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-07 23:56:21', '2022-03-07 23:56:21'),
(143, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-07_75.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-03-07 23:59:43', '2022-03-07 23:59:43'),
(144, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-07_25.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-08 00:00:32', '2022-03-08 00:00:32'),
(145, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-07_9.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-03-08 00:56:20', '2022-03-08 00:56:20'),
(146, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-07_52.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-08 00:58:07', '2022-03-08 00:58:07'),
(147, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-07_19.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-03-08 00:58:55', '2022-03-08 00:58:55'),
(148, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-08_45.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-08 17:54:16', '2022-03-08 17:54:16'),
(149, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-08_72.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-03-09 00:29:10', '2022-03-09 00:29:10'),
(150, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-08_53.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-09 03:04:15', '2022-03-09 03:04:15'),
(151, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-09_56.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-09 14:49:28', '2022-03-09 14:49:28'),
(152, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-09_42.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-09 18:12:49', '2022-03-09 18:12:49'),
(153, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-09_18.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-09 18:25:15', '2022-03-09 18:25:15'),
(154, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-09_92.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-09 18:43:32', '2022-03-09 18:43:32'),
(155, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-09_30.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-03-09 21:17:22', '2022-03-09 21:17:22'),
(156, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-09_77.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-09 21:31:00', '2022-03-09 21:31:00'),
(157, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-09_74.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-09 22:09:15', '2022-03-09 22:09:15'),
(158, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-10_65.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-10 15:42:10', '2022-03-10 15:42:10'),
(159, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-11_49.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-03-11 06:46:00', '2022-03-11 06:46:00'),
(160, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-11_37.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-11 18:30:29', '2022-03-11 18:30:29'),
(161, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-12_93.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-12 15:09:39', '2022-03-12 15:09:39'),
(162, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-12_23.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-12 20:42:14', '2022-03-12 20:42:14'),
(163, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-13_52.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-14 02:28:25', '2022-03-14 02:28:25'),
(164, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-13_17.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-14 05:21:04', '2022-03-14 05:21:04'),
(165, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-14_42.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-14 14:35:18', '2022-03-14 14:35:18'),
(166, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-14_94.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-03-14 14:42:32', '2022-03-14 14:42:32'),
(167, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-14_60.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-14 15:04:35', '2022-03-14 15:04:35'),
(168, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-15_25.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: MELCHOR OCAMPO', 1, 12, '2022-03-15 14:20:49', '2022-03-15 14:20:49'),
(169, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-16_76.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-16 18:12:13', '2022-03-16 18:12:13'),
(170, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-16_27.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-16 22:49:31', '2022-03-16 22:49:31'),
(171, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-16_76.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-03-16 22:50:24', '2022-03-16 22:50:24'),
(172, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-16_31.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-16 22:53:17', '2022-03-16 22:53:17'),
(173, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-16_7.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-03-16 23:33:48', '2022-03-16 23:33:48'),
(174, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-16_16.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-16 23:35:53', '2022-03-16 23:35:53'),
(175, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-17_47.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: MELCHOR OCAMPO', 1, 12, '2022-03-17 15:44:14', '2022-03-17 15:44:14'),
(176, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-17_63.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-17 16:05:21', '2022-03-17 16:05:21'),
(177, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-17_43.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: 5 DE MAYO', 1, 12, '2022-03-17 20:31:15', '2022-03-17 20:31:15'),
(178, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-17_74.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: 5 DE MAYO', 1, 16, '2022-03-17 20:39:27', '2022-03-17 20:39:27'),
(179, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-17_58.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-17 20:42:28', '2022-03-17 20:42:28'),
(180, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-17_16.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-03-17 23:30:08', '2022-03-17 23:30:08'),
(181, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-17_25.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-17 23:41:35', '2022-03-17 23:41:35'),
(182, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-18_46.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-18 15:06:52', '2022-03-18 15:06:52'),
(183, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-18_87.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-18 16:22:26', '2022-03-18 16:22:26'),
(184, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-18_32.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-03-18 19:40:18', '2022-03-18 19:40:18'),
(185, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-18_83.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-18 19:42:10', '2022-03-18 19:42:10'),
(186, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-18_85.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-03-18 19:44:14', '2022-03-18 19:44:14'),
(187, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-19_59.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-19 14:42:51', '2022-03-19 14:42:51'),
(188, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-19_19.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-19 14:58:33', '2022-03-19 14:58:33'),
(189, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-19_49.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-19 16:36:45', '2022-03-19 16:36:45'),
(190, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-19_86.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-03-19 16:38:13', '2022-03-19 16:38:13'),
(191, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-19_32.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-19 16:39:22', '2022-03-19 16:39:22'),
(192, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-19_3.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-03-19 16:47:55', '2022-03-19 16:47:55'),
(193, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-19_67.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: 5 DE MAYO', 1, 12, '2022-03-19 16:53:05', '2022-03-19 16:53:05'),
(194, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-19_18.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: 5 DE MAYO', 1, 16, '2022-03-19 16:56:14', '2022-03-19 16:56:14'),
(195, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-19_42.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-19 17:46:44', '2022-03-19 17:46:44'),
(196, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-19_37.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-19 17:48:26', '2022-03-19 17:48:26'),
(197, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-19_53.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-19 17:50:18', '2022-03-19 17:50:18'),
(198, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-19_59.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-19 17:51:37', '2022-03-19 17:51:37'),
(199, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-19_8.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-19 17:52:36', '2022-03-19 17:52:36'),
(200, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-19_90.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-19 18:24:39', '2022-03-19 18:24:39'),
(201, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-19_16.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-19 18:32:15', '2022-03-19 18:32:15'),
(202, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-19_75.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-19 18:34:07', '2022-03-19 18:34:07'),
(203, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-19_14.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-19 18:35:55', '2022-03-19 18:35:55'),
(204, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-19_5.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-19 18:38:01', '2022-03-19 18:38:01'),
(205, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-19_54.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-19 19:13:55', '2022-03-19 19:13:55'),
(206, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-19_6.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-19 19:32:15', '2022-03-19 19:32:15'),
(207, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-19_81.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-19 20:39:22', '2022-03-19 20:39:22'),
(208, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-19_85.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-19 20:41:29', '2022-03-19 20:41:29'),
(209, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-19_7.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-19 21:09:19', '2022-03-19 21:09:19'),
(210, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-20_99.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-20 20:14:49', '2022-03-20 20:14:49'),
(211, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-20_98.pdf', 'marcasiqueg@yahoo.com.mx', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: COYOL', 1, 12, '2022-03-21 02:25:38', '2022-03-21 02:25:38'),
(212, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-21_90.pdf', 'marcasiqueg@yahoo.com.mx', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: COYOL', 1, 12, '2022-03-21 06:22:57', '2022-03-21 06:22:57'),
(213, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-21_11.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-21 14:39:10', '2022-03-21 14:39:10'),
(214, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-21_34.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-21 14:40:25', '2022-03-21 14:40:25'),
(215, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-21_98.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-21 15:26:45', '2022-03-21 15:26:45'),
(216, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-21_42.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-21 15:33:08', '2022-03-21 15:33:08'),
(217, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-21_24.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-21 15:34:44', '2022-03-21 15:34:44'),
(218, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-21_89.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-21 15:35:23', '2022-03-21 15:35:23'),
(219, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-21_38.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-21 16:28:55', '2022-03-21 16:28:55'),
(220, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-21_16.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-21 16:46:09', '2022-03-21 16:46:09'),
(221, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-21_2.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-21 16:47:44', '2022-03-21 16:47:44'),
(222, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-21_39.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-21 20:19:27', '2022-03-21 20:19:27'),
(223, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-21_31.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-22 05:41:50', '2022-03-22 05:41:50'),
(224, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-22_10.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-22 18:17:28', '2022-03-22 18:17:28'),
(225, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-22_67.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: 5 DE MAYO', 1, 12, '2022-03-22 19:01:38', '2022-03-22 19:01:38'),
(226, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-22_54.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-22 20:54:10', '2022-03-22 20:54:10'),
(227, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-22_46.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-22 21:58:51', '2022-03-22 21:58:51'),
(228, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-22_40.pdf', 'marcasiqueg@yahoo.com.mx', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: COYOL', 1, 12, '2022-03-22 23:13:13', '2022-03-22 23:13:13'),
(229, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-22_15.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-22 23:19:36', '2022-03-22 23:19:36'),
(230, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-23_24.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-23 19:38:16', '2022-03-23 19:38:16');
INSERT INTO `rptemail` (`id`, `nombre`, `ruta`, `email`, `cc`, `asunto`, `id_estatus`, `id_rpt`, `updated_at`, `created_at`) VALUES
(231, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-23_19.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-23 19:57:41', '2022-03-23 19:57:41'),
(232, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-23_29.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-23 21:41:47', '2022-03-23 21:41:47'),
(233, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-23_48.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-23 21:55:09', '2022-03-23 21:55:09'),
(234, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-23_65.pdf', 'marcasiqueg@yahoo.com.mx', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: COYOL', 1, 12, '2022-03-23 22:31:42', '2022-03-23 22:31:42'),
(235, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-23_56.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-24 04:31:47', '2022-03-24 04:31:47'),
(236, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-24_91.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-24 18:22:51', '2022-03-24 18:22:51'),
(237, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-24_1.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-24 21:20:19', '2022-03-24 21:20:19'),
(238, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-24_9.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-24 21:24:43', '2022-03-24 21:24:43'),
(239, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-24_60.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-24 22:00:12', '2022-03-24 22:00:12'),
(240, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-25_71.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-25 13:21:51', '2022-03-25 13:21:51'),
(241, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-25_92.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: 5 DE MAYO', 1, 12, '2022-03-25 19:26:01', '2022-03-25 19:26:01'),
(242, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-25_90.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: 5 DE MAYO', 1, 12, '2022-03-25 19:26:07', '2022-03-25 19:26:07'),
(243, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-26_56.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-26 21:13:48', '2022-03-26 21:13:48'),
(244, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-28_17.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-28 19:13:52', '2022-03-28 19:13:52'),
(245, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-29_4.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-29 17:53:27', '2022-03-29 17:53:27'),
(246, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-29_51.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-29 20:48:11', '2022-03-29 20:48:11'),
(247, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-29_78.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-29 20:53:54', '2022-03-29 20:53:54'),
(248, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-29_20.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-29 20:55:16', '2022-03-29 20:55:16'),
(249, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-29_61.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-29 21:04:58', '2022-03-29 21:04:58'),
(250, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-29_54.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-29 21:50:54', '2022-03-29 21:50:54'),
(251, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-29_43.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-29 22:18:24', '2022-03-29 22:18:24'),
(252, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-29_5.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-30 00:33:20', '2022-03-30 00:33:20'),
(253, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-29_9.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-30 00:35:35', '2022-03-30 00:35:35'),
(254, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-29_99.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-30 00:36:32', '2022-03-30 00:36:32'),
(255, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-30_79.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-30 15:58:32', '2022-03-30 15:58:32'),
(256, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-30_76.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: 5 DE MAYO', 1, 12, '2022-03-30 19:32:38', '2022-03-30 19:32:38'),
(257, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-30_26.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-30 20:10:29', '2022-03-30 20:10:29'),
(258, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-30_74.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-30 21:11:07', '2022-03-30 21:11:07'),
(259, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-30_80.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-30 21:55:34', '2022-03-30 21:55:34'),
(260, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-30_14.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-31 02:12:10', '2022-03-31 02:12:10'),
(261, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-30_42.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-03-31 04:32:43', '2022-03-31 04:32:43'),
(262, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-31_94.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-31 15:13:26', '2022-03-31 15:13:26'),
(263, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-31_15.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-31 15:52:08', '2022-03-31 15:52:08'),
(264, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-31_69.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-31 16:05:15', '2022-03-31 16:05:15'),
(265, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-31_54.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-03-31 16:13:43', '2022-03-31 16:13:43'),
(266, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-31_63.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-03-31 20:29:53', '2022-03-31 20:29:53'),
(267, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-03-31_13.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-03-31 21:00:58', '2022-03-31 21:00:58'),
(268, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-03-31_41.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-04-01 02:27:17', '2022-04-01 02:27:17'),
(269, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-01_94.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-01 16:38:03', '2022-04-01 16:38:03'),
(270, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-01_16.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: 5 DE MAYO', 1, 12, '2022-04-01 22:42:34', '2022-04-01 22:42:34'),
(271, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-01_18.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: MELCHOR OCAMPO', 1, 12, '2022-04-01 23:01:06', '2022-04-01 23:01:06'),
(272, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-04-01_44.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: MELCHOR OCAMPO', 1, 16, '2022-04-01 23:14:01', '2022-04-01 23:14:01'),
(273, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-01_95.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: MELCHOR OCAMPO', 1, 12, '2022-04-01 23:15:42', '2022-04-01 23:15:42'),
(274, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-01_96.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: MELCHOR OCAMPO', 1, 12, '2022-04-01 23:16:18', '2022-04-01 23:16:18'),
(275, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-01_31.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: MELCHOR OCAMPO', 1, 12, '2022-04-01 23:54:48', '2022-04-01 23:54:48'),
(276, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-04_85.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-04 20:01:15', '2022-04-04 20:01:15'),
(277, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-05_34.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-05 14:22:52', '2022-04-05 14:22:52'),
(278, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-04-05_43.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-04-05 15:21:30', '2022-04-05 15:21:30'),
(279, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-05_35.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-05 15:23:18', '2022-04-05 15:23:18'),
(280, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-05_27.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-04-05 15:36:35', '2022-04-05 15:36:35'),
(281, 'ped_esp_pdf', 'files/reportesmail/ped_esp_pdf_2022-04-05_89.pdf', 'latogasistemas@gmail.com', NULL, 'Pedido Especial PDF', 1, 30, '2022-04-05 16:08:33', '2022-04-05 16:08:33'),
(282, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-05_86.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: 5 DE MAYO', 1, 12, '2022-04-05 18:06:27', '2022-04-05 18:06:27'),
(283, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-06_71.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-06 14:23:35', '2022-04-06 14:23:35'),
(284, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-06_31.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: 5 DE MAYO', 1, 12, '2022-04-06 14:44:08', '2022-04-06 14:44:08'),
(285, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-07_31.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: 5 DE MAYO', 1, 12, '2022-04-07 14:23:17', '2022-04-07 14:23:17'),
(286, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-07_52.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-07 14:24:21', '2022-04-07 14:24:21'),
(287, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-07_95.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: 5 DE MxxxxAYO', 1, 12, '2022-04-07 14:37:49', '2022-04-07 14:37:49'),
(288, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-07_14.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: MELCHOR OCAMPO', 1, 12, '2022-04-07 14:55:38', '2022-04-07 14:55:38'),
(289, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-07_41.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-04-07 16:10:24', '2022-04-07 16:10:24'),
(290, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-08_21.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-08 14:51:36', '2022-04-08 14:51:36'),
(291, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-08_4.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-04-08 15:30:45', '2022-04-08 15:30:45'),
(292, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-09_38.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-09 15:19:13', '2022-04-09 15:19:13'),
(293, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-04-09_24.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-04-09 19:09:15', '2022-04-09 19:09:15'),
(294, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-11_15.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-11 13:37:52', '2022-04-11 13:37:52'),
(295, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-18_13.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-18 15:03:08', '2022-04-18 15:03:08'),
(296, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-19_77.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-19 15:23:30', '2022-04-19 15:23:30'),
(297, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-20_61.pdf', 'themariomarvel@gmail.com', 'alejandro.hernandez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-20 16:42:51', '2022-04-20 16:42:51'),
(298, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-21_15.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-22 01:25:28', '2022-04-22 01:25:28'),
(299, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-21_46.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-22 01:25:28', '2022-04-22 01:25:28'),
(300, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-22_48.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-22 17:33:05', '2022-04-22 17:33:05'),
(301, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-23_86.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-23 17:24:09', '2022-04-23 17:24:09'),
(302, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-24_39.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-25 01:44:40', '2022-04-25 01:44:40'),
(303, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-04-24_59.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-04-25 01:49:26', '2022-04-25 01:49:26'),
(304, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-24_24.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-25 01:50:50', '2022-04-25 01:50:50'),
(305, 'ped_esp_pdf', 'files/reportesmail/ped_esp_pdf_2022-04-24_17.pdf', 'themariomarvel@gmail.com', NULL, 'Pedido Especial PDF', 1, 30, '2022-04-25 03:12:14', '2022-04-25 03:12:14'),
(306, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-04-24_42.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-04-25 03:17:00', '2022-04-25 03:17:00'),
(307, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-25_83.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-25 13:56:53', '2022-04-25 13:56:53'),
(308, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-25_53.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-04-25 20:30:08', '2022-04-25 20:30:08'),
(309, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-04-25_48.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-04-25 20:42:47', '2022-04-25 20:42:47'),
(310, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-25_77.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-04-25 20:47:08', '2022-04-25 20:47:08'),
(311, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-04-25_71.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-04-25 20:48:01', '2022-04-25 20:48:01'),
(312, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-26_11.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-26 13:58:50', '2022-04-26 13:58:50'),
(313, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-04-26_6.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-04-26 23:38:58', '2022-04-26 23:38:58'),
(314, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-27_73.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-27 13:55:27', '2022-04-27 13:55:27'),
(315, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-28_69.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-28 17:10:10', '2022-04-28 17:10:10'),
(316, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-04-29_96.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-04-29 14:20:22', '2022-04-29 14:20:22'),
(317, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-02_38.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-02 16:54:15', '2022-05-02 16:54:15'),
(318, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-02_53.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-05-02 17:18:30', '2022-05-02 17:18:30'),
(319, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-02_91.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-05-02 18:20:26', '2022-05-02 18:20:26'),
(320, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-02_2.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-02 20:53:46', '2022-05-02 20:53:46'),
(321, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-02_35.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-02 21:05:38', '2022-05-02 21:05:38'),
(322, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-03_53.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-03 15:15:34', '2022-05-03 15:15:34'),
(323, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-03_94.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-05-03 19:20:22', '2022-05-03 19:20:22'),
(324, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-03_43.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-05-03 19:20:27', '2022-05-03 19:20:27'),
(325, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-03_37.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-03 20:31:02', '2022-05-03 20:31:02'),
(326, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-03_88.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-03 20:36:10', '2022-05-03 20:36:10'),
(327, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-03_72.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-04 02:24:31', '2022-05-04 02:24:31'),
(328, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-04_18.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-04 14:33:01', '2022-05-04 14:33:01'),
(329, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-04_63.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-04 19:43:49', '2022-05-04 19:43:49'),
(330, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-04_45.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-04 20:21:37', '2022-05-04 20:21:37'),
(331, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-05_78.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-05 13:29:48', '2022-05-05 13:29:48'),
(332, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-05_67.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-05-05 15:48:55', '2022-05-05 15:48:55'),
(333, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-05_79.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-05 20:35:23', '2022-05-05 20:35:23'),
(334, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-05_88.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-05 20:49:27', '2022-05-05 20:49:27'),
(335, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-05_31.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-06 02:51:46', '2022-05-06 02:51:46'),
(336, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-06_52.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-06 14:30:06', '2022-05-06 14:30:06'),
(337, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-06_47.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-06 19:30:36', '2022-05-06 19:30:36'),
(338, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-06_92.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-06 20:37:53', '2022-05-06 20:37:53'),
(339, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-06_57.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-07 02:47:45', '2022-05-07 02:47:45'),
(340, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-07_52.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-07 15:44:19', '2022-05-07 15:44:19'),
(341, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-10_2.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-05-10 15:03:34', '2022-05-10 15:03:34'),
(342, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-11_62.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-05-11 18:32:49', '2022-05-11 18:32:49'),
(343, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-11_60.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-05-11 18:58:52', '2022-05-11 18:58:52'),
(344, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-11_34.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-05-11 18:59:32', '2022-05-11 18:59:32'),
(345, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-11_30.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-11 19:40:00', '2022-05-11 19:40:00'),
(346, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-11_74.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-11 19:44:18', '2022-05-11 19:44:18'),
(347, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-11_76.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: MELCHOR OCAMPO', 1, 12, '2022-05-11 19:50:17', '2022-05-11 19:50:17'),
(348, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-11_26.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: MELCHOR OCAMPO', 1, 16, '2022-05-11 19:53:38', '2022-05-11 19:53:38'),
(349, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-11_64.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-11 20:28:18', '2022-05-11 20:28:18'),
(350, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-12_14.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-05-12 15:15:57', '2022-05-12 15:15:57'),
(351, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-12_41.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-12 18:01:34', '2022-05-12 18:01:34'),
(352, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-12_90.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-12 18:22:04', '2022-05-12 18:22:04'),
(353, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-12_72.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: 5 DE MAYO', 1, 12, '2022-05-12 19:00:19', '2022-05-12 19:00:19'),
(354, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-12_98.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: 5 DE MAYO', 1, 16, '2022-05-12 19:02:35', '2022-05-12 19:02:35'),
(355, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-13_3.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-13 13:52:03', '2022-05-13 13:52:03'),
(356, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-13_84.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-13 13:53:35', '2022-05-13 13:53:35'),
(357, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-13_78.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-13 15:42:55', '2022-05-13 15:42:55'),
(358, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-13_96.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: 5 DE MAYO', 1, 12, '2022-05-13 16:38:00', '2022-05-13 16:38:00'),
(359, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-13_80.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: 5 DE MAYO', 1, 16, '2022-05-13 19:24:19', '2022-05-13 19:24:19'),
(360, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-13_63.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-13 20:23:38', '2022-05-13 20:23:38'),
(361, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-13_70.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: 5 DE MAYO', 1, 12, '2022-05-13 20:36:10', '2022-05-13 20:36:10'),
(362, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-13_51.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-13 21:08:05', '2022-05-13 21:08:05'),
(363, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-13_36.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-05-13 22:52:31', '2022-05-13 22:52:31'),
(364, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-13_40.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-14 02:25:59', '2022-05-14 02:25:59'),
(365, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-13_90.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: 5 DE MAYO', 1, 16, '2022-05-14 02:53:23', '2022-05-14 02:53:23'),
(366, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-15_11.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-05-15 20:30:35', '2022-05-15 20:30:35'),
(367, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-15_68.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-15 20:41:09', '2022-05-15 20:41:09'),
(368, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-16_85.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-16 13:49:02', '2022-05-16 13:49:02'),
(369, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-16_22.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-05-16 14:25:16', '2022-05-16 14:25:16'),
(370, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-16_94.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-16 15:16:15', '2022-05-16 15:16:15'),
(371, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-16_13.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-16 15:37:16', '2022-05-16 15:37:16'),
(372, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-16_35.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-16 15:50:24', '2022-05-16 15:50:24'),
(373, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-16_81.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-16 16:26:58', '2022-05-16 16:26:58'),
(374, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-16_66.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-16 16:30:16', '2022-05-16 16:30:16'),
(375, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-16_77.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-16 16:41:43', '2022-05-16 16:41:43'),
(376, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-16_23.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-16 16:43:44', '2022-05-16 16:43:44'),
(377, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-16_99.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-16 16:48:32', '2022-05-16 16:48:32'),
(378, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-16_96.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-16 16:50:32', '2022-05-16 16:50:32'),
(379, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-16_30.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-16 16:52:08', '2022-05-16 16:52:08'),
(380, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-16_79.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-16 16:54:23', '2022-05-16 16:54:23'),
(381, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-16_19.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-16 18:03:51', '2022-05-16 18:03:51'),
(382, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-16_49.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-16 18:08:24', '2022-05-16 18:08:24'),
(383, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-16_91.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-16 18:10:35', '2022-05-16 18:10:35'),
(384, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-16_34.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-16 18:15:10', '2022-05-16 18:15:10'),
(385, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-25_82.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-05-25 18:10:25', '2022-05-25 18:10:25'),
(386, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-26_2.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-05-26 14:45:35', '2022-05-26 14:45:35'),
(387, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-26_47.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-26 15:07:19', '2022-05-26 15:07:19'),
(388, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-05-26_96.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-05-26 19:41:32', '2022-05-26 19:41:32'),
(389, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-26_66.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-26 21:40:09', '2022-05-26 21:40:09'),
(390, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-27_42.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-05-27 22:11:20', '2022-05-27 22:11:20'),
(391, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-28_22.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-28 14:43:40', '2022-05-28 14:43:40'),
(392, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-30_36.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-05-30 14:21:53', '2022-05-30 14:21:53'),
(393, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-05-30_72.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-05-30 14:23:34', '2022-05-30 14:23:34'),
(394, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-06-04_19.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-06-04 19:14:26', '2022-06-04 19:14:26'),
(395, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-06-06_51.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-06-06 17:02:55', '2022-06-06 17:02:55'),
(396, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-06-07_47.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-06-07 14:15:57', '2022-06-07 14:15:57'),
(397, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-07-19_67.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-07-19 21:36:08', '2022-07-19 21:36:08'),
(398, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-07-20_86.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-07-20 13:55:22', '2022-07-20 13:55:22'),
(399, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-07-21_33.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-07-21 14:33:06', '2022-07-21 14:33:06'),
(400, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-07-26_62.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-07-26 14:14:13', '2022-07-26 14:14:13'),
(401, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-07-27_41.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-07-27 14:55:38', '2022-07-27 14:55:38'),
(402, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-07-28_19.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-07-28 21:29:34', '2022-07-28 21:29:34'),
(403, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-07-28_99.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-07-28 21:35:21', '2022-07-28 21:35:21'),
(404, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-07-28_31.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-07-28 22:02:16', '2022-07-28 22:02:16'),
(405, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-07-28_21.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-07-28 22:42:24', '2022-07-28 22:42:24'),
(406, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-07-29_47.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-07-29 14:13:37', '2022-07-29 14:13:37'),
(407, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-07-29_89.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-07-29 17:41:22', '2022-07-29 17:41:22'),
(408, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-07-31_1.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-07-31 19:45:59', '2022-07-31 19:45:59'),
(409, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-07-31_2.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-07-31 22:59:06', '2022-07-31 22:59:06'),
(410, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-01_16.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-08-01 14:44:11', '2022-08-01 14:44:11'),
(411, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-03_55.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-08-03 22:19:54', '2022-08-03 22:19:54'),
(412, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-08-03_94.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-08-03 23:05:01', '2022-08-03 23:05:01'),
(413, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-03_87.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-08-03 23:06:00', '2022-08-03 23:06:00'),
(414, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-08-03_91.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-08-03 23:10:13', '2022-08-03 23:10:13'),
(415, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-04_82.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-08-04 14:42:35', '2022-08-04 14:42:35'),
(416, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-08-04_95.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-08-04 22:46:19', '2022-08-04 22:46:19'),
(417, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-05_30.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-08-05 14:44:48', '2022-08-05 14:44:48'),
(418, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-08-05_2.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-08-05 15:32:00', '2022-08-05 15:32:00'),
(419, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-08_2.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-08-08 15:19:39', '2022-08-08 15:19:39'),
(420, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-08_66.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-08-08 15:36:34', '2022-08-08 15:36:34'),
(421, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-08-08_18.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-08-08 20:50:06', '2022-08-08 20:50:06'),
(422, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-09_38.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-08-09 14:20:14', '2022-08-09 14:20:14'),
(423, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-09_24.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-08-09 15:28:48', '2022-08-09 15:28:48'),
(424, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-08-09_64.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-08-09 23:18:32', '2022-08-09 23:18:32'),
(425, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-10_14.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-08-10 13:54:17', '2022-08-10 13:54:17'),
(426, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-10_34.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-08-10 14:10:32', '2022-08-10 14:10:32'),
(427, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-11_91.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-08-11 14:24:34', '2022-08-11 14:24:34'),
(428, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-08-11_74.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-08-11 15:40:56', '2022-08-11 15:40:56'),
(429, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-11_75.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-08-11 16:21:44', '2022-08-11 16:21:44'),
(430, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-08-11_12.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-08-11 16:44:15', '2022-08-11 16:44:15'),
(431, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-11_11.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-08-11 16:47:13', '2022-08-11 16:47:13'),
(432, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-08-11_76.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-08-11 19:30:49', '2022-08-11 19:30:49'),
(433, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-11_17.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-08-11 19:36:59', '2022-08-11 19:36:59'),
(434, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-12_26.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-08-12 15:10:53', '2022-08-12 15:10:53'),
(435, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-12_40.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-08-12 20:28:25', '2022-08-12 20:28:25'),
(436, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-16_23.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-08-16 14:25:44', '2022-08-16 14:25:44'),
(437, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-19_91.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-08-19 13:50:28', '2022-08-19 13:50:28'),
(438, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-22_32.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-08-22 16:14:30', '2022-08-22 16:14:30'),
(439, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-22_18.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-08-22 18:16:28', '2022-08-22 18:16:28'),
(440, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-22_53.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-08-22 21:05:13', '2022-08-22 21:05:13'),
(441, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-22_13.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-08-22 21:22:16', '2022-08-22 21:22:16'),
(442, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-22_90.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-08-22 22:03:29', '2022-08-22 22:03:29'),
(443, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-08-22_98.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-08-22 22:04:49', '2022-08-22 22:04:49'),
(444, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-22_72.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-08-22 22:05:48', '2022-08-22 22:05:48'),
(445, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-08-22_75.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-08-22 22:07:18', '2022-08-22 22:07:18'),
(446, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-22_80.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-08-22 22:10:32', '2022-08-22 22:10:32'),
(447, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-08-22_54.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-08-22 22:11:58', '2022-08-22 22:11:58'),
(448, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-22_8.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-08-22 22:14:01', '2022-08-22 22:14:01'),
(449, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-08-22_23.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-08-22 22:15:22', '2022-08-22 22:15:22'),
(450, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-08-22_67.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-08-22 23:53:13', '2022-08-22 23:53:13'),
(451, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-23_17.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-08-23 14:02:07', '2022-08-23 14:02:07'),
(452, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-23_16.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-08-23 14:29:43', '2022-08-23 14:29:43'),
(453, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-26_6.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-08-26 17:07:39', '2022-08-26 17:07:39'),
(454, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-29_12.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-08-29 16:32:39', '2022-08-29 16:32:39');
INSERT INTO `rptemail` (`id`, `nombre`, `ruta`, `email`, `cc`, `asunto`, `id_estatus`, `id_rpt`, `updated_at`, `created_at`) VALUES
(455, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-08-31_27.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-08-31 21:03:12', '2022-08-31 21:03:12'),
(456, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-09-05_94.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-09-05 23:02:21', '2022-09-05 23:02:21'),
(457, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-09-06_85.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-09-06 17:24:11', '2022-09-06 17:24:11'),
(458, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-09-06_32.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-09-06 23:22:13', '2022-09-06 23:22:13'),
(459, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-09-07_37.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-09-07 14:53:15', '2022-09-07 14:53:15'),
(460, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-09-08_97.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-09-08 20:03:18', '2022-09-08 20:03:18'),
(461, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-09-08_10.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-09-08 23:00:27', '2022-09-08 23:00:27'),
(462, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-09-13_38.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-09-13 14:45:06', '2022-09-13 14:45:06'),
(463, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-09-13_77.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-09-13 15:47:25', '2022-09-13 15:47:25'),
(464, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-09-13_50.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-09-13 16:22:13', '2022-09-13 16:22:13'),
(465, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-09-28_51.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-09-28 20:50:02', '2022-09-28 20:50:02'),
(466, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-09-29_86.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-09-29 13:56:40', '2022-09-29 13:56:40'),
(467, 'ped_esp_pdf', 'files/reportesmail/ped_esp_pdf_2022-09-29_30.pdf', 'themariomarvel@gmail.com', NULL, 'Pedido Especial PDF', 1, 30, '2022-09-29 14:39:10', '2022-09-29 14:39:10'),
(468, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-09-30_32.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-09-30 15:55:44', '2022-09-30 15:55:44'),
(469, 'ped_esp_pdf', 'files/reportesmail/ped_esp_pdf_2022-09-30_63.pdf', 'delmalbandido@gmail.com', NULL, 'Pedido Especial PDF', 1, 30, '2022-09-30 17:54:01', '2022-09-30 17:54:01'),
(470, 'ped_esp_pdf', 'files/reportesmail/ped_esp_pdf_2022-09-30_12.pdf', 'themariomarvel@gmail.com', NULL, 'Pedido Especial PDF', 1, 30, '2022-09-30 17:54:24', '2022-09-30 17:54:24'),
(471, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-10-03_61.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-10-03 14:51:16', '2022-10-03 14:51:16'),
(472, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-10-04_80.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-10-04 21:33:48', '2022-10-04 21:33:48'),
(473, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-10-05_15.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-10-05 14:21:45', '2022-10-05 14:21:45'),
(474, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-10-06_62.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-10-06 14:20:21', '2022-10-06 14:20:21'),
(475, 'ped_esp_pdf', 'files/reportesmail/ped_esp_pdf_2022-10-06_8.pdf', 'delmalbandido@gmail.com', NULL, 'Pedido EspecialPDF', 1, 30, '2022-10-06 17:15:15', '2022-10-06 17:15:15'),
(476, 'ped_esp_pdf', 'files/reportesmail/ped_esp_pdf_2022-10-06_60.pdf', 'themariomarvel@gmail.com', NULL, 'Pedido EspecialPDF', 1, 30, '2022-10-06 17:16:10', '2022-10-06 17:16:10'),
(477, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-10-07_57.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-10-07 16:11:46', '2022-10-07 16:11:46'),
(478, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-10-10_9.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-10-10 17:37:17', '2022-10-10 17:37:17'),
(479, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-10-11_71.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-10-11 16:14:51', '2022-10-11 16:14:51'),
(480, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-10-13_79.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-10-13 14:09:44', '2022-10-13 14:09:44'),
(481, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-10-14_45.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-10-14 15:26:52', '2022-10-14 15:26:52'),
(482, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-10-14_26.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-10-14 18:11:23', '2022-10-14 18:11:23'),
(483, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-10-19_77.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-10-19 15:53:24', '2022-10-19 15:53:24'),
(484, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-10-19_27.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-10-19 17:02:44', '2022-10-19 17:02:44'),
(485, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-10-19_29.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-10-19 18:52:28', '2022-10-19 18:52:28'),
(486, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-10-21_56.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-10-21 14:22:57', '2022-10-21 14:22:57'),
(487, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-10-21_74.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-10-21 15:39:59', '2022-10-21 15:39:59'),
(488, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-10-24_19.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-10-24 18:20:37', '2022-10-24 18:20:37'),
(489, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-10-25_39.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-10-25 16:27:25', '2022-10-25 16:27:25'),
(490, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-10-25_1.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-10-25 17:35:53', '2022-10-25 17:35:53'),
(491, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-10-26_80.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-10-26 15:46:12', '2022-10-26 15:46:12'),
(492, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-10-27_56.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-10-27 16:07:11', '2022-10-27 16:07:11'),
(493, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-11-02_14.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-11-02 19:45:56', '2022-11-02 19:45:56'),
(494, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-11-02_57.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-11-03 00:45:28', '2022-11-03 00:45:28'),
(495, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-11-03_90.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-11-03 20:24:07', '2022-11-03 20:24:07'),
(496, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-11-03_21.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-11-04 00:40:29', '2022-11-04 00:40:29'),
(497, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-11-04_31.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-11-04 15:05:44', '2022-11-04 15:05:44'),
(498, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-11-04_67.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-11-05 00:34:47', '2022-11-05 00:34:47'),
(499, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-11-07_46.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-11-07 15:28:36', '2022-11-07 15:28:36'),
(500, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-11-09_50.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-11-09 19:55:34', '2022-11-09 19:55:34'),
(501, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-11-16_44.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-11-16 15:15:23', '2022-11-16 15:15:23'),
(502, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-11-16_3.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-11-16 20:16:52', '2022-11-16 20:16:52'),
(503, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-11-17_63.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-11-17 19:06:20', '2022-11-17 19:06:20'),
(504, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-11-18_60.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-11-18 20:16:41', '2022-11-18 20:16:41'),
(505, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-11-19_14.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-11-19 15:56:09', '2022-11-19 15:56:09'),
(506, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-11-19_61.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-11-19 17:14:20', '2022-11-19 17:14:20'),
(507, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-11-22_31.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-11-22 14:27:50', '2022-11-22 14:27:50'),
(508, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-11-25_20.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-11-25 15:06:36', '2022-11-25 15:06:36'),
(509, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-11-25_80.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-11-25 15:22:20', '2022-11-25 15:22:20'),
(510, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-11-28_64.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-11-28 19:07:55', '2022-11-28 19:07:55'),
(511, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-11-29_20.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-11-29 19:26:28', '2022-11-29 19:26:28'),
(512, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-12-01_24.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-12-01 16:00:38', '2022-12-01 16:00:38'),
(513, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-12-02_84.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-12-02 18:09:20', '2022-12-02 18:09:20'),
(514, 'ped_esp_pdf', 'files/reportesmail/ped_esp_pdf_2022-12-02_45.pdf', 'themariomarvel@gmail.com', NULL, 'Pedido EspecialPDF', 1, 30, '2022-12-02 18:27:15', '2022-12-02 18:27:15'),
(515, 'ped_esp_pdf', 'files/reportesmail/ped_esp_pdf_2022-12-02_49.pdf', 'themariomarvel@gmail.com', NULL, 'Pedido EspecialPDF', 1, 30, '2022-12-02 19:45:16', '2022-12-02 19:45:16'),
(516, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-12-02_59.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-12-03 00:17:55', '2022-12-03 00:17:55'),
(517, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-12-06_30.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-12-06 17:09:08', '2022-12-06 17:09:08'),
(518, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-12-07_90.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-12-07 16:33:56', '2022-12-07 16:33:56'),
(519, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-12-07_37.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-12-07 19:18:37', '2022-12-07 19:18:37'),
(520, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-12-07_15.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-12-07 19:20:56', '2022-12-07 19:20:56'),
(521, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-12-07_96.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2022-12-07 19:40:53', '2022-12-07 19:40:53'),
(522, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-12-08_26.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-12-08 19:19:24', '2022-12-08 19:19:24'),
(523, 'ped_esp_pdf', 'files/reportesmail/ped_esp_pdf_2022-12-08_45.pdf', 'themariomarvel@gmail.com', NULL, 'Pedido EspecialPDF', 1, 30, '2022-12-08 19:33:22', '2022-12-08 19:33:22'),
(524, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2022-12-08_17.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2022-12-09 02:44:47', '2022-12-09 02:44:47'),
(525, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-12-09_21.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-12-09 18:02:05', '2022-12-09 18:02:05'),
(526, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-12-09_21.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-12-09 19:13:29', '2022-12-09 19:13:29'),
(527, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-12-12_17.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-12-12 20:06:19', '2022-12-12 20:06:19'),
(528, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-12-12_43.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-12-12 20:11:50', '2022-12-12 20:11:50'),
(529, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-12-13_14.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-12-13 15:11:23', '2022-12-13 15:11:23'),
(530, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-12-13_85.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-12-13 15:30:13', '2022-12-13 15:30:13'),
(531, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-12-14_10.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-12-14 15:05:38', '2022-12-14 15:05:38'),
(532, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-12-15_53.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-12-15 15:10:12', '2022-12-15 15:10:12'),
(533, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-12-16_95.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-12-16 17:05:45', '2022-12-16 17:05:45'),
(534, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-12-20_3.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-12-20 16:22:32', '2022-12-20 16:22:32'),
(535, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-12-20_87.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2022-12-20 17:38:03', '2022-12-20 17:38:03'),
(536, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-12-22_23.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-12-22 19:59:45', '2022-12-22 19:59:45'),
(537, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2022-12-27_17.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2022-12-27 21:03:52', '2022-12-27 21:03:52'),
(538, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-02_34.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2023-01-02 21:14:22', '2023-01-02 21:14:22'),
(539, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-06_7.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2023-01-06 18:11:40', '2023-01-06 18:11:40'),
(540, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-06_80.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2023-01-06 21:19:21', '2023-01-06 21:19:21'),
(541, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-06_9.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-06 21:27:04', '2023-01-06 21:27:04'),
(542, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-06_51.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2023-01-06 21:39:08', '2023-01-06 21:39:08'),
(543, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-07_9.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2023-01-07 20:40:12', '2023-01-07 20:40:12'),
(544, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-07_94.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-07 20:41:56', '2023-01-07 20:41:56'),
(545, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-07_40.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-07 20:45:14', '2023-01-07 20:45:14'),
(546, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-07_87.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-07 20:46:30', '2023-01-07 20:46:30'),
(547, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-07_29.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-07 20:47:49', '2023-01-07 20:47:49'),
(548, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-08_40.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2023-01-08 21:27:26', '2023-01-08 21:27:26'),
(549, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-08_69.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-08 23:03:13', '2023-01-08 23:03:13'),
(550, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-08_81.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-08 23:05:30', '2023-01-08 23:05:30'),
(551, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-08_57.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-08 23:06:14', '2023-01-08 23:06:14'),
(552, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-08_12.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-08 23:07:16', '2023-01-08 23:07:16'),
(553, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-08_92.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2023-01-08 23:20:35', '2023-01-08 23:20:35'),
(554, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-09_23.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2023-01-09 15:18:47', '2023-01-09 15:18:47'),
(555, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-09_55.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-09 16:18:46', '2023-01-09 16:18:46'),
(556, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-09_21.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-09 21:46:09', '2023-01-09 21:46:09'),
(557, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-09_1.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-09 22:33:54', '2023-01-09 22:33:54'),
(558, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-09_61.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-10 05:10:49', '2023-01-10 05:10:49'),
(559, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-10_20.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2023-01-10 14:30:24', '2023-01-10 14:30:24'),
(560, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-10_88.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-10 14:44:37', '2023-01-10 14:44:37'),
(561, 'ped_esp_pdf', 'files/reportesmail/ped_esp_pdf_2023-01-10_97.pdf', 'chava.torio@gmail.com', NULL, 'Pedido EspecialPDF', 1, 30, '2023-01-10 19:31:07', '2023-01-10 19:31:07'),
(562, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-10_79.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-10 21:32:51', '2023-01-10 21:32:51'),
(563, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-10_62.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-10 21:37:10', '2023-01-10 21:37:10'),
(564, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-10_36.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-11 04:47:28', '2023-01-11 04:47:28'),
(565, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-11_11.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2023-01-11 15:20:07', '2023-01-11 15:20:07'),
(566, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-11_86.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-11 17:13:40', '2023-01-11 17:13:40'),
(567, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-11_76.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-11 22:42:26', '2023-01-11 22:42:26'),
(568, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-11_62.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-11 22:44:24', '2023-01-11 22:44:24'),
(569, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-11_34.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-12 04:39:39', '2023-01-12 04:39:39'),
(570, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-12_66.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-12 20:53:42', '2023-01-12 20:53:42'),
(571, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-13_31.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-13 15:48:08', '2023-01-13 15:48:08'),
(572, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-13_78.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2023-01-13 23:07:44', '2023-01-13 23:07:44'),
(573, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-13_86.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2023-01-13 23:53:10', '2023-01-13 23:53:10'),
(574, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-14_78.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-14 18:34:43', '2023-01-14 18:34:43'),
(575, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-15_27.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-16 03:09:31', '2023-01-16 03:09:31'),
(576, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-15_41.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-16 03:23:27', '2023-01-16 03:23:27'),
(577, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-16_9.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2023-01-16 07:09:30', '2023-01-16 07:09:30'),
(578, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-16_9.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-16 15:49:10', '2023-01-16 15:49:10'),
(579, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-16_25.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-16 21:17:39', '2023-01-16 21:17:39'),
(580, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-16_47.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-16 21:50:50', '2023-01-16 21:50:50'),
(581, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-16_71.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-17 03:23:46', '2023-01-17 03:23:46'),
(582, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-17_47.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-17 15:32:27', '2023-01-17 15:32:27'),
(583, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-17_48.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2023-01-17 15:55:49', '2023-01-17 15:55:49'),
(584, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-17_68.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-17 21:30:42', '2023-01-17 21:30:42'),
(585, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-17_84.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-17 21:39:47', '2023-01-17 21:39:47'),
(586, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-17_24.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-17 21:45:57', '2023-01-17 21:45:57'),
(587, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-17_64.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-18 03:26:37', '2023-01-18 03:26:37'),
(588, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-18_43.pdf', 'latogasistemas@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-18 15:24:24', '2023-01-18 15:24:24'),
(589, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-18_90.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Apertura de Sucursal: Araucarias 01-D', 1, 12, '2023-01-18 15:40:49', '2023-01-18 15:40:49'),
(590, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-18_85.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: Araucarias 01-D', 1, 16, '2023-01-18 18:33:21', '2023-01-18 18:33:21'),
(591, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-18_81.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEMO PROD', 1, 12, '2023-01-18 18:39:57', '2023-01-18 18:39:57'),
(592, 'ped_esp_pdf', 'files/reportesmail/ped_esp_pdf_2023-01-18_95.pdf', 'latogajuarez@gmail.com', NULL, 'Pedido EspecialPDF', 1, 30, '2023-01-18 20:06:15', '2023-01-18 20:06:15'),
(593, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-18_98.pdf', 'jeferegionalcoatepec@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-18 21:26:07', '2023-01-18 21:26:07'),
(594, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-18_90.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-18 21:34:39', '2023-01-18 21:34:39'),
(595, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-18_4.pdf', 'themariomarvel@gmail.com', 'mario.martinez@deuxestudio.com', 'Cierre de Sucursal: DEMO PROD', 1, 16, '2023-01-18 21:58:37', '2023-01-18 21:58:37'),
(596, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-18_1.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEMO PROD', 1, 12, '2023-01-18 22:01:25', '2023-01-18 22:01:25'),
(597, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-18_54.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: DEUX PRODUCCION', 1, 16, '2023-01-18 23:02:29', '2023-01-18 23:02:29'),
(598, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-18_75.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-19 03:35:12', '2023-01-19 03:35:12'),
(599, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-19_25.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-19 15:21:37', '2023-01-19 15:21:37'),
(600, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-19_79.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-01-19 19:08:28', '2023-01-19 19:08:28'),
(601, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-19_26.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-19 23:55:39', '2023-01-19 23:55:39'),
(602, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-19_52.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-19 23:59:47', '2023-01-19 23:59:47'),
(603, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-19_96.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-20 03:27:52', '2023-01-20 03:27:52'),
(604, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-20_18.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-20 15:58:18', '2023-01-20 15:58:18'),
(605, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-20_47.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-01-20 17:59:15', '2023-01-20 17:59:15'),
(606, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-20_35.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-20 21:19:48', '2023-01-20 21:19:48'),
(607, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-20_62.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-20 21:28:52', '2023-01-20 21:28:52'),
(608, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-20_84.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-20 21:28:55', '2023-01-20 21:28:55'),
(609, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-20_40.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-21 03:38:11', '2023-01-21 03:38:11'),
(610, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-21_99.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-21 15:27:15', '2023-01-21 15:27:15'),
(611, 'ped_esp_pdf', 'files/reportesmail/ped_esp_pdf_2023-01-21_1.pdf', 'victor.amacip@gmail.com', NULL, 'Pedido EspecialPDF', 1, 30, '2023-01-21 19:50:26', '2023-01-21 19:50:26'),
(612, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-21_82.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-01-21 20:07:23', '2023-01-21 20:07:23'),
(613, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-21_92.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-21 22:04:18', '2023-01-21 22:04:18'),
(614, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-21_70.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-21 22:30:58', '2023-01-21 22:30:58'),
(615, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-21_86.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-22 03:27:19', '2023-01-22 03:27:19'),
(616, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-22_97.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-22 15:40:28', '2023-01-22 15:40:28'),
(617, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-22_8.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-23 02:16:12', '2023-01-23 02:16:12'),
(618, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-23_8.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-01-23 14:36:18', '2023-01-23 14:36:18'),
(619, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-23_41.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-23 15:09:23', '2023-01-23 15:09:23'),
(620, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-23_74.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-01-23 16:45:26', '2023-01-23 16:45:26'),
(621, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-23_52.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-01-23 20:45:22', '2023-01-23 20:45:22'),
(622, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-23_64.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-23 21:01:11', '2023-01-23 21:01:11'),
(623, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-23_30.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-23 21:10:53', '2023-01-23 21:10:53'),
(624, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-23_36.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-01-23 21:54:42', '2023-01-23 21:54:42'),
(625, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-23_62.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-24 03:48:49', '2023-01-24 03:48:49'),
(626, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-23_80.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-01-24 04:32:43', '2023-01-24 04:32:43'),
(627, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-24_79.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-01-24 14:38:44', '2023-01-24 14:38:44'),
(628, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-24_13.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-01-24 15:06:22', '2023-01-24 15:06:22'),
(629, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-24_13.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-24 15:21:05', '2023-01-24 15:21:05'),
(630, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-24_38.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-24 20:56:36', '2023-01-24 20:56:36'),
(631, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-24_40.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-24 21:35:24', '2023-01-24 21:35:24'),
(632, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-24_82.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-01-24 22:10:13', '2023-01-24 22:10:13'),
(633, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-24_89.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-01-24 22:34:47', '2023-01-24 22:34:47'),
(634, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-24_20.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-01-25 03:25:39', '2023-01-25 03:25:39'),
(635, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-24_61.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-25 03:38:46', '2023-01-25 03:38:46'),
(636, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-25_2.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-01-25 14:59:46', '2023-01-25 14:59:46'),
(637, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-25_90.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-25 15:15:48', '2023-01-25 15:15:48'),
(638, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-25_78.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-01-25 16:35:26', '2023-01-25 16:35:26'),
(639, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-25_60.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-25 21:09:09', '2023-01-25 21:09:09'),
(640, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-25_15.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-25 21:25:29', '2023-01-25 21:25:29'),
(641, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-25_79.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-01-25 21:38:25', '2023-01-25 21:38:25'),
(642, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-25_32.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-01-25 22:25:42', '2023-01-25 22:25:42'),
(643, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-25_28.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-01-26 03:01:57', '2023-01-26 03:01:57'),
(644, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-25_58.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-26 03:36:25', '2023-01-26 03:36:25'),
(645, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-26_75.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-01-26 14:45:50', '2023-01-26 14:45:50'),
(646, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-26_35.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-01-26 15:09:41', '2023-01-26 15:09:41'),
(647, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-26_99.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-26 15:13:42', '2023-01-26 15:13:42'),
(648, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-26_3.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-26 21:13:16', '2023-01-26 21:13:16'),
(649, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-26_70.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-26 21:38:52', '2023-01-26 21:38:52'),
(650, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-26_69.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-01-26 22:26:29', '2023-01-26 22:26:29'),
(651, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-26_92.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-01-26 22:59:12', '2023-01-26 22:59:12'),
(652, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-26_45.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-01-27 03:00:47', '2023-01-27 03:00:47'),
(653, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-26_63.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-27 03:49:00', '2023-01-27 03:49:00'),
(654, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-27_50.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-01-27 14:54:11', '2023-01-27 14:54:11'),
(655, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-27_16.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-27 15:21:18', '2023-01-27 15:21:18'),
(656, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-27_2.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-27 15:21:19', '2023-01-27 15:21:19'),
(657, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-27_54.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-01-27 15:33:06', '2023-01-27 15:33:06'),
(658, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-27_2.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-27 21:07:47', '2023-01-27 21:07:47'),
(659, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-27_82.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-01-27 21:21:05', '2023-01-27 21:21:05'),
(660, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-27_76.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-27 21:22:51', '2023-01-27 21:22:51'),
(661, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-27_79.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-01-27 21:45:26', '2023-01-27 21:45:26'),
(662, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-27_82.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-01-28 03:04:24', '2023-01-28 03:04:24'),
(663, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-27_91.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-28 03:44:07', '2023-01-28 03:44:07'),
(664, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-28_81.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-01-28 14:44:21', '2023-01-28 14:44:21'),
(665, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-28_1.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-01-28 15:07:54', '2023-01-28 15:07:54'),
(666, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-28_79.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-28 15:24:47', '2023-01-28 15:24:47'),
(667, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-28_76.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-01-29 03:00:29', '2023-01-29 03:00:29'),
(668, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-28_17.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-01-29 03:00:34', '2023-01-29 03:00:34'),
(669, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-28_55.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-29 03:49:11', '2023-01-29 03:49:11'),
(670, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-29_46.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-29 15:21:38', '2023-01-29 15:21:38'),
(671, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-29_97.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-01-29 15:36:44', '2023-01-29 15:36:44'),
(672, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-29_5.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-01-30 01:05:33', '2023-01-30 01:05:33'),
(673, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-29_27.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-01-30 01:05:34', '2023-01-30 01:05:34'),
(674, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-29_12.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-01-30 02:08:53', '2023-01-30 02:08:53'),
(675, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-29_27.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-30 02:35:45', '2023-01-30 02:35:45'),
(676, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_12.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-01-30 15:08:21', '2023-01-30 15:08:21'),
(677, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_10.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-01-30 15:12:31', '2023-01-30 15:12:31'),
(678, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_27.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-30 15:21:00', '2023-01-30 15:21:00'),
(679, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_95.pdf', 'eduardo_hbonilla@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CAFETERIAS DON JUSTO', 1, 12, '2023-01-30 19:35:02', '2023-01-30 19:35:02'),
(680, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_73.pdf', 'latogafacturas@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CAFETERIAS', 1, 12, '2023-01-30 20:31:35', '2023-01-30 20:31:35'),
(681, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_65.pdf', 'rosariot_60@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: 5 DE FEBRERO', 1, 12, '2023-01-30 21:08:41', '2023-01-30 21:08:41');
INSERT INTO `rptemail` (`id`, `nombre`, `ruta`, `email`, `cc`, `asunto`, `id_estatus`, `id_rpt`, `updated_at`, `created_at`) VALUES
(682, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_58.pdf', 'rosariot_60@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: 5 DE FEBRERO', 1, 16, '2023-01-30 21:10:03', '2023-01-30 21:10:03'),
(683, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_33.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-01-30 21:13:21', '2023-01-30 21:13:21'),
(684, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_21.pdf', 'rosariot_60@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: 5 DE FEBRERO', 1, 12, '2023-01-30 21:14:04', '2023-01-30 21:14:04'),
(685, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_21.pdf', 'rosariot_60@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: 5 DE FEBRERO', 1, 16, '2023-01-30 21:15:33', '2023-01-30 21:15:33'),
(686, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_46.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: 5 DE MAYO', 1, 12, '2023-01-30 21:19:46', '2023-01-30 21:19:46'),
(687, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_4.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: 5 DE MAYO', 1, 16, '2023-01-30 21:24:54', '2023-01-30 21:24:54'),
(688, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_95.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: 5 DE MAYO', 1, 12, '2023-01-30 21:30:23', '2023-01-30 21:30:23'),
(689, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_43.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: 5 DE MAYO', 1, 16, '2023-01-30 21:32:19', '2023-01-30 21:32:19'),
(690, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_87.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-30 21:32:35', '2023-01-30 21:32:35'),
(691, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_52.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-01-30 21:33:40', '2023-01-30 21:33:40'),
(692, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_56.pdf', 'marianatorio@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: ARAUCARIAS 01', 1, 12, '2023-01-30 21:35:26', '2023-01-30 21:35:26'),
(693, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_53.pdf', 'marianatorio@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: ARAUCARIAS 01', 1, 16, '2023-01-30 21:39:23', '2023-01-30 21:39:23'),
(694, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_69.pdf', 'marianatorio@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: ARAUCARIAS 01', 1, 12, '2023-01-30 21:40:59', '2023-01-30 21:40:59'),
(695, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_42.pdf', 'marianatorio@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: ARAUCARIAS 01', 1, 16, '2023-01-30 21:41:45', '2023-01-30 21:41:45'),
(696, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_80.pdf', 'marianatorio@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: ARAUCARIAS 02', 1, 12, '2023-01-30 21:45:51', '2023-01-30 21:45:51'),
(697, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_2.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: DEUX PRODUCCION', 1, 16, '2023-01-30 21:59:47', '2023-01-30 21:59:47'),
(698, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_73.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-30 22:01:21', '2023-01-30 22:01:21'),
(699, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_39.pdf', 'marianatorio@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: ARAUCARIAS 02', 1, 16, '2023-01-30 22:17:34', '2023-01-30 22:17:34'),
(700, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_98.pdf', 'marianatorio@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: ARAUCARIAS 02', 1, 12, '2023-01-30 22:19:31', '2023-01-30 22:19:31'),
(701, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_33.pdf', 'marianatorio@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: ARAUCARIAS 02', 1, 16, '2023-01-30 22:21:56', '2023-01-30 22:21:56'),
(702, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_91.pdf', 'anagabrielamm@outlook.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CARDEL', 1, 12, '2023-01-30 22:27:41', '2023-01-30 22:27:41'),
(703, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_48.pdf', 'anagabrielamm@outlook.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CARDEL', 1, 16, '2023-01-30 22:29:30', '2023-01-30 22:29:30'),
(704, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_4.pdf', 'anagabrielamm@outlook.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CARDEL', 1, 12, '2023-01-30 22:30:33', '2023-01-30 22:30:33'),
(705, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_52.pdf', 'anagabrielamm@outlook.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CARDEL', 1, 16, '2023-01-30 22:31:34', '2023-01-30 22:31:34'),
(706, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_66.pdf', 'rosariot_60@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CHEDRAUI', 1, 12, '2023-01-30 22:36:27', '2023-01-30 22:36:27'),
(707, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_30.pdf', 'rosariot_60@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CHEDRAUI', 1, 16, '2023-01-30 22:38:20', '2023-01-30 22:38:20'),
(708, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_57.pdf', 'rosariot_60@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CHEDRAUI', 1, 12, '2023-01-30 22:39:09', '2023-01-30 22:39:09'),
(709, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_64.pdf', 'rosariot_60@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CHEDRAUI', 1, 16, '2023-01-30 22:42:51', '2023-01-30 22:42:51'),
(710, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_69.pdf', 'marcasiqueg@yahoo.com.mx', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CORTINES VERACRUZ', 1, 12, '2023-01-30 22:47:51', '2023-01-30 22:47:51'),
(711, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_29.pdf', 'marcasiqueg@yahoo.com.mx', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CORTINES VERACRUZ', 1, 16, '2023-01-30 22:49:04', '2023-01-30 22:49:04'),
(712, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_26.pdf', 'marcasiqueg@yahoo.com.mx', 'latogasistemas@gmail.com', 'Apertura de Sucursal: COYOL', 1, 12, '2023-01-30 22:51:11', '2023-01-30 22:51:11'),
(713, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_67.pdf', 'marcasiqueg@yahoo.com.mx', 'latogasistemas@gmail.com', 'Cierre de Sucursal: COYOL', 1, 16, '2023-01-30 22:52:38', '2023-01-30 22:52:38'),
(714, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_60.pdf', 'esther.arano@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CUERVO', 1, 12, '2023-01-30 22:59:29', '2023-01-30 22:59:29'),
(715, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_35.pdf', 'esther.arano@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CUERVO', 1, 16, '2023-01-30 23:01:05', '2023-01-30 23:01:05'),
(716, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_72.pdf', 'marcasiqueg@yahoo.com.mx', 'latogasistemas@gmail.com', 'Apertura de Sucursal: EJERCITO', 1, 12, '2023-01-30 23:03:23', '2023-01-30 23:03:23'),
(717, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_28.pdf', 'marcasiqueg@yahoo.com.mx', 'latogasistemas@gmail.com', 'Cierre de Sucursal: EJERCITO', 1, 16, '2023-01-30 23:06:28', '2023-01-30 23:06:28'),
(718, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_51.pdf', 'marcasiqueg@yahoo.com.mx', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JARDINES', 1, 12, '2023-01-30 23:09:47', '2023-01-30 23:09:47'),
(719, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_51.pdf', 'marcasiqueg@yahoo.com.mx', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JARDINES', 1, 16, '2023-01-30 23:10:56', '2023-01-30 23:10:56'),
(720, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_49.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: MELCHOR OCAMPO', 1, 12, '2023-01-30 23:13:13', '2023-01-30 23:13:13'),
(721, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_93.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: MELCHOR OCAMPO', 1, 16, '2023-01-30 23:14:38', '2023-01-30 23:14:38'),
(722, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_48.pdf', 'Ivismoro@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: TEOCELO', 1, 12, '2023-01-30 23:20:30', '2023-01-30 23:20:30'),
(723, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_55.pdf', 'Ivismoro@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: TEOCELO', 1, 16, '2023-01-30 23:22:27', '2023-01-30 23:22:27'),
(724, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_51.pdf', 'rosariot_60@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: TIA MAY CHEDRAUI', 1, 12, '2023-01-30 23:24:01', '2023-01-30 23:24:01'),
(725, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_63.pdf', 'rosariot_60@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: TIA MAY CHEDRAUI', 1, 16, '2023-01-30 23:25:00', '2023-01-30 23:25:00'),
(726, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_29.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: TRANCAS', 1, 12, '2023-01-30 23:30:19', '2023-01-30 23:30:19'),
(727, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_82.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: TRANCAS', 1, 16, '2023-01-30 23:31:46', '2023-01-30 23:31:46'),
(728, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_79.pdf', 'luismi1707@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: XICO', 1, 12, '2023-01-30 23:35:28', '2023-01-30 23:35:28'),
(729, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_35.pdf', 'luismi1707@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: XICO', 1, 16, '2023-01-30 23:36:55', '2023-01-30 23:36:55'),
(730, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_30.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: ZAMORA', 1, 12, '2023-01-30 23:39:27', '2023-01-30 23:39:27'),
(731, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-30_99.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-01-30 23:40:30', '2023-01-30 23:40:30'),
(732, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_53.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: ZAMORA', 1, 16, '2023-01-30 23:42:30', '2023-01-30 23:42:30'),
(733, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_93.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-01-31 03:03:50', '2023-01-31 03:03:50'),
(734, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_91.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-01-31 03:06:15', '2023-01-31 03:06:15'),
(735, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-30_77.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-31 03:47:26', '2023-01-31 03:47:26'),
(736, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-31_25.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-01-31 14:41:47', '2023-01-31 14:41:47'),
(737, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-31_40.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-01-31 14:56:16', '2023-01-31 14:56:16'),
(738, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-31_48.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-31 15:17:29', '2023-01-31 15:17:29'),
(739, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-31_38.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-01-31 21:10:03', '2023-01-31 21:10:03'),
(740, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-31_51.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-01-31 21:28:05', '2023-01-31 21:28:05'),
(741, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-31_89.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-01-31 21:39:45', '2023-01-31 21:39:45'),
(742, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-01-31_85.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-01-31 22:06:55', '2023-01-31 22:06:55'),
(743, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-31_4.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-01 03:05:01', '2023-02-01 03:05:01'),
(744, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-01-31_54.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-01 03:29:10', '2023-02-01 03:29:10'),
(745, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-01_5.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-01 14:36:46', '2023-02-01 14:36:46'),
(746, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-01_26.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-01 15:03:52', '2023-02-01 15:03:52'),
(747, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-01_37.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-01 15:30:46', '2023-02-01 15:30:46'),
(748, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-01_80.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-01 21:02:32', '2023-02-01 21:02:32'),
(749, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-01_26.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-01 21:37:46', '2023-02-01 21:37:46'),
(750, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-01_46.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-01 22:06:43', '2023-02-01 22:06:43'),
(751, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-01_60.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-01 22:41:03', '2023-02-01 22:41:03'),
(752, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-01_3.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-02 03:00:19', '2023-02-02 03:00:19'),
(753, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-01_5.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-02 03:42:24', '2023-02-02 03:42:24'),
(754, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-02_83.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-02 14:47:50', '2023-02-02 14:47:50'),
(755, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-02_45.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-02 16:02:32', '2023-02-02 16:02:32'),
(756, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-02_62.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-02 17:45:57', '2023-02-02 17:45:57'),
(757, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-02_20.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-02 21:21:23', '2023-02-02 21:21:23'),
(758, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-02_31.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-02 21:30:23', '2023-02-02 21:30:23'),
(759, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-02_42.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-03 03:00:58', '2023-02-03 03:00:58'),
(760, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-02_9.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-03 03:07:42', '2023-02-03 03:07:42'),
(761, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-03_5.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-03 14:38:26', '2023-02-03 14:38:26'),
(762, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-03_59.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-03 15:17:00', '2023-02-03 15:17:00'),
(763, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-03_91.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-03 16:14:01', '2023-02-03 16:14:01'),
(764, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-03_85.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-03 21:21:52', '2023-02-03 21:21:52'),
(765, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-03_27.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-03 21:28:58', '2023-02-03 21:28:58'),
(766, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-03_74.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-03 22:00:57', '2023-02-03 22:00:57'),
(767, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-03_4.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-03 22:21:05', '2023-02-03 22:21:05'),
(768, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-03_14.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-04 03:00:28', '2023-02-04 03:00:28'),
(769, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-03_54.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-04 03:35:45', '2023-02-04 03:35:45'),
(770, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-04_42.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-04 14:22:27', '2023-02-04 14:22:27'),
(771, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-04_80.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-04 15:34:38', '2023-02-04 15:34:38'),
(772, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-04_7.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-04 18:29:26', '2023-02-04 18:29:26'),
(773, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-04_87.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-05 03:32:58', '2023-02-05 03:32:58'),
(774, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-04_87.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-05 03:33:18', '2023-02-05 03:33:18'),
(775, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-05_50.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-05 15:23:10', '2023-02-05 15:23:10'),
(776, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-05_11.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-05 15:42:29', '2023-02-05 15:42:29'),
(777, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-05_81.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-05 22:35:14', '2023-02-05 22:35:14'),
(778, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-05_54.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-05 22:35:15', '2023-02-05 22:35:15'),
(779, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-05_25.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-06 02:10:17', '2023-02-06 02:10:17'),
(780, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-05_47.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-06 02:13:53', '2023-02-06 02:13:53'),
(781, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-05_2.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-06 02:13:59', '2023-02-06 02:13:59'),
(782, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-06_87.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-06 14:26:01', '2023-02-06 14:26:01'),
(783, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-06_6.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-06 14:44:52', '2023-02-06 14:44:52'),
(784, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-06_22.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-06 15:37:46', '2023-02-06 15:37:46'),
(785, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-06_66.pdf', 'latogafacturas@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CAFETERIAS', 1, 12, '2023-02-06 16:52:31', '2023-02-06 16:52:31'),
(786, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-06_69.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-06 21:32:52', '2023-02-06 21:32:52'),
(787, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-06_22.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-06 21:56:18', '2023-02-06 21:56:18'),
(788, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-06_5.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-07 03:06:28', '2023-02-07 03:06:28'),
(789, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-06_22.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-07 03:33:32', '2023-02-07 03:33:32'),
(790, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-07_82.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-07 14:45:21', '2023-02-07 14:45:21'),
(791, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-07_87.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-07 15:00:41', '2023-02-07 15:00:41'),
(792, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-07_53.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-07 15:17:24', '2023-02-07 15:17:24'),
(793, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-07_45.pdf', 'latogafacturas@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CAFETERIAS', 1, 12, '2023-02-07 18:28:14', '2023-02-07 18:28:14'),
(794, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-07_10.pdf', 'latogafacturas@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CAFETERIAS', 1, 12, '2023-02-07 18:28:21', '2023-02-07 18:28:21'),
(795, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-07_99.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-07 21:16:29', '2023-02-07 21:16:29'),
(796, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-07_95.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-07 21:18:28', '2023-02-07 21:18:28'),
(797, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-07_62.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-07 21:45:56', '2023-02-07 21:45:56'),
(798, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-07_83.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-07 22:07:19', '2023-02-07 22:07:19'),
(799, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-07_21.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-08 03:01:52', '2023-02-08 03:01:52'),
(800, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-07_35.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-08 03:34:56', '2023-02-08 03:34:56'),
(801, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-08_56.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-08 14:41:05', '2023-02-08 14:41:05'),
(802, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-08_93.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-08 15:08:16', '2023-02-08 15:08:16'),
(803, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-08_78.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-08 15:28:08', '2023-02-08 15:28:08'),
(804, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-08_39.pdf', 'bibiana.htorio@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: REDES SOCIALES', 1, 12, '2023-02-08 18:30:21', '2023-02-08 18:30:21'),
(805, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-08_64.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-08 20:56:03', '2023-02-08 20:56:03'),
(806, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-08_70.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-08 21:18:40', '2023-02-08 21:18:40'),
(807, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-08_57.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-08 21:38:21', '2023-02-08 21:38:21'),
(808, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-08_71.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-08 21:39:58', '2023-02-08 21:39:58'),
(809, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-08_63.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-09 03:00:22', '2023-02-09 03:00:22'),
(810, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-08_24.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-09 03:43:10', '2023-02-09 03:43:10'),
(811, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-09_77.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-09 14:46:27', '2023-02-09 14:46:27'),
(812, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-09_49.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-09 15:23:36', '2023-02-09 15:23:36'),
(813, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-09_12.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-09 19:02:26', '2023-02-09 19:02:26'),
(814, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-09_16.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-09 20:53:13', '2023-02-09 20:53:13'),
(815, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-09_81.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-09 21:30:51', '2023-02-09 21:30:51'),
(816, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-09_80.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-09 21:35:30', '2023-02-09 21:35:30'),
(817, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-09_91.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-09 21:45:04', '2023-02-09 21:45:04'),
(818, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-09_75.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-10 03:04:51', '2023-02-10 03:04:51'),
(819, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-09_90.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-10 03:44:27', '2023-02-10 03:44:27'),
(820, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-10_38.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-10 15:03:52', '2023-02-10 15:03:52'),
(821, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-10_59.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-10 15:20:19', '2023-02-10 15:20:19'),
(822, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-10_29.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-10 15:27:05', '2023-02-10 15:27:05'),
(823, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-10_12.pdf', 'bibiana.htorio@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: REDES SOCIALES', 1, 12, '2023-02-10 18:38:53', '2023-02-10 18:38:53'),
(824, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-10_19.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-10 21:33:58', '2023-02-10 21:33:58'),
(825, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-10_82.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-10 21:38:05', '2023-02-10 21:38:05'),
(826, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-10_10.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-10 21:47:52', '2023-02-10 21:47:52'),
(827, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-10_20.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-10 22:27:23', '2023-02-10 22:27:23'),
(828, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-10_53.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-11 03:13:48', '2023-02-11 03:13:48'),
(829, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-10_59.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-11 03:37:41', '2023-02-11 03:37:41'),
(830, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-11_68.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-11 14:42:20', '2023-02-11 14:42:20'),
(831, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-11_82.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-11 15:26:49', '2023-02-11 15:26:49'),
(832, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-11_76.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-11 16:16:55', '2023-02-11 16:16:55'),
(833, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-11_24.pdf', 'latogafacturas@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CAFETERIAS', 1, 12, '2023-02-11 17:47:53', '2023-02-11 17:47:53'),
(834, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-11_64.pdf', 'bibiana.htorio@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: REDES SOCIALES', 1, 12, '2023-02-11 23:11:09', '2023-02-11 23:11:09'),
(835, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-11_54.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-12 03:00:29', '2023-02-12 03:00:29'),
(836, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-11_12.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-12 03:20:38', '2023-02-12 03:20:38'),
(837, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-12_7.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-12 15:23:27', '2023-02-12 15:23:27'),
(838, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-12_69.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-12 15:24:10', '2023-02-12 15:24:10'),
(839, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-12_31.pdf', 'bibiana.htorio@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: REDES SOCIALES', 1, 12, '2023-02-12 19:25:39', '2023-02-12 19:25:39'),
(840, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-12_37.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-13 02:00:49', '2023-02-13 02:00:49'),
(841, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-12_93.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-13 02:55:53', '2023-02-13 02:55:53'),
(842, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-12_64.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-13 02:56:04', '2023-02-13 02:56:04'),
(843, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-13_80.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-13 14:37:27', '2023-02-13 14:37:27'),
(844, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-13_47.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-13 14:57:45', '2023-02-13 14:57:45'),
(845, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-13_48.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-13 15:27:39', '2023-02-13 15:27:39'),
(846, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-13_96.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-13 20:59:07', '2023-02-13 20:59:07'),
(847, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-13_17.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-13 21:35:36', '2023-02-13 21:35:36'),
(848, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-13_62.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: DEUX PRODUCCION', 1, 16, '2023-02-13 21:38:03', '2023-02-13 21:38:03'),
(849, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-13_75.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-13 21:39:20', '2023-02-13 21:39:20'),
(850, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-13_51.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-13 21:39:33', '2023-02-13 21:39:33'),
(851, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-13_81.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-13 22:01:24', '2023-02-13 22:01:24'),
(852, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-13_46.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-14 03:26:46', '2023-02-14 03:26:46'),
(853, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-13_84.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-14 03:48:05', '2023-02-14 03:48:05'),
(854, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-14_50.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-14 14:39:53', '2023-02-14 14:39:53'),
(855, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-14_70.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-14 15:08:55', '2023-02-14 15:08:55'),
(856, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-14_29.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-14 15:39:41', '2023-02-14 15:39:41'),
(857, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-14_47.pdf', 'bibiana.htorio@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: REDES SOCIALES', 1, 12, '2023-02-14 19:20:03', '2023-02-14 19:20:03'),
(858, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-14_29.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-14 22:07:32', '2023-02-14 22:07:32'),
(859, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-14_90.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-14 22:14:18', '2023-02-14 22:14:18'),
(860, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-14_71.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-15 03:51:01', '2023-02-15 03:51:01'),
(861, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-14_87.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-15 04:08:42', '2023-02-15 04:08:42'),
(862, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-15_29.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-15 15:27:52', '2023-02-15 15:27:52'),
(863, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-15_37.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-15 15:44:05', '2023-02-15 15:44:05'),
(864, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-15_44.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-15 16:23:21', '2023-02-15 16:23:21'),
(865, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-15_31.pdf', 'bibiana.htorio@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: REDES SOCIALES', 1, 12, '2023-02-15 19:26:43', '2023-02-15 19:26:43'),
(866, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-15_47.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-15 21:00:14', '2023-02-15 21:00:14'),
(867, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-15_11.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-15 21:33:22', '2023-02-15 21:33:22'),
(868, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-15_80.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-15 23:17:09', '2023-02-15 23:17:09'),
(869, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-15_53.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-15 23:26:52', '2023-02-15 23:26:52'),
(870, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-15_40.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-16 03:00:22', '2023-02-16 03:00:22'),
(871, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-15_57.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-16 03:34:41', '2023-02-16 03:34:41'),
(872, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-16_10.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-16 14:49:29', '2023-02-16 14:49:29'),
(873, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-16_75.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-16 15:22:29', '2023-02-16 15:22:29'),
(874, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-16_71.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-16 15:24:23', '2023-02-16 15:24:23'),
(875, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-16_24.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-16 15:24:32', '2023-02-16 15:24:32'),
(876, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-16_20.pdf', 'bibiana.htorio@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: REDES SOCIALES', 1, 12, '2023-02-16 19:28:33', '2023-02-16 19:28:33'),
(877, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-16_46.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-16 21:02:46', '2023-02-16 21:02:46'),
(878, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-16_74.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-16 21:18:33', '2023-02-16 21:18:33'),
(879, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-16_6.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-16 21:23:56', '2023-02-16 21:23:56'),
(880, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-16_89.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-16 21:26:49', '2023-02-16 21:26:49'),
(881, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-16_55.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-16 21:49:56', '2023-02-16 21:49:56'),
(882, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-16_7.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-17 03:00:19', '2023-02-17 03:00:19'),
(883, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-16_38.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-17 03:29:35', '2023-02-17 03:29:35'),
(884, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-17_31.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-17 14:30:57', '2023-02-17 14:30:57'),
(885, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-17_83.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-17 15:20:36', '2023-02-17 15:20:36'),
(886, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-17_89.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-17 15:29:04', '2023-02-17 15:29:04'),
(887, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-17_54.pdf', 'bibiana.htorio@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: REDES SOCIALES', 1, 12, '2023-02-17 15:37:06', '2023-02-17 15:37:06'),
(888, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-17_35.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-17 21:33:55', '2023-02-17 21:33:55'),
(889, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-17_95.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-17 21:39:38', '2023-02-17 21:39:38'),
(890, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-17_92.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-17 21:46:56', '2023-02-17 21:46:56'),
(891, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-17_40.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-17 22:04:55', '2023-02-17 22:04:55'),
(892, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-17_3.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-18 03:00:34', '2023-02-18 03:00:34'),
(893, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-17_38.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-18 03:44:39', '2023-02-18 03:44:39'),
(894, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-18_95.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-18 15:18:58', '2023-02-18 15:18:58'),
(895, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-18_39.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-18 16:02:49', '2023-02-18 16:02:49'),
(896, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-18_23.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-18 17:15:22', '2023-02-18 17:15:22'),
(897, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-18_94.pdf', 'latogafacturas@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CAFETERIAS', 1, 12, '2023-02-18 17:34:17', '2023-02-18 17:34:17'),
(898, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-18_60.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-19 03:11:03', '2023-02-19 03:11:03'),
(899, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-18_82.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-19 03:39:13', '2023-02-19 03:39:13'),
(900, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-19_75.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-19 15:11:36', '2023-02-19 15:11:36'),
(901, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-19_5.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-19 15:30:16', '2023-02-19 15:30:16'),
(902, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-19_22.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-19 21:49:09', '2023-02-19 21:49:09'),
(903, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-19_8.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-20 02:00:20', '2023-02-20 02:00:20'),
(904, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-19_95.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-20 02:06:29', '2023-02-20 02:06:29'),
(905, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-20_43.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-20 14:57:48', '2023-02-20 14:57:48'),
(906, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-20_43.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-20 15:25:48', '2023-02-20 15:25:48'),
(907, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-20_11.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-20 15:26:10', '2023-02-20 15:26:10'),
(908, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-20_41.pdf', 'bibiana.htorio@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: REDES SOCIALES', 1, 12, '2023-02-20 15:37:32', '2023-02-20 15:37:32'),
(909, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-20_39.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-20 20:56:16', '2023-02-20 20:56:16'),
(910, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-20_34.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-20 21:06:07', '2023-02-20 21:06:07'),
(911, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-20_17.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-20 21:26:01', '2023-02-20 21:26:01');
INSERT INTO `rptemail` (`id`, `nombre`, `ruta`, `email`, `cc`, `asunto`, `id_estatus`, `id_rpt`, `updated_at`, `created_at`) VALUES
(912, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-20_96.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-20 21:53:15', '2023-02-20 21:53:15'),
(913, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-20_80.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-20 22:20:39', '2023-02-20 22:20:39'),
(914, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-20_79.pdf', 'latogafacturas@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CAFETERIAS', 1, 12, '2023-02-20 22:35:55', '2023-02-20 22:35:55'),
(915, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-20_72.pdf', 'latogafacturas@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CAFETERIAS', 1, 12, '2023-02-20 22:36:04', '2023-02-20 22:36:04'),
(916, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-20_14.pdf', 'latogafacturas@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CAFETERIAS', 1, 12, '2023-02-20 22:36:09', '2023-02-20 22:36:09'),
(917, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-20_63.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-21 03:14:12', '2023-02-21 03:14:12'),
(918, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-20_89.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-21 03:25:57', '2023-02-21 03:25:57'),
(919, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-21_34.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-21 15:04:05', '2023-02-21 15:04:05'),
(920, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-21_46.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-21 15:21:07', '2023-02-21 15:21:07'),
(921, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-21_65.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-21 15:27:26', '2023-02-21 15:27:26'),
(922, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-21_62.pdf', 'bibiana.htorio@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: REDES SOCIALES', 1, 12, '2023-02-21 19:34:01', '2023-02-21 19:34:01'),
(923, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-21_87.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-21 20:48:07', '2023-02-21 20:48:07'),
(924, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-21_66.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-21 21:38:42', '2023-02-21 21:38:42'),
(925, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-21_48.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-21 21:59:43', '2023-02-21 21:59:43'),
(926, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-21_41.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-21 22:27:04', '2023-02-21 22:27:04'),
(927, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-21_74.pdf', 'latogafacturas@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CAFETERIAS', 1, 12, '2023-02-21 22:43:02', '2023-02-21 22:43:02'),
(928, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-21_67.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-22 03:03:18', '2023-02-22 03:03:18'),
(929, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-21_91.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-22 03:03:23', '2023-02-22 03:03:23'),
(930, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-21_85.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-22 03:26:28', '2023-02-22 03:26:28'),
(931, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-22_91.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-22 15:01:15', '2023-02-22 15:01:15'),
(932, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-22_48.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-22 15:03:27', '2023-02-22 15:03:27'),
(933, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-22_5.pdf', 'bibiana.htorio@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: REDES SOCIALES', 1, 12, '2023-02-22 15:04:26', '2023-02-22 15:04:26'),
(934, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-22_82.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-22 15:15:20', '2023-02-22 15:15:20'),
(935, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-22_94.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-22 20:57:02', '2023-02-22 20:57:02'),
(936, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-22_41.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-22 21:32:50', '2023-02-22 21:32:50'),
(937, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-22_29.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-22 21:43:35', '2023-02-22 21:43:35'),
(938, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-22_98.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-22 22:31:18', '2023-02-22 22:31:18'),
(939, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-22_19.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-22 22:31:22', '2023-02-22 22:31:22'),
(940, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-22_22.pdf', 'latogafacturas@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CAFETERIAS', 1, 12, '2023-02-22 23:41:47', '2023-02-22 23:41:47'),
(941, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-22_60.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-23 03:00:50', '2023-02-23 03:00:50'),
(942, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-22_73.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-23 03:34:37', '2023-02-23 03:34:37'),
(943, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-23_1.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-23 14:32:05', '2023-02-23 14:32:05'),
(944, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-23_79.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-23 14:32:08', '2023-02-23 14:32:08'),
(945, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-23_91.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-23 15:13:05', '2023-02-23 15:13:05'),
(946, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-23_21.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-23 15:34:15', '2023-02-23 15:34:15'),
(947, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-23_43.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-23 21:03:21', '2023-02-23 21:03:21'),
(948, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-23_59.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-23 21:19:44', '2023-02-23 21:19:44'),
(949, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-23_92.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-23 21:42:40', '2023-02-23 21:42:40'),
(950, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-23_38.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-23 21:52:41', '2023-02-23 21:52:41'),
(951, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-23_22.pdf', 'latogafacturas@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CAFETERIAS', 1, 12, '2023-02-23 22:42:40', '2023-02-23 22:42:40'),
(952, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-23_49.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-24 03:06:59', '2023-02-24 03:06:59'),
(953, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-23_13.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-24 03:47:36', '2023-02-24 03:47:36'),
(954, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-24_8.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-24 14:39:11', '2023-02-24 14:39:11'),
(955, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-24_74.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-24 15:27:19', '2023-02-24 15:27:19'),
(956, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-24_11.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-24 15:29:28', '2023-02-24 15:29:28'),
(957, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-24_52.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-24 21:17:37', '2023-02-24 21:17:37'),
(958, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-24_80.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-24 21:23:29', '2023-02-24 21:23:29'),
(959, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-24_99.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-24 21:26:42', '2023-02-24 21:26:42'),
(960, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-24_18.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-24 21:53:07', '2023-02-24 21:53:07'),
(961, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-24_42.pdf', 'latogafacturas@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CAFETERIAS', 1, 12, '2023-02-24 22:55:13', '2023-02-24 22:55:13'),
(962, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-24_49.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-25 03:01:14', '2023-02-25 03:01:14'),
(963, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-24_6.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-25 03:34:50', '2023-02-25 03:34:50'),
(964, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-25_93.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-25 14:20:51', '2023-02-25 14:20:51'),
(965, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-25_99.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-25 15:32:02', '2023-02-25 15:32:02'),
(966, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-25_40.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-25 16:42:13', '2023-02-25 16:42:13'),
(967, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-25_42.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-26 03:01:50', '2023-02-26 03:01:50'),
(968, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-25_83.pdf', 'bibiana.htorio@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: REDES SOCIALES', 1, 12, '2023-02-26 03:07:09', '2023-02-26 03:07:09'),
(969, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-25_41.pdf', 'bibiana.htorio@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: REDES SOCIALES', 1, 12, '2023-02-26 03:07:14', '2023-02-26 03:07:14'),
(970, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-26_89.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-26 15:18:08', '2023-02-26 15:18:08'),
(971, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-26_40.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-26 15:33:48', '2023-02-26 15:33:48'),
(972, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-26_12.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-27 02:00:56', '2023-02-27 02:00:56'),
(973, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-27_92.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-27 14:53:03', '2023-02-27 14:53:03'),
(974, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-27_36.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-27 15:22:04', '2023-02-27 15:22:04'),
(975, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-27_75.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-27 15:28:56', '2023-02-27 15:28:56'),
(976, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-27_61.pdf', 'bibiana.htorio@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: REDES SOCIALES', 1, 12, '2023-02-27 17:17:35', '2023-02-27 17:17:35'),
(977, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-27_51.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-27 20:52:30', '2023-02-27 20:52:30'),
(978, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-27_40.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-27 21:16:09', '2023-02-27 21:16:09'),
(979, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-27_91.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-27 21:21:57', '2023-02-27 21:21:57'),
(980, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-27_43.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-27 22:07:15', '2023-02-27 22:07:15'),
(981, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-27_6.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-28 02:37:16', '2023-02-28 02:37:16'),
(982, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-27_99.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-28 03:00:35', '2023-02-28 03:00:35'),
(983, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-28_89.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-28 14:25:04', '2023-02-28 14:25:04'),
(984, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-28_74.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-28 15:14:36', '2023-02-28 15:14:36'),
(985, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-28_47.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-02-28 15:14:42', '2023-02-28 15:14:42'),
(986, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-28_84.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-28 15:41:13', '2023-02-28 15:41:13'),
(987, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-28_28.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-28 21:15:48', '2023-02-28 21:15:48'),
(988, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-28_65.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-28 21:15:58', '2023-02-28 21:15:58'),
(989, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-28_12.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-02-28 21:16:08', '2023-02-28 21:16:08'),
(990, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-28_44.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-02-28 21:32:55', '2023-02-28 21:32:55'),
(991, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-28_12.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-02-28 21:40:46', '2023-02-28 21:40:46'),
(992, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-02-28_59.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-02-28 22:21:51', '2023-02-28 22:21:51'),
(993, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-28_43.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-03-01 03:06:47', '2023-03-01 03:06:47'),
(994, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-02-28_71.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-03-01 03:12:01', '2023-03-01 03:12:01'),
(995, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-01_24.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-03-01 14:47:49', '2023-03-01 14:47:49'),
(996, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-01_30.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-03-01 15:19:46', '2023-03-01 15:19:46'),
(997, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-01_37.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-03-01 15:46:19', '2023-03-01 15:46:19'),
(998, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-01_25.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-03-01 21:03:23', '2023-03-01 21:03:23'),
(999, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-01_76.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-03-01 21:37:20', '2023-03-01 21:37:20'),
(1000, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-01_35.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-03-01 22:19:53', '2023-03-01 22:19:53'),
(1001, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-01_95.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-03-01 22:45:27', '2023-03-01 22:45:27'),
(1002, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-01_61.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-03-02 03:00:41', '2023-03-02 03:00:41'),
(1003, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-01_66.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-03-02 03:18:29', '2023-03-02 03:18:29'),
(1004, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-02_38.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-03-02 14:26:27', '2023-03-02 14:26:27'),
(1005, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-02_92.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-03-02 15:23:42', '2023-03-02 15:23:42'),
(1006, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-02_12.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-03-02 16:11:36', '2023-03-02 16:11:36'),
(1007, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-02_42.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-03-02 21:07:48', '2023-03-02 21:07:48'),
(1008, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-02_55.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-03-02 21:25:30', '2023-03-02 21:25:30'),
(1009, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-02_67.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-03-02 21:35:54', '2023-03-02 21:35:54'),
(1010, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-02_91.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-03-02 21:56:20', '2023-03-02 21:56:20'),
(1011, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-02_93.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-03-03 03:20:11', '2023-03-03 03:20:11'),
(1012, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-02_47.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-03-03 03:21:56', '2023-03-03 03:21:56'),
(1013, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-03_30.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-03-03 14:38:38', '2023-03-03 14:38:38'),
(1014, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-03_78.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-03-03 15:22:22', '2023-03-03 15:22:22'),
(1015, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-03_39.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-03-03 15:37:40', '2023-03-03 15:37:40'),
(1016, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-03_21.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-03-03 21:24:19', '2023-03-03 21:24:19'),
(1017, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-03_59.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-03-03 21:32:59', '2023-03-03 21:32:59'),
(1018, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-03_88.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-03-03 22:04:53', '2023-03-03 22:04:53'),
(1019, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-03_29.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-03-03 22:51:50', '2023-03-03 22:51:50'),
(1020, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-03_82.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-03-04 03:00:57', '2023-03-04 03:00:57'),
(1021, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-03_34.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-03-04 03:25:49', '2023-03-04 03:25:49'),
(1022, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-04_32.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-03-04 14:42:00', '2023-03-04 14:42:00'),
(1023, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-04_1.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-03-04 15:50:18', '2023-03-04 15:50:18'),
(1024, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-04_32.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-03-04 16:14:49', '2023-03-04 16:14:49'),
(1025, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-04_5.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-03-04 16:14:55', '2023-03-04 16:14:55'),
(1026, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-04_50.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-03-05 03:00:40', '2023-03-05 03:00:40'),
(1027, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-04_94.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-03-05 03:45:25', '2023-03-05 03:45:25'),
(1028, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-05_7.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-03-05 15:02:52', '2023-03-05 15:02:52'),
(1029, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-05_77.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-03-05 15:26:44', '2023-03-05 15:26:44'),
(1030, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-05_44.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-03-06 02:00:33', '2023-03-06 02:00:33'),
(1031, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-05_30.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-03-06 02:12:07', '2023-03-06 02:12:07'),
(1032, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-06_51.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-03-06 14:53:41', '2023-03-06 14:53:41'),
(1033, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-06_10.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-03-06 15:12:23', '2023-03-06 15:12:23'),
(1034, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-06_31.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-03-06 15:23:18', '2023-03-06 15:23:18'),
(1035, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-06_7.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-03-06 20:46:28', '2023-03-06 20:46:28'),
(1036, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-06_57.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-03-06 21:37:37', '2023-03-06 21:37:37'),
(1037, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-06_66.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-03-06 21:45:57', '2023-03-06 21:45:57'),
(1038, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-06_56.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-03-06 21:48:52', '2023-03-06 21:48:52'),
(1039, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-06_61.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-03-07 03:00:37', '2023-03-07 03:00:37'),
(1040, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-06_4.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-03-07 03:32:16', '2023-03-07 03:32:16'),
(1041, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-07_15.pdf', 'themariomarvel@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: DEUX PRODUCCION', 1, 12, '2023-03-07 14:46:19', '2023-03-07 14:46:19'),
(1042, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-07_92.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-03-07 14:47:22', '2023-03-07 14:47:22'),
(1043, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-07_16.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-03-07 15:21:45', '2023-03-07 15:21:45'),
(1044, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-07_81.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: JUAREZ', 1, 16, '2023-03-07 20:55:06', '2023-03-07 20:55:06'),
(1045, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-07_9.pdf', 'latogafacturas@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CAFETERIAS', 1, 12, '2023-03-07 21:11:54', '2023-03-07 21:11:54'),
(1046, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-07_39.pdf', 'jeferegionalcoatepec@gmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: JUAREZ', 1, 12, '2023-03-07 21:35:58', '2023-03-07 21:35:58'),
(1047, 'suc_ape_fin', 'files/reportesmail/suc_ape_fin_2023-03-07_79.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Cierre de Sucursal: CLAVIJERO', 1, 16, '2023-03-07 21:49:35', '2023-03-07 21:49:35'),
(1048, 'suc_ape_ini', 'files/reportesmail/suc_ape_ini_2023-03-07_81.pdf', 'araceli-hp@hotmail.com', 'latogasistemas@gmail.com', 'Apertura de Sucursal: CLAVIJERO', 1, 12, '2023-03-07 22:25:41', '2023-03-07 22:25:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rpt_filtros`
--

DROP TABLE IF EXISTS `rpt_filtros`;
CREATE TABLE `rpt_filtros` (
  `id_filtro` int(10) UNSIGNED NOT NULL,
  `id_rpt` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_tip_filt` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_oper` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `etiqueta` varchar(150) NOT NULL DEFAULT '',
  `valor` varchar(50) NOT NULL DEFAULT '',
  `texto` varchar(50) NOT NULL DEFAULT '',
  `consulta` varchar(21000) NOT NULL DEFAULT '',
  `orden` tinyint(4) NOT NULL DEFAULT 0,
  `estatus` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `rpt_filtros`
--

INSERT INTO `rpt_filtros` (`id_filtro`, `id_rpt`, `id_tip_filt`, `id_oper`, `etiqueta`, `valor`, `texto`, `consulta`, `orden`, `estatus`) VALUES
(1, 1, 1, 1, 'Usuario', 'id_usuario', 'nombre', 'SELECT id_usuario,nombre FROM usuarios WHERE id_estatus = 1', 1, 1),
(2, 1, 2, 1, 'Usuario', 'id_usr', 'nombre', 'SELECT id_usuario AS id_usr,nombre FROM usuarios WHERE id_estatus = 1', 2, 1),
(3, 1, 3, 1, 'Usuario', 'fec', '', '', 3, 1),
(4, 1, 4, 1, 'Usuario', 'fec_reg', '', '', 4, 1),
(136, 3, 1, 1, 'Nombre:', 'php_version', 'php_version', 'SELECT id_usuario, nombre AS php_version FROM usuarios WHERE id_estatus = 1', 1, 1),
(135, 5, 3, 1, 'php_version', 'php_version', '', '', 1, 1),
(134, 7, 3, 1, 'Fecha', 'Fecha', '', '', 1, 1),
(1455, 9, 1, 1, 'Almacén', 'Almacen', 'Almacen', 'SELECT \'TODOS\' as Almacen', 1, 1),
(1840, 10, 1, 1, 'Almacén', 'Almacen', 'Almacen', 'SELECT descripcion as Almacen FROM almacenes WHERE id_estatus = 1 ORDER BY descripcion', 1, 1),
(1601, 12, 1, 1, 'Turno', 'Turno', 'Turno', 'SELECT descripcion AS Turno FROM turnos WHERE id_estatus = 1 ORDER BY descripcion', 3, 1),
(1600, 12, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT descripcion AS Sucursal FROM sucursales WHERE id_estatus = 1 ORDER BY descripcion', 2, 1),
(1491, 14, 1, 1, 'Etiqueta', 'Etiqueta', 'Etiqueta', 'SELECT e.Etiqueta FROM (\r\n		SELECT \'TODAS\' AS Etiqueta, 1 AS Orden UNION ALL\r\n		SELECT descripcion AS Etiqueta, 2 AS Orden FROM etiquetas WHERE id_estatus = 1) AS e \r\nORDER BY\r\n		e.Orden, e.Etiqueta', 5, 1),
(1489, 14, 1, 1, 'Almacén', 'Almacen', 'Almacen', 'SELECT descripcion as Almacen FROM almacenes WHERE id_estatus = 1 ORDER BY descripcion', 3, 1),
(1488, 14, 3, 1, 'Fecha Final', 'FechaFinal', '', '', 2, 1),
(1487, 14, 3, 1, 'Fecha Inicial', 'FechaInicial', '', '', 1, 1),
(1495, 15, 3, 1, 'Fecha', 'Fecha', '', '', 1, 1),
(1432, 16, 1, 1, 'Turno', 'Turno', 'Turno', 'SELECT descripcion AS Turno FROM turnos WHERE id_estatus = 1 ORDER BY descripcion', 3, 1),
(1856, 17, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT descripcion AS Sucursal FROM sucursales WHERE id_estatus = 1 ORDER BY descripcion', 2, 1),
(1857, 17, 1, 1, 'Turno', 'Turno', 'Turno', 'SELECT descripcion AS Turno FROM turnos WHERE id_estatus = 1 ORDER BY descripcion', 3, 1),
(1830, 18, 1, 1, 'Agrupar por Categoría', 'Agrupar', 'Agrupar', 'select \'NO\' as Agrupar union all\r\nselect \'SI\' as Agrupar', 7, 1),
(1828, 18, 1, 1, 'Turno', 'Turno', 'Turno', 'SELECT t.Turno FROM (\r\nSELECT descripcion AS Turno, 2 as orden FROM turnos WHERE id_estatus = 1\r\nUNION ALL\r\nSELECT \'TODOS\' AS Turno, 1 as orden) AS t ORDER BY t.orden, t.Turno', 5, 1),
(947, 20, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT s.suc as Sucursal FROM (\r\nSELECT descripcion AS suc, \'B\' AS orden FROM sucursales WHERE id_estatus = 1 UNION ALL\r\nSELECT \'TODAS\' AS suc, \'A\' AS orden) AS s ORDER BY s.orden, s.suc', 2, 1),
(948, 20, 1, 1, 'Producto', 'Producto', 'Producto', 'SELECT p.pro as Producto FROM (\r\nSELECT descripcion AS pro, \'B\' AS orden FROM productos WHERE id_estatus = 1 and id_tip_cad = 73 UNION ALL\r\nSELECT \'TODOS\' AS pro, \'A\' AS orden) AS p ORDER BY p.orden, p.pro', 3, 1),
(1558, 19, 1, 1, 'Almacén', 'Almacen', 'Almacen', 'SELECT descripcion AS Almacen FROM almacenes WHERE tipo IN (2,3) AND id_estatus = 1', 1, 1),
(1559, 19, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT s.suc as Sucursal FROM (\r\nSELECT descripcion AS suc, \'B\' AS orden FROM sucursales WHERE id_estatus = 1 UNION ALL\r\nSELECT \'TODAS\' AS suc, \'A\' AS orden) AS s ORDER BY s.orden, s.suc', 2, 1),
(1560, 19, 1, 1, 'Producto', 'Producto', 'Producto', 'SELECT p.pro as Producto FROM (\r\nSELECT descripcion AS pro, \'B\' AS orden FROM productos WHERE id_estatus = 1 and id_tip_cad = 72 UNION ALL\r\nSELECT \'TODOS\' AS pro, \'A\' AS orden) AS p ORDER BY p.orden, p.pro', 3, 1),
(1816, 21, 1, 1, 'Producto', 'Producto', 'Producto', 'SELECT descripcion AS Producto FROM productos WHERE id_estatus = 1 ORDER BY descripcion', 1, 1),
(952, 22, 3, 1, 'Fecha Final', 'FecFin', '', '', 3, 1),
(950, 22, 1, 1, 'Almacén', 'Almacen', 'Almacen', 'SELECT descripcion AS Almacen FROM almacenes WHERE id_estatus = 1 AND tipo IN (2,3) ORDER BY descripcion', 1, 1),
(954, 23, 1, 1, 'Turno', 'Turno', 'Turno', 'SELECT ucase(descripcion) AS Turno FROM turnos WHERE id_estatus = 1 ORDER BY descripcion', 2, 1),
(956, 24, 3, 1, 'Fecha Inicial', 'FecIni', '', '', 1, 1),
(957, 24, 3, 1, 'Fecha Final', 'FecFin', '', '', 2, 1),
(962, 26, 3, 1, 'FechaFin', 'FecFin', '', '', 2, 1),
(965, 27, 1, 1, 'Tipo', 'Tipo', 'Tipo', 'SELECT \'TODOS\' AS Tipo UNION ALL\r\nSELECT \'TRASPASO\' AS Tipo UNION ALL\r\nSELECT \'TRANSFERENCIA\' AS Tipo', 3, 1),
(964, 27, 1, 1, 'SucursalDestino', 'SucursalDestino', 'SucursalDestino', 'SELECT a.SucursalDestino FROM (\r\n	SELECT \'TODAS\' AS SucursalDestino, 1 AS orden UNION ALL \r\n	SELECT ucase(descripcion) AS SucursalDestino, 2 AS orden FROM sucursales WHERE id_estatus = 1) AS a\r\nORDER BY \r\n	a.orden, a.sucursalDestino', 2, 1),
(963, 27, 1, 1, 'SucursalOrigen', 'SucursalOrigen', 'SucursalOrigen', 'SELECT a.SucursalOrigen FROM (\r\n	SELECT \'TODAS\' AS SucursalOrigen, 1 AS orden UNION ALL \r\n	SELECT ucase(descripcion) AS SucursalOrigen, 2 AS orden FROM sucursales WHERE id_estatus = 1) AS a\r\nORDER BY \r\n	a.orden, a.sucursalOrigen', 1, 1),
(1891, 28, 1, 1, 'Vale', 'Vale', 'Vale', 'SELECT \'TODOS\' AS Vale UNION ALL\r\nSELECT \'APLICADO\' AS Vale UNION ALL\r\nSELECT \'VIGENTE\' AS Vale', 4, 1),
(1889, 28, 3, 1, 'Fecha Inicial', 'FecIni', '', '', 2, 1),
(1890, 28, 3, 1, 'Fecha Final', 'FecFin', '', '', 3, 1),
(1213, 29, 1, 1, 'Tipo', 'Tipo', 'Tipo', 'SELECT \'TODOS\' AS Tipo UNION ALL\r\nSELECT \'CON SALDO\' AS Tipo UNION ALL\r\nSELECT \'SIN SALDO\' AS Tipo', 2, 1),
(1212, 29, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT a.Sucursal FROM (\r\n	SELECT \'TODAS\' AS Sucursal, 1 AS orden UNION ALL \r\n	SELECT ucase(descripcion) AS Sucursal, 2 AS orden FROM sucursales WHERE id_estatus = 1) AS a\r\nORDER BY \r\n	a.orden, a.sucursal', 1, 1),
(1148, 31, 1, 1, 'Rol', 'Rol', 'Rol', 'SELECT a.Rol FROM\r\n(SELECT 1 AS orden, \'TODOS\' AS Rol UNION all\r\nSELECT 2 as orden, ucase(des) AS Rol FROM rol WHERE id_estatus = 1) AS a\r\nORDER BY \r\n a.orden, a.Rol', 2, 1),
(527, 35, 1, 1, 'Estado', 'Estado', 'Estado', 'SELECT \'TODOS\' AS Estado UNION ALL\r\nSELECT \'ACTIVO\' AS Estado UNION ALL\r\nSELECT \'ELIMINADO\' AS Estado', 1, 0),
(1149, 32, 1, 1, 'Estado', 'Estado', 'Estado', 'SELECT \'TODOS\' AS Estado UNION ALL\r\nSELECT \'ACTIVO\' AS Estado UNION ALL\r\nSELECT \'ELIMINADO\' AS Estado', 1, 1),
(869, 33, 1, 1, 'Estado', 'Estado', 'Estado', 'SELECT \'TODOS\' AS Estado UNION ALL\r\nSELECT \'ACTIVO\' AS Estado UNION ALL\r\nSELECT \'ELIMINADO\' AS Estado', 1, 1),
(870, 34, 1, 1, 'Estado', 'Estado', 'Estado', 'SELECT \'TODOS\' AS Estado UNION ALL\r\nSELECT \'ACTIVO\' AS Estado UNION ALL\r\nSELECT \'ELIMINADO\' AS Estado', 1, 1),
(871, 36, 1, 1, 'Estado', 'Estado', 'Estado', 'SELECT \'TODOS\' AS Estado UNION ALL\r\nSELECT \'ACTIVO\' AS Estado UNION ALL\r\nSELECT \'ELIMINADO\' AS Estado', 1, 1),
(872, 37, 1, 1, 'Estado', 'Estado', 'Estado', 'SELECT \'TODOS\' AS Estado UNION ALL\r\nSELECT \'ACTIVO\' AS Estado UNION ALL\r\nSELECT \'ELIMINADO\' AS Estado', 1, 1),
(873, 37, 1, 1, 'Categoría', 'Cat', 'Cat', 'SELECT a.Cat FROM\r\n(SELECT 1 AS orden, \'TODOS\' AS Cat UNION ALL\r\nSELECT 2 as orden, ucase(descripcion) AS Cat FROM categorias WHERE id_estatus = 1 AND id_entidad=11) AS a\r\nORDER BY \r\n a.orden, a.Cat', 2, 1),
(874, 37, 1, 1, 'Tipo de Caducidad', 'Cad', 'Cad', 'SELECT a.Cad FROM\r\n(SELECT 1 AS orden, \'TODOS\' AS Cad UNION ALL SELECT 2 AS orden, UCASE(\'Sin Asignar\') AS Cad UNION ALL\r\nSELECT 3 as orden, ucase(des) AS Cad FROM sis_tip WHERE estatus = 1 AND id_tip_pad=71) AS a\r\nORDER BY \r\n a.orden, a.Cad', 3, 1),
(976, 38, 1, 1, 'Ruta', 'Ruta', 'Ruta', 'SELECT a.Ruta FROM (\r\n	SELECT 1 AS orden, \'TODAS\' AS Ruta UNION ALL \r\n	SELECT distinct 2 as orden, ruta AS Ruta FROM sucursales WHERE id_estatus = 1 AND NOT(ruta = \'\') ORDER BY Ruta) AS a\r\nORDER BY a.orden, a.Ruta', 2, 1),
(977, 38, 1, 1, 'Categoría', 'Categoria', 'Categoria', 'SELECT a.Categoria FROM (\r\n	SELECT 1 AS orden, \'TODAS\' AS Categoria UNION ALL \r\n	SELECT distinct 2 as orden, c.descripcion AS Categoria FROM productos AS p inner join categorias AS c ON c.id_categoria = p.id_categoria WHERE p.id_estatus = 1 AND c.id_categoria <> 0) AS a\r\nORDER BY a.orden, a.Categoria', 3, 1),
(978, 38, 1, 1, 'Producto', 'Producto', 'Producto', 'SELECT a.Producto FROM (\r\n	SELECT 1 AS orden, \'TODOS\' AS Producto UNION ALL \r\n	SELECT distinct 2 as orden, p.descripcion AS Producto FROM productos AS p WHERE p.id_estatus = 1 AND p.id_tip_cad IN (72,73) AND p.sub_producto = 0) AS a\r\nORDER BY a.orden, a.Producto', 4, 1),
(1617, 39, 1, 1, 'Nivel', 'Nivel', 'Nivel', 'SELECT \"1\" AS Nivel UNION ALL \r\nSELECT \"2\" AS Nivel UNION ALL \r\nSELECT \"3\" AS Nivel', 1, 1),
(980, 40, 1, 1, 'Ticket', 'Ticket', 'Ticket', 'select id_nota_venta as Ticket from nota_venta order by id_nota_venta desc', 1, 1),
(1599, 12, 3, 1, 'Fecha', 'Fecha', '', '', 1, 1),
(1384, 30, 1, 1, 'Folio', 'Folio', 'Folio', 'SELECT clave AS Folio FROM pe_eventos WHERE id_evento > 0 ORDER BY id_evento desc', 1, 1),
(953, 23, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT ucase(descripcion) AS Sucursal FROM sucursales WHERE id_estatus = 1 ORDER BY descripcion', 1, 1),
(1813, 42, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT descripcion AS Sucursal FROM sucursales WHERE id_estatus = 1 ORDER BY descripcion', 2, 1),
(1814, 42, 1, 1, 'Formato', 'Formato', 'Formato', 'SELECT \'RESUMEN\' AS Formato UNION ALL\r\nSELECT \'DETALLE\' AS Formato', 3, 1),
(946, 20, 1, 1, 'Almacén', 'Almacen', 'Almacen', 'SELECT descripcion AS Almacen FROM almacenes WHERE tipo IN (2,3) AND id_estatus = 1', 1, 1),
(951, 22, 3, 1, 'Fecha Inicial', 'FecIni', '', '', 2, 1),
(1238, 25, 3, 1, 'Fecha Inicial', 'FecIni', '', '', 2, 1),
(961, 26, 3, 1, 'Fecha Inicial', 'FecIni', '', '', 1, 1),
(966, 27, 3, 1, 'Fecha Inicial', 'FecIni', '', '', 4, 1),
(1888, 28, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT a.Sucursal FROM (\r\n	SELECT \'TODAS\' AS Sucursal, 1 AS orden UNION ALL \r\n	SELECT ucase(descripcion) AS Sucursal, 2 AS orden FROM sucursales WHERE id_estatus = 1) AS a\r\nORDER BY \r\n	a.orden, a.sucursal', 1, 1),
(1147, 31, 1, 1, 'Estado', 'Estado', 'Estado', 'SELECT \'TODOS\' AS Estado UNION ALL\r\nSELECT \'ACTIVO\' AS Estado UNION ALL\r\nSELECT \'ELIMINADO\' AS Estado', 1, 1),
(975, 38, 1, 1, 'Almacén', 'Almacen', 'Almacen', 'SELECT 2 as orden, descripcion AS Almacen FROM almacenes WHERE id_estatus = 1 AND tipo IN (2,3) ORDER BY descripcion', 1, 1),
(1812, 42, 3, 1, 'Fecha', 'Fecha', '', '', 1, 1),
(985, 43, 3, 1, 'Fecha Inicial', 'FecIni', '', '', 1, 1),
(986, 43, 3, 1, 'FechaFinal', 'FecFin', '', '', 2, 1),
(987, 43, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT s.Sucursal FROM (\r\nSELECT 1 AS orden, \'TODAS\' AS Sucursal UNION ALL \r\nSELECT 2 as orden, descripcion AS Sucursal FROM sucursales WHERE id_estatus = 1) AS s\r\nORDER BY s.orden, s.sucursal', 3, 1),
(988, 43, 1, 1, 'Categoría', 'Categoria', 'Categoria', 'SELECT c.Categoria FROM (\r\nSELECT 1 AS orden, \'TODAS\' AS Categoria UNION ALL \r\nSELECT 2 AS Orden, descripcion AS Categoria FROM categorias WHERE id_estatus = 1 AND id_entidad = 11) AS c\r\nORDER BY c.orden, c.Categoria', 4, 1),
(990, 44, 3, 1, 'FechaFinal', 'FecFin', '', '', 2, 1),
(991, 44, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT s.Sucursal FROM (\r\nSELECT 1 AS orden, \'TODAS\' AS Sucursal UNION ALL \r\nSELECT 2 as orden, descripcion AS Sucursal FROM sucursales WHERE id_estatus = 1) AS s\r\nORDER BY s.orden, s.sucursal', 3, 1),
(989, 44, 3, 1, 'Fecha Inicial', 'FecIni', '', '', 1, 1),
(1801, 45, 1, 1, 'Estatus', 'Estatus', 'Estatus', 'SELECT e.sts_gto AS \'Estatus\' FROM (\r\n	SELECT 1 AS orden, \'TODOS\' AS sts_gto UNION ALL \r\n	SELECT 2 AS orden, \'VIGENTE\' AS sts_gto UNION ALL \r\n	SELECT 3 AS orden, \'CANCELADO\' AS sts_gto) AS e\r\nORDER BY e.orden', 4, 1),
(1800, 45, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT descripcion AS Sucursal FROM sucursales WHERE id_estatus = 1 ORDER BY descripcion', 3, 1),
(1798, 45, 3, 1, 'Fecha Inicial', 'FecIni', '', '', 1, 1),
(1799, 45, 3, 1, 'Fecha Final', 'FecFin', '', '', 2, 1),
(998, 46, 1, 1, 'Categoría', 'Categoria', 'Categoria', 'SELECT c.cat AS Categoria FROM (\r\nSELECT 1 AS orden, \'TODAS\' AS cat UNION all\r\nSELECT 2 AS orden, c.descripcion AS cat FROM categorias AS c WHERE c.id_estatus = 1 AND c.id_entidad = 11) AS c\r\nORDER BY c.orden, c.cat', 2, 1),
(997, 46, 1, 1, 'Lista de Precios', 'Lista', 'Lista', 'SELECT l.lista AS Lista FROM (\r\nSELECT 1 AS orden, \'TODAS\' AS lista UNION all\r\nSELECT 2 AS orden, l.descripcion AS lista FROM list_pre AS l WHERE l.id_estatus = 1) AS l\r\nORDER BY l.orden, l.lista', 1, 1),
(955, 23, 3, 1, 'Fecha', 'Fecha', '', '', 3, 1),
(1237, 25, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT a.Sucursal FROM (\r\n	SELECT \'TODAS\' AS Sucursal, 1 AS orden UNION ALL \r\n	SELECT ucase(descripcion) AS Sucursal, 2 AS orden FROM sucursales WHERE id_estatus = 1) AS a\r\nORDER BY \r\n	a.orden, a.sucursal', 1, 1),
(967, 27, 3, 1, 'Fecha Final', 'FecFin', '', '', 5, 1),
(992, 44, 1, 1, 'Estatus', 'Estatus', 'Estatus', 'select \'TODOS\' as Estatus', 4, 1),
(1236, 47, 1, 1, 'Formato', 'Formato', 'Formato', 'select \'RESUMEN\' as Formato union all\r\nselect \'DETALLE\' as Formato', 4, 1),
(1235, 47, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT descripcion AS Sucursal FROM sucursales WHERE id_estatus = 1 ORDER BY descripcion', 3, 1),
(1233, 47, 3, 1, 'Fecha Inicial', 'FecIni', '', '', 1, 1),
(1234, 47, 3, 1, 'Fecha Final', 'FecFin', '', '', 2, 1),
(1662, 48, 3, 1, 'Fecha Inicial', 'FecIni', '', '', 1, 1),
(1663, 48, 3, 1, 'Fecha Final', 'FecFin', '', '', 2, 1),
(1052, 49, 2, 1, 'Categoria', 'Categoria', 'Categoria', 'SELECT descripcion AS Categoria FROM categorias  WHERE id_estatus = 1 and id_entidad = 11', 1, 1),
(1665, 48, 2, 1, 'Estado', 'estatus', 'estatus', 'SELECT distinct Estado AS \'estatus\' FROM vt_rpt_log_ped_esp_pro ORDER BY Estado', 4, 1),
(1664, 48, 2, 1, 'Region', 'region', 'region', 'SELECT descripcion AS region FROM regiones WHERE id_estatus = 1 ORDER BY descripcion', 3, 1),
(1071, 50, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT s.sucursal as Sucursal FROM (\r\nSELECT \'TODAS\' AS Sucursal, 1 AS orden UNION ALL  \r\nSELECT descripcion AS Sucursal, 2 AS orden FROM sucursales WHERE id_estatus = 1) AS s\r\nORDER BY s.orden, s.Sucursal', 1, 1),
(1072, 50, 1, 1, 'Estatus de la Promoción', 'Estatus', 'Estatus', 'SELECT \'ACTIVA\' as Estatus UNION ALL\r\nSELECT \'TERMINADA\' as Estatus UNION ALL\r\nSELECT \'TODOS\' as Estatus', 2, 1),
(1690, 6, 1, 1, 'Formato', 'Formato', 'Formato', 'select \'RESUMEN\' as Formato union all\r\nselect \'DETALLE\' as Formato', 3, 1),
(1688, 6, 3, 1, 'Fecha', 'Fecha', '', '', 1, 1),
(1689, 6, 1, 1, 'Agrupar por Categoría', 'Grupo', 'Grupo', 'select \'NO\' as Grupo union all\r\nselect \'SI\' as Grupo', 2, 1),
(1734, 51, 3, 1, 'Fecha Inicial', 'FecIni', '', '', 1, 1),
(1735, 51, 3, 1, 'Fecha Final', 'FecFin', '', '', 2, 1),
(1736, 51, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT Sucursal FROM (\r\nSELECT \'TODAS\' AS Sucursal, 1 AS orden UNION all\r\nSELECT descripcion as Sucursal, 2 as orden FROM sucursales WHERE id_estatus = 1) AS a\r\nORDER BY a.orden, a.Sucursal', 3, 1),
(1737, 51, 1, 1, 'Estado del Pedido', 'Estatus', 'Estatus', 'SELECT a.Estatus\r\nFROM (\r\n	SELECT \'TODOS\' AS \'Estatus\', 1 AS orden UNION \r\n	SELECT \'COTIZACIÓN\' AS \'Estatus\', 2 AS orden UNION \r\n	SELECT \'EN RUTA\' AS \'Estatus\', 2 AS orden UNION \r\n	SELECT \'LIBERADO\' AS \'Estatus\', 2 AS orden UNION \r\n	SELECT \'SIN PROGRAMAR\' AS \'Estatus\', 2 AS orden UNION \r\n	SELECT \'PROGRAMADO\' AS \'Estatus\', 2 AS orden UNION \r\n	SELECT \'ENTREGADO\' AS \'Estatus\', 2 AS orden UNION \r\n	SELECT \'CANCELADO\' AS \'Estatus\', 2 AS orden) AS a\r\nORDER BY a.orden, a.Estatus', 4, 1),
(1829, 18, 1, 1, 'Formato', 'Formato', 'Formato', 'select \'RESUMEN\' as Formato union all\r\nselect \'DETALLE\' as Formato', 6, 1),
(1824, 18, 3, 1, 'Fecha Inicial', 'FecIni', '', '', 1, 1),
(1825, 18, 3, 1, 'Fecha Final', 'FecFin', '', '', 2, 1),
(1826, 18, 1, 1, 'Región', 'Region', 'Region', 'SELECT r.Region FROM (\r\n	SELECT \'TODAS\' AS Region, 1 AS orden UNION ALL\r\n	SELECT r.descripcion AS Region, 2 AS orden FROM regiones AS r WHERE r.id_estatus = 1) AS r\r\nORDER BY \r\n	r.orden, r.Region', 3, 1),
(1496, 13, 3, 1, 'Fecha', 'Fecha', '', '', 1, 1),
(1497, 13, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT descripcion AS Sucursal FROM sucursales WHERE id_estatus = 1 ORDER BY descripcion', 2, 1),
(1128, 52, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT s.Sucursal FROM (\r\n	SELECT \'TODAS\' AS Sucursal, 1 AS orden UNION ALL\r\n	SELECT s.descripcion AS Sucursal, 2 AS orden FROM sucursales AS s WHERE id_estatus = 1) AS s\r\norder BY s.orden, s.Sucursal', 1, 1),
(1129, 52, 1, 1, 'Estatus de la Solicitud', 'Estatus', 'Estatus', 'SELECT s.Estatus FROM (\r\n		SELECT \'TODOS\' AS \'Estatus\', 1 AS orden UNION ALL\r\n		SELECT \'POR FACTURAR\' AS \'Estatus\', 2 AS orden UNION ALL\r\n		SELECT \'SOLICITUD CANCELADA\' AS \'Estatus\', 3 AS orden UNION ALL\r\n		SELECT \'FACTURADO\' AS \'Estatus\', 4 AS orden UNION ALL\r\n		SELECT \'POR CANCELAR\' AS \'Estatus\', 5 AS orden UNION ALL\r\n		SELECT \'FACTURA CANCELADA\' AS \'Estatus\', 6 AS orden) AS s\r\nORDER BY s.orden', 2, 1),
(1130, 52, 1, 1, 'Solo Solicitudes Pendientes', 'Pendiente', 'Pendiente', 'Select \'SI\' as Pendiente union all\r\nSelect \'NO\' as Pendiente', 3, 1),
(1138, 53, 1, 1, 'Sucursales', 'Sucursales', 'Sucursales', 'select \'TODAS\' as Sucursales union all\r\nselect \'CON RUTA\' as Sucursales union all\r\nselect \'SIN RUTA\' as Sucursales', 1, 1),
(1139, 53, 1, 1, 'Agrupar por Ruta', 'Agrupar', 'Agrupar', 'select \'SI\' as Agrupar union all\r\nselect \'NO\' as Agrupar', 2, 1),
(1133, 54, 3, 1, 'Fecha Inicial', 'fini', '', '', 1, 1),
(1134, 54, 3, 1, 'Fecha Final', 'ffin', '', '', 2, 1),
(1135, 54, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT s.suc as Sucursal FROM (\r\nSELECT descripcion AS suc, \'B\' AS orden FROM sucursales WHERE id_estatus = 1 UNION ALL\r\nSELECT \'TODAS\' AS suc, \'A\' AS orden) AS s ORDER BY s.orden, s.suc', 3, 1),
(1136, 54, 1, 1, 'Estatus del Ticket', 'Estatus', 'Estatus', 'select \'TODOS\' as Estatus union all\r\nselect \'FACTURADO\' as Estatus union all\r\nselect \'FACTURA CANCELADA\' as Estatus', 4, 1),
(1137, 54, 1, 1, 'Formato', 'Formato', 'Formato', 'select \'RESUMEN\' as Formato union all\r\nselect \'DETALLE\' as Formato', 5, 1),
(1922, 41, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT descripcion AS Sucursal FROM sucursales WHERE id_estatus = 1 ORDER BY descripcion', 2, 1),
(1214, 55, 3, 1, 'Fecha Inicial', 'fini', '', '', 1, 1),
(1215, 55, 3, 1, 'Fecha Final', 'ffin', '', '', 2, 1),
(1216, 55, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT s.suc as Sucursal FROM (\r\nSELECT descripcion AS suc, \'B\' AS orden FROM sucursales WHERE id_estatus = 1 UNION ALL\r\nSELECT \'TODAS\' AS suc, \'A\' AS orden) AS s ORDER BY s.orden, s.suc', 3, 1),
(1344, 56, 1, 1, 'Agrupar Después por', 'grupo2', 'grupo2', 'Select \'CATEGORIA\' as grupo2 union all\r\nSelect  \'SUCURSAL\' as grupo2 union all\r\nSelect \'PRODUCTO\' as grupo2', 5, 1),
(1341, 56, 3, 1, 'Fecha Final', 'ffin', '', '', 2, 1),
(1342, 56, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT s.suc as Sucursal FROM (\r\nSELECT descripcion AS suc, \'B\' AS orden FROM sucursales WHERE id_estatus = 1 UNION ALL\r\nSELECT \'TODAS\' AS suc, \'A\' AS orden) AS s ORDER BY s.orden, s.suc', 3, 1),
(1343, 56, 1, 1, 'Agrupar Primero por', 'grupo1', 'grupo1', 'Select \'SUCURSAL\' as grupo1 union all\r\nSelect \'CATEGORIA\' as grupo1 union all\r\nSelect \'PRODUCTO\' as grupo1', 4, 1),
(1340, 56, 3, 1, 'Fecha Inicial', 'fini', '', '', 1, 1),
(1239, 25, 3, 1, 'Fecha Final', 'FecFin', '', '', 3, 1),
(1892, 8, 3, 1, 'Fecha Inicial', 'FechaInicial', '', '', 1, 1),
(1893, 8, 3, 1, 'Fecha Final', 'FechaFinal', '', '', 2, 1),
(1894, 8, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT s.suc as Sucursal FROM (\r\nSELECT descripcion AS suc, \'B\' AS orden FROM sucursales WHERE id_estatus = 1 UNION ALL\r\nSELECT \'TODAS\' AS suc, \'A\' AS orden) AS s ORDER BY s.orden, s.suc', 3, 1),
(1467, 11, 1, 1, 'Modulo', 'Modulo', 'Modulo', 'SELECT \'TODOS\' AS Modulo UNION ALL\r\nSELECT \'PRODUCTOS\' AS Modulo UNION ALL\r\nSELECT \'MERMAS\'  AS Modulo UNION ALL\r\nSELECT \'DEVOLUCIONES\' AS Modulo', 2, 1),
(1345, 56, 1, 1, 'Mostrar Etiquetas', 'etiqueta', 'etiqueta', 'Select \'SI\' as etiqueta union all\r\nSelect \'NO\' as etiqueta', 6, 1),
(1430, 16, 3, 1, 'Fecha', 'Fecha', '', '', 1, 1),
(1431, 16, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT descripcion AS Sucursal FROM sucursales WHERE id_estatus = 1 ORDER BY descripcion', 2, 1),
(1785, 57, 1, 1, 'Folio de Pedido Especial', 'Folio', 'Folio', 'SELECT e.clave AS Folio\r\nFROM pe_eventos e LEFT JOIN vt_rpt_tot_not_vta_ped_esp t ON e.id_evento = t.id_evento\r\nWHERE e.id_evento > 0 AND t.Total <> 0\r\nORDER BY e.clave DESC', 1, 1),
(1895, 8, 1, 1, 'Mostrar Pedidos Cancelados', 'Cnl', 'Cnl', 'SELECT \'NO\' AS Cnl UNION ALL\r\nSELECT \'SI\' AS Cnl', 4, 1),
(1456, 9, 1, 1, 'Mostrar Eliminados', 'Cnl', 'Cnl', 'SELECT \'NO\' as Cnl union all\r\nSELECT \'SI\' as Cnl', 2, 1),
(1466, 11, 1, 1, 'Estado', 'Estado', 'Estado', 'SELECT \'TODOS\' AS Estado UNION ALL\r\nSELECT \'ACTIVO\' AS Estado UNION ALL\r\nSELECT \'ELIMINADO\' AS Estado', 1, 1),
(1498, 13, 1, 1, 'Agrupar por Categoría', 'Agrupar', 'Agrupar', 'select \'NO\' as Agrupar union all\r\nselect \'SI\' as Agrupar', 3, 1),
(1490, 14, 1, 1, 'Producto', 'Producto', 'Producto', 'SELECT descripcion AS Producto FROM productos WHERE id_estatus = 1 ORDER BY descripcion', 4, 1),
(1934, 58, 1, 1, 'Folio', 'Folio', 'Folio', 'SELECT id_barr_enc AS Folio FROM barr_doc_enc WHERE id_estatus = 1 ORDER BY id_barr_enc DESC', 1, 1),
(1935, 58, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT a.Sucursal FROM (\r\nSELECT \'TODAS\' AS Sucursal, 1 AS orden UNION all\r\nSELECT descripcion as Sucursal, 2 as orden FROM sucursales WHERE id_estatus = 1) AS a \r\nORDER BY a.orden, a.Sucursal', 2, 1),
(1936, 58, 1, 1, 'Formato', 'Formato', 'Formato', 'select \'RESUMEN\' as Formato union all\r\nselect \'DETALLE\' as Formato', 3, 1),
(1607, 59, 1, 1, 'Tipo de Formas', 'Formas', 'Formas', 'SELECT	f.Formas\r\nFROM		(\r\n			SELECT \'TODOS\' AS \'Formas\', 1 AS orden\r\n			UNION ALL \r\n			SELECT ucase(des) AS \'Formas\', 2 as orden FROM sis_tip WHERE id_tip_pad = 18 AND estatus = 1) AS f\r\nORDER BY	f.orden, f.Formas', 1, 1),
(1608, 59, 1, 1, 'Formato', 'Formato', 'Formato', 'SELECT \'FORMAS\' AS Formato UNION ALL \r\nSELECT \'NIVELES\' AS Formato UNION ALL \r\nSELECT \'DETALLE\' AS Formato', 2, 1),
(1842, 61, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT s.suc as Sucursal FROM (\r\nSELECT descripcion AS suc, \'B\' AS orden FROM sucursales WHERE id_estatus = 1) AS s ORDER BY s.orden, s.suc', 2, 1),
(1827, 18, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT Sucursal FROM (\r\nSELECT \'TODAS\' AS Sucursal, 1 AS orden UNION all\r\nSELECT descripcion as Sucursal, 2 as orden FROM sucursales WHERE id_estatus = 1) AS a\r\nORDER BY a.orden, a.Sucursal', 4, 1),
(1843, 61, 1, 1, 'Mostrar por Fecha de', 'Tipo', 'Tipo', 'Select \'RUTA\' as Tipo union all\r\nSelect \'PEDIDO\' as Tipo', 3, 1),
(1746, 62, 3, 1, 'Fecha Inicial', 'FecIni', '', '', 1, 1),
(1747, 62, 3, 1, 'Fecha Final', 'FecFin', '', '', 2, 1),
(1748, 62, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT Sucursal FROM (\r\nSELECT \'TODAS\' AS Sucursal, 1 AS orden UNION all\r\nSELECT descripcion as Sucursal, 2 as orden FROM sucursales WHERE id_estatus = 1) AS a\r\nORDER BY a.orden, a.Sucursal', 3, 1),
(1749, 62, 1, 1, 'Estado del Pedido', 'Estatus', 'Estatus', 'SELECT a.Estatus\r\nFROM (\r\n	SELECT \'TODOS\' AS \'Estatus\', 1 AS orden UNION \r\n	SELECT \'COTIZACIÓN\' AS \'Estatus\', 2 AS orden UNION \r\n	SELECT \'EN RUTA\' AS \'Estatus\', 2 AS orden UNION \r\n	SELECT \'LIBERADO\' AS \'Estatus\', 2 AS orden UNION \r\n	SELECT \'SIN PROGRAMAR\' AS \'Estatus\', 2 AS orden UNION \r\n	SELECT \'PROGRAMADO\' AS \'Estatus\', 2 AS orden UNION \r\n	SELECT \'ENTREGADO\' AS \'Estatus\', 2 AS orden UNION \r\n	SELECT \'CANCELADO\' AS \'Estatus\', 2 AS orden) AS a\r\nORDER BY a.orden, a.Estatus', 4, 1),
(1766, 60, 1, 1, 'Agrupar por Pan', 'Pan', 'Pan', 'SELECT		g.Pan as Pan\r\nFROM			(\r\n				SELECT \'SI\' AS Pan, 1 as orden UNION ALL \r\n				SELECT \'NO\' AS Pan, 2 as orden)\r\nAS 			g\r\nORDER BY 	g.orden, g.Pan', 4, 1),
(1763, 60, 3, 1, 'Fecha Inicial', 'FecIni', '', '', 1, 1),
(1764, 60, 3, 1, 'Fecha Final', 'FecFin', '', '', 2, 1),
(1765, 60, 1, 1, 'Grupo', 'Grupo', 'Grupo', 'SELECT		g.Grupo AS Grupo\r\nFROM			(\r\n				SELECT \'TODOS\' AS Grupo, 1 as orden UNION ALL \r\n				SELECT \'BATIDO\' AS Grupo, 2 as orden UNION ALL \r\n				SELECT \'CHOCOLATERIA\' AS Grupo, 2 as orden UNION ALL \r\n				SELECT \'ESPECIALES\' AS Grupo, 2 as orden UNION ALL \r\n				SELECT \'GALLETAS Y GELATINAS\' AS Grupo, 2 as orden UNION ALL \r\n				SELECT \'LINEA\' AS Grupo, 2 as orden UNION ALL \r\n				SELECT \'TIA MAY\' AS Grupo, 2 as orden)\r\nAS 			g\r\nORDER BY 	g.orden, g.Grupo', 3, 1),
(1841, 61, 3, 1, 'Fecha', 'Fecha', '', '', 1, 1),
(1844, 61, 1, 1, 'Mostrar Pedidos Recepcionados', 'Surtido', 'Surtido', 'Select \'NO\' as Surtido union all\r\nSelect \'SI\' as Surtido', 4, 1),
(1855, 17, 3, 1, 'Fecha', 'Fecha', '', '', 1, 1),
(1804, 63, 1, 1, 'Almacén', 'Almacen', 'Almacen', 'SELECT descripcion as Almacen FROM almacenes WHERE id_estatus = 1 ORDER BY descripcion', 1, 1),
(1805, 63, 3, 1, 'Fecha de Corte', 'Fecha', '', '', 2, 1),
(1853, 64, 1, 1, 'Autorizado Por', 'Rol', 'Rol', 'SELECT v.Rol FROM (\r\nSELECT \'DIRECCION\' AS Rol, 1 AS orden UNION ALL\r\nSELECT \'PRODUCCION\' AS Rol, 2 as orden) AS v\r\nORDER BY v.orden', 4, 1),
(1854, 64, 1, 1, 'Sucursales en Cero', 'Cero', 'Cero', 'SELECT v.Cero FROM (\r\nSELECT \'NO\' AS Cero, 1 AS orden UNION ALL\r\nSELECT \'Si\' AS Cero, 2 as orden) AS v\r\nORDER BY v.orden', 5, 1),
(1852, 64, 1, 1, 'Formato', 'Formato', 'Formato', 'SELECT v.Formato FROM (\r\nSELECT \'RESUMEN\' AS Formato, 1 AS orden UNION ALL\r\nSELECT \'DETALLE\' AS Formato, 2 as orden) AS v\r\nORDER BY v.orden', 3, 1),
(1850, 64, 3, 1, 'Fecha', 'Fecha', '', '', 0, 1),
(1851, 64, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT a.Sucursal FROM (\r\n	SELECT \'TODAS\' AS Sucursal, 1 AS orden UNION ALL \r\n	SELECT ucase(descripcion) AS Sucursal, 2 AS orden FROM sucursales WHERE id_estatus = 1) AS a\r\nORDER BY \r\n	a.orden, a.sucursal', 2, 1),
(1870, 65, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT descripcion AS Sucursal FROM sucursales WHERE id_estatus = 1 ORDER BY descripcion', 1, 1),
(1871, 65, 3, 1, 'Fecha Inicial', 'FecIni', '', '', 2, 1),
(1872, 65, 3, 1, 'FechaFinal', 'FecFin', '', '', 3, 1),
(1873, 65, 1, 1, 'Mostrar Productos sin Ventas', 'Cero', 'Cero', 'select \'NO\' as Cero union all\r\nselect \'SI\' as Cero', 4, 1),
(1930, 66, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT descripcion AS Sucursal FROM sucursales WHERE id_estatus = 1 ORDER BY descripcion', 2, 1),
(1929, 66, 1, 1, 'Folio', 'Folio', 'Folio', 'SELECT id_barr_enc AS Folio FROM barr_doc_enc WHERE id_estatus = 1 ORDER BY id_barr_enc DESC', 1, 1),
(1896, 8, 1, 1, 'Mostrar Pedidos Recepcionados', 'Rcp', 'Rcp', 'SELECT \'NO\' AS Rcp UNION ALL\r\nSELECT \'SI\' AS Rcp', 5, 1),
(1921, 41, 1, 1, 'Folio', 'Folio', 'Folio', 'SELECT id_barr_enc AS Folio FROM barr_doc_enc WHERE id_estatus = 1 order by id_barr_enc desc', 1, 1),
(1902, 67, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT descripcion AS Sucursal FROM sucursales WHERE id_estatus = 1 ORDER BY descripcion', 2, 1),
(1901, 67, 1, 1, 'Folio', 'Folio', 'Folio', 'SELECT id_barr_enc AS Folio FROM barr_doc_enc WHERE id_estatus = 1 ORDER BY id_barr_enc desc', 1, 1),
(1928, 68, 1, 1, 'Sucursal', 'Sucursal', 'Sucursal', 'SELECT descripcion AS Sucursal FROM sucursales WHERE id_estatus = 1 ORDER BY descripcion', 2, 1),
(1927, 68, 1, 1, 'Folio', 'Folio', 'Folio', 'SELECT id_barr_enc AS Folio FROM barr_doc_enc WHERE id_estatus = 1 order by id_barr_enc desc', 1, 1),
(1937, 69, 3, 1, 'Fecha', 'Fecha', '', '', 1, 1),
(1938, 69, 1, 1, 'Agrupar por Categoría', 'Grupo', 'Grupo', 'select \'NO\' as Grupo union all\r\nselect \'SI\' as Grupo', 2, 1),
(1939, 69, 1, 1, 'Formato', 'Formato', 'Formato', 'select \'RESUMEN\' as Formato union all\r\nselect \'DETALLE\' as Formato', 3, 1),
(1940, 70, 3, 1, 'Fecha', 'Fecha', '', '', 1, 1),
(1941, 70, 1, 1, 'Agrupar por Categoría', 'Grupo', 'Grupo', 'select \'NO\' as Grupo union all\r\nselect \'SI\' as Grupo', 2, 1),
(1942, 70, 1, 1, 'Formato', 'Formato', 'Formato', 'select \'RESUMEN\' as Formato union all\r\nselect \'DETALLE\' as Formato', 3, 1),
(1943, 71, 3, 1, 'Fecha', 'Fecha', '', '', 1, 1),
(1944, 71, 1, 1, 'Agrupar por Categoría', 'Grupo', 'Grupo', 'select \'NO\' as Grupo union all\r\nselect \'SI\' as Grupo', 2, 1),
(1945, 71, 1, 1, 'Formato', 'Formato', 'Formato', 'select \'RESUMEN\' as Formato union all\r\nselect \'DETALLE\' as Formato', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rpt_subreportes`
--

DROP TABLE IF EXISTS `rpt_subreportes`;
CREATE TABLE `rpt_subreportes` (
  `id_sub_rpt` int(10) UNSIGNED NOT NULL,
  `id_rpt` int(10) UNSIGNED NOT NULL,
  `archivo` varchar(255) NOT NULL,
  `hace_consulta` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `rpt_subreportes`
--

INSERT INTO `rpt_subreportes` (`id_sub_rpt`, `id_rpt`, `archivo`, `hace_consulta`) VALUES
(21, 12, 'diferencia_inventario_inicial', 1),
(4, 16, 'operaciones_caja', 1),
(5, 16, 'cierre_caja', 1),
(6, 16, 'diferencia_inventario_inicial', 1),
(7, 16, 'diferencia_inventario_final', 1),
(8, 30, 'forma_det', 1),
(9, 30, 'forma_det.jasper', 1),
(20, 12, 'diferencia_inventario_inicial.jasper', 1),
(11, 16, 'diferencia_inventario_final.jasper', 1),
(12, 16, 'cierre_caja.jasper', 1),
(13, 16, 'operaciones_sucursal', 1),
(14, 16, 'operaciones_sucursal.jasper', 1),
(15, 57, 'pagos', 1),
(19, 12, 'bases_pendientes', 1),
(18, 12, 'apertura_caja', 1),
(22, 41, 'folio_ini.jasper', 1),
(23, 41, 'folio_fin.jasper', 1),
(24, 41, 'folio_ini', 1),
(25, 41, 'folio_fin', 1),
(26, 6, 'apertura_caja', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rpt_tip_filtros`
--

DROP TABLE IF EXISTS `rpt_tip_filtros`;
CREATE TABLE `rpt_tip_filtros` (
  `id_tip_filt` int(11) NOT NULL,
  `control` varchar(21735) NOT NULL DEFAULT '',
  `tipo` varchar(50) NOT NULL DEFAULT '',
  `comentario` varchar(21735) NOT NULL DEFAULT '',
  `estatus` tinyint(1) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `rpt_tip_filtros`
--

INSERT INTO `rpt_tip_filtros` (`id_tip_filt`, `control`, `tipo`, `comentario`, `estatus`) VALUES
(1, '<select id=\"@valor\" name=\"@valor\" class=\"form-control select2\" style=\"width: 100%;\">@valores</select>', 'SELECT', 'SELECT2\r\n\r\nhttps://select2.org/\r\n\r\n<link href=\"https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/css/select2.min.css\" rel=\"stylesheet\" />\r\n\r\n<script src=\"https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js\"></script>\r\n\r\n<script>\r\n	$(function () {\r\n		//Initialize Select2 Elements\r\n		$(\'.select2\').select2();		\r\n	  });\r\n</script>\r\n\r\nEjemplo:\r\n\r\n<select class=\"form-control select2\" style=\"width: 100%;\">\r\n                  <option selected=\"selected\">Alabama</option>\r\n                  <option>Alaska</option>\r\n                  <option>California</option>\r\n                  <option>Delaware</option>\r\n                  <option>Tennessee</option>\r\n                  <option>Texas</option>\r\n                  <option>Washington</option>\r\n </select>\r\n\r\n', 1),
(2, '<select id=\"@valor\" name=\"@valor[]\" class=\"form-control select2\" style=\"width: 100%;\" multiple>@valores</select>', 'SELECT_MULTIPLE', 'SELECT2\r\n\r\nhttps://select2.org/\r\n\r\n<link href=\"https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/css/select2.min.css\" rel=\"stylesheet\" />\r\n\r\n<script src=\"https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js\"></script>\r\n\r\n<script>\r\n	$(function () {\r\n		//Initialize Select2 Elements\r\n		$(\'.select2\').select2();		\r\n	  });\r\n</script>\r\n\r\nEjemplo:\r\n\r\n<select class=\"form-control select2\" multiple=\"multiple\" data-placeholder=\"Select a State\" style=\"width: 100%;\">\r\n                  <option>Alabama</option>\r\n                  <option>Alaska</option>\r\n                  <option>California</option>\r\n                  <option>Delaware</option>\r\n                  <option>Tennessee</option>\r\n                  <option>Texas</option>\r\n                  <option>Washington</option>\r\n</select>\r\n\r\n', 1),
(3, '<input id=\"@valor\" name=\"@valor\" type=\"date\" class=\"form-control\" @value>', 'DATE', 'Date Range Picker\r\n\r\nhttp://www.daterangepicker.com/\r\n\r\n<script type=\"text/javascript\" src=\"https://cdn.jsdelivr.net/momentjs/latest/moment.min.js\"></script>\r\n\r\n<script type=\"text/javascript\" src=\"https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js\"></script>\r\n\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css\" />\r\n\r\n<script>\r\n	$(function () {\r\n		//Date range picker\r\n		$(\'input[name=\"dates\"]\').daterangepicker({\r\n    \"locale\": {\r\n        \"format\": \"MM/DD/YYYY\",\r\n        \"separator\": \" - \",\r\n        \"applyLabel\": \"Ok\",\r\n        \"cancelLabel\": \"Cancelar\",\r\n        \"fromLabel\": \"From\",\r\n        \"toLabel\": \"To\",\r\n        \"customRangeLabel\": \"Custom\",\r\n        \"weekLabel\": \"W\",\r\n        \"daysOfWeek\": [\r\n            \"Do\",\r\n            \"Lu\",\r\n            \"Ma\",\r\n            \"Mi\",\r\n            \"Ju\",\r\n            \"Vi\",\r\n            \"Sa\"\r\n        ],\r\n        \"monthNames\": [\r\n            \"Enero\",\r\n            \"Febrero\",\r\n            \"Marzo\",\r\n            \"Abril\",\r\n            \"Mayo\",\r\n            \"Junio\",\r\n            \"Julio\",\r\n            \"Agosto\",\r\n            \"Septiembre\",\r\n            \"Octubre\",\r\n            \"Noviembre\",\r\n            \"Diciembre\"\r\n        ],\r\n        \"firstDay\": 1\r\n    }\r\n}, function(start, end, label) {\r\n  console.log(\'New date range selected: \' + start.format(\'YYYY-MM-DD\') + \' to \' + end.format(\'YYYY-MM-DD\') + \' (predefined range: \' + label + \')\');\r\n});		\r\n	  });\r\n</script>\r\n\r\n', 1),
(4, '<input id=\"@valor\" name=\"@valor\" type=\"text\" class=\"form-control datepicker\" @value>', 'DATE_RANGE', 'Date Range Picker\r\n\r\nhttp://www.daterangepicker.com/\r\n\r\n<script type=\"text/javascript\" src=\"https://cdn.jsdelivr.net/momentjs/latest/moment.min.js\"></script>\r\n\r\n<script type=\"text/javascript\" src=\"https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js\"></script>\r\n\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css\" />\r\n\r\n<script>\r\n	$(function () {\r\n		//Date range picker\r\n		$(\'input[name=\"dates\"]\').daterangepicker({\r\n    \"locale\": {\r\n        \"format\": \"MM/DD/YYYY\",\r\n        \"separator\": \" - \",\r\n        \"applyLabel\": \"Ok\",\r\n        \"cancelLabel\": \"Cancelar\",\r\n        \"fromLabel\": \"From\",\r\n        \"toLabel\": \"To\",\r\n        \"customRangeLabel\": \"Custom\",\r\n        \"weekLabel\": \"W\",\r\n        \"daysOfWeek\": [\r\n            \"Do\",\r\n            \"Lu\",\r\n            \"Ma\",\r\n            \"Mi\",\r\n            \"Ju\",\r\n            \"Vi\",\r\n            \"Sa\"\r\n        ],\r\n        \"monthNames\": [\r\n            \"Enero\",\r\n            \"Febrero\",\r\n            \"Marzo\",\r\n            \"Abril\",\r\n            \"Mayo\",\r\n            \"Junio\",\r\n            \"Julio\",\r\n            \"Agosto\",\r\n            \"Septiembre\",\r\n            \"Octubre\",\r\n            \"Noviembre\",\r\n            \"Diciembre\"\r\n        ],\r\n        \"firstDay\": 1\r\n    }\r\n}, function(start, end, label) {\r\n  console.log(\'New date range selected: \' + start.format(\'YYYY-MM-DD\') + \' to \' + end.format(\'YYYY-MM-DD\') + \' (predefined range: \' + label + \')\');\r\n});		\r\n	  });\r\n</script>\r\n\r\n', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sizes`
--

DROP TABLE IF EXISTS `sizes`;
CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nombreCorto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sizes`
--

INSERT INTO `sizes` (`id`, `descripcion`, `created_at`, `updated_at`, `deleted_at`, `nombreCorto`) VALUES
(1, 'Chico', '2022-06-18 10:06:33', '2022-06-18 10:12:28', NULL, 'CH'),
(2, 'Mediano', '2022-06-18 10:06:41', '2022-06-18 10:12:23', NULL, 'MED'),
(3, 'Grande', '2022-06-18 10:06:53', '2022-06-18 10:12:09', NULL, 'GD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `puede_crear_rpt` int(11) DEFAULT NULL,
  `puede_editar_rpt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`, `puede_crear_rpt`, `puede_editar_rpt`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$q0ioJoT59EfjHSWtJVMfSe8TTyguDuvTmZ7ODf5d61T8pf6joo8om', 1, NULL, '2022-06-16 03:02:08', '2022-06-16 03:02:08', 1, 1),
(2, 'User', 'user@user.com', NULL, '$2y$10$IvMcEb.FvzjpdF0RbbMaTONZ1YaHvSEQFNz3HQGo34CDhuQy0AHXG', 2, NULL, '2022-06-16 03:02:08', '2022-06-16 03:02:08', 1, 1),
(5, 'Osmar', 'osmar@osmar.com', NULL, '$2y$10$Amxazopb/uX.TFHBOLSLzuLhpYCaLadlc/etxdT6UJ9WSumAqrhuu', 1, NULL, '2022-06-23 23:45:50', '2022-06-24 03:31:33', 1, 1),
(6, 'Daniel', 'daniel@daniel.com', NULL, '$2y$10$9X7b1O/X0sethghhpoXOfOrpJXLLTkddjvdRTfgUCg.b5LdRypDg2', 3, NULL, '2022-06-24 03:35:17', '2022-06-24 03:35:17', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `conekta`
--
ALTER TABLE `conekta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `entidad`
--
ALTER TABLE `entidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entidad_modulo_id_foreign` (`modulo_id`);

--
-- Indices de la tabla `firstlogin`
--
ALTER TABLE `firstlogin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id_rpt`) USING BTREE,
  ADD UNIQUE KEY `id_rpt` (`id_rpt`) USING BTREE;

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD KEY `role_permissions_role_id_foreign` (`role_id`),
  ADD KEY `role_permissions_permission_id_foreign` (`permission_id`);

--
-- Indices de la tabla `rptemail`
--
ALTER TABLE `rptemail`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rpt_filtros`
--
ALTER TABLE `rpt_filtros`
  ADD PRIMARY KEY (`id_filtro`) USING BTREE,
  ADD UNIQUE KEY `id_rpt_valor` (`id_rpt`,`valor`) USING BTREE,
  ADD UNIQUE KEY `orden` (`id_rpt`,`orden`) USING BTREE,
  ADD KEY `id_rpt` (`id_rpt`) USING BTREE,
  ADD KEY `id_oper` (`id_oper`) USING BTREE,
  ADD KEY `id_tip_filt` (`id_tip_filt`) USING BTREE;

--
-- Indices de la tabla `rpt_subreportes`
--
ALTER TABLE `rpt_subreportes`
  ADD PRIMARY KEY (`id_sub_rpt`) USING BTREE;

--
-- Indices de la tabla `rpt_tip_filtros`
--
ALTER TABLE `rpt_tip_filtros`
  ADD PRIMARY KEY (`id_tip_filt`) USING BTREE;

--
-- Indices de la tabla `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `conekta`
--
ALTER TABLE `conekta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `entidad`
--
ALTER TABLE `entidad`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `firstlogin`
--
ALTER TABLE `firstlogin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de la tabla `post`
--
ALTER TABLE `post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `id_rpt` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rptemail`
--
ALTER TABLE `rptemail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1049;

--
-- AUTO_INCREMENT de la tabla `rpt_filtros`
--
ALTER TABLE `rpt_filtros`
  MODIFY `id_filtro` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1946;

--
-- AUTO_INCREMENT de la tabla `rpt_subreportes`
--
ALTER TABLE `rpt_subreportes`
  MODIFY `id_sub_rpt` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entidad`
--
ALTER TABLE `entidad`
  ADD CONSTRAINT `entidad_modulo_id_foreign` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
