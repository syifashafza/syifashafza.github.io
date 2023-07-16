-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jul 2023 pada 14.12
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `name`, `price`, `quantity`, `image`) VALUES
(78, 5, 'Yuni', 60000, 4, 'Poster_film_Yuni_2021.jpeg'),
(79, 5, 'Tangled', 35000, 1, 'tangled-2010dok-disney.jpeg'),
(80, 5, 'Brave', 45000, 1, 'images.jpeg'),
(81, 5, 'Sri Asih', 45000, 1, 'images (1).jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `message`
--

CREATE TABLE `message` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `member` varchar(30) NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `member`, `placed_on`, `payment_status`) VALUES
(23, 5, 'sifa', '1111', 'syifashafza@gmail.com', 'cash on delivery', 'wewer', ', Yuni (1) ', 42000, 'diskon 30%', '16-Jul-2023', 'pending'),
(24, 5, 'a', '11', 'sa@gmail.com', 'cash on delivery', 'wewer', ', Tangled (1) ', 35000, 'tanpa diskon', '16-Jul-2023', 'pending'),
(25, 5, 'q', '1', 'sa@gmail.com', 'cash on delivery', 'q', ', Tangled (1) ', 24500, 'diskon 30%', '16-Jul-2023', 'pending');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`) VALUES
(1, 'Tangled', 35000, 'tangled-2010dok-disney.jpeg'),
(2, 'Yuni', 60000, 'Poster_film_Yuni_2021.jpeg'),
(3, 'Brave', 45000, 'images.jpeg'),
(4, 'Buya Hamka', 50000, 'IMG-20230320-WA0050.jpg'),
(5, 'Cek Toko Sebelah', 55000, 'index6.jpg'),
(6, 'Sri Asih', 45000, 'images (1).jpeg'),
(7, 'Epik', 40000, 'epik.jpeg'),
(8, 'Harry Potter', 75000, 'harry-potter-and-the-.png'),
(9, 'Cinderella', 55000, 'cinder.jpeg'),
(10, 'Mario Bross', 60000, 'mario.jpeg'),
(11, 'Encanto', 45000, 'encanto.jpeg'),
(12, 'Dora', 60000, 'dora.jpeg'),
(13, 'Lambs', 65000, 'lambs.jpeg'),
(14, 'Orphan', 70000, 'orphan_ver2_xlg.jpg'),
(15, 'Moana', 55000, 'moans.jpeg'),
(16, 'Atlantis', 75000, 'atlantiss.jpeg'),
(17, 'Frozen', 50000, 'froz.jpeg'),
(18, 'Mermaid', 45000, 'maids.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`) VALUES
(1, 'a', 'a@gmail.com', '0cc175b9c0f1b6a831c399e269772661', 'admin'),
(2, 'b', 'b@gmail.com', '92eb5ffee6ae2fec3ad71c777531578f', 'user'),
(3, 'a', 'sa@gmail.com', '0cc175b9c0f1b6a831c399e269772661', 'user'),
(4, 'Yuni', 'a@gmail.com', '03c7c0ace395d80182db07ae2c30f034', 'admin'),
(5, 'q', '2200018064@webmail.uad.ac.id', '7694f4a66316e53c8cdd9d9954bd611d', 'user'),
(6, 'Yuni', 'syifashafza@gmail.com', '8fa14cdd754f91cc6554c9e71929cce7', 'admin'),
(7, 'sifa', 'syifashafza@gmail.com', '0cc175b9c0f1b6a831c399e269772661', 'user');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT untuk tabel `message`
--
ALTER TABLE `message`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
