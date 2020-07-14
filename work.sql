-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 14 2020 г., 10:51
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
(1, 1, 1000, '2020-07-13 17:24:35', NULL, NULL),
(2, 3, 1000, '2020-07-13 17:24:35', NULL, NULL),
(3, 3, 1000, '2020-07-13 17:24:35', NULL, NULL),
(4, 4, 1000, '2020-07-13 17:24:35', NULL, NULL),
(5, 1, 1000, '2020-07-13 17:24:35', NULL, NULL),
(6, 5, 1000, '2020-07-13 17:24:35', NULL, NULL),
(7, 1, 1000, '2020-07-13 17:26:08', NULL, NULL),
(8, 3, 1000, '2020-07-13 17:26:08', NULL, NULL),
(9, 3, 1000, '2020-07-13 17:26:08', NULL, NULL),
(10, 4, 1000, '2020-07-13 17:26:08', NULL, NULL),
(11, 1, 1000, '2020-07-13 17:26:08', NULL, NULL),
(12, 5, 1000, '2020-07-13 17:26:08', NULL, NULL);

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
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `email`, `login`, `password`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Тест', 'Тест', 'Тест', 'test@gmail.com', 'test', '$2y$10$Vq43.tylsIdk1alaglHSMO5kZUbrU9zMUJAruy8.HHQXkLn9lAX1m', '0000-00-00 00:00:00', NULL, NULL),
(2, 'Test', 'Test', 'Test', 'test@gmail.com', 'test2', '$2y$10$Vq43.tylsIdk1alaglHSMO5kZUbrU9zMUJAruy8.HHQXkLn9lAX1m', '2020-07-13 17:23:11', NULL, NULL),
(3, 'Test', 'Test', 'Test', 'test3@gmail.com', 'test3', '$2y$10$Vq43.tylsIdk1alaglHSMO5kZUbrU9zMUJAruy8.HHQXkLn9lAX1m', '2020-07-13 17:23:11', NULL, NULL),
(4, 'Test', 'Test', 'Test', 'test3@gmail.com', 'test4', '$2y$10$Vq43.tylsIdk1alaglHSMO5kZUbrU9zMUJAruy8.HHQXkLn9lAX1m', '2020-07-13 17:23:11', NULL, NULL),
(5, 'Test', 'Test', 'Test', 'test@gmail.com', 'test5', '$2y$10$Vq43.tylsIdk1alaglHSMO5kZUbrU9zMUJAruy8.HHQXkLn9lAX1m', '2020-07-13 17:23:12', NULL, NULL),
(6, 'Test', 'Test', 'Test', 'test4@gmail.com', 'test6', '$2y$10$Vq43.tylsIdk1alaglHSMO5kZUbrU9zMUJAruy8.HHQXkLn9lAX1m', '2020-07-13 17:23:12', NULL, NULL),
(7, 'Test', 'Test', 'Test', 'test1@gmail.com', 'test7', '$2y$10$Vq43.tylsIdk1alaglHSMO5kZUbrU9zMUJAruy8.HHQXkLn9lAX1m', '2020-07-13 17:23:12', NULL, NULL),
(8, 'Test', 'Test', 'Test', 'test@gmail.com', 'test8', '$2y$10$Vq43.tylsIdk1alaglHSMO5kZUbrU9zMUJAruy8.HHQXkLn9lAX1m', '2020-07-13 17:23:12', NULL, NULL),
(9, 'Test', 'Test', 'Test', 'test1@gmail.com', 'test9', '$2y$10$Vq43.tylsIdk1alaglHSMO5kZUbrU9zMUJAruy8.HHQXkLn9lAX1m', '2020-07-13 17:23:12', NULL, NULL),
(10, 'Test', 'Test', 'Test', 'test@gmail.com', 'test10', '$2y$10$Vq43.tylsIdk1alaglHSMO5kZUbrU9zMUJAruy8.HHQXkLn9lAX1m', '2020-07-13 17:23:12', NULL, NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
