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

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 doctorro.auth 구조 내보내기
CREATE TABLE IF NOT EXISTS `auth` (
  `au_seq` int(11) NOT NULL AUTO_INCREMENT,
  `au_email` varchar(100) NOT NULL,
  `roll_code` varchar(1) NOT NULL,
  `au_pwd` varchar(100) NOT NULL,
  `au_enabled` varchar(100) NOT NULL COMMENT '1활성화 2 보류 3 탈퇴',
  PRIMARY KEY (`au_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 doctorro.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `b_seq` int(11) NOT NULL AUTO_INCREMENT,
  `d_seq` int(11) NOT NULL,
  `tag_seq` int(11) DEFAULT NULL,
  `b_title` varchar(60) NOT NULL,
  `b_content` text NOT NULL,
  `b_hit` varchar(45) NOT NULL,
  `b_regdate` datetime NOT NULL,
  `b_enable` varchar(1) NOT NULL,
  PRIMARY KEY (`b_seq`),
  UNIQUE KEY `b_seq_UNIQUE` (`b_seq`),
  KEY `fk_board_doctor1_idx` (`d_seq`),
  KEY `fk_board_tag1_idx` (`tag_seq`),
  CONSTRAINT `fk_board_doctor1` FOREIGN KEY (`d_seq`) REFERENCES `doctor` (`d_seq`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_board_tag1` FOREIGN KEY (`tag_seq`) REFERENCES `tag` (`tag_seq`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 doctorro.board_img 구조 내보내기
CREATE TABLE IF NOT EXISTS `board_img` (
  `bi_seq` int(11) NOT NULL AUTO_INCREMENT,
  `b_seq` int(11) NOT NULL,
  `bi_name` varchar(255) NOT NULL,
  `bi_regdate` datetime NOT NULL,
  PRIMARY KEY (`bi_seq`),
  KEY `fk_img_board1_idx` (`b_seq`),
  CONSTRAINT `fk_img_board1` FOREIGN KEY (`b_seq`) REFERENCES `board` (`b_seq`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
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

-- 내보낼 데이터가 선택되어 있지 않습니다.
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

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 doctorro.disease_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `disease_info` (
  `dis_seq` int(11) NOT NULL AUTO_INCREMENT,
  `dis_title` varchar(45) NOT NULL,
  `dis_content` text NOT NULL,
  `dis_hit` int(11) NOT NULL,
  PRIMARY KEY (`dis_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
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

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 doctorro.doc_field 구조 내보내기
CREATE TABLE IF NOT EXISTS `doc_field` (
  `fi_code` int(11) NOT NULL AUTO_INCREMENT,
  `fi_name` varchar(50) NOT NULL,
  PRIMARY KEY (`fi_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 doctorro.doc_subject 구조 내보내기
CREATE TABLE IF NOT EXISTS `doc_subject` (
  `sub_code` int(11) NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(50) NOT NULL,
  PRIMARY KEY (`sub_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 doctorro.doc_surgery 구조 내보내기
CREATE TABLE IF NOT EXISTS `doc_surgery` (
  `sur_code` int(11) NOT NULL AUTO_INCREMENT,
  `sur_name` varchar(50) NOT NULL,
  PRIMARY KEY (`sur_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 doctorro.drug_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `drug_info` (
  `dr_seq` int(11) NOT NULL AUTO_INCREMENT,
  `dr_title` varchar(45) NOT NULL,
  `dr_content` text NOT NULL,
  `dr_hit` int(11) NOT NULL,
  PRIMARY KEY (`dr_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 doctorro.event 구조 내보내기
CREATE TABLE IF NOT EXISTS `event` (
  `ev_seq` int(11) NOT NULL AUTO_INCREMENT,
  `ev_title` varchar(60) NOT NULL,
  `ev_content` text NOT NULL,
  `ev_hit` int(11) NOT NULL,
  `ev_regdate` datetime NOT NULL,
  PRIMARY KEY (`ev_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
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

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 doctorro.health_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `health_info` (
  `hi_seq` int(11) NOT NULL AUTO_INCREMENT,
  `hi_title` varchar(45) NOT NULL,
  `hi_content` text NOT NULL,
  `hi_category` varchar(30) NOT NULL,
  `hi_hit` varchar(45) NOT NULL,
  PRIMARY KEY (`hi_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 doctorro.member_role 구조 내보내기
CREATE TABLE IF NOT EXISTS `member_role` (
  `mr_seq` int(11) NOT NULL AUTO_INCREMENT,
  `roll_code` varchar(1) NOT NULL,
  `m_email` varchar(100) NOT NULL COMMENT '모든 email',
  PRIMARY KEY (`mr_seq`),
  KEY `fk_mem_roll_roll1_idx` (`roll_code`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
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

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 doctorro.role 구조 내보내기
CREATE TABLE IF NOT EXISTS `role` (
  `roll_code` varchar(1) NOT NULL,
  `roll_name` varchar(15) NOT NULL,
  PRIMARY KEY (`roll_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 doctorro.scrap 구조 내보내기
CREATE TABLE IF NOT EXISTS `scrap` (
  `sc_seq` int(11) NOT NULL AUTO_INCREMENT,
  `m_seq` int(11) NOT NULL,
  `b_seq` int(11) DEFAULT NULL,
  PRIMARY KEY (`sc_seq`),
  KEY `fk_scrap_board1_idx` (`b_seq`),
  KEY `fk_scrap_memnber1_idx` (`m_seq`),
  CONSTRAINT `fk_scrap_board1` FOREIGN KEY (`b_seq`) REFERENCES `board` (`b_seq`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_scrap_memnber1` FOREIGN KEY (`m_seq`) REFERENCES `user` (`m_seq`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 doctorro.social 구조 내보내기
CREATE TABLE IF NOT EXISTS `social` (
  `so_code` int(11) NOT NULL,
  `so_name` varchar(10) NOT NULL,
  PRIMARY KEY (`so_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 doctorro.tag 구조 내보내기
CREATE TABLE IF NOT EXISTS `tag` (
  `tag_seq` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(45) NOT NULL,
  PRIMARY KEY (`tag_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
-- 테이블 doctorro.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `m_seq` int(11) NOT NULL AUTO_INCREMENT,
  `au_seq` int(11) NOT NULL,
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
  `m_mPush` varchar(1) DEFAULT NULL,
  `m_mMail` varchar(1) DEFAULT NULL,
  `m_point` varchar(8) DEFAULT NULL,
  `so_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`m_seq`),
  KEY `fk_member_social1_idx` (`so_code`),
  KEY `fk_user_auth1_idx` (`au_seq`),
  CONSTRAINT `fk_member_social1` FOREIGN KEY (`so_code`) REFERENCES `social` (`so_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_auth1` FOREIGN KEY (`au_seq`) REFERENCES `auth` (`au_seq`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
