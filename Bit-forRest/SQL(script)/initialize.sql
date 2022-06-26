-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.9-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- forrest 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `forrest` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `forrest`;

-- 테이블 forrest.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `boardNo` int(11) NOT NULL AUTO_INCREMENT,
  `boardTitle` varchar(500) NOT NULL DEFAULT '',
  `boardDetail` varchar(5000) NOT NULL DEFAULT '',
  `boardDate` datetime NOT NULL DEFAULT current_timestamp(),
  `boardPin` int(11) DEFAULT 0,
  `boardFlag` varchar(2) NOT NULL,
  `category` varchar(10) DEFAULT NULL,
  `couponURL` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`boardNo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- 테이블 데이터 forrest.board:~7 rows (대략적) 내보내기
DELETE FROM `board`;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` (`boardNo`, `boardTitle`, `boardDetail`, `boardDate`, `boardPin`, `boardFlag`, `category`, `couponURL`) VALUES
	(5, '장비 보관은 어떻게 하나요?', '보관하기 힘든 캠핑 장비들을 보관신청 해주시면 저희가 직접 픽업부터 창고에 보관까지 서비스 합니다. 제품이 창고에 도착하면 창고 촬영한 사진이 업로드 됩니다. 장비 보관 신청은 장비보관 탭에서 시작하기를 눌러 신청해주세요.', '2022-06-02 11:37:35', 0, 'F', '이용방법', NULL),
	(6, '장비 대여는 어떻게 하나요?', '렌탈 마켓에서 현재 Forrest 에서 대여 중인 상품을 확인 하실 수 있습니다. 제품은 직접 배송해 드리고 대여가 완료 되면 요청하신 장소로 픽업가는 서비스까지 제공하고 있습니다. 최대 4박5일까지 대여 가능합니다.', '2022-06-02 11:37:36', 0, 'F', '이용방법', NULL),
	(7, '중고 거래는 어떻게 이뤄지나요?', '중고 마켓에서 마음에 드는 상품이 있다면 상세보기 페이지에서 판매자와 대화를 할 수 있습니다. 판매자와 거래장소를 정하고 직접 거래 하실 수 있습니다.', '2022-06-02 11:37:37', 0, 'F', '결제관련', NULL),
	(8, '대여 수익은 어떻게 발생하나요?', '내가 보관한 물건을 대여 가능하도록 설정해주세요. 누군가 내가 보관한 물건을 빌려서 쓰면 설정해주신 대여료의 일부를 환급해 드립니다. 대여수익은 내 정보 보기에서 확인이 가능합니다.', '2022-06-02 11:37:38', 0, 'F', '계정', NULL),
	(9, '환불 관련 정책', '장비 보관 혹은 장비 대여시 픽업 서비스가 시작되기 전까지 환불이 가능합니다. 마이페이지 내 보관 / 대여 물품 페이지에서 환불을 신청 할 수 있습니다.', '2022-06-02 11:37:38', 0, 'F', '계정', NULL),
	(10, '패밀리 캠핑! 가정의 달 맞이 이벤트~ 다양한 혜택받고 행복한 추억 만드세요~!(5/30까지)', '', '2022-06-22 18:01:20', 0, 'A', NULL, 'ㅁㄴㅇㄴㅁㅇ'),
	(11, '무조건 드리는 신규회원쿠폰! 5월 신규회원 혜택이 팡팡!', '', '2022-06-22 18:17:45', 1, 'A', NULL, 'ㅁㄴㄹㄴㅁㅇㄹㅇㄴㅁㄹ');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 forrest.chat 구조 내보내기
CREATE TABLE IF NOT EXISTS `chat` (
  `chatMessageNo` int(11) NOT NULL AUTO_INCREMENT,
  `chatRoomNo` int(11) NOT NULL,
  `sendUserId` varchar(30) NOT NULL,
  `chatMessage` varchar(4000) NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `readOrNot` tinyint(1) DEFAULT 1,
  `fileName` varchar(4000) DEFAULT NULL,
  `map` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`map`)),
  PRIMARY KEY (`chatMessageNo`),
  KEY `chatRoomNo` (`chatRoomNo`),
  KEY `sendUserId` (`sendUserId`),
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`chatRoomNo`) REFERENCES `chatroom` (`chatRoomNo`) ON DELETE CASCADE,
  CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`sendUserId`) REFERENCES `user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- 테이블 데이터 forrest.chat:~10 rows (대략적) 내보내기
DELETE FROM `chat`;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` (`chatMessageNo`, `chatRoomNo`, `sendUserId`, `chatMessage`, `createdAt`, `readOrNot`, `fileName`, `map`) VALUES
	(62, 8, 'kedee2001@naver.com', '123', '2022-06-23 10:53:59', NULL, NULL, NULL),
	(63, 8, 'kedee2001@naver.com', ',l,l', '2022-06-23 10:54:02', NULL, NULL, NULL),
	(64, 9, 'user01@naver.com', 'ㅇ3ㅇ??', '2022-06-24 05:23:11', NULL, NULL, NULL),
	(65, 8, 'user01@naver.com', '에에', '2022-06-24 05:23:34', NULL, NULL, NULL),
	(66, 9, 'user01@naver.com', '흠', '2022-06-24 05:23:59', NULL, NULL, NULL),
	(67, 10, 'admin', 'sadsada', '2022-06-24 07:17:50', 1, NULL, NULL),
	(68, 8, 'user01@naver.com', '지도 : 강남역 2호선', '2022-06-24 07:35:41', NULL, NULL, '{"address_name":"서울 강남구 역삼동 858","category_group_code":"SW8","category_group_name":"지하철역","category_name":"교통,수송 > 지하철,전철 > 수도권2호선","distance":"","id":"21160803","phone":"02-6110-2221","place_name":"강남역 2호선","place_url":"http://place.map.kakao.com/21160803","road_address_name":"서울 강남구 강남대로 지하 396","x":"127.02800140627488","y":"37.49808633653005"}'),
	(69, 8, 'user01@naver.com', '지도 : 강남역 2호선', '2022-06-24 07:35:42', NULL, NULL, '{"address_name":"서울 강남구 역삼동 858","category_group_code":"SW8","category_group_name":"지하철역","category_name":"교통,수송 > 지하철,전철 > 수도권2호선","distance":"","id":"21160803","phone":"02-6110-2221","place_name":"강남역 2호선","place_url":"http://place.map.kakao.com/21160803","road_address_name":"서울 강남구 강남대로 지하 396","x":"127.02800140627488","y":"37.49808633653005"}'),
	(71, 9, 'user01@naver.com', '아직 판매하시나요?', '2022-06-24 10:20:23', NULL, NULL, NULL),
	(72, 9, 'admin', '네 그럼요!', '2022-06-24 10:51:12', NULL, NULL, NULL);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;

-- 테이블 forrest.chatroom 구조 내보내기
CREATE TABLE IF NOT EXISTS `chatroom` (
  `chatRoomNo` int(11) NOT NULL AUTO_INCREMENT,
  `oldNo` varchar(40) DEFAULT NULL,
  `prodNo` varchar(40) DEFAULT NULL,
  `inquireUserId` varchar(30) NOT NULL,
  `ownerUserId` varchar(30) NOT NULL,
  `inquireUserExit` tinyint(1) DEFAULT 0,
  `ownerUserExit` tinyint(1) DEFAULT 0,
  `createdAt` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`chatRoomNo`),
  KEY `oldNo` (`oldNo`),
  KEY `prodNo` (`prodNo`),
  KEY `inquireUserId` (`inquireUserId`),
  KEY `ownerUserId` (`ownerUserId`),
  CONSTRAINT `chatroom_ibfk_1` FOREIGN KEY (`oldNo`) REFERENCES `old` (`oldNo`) ON DELETE CASCADE,
  CONSTRAINT `chatroom_ibfk_2` FOREIGN KEY (`prodNo`) REFERENCES `product` (`prodNo`) ON DELETE CASCADE,
  CONSTRAINT `chatroom_ibfk_3` FOREIGN KEY (`inquireUserId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `chatroom_ibfk_4` FOREIGN KEY (`ownerUserId`) REFERENCES `user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- 테이블 데이터 forrest.chatroom:~5 rows (대략적) 내보내기
DELETE FROM `chatroom`;
/*!40000 ALTER TABLE `chatroom` DISABLE KEYS */;
INSERT INTO `chatroom` (`chatRoomNo`, `oldNo`, `prodNo`, `inquireUserId`, `ownerUserId`, `inquireUserExit`, `ownerUserExit`, `createdAt`) VALUES
	(7, 'a4bde7a7-c0dc-4734-9aa6-1c2cd769b6d8', NULL, 'kedee2001@naver.com', 'user01@naver.com', 0, 0, '2022-06-23 10:46:14'),
	(8, 'fecb1f75-15b2-4ca6-a105-32a1ba628fce', NULL, 'kedee2001@naver.com', 'user01@naver.com', 1, 1, '2022-06-23 10:51:12'),
	(9, 'ea5668d7-ad6e-4f09-8719-474876e6cad4', NULL, 'user01@naver.com', 'admin', 1, 1, '2022-06-24 05:22:57'),
	(10, 'f215ff49-27a8-49ba-ac01-9ef27bfb02fe', NULL, 'admin', 'captain9697@naver.com', 1, 1, '2022-06-24 07:17:47'),
	(11, '48314086-6371-4cbf-8a16-c0495771f046', NULL, 'sanstory12rt@naver.com', 'user01@naver.com', 0, 0, '2022-06-24 08:38:48');
/*!40000 ALTER TABLE `chatroom` ENABLE KEYS */;

-- 테이블 forrest.coupon 구조 내보내기
CREATE TABLE IF NOT EXISTS `coupon` (
  `couponNo` varchar(50) NOT NULL,
  `couponName` varchar(50) NOT NULL,
  `couponCreDate` datetime DEFAULT NULL,
  `couponDelDate` datetime DEFAULT NULL,
  `discount` double NOT NULL,
  PRIMARY KEY (`couponNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 forrest.coupon:~4 rows (대략적) 내보내기
DELETE FROM `coupon`;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` (`couponNo`, `couponName`, `couponCreDate`, `couponDelDate`, `discount`) VALUES
	('1', '[가정의달 5천원쿠폰]', '2022-06-01 00:00:00', '2022-12-31 00:00:00', 5000),
	('2', '[신규회원 1000원할인쿠폰]', NULL, NULL, 1000),
	('3', '[복귀회원 15%할인쿠폰]', NULL, NULL, 0.15),
	('4', '[개발자특전 80%할인쿠폰]', '2022-06-01 00:00:00', '2022-12-31 00:00:00', 0.8);
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;

-- 테이블 forrest.imgs 구조 내보내기
CREATE TABLE IF NOT EXISTS `imgs` (
  `imgNo` int(11) NOT NULL AUTO_INCREMENT,
  `contentsNo` varchar(80) DEFAULT NULL,
  `fileName` varchar(100) DEFAULT NULL,
  `contentsFlag` varchar(20) NOT NULL,
  PRIMARY KEY (`imgNo`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;

-- 테이블 데이터 forrest.imgs:~164 rows (대략적) 내보내기
DELETE FROM `imgs`;
/*!40000 ALTER TABLE `imgs` DISABLE KEYS */;
INSERT INTO `imgs` (`imgNo`, `contentsNo`, `fileName`, `contentsFlag`) VALUES
	(1, '52fb9c79-d83b-436a-b5be-5b27a6b13c33', '8af51708-419c-45d4-ba17-ecb5f6600e6c.jpg', 'product'),
	(2, '52fb9c79-d83b-436a-b5be-5b27a6b13c33', '0bfbbbb9-02f1-4a32-b4da-1c0a76294c23.jpg', 'product'),
	(3, '52fb9c79-d83b-436a-b5be-5b27a6b13c33', 'f92bd1df-806c-400f-9369-a45212575896.jpg', 'product'),
	(4, '52fb9c79-d83b-436a-b5be-5b27a6b13c33', '20653905-59e6-4d64-a8d2-aec69a23c7ea.jpg', 'product'),
	(5, '7374c5cb-e68b-4d65-84a9-013f0d1df57c', 'e54d899f-8a6c-4f49-bb89-8703196bf34b.jpg', 'product'),
	(6, '7374c5cb-e68b-4d65-84a9-013f0d1df57c', '3ee8ab40-c8d8-4212-8c3d-d2cfb3d8344b.jpg', 'product'),
	(7, '7374c5cb-e68b-4d65-84a9-013f0d1df57c', 'bebcc2e6-191d-4cd7-9324-8d2dcf5c4187.jpg', 'product'),
	(8, '7374c5cb-e68b-4d65-84a9-013f0d1df57c', '415c04e6-17d2-4823-b053-8d78513301d6.jpg', 'product'),
	(9, '7374c5cb-e68b-4d65-84a9-013f0d1df57c', '1d483d25-e732-44fd-bf5b-b7ec6c83a32f.jpg', 'product'),
	(10, 'b37a6c88-8ec7-4d39-9e6b-8474e3376fce', '2b35cd5b-2680-4f81-8db9-17090645c038.jpg', 'product'),
	(11, 'b37a6c88-8ec7-4d39-9e6b-8474e3376fce', '406cee59-20f5-40bc-af9d-de944f4454a1.jpg', 'product'),
	(12, 'b37a6c88-8ec7-4d39-9e6b-8474e3376fce', '9afc243e-db93-4637-955c-49bd1ff267ec.jpg', 'product'),
	(13, 'b37a6c88-8ec7-4d39-9e6b-8474e3376fce', '863e6029-7b7b-46c4-af99-afe977cb1a53.jpg', 'product'),
	(14, 'b37a6c88-8ec7-4d39-9e6b-8474e3376fce', '041724c6-1272-4e41-bc23-daec6c2d68ca.jpg', 'product'),
	(15, '10', '1b4872a8-df20-4631-ad73-696c6331a323.jpg', 'announce'),
	(16, '11', 'bf5ec4d3-5f81-49dc-a454-8ebc0010404d.jfif', 'announce'),
	(17, '6f7022e3-ec24-4b48-96de-acf11aaaf12b', '2d190517-8304-4a34-beab-23e7d3b31af2.jpg', 'old'),
	(18, '6f7022e3-ec24-4b48-96de-acf11aaaf12b', 'fde2604b-6261-4cdf-9eeb-688b3fc2e86a.jpg', 'old'),
	(19, '6f7022e3-ec24-4b48-96de-acf11aaaf12b', '9ce2c7cd-0268-42f5-8c28-36586c02fee1.jpg', 'old'),
	(20, '6f7022e3-ec24-4b48-96de-acf11aaaf12b', 'a0da642a-22d4-4f0e-af8c-8734a58b9006.jpg', 'old'),
	(21, 'a4bde7a7-c0dc-4734-9aa6-1c2cd769b6d8', '9ab1853e-4b67-4bd2-9ee2-b1ff4d7b4398.jpg', 'old'),
	(22, 'a4bde7a7-c0dc-4734-9aa6-1c2cd769b6d8', 'cd2be5c3-42d9-4de5-846e-f32e1144851e.jpg', 'old'),
	(23, 'a4bde7a7-c0dc-4734-9aa6-1c2cd769b6d8', 'c69e4784-dba2-423c-8839-b7f4841674bc.jpg', 'old'),
	(24, 'a4bde7a7-c0dc-4734-9aa6-1c2cd769b6d8', 'a0f7c24a-6236-4c48-b13a-6648966f5ba4.jpg', 'old'),
	(25, 'fecb1f75-15b2-4ca6-a105-32a1ba628fce', 'b50b7c22-c12a-4896-9aa8-4b9ac6deed42.jpg', 'old'),
	(26, 'fecb1f75-15b2-4ca6-a105-32a1ba628fce', '9106a2b1-e929-45a0-aa98-353ec4b8ff3b.jpg', 'old'),
	(27, 'fecb1f75-15b2-4ca6-a105-32a1ba628fce', 'f597e3bd-3997-4970-a91e-25cf2c430350.jpg', 'old'),
	(28, 'fecb1f75-15b2-4ca6-a105-32a1ba628fce', '83c8ce90-fb90-47ec-84be-75d818ab06ba.jpg', 'old'),
	(29, '48314086-6371-4cbf-8a16-c0495771f046', '098af6ee-f658-4873-877e-3bc8e2095a58.jpg', 'old'),
	(30, '48314086-6371-4cbf-8a16-c0495771f046', '6244835a-b366-45dd-84ab-c00a0f2214e1.jpg', 'old'),
	(31, '48314086-6371-4cbf-8a16-c0495771f046', '0617a0f7-5b7a-46c8-9838-320de2aa5737.PNG', 'old'),
	(32, '48314086-6371-4cbf-8a16-c0495771f046', 'c4505803-94a9-43dd-a24a-2a24faa3fed2.jpg', 'old'),
	(33, 'ea5668d7-ad6e-4f09-8719-474876e6cad4', '2638800c-6535-4ab8-b052-d5c7ee82b180.jpg', 'old'),
	(34, 'ea5668d7-ad6e-4f09-8719-474876e6cad4', '53a5147c-44bf-4b35-8580-eba4dfdd3b69.jpg', 'old'),
	(35, 'ea5668d7-ad6e-4f09-8719-474876e6cad4', '20b0eff3-f7b9-4ccb-b6c9-7001e1a9abbc.jpg', 'old'),
	(36, 'ea5668d7-ad6e-4f09-8719-474876e6cad4', '63eec621-9f76-4c52-b303-8c74691ba29f.jpg', 'old'),
	(37, '5643ddbf-60fd-44b1-add6-8d7548357c7b', '99b4ecd1-ebba-42db-b936-f646060a04d1.jpg', 'old'),
	(38, '5643ddbf-60fd-44b1-add6-8d7548357c7b', 'cd91d1d2-2596-4787-937c-f655124188d8.jpg', 'old'),
	(39, '5643ddbf-60fd-44b1-add6-8d7548357c7b', '98ba452a-6d85-436f-8e5a-56ee54528e51.jpg', 'old'),
	(40, '5643ddbf-60fd-44b1-add6-8d7548357c7b', 'c6394234-0d68-4d7a-858e-7530b3167ab7.jpg', 'old'),
	(41, 'l', '1.jpg', 'product'),
	(42, 'l', '2.jpg', 'product'),
	(43, 'l', '3.jpg', 'product'),
	(44, 'l', '4.jpg', 'product'),
	(47, 'df9d73df-8b33-4fd3-99b9-b2e43784ca0a', 'c42c8bc7-1e4b-4b15-a6b3-67bb0fabe77f.gif', 'old'),
	(48, 'df9d73df-8b33-4fd3-99b9-b2e43784ca0a', '893861ee-9199-4375-90b7-4232e71a2571.jpg', 'old'),
	(49, 'df9d73df-8b33-4fd3-99b9-b2e43784ca0a', '816e009e-ab46-484d-971a-682ae3e4759c.webp', 'old'),
	(50, 'df9d73df-8b33-4fd3-99b9-b2e43784ca0a', '661a5d11-9e71-4b32-9ed5-7be9e5d0191f.jpg', 'old'),
	(51, 'f215ff49-27a8-49ba-ac01-9ef27bfb02fe', 'ede4e20d-5403-4df4-a65d-fef902425730.webp', 'old'),
	(52, 'f215ff49-27a8-49ba-ac01-9ef27bfb02fe', '27fd13af-e215-4fe5-b59a-829e984c4964.webp', 'old'),
	(53, 'f215ff49-27a8-49ba-ac01-9ef27bfb02fe', 'fc979d10-e787-401a-ba08-971d1936597a.webp', 'old'),
	(54, 'f215ff49-27a8-49ba-ac01-9ef27bfb02fe', 'd16e9cce-8331-4792-9007-6fe7addcadcd.webp', 'old'),
	(55, '3d91e986-7a27-4c99-9d02-c7a7b56a2f6c', '2112c4de-b722-4761-9062-a8e0e1a458c7.webp', 'old'),
	(56, '3d91e986-7a27-4c99-9d02-c7a7b56a2f6c', 'd76c2f85-1bee-47e8-b5c0-a82b35f1a360.jpg', 'old'),
	(57, '3d91e986-7a27-4c99-9d02-c7a7b56a2f6c', '8d389324-a8fa-48d5-bb4b-b5b246f8e784.jpg', 'old'),
	(58, '3d91e986-7a27-4c99-9d02-c7a7b56a2f6c', '50029eb2-9fb5-4c4f-9dd2-27131566e992.jpg', 'old'),
	(59, 'ef4e0923-71a7-47ac-bc7e-f133da484fcf', 'de527e4a-15af-4a4b-9c32-9bab5221061e.webp', 'old'),
	(60, 'ef4e0923-71a7-47ac-bc7e-f133da484fcf', 'd363dbdb-1e6c-4f7f-9acb-b60421ce1443.webp', 'old'),
	(61, 'ef4e0923-71a7-47ac-bc7e-f133da484fcf', '72db73eb-b1ce-4dd8-a827-c6d54327aacc.jpg', 'old'),
	(62, 'ef4e0923-71a7-47ac-bc7e-f133da484fcf', '75564de8-5cca-4488-ac7e-24070394654e.jpg', 'old'),
	(63, '9113b67b-70eb-425b-ba35-36b4838b74b6', '32fef995-b239-48a2-9ad1-eb313b30bc98.webp', 'old'),
	(64, '9113b67b-70eb-425b-ba35-36b4838b74b6', '560c96bb-7455-4fad-b6d9-763ae354f8c1.webp', 'old'),
	(65, '9113b67b-70eb-425b-ba35-36b4838b74b6', '886ee2dd-d003-4046-a5a0-b563949314aa.webp', 'old'),
	(66, '9113b67b-70eb-425b-ba35-36b4838b74b6', '8797cf99-90bf-47a4-a9f4-80f332449a46.jpg', 'old'),
	(67, '15b74776-2033-4c01-9685-ed46aa6b937a', '31fb43d1-793d-4629-9c6e-05cbbdb73590.webp', 'product'),
	(68, '15b74776-2033-4c01-9685-ed46aa6b937a', 'b7b4d301-55b8-4f72-9c03-18566f6fca48.webp', 'product'),
	(69, '15b74776-2033-4c01-9685-ed46aa6b937a', 'a592d1eb-a2b3-48a8-9d71-4a4964027fa6.webp', 'product'),
	(70, '15b74776-2033-4c01-9685-ed46aa6b937a', '6e5ef4f8-19dd-469c-b583-9226e181c866.jfif', 'product'),
	(79, '921f14e2-f6ad-4db5-961c-2a21caa4bea2', '4a22dd61-c8db-40b8-afcd-1d7216196071.webp', 'product'),
	(80, '921f14e2-f6ad-4db5-961c-2a21caa4bea2', '0b78af94-14e5-474a-adab-81151299f107.jpg', 'product'),
	(81, '921f14e2-f6ad-4db5-961c-2a21caa4bea2', 'c984589d-1075-4b3b-9e09-511176dffc27.jpg', 'product'),
	(82, '921f14e2-f6ad-4db5-961c-2a21caa4bea2', '2e9d36b4-7471-4063-9cc5-0a85225d2195.jpg', 'product'),
	(83, 'a4ea7134-168b-4005-9dca-b0ac5d66c8bb', '942e74da-1389-45f5-b283-8504d098fb07.webp', 'product'),
	(84, 'a4ea7134-168b-4005-9dca-b0ac5d66c8bb', '18031edb-f5df-43ad-bed0-6883cb659915.webp', 'product'),
	(85, 'a4ea7134-168b-4005-9dca-b0ac5d66c8bb', '2013d58c-6c9d-45ba-94da-cc910816efc8.jpg', 'product'),
	(86, 'a4ea7134-168b-4005-9dca-b0ac5d66c8bb', '2d9d135d-be04-4267-9975-bc46d1aa6ab4.webp', 'product'),
	(87, '4a0ad7a7-8f0c-4900-8518-69c8c2a9c2aa', 'a1bdb845-cea3-4229-b0d3-77eadd70fc24.jpg', 'product'),
	(88, '4a0ad7a7-8f0c-4900-8518-69c8c2a9c2aa', 'd7c55126-e2ee-4bea-b337-44fa1c8b4ce8.jpg', 'product'),
	(89, '4a0ad7a7-8f0c-4900-8518-69c8c2a9c2aa', '623ba27c-5369-42f9-b6f6-65dafc3116c2.jpg', 'product'),
	(90, '4a0ad7a7-8f0c-4900-8518-69c8c2a9c2aa', 'f7523ec8-5ed0-46eb-a975-05e583ccba5f.jpg', 'product'),
	(91, '22367a5f-9b0a-4ecc-9464-7f7eed170e07', '2181ebf6-5ce8-46ad-ac1f-22e1d8b3e4dc.webp', 'product'),
	(92, '22367a5f-9b0a-4ecc-9464-7f7eed170e07', 'c68c2ec3-1ba3-4c89-9320-e4a9ebe48293.jpg', 'product'),
	(93, '22367a5f-9b0a-4ecc-9464-7f7eed170e07', 'b5734215-31e1-4827-baaa-7ad5359698af.jpg', 'product'),
	(94, '22367a5f-9b0a-4ecc-9464-7f7eed170e07', '7d848bcf-d93d-4476-92d8-11b72022fea3.webp', 'product'),
	(95, 'd3e79f34-2906-4479-8d04-a8ce1dd22b2f', '92932f9e-e421-4228-b02c-4e8fc5a4ca40.jpg', 'product'),
	(96, 'd3e79f34-2906-4479-8d04-a8ce1dd22b2f', '3f1b0199-40ff-43fd-875d-1b1a34b2ac45.jpg', 'product'),
	(97, 'd3e79f34-2906-4479-8d04-a8ce1dd22b2f', 'b0838507-7741-44eb-8861-04b3855c17bf.jpg', 'product'),
	(98, 'd3e79f34-2906-4479-8d04-a8ce1dd22b2f', '080f3bc4-60f1-41ee-aa72-3a3b16ee9ca6.jpg', 'product'),
	(99, '3aa1ecde-b497-46a7-b629-b1ad08342da1', '40eff2d4-dce4-4fba-a7cc-68e2c072bf7c.jpg', 'product'),
	(100, '3aa1ecde-b497-46a7-b629-b1ad08342da1', '3b222cda-fa7d-4b7b-8260-3ddb6bceca29.jpg', 'product'),
	(101, '3aa1ecde-b497-46a7-b629-b1ad08342da1', 'f873918d-ad17-477d-8137-f573f50534ca.jpg', 'product'),
	(102, '3aa1ecde-b497-46a7-b629-b1ad08342da1', '5e3a1544-e308-4875-9e60-037951debba8.jpg', 'product'),
	(103, '3aa1ecde-b497-46a7-b629-b1ad08342da1', '6fa8a5c9-63ec-473a-8f4a-0ae490d6e5f2.jpg', 'product'),
	(104, '3aa1ecde-b497-46a7-b629-b1ad08342da1', 'f05eb8df-f8d1-43ba-a086-a679dc0b6c8b.jpg', 'product'),
	(105, '3aa1ecde-b497-46a7-b629-b1ad08342da1', 'ca946e57-56fe-4b04-83dc-d279c74449b4.jpg', 'product'),
	(106, 'f625dc89-ba1c-49ab-b448-4f31a7e8b8b3', '745fdaa4-246a-45a5-9f49-90c66dc55f66.jpg', 'old'),
	(107, 'f625dc89-ba1c-49ab-b448-4f31a7e8b8b3', '21c745f3-a438-4be6-957c-c061020b1f8e.jpg', 'old'),
	(108, 'f625dc89-ba1c-49ab-b448-4f31a7e8b8b3', '3dcd6523-e1b3-4184-b054-727f099a597d.jpg', 'old'),
	(109, '690ca032-db66-432f-a3a8-ba1eaa5dab77', '6f8fc688-dc2f-468a-a11d-613ee4f1bf1a.jpg', 'old'),
	(110, '690ca032-db66-432f-a3a8-ba1eaa5dab77', '074298fa-3731-4efe-8265-b3f009640030.jpg', 'old'),
	(111, '690ca032-db66-432f-a3a8-ba1eaa5dab77', '71f40587-504c-402c-80a9-e32d4a631553.jpg', 'old'),
	(112, '29cadabb-2982-4ff2-abd3-c621eff8fe4c', '5a2ecf73-e626-4345-a29f-dd52e4d806c9.jpg', 'product'),
	(113, '29cadabb-2982-4ff2-abd3-c621eff8fe4c', '971a8f79-3a45-4e41-94bb-3a84391f7dd3.jpg', 'product'),
	(114, '29cadabb-2982-4ff2-abd3-c621eff8fe4c', '092d23a5-e2aa-4194-8f58-e61c62137bfe.jpg', 'product'),
	(115, '29cadabb-2982-4ff2-abd3-c621eff8fe4c', '568c6e00-0602-4835-af12-d3ea0d5850f7.jpg', 'product'),
	(116, 'b1ea16c2-3b8e-4e2c-baaf-fdf15d95f2ad', 'c8485578-521a-43fb-ad88-541c46ad10fa.jpg', 'product'),
	(117, 'b1ea16c2-3b8e-4e2c-baaf-fdf15d95f2ad', '634d94ee-6265-4248-b1d6-ac6e8c576111.jpg', 'product'),
	(118, 'b1ea16c2-3b8e-4e2c-baaf-fdf15d95f2ad', '2230ba73-e70e-4d5e-b83f-7f6e2c5a2305.jpg', 'product'),
	(119, 'b1ea16c2-3b8e-4e2c-baaf-fdf15d95f2ad', 'f6b1f197-1104-448c-b96c-9ea7b63b2cc3.jpg', 'product'),
	(120, '99f507f0-3de6-4cb8-a6ff-95cb0211f1bf', '41375b42-535e-4438-a7dd-4abef77bf30a.jpg', 'product'),
	(121, '99f507f0-3de6-4cb8-a6ff-95cb0211f1bf', '852247ec-fc15-4652-8cfa-1cf83085dd6c.jpg', 'product'),
	(122, '99f507f0-3de6-4cb8-a6ff-95cb0211f1bf', 'aadff1f9-dff8-4f9f-8d0a-57a1b608ec7b.jpg', 'product'),
	(123, '99f507f0-3de6-4cb8-a6ff-95cb0211f1bf', '9aae045b-016e-404f-b3fa-d5124db1b43c.jpg', 'product'),
	(124, '94e5bfe0-7829-4556-8220-92a3d425cb1d', '6549af81-a688-41f3-ad66-00937e398b0d.jpg', 'old'),
	(125, '94e5bfe0-7829-4556-8220-92a3d425cb1d', '73f80883-5153-4cc7-aa36-8932706b9082.jpg', 'old'),
	(126, '94e5bfe0-7829-4556-8220-92a3d425cb1d', '7ed4581b-6197-4b5a-94b5-402b46a9a909.jpg', 'old'),
	(127, '94e5bfe0-7829-4556-8220-92a3d425cb1d', 'daea4b9e-f2da-403b-a750-e18d8293f0a7.jpg', 'old'),
	(128, '48acf057-13d0-411d-81dd-bec5b8e0cbf3', 'ac89bba4-c826-4401-8e98-7ea2107d7934.webp', 'product'),
	(129, '48acf057-13d0-411d-81dd-bec5b8e0cbf3', 'ed296cea-8bbb-480d-98ae-0092e24a7f39.jfif', 'product'),
	(130, '48acf057-13d0-411d-81dd-bec5b8e0cbf3', '3d1e7b2f-fea9-4e95-9040-0e26f4ead99a.jfif', 'product'),
	(131, '48acf057-13d0-411d-81dd-bec5b8e0cbf3', 'cd53a719-caa8-4677-91c1-14c7cbf2fd8b.jfif', 'product'),
	(154, 'e994e191-17b0-4873-8f2d-ecfc6995cc6b', 'b3abae9b-a273-4a8d-a8dd-90490dcded83.jpg', 'product'),
	(155, 'e994e191-17b0-4873-8f2d-ecfc6995cc6b', 'c58545f1-3ddd-4abb-a529-3408534d0cab.jpg', 'product'),
	(156, 'e994e191-17b0-4873-8f2d-ecfc6995cc6b', '4561736d-ba70-4784-b748-d71e7ea41b54.jpg', 'product'),
	(157, 'e994e191-17b0-4873-8f2d-ecfc6995cc6b', '12341ecb-1a79-4849-ac85-5bbdac349dd3.jpg', 'product'),
	(158, 'e994e191-17b0-4873-8f2d-ecfc6995cc6b', '116121b9-ca90-4ed2-b6f4-ac8cd212986b.jpg', 'product'),
	(159, '617da7b3-13d2-45d0-9e67-2ff8a703c954', '371cad15-92aa-4f4f-a189-45abebcf11b4.jpg', 'product'),
	(160, '617da7b3-13d2-45d0-9e67-2ff8a703c954', 'd39454e2-8ca3-4408-bb4f-121bd5444bfa.jpg', 'product'),
	(161, '617da7b3-13d2-45d0-9e67-2ff8a703c954', '220ff38d-31df-4c8d-98bd-cf7a3e45bfa4.jpg', 'product'),
	(162, '617da7b3-13d2-45d0-9e67-2ff8a703c954', '63fd663f-3797-494e-b788-14a3ee9d08b6.jpg', 'product'),
	(163, '617da7b3-13d2-45d0-9e67-2ff8a703c954', '38ae8832-e5e2-46d6-ab70-9ba699fffda1.jpg', 'product'),
	(164, '77524b01-d13f-4917-a4eb-983d12d95609', '5cf3cd66-23fd-467d-af11-b7b6ba20ea8e.jpg', 'product'),
	(165, '77524b01-d13f-4917-a4eb-983d12d95609', '55e50c38-c971-4967-aa3e-c7dcd19b9e88.jpg', 'product'),
	(166, '77524b01-d13f-4917-a4eb-983d12d95609', 'a8b681f5-83b6-471a-a7a4-97817dcbee8d.jpg', 'product'),
	(167, '77524b01-d13f-4917-a4eb-983d12d95609', 'a44d72e7-132e-4328-b249-cf0e90398117.jpg', 'product'),
	(168, '77524b01-d13f-4917-a4eb-983d12d95609', '51120577-6259-49e2-92db-62a9eaf2c361.jpg', 'product'),
	(169, 'a30ba851-23e6-4204-9bb0-10713e252175', 'c0b224d8-752d-4c78-9687-56794bf73be6.jpg', 'product'),
	(170, 'a30ba851-23e6-4204-9bb0-10713e252175', '205d0208-6db2-42f4-a2d7-0589d23aa536.jpg', 'product'),
	(171, 'a30ba851-23e6-4204-9bb0-10713e252175', '66db2692-7e3f-4a63-ba23-082fb6f64afc.jpg', 'product'),
	(172, 'a30ba851-23e6-4204-9bb0-10713e252175', '25ebde79-b6b6-497c-8e44-552a96304ab2.jpg', 'product'),
	(173, '6e1ba4a4-55b8-4a13-a8b7-f763376f4f8a', '0035d465-2811-41f4-a144-19009029e0b3.jpg', 'product'),
	(174, '6e1ba4a4-55b8-4a13-a8b7-f763376f4f8a', 'f445f212-20b1-47b4-9848-3de5429e0ef8.jpg', 'product'),
	(175, '6e1ba4a4-55b8-4a13-a8b7-f763376f4f8a', 'f5b48d40-c9dc-41b8-af4f-097201265058.jpg', 'product'),
	(176, '6e1ba4a4-55b8-4a13-a8b7-f763376f4f8a', 'bfdbe12b-8b65-4f0d-9889-028cde903d83.jpg', 'product'),
	(177, 'fdf38744-961f-4cef-995f-244380b49733', 'cd73069e-31d3-4920-b57b-462354326f24.jpg', 'product'),
	(178, 'fdf38744-961f-4cef-995f-244380b49733', '19f8993f-7aec-4047-9d3f-a53f7115c820.jpg', 'product'),
	(179, 'fdf38744-961f-4cef-995f-244380b49733', '6f782106-9917-4c82-83c7-8910b06fd35c.jpg', 'product'),
	(180, 'fdf38744-961f-4cef-995f-244380b49733', 'deb94381-84e9-4b65-82ea-391e38cadb99.jpg', 'product'),
	(181, '8c1a7ac2-611b-4f98-8591-2b512bbb7de4', '70979fba-296e-483e-99d0-0845c81b1a75.jpg', 'product'),
	(182, '8c1a7ac2-611b-4f98-8591-2b512bbb7de4', 'd31aaae9-45a9-42a6-971a-e0b117985bce.jpg', 'product'),
	(183, '8c1a7ac2-611b-4f98-8591-2b512bbb7de4', '9ead99fa-2176-4094-af23-f9c2a75ad769.jpg', 'product'),
	(184, '8c1a7ac2-611b-4f98-8591-2b512bbb7de4', '83c1a408-5fc5-4fed-b89b-2f4258a3b34d.jpg', 'product'),
	(185, 'e69e5842-2b0c-46a5-88f4-93b52fe15010', '718b6684-e70f-49a6-8730-beaa5bc1279a.jpg', 'product'),
	(186, 'e69e5842-2b0c-46a5-88f4-93b52fe15010', '83ed2ea6-79b2-425e-992f-c831d391674c.jpg', 'product'),
	(187, 'e69e5842-2b0c-46a5-88f4-93b52fe15010', 'a013802c-609d-4e84-822f-6e52f7abda1f.jpg', 'product'),
	(188, 'e69e5842-2b0c-46a5-88f4-93b52fe15010', '6e71af85-10d8-46fe-8c3b-f7d90411366b.jpg', 'product'),
	(189, 'e69e5842-2b0c-46a5-88f4-93b52fe15010', 'bb23f41a-372d-43fa-a672-a01ad926270c.jpg', 'product'),
	(190, 'e69e5842-2b0c-46a5-88f4-93b52fe15010', '087eba37-67f2-4691-9ef8-95279fe4eedd.jpg', 'product'),
	(191, '477fe5db-8b93-4d28-9f0d-8156f49507c1', '18da7a3d-1a24-436e-afb5-b1291073bc06.jpg', 'product'),
	(192, '477fe5db-8b93-4d28-9f0d-8156f49507c1', 'a45418a7-16a5-4ce6-ad3e-9ba8406d127c.jpg', 'product'),
	(193, '477fe5db-8b93-4d28-9f0d-8156f49507c1', 'ee4087ca-2ca9-4697-bab7-2ab5583e1f44.jpg', 'product'),
	(194, '477fe5db-8b93-4d28-9f0d-8156f49507c1', '5a69993e-3b0f-4fcc-8790-b0e8a63c3e1e.jpg', 'product'),
	(195, '477fe5db-8b93-4d28-9f0d-8156f49507c1', '65de5696-bd1d-4c5b-aefd-0e537221ad48.jpg', 'product'),
	(196, '477fe5db-8b93-4d28-9f0d-8156f49507c1', 'fbcce27a-0014-4739-9a2a-4dc1a11c814f.jpg', 'product');
/*!40000 ALTER TABLE `imgs` ENABLE KEYS */;

-- 테이블 forrest.old 구조 내보내기
CREATE TABLE IF NOT EXISTS `old` (
  `oldNo` varchar(40) NOT NULL,
  `userId` varchar(30) NOT NULL,
  `oldPrice` int(11) NOT NULL,
  `oldTitle` varchar(100) NOT NULL,
  `oldDetail` varchar(8000) NOT NULL,
  `oldDate` datetime NOT NULL DEFAULT current_timestamp(),
  `oldView` int(11) NOT NULL,
  `category` varchar(10) NOT NULL,
  `oldState` tinyint(1) NOT NULL DEFAULT 1,
  `oldImg` varchar(60) NOT NULL,
  `oldAddr` varchar(100) NOT NULL,
  PRIMARY KEY (`oldNo`),
  KEY `userId` (`userId`),
  CONSTRAINT `old_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 forrest.old:~13 rows (대략적) 내보내기
DELETE FROM `old`;
/*!40000 ALTER TABLE `old` DISABLE KEYS */;
INSERT INTO `old` (`oldNo`, `userId`, `oldPrice`, `oldTitle`, `oldDetail`, `oldDate`, `oldView`, `category`, `oldState`, `oldImg`, `oldAddr`) VALUES
	('3d91e986-7a27-4c99-9d02-c7a7b56a2f6c', 'jj3033@naver.com', 50000, '스텐다드 접이식 바베큐그릴 숯불 캠핑 야외용 BBQ', '한번 쓰고 팝니다. 쿨거래만 받아요..!', '2022-06-24 14:33:11', 1, '그릴', 1, '2112c4de-b722-4761-9062-a8e0e1a458c7.webp', '죽전동'),
	('48314086-6371-4cbf-8a16-c0495771f046', 'user01@naver.com', 5000, '분위기 있는 랜턴', '싸게 가져가세요~', '2022-06-23 09:56:47', 1, '조명', 1, '098af6ee-f658-4873-877e-3bc8e2095a58.jpg', '삼성동'),
	('5643ddbf-60fd-44b1-add6-8d7548357c7b', 'user01@naver.com', 9000, '고기굽기 좋은 테이블', '사용감이 있어 저렴하게 올립니다. 기스 살짝 있어요.', '2022-06-23 10:02:08', 3, '테이블', 1, '99b4ecd1-ebba-42db-b936-f646060a04d1.jpg', '삼성동'),
	('690ca032-db66-432f-a3a8-ba1eaa5dab77', 'tkdals4534@naver.com', 5000, '(새상품)캠핑 미니 가스 토치 요리용 토치 캠핑용품 캠프25 낚시', '(새상품)캠핑 토치 요리용 토치 캠핑용품\r\n화력좋아요 충전식 입니다.\r\n택배 +3,000원\r\n네고안돼요~', '2022-06-24 20:20:42', 1, '버너', 1, '6f8fc688-dc2f-468a-a11d-613ee4f1bf1a.jpg', '성남시 수정구 위례동'),
	('9113b67b-70eb-425b-ba35-36b4838b74b6', 'qwerty5266@naver.com', 20000, '캠핑식기 세트 22P 캠핑용품 접시세트', '20000원에 팝니다..!', '2022-06-24 14:37:33', 3, '식기', 1, '32fef995-b239-48a2-9ad1-eb313b30bc98.webp', '동천동'),
	('94e5bfe0-7829-4556-8220-92a3d425cb1d', 'tkdals4534@naver.com', 6000, '[1+1] 캠핑 소품걸이스트랩 데이지체인', '캠핑이나 낚시등 야외에서\r\n여러가지 소품을 걸어놓을수 있는\r\n소품 걸이용 데이지체인 입니다.\r\n\r\n주변의 나무나 폴대 등에 걸어서\r\n사용 하시면 되구요\r\n찍찍이?와 버클이 있어 사용이 편리 합니다.\r\n\r\n사이즈는  폭 2Cm 길이 190Cm 정도이며\r\n1+1 두세트 구성으로 전용파우치 포함 입니다.\r\n(사진에 나와있는 카라비너 와 소품등은 구성품에 포함되지 않음)\r\n\r\n배송비 3,000원 추가이며\r\n(제주 및 도서산간지역 배송비 추가)\r\n현재 판매중인 다른 상품과 묶음 배송도 가능하니\r\n기타 궁금하신 사항은 톡 으로 문의 주시기 바랍니다.\r\n\r\n☆묶음배송가능☆\r\n\r\n☆5만원 이상 구매 시 배송비 무료☆', '2022-06-24 20:23:05', 0, '조명', 1, '6549af81-a688-41f3-ad66-00937e398b0d.jpg', '성남시 수정구 위례동'),
	('a4bde7a7-c0dc-4734-9aa6-1c2cd769b6d8', 'user01@naver.com', 20000, '감성 조명', '싸게 가져가세요', '2022-06-23 09:50:06', 1, '조명', 1, '9ab1853e-4b67-4bd2-9ee2-b1ff4d7b4398.jpg', '청담동'),
	('df9d73df-8b33-4fd3-99b9-b2e43784ca0a', 'kedee2001@naver.com', 20000, '다니고 캠핑 전구', '30000원에 샀는데 눈물을 머금고 20000원에 올립니다ㅠㅠ\r\n이것만 있으면 밤에 안 어둡고 갬성넘치는 캠핑을 할 수 있습니다 ㅎㅎ\r\n쿨거래 시 네고 해드립니다!', '2022-06-24 14:26:02', 3, '조명', 1, 'c42c8bc7-1e4b-4b15-a6b3-67bb0fabe77f.gif', '상산동'),
	('ea5668d7-ad6e-4f09-8719-474876e6cad4', 'admin', 60000, '원목 테이블', '튼튼해요 퀄리티 정말 좋아요.', '2022-06-23 09:59:53', 3, '테이블', 1, '2638800c-6535-4ab8-b052-d5c7ee82b180.jpg', '역삼동'),
	('ef4e0923-71a7-47ac-bc7e-f133da484fcf', 'sanstory12rt@naver.com', 50000, '포레스트우드 구이바다 BBQ그릴 풀세트M', '기름도 별로 안튀었고, 한번 청소했어서 완전 깨끗해요!\r\n더 좋은걸 사서 그냥 팝니다 ㅎㅎㅎ!', '2022-06-24 14:35:13', 2, '버너', 1, 'de527e4a-15af-4a4b-9c32-9bab5221061e.webp', '죽전동'),
	('f215ff49-27a8-49ba-ac01-9ef27bfb02fe', 'captain9697@naver.com', 30000, '경량체어 감성 로우 커밋체어 등산의자', '경량 체어라서 엄청 가벼워요. 앉아서 불멍때리면 행복이 여기에!\r\n사용감 거의 없어서 거의 새거에요. 얻어가세요!~', '2022-06-24 14:29:09', 3, '의자', 1, 'ede4e20d-5403-4df4-a65d-fef902425730.webp', '상산동'),
	('f625dc89-ba1c-49ab-b448-4f31a7e8b8b3', 'tkdals4534@naver.com', 1000, '30G 알콜 고체 연료 캠핑용 50개', '2022 new arrival\r\n\r\n시원한 여름의 꽃, 캠핑의 계절이 왔습니다!!\r\n\r\n고체연료가 필요하신가요?? \r\n\r\n말이 필요없습니다!! 써보신 분들은 고체 연료의 편리함에 만족하십니다!\r\n\r\n가격이 맘에 안 드시나요? 그래서 내렸습니다!\r\n\r\n•  참치맛김밥 고체연료 30g * 50개 ( 배송비 포함 )\r\n\r\n추가적인 문의는 번개톡으로 주시면 빠르게 원활한 대응이 가능합니다!\r\n\r\n*저희 매장은 50,000 이상 거래시에 일부 제품 무료 배송가능합니다.', '2022-06-24 20:20:12', 0, '난로', 1, '745fdaa4-246a-45a5-9f49-90c66dc55f66.jpg', '성남시 수정구 위례동'),
	('fecb1f75-15b2-4ca6-a105-32a1ba628fce', 'user01@naver.com', 90000, '한번 사용한 텐트', '실물 예뻐요~', '2022-06-23 09:55:13', 1, '텐트', 1, 'b50b7c22-c12a-4896-9aa8-4b9ac6deed42.jpg', '연희동');
/*!40000 ALTER TABLE `old` ENABLE KEYS */;

-- 테이블 forrest.oldlike 구조 내보내기
CREATE TABLE IF NOT EXISTS `oldlike` (
  `oldLikeNo` int(11) NOT NULL AUTO_INCREMENT,
  `oldNo` varchar(40) NOT NULL,
  `userId` varchar(30) NOT NULL,
  PRIMARY KEY (`oldLikeNo`),
  KEY `oldNo` (`oldNo`),
  KEY `userId` (`userId`),
  CONSTRAINT `oldlike_ibfk_1` FOREIGN KEY (`oldNo`) REFERENCES `old` (`oldNo`) ON DELETE CASCADE,
  CONSTRAINT `oldlike_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 테이블 데이터 forrest.oldlike:~0 rows (대략적) 내보내기
DELETE FROM `oldlike`;
/*!40000 ALTER TABLE `oldlike` DISABLE KEYS */;
INSERT INTO `oldlike` (`oldLikeNo`, `oldNo`, `userId`) VALUES
	(4, 'a4bde7a7-c0dc-4734-9aa6-1c2cd769b6d8', 'kedee2001@naver.com');
/*!40000 ALTER TABLE `oldlike` ENABLE KEYS */;

-- 테이블 forrest.oldreview 구조 내보내기
CREATE TABLE IF NOT EXISTS `oldreview` (
  `oldReviewNo` int(11) NOT NULL AUTO_INCREMENT,
  `reviewUserId` varchar(30) NOT NULL,
  `reviewedUserId` varchar(30) NOT NULL,
  `oldNo` varchar(40) NOT NULL,
  `reviewDetail` varchar(100) DEFAULT NULL,
  `userRate` double DEFAULT NULL,
  `reviewDate` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`oldReviewNo`),
  KEY `reviewUserId` (`reviewUserId`),
  KEY `reviewedUserId` (`reviewedUserId`),
  KEY `oldNo` (`oldNo`),
  CONSTRAINT `oldreview_ibfk_1` FOREIGN KEY (`reviewUserId`) REFERENCES `user` (`userId`),
  CONSTRAINT `oldreview_ibfk_2` FOREIGN KEY (`reviewedUserId`) REFERENCES `user` (`userId`),
  CONSTRAINT `oldreview_ibfk_3` FOREIGN KEY (`oldNo`) REFERENCES `old` (`oldNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 forrest.oldreview:~0 rows (대략적) 내보내기
DELETE FROM `oldreview`;
/*!40000 ALTER TABLE `oldreview` DISABLE KEYS */;
/*!40000 ALTER TABLE `oldreview` ENABLE KEYS */;

-- 테이블 forrest.owncoupon 구조 내보내기
CREATE TABLE IF NOT EXISTS `owncoupon` (
  `ownCouponNo` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(30) NOT NULL,
  `couponNo` varchar(50) NOT NULL,
  `ownCouponCreDate` datetime NOT NULL,
  `ownCouponDelDate` datetime NOT NULL,
  PRIMARY KEY (`ownCouponNo`),
  KEY `userId` (`userId`),
  KEY `couponNo` (`couponNo`),
  CONSTRAINT `owncoupon_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `owncoupon_ibfk_2` FOREIGN KEY (`couponNo`) REFERENCES `coupon` (`couponNo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- 테이블 데이터 forrest.owncoupon:~8 rows (대략적) 내보내기
DELETE FROM `owncoupon`;
/*!40000 ALTER TABLE `owncoupon` DISABLE KEYS */;
INSERT INTO `owncoupon` (`ownCouponNo`, `userId`, `couponNo`, `ownCouponCreDate`, `ownCouponDelDate`) VALUES
	(1, 'user01@naver.com', '1', '2022-06-01 00:00:00', '2022-06-30 00:00:00'),
	(2, 'user01@naver.com', '4', '2022-06-01 00:00:00', '2022-06-30 00:00:00'),
	(3, 'user01@naver.com', '2', '2022-06-01 00:00:00', '2022-06-30 00:00:00'),
	(4, 'user02@naver.com', '2', '2022-06-01 00:00:00', '2022-06-30 00:00:00'),
	(5, 'user01@naver.com', '2', '2022-06-24 12:19:21', '2022-07-24 12:19:21'),
	(7, 'user03@naver.com', '2', '2022-06-24 13:23:00', '2022-07-24 13:23:00'),
	(8, 'admin', '2', '2022-06-24 14:14:15', '2022-07-24 14:14:15'),
	(11, 'tkdals4534@naver.com', '2', '2022-06-24 20:19:13', '2022-07-24 20:19:13');
/*!40000 ALTER TABLE `owncoupon` ENABLE KEYS */;

-- 테이블 forrest.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `prodNo` varchar(40) NOT NULL,
  `width` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `userId` varchar(30) NOT NULL,
  `prodCondition` varchar(30) NOT NULL DEFAULT '물품보관승인신청중',
  `prodName` varchar(40) NOT NULL,
  `prodQuantity` int(11) NOT NULL,
  `prodDetail` varchar(600) NOT NULL,
  `isRental` tinyint(1) NOT NULL DEFAULT 0,
  `rentalCounting` int(11) DEFAULT NULL,
  `rentalPrice` int(11) DEFAULT NULL,
  `account` varchar(30) DEFAULT NULL,
  `category` varchar(10) NOT NULL,
  `divyAddress` varchar(100) NOT NULL,
  `prodImg` varchar(100) NOT NULL,
  `recentImg` varchar(100) DEFAULT NULL,
  `regDate` datetime NOT NULL,
  PRIMARY KEY (`prodNo`),
  KEY `userId` (`userId`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 forrest.product:~23 rows (대략적) 내보내기
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`prodNo`, `width`, `length`, `height`, `userId`, `prodCondition`, `prodName`, `prodQuantity`, `prodDetail`, `isRental`, `rentalCounting`, `rentalPrice`, `account`, `category`, `divyAddress`, `prodImg`, `recentImg`, `regDate`) VALUES
	('15b74776-2033-4c01-9685-ed46aa6b937a', 10, 10, 2, 'tkdals4534@naver.com', '물품대여승인신청중', '도플갱어 타프 헥사', 1, '[해외]도플갱어 타프 헥사 all in one UV TT5-631 3색 입니다\r\n', 1, 1, 10000, '우리/1235325325', '기타용품', '16873/경기 용인시 수지구 대지로 18/201-1023/ (죽전동)', '31fb43d1-793d-4629-9c6e-05cbbdb73590.webp', NULL, '2022-06-24 15:01:06'),
	('22367a5f-9b0a-4ecc-9464-7f7eed170e07', 10, 10, 2, 'sanstory12rt@naver.com', '보관중', '브래마 3 400 카라반 어닝 하우스', 1, '브래마 3 400 카라반 어닝 하우스 에어빔 텐트+ 매트입니다..! 잘 보관해주시고, 대여할 분들은 대여하세요~', 1, 0, 120000, '국민/4321353521523521', '텐트', '13473/경기 성남시 분당구 경부고속도로 409/220-4431/ (삼평동)', '2181ebf6-5ce8-46ad-ac1f-22e1d8b3e4dc.webp', NULL, '2022-06-24 15:51:20'),
	('29cadabb-2982-4ff2-abd3-c621eff8fe4c', 10, 10, 10, 'qwerty5266@naver.com', '보관중', '메이튼 캠핑 랜턴 조명 감성 LED ', 1, 'c타입 충전기를 써서 편리합니다. 저렴하게 가져가세요!', 1, 0, 10000, '우리/1002250485761', '조명', '13485/경기 성남시 분당구 판교로 20/405/ (판교동, 판교원마을3단지아파트)', '5a2ecf73-e626-4345-a29f-dd52e4d806c9.jpg', NULL, '2022-06-24 20:21:59'),
	('3aa1ecde-b497-46a7-b629-b1ad08342da1', 10, 10, 10, 'sanstory12rt@naver.com', '보관중', '감성좋은 행복한 텐트', 1, '행복이 넘치는 감성넘치는 좋은 텐트입니다.', 1, 0, 100, '국민/292-12392193-4578', '텐트', '06035/서울 강남구 가로수길 5/5986호/ (신사동)', '40eff2d4-dce4-4fba-a7cc-68e2c072bf7c.jpg', NULL, '2022-06-24 20:20:01'),
	('477fe5db-8b93-4d28-9f0d-8156f49507c1', 5, 2, 2, 'captain9697@naver.com', '물품보관승인신청중', '시어잘 Searing Torch', 1, '유튜버 육식맨보고 충동구매한 시어잘입니다. 요즘 캠핑을 잘안가서 집에서 놀고있길래 보관합니다.. 화력은 약한편이긴 한데 캠핑가서 쓰기에는 충분할거에요 부디 잘 보살펴주세요', 1, 0, 3000, '국민/47810204386651', '기타용품', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '18da7a3d-1a24-436e-afb5-b1291073bc06.jpg', NULL, '2022-06-26 03:08:05'),
	('48acf057-13d0-411d-81dd-bec5b8e0cbf3', 10, 10, 2, 'kedee2001@naver.com', '보관중', '불멍 캠핑 가정용 에탄올 난로 미니 ', 1, '불멍 캠핑 가정용 에탄올 난로 입니다!\r\n', 1, 0, 2000, '국민/1242151525125', '기타용품', '16872/경기 용인시 수지구 대지로 49/106-4210/ (죽전동, 죽전퍼스트하임)', 'ac89bba4-c826-4401-8e98-7ea2107d7934.webp', NULL, '2022-06-24 20:23:19'),
	('4a0ad7a7-8f0c-4900-8518-69c8c2a9c2aa', 10, 10, 2, 'sanstory12rt@naver.com', '보관중', '리버 프로 + 110W태양광패널', 1, '리버 프로 + 110W태양광패널 + 확장배터리 세트 파워뱅크 720Wh 1800W 220V\r\n\r\n', 1, 0, 50000, '국민/4321353521523521', '기타용품', '13487/경기 성남시 분당구 대왕판교로 579/22-232/ (삼평동)', 'a1bdb845-cea3-4229-b0d3-77eadd70fc24.jpg', NULL, '2022-06-24 15:36:07'),
	('52fb9c79-d83b-436a-b5be-5b27a6b13c33', 10, 10, 2, 'captain9697@naver.com', '보관중', '바베큐,숯불 그릴/캠핑 그릴', 1, '캠핑용 가정용 그릴이고 한번사용후 보관했는데 숯자국은 남네요\r\n중형으로 간단히 구워먹기좋아요 3-4인용이고 가방이 깨끗하지않아요\r\n숯사용후 남은것도 드려요  이사짐정리중입니다', 1, 0, 5000, '국민/47810204386651', '그릴', '06035/서울 강남구 도산대로 402-2/울집/ (신사동)', '8af51708-419c-45d4-ba17-ecb5f6600e6c.jpg', NULL, '2022-06-22 14:11:24'),
	('617da7b3-13d2-45d0-9e67-2ff8a703c954', 10, 10, 1, 'captain9697@naver.com', '보관중', '캠핑웨건, 테이블, 의자', 1, '캠핑웨건, 테이블, 의자 세트입니다 \r\n휴대성도 좋고 짐옮길때도 아주편합니당  수납공간이 생각보다 넓어요  최대 100kg까지 견딜수있습니다~', 1, 0, 4000, '국민/47810204386651', '테이블', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '371cad15-92aa-4f4f-a189-45abebcf11b4.jpg', NULL, '2022-06-26 02:48:31'),
	('6e1ba4a4-55b8-4a13-a8b7-f763376f4f8a', 5, 5, 2, 'captain9697@naver.com', '물품보관승인신청중', '슈브 캠핑의자', 1, '슈브캠핑의자입니다.   사용하지 않을땐 간편하게 접어서 보관가능하구요 무게도 2kg도 안나가서 여성분혼자 들기에도 가뿐합니다! 요즘 캠핑을 잘 안가서 올려놔요 ㅎㅎ', 1, 0, 4000, '국민/47810204386651', '의자', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '0035d465-2811-41f4-a144-19009029e0b3.jpg', NULL, '2022-06-26 02:56:40'),
	('7374c5cb-e68b-4d65-84a9-013f0d1df57c', 10, 10, 2, 'captain9697@naver.com', '보관중', '라탄 전등갓 줄전구 조명', 1, '[손품]이라는 곳에서 구매한 라탄 전등 갓 조명이예요\r\n20구 이고, 건전지형 입니다 (USB형 나오기전 구매)\r\n저는 캠핑때 사용하려고 샀었고, 1회 사용 후 보관만 해둔 상태 입니다\r\n\r\n샀던 곳 상세설명 첨부 참고해주세요\r\n더스트백에 넣어 드립니다\r\n라탄 갓은 전구에 일일히 따로 끼워야 하는데 20개 다 하려면 시간 꽤 걸려요 그래서 끼운채 있고 그대로 드려요!', 1, 0, 3000, '국민/47810204386651', '조명', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', 'e54d899f-8a6c-4f49-bb89-8703196bf34b.jpg', NULL, '2022-06-22 14:15:26'),
	('77524b01-d13f-4917-a4eb-983d12d95609', 10, 10, 1, 'captain9697@naver.com', '물품보관승인신청중', '캠핑웨건, 테이블, 의자', 1, '캠핑웨건, 테이블, 의자 세트입니다 \r\n휴대성도 좋고 짐옮길때도 아주편합니당  수납공간이 생각보다 넓어요  최대 100kg까지 견딜수있습니다~', 1, 0, 4000, '국민/47810204386651', '테이블', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '5cf3cd66-23fd-467d-af11-b7b6ba20ea8e.jpg', NULL, '2022-06-26 02:48:35'),
	('8c1a7ac2-611b-4f98-8591-2b512bbb7de4', 5, 5, 2, 'captain9697@naver.com', '물품보관승인신청중', '캠핑웨건 상판 테이블', 1, '캠핑웨건에 사용하는 상판테이블입니다 접이식이라서 부피도 많이 안차지하구요 정말 유용하게 잘썼습니다. 생활기스 조금 있어서 싸게 대여가능하게 올려놓습니다~ ', 1, 0, 2500, '국민/47810204386651', '테이블', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '70979fba-296e-483e-99d0-0845c81b1a75.jpg', NULL, '2022-06-26 03:00:46'),
	('921f14e2-f6ad-4db5-961c-2a21caa4bea2', 10, 10, 2, 'tkdals4534@naver.com', '보관중', '썬샤인 라탄 야외 7인 테이블 소파 ', 1, '썬샤인 라탄 야외 7인 테이블 소파 세트', 1, 0, 100000, '국민/1235325325', '의자', '16873/경기 용인시 수지구 대지로 18/204-4201/ (죽전동)', '4a22dd61-c8db-40b8-afcd-1d7216196071.webp', NULL, '2022-06-24 15:09:06'),
	('99f507f0-3de6-4cb8-a6ff-95cb0211f1bf', 10, 10, 2, 'captain9697@naver.com', '보관중', '캠핑테이블 정원테이블', 1, '높낮이가 가능하고\r\n수납가방이 있어서 보관 및 휴대하기가 좋으며 테이블 밑에 수납 망이 있어서 여러가지 물건을담을수있습니다.\r\n의자는 없습니다.\r\n낚시. 캠핑용 세컨드용.\r\n', 1, 0, 5000, '국민/47810204386651', '테이블', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '41375b42-535e-4438-a7dd-4abef77bf30a.jpg', NULL, '2022-06-24 20:22:30'),
	('a30ba851-23e6-4204-9bb0-10713e252175', 5, 5, 2, 'captain9697@naver.com', '보관중', '슈브 캠핑의자', 1, '슈브캠핑의자입니다.   사용하지 않을땐 간편하게 접어서 보관가능하구요 무게도 2kg도 안나가서 여성분혼자 들기에도 가뿐합니다! 요즘 캠핑을 잘 안가서 올려놔요 ㅎㅎ', 1, 0, 4000, '국민/47810204386651', '의자', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', 'c0b224d8-752d-4c78-9687-56794bf73be6.jpg', NULL, '2022-06-26 02:56:34'),
	('a4ea7134-168b-4005-9dca-b0ac5d66c8bb', 10, 10, 2, 'qwerty5266@naver.com', '보관중', '스마랑 인조라탄 야외 원형소파베드세트', 1, '스마랑 인조라탄 야외 원형소파베드세트\r\n\r\n', 1, 0, 100000, '국민/4321353521523521', '의자', '13494/경기 성남시 분당구 판교역로 235/124-1244/ (삼평동)', '942e74da-1389-45f5-b283-8504d098fb07.webp', NULL, '2022-06-24 15:26:01'),
	('b1ea16c2-3b8e-4e2c-baaf-fdf15d95f2ad', 10, 10, 10, 'qwerty5266@naver.com', '물품보관승인신청중', '메이튼 캠핑 랜턴 조명 감성 LED ', 1, 'c타입 충전기를 써서 편리합니다. 저렴하게 가져가세요!', 1, 0, 10000, '우리/1002250485761', '조명', '13485/경기 성남시 분당구 판교로 20/405/ (판교동, 판교원마을3단지아파트)', 'c8485578-521a-43fb-ad88-541c46ad10fa.jpg', NULL, '2022-06-24 20:22:06'),
	('b37a6c88-8ec7-4d39-9e6b-8474e3376fce', 10, 10, 2, 'captain9697@naver.com', '보관중', '캠핑의자,캠핑체어,스노우라인,유아의자', 1, '야외에서 쓰던거라 사용감 있어요.\r\n그래도 튼튼하고 사용하기 좋아요\r\n\r\n민트색의자는 주니어의자 라고해서 당근구입하고 봤더니 어린이가 쓰는거라 안쓰고 보관만했어요. 꺼내봤더니 많이 지저분해졌네요.이것도 튼튼해요~\r\n스노우라인꺼 사시는분 필요하시면 드려요~', 1, 0, 3000, '국민/47810204386651', '의자', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '2b35cd5b-2680-4f81-8db9-17090645c038.jpg', NULL, '2022-06-22 14:19:07'),
	('d3e79f34-2906-4479-8d04-a8ce1dd22b2f', 10, 10, 10, 'jj3033@naver.com', '보관중', '캠핑공구', 1, '캠핑가면 가끔 쓰는 공구입니다.\r\n말 그대로 가끔 써서 사자니 돈아깝고\r\n없으면 귀찮은 것들 모아놨습니다.\r\n사용감 거의 없음여', 1, 0, 10000, '국민/110250838787', '기타용품', '02582/서울 동대문구 하정로5길 13/201/ (신설동, 신설동주상복합)', '92932f9e-e421-4228-b02c-4e8fc5a4ca40.jpg', NULL, '2022-06-24 20:14:52'),
	('e69e5842-2b0c-46a5-88f4-93b52fe15010', 5, 2, 2, 'captain9697@naver.com', '보관중', '시어잘 Searing Torch', 1, '유튜버 육식맨보고 충동구매한 시어잘입니다. 요즘 캠핑을 잘안가서 집에서 놀고있길래 보관합니다.. 화력은 약한편이긴 한데 캠핑가서 쓰기에는 충분할거에요 부디 잘 보살펴주세요', 1, 0, 3000, '국민/47810204386651', '기타용품', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '718b6684-e70f-49a6-8730-beaa5bc1279a.jpg', NULL, '2022-06-26 03:08:01'),
	('e994e191-17b0-4873-8f2d-ecfc6995cc6b', 10, 2, 10, 'captain9697@naver.com', '물품보관승인신청중', '캠핑 BBQ Fire Pit', 1, '가정용, 캠핑용으로 적합한 바베큐 그릴이구요\r\n무게도 3.4kg라 비교적 휴대도 간편한폅입니다 \r\n싸게 업어가세요~~', 1, 0, 4000, '국민/47810204386651', '그릴', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', 'b3abae9b-a273-4a8d-a8dd-90490dcded83.jpg', NULL, '2022-06-26 02:41:34'),
	('fdf38744-961f-4cef-995f-244380b49733', 5, 5, 2, 'captain9697@naver.com', '보관중', '캠핑웨건 상판 테이블', 1, '캠핑웨건에 사용하는 상판테이블입니다 접이식이라서 부피도 많이 안차지하구요 정말 유용하게 잘썼습니다. 생활기스 조금 있어서 싸게 대여가능하게 올려놓습니다~ ', 1, 0, 2500, '국민/47810204386651', '테이블', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', 'cd73069e-31d3-4920-b57b-462354326f24.jpg', NULL, '2022-06-26 03:00:40');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- 테이블 forrest.rentalreview 구조 내보내기
CREATE TABLE IF NOT EXISTS `rentalreview` (
  `reviewNo` int(11) NOT NULL AUTO_INCREMENT,
  `reviewImg` varchar(200) NOT NULL,
  `reviewDetail` varchar(600) NOT NULL,
  `reviewScore` int(11) NOT NULL,
  `prodNo` varchar(40) NOT NULL,
  `userId` varchar(30) NOT NULL,
  `regDate` date NOT NULL,
  PRIMARY KEY (`reviewNo`),
  KEY `userId` (`userId`),
  KEY `prodNo` (`prodNo`),
  CONSTRAINT `rentalreview_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `rentalreview_ibfk_2` FOREIGN KEY (`prodNo`) REFERENCES `product` (`prodNo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 테이블 데이터 forrest.rentalreview:~2 rows (대략적) 내보내기
DELETE FROM `rentalreview`;
/*!40000 ALTER TABLE `rentalreview` DISABLE KEYS */;
INSERT INTO `rentalreview` (`reviewNo`, `reviewImg`, `reviewDetail`, `reviewScore`, `prodNo`, `userId`, `regDate`) VALUES
	(1, 'tent.jpg', '너무너무 힘들게 배송받은 오두막 텐트집근처에 왔다가 반송되고 다시 배송오다가반송되기전에 겨우 택배기사님과 통화해서어렵게 받았네요. 탠트에 발자국 2개가찍혀있었지만 그냥 씁니다.텐트는 너무 이쁘고 좋습니닺', 3, 'e3a2fad8-188d-45f8-bec1-881f185e090d#', 'user02@naver.com', '2021-05-25'),
	(2, 'tent.jpg', '가족이 구매했는데 만족하네요~가격은 사악하지만 좋습니다~', 3, 'e3a2fad8-188d-45f8-bec1-881f185e090d#', 'user03@naver.com', '2021-05-25');
/*!40000 ALTER TABLE `rentalreview` ENABLE KEYS */;

-- 테이블 forrest.report 구조 내보내기
CREATE TABLE IF NOT EXISTS `report` (
  `reportNo` int(11) NOT NULL AUTO_INCREMENT,
  `reportUser` varchar(30) NOT NULL,
  `reportedUser` varchar(30) NOT NULL,
  `reportOldNo` varchar(40) NOT NULL,
  `reportChatroomNo` int(11) DEFAULT NULL,
  `reportCategory` varchar(20) DEFAULT NULL,
  `reportDate` datetime NOT NULL DEFAULT current_timestamp(),
  `reportDetail` varchar(100) DEFAULT NULL,
  `reportChat` varchar(4000) DEFAULT NULL,
  `reportCode` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`reportNo`),
  KEY `reportUser` (`reportUser`),
  KEY `reportedUser` (`reportedUser`),
  KEY `reportOldNo` (`reportOldNo`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`reportUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `report_ibfk_2` FOREIGN KEY (`reportedUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `report_ibfk_3` FOREIGN KEY (`reportOldNo`) REFERENCES `old` (`oldNo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 테이블 데이터 forrest.report:~0 rows (대략적) 내보내기
DELETE FROM `report`;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` (`reportNo`, `reportUser`, `reportedUser`, `reportOldNo`, `reportChatroomNo`, `reportCategory`, `reportDate`, `reportDetail`, `reportChat`, `reportCode`) VALUES
	(4, 'admin', 'captain9697@naver.com', 'f215ff49-27a8-49ba-ac01-9ef27bfb02fe', 10, '전문', '2022-06-24 16:18:09', '의심이 되는 듯 ㅡㅡ', NULL, NULL);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;

-- 테이블 forrest.transaction 구조 내보내기
CREATE TABLE IF NOT EXISTS `transaction` (
  `tranNo` varchar(100) NOT NULL,
  `userId` varchar(30) NOT NULL,
  `prodNo` varchar(40) NOT NULL,
  `divyRequest` varchar(100) DEFAULT NULL,
  `divyAddress` varchar(100) NOT NULL,
  `pickupAddress` varchar(100) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `period` int(11) NOT NULL,
  `tranCode` tinyint(1) NOT NULL DEFAULT 0,
  `paymentNo` varchar(30) NOT NULL,
  `paymentDate` datetime DEFAULT NULL,
  `paymentWay` varchar(50) DEFAULT NULL,
  `receiverPhone` varchar(50) DEFAULT NULL,
  `receiverName` varchar(50) DEFAULT NULL,
  `prodName` varchar(40) NOT NULL,
  `prodImg` varchar(100) NOT NULL,
  `originPrice` int(11) NOT NULL,
  `discountPrice` int(11) DEFAULT NULL,
  `resultPrice` int(11) DEFAULT NULL,
  `reviewDone` tinyint(1) NOT NULL DEFAULT 0,
  `complete` tinyint(1) NOT NULL DEFAULT 0,
  `cancelComplete` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tranNo`),
  KEY `userId` (`userId`),
  KEY `prodNo` (`prodNo`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`prodNo`) REFERENCES `product` (`prodNo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 forrest.transaction:~19 rows (대략적) 내보내기
DELETE FROM `transaction`;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` (`tranNo`, `userId`, `prodNo`, `divyRequest`, `divyAddress`, `pickupAddress`, `startDate`, `endDate`, `period`, `tranCode`, `paymentNo`, `paymentDate`, `paymentWay`, `receiverPhone`, `receiverName`, `prodName`, `prodImg`, `originPrice`, `discountPrice`, `resultPrice`, `reviewDone`, `complete`, `cancelComplete`) VALUES
	('193f067d-3eda-4a07-a68b-e90824f642cf', 'captain9697@naver.com', 'b37a6c88-8ec7-4d39-9e6b-8474e3376fce', NULL, '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '2022-06-23', '2022-10-21', 120, 0, 'imp_930121942719', '2022-06-22 14:19:07', NULL, '010/4114/9697', '박범수', '캠핑의자,캠핑체어,스노우라인,유아의자,어린이캠핑', '2b35cd5b-2680-4f81-8db9-17090645c038.jpg', 960, 0, 960, 0, 0, 0),
	('22679442-ce59-41f8-8191-c5a26ee25ca3', 'captain9697@naver.com', '7374c5cb-e68b-4d65-84a9-013f0d1df57c', NULL, '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '2022-06-23', '2022-07-23', 30, 0, 'imp_380900755748', '2022-06-22 14:15:26', NULL, '010/4114/9697', '박범수', '라탄 전등갓 줄전구 조명', 'e54d899f-8a6c-4f49-bb89-8703196bf34b.jpg', 240, 0, 240, 0, 0, 0),
	('30583d96-16f7-41e6-943b-fc8781a372c4', 'jj3033@naver.com', 'd3e79f34-2906-4479-8d04-a8ce1dd22b2f', NULL, '02582/서울 동대문구 하정로5길 13/201/ (신설동, 신설동주상복합)', '02582/서울 동대문구 하정로5길 13/201/ (신설동, 신설동주상복합)', '2022-06-25', '2022-07-25', 30, 0, 'imp_771252843932', '2022-06-24 20:14:52', NULL, '010/9351/2557', '정태영', '캠핑공구', '92932f9e-e421-4228-b02c-4e8fc5a4ca40.jpg', 1200, 0, 1200, 0, 0, 0),
	('41037c96-315c-4ff7-816f-8a4ea1b85668', 'captain9697@naver.com', 'fdf38744-961f-4cef-995f-244380b49733', NULL, '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '2022-06-27', '2022-08-26', 60, 0, 'imp_788990596182', '2022-06-26 03:00:40', NULL, '010/4114/9697', '박범수', '캠핑웨건 상판 테이블', 'cd73069e-31d3-4920-b57b-462354326f24.jpg', 120, 0, 120, 0, 0, 0),
	('45fbb4be-4210-4bc9-b213-adfcd903d106', 'tkdals4534@naver.com', '15b74776-2033-4c01-9685-ed46aa6b937a', NULL, '16873/경기 용인시 수지구 대지로 18/201-1023/ (죽전동)', '16873/경기 용인시 수지구 대지로 18/201-1023/ (죽전동)', '2022-06-25', '2022-07-25', 30, 0, 'imp_608437621314', '2022-06-24 15:01:06', NULL, '010/9325/7941', '김재민', '도플갱어 타프 헥사', '31fb43d1-793d-4629-9c6e-05cbbdb73590.webp', 240, 0, 240, 0, 0, 0),
	('65c85b74-0085-4259-bcf2-454e295a5747', 'kedee2001@naver.com', '48acf057-13d0-411d-81dd-bec5b8e0cbf3', NULL, '16872/경기 용인시 수지구 대지로 49/106-4210/ (죽전동, 죽전퍼스트하임)', '16872/경기 용인시 수지구 대지로 49/106-4210/ (죽전동, 죽전퍼스트하임)', '2022-06-25', '2022-07-25', 30, 0, 'imp_826769629863', '2022-06-24 20:23:19', NULL, '010/9325/7941', '김재민', '불멍 캠핑 가정용 에탄올 난로 미니 ', 'ac89bba4-c826-4401-8e98-7ea2107d7934.webp', 240, 0, 240, 0, 0, 0),
	('7338e575-9b26-46fe-920f-9004098a3ef4', 'captain9697@naver.com', '52fb9c79-d83b-436a-b5be-5b27a6b13c33', NULL, '06035/서울 강남구 도산대로 402-2/울집/ (신사동)', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '2022-06-23', '2022-08-22', 60, 0, 'imp_254658714863', '2022-06-22 14:11:24', NULL, '010/4114/9697', '박범수', '바베큐,숯불 그릴/캠핑 그릴', '8af51708-419c-45d4-ba17-ecb5f6600e6c.jpg', 480, 0, 480, 0, 0, 0),
	('8aea6118-079c-4346-8341-f35f502c5bdf', 'captain9697@naver.com', 'a30ba851-23e6-4204-9bb0-10713e252175', NULL, '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '2022-06-27', '2022-09-25', 90, 0, 'imp_780759823528', '2022-06-26 02:56:34', NULL, '010/4114/9697', '박범수', '슈브 캠핑의자', 'c0b224d8-752d-4c78-9687-56794bf73be6.jpg', 180, 0, 180, 0, 0, 0),
	('92426f35-e817-4dbe-b3a4-480ad1736e39', 'captain9697@naver.com', 'e69e5842-2b0c-46a5-88f4-93b52fe15010', NULL, '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '2022-06-27', '2022-12-24', 180, 0, 'imp_729448440139', '2022-06-26 03:08:01', NULL, '010/4114/9697', '박범수', '시어잘 Searing Torch', '718b6684-e70f-49a6-8730-beaa5bc1279a.jpg', 144, 0, 144, 0, 0, 0),
	('9c8aeeec-1baa-4ab8-8c7d-b6b4b30eca56', 'captain9697@naver.com', 'e994e191-17b0-4873-8f2d-ecfc6995cc6b', NULL, '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '2022-06-27', '2022-11-24', 150, 0, 'imp_254848114044', '2022-06-26 02:41:34', NULL, '010/4114/9697', '박범수', '캠핑 BBQ Fire Pit', 'b3abae9b-a273-4a8d-a8dd-90490dcded83.jpg', 1200, 0, 1200, 0, 0, 0),
	('9dfe1911-0e38-4ba1-b42d-6b6a3eccf3a7', 'captain9697@naver.com', '99f507f0-3de6-4cb8-a6ff-95cb0211f1bf', NULL, '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '2022-06-25', '2022-11-22', 150, 0, 'imp_545723625829', '2022-06-24 20:22:30', NULL, '010/4114/9697', '박범수', '캠핑테이블 정원테이블', '41375b42-535e-4438-a7dd-4abef77bf30a.jpg', 1200, 1000, 200, 0, 0, 0),
	('a0279fe2-bbd9-40b2-954f-0f9cebf88066', 'captain9697@naver.com', '617da7b3-13d2-45d0-9e67-2ff8a703c954', NULL, '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '2022-06-27', '2022-08-26', 60, 0, 'imp_477264053728', '2022-06-26 02:48:31', NULL, '010/4114/9697', '박범수', '캠핑웨건, 테이블, 의자', '371cad15-92aa-4f4f-a189-45abebcf11b4.jpg', 240, 0, 240, 0, 0, 0),
	('aaa0ea17-47f7-434a-8d96-205885d4dfc8', 'sanstory12rt@naver.com', '22367a5f-9b0a-4ecc-9464-7f7eed170e07', NULL, '13473/경기 성남시 분당구 경부고속도로 409/220-4431/ (삼평동)', '13473/경기 성남시 분당구 경부고속도로 409/220-4431/ (삼평동)', '2022-06-25', '2022-07-25', 30, 0, 'imp_973425702485', '2022-06-24 15:51:20', NULL, '010/1618/2322', '형산', '브래마 3 400 카라반 어닝 하우스', '2181ebf6-5ce8-46ad-ac1f-22e1d8b3e4dc.webp', 240, 0, 240, 0, 0, 0),
	('b7802b51-e849-4360-bc83-82f11c6ac366', 'captain9697@naver.com', '15b74776-2033-4c01-9685-ed46aa6b937a', '123', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', '2022-06-27', '2022-06-30', 3, 1, 'imp_311664390360', '2022-06-26 03:11:40', NULL, '010/4114/9697', '박범수', '도플갱어 타프 헥사', '31fb43d1-793d-4629-9c6e-05cbbdb73590.webp', 10000, 29700, 300, 0, 0, 0),
	('ca561fcf-372a-4e2d-b57f-2667dd4a1e1e', 'qwerty5266@naver.com', 'a4ea7134-168b-4005-9dca-b0ac5d66c8bb', NULL, '13494/경기 성남시 분당구 판교역로 235/124-1244/ (삼평동)', '13494/경기 성남시 분당구 판교역로 235/124-1244/ (삼평동)', '2022-06-25', '2022-07-25', 30, 0, 'imp_446927484667', '2022-06-24 15:26:01', NULL, '010/1618/1315', '김명선', '스마랑 인조라탄 야외 원형소파베드세트', '942e74da-1389-45f5-b283-8504d098fb07.webp', 240, 0, 240, 0, 0, 0),
	('cbea7a44-9b82-410b-bab7-2ebfaece40e4', 'tkdals4534@naver.com', '921f14e2-f6ad-4db5-961c-2a21caa4bea2', NULL, '16873/경기 용인시 수지구 대지로 18/204-4201/ (죽전동)', '16873/경기 용인시 수지구 대지로 18/204-4201/ (죽전동)', '2022-06-25', '2022-07-25', 30, 0, 'imp_555908516681', '2022-06-24 15:09:06', NULL, '010/9325/7941', '김재민', '썬샤인 라탄 야외 7인 테이블 소파 ', '4a22dd61-c8db-40b8-afcd-1d7216196071.webp', 240, 0, 240, 0, 0, 0),
	('e894afe9-9930-4e8b-a623-be1f549598a6', 'sanstory12rt@naver.com', '3aa1ecde-b497-46a7-b629-b1ad08342da1', NULL, '06035/서울 강남구 가로수길 5/5986호/ (신사동)', '55744/전북 남원시 광주대구고속도로 51/145호/ (화정동)', '2022-06-25', '2022-07-25', 30, 0, 'imp_929562411718', '2022-06-24 20:20:01', NULL, '010/9088/1313', '형산', '감성좋은 행복한 텐트', '40eff2d4-dce4-4fba-a7cc-68e2c072bf7c.jpg', 1200, 1000, 200, 0, 0, 0),
	('fa71492a-8a7d-4192-b421-ecef023fa32b', 'qwerty5266@naver.com', '29cadabb-2982-4ff2-abd3-c621eff8fe4c', NULL, '13485/경기 성남시 분당구 판교로 20/405/ (판교동, 판교원마을3단지아파트)', '06035/서울 강남구 가로수길 5/505/ (신사동)', '2022-06-25', '2022-07-25', 30, 0, 'imp_021665200895', '2022-06-24 20:21:59', NULL, '010/9399/5266', '김명선', '메이튼 캠핑 랜턴 조명 감성 LED ', '5a2ecf73-e626-4345-a29f-dd52e4d806c9.jpg', 1200, 1000, 200, 0, 0, 0),
	('ff7950bf-b224-4360-a5f6-41b4fd63e287', 'sanstory12rt@naver.com', '4a0ad7a7-8f0c-4900-8518-69c8c2a9c2aa', NULL, '13487/경기 성남시 분당구 대왕판교로 579/22-232/ (삼평동)', '13487/경기 성남시 분당구 대왕판교로 579/22-232/ (삼평동)', '2022-06-25', '2022-07-25', 30, 0, 'imp_582502457447', '2022-06-24 15:36:07', NULL, '010/5532/1131', '형산', '리버 프로 + 110W태양광패널', 'a1bdb845-cea3-4229-b0d3-77eadd70fc24.jpg', 240, 0, 240, 0, 0, 0);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;

-- 테이블 forrest.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `userId` varchar(30) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `userAddr` varchar(100) NOT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'user',
  `joinDate` datetime NOT NULL,
  `joinPath` varchar(10) NOT NULL,
  `userImg` varchar(100) DEFAULT NULL,
  `recentDate` datetime NOT NULL DEFAULT current_timestamp(),
  `pushToken` varchar(100) DEFAULT NULL,
  `leaveApplyDate` datetime DEFAULT NULL,
  `leaveDate` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `nickname` (`nickname`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 forrest.user:~10 rows (대략적) 내보내기
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`userId`, `nickname`, `phone`, `password`, `userName`, `userAddr`, `role`, `joinDate`, `joinPath`, `userImg`, `recentDate`, `pushToken`, `leaveApplyDate`, `leaveDate`) VALUES
	('admin', '어드민', '01011111111', '$2a$10$jX/xb.arDJYDOqokfAJNkeg3ISGU1vTHG1t7lA2TxR7xbgTYVb6RG', '어드민', '16979/경기 용인시 기흥구 구갈동 591-2/ (구갈동)', 'admin', '2022-06-24 00:00:00', 'own', 'adminImg.jpg', '2022-06-24 19:51:02', NULL, NULL, NULL),
	('captain9697@naver.com', '구스범수', '010/4114/9697', '$2a$10$jX/xb.arDJYDOqokfAJNkeg3ISGU1vTHG1t7lA2TxR7xbgTYVb6RG', '박범수', '13271/경기 성남시 수정구 산성대로 341/5동 502호/ (신흥동, 한신아파트)', 'user', '2022-06-24 00:00:00', 'own', 'goosebeomImg.jpg', '2022-06-26 03:03:11', NULL, NULL, NULL),
	('jj3033@naver.com', '금붕어회', '01093512557', '$2a$10$jX/xb.arDJYDOqokfAJNkeg3ISGU1vTHG1t7lA2TxR7xbgTYVb6RG', '정태영', '02582/서울 동대문구 신설동 98-49/201/ (신설동, 신설동주상복합)', 'user', '2022-06-23 00:09:41', 'own', '37b5c554-62db-4fbb-bbfb-0d0ff63d415b.jpg', '2022-06-24 20:18:22', NULL, NULL, NULL),
	('kedee2001@naver.com', '쥄쥄', '01093257941', '$2a$10$jX/xb.arDJYDOqokfAJNkeg3ISGU1vTHG1t7lA2TxR7xbgTYVb6RG', '김재민', '16872/경기 용인시 수지구 대지로 49/ (죽전동, 죽전퍼스트하임)', 'user', '2022-06-24 13:27:18', 'own', '가지.jpg', '2022-06-24 20:19:17', NULL, NULL, NULL),
	('qwerty5266@naver.com', '띵띵', '01093995266', '$2a$10$jX/xb.arDJYDOqokfAJNkeg3ISGU1vTHG1t7lA2TxR7xbgTYVb6RG', '김명선', '14999/경기 시흥시 군자동 810/204-1402/ (군자동, 한여울 초등학교)', 'user', '2022-06-23 01:19:41', 'own', 'chacha.JPG', '2022-06-24 20:17:59', NULL, NULL, NULL),
	('sanstory12rt@naver.com', '과자조아', '010/8783/6065', '$2a$10$jX/xb.arDJYDOqokfAJNkeg3ISGU1vTHG1t7lA2TxR7xbgTYVb6RG', '형산', '18112/경기 오산시 세교동 587/303-4201/ (세교동, 오산세교주상1블록)', 'user', '2022-06-24 00:00:00', 'own', 'iu.jpg', '2022-06-26 02:49:58', NULL, NULL, NULL),
	('tkdals4534@naver.com', '이어폰폴펜', '01033294534', '$2a$10$jX/xb.arDJYDOqokfAJNkeg3ISGU1vTHG1t7lA2TxR7xbgTYVb6RG', '이상민', '13121/경기 성남시 수정구 창곡동 501/3603동 1112호/ (창곡동, 성남위례 LH36단지)', 'user', '2022-06-22 09:45:34', 'own', NULL, '2022-06-26 03:12:21', NULL, NULL, NULL),
	('user01@naver.com', '김유정', '01012345678', '$2a$10$jX/xb.arDJYDOqokfAJNkeg3ISGU1vTHG1t7lA2TxR7xbgTYVb6RG', '김유정', '13494/경기 성남시 분당구 삼평동 681/26-805/ (삼평동, 에이치스퀘어 엔동)', 'user', '2022-06-24 00:00:00', 'own', 'user01Img.jpg', '2022-06-24 19:51:23', NULL, NULL, NULL),
	('user02@naver.com', '고영희좋아', '01023456781', '$2a$10$jX/xb.arDJYDOqokfAJNkeg3ISGU1vTHG1t7lA2TxR7xbgTYVb6RG', '고영희', '04981/서울 광진구 구의동 164-5/101-150/ (구의동, 구의야구공원)', 'user', '2022-06-24 00:00:00', 'own', '아이유.jpg', '2022-06-24 00:00:00', NULL, NULL, NULL),
	('user03@naver.com', '나도좋아', '01034567891', '$2a$10$jX/xb.arDJYDOqokfAJNkeg3ISGU1vTHG1t7lA2TxR7xbgTYVb6RG', '나좋아', '06134/서울 강남구 강남대로94길 20 삼오빌딩 9층/ (역삼동, 비트캠프 강남센터)', 'user', '2022-06-24 00:00:00', 'own', '고영희.jpg', '2022-06-24 13:24:15', NULL, NULL, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- 테이블 forrest.wishlist 구조 내보내기
CREATE TABLE IF NOT EXISTS `wishlist` (
  `wishlistNo` int(11) NOT NULL AUTO_INCREMENT,
  `prodNo` varchar(40) NOT NULL,
  `wishedUserId` varchar(30) NOT NULL,
  `period` int(11) DEFAULT NULL,
  PRIMARY KEY (`wishlistNo`),
  KEY `wishedUserId` (`wishedUserId`),
  KEY `prodNo` (`prodNo`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`wishedUserId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`prodNo`) REFERENCES `product` (`prodNo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 테이블 데이터 forrest.wishlist:~2 rows (대략적) 내보내기
DELETE FROM `wishlist`;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` (`wishlistNo`, `prodNo`, `wishedUserId`, `period`) VALUES
	(1, '7374c5cb-e68b-4d65-84a9-013f0d1df57c', 'sanstory12rt@naver.com', 0),
	(2, 'b37a6c88-8ec7-4d39-9e6b-8474e3376fce', 'sanstory12rt@naver.com', 0);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
