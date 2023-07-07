-- MariaDB dump 10.19  Distrib 10.11.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: laravel
-- ------------------------------------------------------
-- Server version	10.11.4-MariaDB-1:10.11.4+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_reset_tokens_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2023_07_05_154851_create_tasks_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('todo','in_progress','done') NOT NULL DEFAULT 'todo',
  `deadline` date NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_user_id_foreign` (`user_id`),
  CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES
(1,'aspernatur non ipsum','Recusandae consequatur pariatur enim natus molestiae. Asperiores odit in dolorum dicta alias at.','todo','2023-06-24',1,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(2,'qui sed nesciunt','Qui quia consequatur est nostrum vel excepturi adipisci. Qui enim exercitationem quam.','done','2023-06-09',1,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(3,'animi vitae voluptas','Ea omnis aut quis et et. Consequatur voluptas numquam eligendi molestiae vel.','done','2023-07-05',1,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(4,'debitis consequatur expedita','Rerum sequi a voluptatibus ea. Enim aspernatur natus laudantium.','todo','2023-06-24',1,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(5,'qui omnis temporibus','Quae harum maiores temporibus et. Eligendi accusantium et animi.','todo','2023-06-26',1,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(6,'culpa minima est','Eos molestiae reiciendis nemo quam omnis molestiae iste. Rerum consequatur qui molestias.','todo','2023-06-23',1,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(7,'voluptatibus repellat autem','Eum dolore nostrum voluptate vel et et. Qui neque amet perspiciatis asperiores optio.','in_progress','2023-06-22',1,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(8,'quia maiores cum','Laborum est cumque vitae sit. Libero repellat iusto consectetur explicabo sint labore.','done','2023-06-13',1,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(9,'et et quia','Ipsam nisi omnis praesentium architecto. Sunt reiciendis est vero et velit.','todo','2023-06-22',1,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(10,'et ipsam unde','Excepturi temporibus dolorem doloremque perferendis occaecati ut. Voluptatum quibusdam minima enim ipsum ipsam ut.','in_progress','2023-06-30',1,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(11,'porro itaque asperiores','Ut et assumenda nisi. Et qui ex voluptatem neque magnam quidem.','in_progress','2023-06-25',2,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(12,'repellat fuga rerum','Quo qui natus commodi deleniti in aut perspiciatis. Soluta expedita pariatur sapiente quia.','todo','2023-06-20',2,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(13,'mollitia sit ex','In quia maiores debitis explicabo est natus dicta voluptatem. Eius mollitia officia ut.','done','2023-06-29',2,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(14,'asperiores quia est','Qui quos nihil sit nesciunt. Eligendi similique ratione qui voluptate repellendus fugit possimus amet.','in_progress','2023-07-03',2,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(15,'fugit fuga dolorum','Repellat ipsa voluptatem aperiam ab amet quis. Iusto hic quod quod assumenda et ut.','todo','2023-06-19',2,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(16,'ab consequuntur maiores','Accusamus consectetur odio laudantium reiciendis aut. Porro recusandae non optio.','todo','2023-06-18',2,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(17,'perspiciatis vel neque','Dignissimos laudantium eaque fuga incidunt sunt totam. Aliquid asperiores consectetur et ipsam.','todo','2023-06-12',2,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(18,'quibusdam iusto eligendi','Sequi quas est aperiam est et reiciendis ullam. Dolorem consequuntur illo sed eligendi.','in_progress','2023-06-11',2,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(19,'libero quia magni','Dolorem inventore nulla velit ipsum et fugit. Soluta rem ad qui ut praesentium.','in_progress','2023-06-20',2,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(20,'rerum mollitia perferendis','Eum veritatis omnis explicabo consequatur. Qui saepe sit assumenda neque enim laboriosam quod eos.','todo','2023-06-27',2,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(21,'modi voluptatem eveniet','Atque nulla quia quidem aut voluptatum blanditiis. Id recusandae ab aut sapiente sed soluta cupiditate.','done','2023-06-10',3,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(22,'recusandae nisi doloremque','Facilis ipsa eos aut quia doloremque beatae non nostrum. Soluta autem molestiae dignissimos architecto.','todo','2023-06-24',3,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(23,'et laborum repudiandae','Est natus voluptatem autem qui. Temporibus consequatur enim et nihil repellat.','todo','2023-06-15',3,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(24,'ipsam in vel','Accusantium aut dicta cum deleniti consequatur blanditiis. Nihil illum asperiores quia aliquid accusantium nihil est.','in_progress','2023-06-09',3,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(25,'autem voluptatum maxime','Recusandae at labore eum ducimus sed. Consequuntur eos sint repellendus et mollitia.','todo','2023-06-16',3,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(26,'tenetur odio labore','Voluptatem sed tenetur architecto officia assumenda est. Sed aut ullam ipsam earum sunt autem.','in_progress','2023-07-02',3,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(27,'dolorem pariatur quis','Illo eos qui sed et veritatis sunt ut aut. Quis unde non nulla vel debitis libero.','done','2023-07-06',3,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(28,'vitae sunt nesciunt','Quia eum delectus at sed. Sunt enim aut qui sit commodi et.','done','2023-06-09',3,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(29,'facere quisquam ad','Est non aut commodi quasi dicta necessitatibus. Sint dolores voluptatibus sunt et.','in_progress','2023-06-14',3,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(30,'aut assumenda unde','Quibusdam ratione dolores cumque et non quis hic id. Quo laudantium voluptas et et vel facilis qui.','todo','2023-06-21',3,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(31,'quia non quaerat','Numquam nisi eligendi tempora qui eaque quis quos. Et cum ut quaerat delectus magnam blanditiis.','done','2023-07-05',4,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(32,'aspernatur consequatur culpa','Numquam repellat doloribus dolores. Aliquam et iure voluptatum in.','in_progress','2023-06-12',4,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(33,'adipisci sit natus','Esse expedita dolor excepturi quam. Aut cumque nesciunt temporibus et cumque natus.','done','2023-06-29',4,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(34,'et velit nulla','In itaque voluptas qui ex deserunt. Impedit sed provident totam rerum.','in_progress','2023-06-17',4,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(35,'itaque sequi qui','Exercitationem laborum vero qui tempora ad cupiditate. Odit qui dolore est non enim incidunt.','todo','2023-06-20',4,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(36,'ut non saepe','Porro consequatur natus quo aut recusandae placeat nostrum assumenda. Atque atque rerum corrupti occaecati libero consectetur fugit.','in_progress','2023-06-24',4,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(37,'voluptatibus laboriosam dolorem','Provident et nulla explicabo praesentium quo sapiente sit. Vel aut ad quaerat aspernatur suscipit.','in_progress','2023-06-21',4,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(38,'est fuga nisi','Id qui repudiandae qui repudiandae est esse. Dicta consequatur cum ab distinctio.','todo','2023-06-12',4,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(39,'voluptatem ut nesciunt','Id ut itaque qui dolorum accusantium esse. Dolorum dicta tenetur sed voluptatum repellat.','todo','2023-06-19',4,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(40,'aperiam rem harum','Quaerat dicta temporibus cumque ut. Et accusantium necessitatibus consequuntur cumque dolorem.','done','2023-06-27',4,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(41,'aut aut omnis','Eos ipsa magni eos delectus quam. Omnis voluptas in voluptatum id tempora.','todo','2023-06-25',5,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(42,'impedit sit debitis','Deserunt et voluptas animi autem. Error qui illum numquam quia reprehenderit fugiat.','todo','2023-06-15',5,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(43,'consequuntur rerum laborum','Quod voluptatem in dicta iure. Vel unde quia suscipit corrupti nisi expedita et.','done','2023-07-03',5,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(44,'omnis suscipit architecto','Eius dolor aliquam suscipit odit quas. Qui voluptatum veniam est doloribus sit ratione quod nihil.','in_progress','2023-06-12',5,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(45,'sequi quasi id','Quo laborum illo unde nihil culpa natus. Dolorem illo fugit omnis eaque.','done','2023-06-26',5,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(46,'repellat amet temporibus','In tempora similique ipsam delectus cum dolorem. Quia est cumque provident dolorem ducimus.','in_progress','2023-06-26',5,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(47,'quis aut minus','Dicta qui tempore et veritatis sed eos. Velit sit est hic cumque dignissimos iure.','todo','2023-06-30',5,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(48,'sunt ratione autem','Ullam assumenda porro modi. Harum vitae velit architecto qui.','todo','2023-06-09',5,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(49,'error explicabo porro','Labore est rerum maiores nihil fugiat laudantium expedita qui. Quasi sint ipsum ipsum.','todo','2023-06-15',5,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(50,'voluptate et atque','Eos vel nemo odio facilis beatae ut. Modi veritatis iusto qui sapiente laudantium porro quam dolor.','in_progress','2023-07-04',5,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(51,'autem voluptatem minima','Et vel voluptatem aut et reiciendis. Voluptatum id assumenda ut id ipsa quas.','done','2023-07-04',6,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(52,'eaque blanditiis voluptates','Vero non sint adipisci enim sit dolore ipsum. Repellendus et quae sint aspernatur.','todo','2023-07-04',6,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(53,'facere dolorum quia','Eaque debitis architecto vitae sequi molestias omnis eos. Voluptas aut eveniet exercitationem enim.','done','2023-06-11',6,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(54,'enim et ut','Omnis quia omnis qui aut illum optio distinctio. Qui sapiente aut nulla corporis tempore.','todo','2023-06-25',6,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(55,'neque non repellat','Sit ex voluptas cumque iure ut. Ipsa commodi corporis odit.','todo','2023-06-08',6,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(56,'aut odit rerum','Earum dolor optio ea quidem rerum quia explicabo. Quisquam amet laboriosam qui ad animi.','in_progress','2023-06-28',6,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(57,'assumenda ipsam aut','Est esse eos magnam et incidunt est. Dicta nobis qui aperiam dolores nam distinctio dolor.','todo','2023-06-16',6,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(58,'minima eveniet voluptas','Exercitationem nulla sed quidem quia. Tempore omnis est pariatur distinctio.','done','2023-06-23',6,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(59,'voluptatem molestias velit','Ea commodi voluptate quia est. Et est eos fugiat aspernatur accusamus consequatur fuga in.','todo','2023-06-27',6,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(60,'laborum tenetur iusto','Ut explicabo quisquam sequi neque blanditiis est. Hic tempore ut iusto sit enim esse.','in_progress','2023-06-19',6,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(61,'amet qui eum','Nemo dolorum aut rem impedit iure distinctio. Aut maxime itaque ex.','in_progress','2023-07-04',7,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(62,'blanditiis dolorum voluptates','Nulla quia exercitationem aperiam repellendus sint sint. Exercitationem est explicabo pariatur perspiciatis nesciunt sed.','in_progress','2023-06-29',7,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(63,'voluptas modi ut','Quia vel nostrum architecto dicta. Odio id voluptatibus rerum.','done','2023-06-18',7,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(64,'aut cum delectus','Voluptatem illum provident inventore. Ullam magni veritatis non occaecati.','todo','2023-06-18',7,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(65,'provident enim animi','Et nulla ipsam recusandae et ratione atque. Porro nisi qui necessitatibus tenetur doloremque.','done','2023-06-07',7,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(66,'autem voluptas quo','Beatae fuga quibusdam amet soluta. Aut exercitationem enim odit consequatur.','in_progress','2023-06-08',7,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(67,'aliquam nesciunt beatae','Dolorem accusantium est molestiae consectetur molestiae. Labore dolor debitis quae laborum autem reiciendis.','done','2023-06-15',7,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(68,'quam eum aliquid','Iusto maxime possimus voluptatem nihil facere eum. Perferendis enim aut vel non est inventore quaerat sunt.','todo','2023-06-12',7,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(69,'dignissimos sed nam','Quia deleniti labore quia non maxime. Et et quidem in nisi dicta.','done','2023-07-01',7,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(70,'optio atque et','Repellat et aspernatur autem incidunt qui voluptatem optio. Eum officia beatae dolores est rerum.','in_progress','2023-06-15',7,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(71,'facere sequi ea','Vero aliquid maiores enim aut dolores rerum labore. Recusandae et et quae et aut aspernatur dolorem.','todo','2023-06-28',8,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(72,'dolor sapiente ea','Eveniet debitis sit exercitationem commodi magnam minus minima. Et molestiae rerum hic.','in_progress','2023-07-02',8,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(73,'quia unde laborum','Est quae repudiandae nisi aut temporibus atque. In quis esse tempora.','todo','2023-06-28',8,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(74,'repellendus nulla voluptatem','Odit qui et non culpa fugit. Est est unde id necessitatibus.','done','2023-06-20',8,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(75,'iure quo quasi','Et occaecati quae est in rerum. Ducimus culpa ea eligendi tenetur nulla.','in_progress','2023-06-25',8,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(76,'consequatur voluptatem assumenda','A ratione est fuga et. Nulla voluptatem nihil nesciunt et.','todo','2023-07-02',8,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(77,'eum commodi quod','Nostrum consectetur temporibus ipsa natus ut. Nihil qui dolores illum cumque corporis voluptas.','in_progress','2023-06-15',8,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(78,'officiis nemo ipsam','Architecto cum animi natus blanditiis. Autem sapiente qui dolores commodi optio.','in_progress','2023-07-04',8,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(79,'beatae non culpa','Repellendus quod ea voluptas voluptatibus molestiae adipisci. Vel maiores facilis nobis rerum quam dignissimos.','todo','2023-06-30',8,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(80,'quis vel sit','Esse cumque aperiam laudantium quod adipisci ut. Quisquam id sit architecto assumenda.','done','2023-06-18',8,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(81,'sed aut sed','Rerum et quia molestias ea reiciendis. Cumque ea culpa harum minus.','todo','2023-06-16',9,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(82,'aliquid accusantium earum','Aut magni iste reprehenderit assumenda fugit sed repellendus sint. Voluptate placeat autem nemo vero et quaerat ut repellendus.','done','2023-06-23',9,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(83,'magni sed doloremque','Molestiae odio cupiditate nisi. Natus architecto ab voluptatem sed.','done','2023-06-13',9,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(84,'non cupiditate odit','Officia ex necessitatibus dicta ratione numquam rem placeat. Dolorum blanditiis alias natus quae quia vitae fugit.','todo','2023-06-23',9,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(85,'distinctio est sunt','Voluptatem consectetur aspernatur ea debitis quia. Et non atque exercitationem earum est.','in_progress','2023-06-30',9,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(86,'sunt ex eum','Aliquam soluta qui qui omnis. Eaque commodi officiis in sint fugiat culpa doloremque.','done','2023-07-02',9,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(87,'aliquam sit voluptas','In aut ut provident harum tempora. Unde nisi ratione error quis.','in_progress','2023-06-16',9,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(88,'tempore consequatur nobis','Soluta neque tempora culpa assumenda nobis. Quaerat et odio sit suscipit quae sed temporibus qui.','in_progress','2023-07-05',9,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(89,'nesciunt nam perspiciatis','Rerum ab at est libero non. Culpa quae exercitationem laudantium officiis.','todo','2023-06-17',9,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(90,'voluptas omnis omnis','Repellat ad qui dolor natus commodi vero et. Amet quos voluptatibus temporibus recusandae nihil velit fugiat in.','done','2023-06-29',9,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(91,'dolorum aut error','Sunt aut facere voluptatem ipsa iste commodi eum ut. Libero et voluptatum ea illum amet porro ad facilis.','done','2023-07-03',10,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(92,'totam cupiditate quos','Aut delectus eaque totam ipsum blanditiis aliquam sit. Fuga nihil unde fugit est incidunt voluptas.','todo','2023-06-24',10,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(93,'consequatur qui et','Optio quod et et. Cum ipsa et consequuntur nihil.','in_progress','2023-06-25',10,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(94,'perferendis cupiditate ducimus','Odit soluta libero et non explicabo nihil deserunt. Consequatur vero totam quisquam nobis illo.','done','2023-06-26',10,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(95,'necessitatibus unde dolor','Voluptatem omnis voluptatem velit ea molestiae maiores quis. A aut numquam est minus fugit quibusdam vitae.','done','2023-06-08',10,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(96,'pariatur eius amet','Dolorum aut quaerat quo unde. Ut aperiam doloremque sed voluptate.','done','2023-07-05',10,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(97,'ipsam omnis aspernatur','Enim molestias ea reiciendis numquam amet ipsa. Est reiciendis et illum maiores est.','in_progress','2023-06-12',10,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(98,'enim itaque exercitationem','Tempora aut commodi et est. Nobis quidem eos voluptatum reprehenderit.','done','2023-06-11',10,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(99,'non in ab','Quis iure et temporibus ut voluptatum est consectetur. Voluptas ipsum eos necessitatibus enim.','done','2023-06-24',10,'2023-07-07 02:09:54','2023-07-07 02:09:54'),
(100,'est sed ut','Necessitatibus expedita nostrum sit molestiae doloremque. Quo eos commodi exercitationem eveniet rerum.','todo','2023-07-06',10,'2023-07-07 02:09:54','2023-07-07 02:09:54');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Dr. Emmalee Bradtke DVM','ykoelpin@example.com','2023-07-07 02:09:54','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','CxV6SZV91R','2023-07-07 02:09:54','2023-07-07 02:09:54'),
(2,'Mozell Fahey','terry.monserrate@example.org','2023-07-07 02:09:54','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','pw56MbInTn','2023-07-07 02:09:54','2023-07-07 02:09:54'),
(3,'Stephen Bernier','whane@example.com','2023-07-07 02:09:54','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','aYjgYL5MoZ','2023-07-07 02:09:54','2023-07-07 02:09:54'),
(4,'Brielle Corwin','mariana.harber@example.org','2023-07-07 02:09:54','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','8cU9AOaPfu','2023-07-07 02:09:54','2023-07-07 02:09:54'),
(5,'Hans Schuster','imogene.christiansen@example.org','2023-07-07 02:09:54','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','FNVtfVY7Qn','2023-07-07 02:09:54','2023-07-07 02:09:54'),
(6,'Krystel Kutch','ozella81@example.net','2023-07-07 02:09:54','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','PiALTCVNax','2023-07-07 02:09:54','2023-07-07 02:09:54'),
(7,'Hiram Ritchie','carroll.priscilla@example.org','2023-07-07 02:09:54','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','49nzZuy7RD','2023-07-07 02:09:54','2023-07-07 02:09:54'),
(8,'Wilhelmine Macejkovic DDS','keshaun08@example.net','2023-07-07 02:09:54','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','sfJ4Iqouys','2023-07-07 02:09:54','2023-07-07 02:09:54'),
(9,'Dr. Lonzo Herman MD','mariano19@example.org','2023-07-07 02:09:54','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','DVnksqEzSl','2023-07-07 02:09:54','2023-07-07 02:09:54'),
(10,'Lee Hickle','kennedy48@example.net','2023-07-07 02:09:54','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','dCZzJV4TrU','2023-07-07 02:09:54','2023-07-07 02:09:54');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-07  2:15:01
