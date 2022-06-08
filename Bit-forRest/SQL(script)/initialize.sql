SET foreign_key_checks=0;
DROP TABLE board, chat, chatimg, chatroom, coupon, imgs, `old`, oldlike, oldreview, owncoupon, product, rentalreview, report, `transaction`, user, wishlist;


CREATE TABLE user (
   userId      VARCHAR(30)   NOT NULL,
   nickname      VARCHAR(30)    NOT NULL UNIQUE,
   phone VARCHAR(20) NOT NULL UNIQUE, 
   password VARCHAR(20) NOT NULL,
   userName VARCHAR(20) NOT NULL,
   userAddr VARCHAR(100) NOT NULL,
   role VARCHAR(10) NOT NULL DEFAULT 'user',
   joinDate DATETIME NOT NULL,
   joinPath VARCHAR(10) NOT NULL,
   userImg VARCHAR(100),
   recentDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   pushToken VARCHAR(100),
   leaveApplyDate DATETIME,
   leaveDate DATETIME, 
   PRIMARY KEY (userId)   
);

CREATE TABLE product 
(
   prodNo INTEGER NOT NULL AUTO_INCREMENT,
   width INTEGER NOT NULL,
   length INTEGER NOT NULL,
   height INTEGER NOT NULL,
   userId VARCHAR(30) NOT NULL,
   prodCondition VARCHAR(30) NOT NULL DEFAULT '��ǰ�������ν�û��',
   prodName VARCHAR(40) NOT NULL,
   prodQuantity INTEGER NOT NULL,
   prodDetail VARCHAR(600) NOT NULL,
   isRental TINYINT(1) NOT NULL DEFAULT 0,
   rentalCounting INTEGER,
   rentalPrice INTEGER,
   account VARCHAR(30),
   deposit INTEGER,
   category VARCHAR(10) NOT NULL,
   returnAddress VARCHAR(100) NOT NULL,
   prodImg VARCHAR(100) NOT NULL,
   recentImg VARCHAR(100),
   PRIMARY KEY (prodNo)
);

ALTER TABLE product ADD FOREIGN KEY(userId) REFERENCES user(userId);

CREATE TABLE transaction
(
   tranNo INTEGER NOT NULL,
   userId VARCHAR(30) NOT NULL,
   prodNo INTEGER NOT NULL,
   divyAddress VARCHAR(100) NOT NULL,
   pickupAddress VARCHAR(100) NOT NULL,
   startDate DATE NOT NULL,
   endDate DATE NOT NULL,
   period INTEGER NOT NULL,
   tranCode TINYINT(1) NOT NULL DEFAULT 0,
   paymentNo VARCHAR(30) NOT NULL,
   paymentDate DATETIME,
   paymentWay VARCHAR(50),
   receiverPhone VARCHAR(50),
   receiverName VARCHAR(50),
   prodName VARCHAR(40) NOT NULL,
   prodImg VARCHAR(100) NOT NULL,
   originPrice INTEGER NOT NULL,
   discountPrice INTEGER,
   resultPrice INTEGER,
   PRIMARY KEY (tranNo)
);

ALTER TABLE transaction ADD FOREIGN KEY(userId) REFERENCES user(userId);
ALTER TABLE transaction ADD FOREIGN KEY(prodNo) REFERENCES product(prodNo);


CREATE TABLE old (
   oldNo INTEGER NOT NULL AUTO_INCREMENT,
   userId VARCHAR(30) NOT NULL,
   oldPrice INTEGER NOT NULL,
   oldTitle VARCHAR(100) NOT NULL,
   oldDetail VARCHAR(8000) NOT NULL,
   oldDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   oldView INTEGER NOT NULL,
   category VARCHAR(10) NOT NULL,
   oldState TINYINT(1)   NOT NULL DEFAULT 1,
   oldImg VARCHAR(30) NOT NULL,
   oldAddr VARCHAR(100) NOT NULL,
   PRIMARY KEY (oldNo),
   FOREIGN KEY (userId) REFERENCES user(userId)
);



CREATE TABLE coupon(
   couponNo   INTEGER   NOT NULL AUTO_INCREMENT,
   couponName   VARCHAR(50)   NOT NULL,
   couponCreDate   DATETIME      ,
   couponDelDate   DATETIME      ,   
   discount      DOUBLE   NOT NULL,
   PRIMARY KEY (couponNo)
);


CREATE TABLE ownCoupon(
   ownCouponNo         INTEGER      NOT NULL AUTO_INCREMENT,
   userId            VARCHAR(30)      NOT NULL,
   couponNo            INTEGER      NOT NULL,
   ownCouponCreDate   DATETIME         NOT NULL,
   ownCouponDelDate   DATETIME         NOT NULL,
   PRIMARY KEY(ownCouponNo),
   FOREIGN KEY(userId) REFERENCES user(userId),
   FOREIGN KEY(couponNo) REFERENCES coupon(couponNo)
);


CREATE TABLE wishList
(
   wishlistNo INTEGER NOT NULL AUTO_INCREMENT,
   prodNo INTEGER NOT NULL,
   userId VARCHAR(30) NOT NULL,
   PRIMARY KEY (wishlistNo)
);

ALTER TABLE wishList ADD FOREIGN KEY(userId) REFERENCES user(userId);
ALTER TABLE wishList ADD FOREIGN KEY(prodNo) REFERENCES product(prodNo);

CREATE TABLE rentalReview
(
   reviewNo INTEGER NOT NULL AUTO_INCREMENT,
   reviewImg VARCHAR(200) NOT NULL,
   reviewDetail VARCHAR(600) NOT NULL,
   reviewScore INTEGER NOT NULL,
   prodNo INTEGER NOT NULL,
   userId VARCHAR(30) NOT NULL,
   regDate DATE NOT NULL,
   PRIMARY KEY (reviewNo)
);

ALTER TABLE rentalReview ADD FOREIGN KEY(userId) REFERENCES user(userId);
ALTER TABLE rentalReview ADD FOREIGN KEY(prodNo) REFERENCES product(prodNo);

CREATE TABLE `chatRoom` (
  `chatRoomNo` int NOT NULL AUTO_INCREMENT,
  `oldNo` int DEFAULT NULL,
  `prodNo` int DEFAULT NULL,
  `inquireUserId` varchar(30) NOT NULL,
  `ownerUserId` varchar(30) NOT NULL,
  `inquireUserExit` tinyint(1) NOT NULL DEFAULT '0',
  `ownerUserExit` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`chatRoomNo`),
  KEY `oldNo` (`oldNo`),
  KEY `prodNo` (`prodNo`),
  KEY `inquireUserId` (`inquireUserId`),
  KEY `ownerUserId` (`ownerUserId`),
  CONSTRAINT `chatroom_ibfk_1` FOREIGN KEY (`oldNo`) REFERENCES `old` (`oldNo`),
  CONSTRAINT `chatroom_ibfk_2` FOREIGN KEY (`prodNo`) REFERENCES `product` (`prodNo`),
  CONSTRAINT `chatroom_ibfk_3` FOREIGN KEY (`inquireUserId`) REFERENCES `user` (`userId`),
  CONSTRAINT `chatroom_ibfk_4` FOREIGN KEY (`ownerUserId`) REFERENCES `user` (`userId`) 
);

CREATE TABLE `chat` (
  `chatMessageNo` int NOT NULL AUTO_INCREMENT,
  `chatRoomNo` int NOT NULL,
  `sendUserId` varchar(30) NOT NULL,
  `chatMessage` varchar(4000) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `readOrNot` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`chatMessageNo`),
  KEY `chatRoomNo` (`chatRoomNo`),
  KEY `sendUserId` (`sendUserId`),
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`chatRoomNo`) REFERENCES `chatRoom` (`chatRoomNo`),
  CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`sendUserId`) REFERENCES `user` (`userId`) 
);

CREATE TABLE `chatImg` (
  `chatImgNo` int NOT NULL AUTO_INCREMENT,
  `chatMessageNo` int NOT NULL,
  `fileName` varchar(1000) NOT NULL,
  PRIMARY KEY (`chatImgNo`),
  KEY `chatMessageNo` (`chatMessageNo`),
  CONSTRAINT `chatimg_ibfk_1` FOREIGN KEY (`chatMessageNo`) REFERENCES `chat` (`chatMessageNo`)
);

CREATE TABLE `board` (
  `boardNo` int NOT NULL AUTO_INCREMENT,
  `boardTitle` varchar(50) NOT NULL DEFAULT '',
  `boardDetail` varchar(50) NOT NULL DEFAULT '',
  `boardDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `boardPin` int DEFAULT 0, 
  `boardFlag` varchar(2) NOT NULL, 
  `category` varchar(10), 
  PRIMARY KEY (`boardNo`)
);

CREATE TABLE `imgs` (
  `imgNo` int NOT NULL AUTO_INCREMENT,
  `contentsNo` int DEFAULT NULL,
  `fileName` varchar(100) DEFAULT NULL,
  `contentsFlag` varchar(20) NOT NULL,
  PRIMARY KEY (`imgNo`)
);

CREATE TABLE oldlike(
	oldLikeNo			INTEGER 	NOT NULL	AUTO_INCREMENT,
	oldNo 			INTEGER		NOT NULL 	REFERENCES     old(oldNo),
	userId			VARCHAR(30)	NOT NULL 	REFERENCES     user(userId),
	PRIMARY KEY(oldLikeNo)
);

CREATE TABLE oldReview(
	oldReviewNo	INTEGER		NOT NULL	AUTO_INCREMENT,
	reviewUserId	VARCHAR(30)	NOT NULL	REFERENCES	user(userId),
	reviewedUserId	VARCHAR(30)	NOT NULL	REFERENCES	user(userId),
	oldNo		INTEGER		NOT NULL	REFERENCES	old(oldNo),
	reviewDetail	VARCHAR(100),
	userRate		DOUBLE,
	reviewDate	DATE 		NOT NULL	DEFAULT (CURRENT_DATE),
	PRIMARY KEY(oldReviewNo)
);

CREATE TABLE report(
	reportNo		INTEGER		NOT NULL	AUTO_INCREMENT,
	reportUser		VARCHAR(30)	NOT NULL 	REFERENCES	user(userId),
	reportedUser	VARCHAR(30)	NOT NULL 	REFERENCES	user(userId),
	reportOldNo	INTEGER		NOT NULL	REFERENCES	old(oldNo),
	reportChatroomNo	INTEGER,
	reportCategory	VARCHAR(20),
	reportDate	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	reportDetail	VARCHAR(100),
	reportChat	VARCHAR(4000),
	reportCode	TINYINT(1),
	PRIMARY KEY(reportNo)
);	


INSERT INTO user
VALUES ('admin','adminNickname','adminphone','1234','adminName','adminAddr','admin',CURDATE(),'own','adminImg',CURDATE(),NULL,NULL,NULL);

INSERT INTO user
VALUES ('user01@naver.com','user01','user01Phone','1111','user01Name','user01Addr','user',CURDATE(),'own','user01Img',CURDATE(),NULL,NULL,NULL);

INSERT INTO user
VALUES ('user02@naver.com','user02','user02Phone','2222','user02Name','user02Addr','user',CURDATE(),'own','user02Img',CURDATE(),NULL,NULL,NULL);

INSERT INTO user
VALUES ('user03@naver.com','user03','user03Phone','3333','user03Name','user03Addr','user',CURDATE(),'own','user03Img',CURDATE(),NULL,NULL,NULL);

INSERT INTO user
VALUES ('user04@naver.com','user04','user04Phone','4444','user04Name','user04Addr','user',CURDATE(),'own','user04Img',CURDATE(),NULL,NULL,NULL);

INSERT INTO user
VALUES ('user05@naver.com','user05','user05Phone','5555','user05Name','user05Addr','user',CURDATE(),'own','user05Img',CURDATE(),NULL,NULL,NULL);

INSERT INTO user
VALUES ('user06@naver.com','user06','user06Phone','6666','user06Name','user06Addr','user',CURDATE(),'own','user06Img',CURDATE(),NULL,NULL,NULL);

INSERT INTO user
VALUES ('user10@naver.com','user10','user10Phone','1010','user10Name','user10Addr','leave',CURDATE(),'own','user10Img',CURDATE(),NULL,NULL,NULL);

INSERT INTO user
VALUES ('user20@naver.com','user20','user20Phone','2020','user20Name','user20Addr','restrict',CURDATE(),'own','user20Img',CURDATE(),NULL,NULL,NULL);

INSERT INTO old
VALUES (NULL,'user01@naver.com',40000,'����ħ��','���̽�',CURRENT_TIMESTAMP(),0,'ħ��',TRUE,'aaa.jpg','�Ｚ��');

INSERT INTO old
VALUES (NULL,'user02@naver.com',90000,'1�ο� ��Ʈ','��������',CURRENT_TIMESTAMP(),0,'��Ʈ',TRUE,'bbb.jpg','������');

INSERT INTO old
VALUES (NULL,'user03@naver.com',40000,'���̽� ����','����',CURRENT_TIMESTAMP(),0,'����',TRUE,'ccc.jpg','������');

INSERT INTO old
VALUES (NULL,'user04@naver.com',30000,'�ٺ�ť �׸�','2�� ���',CURRENT_TIMESTAMP(),0,'�׸�',TRUE,'ddd.jpg','��ȫ��');

INSERT INTO old
VALUES (NULL,'user05@naver.com',5000,'�޴�� ����','������',CURRENT_TIMESTAMP(),0,'����',TRUE,'eee.jpg','������');

INSERT INTO old
VALUES (NULL,'user06@naver.com',20000,'��������','LED',CURRENT_TIMESTAMP(),0,'����',TRUE,'fff.jpg','������');

INSERT INTO old
VALUES (NULL,'user01@naver.com',70000,'���̽� ���̺�','���ǻ���',CURRENT_TIMESTAMP(),0,'���̺�',TRUE,'ggg.jpg','������');

INSERT INTO old
VALUES (NULL,'user02@naver.com',20000,'�� ���� �ı� ��Ʈ','����304',CURRENT_TIMESTAMP(),0,'�ı�',TRUE,'hhh.jpg','�Ｚ��');

INSERT INTO old
VALUES (NULL,'user03@naver.com',120000,'��������','�۳⿡ ����', CURRENT_TIMESTAMP(),0,'����',TRUE,'iii.jpg','���ʵ�');

INSERT INTO old
VALUES (NULL,'user04@naver.com',10000,'���̽��ڽ�','10L',CURRENT_TIMESTAMP(),0,'��Ÿ��ǰ',TRUE,'jjj.jpg','���ʵ�');

INSERT INTO product  (width, length, height, userId, prodCondition, prodName, prodQuantity, prodDetail, isRental, rentalCounting, rentalPrice, account, deposit, category, returnAddress, prodImg) VALUES (100, 30, 12, 'user01@naver.com', '������', 'Ư���� ������Ʈ', 1, 'Ư���� ���� ��Ʈ �Ǹ��մϴ�. ������ ��ǰ ������ 3ȸ����߽��ϴ�. ������ ������ ķ�� ��Ұ� ������ ��ĿƮ �κп� ����� ������ �ֽ��ϴ�. ���� �����ϴ�.', 1, 0, 10000, '���� 478102-04-386651', 30000, '��Ʈ', '13271 ������ ������ ����2�� �ѽž���Ʈ 5�� 502ȣ', '1.jpg');

INSERT INTO product  (width, length, height, userId, prodCondition, prodName, prodQuantity, prodDetail, isRental, rentalCounting, rentalPrice, account, deposit, category, returnAddress, prodImg) VALUES (40, 30, 15, 'user01@naver.com', '������', 'ķ�� �������� ����', 1, 'ķ���ϴ� ���� �� ��µ� �ٸ� ��ǰ�� �����ϰ� �ż� �����մϴ�. ��밨 ������ �����̳� ���� ��� ����ϴµ� ���� ���� �����ϴ�~', 1, 0, 8000, '���� 478102-04-386651', 10000, '����', '13271 ������ ������ ����2�� �ѽž���Ʈ 5�� 502ȣ', '1.jpg');

INSERT INTO product  (width, length, height, userId, prodCondition, prodName, prodQuantity, prodDetail, isRental, rentalCounting, rentalPrice, account, deposit, category, returnAddress, prodImg) VALUES (30, 30, 60, 'user01@naver.com', '������', '����īTS-77A����Ʈķ�γ���', 1, '����īTS-77S����Ʈ ķ�γ��� �������� �������� �������� �⸧���� ���� ������ �ڹٶ� �������밡�� ���� 4������Ʈ�Ǹ� 2021��8������', 1, 0, 10000, '���� 478102-04-386651', 30000, '��Ʈ', '13271 ������ ������ ����2�� �ѽž���Ʈ 5�� 502ȣ', '1.jpg');

INSERT INTO product  (width, length, height, userId, prodCondition, prodName, prodQuantity, prodDetail,isRental, rentalCounting, rentalPrice, account, deposit, category, returnAddress, prodImg) VALUES (60, 30, 20, 'user02@naver.com', '������', '���� �޴������׸�', 1, '�׽�Ʈ��1ȸ����� �����ϰ� �۾Ƶ����Ϲٷλ�밡�� ��Ѱ� ���� �������ð� ������ �����ϰ� �̿��ϼ���. ', 1, 0, 5000, '���� 478102-04-386651', 10000, '�׸�', '18125 ��� ����� ����1�� 13 (�����ְ�����Ʈ) 102�� 1201ȣ ', '2.jpg');

INSERT INTO product  (width, length, height, userId, prodCondition, prodName, prodQuantity, prodDetail, category, returnAddress, prodImg) VALUES (20, 60, 10, 'user03@naver.com', '������', '�������� ������ ü��', 1, '���̹� ķ������ ��ŷ ������ �������� ������ü���Դϴ�. ķ���̳� ���� � Ȱ�� ������ �� ���׿� ������ ���ǵ��Դϴ�. 3ȸ�ۿ� �����ؼ� ���´� ���ſ� ũ�� �ٸ� �����ϴ�.', '����', '01849 ���� ����� ������ 111 (��������) A�� 103ȣ', '3.jpg');

INSERT INTO product  (width, length, height, userId, prodCondition, prodName, prodQuantity, prodDetail, category, returnAddress, prodImg) VALUES (73, 45, 10, 'user04@naver.com', '�԰���', 'ķ�����̺� ķ�ιڽ� Ȯ����', 1, 'Ȯ����������̺�+��ݻ���6ȣ', '���̺�', '������ �߿��� ����2�� �ְ�����Ʈ 120�� 1001ȣ', '4.jpg');

INSERT INTO product  (width, length, height, userId, prodCondition, prodName, prodQuantity, prodDetail, category, returnAddress, prodImg) VALUES (73, 45, 10, 'user01@naver.com', '���Ϸ�', 'ķ�����̺� ķ�ιڽ� Ȯ����1', 1, 'Ȯ����������̺�+��ݻ���6ȣ', '���̺�', '������ �߿��� ����2�� �ְ�����Ʈ 120�� 1001ȣ', '4.jpg');

INSERT INTO product  (width, length, height, userId, prodCondition, prodName, prodQuantity, prodDetail, category, returnAddress, prodImg) VALUES (73, 45, 10, 'user01@naver.com', '���Ϸ�', 'ķ�����̺� ķ�ιڽ� Ȯ����2', 1, 'Ȯ����������̺�+��ݻ���6ȣ', '���̺�', '������ �߿��� ����2�� �ְ�����Ʈ 120�� 1001ȣ', '4.jpg');

INSERT INTO transaction(tranNo, userId, prodNo, divyAddress, pickupAddress, startDate, endDate, period, paymentNo, paymentDate, paymentWay, receiverPhone, receiverName, prodName, prodImg, originPrice, discountPrice, resultPrice)
values (1, 'user01@naver.com', 1, '���ﵿ1', '���ﵿ2', date_add(curdate(), interval 1 day), date_add(curdate(), interval 1+30 day), 30, 'imp-1002', current_timestamp(), '�̴Ͻý�', '010-4114-9697', '�ڹ���', 'Ư���� ������Ʈ', '1.jpg', 20000, 2000, 18000);

INSERT INTO transaction(tranNo, userId, prodNo, divyAddress, pickupAddress, startDate, endDate, period, paymentNo, paymentDate, paymentWay, receiverPhone, receiverName, prodName, prodImg, originPrice, discountPrice, resultPrice)
values (2, 'user01@naver.com', 2, '���ﵿ1', '���ﵿ2', date_add(curdate(), interval 1 day), date_add(curdate(), interval 1+30 day), 30, 'imp-1002', current_timestamp(), '�̴Ͻý�', '010-4114-9697', '�ڹ���', 'ķ�� �������� ����', '1.jpg', 20000, 2000, 18000);

INSERT INTO transaction(tranNo, userId, prodNo, divyAddress, pickupAddress, startDate, endDate, period, paymentNo, paymentDate, paymentWay, receiverPhone, receiverName, prodName, prodImg, originPrice, discountPrice, resultPrice)
values (3, 'user01@naver.com', 3, '���ﵿ1', '���ﵿ2', date_add(curdate(), interval 1 day), date_add(curdate(), interval 1+30 day), 30, 'imp-1002', current_timestamp(), '�̴Ͻý�', '010-4114-9697', '�ڹ���', '����īTS-77A����Ʈķ�γ���', '1.jpg', 20000, 2000, 18000);

INSERT INTO transaction(tranNo, userId, prodNo, divyAddress, pickupAddress, startDate, endDate, period, paymentNo, paymentDate, paymentWay, receiverPhone, receiverName, prodName, prodImg, originPrice, discountPrice, resultPrice)
values (4, 'user02@naver.com', 4, '������1', '������2', date_add(curdate(), interval 1 day), date_add(curdate(), interval 1+60 day), 60, 'imp-1003', current_timestamp(), '�̴Ͻý�', '010-8283-5621', '�����', '���� �޴������׸�', '2.jpg', 25000, 1000, 24000);

INSERT INTO transaction(tranNo, userId, prodNo, divyAddress, pickupAddress, startDate, endDate, period, paymentNo, paymentDate, paymentWay, receiverPhone, receiverName, prodName, prodImg, originPrice, discountPrice, resultPrice)
values (5, 'user03@naver.com', 5, '��Ʈķ��1', '��Ʈķ��2', date_add(curdate(), interval 1 day), date_add(curdate(), interval 1+90 day), 90, 'imp-1004', current_timestamp(), '�̴Ͻý�', '010-2091-9728', '�̻��', '�������� ������ ü��', '3.jpg', 30000, 0, 30000);

INSERT INTO transaction(tranNo, userId, prodNo, divyAddress, pickupAddress, startDate, endDate, period, paymentNo, paymentDate, paymentWay, receiverPhone, receiverName, prodName, prodImg, originPrice, discountPrice, resultPrice)
values (6, 'user04@naver.com', 6, '������1', '������2', date_add(curdate(), interval 1 day), date_add(curdate(), interval 1+120 day), 120, 'imp-1005', current_timestamp(), '�̴Ͻý�', '010-8294-1923', '���', 'ķ�����̺� ķ�ιڽ� Ȯ����', '4.jpg', 40000, 0, 40000);

INSERT INTO transaction(tranNo, userId, prodNo, divyAddress, pickupAddress, startDate, endDate, period, paymentNo, paymentDate, paymentWay, receiverPhone, receiverName, prodName, prodImg, originPrice, discountPrice, resultPrice)
values (7, 'user01@naver.com', 7, '������1', '������2', date_add(curdate(), interval 1 day), date_add(curdate(), interval 1+120 day), 120, 'imp-1005', current_timestamp(), '�̴Ͻý�', '010-8294-1923', '���', 'ķ�����̺� ķ�ιڽ� Ȯ����1', '4.jpg', 40000, 0, 40000);

INSERT INTO transaction(tranNo, userId, prodNo, divyAddress, pickupAddress, startDate, endDate, period, paymentNo, paymentDate, paymentWay, receiverPhone, receiverName, prodName, prodImg, originPrice, discountPrice, resultPrice)
values (8, 'user01@naver.com', 8, '������1', '������2', date_add(curdate(), interval 1 day), date_add(curdate(), interval 1+120 day), 120, 'imp-1005', current_timestamp(), '�̴Ͻý�', '010-8294-1923', '���', 'ķ�����̺� ķ�ιڽ� Ȯ����2', '4.jpg', 40000, 0, 40000);

INSERT INTO transaction  (tranNo , userId , prodNo, divyAddress, pickupAddress, startDate, endDate, period, tranCode, paymentNo, paymentDate, paymentWay, receiverPhone, receiverName, prodName, prodImg, originPrice, discountPrice, resultPrice ) VALUES ('10031', 'user04@naver.com', '1', '����Ư���� ��Ʈķ��', '�λ걤���� �ؿ�뱸', '2021-05-30', '2021-05-31', '20', TRUE, '20030', '2021-05-30 20:19:15', '������ü', '01087836060', 'ȫ�浿', '��Ʈ' , '1.jpg', '10000', '500', '20000' );

INSERT INTO wishlist (wishlistNo, prodNo, userId) VALUES (NULL, '1', 'user05@naver.com');

INSERT INTO rentalReview (reviewNo, reviewImg, reviewDetail,reviewScore, prodNo, userId, regDate ) VALUES (NULL, '1.jpg', '��ǰ�󼼼����Դϴ�', '3', '1', 'user03@naver.com', '20210525');

INSERT INTO `chatroom` (`chatRoomNo`, `oldNo`, `prodNo`, `inquireUserId`, `ownerUserId`, `inquireUserExit`, `ownerUserExit`, `createdAt`) VALUES
	(1, 1, NULL, 'user02@naver.com', 'user01@naver.com', 1, 1, '2022-05-30 18:21:00'),
	(2, 1, NULL, 'user03@naver.com', 'user01@naver.com', 1, 1, '2022-05-30 18:21:42'),
	(3, 1, NULL, 'user04@naver.com', 'user01@naver.com', 1, 1, '2022-05-30 18:22:29'),
	(4, NULL, 1, 'user02@naver.com', 'user01@naver.com', 1, 1, '2022-05-30 18:31:32');

INSERT INTO `chat` (`chatMessageNo`, `chatRoomNo`, `sendUserId`, `chatMessage`, `createdAt`, `readOrNot`) VALUES
	(1, 1, 'user02@naver.com', '���̿�', '2022-05-30 18:23:17', 0),
	(2, 1, 'user02@naver.com', '�ȷȳ���?', '2022-05-30 18:23:17', 0),
	(3, 1, 'user01@naver.com', '�ƴϿ�', '2022-05-30 18:23:17', 1),
	(4, 2, 'user03@naver.com', '�ȳ��ϼ���', '2022-05-30 18:28:47', 1),
	(5, 2, 'user03@naver.com', '�� ��������?', '2022-05-30 18:28:47', 1),
	(6, 3, 'user04@naver.com', ' HI', '2022-05-30 18:32:54', 1),
	(7, 4, 'user02@naver.com', 'dkssudgktpdy', '2022-05-30 18:36:47', 1);

INSERT INTO board( boardTitle, boardDetail, boardDate, boardFlag) VALUES('��������1', '��¼����¼��1', '2022-06-02 11:37:35', 'A');
INSERT INTO board( boardTitle, boardDetail, boardDate, boardFlag) VALUES('��������2', '��¼����¼��2', '2022-06-02 11:37:36', 'A');
INSERT INTO board( boardTitle, boardDetail, boardDate, boardFlag) VALUES('��������3', '��¼����¼��3', '2022-06-02 11:37:37', 'A');
INSERT INTO board( boardTitle, boardDetail, boardDate, boardFlag) VALUES('��������4', '��¼����¼��4', '2022-06-02 11:37:38', 'A');
INSERT INTO board( boardTitle, boardDetail, boardDate, boardFlag, category) VALUES('FAQ1', '��¼����¼��1', '2022-06-02 11:37:35', 'F', '�̿���');
INSERT INTO board( boardTitle, boardDetail, boardDate, boardFlag, category) VALUES('FAQ2', '��¼����¼��2', '2022-06-02 11:37:36', 'F', '�̿���');
INSERT INTO board( boardTitle, boardDetail, boardDate, boardFlag, category) VALUES('FAQ3', '��¼����¼��3', '2022-06-02 11:37:37', 'F', '��������');
INSERT INTO board( boardTitle, boardDetail, boardDate, boardFlag, category) VALUES('FAQ4', '��¼����¼��4', '2022-06-02 11:37:38', 'F', '����');

INSERT INTO coupon (couponname, couponcredate, coupondeldate, discount)
VALUES('[�����Ǵ� 5õ������]', '2022-06-01','2022-12-31', 5000);
INSERT INTO coupon (couponname, discount)
VALUES('[�ű�ȸ�� 1000����������',1000 );
INSERT INTO coupon (couponname, discount)
VALUES('[����ȸ�� 15%��������', 0.15);

INSERT INTO owncoupon(userid, couponno, ownCouponCreDate, ownCoupondelDate)
VALUES ('user01@naver.com',1,'2022-06-01','2022-06-30');
INSERT INTO owncoupon(userid, couponno, ownCouponCreDate, ownCoupondelDate)
VALUES ('user01@naver.com',2,'2022-06-01','2022-06-30');
INSERT INTO owncoupon(userid, couponno, ownCouponCreDate, ownCoupondelDate)
VALUES ('user02@naver.com',2,'2022-06-01','2022-06-30');

INSERT INTO report(reportNo, reportUser, reportedUser, reportOldNo, reportChatroomNo, reportCategory, reportDetail, reportChat, reportCode)
VALUES(NULL, 'admin' , 'user02@naver.com', 2, null, '������', '�ΰ����� ����', null, 0);

INSERT INTO report(reportNo, reportUser, reportedUser, reportOldNo, reportChatroomNo, reportCategory, reportDetail, reportChat, reportCode)
VALUES(NULL, 'admin' , 'user03@naver.com', 3, null, '������',  '���� �ȱ����', null, 0);

INSERT INTO report(reportNo, reportUser, reportedUser, reportOldNo, reportChatroomNo, reportCategory, reportDetail, reportChat, reportCode)
VALUES(NULL, 'admin' , 'user04@naver.com', 4, null, '����',  '����', null, 0);

INSERT INTO report(reportNo, reportUser, reportedUser, reportOldNo, reportChatroomNo, reportCategory,reportDetail, reportChat, reportCode)
VALUES(NULL, 'admin' , 'user05@naver.com', 5, null, '������',  '�ʹ� ������', null, 0);

INSERT INTO report(reportNo, reportUser, reportedUser, reportOldNo, reportChatroomNo, reportCategory, reportDetail, reportChat, reportCode)
VALUES(NULL, 'admin' , 'user06@naver.com', 6, null, '������',  '�׳�', null, 0);


INSERT INTO oldReview(oldReviewNo, reviewUserId, reviewedUserId, oldNo, reviewDetail, userRate)
VALUES(NULL, 'admin', 'user01@naver.com', 1, '�¸ų�', 5);

INSERT INTO oldReview(oldReviewNo, reviewUserId, reviewedUserId, oldNo, reviewDetail, userRate)
VALUES(NULL, 'admin', 'user02@naver.com', 2, '���ų�', 1);

INSERT INTO oldReview(oldReviewNo, reviewUserId, reviewedUserId, oldNo, reviewDetail, userRate)
VALUES(NULL, 'admin', 'user03@naver.com', 3, '��¦ ��ģ��', 3);

INSERT INTO oldReview(oldReviewNo, reviewUserId, reviewedUserId, oldNo, reviewDetail, userRate)
VALUES(NULL, 'admin', 'user03@naver.com', 4, '���ǰ� �����', 4);