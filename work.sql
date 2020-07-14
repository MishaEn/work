-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 14 2020 г., 13:17
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `work`
--

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(14, 20, 1000, '2020-07-14 14:04:21', NULL, NULL),
(15, 20, 1000, '2020-07-14 14:04:21', NULL, NULL),
(16, 20, 1000, '2020-07-14 14:04:21', NULL, NULL),
(17, 21, 1000, '2020-07-14 14:04:21', NULL, NULL),
(18, 21, 1000, '2020-07-14 14:04:21', NULL, NULL),
(19, 21, 1000, '2020-07-14 14:04:21', NULL, NULL),
(20, 23, 1000, '2020-07-14 14:04:21', NULL, NULL),
(21, 23, 1000, '2020-07-14 14:04:22', NULL, NULL),
(22, 23, 1000, '2020-07-14 14:04:22', NULL, NULL),
(23, 24, 1000, '2020-07-14 14:04:22', NULL, NULL),
(24, 24, 1000, '2020-07-14 14:04:22', NULL, NULL),
(25, 25, 1000, '2020-07-14 14:04:22', NULL, NULL),
(26, 25, 1000, '2020-07-14 14:04:22', NULL, NULL),
(27, 26, 1000, '2020-07-14 14:04:22', NULL, NULL),
(28, 27, 1000, '2020-07-14 14:04:22', NULL, NULL),
(29, 28, 1000, '2020-07-14 14:04:22', NULL, NULL),
(30, 20, 1000, '2020-07-14 14:04:22', NULL, NULL),
(31, 20, 1000, '2020-07-14 14:04:22', NULL, NULL),
(32, 20, 1000, '2020-07-14 14:04:22', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `email`, `login`, `password`, `created_at`, `updated_at`, `deleted_at`) VALUES
(20, 'Тестер', 'Тесторович', '3123', 'test@gmail.com', 'test', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 13:36:14', '2020-07-14 12:36:47', NULL),
(21, 'test', 'test', 'test', 'test@gmail.com', 'test1', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:13', NULL, NULL),
(22, 'test', 'test', 'test', 'test1@gmail.com', 'test2', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:13', NULL, NULL),
(23, 'test', 'test', 'test', 'test1@gmail.com', 'test3', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:13', NULL, NULL),
(24, 'test', 'test', 'test', 'test2@gmail.com', 'test4', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:13', NULL, NULL),
(25, 'test', 'test', 'test', 'test2@gmail.com', 'test5', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:13', NULL, NULL),
(26, 'test', 'test', 'test', 'test3@gmail.com', 'test6', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:14', NULL, NULL),
(27, 'test', 'test', 'test', 'test3@gmail.com', 'test7', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:14', NULL, NULL),
(28, 'test', 'test', 'test', 'test4@gmail.com', 'test8', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:14', NULL, NULL),
(29, 'test', 'test', 'test', 'test@gmail.com', 'test9', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:14', NULL, NULL),
(30, 'test', 'test', 'test', 'test@gmail.com', 'test10', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:14', NULL, NULL),
(31, 'test', 'test', 'test', 'test@gmail.com', 'test11', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:14', NULL, NULL),
(32, 'test', 'test', 'test', 'test@gmail.com', 'test12', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:14', NULL, NULL),
(33, 'test', 'test', 'test', 'test@gmail.com', 'test13', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:14', NULL, NULL),
(34, 'test', 'test', 'test', 'test@gmail.com', 'test14', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:14', NULL, NULL),
(35, 'test', 'test', 'test', 'test@gmail.com', 'test15', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:14', NULL, NULL),
(36, 'test', 'test', 'test', 'test@gmail.com', 'test16', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:14', NULL, NULL),
(37, 'test', 'test', 'test', 'test@gmail.com', 'test17', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:14', NULL, NULL),
(38, 'test', 'test', 'test', 'test@gmail.com', 'test18', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:14', NULL, NULL),
(39, 'test', 'test', 'test', 'test@gmail.com', 'test19', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:14', NULL, NULL),
(40, 'test', 'test', 'test', 'test@gmail.com', 'test20', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:14', NULL, NULL),
(41, 'test', 'test', 'test', 'test@gmail.com', 'test21', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:14', NULL, NULL),
(42, 'test', 'test', 'test', 'test@gmail.com', 'test22', '$argon2id$v=19$m=65536,t=4,p=1$VTlOMmh3LnRuRW5pNjNCeA$HUAJAu6zHDlP7mmCKUp6DshofEwFoXR5kL48Ns2o/mI', '2020-07-14 14:01:14', NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
