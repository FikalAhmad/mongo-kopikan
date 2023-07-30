-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2023 at 06:25 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kopikan_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `image`, `title`, `price`, `desc`, `category`, `createdAt`, `updatedAt`) VALUES
(1, '/src/assets/product-images/ArenLatte.png', 'Aren Latte', 29000, 'Rasa alami gula aren berpadu sempurna dengan espresso premium', 'Signature', '2023-07-02 09:01:57', '2023-07-02 16:41:30'),
(2, '/src/assets/product-images/PandanLatte.png', 'Pandan Latte', 29000, 'Latte dengan rasa dan aroma unik dari ekstrak pandan alami', 'Signature', '2023-07-02 09:03:15', '2023-07-02 16:40:28'),
(3, '/src/assets/product-images/CaramelPralineMacchiato.png', 'Caramel Praline Macchiato', 33000, 'Latte dengan saus Praline dan karamel dengan rasa dan aroma manis.', 'Signature', '2023-07-02 16:47:04', '2023-07-02 16:47:04'),
(4, '/src/assets/product-images/ButterscotchSeaSaltLatte.png', 'Butterscotch Sea Salt Latte', 29000, 'Perpaduan butterscotch dan espresso house blend dengan topping cream sea salt yang lembut di atasnya.', 'Signature', '2023-07-02 16:48:58', '2023-07-02 16:48:58'),
(5, '/src/assets/product-images/NuttyOatLatte.png', 'Nutty Oat Latte', 39000, 'Latte dengan susu oat dan juga perpaduan hazelnut yang nikmat', 'Signature', '2023-07-02 16:49:57', '2023-07-02 17:03:09'),
(6, '/src/assets/product-images/ClassicLatte.png', 'Classic Latte', 24000, 'Perpaduan rasa espresso premium dengan saus krim spesial.', 'Coffee', '2023-07-02 16:52:04', '2023-07-02 16:52:04'),
(7, '/src/assets/product-images/Espresso.jpg', 'Espresso', 19000, 'Ekstrak biji kopi Arabika murni tanpa campuran.', 'Coffee', '2023-07-02 16:53:42', '2023-07-02 16:53:42'),
(8, '/src/assets/product-images/Cappuchino.png', 'Cafe Latte', 29000, 'Paduan espresso dengan susu sapi pilihan dan sedikit foam di atasnya.', 'Coffee', '2023-07-02 16:54:31', '2023-07-02 17:03:44'),
(9, '/src/assets/product-images/Americano.png', 'Americano', 21000, 'Espresso Shots dalam segelas air.', 'Coffee', '2023-07-02 16:55:05', '2023-07-02 16:55:05'),
(10, '/src/assets/product-images/Cappuchino.png', 'Cappucino', 29000, 'Espresso Shots dengan susu dan lapisan foam tebal di atasnya.', 'Coffee', '2023-07-02 16:55:58', '2023-07-02 16:55:58'),
(11, '/src/assets/product-images/SaltedCaramelMocha.png', 'Salted Caramel Mocha', 33000, 'Rasa bittersweet dari Latte dan saus dark chocolate spesial.', 'Coffee', '2023-07-02 16:57:10', '2023-07-02 16:57:10'),
(12, '/src/assets/product-images/DoubleIcedShakenLatte.png', 'Double Iced Shaken Latte', 33000, 'Dua Shot espresso yang dikocok dengan susu dan whipped cream.', 'Coffee', '2023-07-02 16:57:54', '2023-07-02 16:57:54'),
(13, '/src/assets/product-images/Matcha.png', 'Matcha Green Tea', 33000, 'Teh hijau bermutu tinggi yang dibubuhi susu kental ditambahkan dengan es.', 'Non-Coffee', '2023-07-02 16:58:48', '2023-07-02 16:58:48'),
(14, '/src/assets/product-images/DarkChocolate.png', 'Dark Chocolate', 33000, 'Dibuat dari 100% dark chocolate dan paduan susu yang nikmat.', 'Non-Coffee', '2023-07-02 16:59:06', '2023-07-02 16:59:06'),
(15, '/src/assets/product-images/AlmondChoco.png', 'Almond Choco', 39000, 'Cokelat klasik dari Fore Coffee yang dipadu dengan susu almond. Sebuah definisi comfort drink yang sesungguhnya.', 'Non-Coffee', '2023-07-02 16:59:47', '2023-07-02 16:59:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `refresh_token` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `refresh_token`, `createdAt`, `updatedAt`) VALUES
(1, 'Ahmad Fikri Haikal', 'haikal@gmail.com', '$2b$10$bR7gfYEkdbRuiQRZ0rYiy.z1DTxJC6B5lmPY8tFSt0P3VE8k72lXu', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsIm5hbWUiOiJBaG1hZCBGaWtyaSBIYWlrYWwiLCJlbWFpbCI6ImhhaWthbEBnbWFpbC5jb20iLCJpYXQiOjE2OTA2NDI0ODMsImV4cCI6MTY5MDcyODg4M30._J3qw-KNfQYXve2fsHaL2xoeMjkUsl0H41M8JfYp1D0', '2023-07-10 15:44:45', '2023-07-29 14:54:43'),
(2, 'Ahmad Fikri Haikal', 'haikal2@gmail.com', '$2b$10$b0FKXEo9mW0hX.jSgUkOA.FY3EGInPpU7YYmNdg8zOalKdEAMJkJ.', NULL, '2023-07-10 15:50:03', '2023-07-10 15:50:03'),
(3, 'Reydut', 'reydut@gmail.com', '$2b$10$I4iCVHJygkD9shAx6MFf0.Vez0x2m/fOJBD.4H7324tyiKrWTljDW', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMsIm5hbWUiOiJSZXlkdXQiLCJlbWFpbCI6InJleWR1dEBnbWFpbC5jb20iLCJpYXQiOjE2OTA2MTU3MDMsImV4cCI6MTY5MDcwMjEwM30.AJMgTrIMi6NzXF4CQAWVFjC2vdmPutrUP7vf-2Oy7Ko', '2023-07-10 16:06:54', '2023-07-29 07:28:23'),
(4, 'test', 'test@gmail.com', '$2b$10$civjb5pBRHxaLdqa9vPAOu/35m4F1WyC66PePsAa/f4j8C8U8hshK', NULL, '2023-07-10 16:10:51', '2023-07-10 16:10:51'),
(5, 'Ahmad Fikri Haikal', 'haikal2@gmail.com', '$2b$10$0SG1n1ujkezjXOdqFFR5n.EJkZg3R/Ua5WyXitJHUZ5Mt6YpK1kOy', NULL, '2023-07-17 18:51:14', '2023-07-17 18:51:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
