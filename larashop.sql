-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Okt 2019 pada 12.23
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `larashop`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('PUBLISH','DRAFT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `books`
--

INSERT INTO `books` (`id`, `title`, `slug`, `description`, `author`, `publisher`, `cover`, `price`, `views`, `stock`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, '1231232131', '1231232131', 'awdawdawd', 'awdawd', '21312', 'book-covers/jYiv45rQJr7kqHiY827rGPmxSJnZLu8bfrwZ4azz.jpeg', 20000.00, 0, 1, 'PUBLISH', 1, NULL, NULL, '2019-09-23 05:42:02', '2019-10-11 03:01:37', NULL),
(4, 'Ayam Bakar', 'ayam-bakar', 'awdawda', 'awdawdaw', 'awdawdaw', 'book-covers/l9htMBcrOzd5KxwfQaqu9f1yCARoYfJnhoyZgOvF.png', 20000.00, 0, 2, 'DRAFT', 1, 1, NULL, '2019-09-23 06:48:40', '2019-09-23 06:49:50', NULL),
(5, 'awdawdaw', 'awdawdaw', 'awdawd', 'awdaw', 'adwawd', 'book-covers/VihwPRb2PgrstQcAM13S3AyzxcFf9B9gSGNa503G.jpeg', 213123.00, 0, 2, 'PUBLISH', 1, NULL, NULL, '2019-10-11 03:00:19', '2019-10-11 03:00:19', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `book_category`
--

CREATE TABLE `book_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `book_category`
--

INSERT INTO `book_category` (`id`, `book_id`, `category_id`, `created_at`, `updated_at`) VALUES
(2, 3, 2, NULL, NULL),
(3, 4, 3, NULL, NULL),
(4, 4, 4, NULL, NULL),
(5, 4, 2, NULL, NULL),
(7, 5, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `book_order`
--

CREATE TABLE `book_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'berisi nama file image saja tanpa path',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'adwadawdawd', 'adwadawdawd', 'category_images/aZYn5DnFbxQ02av4F8pUDeirXeGonHuAdHgdc4tT.jpeg', 1, NULL, NULL, NULL, '2019-09-19 20:02:45', '2019-09-23 06:13:35'),
(3, 'buku masak', 'buku-masak', 'category_images/Zw1AqlPn9HLBLaonbA81n0RlOSjFuF7TEVakSMZC.jpeg', 1, NULL, NULL, NULL, '2019-09-23 06:47:43', '2019-09-23 06:47:43'),
(4, 'buku belajar', 'buku-belajar', 'category_images/JDMA3B4u1tDxkeFZVlBB8NNCBN4aj7CirF7rHyMz.jpeg', 1, NULL, NULL, NULL, '2019-09-23 06:47:50', '2019-09-23 06:47:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_09_19_154327_penyesuaian_table_users', 2),
(5, '2019_09_20_025258_create_tables_categories', 3),
(6, '2019_09_23_114124_create_book_table', 4),
(7, '2019_09_23_114256_create_book_category_table', 5),
(8, '2019_10_11_100450_create_orders_table', 6),
(9, '2019_10_11_101312_create_book_order_table', 6),
(10, '2019_10_11_100350_create_orders_table', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` double(8,2) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('SUBMIT','PROCESS','FINISH','CANCEL') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `username`, `roles`, `address`, `phone`, `avatar`, `status`) VALUES
(1, 'Fadhil Darma Putera Zagoto', 'administrator@larashop.test', NULL, '$2y$10$z1K8a4o/BZJDDQmJoSZFq.BtaVKWPCR3q8tbpp9./Sn5oD3aNNbdW', NULL, '2019-09-19 08:46:47', '2019-09-19 10:38:36', 'administrator', '[\"ADMIN\",\"STAFF\",\"CUSTOMER\"]', 'Padang', '085454425425', 'avatars/1immhP8Gsi2lO7DZ4JEzYvSeSqhjo0rBUOdSeXvJ.jpeg', 'INACTIVE'),
(2, 'aaaa', 'aaa@gmail.com', NULL, '$2y$10$m8tTYLaSdLfvSqNg1JIxbuEEFvY3f9AKYZmS1tDH/.fTRqj4h/x7i', NULL, '2019-09-19 10:17:31', '2019-09-19 20:16:10', 'aaa@gmail.com', '[\"ADMIN\"]', '1231231', '21123', 'avatars/ufntzjIJSh2DX4LIqvzUNgwyH8EJFrYutEdzsPJl.jpeg', 'ACTIVE'),
(3, 'awdadawdawdaw', 'fadhildarma13@gmail.com', NULL, '$2y$10$Bzd3oyo29lJji6xWlOvgM.wygLw18tCiaug2GAInaotZUJzMwqGvq', NULL, '2019-09-19 10:26:59', '2019-09-19 10:29:05', 'administrator@larashop.test', '[\"STAFF\"]', 'awdawd', 'awdawd', 'avatars/S2QNmkPbImoObbWeFD8MsAa5xWCC2Sdb5rkbUJmr.jpeg', 'ACTIVE'),
(5, 'adwad', 'gerrynasution95@gmail.com', NULL, '$2y$10$NsVGrLlpJHI7lK6UGj8DVuPlBOCE3rMULeZ9aec7sNi5n0vGi9xdq', NULL, '2019-09-19 10:39:25', '2019-09-19 10:39:25', 'adawdaw', '[\"ADMIN\"]', 'awdaw', 'awdawd', 'avatars/0pbID8SDr0ATnEOfNViF17i7e7VBG362myyQIpSr.jpeg', 'ACTIVE'),
(7, 'aaaa', '213213213', NULL, '$2y$10$nDTSwZ14GimzpW.KXtkPIuELRzuNfZMDFdQDU6XvtajXR.Vd.S4Pa', NULL, '2019-09-19 19:48:20', '2019-09-19 19:48:20', 'test1', '[\"ADMIN\"]', '3213213123', '21321312', 'avatars/Db78hNXPVGmkliYmolkb0x2DSagybtS0ieSHFnIO.jpeg', 'ACTIVE'),
(8, 'test1', 'test2@gmail.com', NULL, '$2y$10$PdTr/Der2HG49lUXdyXNuee9M0voWxHpV1P3z7b3IWTvs5PBTBioO', NULL, '2019-09-19 19:48:41', '2019-09-19 19:48:41', 'test2', '[\"ADMIN\"]', 'test1', 'test1', 'avatars/Td9qPGbH6UtV1jyCW6RUzhZBknTcnBAfi1h1cHL3.png', 'ACTIVE'),
(9, 'test3', 'test3@gmail.com', NULL, '$2y$10$sx5lPO3cF5nsBS1VqAYpvufm0aN/E.cvh4nz0Xc8pi2dwStmVvXT2', NULL, '2019-09-19 19:48:58', '2019-09-19 19:48:58', 'administrator@larashop.testtest3', '[\"ADMIN\"]', 'test3', 'test3', 'avatars/hzLUFkqjz98Oi3uO6UikYyk65mzewqm9smjw6H13.png', 'ACTIVE'),
(10, 'test4', 'test4@gmail.com', NULL, '$2y$10$SgB9O.9J3RukXc4wKqWm9OYOY8YBQbmMeYKSyImx570pw.s6FvoE6', NULL, '2019-09-19 19:49:14', '2019-09-19 19:49:14', 'test4', '[\"ADMIN\"]', 'test4', 'test4', 'avatars/WM8Pd5NhNx1YCTChAjdJpU2QVALUYssNb4beQ9YY.png', 'ACTIVE'),
(11, 'test5', 'test5@gmail.com', NULL, '$2y$10$bTDw8nUIZzoiTeiuNQv1Lei6d4hbU9Ic5hehszaI4XqwDTmOdMr/i', NULL, '2019-09-19 19:49:34', '2019-09-19 19:49:34', 'test5', '[\"ADMIN\"]', 'test5', 'test5', 'avatars/Djqvsfay2cZ0XotuGnAdpCjLgK6UZfGXkZeuSrV3.png', 'ACTIVE'),
(12, 'test6', 'test6@gmail.com', NULL, '$2y$10$DQXmouL8iBVUqThKSmpspudHixu3vw.HwD.RaCRGo/reS5a2Onp8e', NULL, '2019-09-19 19:50:05', '2019-09-19 19:50:05', 'test6', '[\"ADMIN\"]', 'test6', 'test6', 'avatars/nl9eGa4vtwjljfwps7UK4cmoUkeFb5AiE4HRdljj.jpeg', 'ACTIVE'),
(13, 'test7', 'test7@gmail.com', NULL, '$2y$10$f0BO5115iQQDt9/v1rtgHe05eUtTT5z5v5w9R7TAccl93BYuwcsPe', NULL, '2019-09-19 19:50:45', '2019-09-19 19:50:45', 'test7', '[\"ADMIN\"]', 'test7', 'test7', 'avatars/NEPhMVsbqsxnvLoxIcN9apkkCpHOVQq8kGAanK9J.png', 'ACTIVE'),
(14, 'test8', 'test8@gmail.com', NULL, '$2y$10$N02WGtfmca5idW8sP1mPa..O9Ew2aI.Mttp/0Sz0i6O.kIZFxBev.', NULL, '2019-09-19 19:51:44', '2019-09-19 19:51:44', 'test8', '[\"ADMIN\"]', 'test8', 'test8', 'avatars/hgymbPCkJxGLCMEGzsPKv5P1zFjHRlbdGXLBSQnY.png', 'ACTIVE');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_category_book_id_foreign` (`book_id`),
  ADD KEY `book_category_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `book_order`
--
ALTER TABLE `book_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_order_order_id_foreign` (`order_id`),
  ADD KEY `book_order_book_id_foreign` (`book_id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `book_category`
--
ALTER TABLE `book_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `book_order`
--
ALTER TABLE `book_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `book_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Ketidakleluasaan untuk tabel `book_order`
--
ALTER TABLE `book_order`
  ADD CONSTRAINT `book_order_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `book_order_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
