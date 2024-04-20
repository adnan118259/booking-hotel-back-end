-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 20, 2024 at 05:34 PM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id21296807_app_shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admins_id` int(11) NOT NULL,
  `admins_name` varchar(255) NOT NULL,
  `admins_fullName` varchar(255) NOT NULL DEFAULT 'admin',
  `admins_desc` varchar(400) NOT NULL DEFAULT 'admin',
  `admins_email` varchar(255) NOT NULL,
  `admins_phone` varchar(255) NOT NULL,
  `admins_password` varchar(255) NOT NULL,
  `admins_verflyCode` varchar(255) NOT NULL,
  `admins_approve` int(11) NOT NULL DEFAULT 0,
  `admins_createTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `admins_image` varchar(255) NOT NULL DEFAULT 'iconprofile.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admins_id`, `admins_name`, `admins_fullName`, `admins_desc`, `admins_email`, `admins_phone`, `admins_password`, `admins_verflyCode`, `admins_approve`, `admins_createTime`, `admins_image`) VALUES
(3, 'hamza120', 'Hamza Qermah', 'available', 'hamzaqr123@gmail.com', '0985623105', 'hamza.123', '35101', 1, '2024-03-25 19:24:33', '8541IMG-20240104-WA0041.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `adress`
--

CREATE TABLE `adress` (
  `adress_id` int(11) NOT NULL,
  `adress_usersid` int(11) NOT NULL,
  `adress_name` varchar(255) NOT NULL,
  `adress_city` varchar(255) NOT NULL,
  `adress_street` varchar(255) NOT NULL,
  `adress_lat` double NOT NULL,
  `adress_long` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adress`
--

INSERT INTO `adress` (`adress_id`, `adress_usersid`, `adress_name`, `adress_city`, `adress_street`, `adress_lat`, `adress_long`) VALUES
(6, 51, 'work', 'riyad', 'jeddah str', 24.680176885329203, 46.637717597186565);

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `book_usersid` int(11) NOT NULL,
  `book_roomid` int(11) NOT NULL,
  `book_orders` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `book_usersid`, `book_roomid`, `book_orders`) VALUES
(699, 86, 38, 135),
(700, 86, 38, 135),
(701, 86, 43, 135),
(702, 86, 38, 136),
(703, 86, 32, 136),
(704, 86, 51, 137),
(705, 86, 52, 137),
(706, 86, 32, 138),
(707, 86, 31, 140),
(709, 86, 31, 0),
(710, 51, 38, 141),
(711, 51, 31, 0),
(712, 51, 42, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `bookView`
-- (See below for the actual view)
--
CREATE TABLE `bookView` (
`roomTotalPrice` double
,`countRoom` bigint(21)
,`book_id` int(11)
,`book_usersid` int(11)
,`book_roomid` int(11)
,`book_orders` int(11)
,`room_id` int(11)
,`room_categories` int(11)
,`room_desc` varchar(255)
,`room_desc_ar` varchar(255)
,`room_discount` int(11)
,`room_numfloor` int(11)
,`room_numroom` int(11)
,`room_img` varchar(255)
,`room_price` float
,`room_active` tinyint(4)
,`room_type` int(11)
,`room_isfavorite` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(100) NOT NULL,
  `categories_name` varchar(100) NOT NULL,
  `categories_name_ar` varchar(255) NOT NULL,
  `categories_img` varchar(255) NOT NULL,
  `categories_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_name_ar`, `categories_img`, `categories_datetime`) VALUES
(1, 'Luxury', 'فاخرة', 'iconluxuryroom.png', '2023-10-13 12:39:29'),
(2, 'Family', 'عائلية', 'iconfamilyroom.png', '2023-10-13 12:40:49'),
(3, 'Standard', 'قياسية', 'iconstandardroom.png', '2023-10-13 12:40:49'),
(4, 'Wellness', 'صحية', 'iconswellnessroom.png', '2024-01-20 12:26:12'),
(5, 'Romantic', 'رومنسي', 'iconromanticroom.png', '2024-01-20 12:26:12');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon_name` varchar(200) NOT NULL,
  `coupon_count` int(11) NOT NULL,
  `coupon_expiredate` datetime NOT NULL,
  `coupon_discount` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `coupon_name`, `coupon_count`, `coupon_expiredate`, `coupon_discount`) VALUES
(1, 'ch.4.11', 32, '2024-04-25 08:17:00', 5),
(2, 'ch.20', 88, '2024-04-20 13:29:15', 10),
(3, 'sp.ch.4', 2, '2023-04-30 23:29:15', 50),
(4, 'sp.ch.5', 4, '2024-05-31 00:00:00', 60);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `delivery_name` varchar(100) NOT NULL,
  `delivery_password` varchar(100) NOT NULL,
  `delivery_email` varchar(100) NOT NULL,
  `delivery_phone` varchar(100) NOT NULL DEFAULT '0',
  `delivery_verflyCode` int(11) NOT NULL,
  `delivery_approve` int(11) NOT NULL DEFAULT 0,
  `delivery_createTime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `delivery_name`, `delivery_password`, `delivery_email`, `delivery_phone`, `delivery_verflyCode`, `delivery_approve`, `delivery_createTime`) VALUES
(1, 'demo', '0000', 'demo0000@gmail.com', '099999999', 123123, 1, '2023-12-03 17:56:59');

-- --------------------------------------------------------

--
-- Table structure for table `extra`
--

CREATE TABLE `extra` (
  `extra_id` int(11) NOT NULL,
  `extra_name` varchar(255) NOT NULL,
  `extra_nameAr` varchar(255) NOT NULL,
  `extra_isPopularAmenities` int(11) NOT NULL DEFAULT 0,
  `extra_isServices` int(10) NOT NULL DEFAULT 0,
  `extra_available` tinyint(4) NOT NULL DEFAULT 0,
  `extra_price` double NOT NULL DEFAULT 0,
  `extra_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `extra`
--

INSERT INTO `extra` (`extra_id`, `extra_name`, `extra_nameAr`, `extra_isPopularAmenities`, `extra_isServices`, `extra_available`, `extra_price`, `extra_img`) VALUES
(1, 'Pet friendly', 'صديق للحيوانات الاليفة', 1, 0, 1, 5, 'iconPet.png'),
(2, 'Parking', 'موقف سيارات', 1, 0, 1, 8, 'iconparking.png'),
(3, 'Gym', 'نادي رياضي', 1, 0, 1, 3, 'icongym.png'),
(4, 'Internet access', 'خدمة الإنترنت', 1, 0, 1, 0, 'iconnetwork.png'),
(5, 'Restaurant', 'مطعم', 1, 0, 1, 15, 'iconrestaurant.png'),
(6, 'Swimming Pool', 'حمام السباحة', 1, 0, 1, 4, 'iconpool.png'),
(7, '24-hour front desk', 'خدمة على مدار 24 ساعة', 0, 1, 1, 0, 'iconhotline.png'),
(8, 'Tour/ticket assistance', 'المساعدة في الرحلات/ التذاكر', 0, 1, 1, 12, 'icontourticket.png'),
(9, 'Dry cleaning services', 'خدمات التنظيف الجاف', 0, 1, 1, 3, 'iconclothes.png'),
(10, 'Wedding services', 'خدمات الزفاف', 0, 1, 1, 2, 'iconwedding.png'),
(11, 'Car rentals', 'تأجير السيارات', 0, 1, 1, 20, 'iconcarrentals.png'),
(12, 'Porter/bellhop', 'حمال / مندوب خدمات', 0, 1, 1, 10, 'iconsporterbellhop.png');

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL,
  `favorite_usersid` int(11) NOT NULL,
  `favorite_roomid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `favoritroomView`
-- (See below for the actual view)
--
CREATE TABLE `favoritroomView` (
`favorite_id` int(11)
,`favorite_usersid` int(11)
,`favorite_roomid` int(11)
,`room_id` int(11)
,`room_categories` int(11)
,`room_desc` varchar(255)
,`room_desc_ar` varchar(255)
,`room_discount` int(11)
,`room_numfloor` int(11)
,`room_numroom` int(11)
,`room_img` varchar(255)
,`room_price` float
,`room_active` tinyint(4)
,`room_type` int(11)
,`categories_id` int(100)
,`categories_name` varchar(100)
,`categories_name_ar` varchar(255)
,`categories_img` varchar(255)
,`categories_datetime` timestamp
,`users_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `invoicread`
-- (See below for the actual view)
--
CREATE TABLE `invoicread` (
`users_id` int(11)
,`users_name` varchar(100)
,`users_fullName` varchar(255)
,`users_desc` varchar(255)
,`users_email` varchar(100)
,`users_phone` varchar(100)
,`users_password` varchar(100)
,`users_verflyCode` int(11)
,`users_approve` tinyint(4)
,`users_createTime` date
,`users_image` varchar(1000)
,`book_id` int(11)
,`book_usersid` int(11)
,`book_roomid` int(11)
,`book_orders` int(11)
,`room_id` int(11)
,`room_categories` int(11)
,`room_desc` varchar(255)
,`room_desc_ar` varchar(255)
,`room_discount` int(11)
,`room_numfloor` int(11)
,`room_numroom` int(11)
,`room_img` varchar(255)
,`room_price` float
,`room_active` tinyint(4)
,`room_type` int(11)
,`room_isfavorite` int(11)
,`orders_id` int(11)
,`orders_usersid` int(11)
,`orders_type` int(11)
,`orders_price` int(11)
,`orders_totalprice` int(11)
,`orders_coupon` int(11)
,`orders_datetime` datetime
,`orders_datetime_end` datetime
,`orders_payments` int(11)
,`orders_stause` int(11)
,`orders_rating` double
,`orders_comment` varchar(100)
,`orders_days` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `notification_title` varchar(255) NOT NULL,
  `notification_titleAr` varchar(255) NOT NULL,
  `notification_body` varchar(255) NOT NULL,
  `notification_bodyAr` varchar(255) NOT NULL,
  `notification_users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `notification_title`, `notification_titleAr`, `notification_body`, `notification_bodyAr`, `notification_users`) VALUES
(85, 'updat booking', 'تحديث حالة الحجز', 'Your reservation has been approved (orders_id : 140)', 'تمت الموفقة على حجزك برقم طلب140', 86),
(87, 'updat booking', 'تحديث حالة الحجز', 'Your reservation has been approved (orders_id : 136)', 'تمت الموفقة على حجزك برقم طلب136', 86),
(88, 'update booking', 'تحديث حالة الحجز', 'Your reservation has been approved (orders_id : 135)', 'تمت الموفقة على حجزك برقم طلب135', 86),
(89, 'updat booking', 'تحديث حالة الحجز', 'Your reservation has been approved (orders_id : 135)', 'تمت الموفقة على حجزك برقم طلب135', 86);

-- --------------------------------------------------------

--
-- Stand-in structure for view `orderDetailsView`
-- (See below for the actual view)
--
CREATE TABLE `orderDetailsView` (
`RoomDiscountPrice` double
,`CountRoom` bigint(21)
,`book_id` int(11)
,`book_usersid` int(11)
,`book_roomid` int(11)
,`book_orders` int(11)
,`room_id` int(11)
,`room_categories` int(11)
,`room_desc` varchar(255)
,`room_desc_ar` varchar(255)
,`room_discount` int(11)
,`room_numfloor` int(11)
,`room_numroom` int(11)
,`room_img` varchar(255)
,`room_price` float
,`room_active` tinyint(4)
,`room_type` int(11)
,`room_isfavorite` int(11)
,`orders_id` int(11)
,`orders_usersid` int(11)
,`orders_type` int(11)
,`orders_price` int(11)
,`orders_totalprice` int(11)
,`orders_coupon` int(11)
,`orders_datetime` datetime
,`orders_datetime_end` datetime
,`orders_payments` int(11)
,`orders_stause` int(11)
,`orders_rating` double
,`orders_comment` varchar(100)
,`orders_days` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `orders_usersid` int(11) NOT NULL,
  `orders_type` int(11) NOT NULL DEFAULT 0 COMMENT '0=>delievery ; 1=>recive',
  `orders_price` int(11) NOT NULL DEFAULT 0,
  `orders_totalprice` int(11) NOT NULL DEFAULT 0,
  `orders_coupon` int(11) NOT NULL DEFAULT 0,
  `orders_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `orders_datetime_end` datetime NOT NULL,
  `orders_payments` int(11) NOT NULL DEFAULT 0 COMMENT '0 =>cash , 1 =>bank card',
  `orders_stause` int(11) NOT NULL DEFAULT 0,
  `orders_rating` double NOT NULL DEFAULT 0,
  `orders_comment` varchar(100) NOT NULL DEFAULT '0',
  `orders_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `orders_usersid`, `orders_type`, `orders_price`, `orders_totalprice`, `orders_coupon`, `orders_datetime`, `orders_datetime_end`, `orders_payments`, `orders_stause`, `orders_rating`, `orders_comment`, `orders_days`) VALUES
(135, 86, 0, 234, 890, 1, '2024-04-11 16:12:54', '2024-04-15 00:00:00', 0, 1, 0, '0', 4),
(136, 86, 0, 114, 1331, 2, '2024-04-11 16:13:42', '2024-04-24 00:00:00', 0, 0, 0, '0', 13),
(138, 86, 0, 50, 100, 0, '2024-04-01 16:15:39', '2024-04-06 00:00:00', 0, 0, 0, '0', 2),
(139, 86, 0, 16, 16, 0, '2024-04-10 00:18:30', '2024-04-11 23:17:32', 0, 2, 4, '', 1),
(140, 86, 0, 15, 58, 1, '2024-04-11 18:17:00', '2024-04-15 00:00:00', 0, 2, 3, 'good \n', 4),
(141, 51, 0, 64, 182, 1, '2024-04-13 19:25:26', '2024-04-16 00:00:00', 1, 0, 0, '0', 3);

-- --------------------------------------------------------

--
-- Table structure for table `prodtopselling`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`id21296807_adnan`@`%` SQL SECURITY DEFINER VIEW `prodtopselling`  AS SELECT count(`id21296807_app_shop_db`.`card`.`card_id`) AS `countProd`, `id21296807_app_shop_db`.`card`.`card_id` AS `card_id`, `id21296807_app_shop_db`.`card`.`card_usersid` AS `card_usersid`, `id21296807_app_shop_db`.`card`.`card_productid` AS `card_productid`, `id21296807_app_shop_db`.`card`.`card_orders` AS `card_orders`, `id21296807_app_shop_db`.`prod`.`product_id` AS `product_id`, `id21296807_app_shop_db`.`prod`.`product_categories` AS `product_categories`, `id21296807_app_shop_db`.`prod`.`product_name` AS `product_name`, `id21296807_app_shop_db`.`prod`.`product_name_ar` AS `product_name_ar`, `id21296807_app_shop_db`.`prod`.`product_desc` AS `product_desc`, `id21296807_app_shop_db`.`prod`.`product_img` AS `product_img`, `id21296807_app_shop_db`.`prod`.`product_count` AS `product_count`, `id21296807_app_shop_db`.`prod`.`product_active` AS `product_active`, `id21296807_app_shop_db`.`prod`.`product_price` AS `product_price`, `id21296807_app_shop_db`.`prod`.`product_discount` AS `product_discount`, `id21296807_app_shop_db`.`prod`.`product_date` AS `product_date`, `id21296807_app_shop_db`.`prod`.`product_price`- `id21296807_app_shop_db`.`prod`.`product_price` * `id21296807_app_shop_db`.`prod`.`product_discount` / 100 AS `proPriceDiscount` FROM (`card` join `prod` on(`id21296807_app_shop_db`.`prod`.`product_id` = `id21296807_app_shop_db`.`card`.`card_productid`)) WHERE `id21296807_app_shop_db`.`card`.`card_orders` <> 0 GROUP BY `id21296807_app_shop_db`.`card`.`card_productid` ;
-- Error reading data for table id21296807_app_shop_db.prodtopselling: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `id21296807_app_shop_db`.`prodtopselling`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `room_categories` int(11) NOT NULL,
  `room_desc` varchar(255) NOT NULL,
  `room_desc_ar` varchar(255) NOT NULL,
  `room_discount` int(11) NOT NULL,
  `room_numfloor` int(11) NOT NULL,
  `room_numroom` int(11) NOT NULL,
  `room_img` varchar(255) NOT NULL,
  `room_price` float NOT NULL,
  `room_active` tinyint(4) NOT NULL,
  `room_type` int(11) NOT NULL DEFAULT 0,
  `room_isfavorite` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `room_categories`, `room_desc`, `room_desc_ar`, `room_discount`, `room_numfloor`, `room_numroom`, `room_img`, `room_price`, `room_active`, `room_type`, `room_isfavorite`) VALUES
(31, 1, 'The air-conditioned apartment consists of 1 bedroom, a fully equipped kitchenette, and 1 bathroom. A flat-screen TV is available. The accommodation is non-smoking.', 'تتكون الشقة المكيفة من غرفة نوم واحدة ومطبخ صغير مجهز بالكامل وحمام واحد. ويتوفر تلفزيون بشاشة مسطحة. مكان الإقامة مخصص لغير المدخنين.', 5, 1, 3, 'IMG1.jpg', 16, 1, 0, 0),
(32, 3, 'The air-conditioned apartment is composed of 2 separate bedrooms, a living room, a fully equipped kitchen, and 1 bathroom. A flat-screen TV is featured. The accommodation is non-smoking.', 'تتكون الشقة المكيفة من غرفتي نوم منفصلتين وغرفة معيشة ومطبخ مجهز بالكامل وحمام واحد. ويتوفر تلفزيون بشاشة مسطحة. مكان الإقامة مخصص لغير المدخنين.', 0, 3, 11, 'IMG2.jpg', 50, 1, 0, 0),
(37, 3, 'The hotel will provide guests with air-conditioned rooms with a closet, an electric tea pot, a safety deposit box, a flat-screen TV and a private bathroom with a bidet. all rooms have bed linen and towels.', 'يوفر الفندق للضيوف غرف مكيفة مع خزانة ملابس وغلاية وصندوق ودائع آمن وتلفزيون بشاشة مسطحة وحمام خاص مع بيديت. وتحتوي جميع الغرف على بياضات الأسرّة والمناشف.', 10, 3, 12, 'IMG3.jpg', 79, 1, 0, 0),
(38, 2, 'The rooms at the hotel come with air conditioning, a seating area, a flat-screen TV with satellite channels, a safety deposit box and a private bathroom with a bidet, free toiletries and a hairdryer.  ', 'تحتوي الغرف في الفندق على تكييف ومنطقة جلوس وتلفزيون بشاشة مسطحة مع قنوات فضائية وصندوق ودائع آمن وحمام خاص مع بيديت ولوازم استحمام مجانية ومجفف شعر. ', 15, 2, 6, 'IMG4.jpg', 75, 1, 0, 0),
(39, 3, 'Each room here will provide you with a flat-screen TV, air conditioning and a living room. Complete with a refrigerator, the dining area also has an electric kettle. Featuring a shower, private bathroom also comes with a bath and a bidet.\r\n', 'ستوفر لك كل غرفة هنا تلفزيون بشاشة مسطحة وتكييف وغرفة معيشة. وتحتوي منطقة تناول الطعام على ثلاجة وغلاية كهربائية. ويشتمل الحمام الخاص على دُش وحوض استحمام وبيديت.', 0, 3, 13, 'IMG5.jpg', 85, 1, 0, 0),
(40, 3, 'Complete with a private bathroom equipped with a bidet and free toiletries, guest rooms at the hotel have a flat-screen TV and air conditioning, and certain rooms include a seating area.', 'تحتوي غرف الضيوف في الفندق على حمام خاص مجهز ببيديت ولوازم استحمام مجانية، وتحتوي على تلفزيون بشاشة مسطحة وتكييف، وتضم بعض الغرف منطقة جلوس.', 7, 3, 14, 'IMG6.jpg', 55, 1, 0, 0),
(41, 3, 'All units feature air conditioning and a satellite flat-screen TV. Rooms include a kettle and a private bathroom with a shower and slippers, while selected rooms also boast a fully equipped kitchen. ', 'تحتوي جميع الوحدات على تكييف وتلفزيون بشاشة مسطحة مع قنوات فضائية. وتحتوي الغرف على غلاية وحمام خاص مع دش ونعال، في حين تتميز بعض الغرف أيضًا بمطبخ مجهز بالكامل.', 15, 3, 15, 'IMG7.jpg', 50, 1, 0, 0),
(42, 1, 'All air-conditioned rooms are elegantly decorated and have a seating area with plush armchair and TV with multilingual channels. Each one has a well-lit work desk with access to electrical outlets and a mini-bar.\r\n', 'تتميز جميع الغرف المكيفة بديكور أنيق، وتحتوي على منطقة جلوس مع كرسي فخم بذراعين وتلفزيون مع قنوات متعددة اللغات. وتحتوي جميعها على مكتب عمل مضاء جيدًا مع إمكانية الوصول إلى المنافذ الكهربائية وميني بار.', 12, 1, 2, 'IMG8.jpg', 65, 1, 0, 0),
(43, 2, 'All guest rooms at the hotel come with air conditioning, a seating area, a flat-screen TV with satellite channels, a safety deposit box and a private bathroom with a shower, free toiletries and a hairdryer. At WA Hotel every room has bed linen and towels.', 'تحتوي جميع غرف الضيوف في الفندق على تكييف ومنطقة جلوس وتلفزيون بشاشة مسطحة مع قنوات فضائية وصندوق ودائع آمن وحمام خاص مع دش ولوازم استحمام مجانية ومجفف شعر. تحتوي جميع الغرف في فندق WA على بياضات الأسرّة والمناشف.', 11, 2, 7, 'IMG9.jpg', 120, 1, 0, 0),
(44, 2, 'Featuring a fully equipped kitchen with an oven and a microwave, each unit also comes with a satellite flat-screen TV, ironing facilities, desk, and a seating area with a sofa. \r\n', 'تحتوي جميع الوحدات على مطبخ مجهز بالكامل مع فرن وميكروويف وتلفزيون بشاشة مسطحة مع قنوات فضائية ومرافق كي الملابس ومكتب ومنطقة جلوس مع أريكة.', 7, 2, 8, 'IMG10.jpg', 100, 1, 0, 0),
(45, 2, 'Featuring a fully equipped kitchen with an oven and a microwave, each unit also comes with a satellite flat-screen TV, ironing facilities, desk, and a seating area with a sofa.  ', 'تحتوي جميع الوحدات على مطبخ مجهز بالكامل مع فرن وميكروويف وتلفزيون بشاشة مسطحة مع قنوات فضائية ومرافق كي الملابس ومكتب ومنطقة جلوس مع أريكة.', 0, 2, 9, 'IMG11.jpg', 130, 1, 0, 0),
(46, 2, 'Each spacious room is decorated in warm colors. All of them have a full-length wardrobe and a well-lit work desk. Each unit has a satellite TV and air conditioning. A non-smoking floor is available.\r\n', 'تم تزيين كل غرفة فسيحة بألوان دافئة. وتحتوي جميعها على خزانة ملابس كاملة الطول ومكتب عمل مضاء جيدًا. تحتوي كل وحدة على تلفزيون مع قنوات فضائية وتكييف الهواء. يتوفر طابق لغير المدخنين.', 5, 2, 10, 'IMG12.jpg', 125, 1, 0, 0),
(47, 1, 'The units at the condo hotel come with air conditioning, a seating area, a flat-screen TV with streaming services, a kitchenette, a dining area, a safety deposit box, and a private bathroom with a bidet, slippers, and a hair dryer.  ', 'تحتوي الوحدات في الشقق الفندقية على تكييف ومنطقة جلوس وتلفزيون بشاشة مسطحة مع خدمات البث ومطبخ صغير ومنطقة لتناول الطعام وصندوق ودائع آمن وحمام خاص مع بيديت ونعال ومجفف شعر. .', 3, 1, 1, 'IMG13.jpg', 84, 1, 0, 0),
(48, 1, 'At the condo hotel, every unit has a balcony. There\'s also a well-equipped kitchen in some units featuring kitchenware. At the condo hotel, every unit is equipped with air conditioning and a flat-screen TV.\r\n', 'تحتوي جميع الوحدات في الشقق الفندقية على شرفة. يتوفر أيضًا مطبخ مجهز تجهيزًا جيدًا في بعض الوحدات ويضم أدوات المطبخ. تحتوي جميع الوحدات في الشقق الفندقية على تكييف وتلفزيون بشاشة مسطحة.', 2, 1, 4, 'IMG14.jpg', 92, 1, 0, 0),
(49, 1, 'Guest rooms at the hotel are equipped with a flat-screen TV with cable channels and a safety deposit box. All guest rooms include a desk.', 'تم تجهيز غرف الضيوف في الفندق بتلفزيون بشاشة مسطحة مع قنوات الكابل وصندوق ودائع آمن. تحتوي جميع غرف الضيوف على مكتب.', 7, 1, 5, 'IMG15.jpg', 110, 1, 0, 0),
(50, 5, '\r\nGuest rooms at the hotel are equipped with a seating area, a TV with satellite channels and a private bathroom with a hairdryer and a bidet. All units at Seasons Park ,mawasim al hay at hotel include air conditioning and a wardrobe.\r\n', 'تم تجهيز غرف الضيوف في الفندق بمنطقة جلوس وتلفزيون مع قنوات فضائية وحمام خاص مع مجفف شعر وبيديت. تحتوي جميع الوحدات في سيزونز بارك، مواسم الحي في الفندق على تكييف وخزانة ملابس.', 20, 5, 21, 'IMG16.jpg', 150, 1, 0, 0),
(51, 5, 'The condo hotel will provide guests with air-conditioned units offering a desk, a kettle, a microwave, a fridge, a safety deposit box, a flat-screen TV, and a private bathroom with a walk-in shower.  ', 'توفر الشقق الفندقية للضيوف وحدات مكيفة تحتوي على مكتب وغلاية وميكروويف وثلاجة وصندوق ودائع آمن وتلفزيون بشاشة مسطحة وحمام خاص مع مقصورة دش.', 10, 5, 22, 'IMG17.jpg', 75, 1, 0, 0),
(52, 5, 'The hotel will provide guests with air-conditioned rooms offering a closet, an electric tea pot, a fridge, a safety deposit box,  . Certain rooms come with a kitchenette with a microwave, a minibar and a stovetop.', 'سيوفر الفندق للضيوف غرف مكيفة تحتوي على خزانة ملابس وغلاية وثلاجة وصندوق ودائع آمن. وتحتوي بعض الغرف على مطبخ صغير مع ميكروويف وميني بار وموقد مسطح.', 0, 5, 23, 'IMG18.jpg', 75, 1, 0, 0),
(53, 5, 'Accommodation is equipped with air conditioning, a fully equipped kitchenette, a flat-screen TV, and a private bathroom with walk-in shower, slippers, and a hair dryer.  ', 'يحتوي مكان الإقامة على تكييف ومطبخ صغير مجهز بالكامل وتلفزيون بشاشة مسطحة وحمام خاص مع مقصورة دش ونعال ومجفف شعر.', 5, 5, 24, 'IMG19.jpg', 86, 1, 0, 0),
(54, 5, 'The hotel will provide guests with air-conditioned rooms with a desk, an electric tea pot, a minibar, a safety deposit box, a flat-screen TV and a private bathroom with a bidet.  ', 'يوفر الفندق للضيوف غرف مكيفة مع مكتب وغلاية وميني بار وصندوق ودائع آمن وتلفزيون بشاشة مسطحة وحمام خاص مع بيديت.', 3, 5, 25, 'IMG20.jpg', 130, 1, 0, 0),
(55, 4, 'The cryotherapy chamber has advanced safety features and controlled temperature settings, ensuring a safe and comfortable experience.', 'تحتوي غرفة العلاج بالتجميد على ميزات سلامة متقدمة وإعدادات درجة حرارة مراقبة، مما يضمن تجربة آمنة ومريحة. ', 0, 4, 16, 'IMG21.jpg', 150, 1, 0, 0),
(56, 4, 'All units come with a seating area, terrace and/or balcony. There is also a fully equipped kitchen, as well as a private bathroom with a bath or shower in each unit. Towels are provided.', 'تحتوي جميع الوحدات على منطقة جلوس وتراس و/أو شرفة. يتوفر أيضًا مطبخ مجهز بالكامل، فضلاً عن حمام خاص مع حوض استحمام أو دش في كل وحدة. يتم توفير المناشف.', 2, 4, 17, 'IMG22.jpg', 140, 1, 0, 0),
(57, 4, 'Pytloun City Boutique Hotel offers accommodations in air-conditioned rooms with  free coffee/tea set, LCD satellite TV and ironing facilities.   Some of the rooms have a private terrace and some have a private hot tub.\r\n ', 'يوفر فندق Pytloun City البوتيكي أماكن إقامة في غرف مكيفة مع مجموعة مجانية من القهوة/الشاي وتلفزيون إل سي دي مع قنوات فضائية ومرافق كي الملابس. تحتوي بعض الغرف على تراس خاص ويحتوي بعضها على حوض استحمام ساخن خاص.', 0, 4, 18, 'IMG23.jpg', 170, 1, 0, 0),
(58, 4, ' All rooms have a free coffee/tea set, LCD satellite TV and ironing facilities. Some rooms also feature a spa bath.\r\n offers a children´s play area and a garden with a seating area.  ', 'تحتوي جميع الغرف على مجموعة القهوة / الشاي المجانية وتلفزيون إل سي دي مع قنوات فضائية ومرافق كي الملابس. كما تحتوي بعض الغرف على حوض سبا.\r\n  يوفر منطقة لعب للأطفال وحديقة مع منطقة جلوس.', 5, 4, 19, 'IMG24.jpg', 180, 1, 0, 0),
(59, 4, 'Each unit at this property features a flat-screen TV with cable channels, as well as a fully equipped kitchen with a coffee machine and a living room. Some units also boast a PS3 game console, a blu-ray player and a dishwasher.', 'تحتوي كل وحدة في مكان الإقامة هذا على تلفزيون بشاشة مسطحة مع قنوات الكابل، فضلاً عن مطبخ مجهز بالكامل مع آلة لصنع القهوة وغرفة معيشة. وتتميز بعض الوحدات أيضًا بجهاز عرض ألعاب PS3 ومشغل بلو راي وغسالة أطباق.', 25, 4, 20, 'IMG25.jpg', 200, 1, 0, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `roomTopBooking`
-- (See below for the actual view)
--
CREATE TABLE `roomTopBooking` (
`countRoom` bigint(21)
,`book_id` int(11)
,`book_usersid` int(11)
,`book_roomid` int(11)
,`book_orders` int(11)
,`room_id` int(11)
,`room_categories` int(11)
,`room_desc` varchar(255)
,`room_desc_ar` varchar(255)
,`room_discount` int(11)
,`room_numfloor` int(11)
,`room_numroom` int(11)
,`room_img` varchar(255)
,`room_price` float
,`room_active` tinyint(4)
,`room_type` int(11)
,`room_isfavorite` int(11)
,`roomPriceDiscount` double
);

-- --------------------------------------------------------

--
-- Table structure for table `sellingoffers`
--

CREATE TABLE `sellingoffers` (
  `sellingoffers_id` int(11) NOT NULL,
  `sellingoffers_title` varchar(255) NOT NULL,
  `sellingoffers_body` varchar(255) NOT NULL,
  `sellingoffers_timeDelivery` int(11) NOT NULL DEFAULT 30
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sellingoffers`
--

INSERT INTO `sellingoffers` (`sellingoffers_id`, `sellingoffers_title`, `sellingoffers_body`, `sellingoffers_timeDelivery`) VALUES
(1, 'Offers for Day ..', 'Enguy with summer superise 25%', 30),
(2, 'Offers for Ramadan ..', 'Enguy with Ramadan superise 50%', 15);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `users_name` varchar(100) NOT NULL DEFAULT 'user',
  `users_fullName` varchar(255) NOT NULL DEFAULT 'user',
  `users_desc` varchar(255) NOT NULL DEFAULT 'your desc',
  `users_email` varchar(100) NOT NULL,
  `users_phone` varchar(100) NOT NULL,
  `users_password` varchar(100) NOT NULL,
  `users_verflyCode` int(11) NOT NULL DEFAULT 0,
  `users_approve` tinyint(4) NOT NULL DEFAULT 0,
  `users_createTime` date NOT NULL DEFAULT current_timestamp(),
  `users_image` varchar(1000) NOT NULL DEFAULT 'iconprofile.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `users_name`, `users_fullName`, `users_desc`, `users_email`, `users_phone`, `users_password`, `users_verflyCode`, `users_approve`, `users_createTime`, `users_image`) VALUES
(51, 'adnan', 'Adnan Al-barakat', 'Thank God for all these blessings, family, childre', 'adnanbarakat111@gmail.com', '0996183101', '121212', 37435, 1, '2023-10-04', '5002IMG-20240104-WA0045.jpg'),
(53, 'amr', 'Amr nadaf', 'available', 'omardeep199904@gmail.com', '0996185429', '1010', 76923, 1, '2023-10-27', 'avatar5.jpg'),
(86, 'adam', 'Adam g.syoufi', 'Thank God for all these blessings', 'adam.syoufi@gmail.com', '0986759485', 'adam.syr', 89978, 1, '2024-04-11', '5782IMG_20220218_232333_490.jpg');

-- --------------------------------------------------------

--
-- Stand-in structure for view `viewMyfavorit`
-- (See below for the actual view)
--
CREATE TABLE `viewMyfavorit` (
`favorite_id` int(11)
,`favorite_usersid` int(11)
,`favorite_roomid` int(11)
,`room_id` int(11)
,`room_categories` int(11)
,`room_desc` varchar(255)
,`room_desc_ar` varchar(255)
,`room_discount` int(11)
,`room_numfloor` int(11)
,`room_numroom` int(11)
,`room_img` varchar(255)
,`room_price` float
,`room_active` tinyint(4)
,`room_type` int(11)
,`users_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_room_and_categories`
-- (See below for the actual view)
--
CREATE TABLE `view_room_and_categories` (
`room_id` int(11)
,`room_categories` int(11)
,`room_desc` varchar(255)
,`room_desc_ar` varchar(255)
,`room_discount` int(11)
,`room_numfloor` int(11)
,`room_numroom` int(11)
,`room_img` varchar(255)
,`room_price` float
,`room_active` tinyint(4)
,`room_type` int(11)
,`room_isfavorite` int(11)
,`categories_id` int(100)
,`categories_name` varchar(100)
,`categories_name_ar` varchar(255)
,`categories_img` varchar(255)
,`categories_datetime` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_room_and_categories_withFavorite`
-- (See below for the actual view)
--
CREATE TABLE `view_room_and_categories_withFavorite` (
`room_id` int(11)
,`room_categories` int(11)
,`room_desc` varchar(255)
,`room_desc_ar` varchar(255)
,`room_discount` int(11)
,`room_numfloor` int(11)
,`room_numroom` int(11)
,`room_img` varchar(255)
,`room_price` float
,`room_active` tinyint(4)
,`room_type` int(11)
,`favorite_id` int(11)
,`favorite_usersid` int(11)
,`favorite_roomid` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `bookView`
--
DROP TABLE IF EXISTS `bookView`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id21296807_adnan`@`%` SQL SECURITY DEFINER VIEW `bookView`  AS SELECT sum(`room`.`room_price` - `room`.`room_price` * `room`.`room_discount` / 100) AS `roomTotalPrice`, count(`book`.`book_roomid`) AS `countRoom`, `book`.`book_id` AS `book_id`, `book`.`book_usersid` AS `book_usersid`, `book`.`book_roomid` AS `book_roomid`, `book`.`book_orders` AS `book_orders`, `room`.`room_id` AS `room_id`, `room`.`room_categories` AS `room_categories`, `room`.`room_desc` AS `room_desc`, `room`.`room_desc_ar` AS `room_desc_ar`, `room`.`room_discount` AS `room_discount`, `room`.`room_numfloor` AS `room_numfloor`, `room`.`room_numroom` AS `room_numroom`, `room`.`room_img` AS `room_img`, `room`.`room_price` AS `room_price`, `room`.`room_active` AS `room_active`, `room`.`room_type` AS `room_type`, `room`.`room_isfavorite` AS `room_isfavorite` FROM (`book` join `room` on(`room`.`room_id` = `book`.`book_roomid`)) WHERE `book`.`book_orders` = 0 GROUP BY `book`.`book_roomid`, `book`.`book_usersid` ;

-- --------------------------------------------------------

--
-- Structure for view `favoritroomView`
--
DROP TABLE IF EXISTS `favoritroomView`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id21296807_adnan`@`%` SQL SECURITY DEFINER VIEW `favoritroomView`  AS SELECT `favorite`.`favorite_id` AS `favorite_id`, `favorite`.`favorite_usersid` AS `favorite_usersid`, `favorite`.`favorite_roomid` AS `favorite_roomid`, `room`.`room_id` AS `room_id`, `room`.`room_categories` AS `room_categories`, `room`.`room_desc` AS `room_desc`, `room`.`room_desc_ar` AS `room_desc_ar`, `room`.`room_discount` AS `room_discount`, `room`.`room_numfloor` AS `room_numfloor`, `room`.`room_numroom` AS `room_numroom`, `room`.`room_img` AS `room_img`, `room`.`room_price` AS `room_price`, `room`.`room_active` AS `room_active`, `room`.`room_type` AS `room_type`, `categories`.`categories_id` AS `categories_id`, `categories`.`categories_name` AS `categories_name`, `categories`.`categories_name_ar` AS `categories_name_ar`, `categories`.`categories_img` AS `categories_img`, `categories`.`categories_datetime` AS `categories_datetime`, `users`.`users_id` AS `users_id` FROM (((`favorite` join `users` on(`users`.`users_id` = `favorite`.`favorite_usersid`)) join `room` on(`room`.`room_id` = `favorite`.`favorite_roomid`)) join `categories` on(`categories`.`categories_id` = `room`.`room_categories`)) ;

-- --------------------------------------------------------

--
-- Structure for view `invoicread`
--
DROP TABLE IF EXISTS `invoicread`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id21296807_adnan`@`%` SQL SECURITY DEFINER VIEW `invoicread`  AS SELECT `users`.`users_id` AS `users_id`, `users`.`users_name` AS `users_name`, `users`.`users_fullName` AS `users_fullName`, `users`.`users_desc` AS `users_desc`, `users`.`users_email` AS `users_email`, `users`.`users_phone` AS `users_phone`, `users`.`users_password` AS `users_password`, `users`.`users_verflyCode` AS `users_verflyCode`, `users`.`users_approve` AS `users_approve`, `users`.`users_createTime` AS `users_createTime`, `users`.`users_image` AS `users_image`, `book`.`book_id` AS `book_id`, `book`.`book_usersid` AS `book_usersid`, `book`.`book_roomid` AS `book_roomid`, `book`.`book_orders` AS `book_orders`, `room`.`room_id` AS `room_id`, `room`.`room_categories` AS `room_categories`, `room`.`room_desc` AS `room_desc`, `room`.`room_desc_ar` AS `room_desc_ar`, `room`.`room_discount` AS `room_discount`, `room`.`room_numfloor` AS `room_numfloor`, `room`.`room_numroom` AS `room_numroom`, `room`.`room_img` AS `room_img`, `room`.`room_price` AS `room_price`, `room`.`room_active` AS `room_active`, `room`.`room_type` AS `room_type`, `room`.`room_isfavorite` AS `room_isfavorite`, `orders`.`orders_id` AS `orders_id`, `orders`.`orders_usersid` AS `orders_usersid`, `orders`.`orders_type` AS `orders_type`, `orders`.`orders_price` AS `orders_price`, `orders`.`orders_totalprice` AS `orders_totalprice`, `orders`.`orders_coupon` AS `orders_coupon`, `orders`.`orders_datetime` AS `orders_datetime`, `orders`.`orders_datetime_end` AS `orders_datetime_end`, `orders`.`orders_payments` AS `orders_payments`, `orders`.`orders_stause` AS `orders_stause`, `orders`.`orders_rating` AS `orders_rating`, `orders`.`orders_comment` AS `orders_comment`, `orders`.`orders_days` AS `orders_days` FROM (((`book` join `users` on(`book`.`book_usersid` = `users`.`users_id`)) join `room` on(`book`.`book_roomid` = `room`.`room_id`)) join `orders` on(`book`.`book_orders` = `orders`.`orders_id`)) WHERE `book`.`book_orders` <> 0 ;

-- --------------------------------------------------------

--
-- Structure for view `orderDetailsView`
--
DROP TABLE IF EXISTS `orderDetailsView`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id21296807_adnan`@`%` SQL SECURITY DEFINER VIEW `orderDetailsView`  AS SELECT sum(`room`.`room_price` - `room`.`room_price` * `room`.`room_discount` / 100) AS `RoomDiscountPrice`, count(`book`.`book_roomid`) AS `CountRoom`, `book`.`book_id` AS `book_id`, `book`.`book_usersid` AS `book_usersid`, `book`.`book_roomid` AS `book_roomid`, `book`.`book_orders` AS `book_orders`, `room`.`room_id` AS `room_id`, `room`.`room_categories` AS `room_categories`, `room`.`room_desc` AS `room_desc`, `room`.`room_desc_ar` AS `room_desc_ar`, `room`.`room_discount` AS `room_discount`, `room`.`room_numfloor` AS `room_numfloor`, `room`.`room_numroom` AS `room_numroom`, `room`.`room_img` AS `room_img`, `room`.`room_price` AS `room_price`, `room`.`room_active` AS `room_active`, `room`.`room_type` AS `room_type`, `room`.`room_isfavorite` AS `room_isfavorite`, `orders`.`orders_id` AS `orders_id`, `orders`.`orders_usersid` AS `orders_usersid`, `orders`.`orders_type` AS `orders_type`, `orders`.`orders_price` AS `orders_price`, `orders`.`orders_totalprice` AS `orders_totalprice`, `orders`.`orders_coupon` AS `orders_coupon`, `orders`.`orders_datetime` AS `orders_datetime`, `orders`.`orders_datetime_end` AS `orders_datetime_end`, `orders`.`orders_payments` AS `orders_payments`, `orders`.`orders_stause` AS `orders_stause`, `orders`.`orders_rating` AS `orders_rating`, `orders`.`orders_comment` AS `orders_comment`, `orders`.`orders_days` AS `orders_days` FROM ((`book` join `room` on(`room`.`room_id` = `book`.`book_roomid`)) join `orders` on(`orders`.`orders_id` = `book`.`book_orders`)) WHERE `book`.`book_orders` <> 0 GROUP BY `book`.`book_roomid`, `book`.`book_usersid` ;

-- --------------------------------------------------------

--
-- Structure for view `roomTopBooking`
--
DROP TABLE IF EXISTS `roomTopBooking`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id21296807_adnan`@`%` SQL SECURITY DEFINER VIEW `roomTopBooking`  AS SELECT count(`book`.`book_id`) AS `countRoom`, `book`.`book_id` AS `book_id`, `book`.`book_usersid` AS `book_usersid`, `book`.`book_roomid` AS `book_roomid`, `book`.`book_orders` AS `book_orders`, `room`.`room_id` AS `room_id`, `room`.`room_categories` AS `room_categories`, `room`.`room_desc` AS `room_desc`, `room`.`room_desc_ar` AS `room_desc_ar`, `room`.`room_discount` AS `room_discount`, `room`.`room_numfloor` AS `room_numfloor`, `room`.`room_numroom` AS `room_numroom`, `room`.`room_img` AS `room_img`, `room`.`room_price` AS `room_price`, `room`.`room_active` AS `room_active`, `room`.`room_type` AS `room_type`, `room`.`room_isfavorite` AS `room_isfavorite`, `room`.`room_price`- `room`.`room_price` * `room`.`room_discount` / 100 AS `roomPriceDiscount` FROM (`book` join `room` on(`room`.`room_id` = `book`.`book_roomid`)) WHERE `book`.`book_orders` <> 0 GROUP BY `book`.`book_roomid` ;

-- --------------------------------------------------------

--
-- Structure for view `viewMyfavorit`
--
DROP TABLE IF EXISTS `viewMyfavorit`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id21296807_adnan`@`%` SQL SECURITY DEFINER VIEW `viewMyfavorit`  AS SELECT `favorite`.`favorite_id` AS `favorite_id`, `favorite`.`favorite_usersid` AS `favorite_usersid`, `favorite`.`favorite_roomid` AS `favorite_roomid`, `room`.`room_id` AS `room_id`, `room`.`room_categories` AS `room_categories`, `room`.`room_desc` AS `room_desc`, `room`.`room_desc_ar` AS `room_desc_ar`, `room`.`room_discount` AS `room_discount`, `room`.`room_numfloor` AS `room_numfloor`, `room`.`room_numroom` AS `room_numroom`, `room`.`room_img` AS `room_img`, `room`.`room_price` AS `room_price`, `room`.`room_active` AS `room_active`, `room`.`room_type` AS `room_type`, `users`.`users_id` AS `users_id` FROM ((`favorite` join `users` on(`users`.`users_id` = `favorite`.`favorite_usersid`)) join `room` on(`room`.`room_id` = `favorite`.`favorite_roomid`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_room_and_categories`
--
DROP TABLE IF EXISTS `view_room_and_categories`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id21296807_adnan`@`%` SQL SECURITY DEFINER VIEW `view_room_and_categories`  AS SELECT `room`.`room_id` AS `room_id`, `room`.`room_categories` AS `room_categories`, `room`.`room_desc` AS `room_desc`, `room`.`room_desc_ar` AS `room_desc_ar`, `room`.`room_discount` AS `room_discount`, `room`.`room_numfloor` AS `room_numfloor`, `room`.`room_numroom` AS `room_numroom`, `room`.`room_img` AS `room_img`, `room`.`room_price` AS `room_price`, `room`.`room_active` AS `room_active`, `room`.`room_type` AS `room_type`, `room`.`room_isfavorite` AS `room_isfavorite`, `categories`.`categories_id` AS `categories_id`, `categories`.`categories_name` AS `categories_name`, `categories`.`categories_name_ar` AS `categories_name_ar`, `categories`.`categories_img` AS `categories_img`, `categories`.`categories_datetime` AS `categories_datetime` FROM (`room` join `categories` on(`room`.`room_categories` = `categories`.`categories_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_room_and_categories_withFavorite`
--
DROP TABLE IF EXISTS `view_room_and_categories_withFavorite`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id21296807_adnan`@`%` SQL SECURITY DEFINER VIEW `view_room_and_categories_withFavorite`  AS SELECT `room`.`room_id` AS `room_id`, `room`.`room_categories` AS `room_categories`, `room`.`room_desc` AS `room_desc`, `room`.`room_desc_ar` AS `room_desc_ar`, `room`.`room_discount` AS `room_discount`, `room`.`room_numfloor` AS `room_numfloor`, `room`.`room_numroom` AS `room_numroom`, `room`.`room_img` AS `room_img`, `room`.`room_price` AS `room_price`, `room`.`room_active` AS `room_active`, `room`.`room_type` AS `room_type`, `favorite`.`favorite_id` AS `favorite_id`, `favorite`.`favorite_usersid` AS `favorite_usersid`, `favorite`.`favorite_roomid` AS `favorite_roomid` FROM (`room` join `favorite` on(`room`.`room_id` = `favorite`.`favorite_roomid`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admins_id`);

--
-- Indexes for table `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`adress_id`),
  ADD KEY `adress_usersid` (`adress_usersid`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `card_usersid` (`book_usersid`),
  ADD KEY `card_ibfk_2` (`book_roomid`),
  ADD KEY `fk_book_orders` (`book_orders`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `coupon_name` (`coupon_name`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`);

--
-- Indexes for table `extra`
--
ALTER TABLE `extra`
  ADD PRIMARY KEY (`extra_id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `favorite_usersid` (`favorite_usersid`),
  ADD KEY `favorite_ibfk_3` (`favorite_roomid`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `notification_users` (`notification_users`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `room_categories` (`room_categories`),
  ADD KEY `room_isfavorite` (`room_isfavorite`);

--
-- Indexes for table `sellingoffers`
--
ALTER TABLE `sellingoffers`
  ADD PRIMARY KEY (`sellingoffers_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`),
  ADD UNIQUE KEY `users_phone` (`users_phone`),
  ADD UNIQUE KEY `users_email` (`users_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admins_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `adress`
--
ALTER TABLE `adress`
  MODIFY `adress_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=713;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `extra`
--
ALTER TABLE `extra`
  MODIFY `extra_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=945;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `sellingoffers`
--
ALTER TABLE `sellingoffers`
  MODIFY `sellingoffers_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adress`
--
ALTER TABLE `adress`
  ADD CONSTRAINT `adress_ibfk_1` FOREIGN KEY (`adress_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`book_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`book_roomid`) REFERENCES `room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_3` FOREIGN KEY (`favorite_roomid`) REFERENCES `room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_ibfk_4` FOREIGN KEY (`favorite_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`notification_users`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`room_categories`) REFERENCES `categories` (`categories_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
