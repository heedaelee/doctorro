-- --------------------------------------------------------
-- 호스트:                          52.78.198.181
-- 서버 버전:                        10.3.11-MariaDB - MariaDB Server
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 테이블 doctorro.admin 구조 내보내기
CREATE TABLE IF NOT EXISTS `admin` (
  `a_seq` int(11) NOT NULL AUTO_INCREMENT,
  `au_seq` int(11) NOT NULL,
  `a_nick` varchar(11) DEFAULT NULL,
  `a_enabled` varchar(1) NOT NULL COMMENT '0:탈퇴 1:활용',
  `a_img` varchar(255) DEFAULT NULL COMMENT 'profile\\n',
  `a_regdate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`a_seq`),
  KEY `fk_admin_auth1_idx` (`au_seq`),
  CONSTRAINT `fk_admin_auth1` FOREIGN KEY (`au_seq`) REFERENCES `auth` (`au_seq`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.admin:~0 rows (대략적) 내보내기
DELETE FROM `admin`;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- 테이블 doctorro.auth 구조 내보내기
CREATE TABLE IF NOT EXISTS `auth` (
  `au_seq` int(11) NOT NULL AUTO_INCREMENT,
  `au_email` varchar(100) NOT NULL,
  `roll_code` varchar(1) NOT NULL,
  `au_pwd` varchar(100) NOT NULL,
  `au_enabled` varchar(100) NOT NULL COMMENT '1활성화 2 보류 3 탈퇴',
  PRIMARY KEY (`au_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.auth:~2 rows (대략적) 내보내기
DELETE FROM `auth`;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
INSERT INTO `auth` (`au_seq`, `au_email`, `roll_code`, `au_pwd`, `au_enabled`) VALUES
	(23, 'lhd1328@naver.com', '1', '$2a$10$H.rKIUAczU1tP2nYn5Sy1O7j9RXZoX5i3I8dngYe2hGEEP6CU0doW', '1'),
	(24, 'adguy72@gmail.com', '1', '$2a$10$4HsxsPekPnKf970F8UYR/uYJAwsVpx1fZ9YDvd4ENX3/HGOG2I1wq', '1');
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;

-- 테이블 doctorro.calumn 구조 내보내기
CREATE TABLE IF NOT EXISTS `calumn` (
  `ca_seq` int(11) NOT NULL AUTO_INCREMENT,
  `au_seq` int(11) NOT NULL,
  `tag_seq` int(11) DEFAULT NULL,
  `ca_title` varchar(60) NOT NULL,
  `ca_content` text NOT NULL,
  `ca_hit` varchar(45) NOT NULL,
  `ca_scrap` varchar(45) NOT NULL,
  `ca_regdate` datetime NOT NULL,
  `ca_enable` varchar(1) NOT NULL,
  PRIMARY KEY (`ca_seq`),
  UNIQUE KEY `b_seq_UNIQUE` (`ca_seq`),
  KEY `fk_board_tag1_idx` (`tag_seq`),
  KEY `fk_auth_au_seq` (`au_seq`),
  CONSTRAINT `fk_auth_au_seq` FOREIGN KEY (`au_seq`) REFERENCES `auth` (`au_seq`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_board_tag1` FOREIGN KEY (`tag_seq`) REFERENCES `tag` (`tag_seq`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.calumn:~0 rows (대략적) 내보내기
DELETE FROM `calumn`;
/*!40000 ALTER TABLE `calumn` DISABLE KEYS */;
/*!40000 ALTER TABLE `calumn` ENABLE KEYS */;

-- 테이블 doctorro.calumn_img 구조 내보내기
CREATE TABLE IF NOT EXISTS `calumn_img` (
  `ci_seq` int(11) NOT NULL AUTO_INCREMENT,
  `ca_seq` int(11) NOT NULL,
  `ci_name` varchar(255) NOT NULL,
  `ci_regdate` datetime NOT NULL,
  PRIMARY KEY (`ci_seq`),
  KEY `fk_img_board1_idx` (`ca_seq`),
  CONSTRAINT `fk_img_board1` FOREIGN KEY (`ca_seq`) REFERENCES `calumn` (`ca_seq`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.calumn_img:~0 rows (대략적) 내보내기
DELETE FROM `calumn_img`;
/*!40000 ALTER TABLE `calumn_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `calumn_img` ENABLE KEYS */;

-- 테이블 doctorro.chat 구조 내보내기
CREATE TABLE IF NOT EXISTS `chat` (
  `ch_seq` int(11) NOT NULL AUTO_INCREMENT,
  `ch_senderEmail` varchar(100) NOT NULL,
  `ch_receiverEmail` varchar(100) NOT NULL,
  `ch_msg` text NOT NULL,
  `ch_read` varchar(1) NOT NULL,
  `ch_regdate` datetime NOT NULL,
  PRIMARY KEY (`ch_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.chat:~0 rows (대략적) 내보내기
DELETE FROM `chat`;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;

-- 테이블 doctorro.chat_img 구조 내보내기
CREATE TABLE IF NOT EXISTS `chat_img` (
  `chi_seq` int(11) NOT NULL AUTO_INCREMENT,
  `ch_seq` int(11) NOT NULL,
  `chi_email` varchar(100) NOT NULL,
  `chi_name` varchar(255) NOT NULL,
  `chi_regdate` datetime NOT NULL,
  PRIMARY KEY (`chi_seq`),
  KEY `fk_chat_img_chat1_idx` (`ch_seq`),
  CONSTRAINT `fk_chat_img_chat1` FOREIGN KEY (`ch_seq`) REFERENCES `chat` (`ch_seq`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.chat_img:~0 rows (대략적) 내보내기
DELETE FROM `chat_img`;
/*!40000 ALTER TABLE `chat_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_img` ENABLE KEYS */;

-- 테이블 doctorro.disease 구조 내보내기
CREATE TABLE IF NOT EXISTS `disease` (
  `dis_seq` int(11) NOT NULL AUTO_INCREMENT,
  `dis_title` varchar(45) NOT NULL,
  `dis_content` text NOT NULL,
  `dis_hit` int(11) NOT NULL,
  PRIMARY KEY (`dis_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.disease:~0 rows (대략적) 내보내기
DELETE FROM `disease`;
/*!40000 ALTER TABLE `disease` DISABLE KEYS */;
/*!40000 ALTER TABLE `disease` ENABLE KEYS */;

-- 테이블 doctorro.doctor 구조 내보내기
CREATE TABLE IF NOT EXISTS `doctor` (
  `d_seq` int(11) NOT NULL AUTO_INCREMENT,
  `au_seq` int(11) NOT NULL,
  `d_name` varchar(10) NOT NULL,
  `d_enable` varchar(45) NOT NULL,
  `d_img` varchar(255) DEFAULT NULL,
  `d_regdate` datetime NOT NULL,
  `d_intro` varchar(300) DEFAULT NULL,
  `d_position` varchar(45) DEFAULT NULL,
  `sub_code` int(11) DEFAULT NULL,
  `sub_code2` int(11) DEFAULT NULL,
  `sur_code` int(11) DEFAULT NULL,
  `fi_code` int(11) DEFAULT NULL,
  `d_number` varchar(12) DEFAULT NULL COMMENT '의사번호 (추후에 일괄등록자는 null  일수도있고, 변경 가능함)\\n따라서  null 허용, \\n일괄,정상 등록 구분 칼럼만 구분자 줌',
  `d_whenReg` varchar(2) DEFAULT NULL COMMENT '개인 등록자 p\\n일괄 등록자 a\\n',
  PRIMARY KEY (`d_seq`),
  UNIQUE KEY `d_number_UNIQUE` (`d_number`),
  KEY `fk_doctor_subject1_idx` (`sub_code`),
  KEY `fk_doctor_subject2_idx` (`sub_code2`),
  KEY `fk_doctor_surgery1_idx` (`sur_code`),
  KEY `fk_doctor_field1_idx` (`fi_code`),
  KEY `fk_doctor_auth1_idx` (`au_seq`),
  CONSTRAINT `fk_doctor_auth1` FOREIGN KEY (`au_seq`) REFERENCES `auth` (`au_seq`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_doctor_field1` FOREIGN KEY (`fi_code`) REFERENCES `doc_field` (`fi_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_doctor_subject1` FOREIGN KEY (`sub_code`) REFERENCES `doc_subject` (`sub_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_doctor_subject2` FOREIGN KEY (`sub_code2`) REFERENCES `doc_subject` (`sub_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_doctor_surgery1` FOREIGN KEY (`sur_code`) REFERENCES `doc_surgery` (`sur_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.doctor:~0 rows (대략적) 내보내기
DELETE FROM `doctor`;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;

-- 테이블 doctorro.doc_field 구조 내보내기
CREATE TABLE IF NOT EXISTS `doc_field` (
  `fi_code` int(11) NOT NULL AUTO_INCREMENT,
  `fi_name` varchar(50) NOT NULL,
  PRIMARY KEY (`fi_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.doc_field:~0 rows (대략적) 내보내기
DELETE FROM `doc_field`;
/*!40000 ALTER TABLE `doc_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_field` ENABLE KEYS */;

-- 테이블 doctorro.doc_subject 구조 내보내기
CREATE TABLE IF NOT EXISTS `doc_subject` (
  `sub_code` int(11) NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(50) NOT NULL,
  PRIMARY KEY (`sub_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.doc_subject:~0 rows (대략적) 내보내기
DELETE FROM `doc_subject`;
/*!40000 ALTER TABLE `doc_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_subject` ENABLE KEYS */;

-- 테이블 doctorro.doc_surgery 구조 내보내기
CREATE TABLE IF NOT EXISTS `doc_surgery` (
  `sur_code` int(11) NOT NULL AUTO_INCREMENT,
  `sur_name` varchar(50) NOT NULL,
  PRIMARY KEY (`sur_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.doc_surgery:~0 rows (대략적) 내보내기
DELETE FROM `doc_surgery`;
/*!40000 ALTER TABLE `doc_surgery` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_surgery` ENABLE KEYS */;

-- 테이블 doctorro.drug_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `drug_info` (
  `dr_seq` int(11) NOT NULL AUTO_INCREMENT,
  `dr_title` varchar(45) NOT NULL,
  `dr_content` text NOT NULL,
  `dr_hit` int(11) NOT NULL,
  PRIMARY KEY (`dr_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.drug_info:~0 rows (대략적) 내보내기
DELETE FROM `drug_info`;
/*!40000 ALTER TABLE `drug_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug_info` ENABLE KEYS */;

-- 테이블 doctorro.event 구조 내보내기
CREATE TABLE IF NOT EXISTS `event` (
  `ev_seq` int(11) NOT NULL AUTO_INCREMENT,
  `ev_title` varchar(60) NOT NULL,
  `ev_content` text NOT NULL,
  `ev_hit` int(11) NOT NULL,
  `ev_regdate` datetime NOT NULL,
  PRIMARY KEY (`ev_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.event:~0 rows (대략적) 내보내기
DELETE FROM `event`;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;

-- 테이블 doctorro.follow 구조 내보내기
CREATE TABLE IF NOT EXISTS `follow` (
  `f_seq` int(11) NOT NULL AUTO_INCREMENT,
  `m_seq` int(11) NOT NULL,
  `d_seq` int(11) NOT NULL,
  PRIMARY KEY (`f_seq`),
  KEY `fk_follow_memnber2_idx` (`m_seq`),
  KEY `fk_follow_doctor1_idx` (`d_seq`),
  CONSTRAINT `fk_follow_doctor1` FOREIGN KEY (`d_seq`) REFERENCES `doctor` (`d_seq`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_follow_memnber2` FOREIGN KEY (`m_seq`) REFERENCES `user` (`m_seq`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.follow:~0 rows (대략적) 내보내기
DELETE FROM `follow`;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;

-- 테이블 doctorro.health_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `health_info` (
  `hi_seq` int(11) NOT NULL AUTO_INCREMENT,
  `hi_title` varchar(45) NOT NULL,
  `hi_content` text NOT NULL,
  `hi_category` varchar(30) NOT NULL,
  `hi_hit` varchar(45) NOT NULL,
  PRIMARY KEY (`hi_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.health_info:~0 rows (대략적) 내보내기
DELETE FROM `health_info`;
/*!40000 ALTER TABLE `health_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `health_info` ENABLE KEYS */;

-- 테이블 doctorro.point 구조 내보내기
CREATE TABLE IF NOT EXISTS `point` (
  `po_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_seq` int(11) NOT NULL,
  `po_status` varchar(15) NOT NULL,
  `po_point` varchar(8) NOT NULL,
  PRIMARY KEY (`po_id`),
  KEY `fk_point_member1_idx` (`m_seq`),
  CONSTRAINT `fk_point_member1` FOREIGN KEY (`m_seq`) REFERENCES `user` (`m_seq`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.point:~0 rows (대략적) 내보내기
DELETE FROM `point`;
/*!40000 ALTER TABLE `point` DISABLE KEYS */;
/*!40000 ALTER TABLE `point` ENABLE KEYS */;

-- 테이블 doctorro.role 구조 내보내기
CREATE TABLE IF NOT EXISTS `role` (
  `roll_code` varchar(1) NOT NULL,
  `roll_name` varchar(15) NOT NULL,
  PRIMARY KEY (`roll_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.role:~3 rows (대략적) 내보내기
DELETE FROM `role`;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`roll_code`, `roll_name`) VALUES
	('1', 'user'),
	('2', 'doctor'),
	('3', 'admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- 테이블 doctorro.scrap 구조 내보내기
CREATE TABLE IF NOT EXISTS `scrap` (
  `sc_seq` int(11) NOT NULL AUTO_INCREMENT,
  `au_seq` int(11) NOT NULL,
  `b_seq` int(11) DEFAULT NULL,
  PRIMARY KEY (`sc_seq`),
  KEY `fk_scrap_board1_idx` (`b_seq`),
  KEY `fk_scrap_memnber1_idx` (`au_seq`),
  CONSTRAINT `fk_auth` FOREIGN KEY (`au_seq`) REFERENCES `auth` (`au_seq`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_scrap_board1` FOREIGN KEY (`b_seq`) REFERENCES `calumn` (`ca_seq`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.scrap:~0 rows (대략적) 내보내기
DELETE FROM `scrap`;
/*!40000 ALTER TABLE `scrap` DISABLE KEYS */;
/*!40000 ALTER TABLE `scrap` ENABLE KEYS */;

-- 테이블 doctorro.social 구조 내보내기
CREATE TABLE IF NOT EXISTS `social` (
  `so_code` int(11) NOT NULL,
  `so_name` varchar(10) NOT NULL,
  PRIMARY KEY (`so_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.social:~4 rows (대략적) 내보내기
DELETE FROM `social`;
/*!40000 ALTER TABLE `social` DISABLE KEYS */;
INSERT INTO `social` (`so_code`, `so_name`) VALUES
	(1, 'null'),
	(2, 'naver'),
	(3, 'kakao'),
	(4, 'google');
/*!40000 ALTER TABLE `social` ENABLE KEYS */;

-- 테이블 doctorro.tag 구조 내보내기
CREATE TABLE IF NOT EXISTS `tag` (
  `tag_seq` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(45) NOT NULL,
  PRIMARY KEY (`tag_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.tag:~0 rows (대략적) 내보내기
DELETE FROM `tag`;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;

-- 테이블 doctorro.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `m_seq` int(11) NOT NULL AUTO_INCREMENT,
  `au_seq` int(11) NOT NULL,
  `so_code` int(11) DEFAULT NULL,
  `m_nick` varchar(11) DEFAULT NULL,
  `m_img` varchar(255) DEFAULT NULL COMMENT 'profile\\n',
  `m_regdate` datetime NOT NULL DEFAULT current_timestamp(),
  `m_gender` varchar(1) DEFAULT NULL,
  `m_blood` varchar(2) DEFAULT NULL,
  `m_birth` varchar(10) DEFAULT NULL,
  `m_marry` varchar(1) DEFAULT NULL,
  `m_height` varchar(3) DEFAULT NULL,
  `m_weight` varchar(3) DEFAULT NULL,
  `m_isChild` varchar(1) DEFAULT NULL,
  `m_point` varchar(8) DEFAULT NULL,
  `m_mPush` varchar(1) DEFAULT NULL,
  `m_mMail` varchar(1) DEFAULT NULL,
  `m_mPushdate` datetime DEFAULT current_timestamp(),
  `m_mMaildate` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`m_seq`),
  KEY `fk_member_social1_idx` (`so_code`),
  KEY `fk_user_auth1_idx` (`au_seq`),
  CONSTRAINT `fk_member_social1` FOREIGN KEY (`so_code`) REFERENCES `social` (`so_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_auth1` FOREIGN KEY (`au_seq`) REFERENCES `auth` (`au_seq`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- 테이블 데이터 doctorro.user:~2 rows (대략적) 내보내기
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`m_seq`, `au_seq`, `so_code`, `m_nick`, `m_img`, `m_regdate`, `m_gender`, `m_blood`, `m_birth`, `m_marry`, `m_height`, `m_weight`, `m_isChild`, `m_point`, `m_mPush`, `m_mMail`, `m_mPushdate`, `m_mMaildate`) VALUES
	(51, 23, 3, '이희대', 'http://k.kakaocdn.net/dn/wjGKF/btqrURbOn4i/Lmt2lp4ihKGwer04g6Wo2k/profile_640x640s.jpg', '2019-02-15 20:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-15 20:04:50', '2019-02-15 20:04:50'),
	(52, 24, 2, 'adguy', 'https://phinf.pstatic.net/contact/20180908_70/1536364008148CoaYC_JPEG/993086_1.jpg', '2019-02-15 20:05:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-15 20:05:04', '2019-02-15 20:05:04');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
