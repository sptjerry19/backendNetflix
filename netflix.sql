-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: netflix
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `films_id` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'anime',NULL,'2023-10-30 04:19:30','2023-10-30 04:19:30'),(2,'mixi vlog',NULL,'2023-10-30 04:19:41','2023-10-30 04:19:41'),(3,'Drama movie',NULL,'2023-10-30 07:33:46','2023-10-30 07:33:46'),(4,'Family movie night',NULL,'2023-10-30 07:33:54','2023-10-30 07:33:54'),(5,'Korean drama film',NULL,'2023-10-30 07:34:07','2023-10-30 07:34:07'),(6,'Action movie',NULL,'2023-10-30 07:34:14','2023-10-30 07:34:14');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `over_view` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int NOT NULL DEFAULT '10',
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `films_category_id_foreign` (`category_id`),
  CONSTRAINT `films_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,'image/vt0DuCojTelKrBAzuBhPFPuKz2txrYiOj8PPAN3w.jpg','https://www.youtube.com/embed/elRYVCXh8N0','Pok├⌐mon: Mewtwo phß║ún c├┤ng ΓÇô Tiß║┐n h├│a','Sau khi nhß║¡n lß╗¥i mß╗¥i cß╗ºa mß╗Öt huß║Ñn luyß╗çn vi├¬n b├¡ ß║⌐n, Ash, Misty v├á Brock gß║╖p Mewtwo ΓÇô mß╗Öt Pok├⌐mon nh├ón tß║ío muß╗æn g├óy chiß║┐n',100,1,'2023-10-30 04:23:58','2023-10-30 04:23:58'),(2,'image/g9XwmGu6pcv1yEq2btJK5XJEJOC2iSxbpPqxczGb.jpg','https://www.youtube.com/embed/RNFiB3NbGac','Mowgli: Huyß╗ün thoß║íi rß╗½ng xanh','Mß╗Öt cß║¡u b├⌐ mß╗ô c├┤i ─æ╞░ß╗úc nhß╗»ng con th├║ vß║¡t nu├┤i d╞░ß╗íng nß║»m lß║Ñy vß║¡n mß╗çnh cß╗ºa m├¼nh trong khi ─æß╗æi mß║╖t vß╗¢i kß║╗ th├╣ nguy hiß╗âm ΓÇô v├á cß║ú nguß╗ôn gß╗æc con ng╞░ß╗¥i cß╗ºa m├¼nh.',100,1,'2023-10-30 07:30:28','2023-10-30 07:30:28'),(3,'image/kZ7RHal2lJzgtmY0o9ccgwc4R3jHoUnv9wIxMKKA.png','https://www.youtube.com/embed/H8fK1ztk7Iw','SpongeBob: Bß╗ìt biß╗ân ─æ├áo tß║⌐u','Khi cß║¡u bß║ín th├ón Gary ─æß╗Öt nhi├¬n bß╗ï bß║»t c├│c, SpongeBob chi├¬u mß╗Ö Patrick cho mß╗Öt nhiß╗çm vß╗Ñ ─æi├¬n rß╗ô v╞░ß╗út khß╗Åi thß╗ï trß║Ñn ─É├íy Biß╗ân Bikini ─æß╗â cß╗⌐u cß║¡u bß║ín c├│ vß╗Å m├áu hß╗ông n├áy.',100,1,'2023-10-30 07:31:19','2023-10-30 07:31:19'),(4,'image/HmtDfh37ivVhdMSFxRbTeyuv5McCp8Cs00ACGk8V.jpg','https://www.youtube.com/embed/JtqIas3bYhg','Cyberpunk: Edgerunners','Giß╗»a cß║únh loß║ín lß║íc ─æß║ºy sß╗▒ thß╗æi n├ít v├á si├¬u thiß║┐t bß╗ï ─æiß╗üu khiß╗ân, t├¬n nh├│c ─æ╞░ß╗¥ng phß╗æ t├ái ba m├á liß╗üu l─⌐nh cß╗æ gß║»ng trß╗ƒ th├ánh edgerunner, l├¡nh ─æ├ính thu├¬ ngo├ái v├▓ng ph├íp luß║¡t.',100,1,'2023-10-30 07:32:20','2023-10-30 07:32:20'),(5,'image/ZTEVKl4sMGeOPSaEjurMqrN2U8oZUlIjsETe7N93.jpg','https://www.youtube.com/embed/WKIxSebCF54','Thß║Ñt h├¼nh ─æß║íi tß╗Öi','Khi v╞░╞íng quß╗æc bß╗ï x├óm chiß║┐m bß╗ƒi l┼⌐ bß║ío ng╞░ß╗úc, n├áng c├┤ng ch├║a bß╗ï phß║┐ truß║Ñt bß║»t ─æß║ºu h├ánh tr├¼nh t├¼m mß╗Öt nh├│m hiß╗çp s─⌐ quß╗╖ bß╗ï ph├ón t├ín ─æß╗â gi├║p n├áng gi├ánh lß║íi l├únh ─æß╗ïa.',100,1,'2023-10-30 07:32:56','2023-10-30 07:32:56'),(6,'image/eW6P8sg0tmKFafVZ5EilU6M4L4edxE8xBdPVENQY.jpg','https://www.youtube.com/embed/6laJDoUpaHc','Phi vß╗Ñ triß╗çu ─æ├┤: H├án Quß╗æc','Khi b─âng c╞░ß╗¢p kiß╗âm so├ít x╞░ß╗ƒng in tiß╗ün cß╗ºa H├án Quß╗æc thß╗æng nhß║Ñt v├á c├íc con tin bß╗ï mß║»c kß║╣t b├¬n trong, cß║únh s├ít phß║úi ng─ân chß║╖n bß╗ìn ch├║ng v├á kß║╗ chß╗º m╞░u mß╗¥ ├ím ─æß╗⌐ng sau tß║Ñt cß║ú',100,6,'2023-10-30 07:35:12','2023-10-30 07:35:12'),(7,'image/dJwT07wwjFpCaBG1zzYem39ZkiCGFwHVD4dkFI6M.jpg','https://www.youtube.com/embed/FcGB0OHUIuU','Tr├▓ ch╞íi con mß╗▒c','H├áng tr─âm ng╞░ß╗¥i ch╞íi kß║╣t tiß╗ün ch├ó╠üp nhß║¡n mß╗Öt lß╗¥i mß╗¥i ky╠Ç lß║í: thi ─æß║Ñu trong c├íc tr├▓ ch╞íi trß║╗ con. ─Éo╠ün ch╞í╠Ç ho╠ú la╠Ç m├┤╠út giß║úi th╞░ß╗ƒng hß║Ñp dß║½n ΓÇô va╠Ç nhß╗»ng rß╗ºi ro chß║┐t ng╞░ß╗¥i.',100,6,'2023-10-30 07:36:09','2023-10-30 07:36:09'),(8,'image/NluAXwwkI3htJtGE1BLM7fBzgA7N1RRio8QiNcfW.jpg','https://www.youtube.com/embed/mG1FIeHG9us','Sweet Home: Thß║┐ giß╗¢i ma qu├íi','Khi con ng╞░ß╗¥i biß║┐n th├ánh qu├íi vß║¡t man rß╗ú gieo rß║»c kinh ho├áng, mß╗Öt thiß║┐u ni├¬n tr─ân trß╗ƒ v├á h├áng x├│m ß╗ƒ c─ân hß╗Ö cß╗ºa cß║¡u phß║úi chiß║┐n ─æß║Ñu ─æß╗â sinh tß╗ôn ΓÇô v├á giß╗» lß║Ñy nh├ón t├¡nh.',100,6,'2023-10-30 07:36:58','2023-10-30 07:36:58'),(9,'image/eRIps60hse0mLVuEkPvFTuyvhTlQ8NSgP6TrZoiK.jpg','https://www.youtube.com/embed/Qo8tl7L2fzI','Ng├┤i tr╞░ß╗¥ng x├íc sß╗æng','Mß╗Öt tr╞░ß╗¥ng c├ó╠üp ba trß╗ƒ th├ánh ─æi├¬╠ëm bu╠Çng pha╠üt virus th├óy ma. Ca╠üc hß╗ìc sinh mß║»c kß║╣t phß║úi n├┤╠â l╞░╠úc tho├ít ra ΓÇô hoß║╖c biß║┐n th├ánh mß╗Öt trong nhß╗»ng ng╞░ß╗¥i nhiß╗àm bß╗çnh hung t╞í╠ún.',100,6,'2023-10-30 07:38:11','2023-10-30 07:38:11'),(10,'image/faxRLBsxlozi8zmZzS8MEkOvFAqVpEDu3tNmp2tk.jpg','https://www.youtube.com/embed/RQpGmPwABds','Chuyß║┐n t├áu sinh tß╗¡','Khi ─æß║íi dß╗ïch x├íc sß╗æng b├╣ng ph├ít khß║»p cß║ú n╞░ß╗¢c, mß╗Öt ng╞░ß╗¥i cha c├╣ng con g├íi phß║úi trß║úi qua chuyß║┐n t├áu kinh ho├áng ─æß╗â tß╗¢i th├ánh phß╗æ duy nhß║Ñt c├▓n an to├án',100,6,'2023-10-30 07:38:52','2023-10-30 07:38:52'),(11,'image/IgZyqo0oglqWVIF9pwEKiMQtvB8ULtpemdgRgcyc.jpg','https://www.youtube.com/embed/ZG7CrlsTjHo','Chung c╞░ c├│ ─æß╗Öc','C╞░ d├ón cß╗ºa mß╗Öt t├▓a nh├á cao tß║ºng chiß║┐n ─æß║Ñu ─æß╗â sinh tß╗ôn khi m├┤╠út c─ân bß╗çnh chß║┐t ng╞░ß╗¥i b├╣ng ph├ít v├á biß║┐n ng╞░ß╗¥i bß╗ï nhiß╗àm bß╗çnh th├ánh th├óy ma kh├ít m├íu',100,5,'2023-10-30 07:39:45','2023-10-30 07:39:45'),(12,'image/qatE8dslO0aX04FUuIRSP0XcntzUqjwPsDI02X8n.jpg','https://www.youtube.com/embed/C2NJI0P1UEo','Bß║ún ├ín tß╗½ ─æß╗ïa ngß╗Ñc','C├íc thß║┐ lß╗▒c si├¬u nhi├¬n ─æ╞░a ra lß╗¥i kß║┐t t├┤╠úi ─æß║½m m├íu, ─æa╠Çy con ng╞░╞í╠Çi xu├┤╠üng ─æß╗ïa ngß╗Ñc v├á n├óng ─æ╞í╠â nh├│m t├┤n gi├ío ─æ╞░ß╗úc th├ánh lß║¡p dß╗▒a tr├¬n ├╜ t╞░ß╗ƒng c├┤ng l├╜ cß╗ºa thß║ºn th├ính.',100,5,'2023-10-30 07:40:44','2023-10-30 07:40:44'),(13,'image/JYV60y0x5sbtdeQAwRlhTcNmaMZOKNm82dxAj1E5.jpg','https://www.youtube.com/embed/_7n0OjlElC4','Tr├╣m, cß╗¢m v├á ├íc quß╗╖','Sß║╡n s├áng l├ám t├ó╠üt ca╠ë ─æß╗â bß║»t t├¬n sa╠üt nh├ón h├áng loß║ít kh├│ ─æoa╠ün, tay tr├╣m tß╗Öi phß║ím mu├┤╠ün b├ío th├╣ b├ó╠üt ─æ─â╠üc di╠â pha╠ëi h╞í╠úp ta╠üc v╞í╠üi m├┤╠út vi├¬n cß║únh s├ít gan l├¼.',100,5,'2023-10-30 07:41:25','2023-10-30 07:41:25'),(14,'image/V4EcNGlRUXoMewzLj3EBFmh5kX5iRIDKgsmPLiuY.jpg','https://www.youtube.com/embed/T2gM6_UN6ss','Nghß╗ü si├¬u kh├│','─Éß╗Öi ph├▓ng chß╗æng ma t├║y mua lß║íi nh├á h├áng gß║ºn s├áo huyß╗çt cß╗ºa mß╗Öt b─âng nh├│m. Hß╗ì b├ín ─æß╗ô ─ân ─æß╗â che mß║»t, nh╞░ng kh├┤ng ngß╗¥ m├│n ─ân ─æ├│ lß║íi trß╗ƒ th├ánh mß╗Öt th╞░╞íng hiß╗çu g├á si├¬u nß╗òi',100,5,'2023-10-30 07:42:05','2023-10-30 07:42:05'),(15,'image/JCJqk8EwEUerQ99alq09eYMFyFCWZEmD9FugmfED.jpg','https://www.youtube.com/embed/odb5t4i3EKs','Nghß╗ü si├¬u dß╗à','Vi├¬n cß║únh s├ít vß╗ü h╞░u v├á mß╗Öt nh├│m ng╞░ß╗¥i lß║¡p dß╗ï trong khu phß╗æ d├╣ng mß╗Öt qu├ín ─ân l├ám b├¼nh phong ─æß╗â truy bß║»t t├¬n tr├╣m tß╗Öi phß║ím kh├│ ─æo├ín.',100,3,'2023-10-30 07:43:20','2023-10-30 07:43:20'),(16,'image/x4AAXR0YS1RMtjncmydsiLDTbgUXrXZnLxf3uIHk.jpg','https://www.youtube.com/embed/YXqD2pXkIA4','Em ch╞░a 18','Kh├┤ng muß╗æn bß╗ï ph├íp luß║¡t sß╗¥ g├íy, anh ch├áng huß║Ñn luyß╗çn vi├¬n yoga l─âng nh─âng ─æß╗ông ├╜ giß║ú l├ám bß║ín trai cß╗ºa nß╗» sinh cß║Ñp 3 ─æß║ºy nhiß╗çt huyß║┐t ─æang muß╗æn chß╗ìc tß╗⌐c bß╗ô c┼⌐.',100,3,'2023-10-30 07:44:09','2023-10-30 07:44:09'),(17,'image/OzyiB7ezQ68FQbi4w6imp1vI4hbXgHLZf3GqdusK.jpg','https://www.youtube.com/embed/Ow_VAd2Eirs','Hß╗ôn papa da con g├íi','Nß╗ùi mß║Ñt m├ít bi thß║úm l├ám rß║ín nß╗⌐t mß╗æi quan hß╗ç giß╗»a c├┤ con g├íi mß║ính mß║╜ v├á ├┤ng bß╗æ ph├│ng kho├íng, cho ─æß║┐n khi mß╗Öt sß╗▒ kiß╗çn kß╗│ diß╗çu mang ─æß║┐n cho mß╗ùi ng╞░ß╗¥i mß╗Öt g├│c nh├¼n ho├án to├án mß╗¢i.',100,3,'2023-10-30 07:44:47','2023-10-30 07:44:47'),(18,'image/sVaEN44DR8kZcwLBtGcmA17SCy6mZQ0j2lXWu9RB.jpg','https://www.youtube.com/embed/sowSESNw5e0','Tyler Rake: Nhiß╗çm vß╗Ñ giß║úi cß╗⌐u 2','Sau khi su├╜t chß║┐t, ─æß║╖c c├┤ng ╞░u t├║ Tyler Rake nhß║¡n mß╗Öt nhiß╗çm vß╗Ñ nguy hiß╗âm kh├íc: giß║úi cß╗⌐u gia ─æ├¼nh ─æang bß╗ï giam giß╗» cß╗ºa tay x├ú hß╗Öi ─æen t├án nhß║½n.',100,6,'2023-10-30 07:45:25','2023-10-30 07:45:25'),(19,'image/e4VlGwUuKkVNx3CSYvK5aRmkd2DwMUfXizu65tb7.jpg','https://www.youtube.com/embed/fPyG-FPGJRU','Si├¬u lß╗½a gß║╖p si├¬u lß║ºy','Khi kß║╗ lß╗½a ─æß║úo nß╗ú nß║ºn chß╗ông chß║Ñt t├¼nh cß╗¥ gß║╖p kß║╗ lß╗½a ─æß║úo l├úo l├áng, mß╗æi ├íc cß║úm giß╗»a hß╗ì nhanh ch├│ng biß║┐n th├ánh m├án hß╗úp t├íc kh├┤ng ngß╗¥ tß╗¢i ─æß╗â thß╗▒c hiß╗çn phi vß╗Ñ lß╗½a ─æß║úo si├¬u lß╗¢n',100,3,'2023-10-30 07:48:57','2023-10-30 07:48:57'),(20,'image/exfawfgA0PCNRBmMfoNp4Z2IPA5LxDfHAGRayOdN.jpg','https://www.youtube.com/embed/2_wi5J9iDlg','Hß║ºu V╞░╞íng','Mß╗Öt ch├║ khß╗ë chuy├¬n d├╣ng gß║¡y ─æß╗ông h├ánh c├╣ng mß╗Öt c├┤ b├⌐ tr├¬n h├ánh tr├¼nh t├¼m kiß║┐m sß╗▒ bß║Ñt tß╗¡, chiß║┐n ─æß║Ñu vß╗¢i quß╗╖, rß╗ông, thß║ºn c┼⌐ng nh╞░ ch├¡nh bß║ún ng├ú cß╗ºa ch├║.',100,4,'2023-10-30 07:49:33','2023-10-30 07:49:33'),(21,'image/wGcGjArsQ0v7jmr1ONgswo0LkdRhUYOHUBkC4XBg.jpg','https://www.youtube.com/embed/HbBEKpKObKQ','MixiVLOG#24','Chuyß║┐n ─æi Ph├║ Quß╗æc c├╣ng anh em Refund Gaming, trß║úi nghiß╗çm khu vui ch╞íi cß╗ºa Vinpearl.',100,2,'2023-10-30 07:50:25','2023-10-30 07:50:25'),(22,'image/D4KOSltQbwcwHXpxsp8JjbsjBHrqqXq0OgBE43BD.jpg','https://www.youtube.com/embed/EHNmr6OVvWI','MixiVLOG#16','Trß║úi nghiß╗çm du lß╗ïch Cao Bß║▒ng 2 ng├áy c├╣ng anh em Refund Gaming.',100,2,'2023-10-30 07:51:32','2023-10-30 07:51:32'),(23,'image/VzxYB9DpJ89SnVUk5JpWXywz91Wd0cg8wRUcQrnw.jpg','https://www.youtube.com/embed/Rgazx347CwQ','MixiVLOG#21','Kh├ím ph├í Miß╗ün T├óy s├┤ng n╞░ß╗¢c c├╣ng anh em Refund, ch╞íi g├¼ c┼⌐ng vui ─ân g├¼ c┼⌐ng ngon.',100,2,'2023-10-30 07:52:08','2023-10-30 07:52:08'),(24,'image/L5qfdZMUgWmGfgmKC51tlh17uP9M9oLQcFGc0E5F.jpg','https://www.youtube.com/embed/2mxL-HcRRv4','MixiVLOG#22','Thu├¬ du thuyß╗ün si├¬u to khß╗òng lß╗ô kh├ím ph├í Vß╗ïnh Hß║í Long c├╣ng anh em huynh ─æß╗ç.',100,2,'2023-10-30 07:52:34','2023-10-30 07:52:34'),(25,'image/XIVGMsSnHPnmDgi2cQfb4n5Mx1Tx3mIIlHG64DQ8.jpg','https://www.youtube.com/embed/Mrf-t3qK72k','MixiVLOG#14','Bao trß╗ìn du thuyß╗ün Hß║í Long nghß╗ë d╞░ß╗íng 3 ng├áy c├╣ng team Mixi.',100,2,'2023-10-30 07:53:14','2023-10-30 07:53:14'),(26,'image/4ytMyCYvZXaFpdWfxy36LX0ZXTGDhMVLcISxOm0b.png','https://www.youtube.com/embed/yHch1Y5IKbI','2 Ng├áy 1 ─É├¬m M├╣a 2','Tß║¡p 36: B Ray bß╗ï D╞░╞íng L├óm phong ß║Ñn, BigDaddy ho├í n├áng ti├¬n c├í mß║»c cß║ín',100,4,'2023-10-30 07:54:51','2023-10-30 07:54:51'),(27,'image/BPV2htWbEM19rWkBkK1KHLWLKHOHv8rT9gBk8KPj.jpg','https://www.youtube.com/embed/pmN3kieZKak','M├╣a H├¿ Rß╗▒c Rß╗í','Full 13 Tß║¡p || FAPtv Phim Tuß╗òi Teen',100,4,'2023-10-30 07:55:43','2023-10-30 07:55:43'),(28,'image/ClSrDY9T3paA9VbnQaxrvqw8TETO2y6NyUQ2706d.jpg','https://www.youtube.com/embed/4_X1wesAf3g','Em Cß╗ºa Anh ─Éß╗½ng Cß╗ºa Ai','Tß║¡p 1 - Phim T├¼nh Cß║úm | Hi Team - FAPtv',100,4,'2023-10-30 07:56:23','2023-10-30 07:56:23'),(29,'image/r7LB3kcUFE3yRByLsEyS9EGKBjEhDrvfnmTrmG0r.jpg','https://www.youtube.com/embed/5YnY9KM5doE','VI C├ü TIß╗ÇN TRUYß╗åN','FULL | Qu├ích Ngß╗ìc Tuy├¬n, Khß║ú Nh╞░, Ch├¡ T├ái, Kiß╗üu Minh Tuß║Ñn, Hß╗⌐a Minh ─Éß║ít, Th├íi V┼⌐',100,4,'2023-10-30 07:57:02','2023-10-30 07:57:02');
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_10_15_130822_create_categories_table',1),(6,'2023_10_18_070325_create_films_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'myapptoken','9bdb0c8cbe78c80a0e13aa846b5ae6b107ded5b864e009104aff12ecdcb4c755','[\"*\"]','2023-10-29 21:01:21',NULL,'2023-10-29 21:00:55','2023-10-29 21:01:21'),(9,'App\\Models\\User',2,'myapptoken','1187652d49cd8a1735f93bcbbb4c11eb2740c92ffeb8621534f1298677f7d9d5','[\"*\"]','2023-10-30 07:57:02',NULL,'2023-10-30 04:19:24','2023-10-30 07:57:02'),(10,'App\\Models\\User',2,'myapptoken','34dd05482248c372a1ca09d6175db2348b0bc10241e99af13feda8c3374a8ee7','[\"*\"]','2023-10-30 18:23:12',NULL,'2023-10-30 18:22:48','2023-10-30 18:23:12');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'SptJerry','duylinhvnu1@gmail.com',NULL,'$2y$10$GBavcztkR16lcVu/Cghple9CcKPB16k3PQgynZnfOseE/Avl2YmsK',NULL,'2023-10-29 21:00:55','2023-10-29 21:00:55'),(2,'SptJerry','duylinhvnu@gmail.com',NULL,'$2y$10$7syJRyt2.uR/Djsg3aJhK.S5UrzaXQKl1V8w6UFbYW70KE9SMeBMC',NULL,'2023-10-29 21:18:04','2023-10-29 21:18:04');
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

-- Dump completed on 2023-10-31  9:54:21
