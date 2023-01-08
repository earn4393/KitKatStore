-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 10, 2022 at 12:44 PM
-- Server version: 8.0.17
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kitkatshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`detail_id`, `order_id`, `product_id`, `count`) VALUES
(44, 34, 6, 1),
(45, 34, 4, 1),
(46, 34, 2, 2),
(48, 36, 9, 2),
(49, 36, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` int(11) NOT NULL,
  `fname` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `fname`, `lname`, `address`, `mobile`, `date`) VALUES
(34, 'kanyapak', 'pinjai', '21/4 moo8 xxxxxx   xxxxxxxxx     xxxxxxxxxx  12345', '09876544444', '2022-10-29 14:39:07'),
(36, 'jarunee', 'Pinto', 'asdfghjkl;  cvbnm  eretyui', '1234456789', '2022-10-29 15:42:53');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL DEFAULT '0',
  `saleout` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `saleout`) VALUES
(1, 'KitKat Sake Manju Izumi', 'KitKat Sake Manju Izumi คิทแคทรสสาเก ซึ่งได้รว่มมือกับ Manju Izumi แบรนด์สาเกชื่อดังของโทยามะ ที่มีรสชาติอันเป็นเอกลักษณ์ของสาเกที่เข้ากันได้ดีกับขนมหวานอย่างคิดแคทได้อย่างลงตัว พร้อมเพคเกจที่หรูหรา', 457, 6),
(2, 'Kitkat Yoguruto sake', 'Kitkat Yoguruto sake รสที่ผสานสาเกชั้นดีและโยเกิร์ตคุณภาพได้อย่างลงตัว มีความครีมมี่ เปรี้ยวอมหวาน มีเท็กเจอร์ที่กรุบกรอบ รสชาติกลมกล่อมเข้ากันสุดๆ มาพร้อมกล่องสวยงามน่าจัดไปเป็นของฝากเพื่อนคนสำคัญ ทั้งยังได้รสชาติที่แปลกใหม่ด้วย', 756, 2),
(3, 'Kitkat Strawberry Cheese Cake', 'Kitkat Strawberry Cheese Cake รสชาติสุดฟินที่ผสานเอาความลงตัวอย่างสตรอเบอร์รี่ชีสเค้ก มาไว้ในคิทแคทได้อย่างพอเหมาะ สาวกชีสเค้กต้องชอบ รสชาติสุดฟินติดลิ้น ที่สำคัญมีความพิเศษที่แพคเกจรูปฟูจิซังที่มีความน่ารักน่าซื้อเป็นของฝาก เพราะให้ฟีลแบบมาถึงญี่ปุ่นแล้ว', 648, 0),
(4, 'KITKAT Rum Raisin (Tokyo)\r\n', 'คิทแคทญี่ปุ่น รสต่อไปมีดีกรีเป็นถึงของฝากโตเกียว เรียกว่าเป็นแคทแคทประจำเมืองนั่นคือ KITKAT Rum Raisin ที่มีรสชาติอร่อยเข้มข้นสุดๆ ที่สำคัญกลิ่นของของรัมลูกเกดก็ชัดเจน เป็นอีกรสชาติที่ทั้งอร่อยและมีเอกลักษณ์ และค่อนข้างถูกปากผู้ใหญ่ นอกจากโตเกียวบานาน่า คิทแคทรสนี้ก็เป็นอีกของฝากที่น่าสนใจ นอกจากอร่อยแพคเกจยังดูดีอีกด้วย\r\n', 864, 1),
(5, 'Kitkat X Tokyo Banana', 'Kitkat X Tokyo Banana รสชาติพิเศษที่ได้รวมเอารสชาติของขนมเด็ดของญี่ปุ่นที่ทุกคนต้องซื้ออย่าง คิทแคท และโตเกียวบานาน่าไว้ด้วยกัน ซึ่งขอบอกว่าทำได้ดี หอมช็อกโกเลตพร้อมกลิ่นอันเป็นเอกลักษณ์ของโตเกียวบานาน่า ซื้อกินเองก็ใช่ เป็นของฝากก็เริ่ดเพราะขอบอกเลยว่ายืนหนึ่งเรื่องแพคเกจ น่าประทับใจสุดๆ', 702, 0),
(6, 'Kitkat Umechu Tsuruume', 'นอกจากสาเกแล้ว เหล้าบ๊วยก็เป็นอีกซิกเนเจอร์ของญี่ปุ่นที่ผู้คนนั้นต่างชื่นชอบ คิทแคทจึงนำเอารสชาติที่สดชื่นนี้มาผสานออกมาเป็น Kitkat Umechu Tsuruume เลือกสูตรเหล้าบ๊วยที่พอดี มีความเปรี้ยวของบ๊วย เข้ากันดีกับช็อกโกแลต เป็นอีกหนึ่งของฝากที่เหมาะกับผู้ใหญ่ ถึงเป็นคิทแคท แต่ก็ไม่เด็กนะ', 756, 1),
(7, 'KITKAT Azuki and Strawberry (Hokkaido)\r\n', 'KITKAT Azuki and Strawberry รสชาติประจำฮอกไกโด ออกแบบให้ได้ฟีลแป้งอังโกะสอดไส้ถั่วแดงอะซุกิ และสตรอเบอร์รี่ที่เป็นของขึ้นชื่อของภูมิภาค ได้รสชาติกลมกล่อมให้คุณรู้ว่ามาถึงฮอกไกโดแล้ว\r\n', 864, 1),
(8, 'KitKat Tochi-otome (Tochigi)\r\n', 'KitKat Tochi-otome คิทแคทประจำจังหวัดโทชิกิ แห่งภูมิภาคคันโต โทชิโอโตเมะเป็นพันธุ์สตรอว์เบอรี่ที่มีชื่อเสียงของจังหวัดโทชิกิ อร่อยกับเวเฟอร์กรอบเคลือบรสสตรอเบอรี่หวานนุ่มนวล เป็นของฝากที่เด็ดมากและอร่อยมากๆ\r\n', 864, 0),
(9, 'KitKat Strawberry Cheese Cake (Yokohama)\r\n', 'KitKat Strawberry Cheese Cake ประจำจังหวัดโยโกฮาม่า ภูมิภาคคันโต ถึงแม้จะเป็นรส Strawberry Cheese Cake แต่ก็มีสูตรที่แตกต่างกับของฟูจิซัง มาจากรสชาติขนมยอดนิยมของโยโกฮาม่า\r\n', 864, 2),
(10, 'KitKat Shinshu apples –(Shinshu)\r\n', 'KitKat Shinshu apples เป็นรสประจำชินชู อันเป็นชื่อเก่าของแถบนากาโน่ รสแอบเปิ้ลที่หอมอร่อยเป็นเอกลักษณ์ผสมผสานกับช็อกโกแลตหวานละมุนเคลือบเวเฟอร์ เป็นรสชาติลงตัวที่ไม่ควรพลาด\r\n', 864, 1),
(11, 'KitKat Tamaru yahonten wasabi (Shizuoka)\r\n', 'ใครที่ชอบรสชาติที่แปลกใหม่ Tamaru yahonten wasabi กล่องนี้ต้องถูกใจ ได้แรงบันดาลใจจากวาซาบิ ของ Tamaruya ที่เป็นของเลี่ยงชื่อของจังหวัดชิซูโอกะ ภูมิภาคคันโต ได้กลิ่นรสที่เข้ากันกับไวท์ช็อกโกแลต\r\n', 864, 0),
(12, 'KitKat Azuki sandwich  (Tokai , Hokuriku)\r\n', 'คิทแคทรสนี้ได้แรงบันดาลใจมาจาก Ogura Toast หรือแซนวิซถั่วแดงที่เป็นเมนูผสมพผสานความเป็นญี่ปุ่นและตะวันตกที่ลงตัวได้เป็น Azuki sandwich รสชาติประจำภูมิภาค Tokai และ Hokuriku\r\n', 864, 0),
(13, 'KitKat Kyuemon Ito Uji Matcha (Kyoto)\r\n', 'อูจิมัทฉะ ชาเขียวที่เลื่องชื่อเป็นรสพิเศษประจำจังหวัดเกียวโตแห่งภูมิภาคคันไซ กลิ่นหอมอันเป็นเอกลักษณ์ เข้ากันดีกับไวท์ช็อกโกแลตได้รสหอมหวาน ขมติดปลายลิ้นที่ไม่ควรพลาด\r\n', 864, 0),
(14, 'KitKat Kyuemon Ito Uji Hojicha (Kyoto)\r\n', 'ยังคงอยู่กับของฝากประจำเกียวโต Kyuemon Ito Uji Hojicha รสชาโฮจิฉะ สำหรับใครที่ชอบรสชาติชาคั่ว กลิ่นหอมอันเป็นเอกลักษณ์ เข้ากันอย่างลงตัวกับไวท์ช็อกโกแลตที่เคลือบเวเฟอร์\r\n', 864, 5),
(15, 'KitKat Kobe Pudding (Kobe)\r\n', 'KitKat Kobe Pudding มาจากรสชาติพุดดิ้งยอดนิยมของเมืองโกเบ จังหวัดเฮียวโงะ ในภูมิภาคคันไซ ใครชอบพุดดิ้งต้องเลิฟ กัดแล้วใช่เลย\r\n', 864, 0),
(16, 'KitKat Momiji bun (Hiroshima)\r\n', 'KitKat Momiji bun รส “โมมิจิมันจู” เป็นขนมที่เป็นตัวแทนของจังหวัดฮิโรชิม่า รสชาติที่กลมกลืนกลมกล่อมของแป้งที่เป็นเอกลักษณ์ จาก ทาคัตสึโดะ ได้รสชาติที่เป็นอัตลักษณ์ผ่านขนมที่กินง่ายๆ อย่างคิทแคท\r\n', 864, 0),
(17, 'KitKat Amaou strawberry (Kyushu)\r\n', 'KitKat Amaou strawberry จากสตรอเบอรี่สายพันธุ์อามาโอะที่ขึ้นชื่อของเกาะคิวชู เข้ากับไวท์ช็อกโกแลตกลมกล่อม เคลือบเวเฟอร์ได้เป็นรสชาติที่หวานละมุนไม่ควรพลาด\r\n', 864, 0),
(18, 'KITKAT beniimo (Kyushu , Okinawa)\r\n', 'มันม่วงญี่ปุ่นเป็นอีกหนึ่งของดีที่ใครๆ ก็ถูกใจ แบ่งความอร่อยให้คนทางบ้านง่ายๆด้วยคิทแคท beniimo ของดีแห่งโอกินาว่าและคิวชูที่ขึ้นชื่อเรื่องความอร่อยแปรรูปเป็นขนมหวานที่คงเอกลักษณ์ได้เป็นอย่างดี รสชาติที่ใครก็ติดใจ\r\n', 864, 0),
(19, 'KITKAT Mont Blanc (ฤดูใบไม้ร่วง)\r\n', 'เกาลัดคือผลไม้ที่ชุกชุมในฤดูใบไม้ร่วงของญี่ปุ่น การมาของรสมองบลังค์ ขนมฝรั่งเศสแสนอร่อย จึงเป็นที่รอคอยของหลายคน รสชาติที่หวานละมุน รับรองว่าต้องถูกใจ\r\n', 800, 0),
(20, 'KitKat Sakura (ฤดูใบไม้ผลิ)\r\n', 'ซากุระเป็นสัญลักษณ์ของฤดูใบไม้ผลิ ดังนั้น KitKat Sakura จึงเป็นอีกรสที่ทุกคนรอคอย กลิ่นหอมอ่อนๆ เข้ากับไวท์ช็อกโกแลตให้ความสดชื่น ซึ่งในแต่ละปีแพคเก็จก็จะเปลี่ยนไป มีเสน่ห์มากๆ\r\n', 854, 3),
(21, 'KitKat Chocolate Mint (ฤดูร้อน)\r\n', 'ช็อกโกแลตมิ้น จะว่าเป็นรสชาติแห่งฤดูร้อนของญี่ปุ่นก็ไม่ผิด เพราะมิ้นที่เย็นชื่นใจ ช่วยดับความร้อนได้เป็นอย่างดี แถมความเป็นช็อกโกแลตมิ้นก็เข้ากับคิทแคทมากๆ เป็นอีกหนึ่งรสที่อยากแนะนำแก่สาวกช็อกมิ้น\r\n', 765, 0),
(22, 'KitKat mini peach parfait  (ฤดูร้อน)\r\n', 'พีช ผลไม้หน้าร้อนที่ขึ้นชื่อของญี่ปุ่น คิทแคทรสพีชเลยเป็นอะไรที่เปรี้ยว หวาน สดชื่น เข้ากับคิืทแคทมากๆ\r\n', 890, 0),
(23, 'KitKat Summer Mango (ฤดูร้อน)\r\n', 'ใครชอบมะม่วง อยากกินคิทแคมรสมะม่วง ต้องมาเที่ยวญี่ปุ่นตอนฤดูร้อน บอกเลยว่าอร่อยสดชื่นสุดๆ\r\n', 765, 0),
(24, 'KitKat Bake Pudding\r\n', 'KitKat Bake Pudding รสพุดดิ้งอบ ความพิเศษของรสนี้คือสามารถนำเข้าอบแล้วจะได้แท็กเจอร์กรุบ ที่ทำให้อร่อยยิ่งขึ้น เป็นอีกรสที่ไม่ควรพลาด\r\n', 870, 0),
(25, 'KitKat Chocolatery sublime Ruby\r\n', 'KitKat Chocolatery sublime Ruby รสชาติที่ผสมผสานกันอย่างลงตัวของทับทิม และช็อกโกแล็ตชั้นดี ได้รสชาติสดชื่นเต็มคำ\r\n', 432, 0),
(26, 'KitKat sublime Volcanic Set\r\n', 'เซต KitKat sublime Volcanic Set เรียกได้ว่ารวมรสพรีเมียม ทั้ง ทับทิม ไวท์ช็อกโกแลต ดาร์กช็อกโกแล็ต มิลค์ช็อกโกแลต และรสโกโก้จากแนวภูเขาไฟ วานูอาตู นิวกินี และฟิลิปปิน เหมาะกับใครที่ไม่ชอบอะไรที่ซ้ำซากรับรองว่าตอบโจทย์\r\n', 987, 0),
(27, 'เซตรวมรสพรีเมี่ยม ทั่วญี่ปุ่น\r\n', 'ใครที่อยากชิมทุกรสในคราวเดียวล่ะก็ เราแนะนำเซ็ตนี้เพราะรวมรสของดีตามภูมอภาค รสผลไม้ของญี่ปุ่น และเซ็ตพรีเมี่ยม จัดเต็มชุดใหญ่ไฟกระพริบ สะใจทุกรสชาติ จัดเป็นของฝากก็ว้าวสุดๆ\r\n', 975, 0),
(28, 'เซ็ตรวมรสพรีเมี่ยม ผลไม้\r\n', 'อีกเซ็ตที่รวมรสน่าสนใจของ KitKat Chocolatery มีทั้งรสพรีเมียม และรสผลไม้แสนอร่อยของญี่ปุ่น และ รสพิเศษ เหมาะเป็นของฝากมากๆ\r\n', 885, 1),
(29, 'KitKat Chocolatery sublime Matcha\r\n', 'แฟนชาเขียวต้องลิ้มลอง KitKat Chocolatery sublime Matcha ผงมัทฉะชั้นดีของเกียวโต ผสานรสชาติไวท์ช็อกโกแลตพรีเมี่ยมละมุนลิ้น\r\n', 856, 0),
(30, 'KitKat Chocolatery Moreson\r\n', 'KitKat Chocolatery Moreson ชิ้นใหญ่จัดเต็ม พร้อมท็อปปิ้งอัลมอนและผลไม้แห้งกรุบกรอบอร่อยลิ้น\r\n', 856, 0),
(31, ' Hokkaido Red Bean KitKat\r\n', 'แม้ถั่วแดงเรากินกันบ่อยยังไม่ถือว่าแปลกเท่าไร แต่รสถั่วแดงจากฮอกไกโดก็อร่อยไม่ธรรมดาได้กลิ่นและรสถั่วแดงเน้นๆ\r\n', 765, 1),
(32, 'Kyoto Matcha KitKat\r\n', 'ถึงชาเขียวจะเป็นรสสุดคลาสสิค แต่ชาเขียวสูตรเกียวโตก็เข้มข้นถูกใจไม่หยอก แม้จะแยกไม่ค่อยออกจากรสชาเขียวแบบปกติก็ตาม\r\n', 896, 0),
(33, 'Kyoto Houjicha KitKat\r\n', 'คิทแคทรส Houjicha หรือชาคั่วนี่เวิร์คมากๆ กลิ่นชาหอมกรุ่น รสอ่อนๆ ไม่ได้เข้มข้นจนเกินไป และแน่นอนว่ารสนี้ใช้ชาคั่วที่มาจากเกียวโตโดยเฉพาะ\r\n', 657, 0),
(34, 'Nagano Shinshu Apple KitKat\r\n', 'นากาโนะเป็นเมืองที่ขึ้นชื่อว่าปลูกแอปเปิ้ลได้อร่อยที่สุดในญี่ปุ่น จึงไม่น่าแปลกเลยว่ารสประจำจังหวัดจะเป็นรสแอปเปิ้ลที่หอมหวานอร่อยถูกใจไม่มีใครที่จะไม่ชอบ\r\n', 765, 0),
(35, 'Chugoku Shikoku Kankitsu Ogon Blend KitKat\r\n', 'โอ๊ย รสนี้คือดีงาม ชอบมาก (อีกแล้ว) รสมะนาว เลมอน ส้ม รวมสามผลไม้รสเปรี้ยวไว้ด้วยกัน ทำรสชาติออกมาได้อมเปรี้ยวอมหวานเหมือนประมาณ Orange creamsicle เหมาะเจาะมากๆ เป็นรสพิเศษของเขต Chugoku Shikoku\r\n', 886, 0),
(36, 'Shinshu Yawatayaisogoro Ichimi KitKat \r\n', 'รสพริกญี่ปุ่นนี่สิแปลกจริง แต่แปลกในทางที่ดีนะคะ เพราะใครจะไปนึกว่าพริกเผ็ดๆ จะเข้ากันกับรสช็อกโกแลตเข้มๆ ได้ดีขนาดนี้\r\n', 954, 0),
(37, ' Spring-time Sakura Matcha KitKat\r\n', 'อีกหนึ่งรสที่ชอบสุดๆ เพราะหอมหวาน ได้รสชาเขียวกับกลิ่นซากุระ ละลายไปกับรสไวท์ช็อกโกแลตนุ่มนวลชวนฝัน ถือเป็นรสชาติฤดูใบไม้ผลิที่มาพร้อมกับดอกซากุระที่บานสะพรั่ง\r\n', 865, 0),
(38, 'Pumpukin Pudding Flavor KitKat\r\n', 'อีกหนึ่งรสพุดดิ้งแต่เพิ่มรสพิเศษด้วยฟักทอง ที่เข้ากันสุดๆ กับเทศกาล Halloween และ packaging แสนน่ารัก ให้คุณ trick or treat กันอย่างสนุกสนาน\r\n', 756, 0),
(39, 'KitKat \"Sublime\" White & KitKat \"Sublime\" Rasberry\r\n', 'ไวท์ช็อกเข้มข้นหวานมัน และราสพ์เบอร์รี่ดาร์กช็อกโกแลต ที่ความขมเจอกับความเปรี้ยว สองรสสุดหรู (และแพง) ที่จะให้คุณได้ปลื้มกับความอร่อยที่หาซื้อกันไม่ได้ง่ายๆ\r\n', 1000, 0),
(40, 'KitKat Chocolatory Special Ginger & KitKat Chocolatory Special Plum (Ume)\r\n', 'รสขิงเผ็ดร้อนและรสบ๊วยญี่ปุ่น (Ume) ที่หายาก อร่อยฟินสุด\r\n', 965, 0),
(41, 'KitKat Green Tea\r\n', 'ตัวนี้เป็นรสชาเขียวของไทย รสชาติหอม ละมุน ได้กลิ่นชาเขียวชัดเจน แต่อาจติดหวานไปนิดเมื่อเทียบกับของญี่ปุ่น เนื้อสัมผัสดี ช็อกโกแลตหวาน ๆ เคลือบเวเฟอร์กรุบกรอบ ตัวนี้จะเป็นคิทแคทแบบ 2 บาร์ แบ่งทานได้ง่าย\r\n', 876, 0),
(42, 'KitKat - Cookies & Cream\r\n', 'ไม่หวานจนเกินไป ยิ่งแช่เย็นยิ่งอร่อย\r\n', 865, 0),
(43, 'KitKat White Chocolate \r\n', 'ไวท์ช็อกอร่อย ๆ เคลือบเวเฟอร์กรอบ ๆ เป็นรสที่หลาย ๆ คนบอกว่าอร่อยมาก ๆ ความหวานหอมของไวท์ช็อกตัดกันได้อย่างพอดีกับชั้นของเวเฟอร์ด้านใน รสชาตินุ่มละมุน มีความเป็นนมมากกว่าตัวอื่น ๆ หากใครที่อยากเพิ่มความอร่อยแนะนำว่าให้แช่ตู้เย็นก่อนทาน บอกเลยว่าฟินสุด ๆ\r\n', 897, 0),
(44, 'Tokyo Banana x KitKat Gold\r\n', 'เป็นการผสานคาราเมลเข้มข้นและกล้วยหอมจากโตเกียวบานาน่าเข้ากับไวท์ช็อกโกแลต เกิดเป็นช็อกโกแลตบาร์มาในเนื้อสัมผัสกรุบกรอบสุดคลาสสิกพร้อมกลิ่นหอมคาราเมลและกล้วย \r\n', 985, 0),
(45, 'KITKAT MINI PASSION FRUIT FLAVOUR \r\n', 'ผลิตขึ้นมาเพื่อส่งต่อ \"Passion\" ให้….นักเรียนที่กำลังเตรียมสอบโดยเฉพาะ  Kitkat Mini Passion Fruits ใช้ส่วนผสม White Chocolate ชั้นดี ผสมเข้ากับครีมเสาวรสแล้วนำไปเคลือบเวเฟอร์อบกรอบ ทำให้ทุกคำเพลิดเพลินไปกับรสชาติของเสาวรสที่หวานอมเปรี้ยว หอม สดชื่น เป็นเอกลักษณ์\r\n', 876, 0),
(46, 'KitKat Mini Zunda Green Bean  (Sendai) \r\n', 'มาถึงรสชาติแบบญี่ปุ่น ซึ่งจินตนาการรสชาติไม่ค่อยออก แต่ได้รับความนิยมจนต้องลอง KitKat Zunda คิทแคทรสถั่วแระญี่ปุ่นบด จะอร่อยแค่ไหนต้องลองเอง\r\n', 689, 0),
(47, 'KitKat Mini Redbean Sandwich (Tōkai and Hokuriku)\r\n', 'คิทแคทแซนวิชขนมปังอบไส้ถั่วแดง ได้รสหอมหวานของถั่วแดงเต็มๆ ใครชอบทานถั่วแดงกวนแบบญี่ปุ่นต้องไม่พลาด\r\n', 876, 0),
(48, 'KitKat Mini Kankitsu Kogane Golden Citrus Blend  (Chugoku,Shikoku)\r\n', 'ตัดรสเปรี้ยวหวานลงตัว ด้วยความเปรี้ยวของส้มและเลมอน ที่ผสานรสเข้ากับความหวานของไวท์ช็อคโกแลต\r\n', 976, 0),
(49, '.KitKat Mini Shogoin Yatsubashi (Kyoto) \r\n', 'รสขนมยัทสึฮาชิ ที่คล้ายกับขนมเบื้อง มีส่วนผสมของแป้งข้าวเจ้า น้ำตาล และอบเชย แค่เปิดซองก็จะได้กลิ่น cinnamon หอมๆ ยั่วน้ำลาย\r\n', 658, 0),
(50, 'KitKat Mini whole grain biscuits \r\n', 'ช็อกโกแลตผสมข้าวสาลีหอม ๆ ที่นำไปเคลือบเวเฟอร์กรอบ ๆ รสชาติหอมมัน อร่อย เหมาะสำหรับผู้ที่ไม่ชอบทานช็อกโกแลตที่หวานมาก เพราะตัวนี้เป็นสูตรโฮลวีต แคลอรี่ต่ำ ใส่น้ำตาลน้อยกว่าแบบปกติ\r\n', 765, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`detail_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
