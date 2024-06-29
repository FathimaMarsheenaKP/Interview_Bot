/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - interviews
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`interviews` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `interviews`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add job_table',7,'add_job_table'),
(26,'Can change job_table',7,'change_job_table'),
(27,'Can delete job_table',7,'delete_job_table'),
(28,'Can view job_table',7,'view_job_table'),
(29,'Can add login_table',8,'add_login_table'),
(30,'Can change login_table',8,'change_login_table'),
(31,'Can delete login_table',8,'delete_login_table'),
(32,'Can view login_table',8,'view_login_table'),
(33,'Can add qn a_table',9,'add_qna_table'),
(34,'Can change qn a_table',9,'change_qna_table'),
(35,'Can delete qn a_table',9,'delete_qna_table'),
(36,'Can view qn a_table',9,'view_qna_table'),
(37,'Can add request_table',10,'add_request_table'),
(38,'Can change request_table',10,'change_request_table'),
(39,'Can delete request_table',10,'delete_request_table'),
(40,'Can view request_table',10,'view_request_table'),
(41,'Can add user_table',11,'add_user_table'),
(42,'Can change user_table',11,'change_user_table'),
(43,'Can delete user_table',11,'delete_user_table'),
(44,'Can view user_table',11,'view_user_table'),
(45,'Can add result_table',12,'add_result_table'),
(46,'Can change result_table',12,'change_result_table'),
(47,'Can delete result_table',12,'delete_result_table'),
(48,'Can view result_table',12,'view_result_table'),
(49,'Can add feedback_table',13,'add_feedback_table'),
(50,'Can change feedback_table',13,'change_feedback_table'),
(51,'Can delete feedback_table',13,'delete_feedback_table'),
(52,'Can view feedback_table',13,'view_feedback_table'),
(53,'Can add complaint_table',14,'add_complaint_table'),
(54,'Can change complaint_table',14,'change_complaint_table'),
(55,'Can delete complaint_table',14,'delete_complaint_table'),
(56,'Can view complaint_table',14,'view_complaint_table'),
(57,'Can add job_details_table',15,'add_job_details_table'),
(58,'Can change job_details_table',15,'change_job_details_table'),
(59,'Can delete job_details_table',15,'delete_job_details_table'),
(60,'Can view job_details_table',15,'view_job_details_table');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$600000$7I0DTkQTDiE8XHBbag6zvW$1AvGE7mPRwZp97Ie2WAldh3cUXyvnHx3PvNleg4ChQU=','2024-03-20 02:45:41.393839',1,'admin','','','admin@gmail.com',1,1,'2023-12-30 08:42:12.376395');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(14,'Int_BOT_app','complaint_table'),
(13,'Int_BOT_app','feedback_table'),
(15,'Int_BOT_app','job_details_table'),
(7,'Int_BOT_app','job_table'),
(8,'Int_BOT_app','login_table'),
(9,'Int_BOT_app','qna_table'),
(10,'Int_BOT_app','request_table'),
(12,'Int_BOT_app','result_table'),
(11,'Int_BOT_app','user_table'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'Int_BOT_app','0001_initial','2023-11-26 10:45:00.920861'),
(2,'contenttypes','0001_initial','2023-11-26 10:45:00.955002'),
(3,'auth','0001_initial','2023-11-26 10:45:01.305542'),
(4,'admin','0001_initial','2023-11-26 10:45:01.422282'),
(5,'admin','0002_logentry_remove_auto_add','2023-11-26 10:45:01.436221'),
(6,'admin','0003_logentry_add_action_flag_choices','2023-11-26 10:45:01.445707'),
(7,'contenttypes','0002_remove_content_type_name','2023-11-26 10:45:01.510590'),
(8,'auth','0002_alter_permission_name_max_length','2023-11-26 10:45:01.557394'),
(9,'auth','0003_alter_user_email_max_length','2023-11-26 10:45:01.584161'),
(10,'auth','0004_alter_user_username_opts','2023-11-26 10:45:01.594630'),
(11,'auth','0005_alter_user_last_login_null','2023-11-26 10:45:01.650281'),
(12,'auth','0006_require_contenttypes_0002','2023-11-26 10:45:01.654698'),
(13,'auth','0007_alter_validators_add_error_messages','2023-11-26 10:45:01.668901'),
(14,'auth','0008_alter_user_username_max_length','2023-11-26 10:45:01.725571'),
(15,'auth','0009_alter_user_last_name_max_length','2023-11-26 10:45:01.782675'),
(16,'auth','0010_alter_group_name_max_length','2023-11-26 10:45:01.809044'),
(17,'auth','0011_update_proxy_permissions','2023-11-26 10:45:01.827955'),
(18,'auth','0012_alter_user_first_name_max_length','2023-11-26 10:45:01.883986'),
(19,'sessions','0001_initial','2023-11-26 10:45:01.914392'),
(20,'Int_BOT_app','0002_remove_job_table_details_job_details_table','2023-11-28 06:44:19.691254'),
(21,'Int_BOT_app','0003_alter_result_table_mark','2023-12-03 06:39:32.916457'),
(22,'Int_BOT_app','0004_result_table_status','2023-12-03 06:55:07.676268'),
(23,'Int_BOT_app','0005_alter_job_details_table_details','2023-12-20 05:56:29.458246'),
(24,'Int_BOT_app','0006_alter_qna_table_answers_alter_qna_table_questions','2023-12-29 04:06:18.573495'),
(25,'Int_BOT_app','0007_alter_result_table_result','2023-12-29 04:28:28.366743'),
(26,'Int_BOT_app','0008_alter_feedback_table_rating','2023-12-29 15:08:08.682118');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('9ipsx4vxygagfxcqxoafjlpogo98uhp9','.eJyrVsrKTFGyMtUB0UCGiY5SIUjAWEcpGUQb6SjlgOlaAP0MC5g:1r9jgS:rRMcoXEKtir9ph4QfnsY3pT3C1dexsqe9YbEB7F2BM8','2023-12-17 10:26:44.732217'),
('apljntgf8hmh8i9cqo2kq5zcnp6c6h5j','.eJxVTrsKwzAQ-5ebTbCdxvZlzN4vKCX4mUeL08bJUEr_vTZkCTeckISkLzwnB21DoNf7NvZ78mtfGGBw4oy2Dx-L4GYdh6WyS9zWyVTFUh1qqq6L88_u8J4CRp3GEstYQI5BoGJYS1fXzDhODXIdBDemsbJB4QJFhSzUChFF8Fwqq42SKuTQtey75MlzAYwSeMclg_z3BO2Nknx3Atvn5XNj54cpRr_C7w_rQUmZ:1rmly3:4_woSroO793WQHoz93_jbCI47DoyOpl20ddX3clUNjI','2024-04-03 02:46:15.352076'),
('qya1o6h8p66nd2itgv7qv8ekziab6zg1','.eJxVjr0OgzAQg98lM4qa5AiXjt15BnS5SwoUgcTPVPXdSySGdrJkf7b8Vh0de98dW1q7QdRdGVX9epH4leYSyEjzc9G8zPs6RF0QfaWbbhdJ0-Ni_wZ62vqzzWIRbi6TT0AO0DcpQBBC9uC5YahtkCb6kAkpR-uMEbSSBRnr2uRzdCr_fKXGog4-X8TWPIA:1rJWOR:jRS_CJn6RFu3OdS-aYTt0S8cUu17Qu59V_WUrZfiLVA','2024-01-13 10:16:35.369552');

/*Table structure for table `int_bot_app_complaint_table` */

DROP TABLE IF EXISTS `int_bot_app_complaint_table`;

CREATE TABLE `int_bot_app_complaint_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `reply` varchar(100) NOT NULL,
  `user_table_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Int_BOT_app_complain_user_table_id_5db9994d_fk_Int_BOT_a` (`user_table_id`),
  CONSTRAINT `Int_BOT_app_complain_user_table_id_5db9994d_fk_Int_BOT_a` FOREIGN KEY (`user_table_id`) REFERENCES `int_bot_app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `int_bot_app_complaint_table` */

insert  into `int_bot_app_complaint_table`(`id`,`complaint`,`date`,`reply`,`user_table_id`) values 
(4,'Camera is not working','2023-12-20','Sorry,problem solved',2),
(6,'Hard questions','2023-12-20','next time prepare well',2),
(7,'Not working','2023-12-20','Let me check',2),
(8,'Please give me simple questions','2023-12-20','Sorry, I can\'t.Study hard',2),
(9,'Server is down','2023-12-29','Problem solved',3),
(10,'I hate youuu','2023-12-30','ayn',4),
(11,'I love youu','2024-02-19','Ok noted',4),
(12,'pora','2024-02-19','Ok noted',4);

/*Table structure for table `int_bot_app_feedback_table` */

DROP TABLE IF EXISTS `int_bot_app_feedback_table`;

CREATE TABLE `int_bot_app_feedback_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` varchar(100) NOT NULL,
  `rating` double NOT NULL,
  `date` date NOT NULL,
  `user_table_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Int_BOT_app_feedback_user_table_id_f7921563_fk_Int_BOT_a` (`user_table_id`),
  CONSTRAINT `Int_BOT_app_feedback_user_table_id_f7921563_fk_Int_BOT_a` FOREIGN KEY (`user_table_id`) REFERENCES `int_bot_app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `int_bot_app_feedback_table` */

insert  into `int_bot_app_feedback_table`(`id`,`feedback`,`rating`,`date`,`user_table_id`) values 
(1,'good',5,'2023-12-26',1),
(2,'Not bad',3,'2023-12-20',1),
(3,'Overall good',3.5,'2023-12-29',3),
(4,'Not bad',3.68,'2023-12-30',4),
(5,'good',4.1,'2024-02-20',4),
(6,'kjhkhilk',3,'2024-02-27',4);

/*Table structure for table `int_bot_app_job_details_table` */

DROP TABLE IF EXISTS `int_bot_app_job_details_table`;

CREATE TABLE `int_bot_app_job_details_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `details` longtext NOT NULL,
  `job_table_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Int_BOT_app_job_deta_job_table_id_41309c15_fk_Int_BOT_a` (`job_table_id`),
  CONSTRAINT `Int_BOT_app_job_deta_job_table_id_41309c15_fk_Int_BOT_a` FOREIGN KEY (`job_table_id`) REFERENCES `int_bot_app_job_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `int_bot_app_job_details_table` */

insert  into `int_bot_app_job_details_table`(`id`,`details`,`job_table_id`) values 
(11,'A bachelor\'s degree in Web Design, Graphic Design, Multimedia Design, or a related field is often preferred.\r\nProficiency in design tools such as Adobe Creative Suite \r\nStrong knowledge of HTML and CSS\r\nFamiliarity with JavaScript and jQuery \r\nExperience using web design software and tools',10),
(12,'A bachelor\'s degree in Computer Science, Information Technology, Cybersecurity, or a related field is often preferred.\r\nCertified Ethical Hacker (CEH)\r\nOffensive Security Certified Professional (OSCP)\r\nGIAC Penetration Tester (GPEN)\r\n\r\n',9),
(13,'A bachelor\'s degree in Computer Science, Software Engineering, or a related field is often preferred. \r\nProficiency in backend programming languages\r\nUnderstanding of database systems\r\nProficiency in using backend frameworks\r\nKnowledge of designing and implementing APIs ',11),
(14,'A bachelor\'s degree in Graphic Design, Web Design, Human-Computer Interaction, Interaction Design, or a related field is often preferred.\r\nProficiency in graphic design tools such as Adobe Creative Suite (Illustrator, Photoshop, XD) or Sketch.\r\nUnderstanding of user-centered design principles.\r\nProficiency in creating wireframes, prototypes, and user flows.\r\nFamiliarity with web and mobile development technologies',12),
(15,'2-3 experience',13),
(16,'dtwcduvwifbiwgdaqodnqpfj',14);

/*Table structure for table `int_bot_app_job_table` */

DROP TABLE IF EXISTS `int_bot_app_job_table`;

CREATE TABLE `int_bot_app_job_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job` varchar(100) NOT NULL,
  `salary_range` varchar(100) NOT NULL,
  `number_of_positions` bigint NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `int_bot_app_job_table` */

insert  into `int_bot_app_job_table`(`id`,`job`,`salary_range`,`number_of_positions`,`type`) values 
(9,'Pen Tester','30k - 40k',5,'Open'),
(10,'Web Designer','25k - 35k',2,'Open'),
(11,'Back-end Developer','45k - 55k',4,'Open'),
(12,'UI/UX Designer','40k - 45k',8,'Open'),
(13,'Teacher','30k-40k',4,'Remote'),
(14,'Doctor','50 k - 65 k',3,'Open'),
(16,'Professor','35k - 45k',2,'Remote'),
(17,'Software Engineer','35k - 45k',2,'Remote');

/*Table structure for table `int_bot_app_login_table` */

DROP TABLE IF EXISTS `int_bot_app_login_table`;

CREATE TABLE `int_bot_app_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `int_bot_app_login_table` */

insert  into `int_bot_app_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'abc','123','user'),
(4,'fathima','123','user'),
(5,'nidakk','nida@123','user'),
(6,'ardramanoj','ardra@123','user'),
(7,'marsheena','Marsheena@123','user');

/*Table structure for table `int_bot_app_qna_table` */

DROP TABLE IF EXISTS `int_bot_app_qna_table`;

CREATE TABLE `int_bot_app_qna_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questions` longtext NOT NULL,
  `answers` longtext NOT NULL,
  `level` varchar(100) NOT NULL,
  `job_table_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Int_BOT_app_qna_tabl_job_table_id_f1bba584_fk_Int_BOT_a` (`job_table_id`),
  CONSTRAINT `Int_BOT_app_qna_tabl_job_table_id_f1bba584_fk_Int_BOT_a` FOREIGN KEY (`job_table_id`) REFERENCES `int_bot_app_job_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `int_bot_app_qna_table` */

insert  into `int_bot_app_qna_table`(`id`,`questions`,`answers`,`level`,`job_table_id`) values 
(8,'What is penetration testing, and why is it important?',' Penetration testing is a proactive approach to identifying and addressing security vulnerabilities in a system or network. It involves simulating real-world attacks to assess the security posture and discover weaknesses before malicious actors can exploit them. It helps organizations identify and fix vulnerabilities to strengthen their overall security.','Beginner',9),
(9,'Can you explain the difference between white-box and black-box testing?','White-box testing involves having detailed knowledge of the system\'s internal workings, including source code and architecture. Black-box testing, on the other hand, is conducted with no prior knowledge of the system\'s internal structure. Penetration testers may use a combination of both methods to provide a comprehensive assessment.','Beginner',9),
(10,'Explain the difference between black-box, white-box, and gray-box testing.','Black-box testing involves assessing a system with no prior knowledge of its internals, white-box testing involves full knowledge of the system, including source code, and gray-box testing is a combination of both, where the tester has partial knowledge. Each approach provides a different perspective on security.','Intermediate',9),
(19,'What is your approach to understanding a new system or network before conducting a penetration test?',' My approach typically involves reconnaissance to gather as much information as possible about the target system or network. This includes passive techniques such as OSINT (Open Source Intelligence) gathering, active scanning using tools like Nmap, and enumeration of services and technologies in use. Understanding the architecture, technology stack, and potential vulnerabilities is crucial for a successful penetration test.\r\n','Expert',9),
(20,'Describe a scenario where you had to bypass a WAF (Web Application Firewall) during a penetration test.','In one engagement, I encountered a WAF employing strict signature-based detection. To bypass it, I used advanced evasion techniques, including obfuscating payloads, utilizing polymorphic code, and leveraging protocol-level manipulations to deceive the WAF\'s rule sets.','Expert',9),
(21,'What inspired you to pursue a career in UI/UX design?',' I\'ve always been passionate about technology and art. UI/UX design allows me to combine these interests by creating intuitive and visually appealing interfaces that enhance user experiences. I find joy in solving complex problems and improving the way people interact with digital products.','Beginner',12),
(22,'What are some legal and ethical considerations in penetration testing?','Penetration testers must adhere to legal and ethical guidelines to ensure that testing activities do not cause harm or violate privacy laws. This includes obtaining proper authorization from the organization\'s management, obtaining consent from relevant stakeholders, and ensuring that testing activities do not disrupt critical systems or services. Additionally, testers must handle sensitive information responsibly and follow established rules of engagement outlined in the testing agreement.','Intermediate',9),
(23,'How do you prioritize and report findings from a penetration test?',' Prioritization of findings is based on factors such as severity, likelihood of exploitation, and potential impact on the organization\'s assets. Critical vulnerabilities that pose a significant risk to the organization are typically addressed first. Penetration test reports should include a detailed description of findings, including proof-of-concept exploits, recommendations for remediation, and risk assessments to help stakeholders understand the implications and prioritize mitigation efforts.','Intermediate',9),
(24,'What are the three main types of penetration testing?','The three main types of penetration testing are black-box testing, white-box testing, and gray-box testing. Black-box testing involves simulating an attack with no prior knowledge of the target system, white-box testing involves full knowledge of the target system, and gray-box testing involves limited knowledge of the target system.','Beginner',9),
(25,'How would you assess the security posture of a highly secure environment with limited attack surface?','Assessing the security posture of a highly secure environment with limited attack surface requires thinking outside the box and considering unconventional attack vectors. This might involve conducting physical security assessments to identify weaknesses in access control systems, social engineering attacks to exploit human vulnerabilities, or side-channel attacks to extract information from secure systems.','Expert',9),
(26,'What tools and techniques would you use to perform a web application penetration test?','For a web application penetration test, I would use tools such as Burp Suite, OWASP ZAP, or Nikto for web application scanning and vulnerability assessment. I would also use manual testing techniques to identify common security issues such as SQL injection, cross-site scripting (XSS), and insecure direct object references. Additionally, I might use automated scanners to identify known vulnerabilities in the web application\'s code or configuration.','Intermediate',9),
(28,'What is the difference between an array and a linked list?','An array has fixed size and stores elements in contiguous memory; a linked list consists of nodes with data and references, allowing dynamic size.','Beginner',17),
(29,'How do you optimize a SQL query for better performance?','Optimize using indexes, efficient SQL, limiting data retrieval, analyzing query performance, and considering denormalization.','Beginner',17),
(30,'What is normalization in database design?','Normalization organizes data into separate tables to reduce redundancy and improve integrity, following normalization forms.','Expert',17),
(31,'Explain the difference between INNER JOIN and LEFT JOIN in SQL.','INNER JOIN returns matching rows from both tables; LEFT JOIN returns all rows from the left table and matching rows from the right.','Intermediate',17),
(33,'What is a stored procedure, and when would you use one?','Stored procedures are precompiled SQL statements for data manipulation and logic, used for repetitive tasks and improving performance.','Intermediate',17),
(34,'What is database denormalization, and when is it appropriate?','Denormalization introduces redundancy for performance, useful in read-heavy scenarios at the expense of storage and complexity.','Intermediate',17),
(35,'What is a cookie, and how does it work?','Cookies are data stored on the user\'s computer by the web server, sent with HTTP requests for session management, tracking, and storing preferences.','Expert',17),
(36,'Discuss the advantages and disadvantages of using an ORM tool.','ORM simplifies database interactions and is language-agnostic. It can introduce performance overhead and may limit database features.','Intermediate',17),
(37,'What is the Document Object Model (DOM)?','The DOM is a tree-like representation of a web page\'s structure, allowing manipulation of content, structure, and style via programming languages.','Expert',17),
(38,'What is a session in web development?','A session maintains stateful information across multiple HTTP requests, typically for user authentication and data storage.','Intermediate',17),
(39,'Explain the concept of responsive web design.','Responsive design ensures web content functions across different devices and screen sizes, using CSS media queries and flexible layouts.','Intermediate',17),
(40,'Describe the differences between GET and POST requests.','GET requests retrieve data and include parameters in the URL; POST requests send data to the server, encapsulating data in the request body.','Intermediate',17),
(41,'What is regression testing?','Regression testing ensures new code changes don\'t break existing features, maintaining functionality over updates.','Beginner',17),
(42,'Explain the concept of CAP theorem in distributed systems.','The CAP theorem states that in a distributed system, you cannot simultaneously guarantee Consistency, Availability, and Partition Tolerance at all times.','Beginner',17),
(43,'What is infrastructure as code (IaC)?','IaC manages infrastructure using code, ensuring consistency, automation, and version control in deployments.','Beginner',17),
(44,'What are the advantages of using a microservices architecture?','Advantages include easier scalability, flexibility in choosing technology, better fault isolation, and improved continuous deployment.','Beginner',17),
(45,'Describe the process of memoization in programming.','Memoization is an optimization technique used to speed up programs by storing the results of expensive function calls.','Expert',17),
(46,'Explain the SOLID principles in software engineering.','SOLID stands for Single Responsibility, Open-Closed, Liskov Substitution, Interface Segregation, and Dependency Inversion principles, guiding towards more maintainable, understandable, and flexible software.','Expert',17),
(47,'Describe the MVC architecture.','MVC architecture stands for Model-View-Controller, separating the application into three interconnected components.','Expert',17),
(48,'What is the purpose of HTML in web design?','HTML, or HyperText Markup Language, is the standard markup language used to create the structure and content of web pages. It defines the various elements of a webpage, such as headings, paragraphs, links, and images, allowing web designers to organize and present content effectively.','Beginner',10),
(49,'How do you define CSS, and what is its role in web design?','CSS, or Cascading Style Sheets, is a style sheet language used to define the presentation and layout of HTML elements on a webpage. It allows web designers to specify attributes such as colors, fonts, spacing, and positioning, thus controlling the visual appearance and aesthetic of the website.','Beginner',10),
(50,'Why is it essential for websites to be responsive?','Responsive web design ensures that websites adapt and display optimally across various devices and screen sizes, including desktops, laptops, tablets, and smartphones. It provides users with a consistent and seamless browsing experience regardless of the device they\'re using, improving accessibility and usability.','Beginner',10),
(51,'Can you name a few commonly used HTML tags and their purposes?','Certainly! Some commonly used HTML tags include <h1> to <h6> for headings, <p> for paragraphs, <a> for links, <img> for images, <ul> and <ol> for lists, and <div> and <span> for grouping and styling content.','Beginner',10),
(52,'What is the significance of user experience in web design?','User experience (UX) encompasses the overall experience that users have when interacting with a website or application. It includes factors such as usability, accessibility, intuitiveness, and satisfaction. In web design, prioritizing user experience is crucial for engaging visitors, retaining them, and achieving business goals.','Beginner',10),
(53,'Explain the difference between a web browser and a search engine.','A web browser is a software application used to access and view websites on the internet. Examples include Google Chrome, Mozilla Firefox, and Safari. On the other hand, a search engine is a website or online service that allows users to search for information on the internet by entering keywords or phrases. Examples include Google, Bing, and Yahoo.','Beginner',10),
(54,'How do you approach designing a user-friendly navigation menu for a website?','To design a user-friendly navigation menu, I consider factors such as simplicity, clarity, and consistency. I prioritize essential links and organize them logically to make navigation intuitive for users. I also ensure that the menu is easily accessible and visible across all pages of the website, using techniques like dropdown menus or hamburger icons for mobile devices.','Intermediate',10),
(55,'Can you describe the concept of \'above the fold\' in web design, and why is it important?','The term \'above the fold\' refers to the portion of a webpage that is visible without scrolling down. It\'s considered important because it\'s the first impression that users get when they land on a webpage. Designing key content, such as headlines, call-to-action buttons, and essential information, to be prominently displayed above the fold can help capture users\' attention and encourage them to explore further.','Intermediate',10),
(56,'What are some basic principles of color theory that can be applied to web design?','Color theory principles such as contrast, harmony, and psychology play a crucial role in web design. Contrast ensures that text and important elements stand out from the background, improving readability and visual hierarchy. Harmony involves using complementary or analogous colors to create a pleasing and balanced color scheme. Psychology studies how colors evoke emotions and perceptions, allowing designers to choose colors that align with the website\'s branding and target audience.','Intermediate',10),
(57,'How do you ensure consistency in design across different pages of a website?','Consistency is maintained by establishing and following design guidelines, including typography, color scheme, spacing, and layout. Using templates, style guides, and design systems helps ensure that elements such as headers, footers, navigation menus, and buttons are consistent across all pages. Regular reviews and feedback sessions also help identify and address any inconsistencies in the design.','Intermediate',10),
(58,'What are wireframes, and how do they contribute to the web design process?','Wireframes are skeletal, low-fidelity representations of a webpage\'s layout and structure. They outline the placement of elements such as headers, navigation menus, content sections, and call-to-action buttons without specifying visual details like colors and imagery. Wireframes serve as a blueprint for the website\'s design, allowing designers and stakeholders to visualize the layout and flow of content before proceeding to the mockup and development stages.','Intermediate',10),
(59,'Explain the importance of accessibility in web design and how you ensure it in your projects.','Accessibility ensures that websites are usable and accessible to all users, including those with disabilities. It\'s important for compliance with accessibility standards such as the Web Content Accessibility Guidelines (WCAG) and for providing an inclusive user experience. To ensure accessibility in my projects, I follow best practices such as using semantic HTML, providing alternative text for images, ensuring keyboard navigation, and testing with screen readers and other assistive technologies.','Intermediate',10),
(60,'How do you integrate SEO principles into your web design process?','SEO, or Search Engine Optimization, is essential for improving a website\'s visibility and ranking in search engine results. In my web design process, I integrate SEO principles by optimizing website structure and navigation for crawlability and indexability, using descriptive and keyword-rich metadata, optimizing page load speed and performance, ensuring mobile-friendliness and responsive design, and creating high-quality, relevant content that meets user intent and search engine guidelines.','Expert',10),
(61,'Can you discuss the pros and cons of using frameworks like Bootstrap in web design?','Frameworks like Bootstrap offer a set of pre-designed templates, components, and styles that streamline the web design and development process, saving time and effort. They provide consistency, responsiveness, and cross-browser compatibility out of the box. However, using frameworks can lead to websites looking generic if not customized adequately. They may also add unnecessary code bloat and dependencies, impacting performance and flexibility. Therefore, it\'s essential to weigh the pros and cons and consider the specific requirements of each project before deciding whether to use a framework.','Expert',9),
(62,'What are some strategies for optimizing website performance, especially for mobile users?','Optimizing website performance for mobile users involves various strategies such as minimizing server response times, optimizing images and multimedia assets for smaller screens and slower connections, leveraging browser caching and content delivery networks (CDNs), prioritizing critical content and resources for faster loading, implementing lazy loading for offscreen content, and reducing unnecessary scripts and plugins. It\'s also crucial to test performance across different devices and network conditions and make adjustments as needed to ensure a fast and responsive user experience.','Expert',10),
(63,'How do you approach designing for cross-browser compatibility, and what challenges may arise?','Designing for cross-browser compatibility involves testing and ensuring that a website functions and appears consistently across different web browsers and their various versions. Challenges may arise due to differences in rendering engines, CSS support, JavaScript interpretation, and browser-specific quirks and bugs. To address these challenges, I follow best practices such as using standardized HTML and CSS, testing early and often across multiple browsers and devices, and using feature detection and progressive enhancement to provide a consistent user experience regardless of the browser used.','Expert',10),
(64,'Can you explain the concept of \'progressive enhancement\' in web design and its significance?','Progressive enhancement is an approach to web design that starts with a basic, universally accessible version of a website and progressively enhances it with additional features and functionalities for users with more advanced browsers or devices. It ensures that all users, regardless of their device or browser capabilities, can access and interact with the core content and functionality of the website. Progressive enhancement promotes accessibility, resilience, and future-proofing by prioritizing core content and progressively enhancing the user experience based on the capabilities of the user\'s device.','Expert',10),
(65,'Describe a situation where you had to balance aesthetic design choices with usability requirements. How did you approach it?','In a recent project, I was tasked with redesigning a product page for an e-commerce website. While the client wanted a visually striking and modern design, usability was also a top priority to ensure a seamless shopping experience for users. To balance aesthetic design choices with usability requirements, I conducted user research and usability testing to understand user preferences and pain points. Based on the findings, I focused on optimizing the layout, navigation, and user flows to prioritize ease of use and accessibility while incorporating visually appealing design elements and interactive features. Regular feedback sessions with stakeholders helped ensure that the final design struck the right balance between aesthetics and usability, resulting in a successful redesign that met both user needs and business goals.','Expert',10),
(66,'How do you approach designing for cross-device and cross-platform compatibility, considering the wide range of screen sizes and interaction methods?','Designing for cross-device and cross-platform compatibility requires a comprehensive understanding of user behavior, device capabilities, and platform conventions. I adopt a \'mobile-first\' approach, starting with designing for smaller screens and then progressively enhancing the design for larger devices. I use responsive design techniques such as fluid grids, flexible images, and media queries to ensure that the layout and content adapt seamlessly across various screen sizes and orientations. Additionally, I leverage device-specific features and interactions to optimize the user experience for each platform while maintaining consistency in branding and functionality.','Expert',10),
(67,'Can you discuss a recent trend or emerging technology in web design that has influenced your approach to design projects?','One recent trend that has significantly influenced my approach to design projects is the adoption of dark mode interfaces. With the increasing popularity of devices and operating systems offering dark mode options, designing interfaces that support this feature has become crucial. Dark mode not only enhances readability and reduces eye strain, especially in low-light environments, but it also adds a sleek and modern aesthetic to the design. In my projects, I incorporate dark mode as an alternative color scheme, allowing users to switch between light and dark modes based on their preferences. I ensure that the design maintains visual hierarchy, contrast, and accessibility in both modes while providing a consistent and immersive user experience across platforms.','Expert',10);

/*Table structure for table `int_bot_app_request_table` */

DROP TABLE IF EXISTS `int_bot_app_request_table`;

CREATE TABLE `int_bot_app_request_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `job_table_id` bigint NOT NULL,
  `user_table_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Int_BOT_app_request__user_table_id_208a7e51_fk_Int_BOT_a` (`user_table_id`),
  KEY `Int_BOT_app_request__job_table_id_b8b7eadb_fk_Int_BOT_a` (`job_table_id`),
  CONSTRAINT `Int_BOT_app_request__job_table_id_b8b7eadb_fk_Int_BOT_a` FOREIGN KEY (`job_table_id`) REFERENCES `int_bot_app_job_table` (`id`),
  CONSTRAINT `Int_BOT_app_request__user_table_id_208a7e51_fk_Int_BOT_a` FOREIGN KEY (`user_table_id`) REFERENCES `int_bot_app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `int_bot_app_request_table` */

insert  into `int_bot_app_request_table`(`id`,`date`,`status`,`job_table_id`,`user_table_id`) values 
(37,'2024-02-19','Accepted',9,4),
(39,'2024-02-20','Accepted',11,5),
(40,'2024-02-27','Selected',9,5),
(41,'2024-02-27','Rejected',10,5),
(42,'2024-02-27','Requested',12,5),
(43,'2024-02-27','Requested',13,5),
(44,'2024-03-19','Accepted',17,5),
(45,'2024-03-19','Accepted',10,3);

/*Table structure for table `int_bot_app_result_table` */

DROP TABLE IF EXISTS `int_bot_app_result_table`;

CREATE TABLE `int_bot_app_result_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `result` longtext NOT NULL,
  `date` date NOT NULL,
  `emotion` varchar(100) NOT NULL,
  `mark` double NOT NULL,
  `QnA_table_id` bigint NOT NULL,
  `request_table_id` bigint NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Int_BOT_app_result_t_QnA_table_id_ae0733f2_fk_Int_BOT_a` (`QnA_table_id`),
  KEY `Int_BOT_app_result_t_request_table_id_f0cdb9fd_fk_Int_BOT_a` (`request_table_id`),
  CONSTRAINT `Int_BOT_app_result_t_QnA_table_id_ae0733f2_fk_Int_BOT_a` FOREIGN KEY (`QnA_table_id`) REFERENCES `int_bot_app_qna_table` (`id`),
  CONSTRAINT `Int_BOT_app_result_t_request_table_id_f0cdb9fd_fk_Int_BOT_a` FOREIGN KEY (`request_table_id`) REFERENCES `int_bot_app_request_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `int_bot_app_result_table` */

insert  into `int_bot_app_result_table`(`id`,`result`,`date`,`emotion`,`mark`,`QnA_table_id`,`request_table_id`,`status`) values 
(214,'html, or hypertext markup language, is the standard markup language used to create the structure and content of web pages. it defines the various elements of a webpage, such as headings, paragraphs, links, and images, allowing web designers to organize and present content effectively.','2024-03-20','',10,48,45,''),
(215,'nida','2024-03-20','',0,48,45,'');

/*Table structure for table `int_bot_app_user_table` */

DROP TABLE IF EXISTS `int_bot_app_user_table`;

CREATE TABLE `int_bot_app_user_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `pin` bigint NOT NULL,
  `phone_number` bigint NOT NULL,
  `CV` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `proof` varchar(100) NOT NULL,
  `login_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Int_BOT_app_user_tab_login_id_c8a026f2_fk_Int_BOT_a` (`login_id`),
  CONSTRAINT `Int_BOT_app_user_tab_login_id_c8a026f2_fk_Int_BOT_a` FOREIGN KEY (`login_id`) REFERENCES `int_bot_app_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `int_bot_app_user_table` */

insert  into `int_bot_app_user_table`(`id`,`fname`,`lname`,`photo`,`place`,`post`,`pin`,`phone_number`,`CV`,`email`,`proof`,`login_id`) values 
(1,'abc','xyz','Nitro_Wallpaper_05_3840x2400.jpg','nbij','hnkih',4562,24895266,'gtdutd','jyhfiyfy','hjgfxujt',2),
(2,'Fathima','Singh','Nitro_Wallpaper_05_3840x2400.jpg','Malappuram','Manjeri',676122,9207308299,'Nitro_Wallpaper_02_3840x2400_Zrzu0kf.jpg','fathimasingh@gmail.com','Nitro_Wallpaper_04_3840x2400_tKrYJ2L.jpg',4),
(3,'Nida ','Suhail','IMG-20210705-WA0013.jpg','Areekode','Ugrapuram',676123,9567242160,'Resume_22_11_2023_12_23_17_pm.pdf','fathimanida333@gmail.com','WhatsApp Image 2023-12-29 at 11.11.28_cfd8d2fc.jpg',5),
(4,'Ardra ','Manoj','IMG_20220618_101741.jpg','Perinthalmanna ','Thiroorkkad',678971,9895434339,'Ardra - Resume_20231203_232042_0000.pdf','ardramanoj@123','DocScanner 08-Jul-2023 12-21 am.pdf',6),
(5,'Fathima  ','Marsheena K P','1667235608133_xK5p6m0.jpg','malappuram  ','Nellikkuth',676122,9207308299,'Driving Licence.pdf','nil@gmail.com','passport .pdf',7);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
