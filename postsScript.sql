CREATE DATABASE  IF NOT EXISTS `posts` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `posts`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: posts
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `comments` varchar(256) NOT NULL,
  `post_id` int NOT NULL,
  `is_active` bit(1) NOT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_POSTS_POST_ID` (`post_id`),
  CONSTRAINT `FK_POSTS_POST_ID` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Nice Article',1,_binary '',_binary '\0',1,'2022-03-08 20:02:21',1,'2022-03-08 21:30:09'),(2,'Nice Post',1,_binary '\0',_binary '',1,'2022-03-08 20:02:48',3,'2022-03-08 23:40:25'),(3,'Awesome Post',2,_binary '\0',_binary '',1,'2022-03-08 20:02:58',1,'2022-03-08 21:37:22');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `post_title` varchar(125) DEFAULT NULL,
  `post_description` varchar(256) DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'HP Tours and Travels','All about tours and travels',_binary '',_binary '\0',1,'2022-03-08 20:01:21',NULL,NULL),(2,'VP Tours and Travels','All about tours and travels',_binary '\0',_binary '',1,'2022-03-08 20:02:29',1,'2022-03-08 21:37:22'),(3,'CP Tours and Travels','All about tours and travels',_binary '',_binary '\0',1,'2022-03-08 20:13:45',NULL,NULL),(4,'HHP Tours and Travels','All about tours and travels',_binary '',_binary '\0',1,'2022-03-08 20:15:32',1,'2022-03-08 21:01:10');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_manager`
--

DROP TABLE IF EXISTS `token_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_manager` (
  `token_id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(256) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `expired` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`token_id`),
  KEY `FK_USERS_USER_ID` (`user_id`),
  CONSTRAINT `FK_USERS_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_manager`
--

LOCK TABLES `token_manager` WRITE;
/*!40000 ALTER TABLE `token_manager` DISABLE KEYS */;
INSERT INTO `token_manager` VALUES (1,'6a286a9f-78d5-445c-9fed-b3ab92da8114',3,_binary '',84200,3,'2022-03-08 22:29:05'),(2,'88270e1b-96d4-4122-b19d-5fd6f15bc213',3,_binary '',84200,3,'2022-03-08 22:29:32'),(3,'fcaaa63c-dd0d-4fb9-b48e-2cd512d98b90',3,_binary '',84200,3,'2022-03-08 23:48:05'),(4,'54d1b7c9-4c10-4bc0-92f5-8a125608d6fe',3,_binary '',84200,3,'2022-03-08 23:49:14');
/*!40000 ALTER TABLE `token_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `user_loginname` varchar(10) DEFAULT NULL,
  `user_password` varchar(256) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Hardik Patel','HP','HP@123',_binary '',_binary '\0',1,'2022-03-08 14:37:27',NULL,NULL),(2,'hardik shah','HS','HJ@123',_binary '',_binary '\0',NULL,'2022-03-08 22:03:07',2,'2022-03-08 22:11:07'),(3,'hardik jaiswal','HJ','HJ@12',_binary '',_binary '\0',NULL,'2022-03-08 22:11:21',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'posts'
--
/*!50003 DROP PROCEDURE IF EXISTS `usp_AuthenticateLogin_v1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_AuthenticateLogin_v1`(
IN userCode int,
IN userToken varchar(256)
)
BEGIN
	If exists (select 1 from token_manager where user_id = userCode and token = userToken and is_active = 1)
    then 
		select usr.user_id, usr.user_name, usr.user_loginname loginName, tkm.token from users usr 
        left join token_manager tkm on tkm.user_id = usr.user_id
        where usr.user_id = 3 and tkm.is_active = 1 and tkm.token = userToken;
    else 
		select 'Please Login again user is unthorised!!' validation_message;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_getCommentDetails_v1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_getCommentDetails_v1`(
IN postId int
)
BEGIN
	If exists (select 1 from posts where post_id = postId)
    then
		SELECT comment_id, comments, created_by comment_by, DATE_FORMAT(created_datetime, '%m-%d-%Y %H:%i') comment_datetime from comments where post_id = postId and is_delete = 0 and is_active = 1; 
    end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_getposts_details_v1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_getposts_details_v1`()
BEGIN
	select pos.post_id, 
    pos.post_title,
    pos.post_description, 
    DATE_FORMAT(pos.created_datetime, '%m-%d-%Y %H:%i') posted_datetime,
    posusr.user_name posted_by,
    (select JSON_ARRAYAGG(
			  JSON_OBJECT(
				'comment_id', com.comment_id,
				'comments', com.comments,
                'commented_datetime', DATE_FORMAT(com.created_datetime, '%m-%d-%Y %H:%i'),
                'commented_by', usr.user_name
			  )
			)
	FROM comments com
    left join users usr on usr.user_id = com.created_by
    where post_id = pos.post_id and com.is_active = 1 and com.is_delete = 0) comments from posts pos
    left join users posusr on posusr.user_id = pos.created_by
    where pos.is_active = 1 and pos.is_delete = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_postsDetails_upsert_v1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_postsDetails_upsert_v1`(
IN postId int,
IN postTitle varchar(125),
IN postDescription varchar(256),
IN createdBy int
)
BEGIN
	DECLARE current_datetime datetime;
    set current_datetime = NOW();
    if postId = 0
    then
		insert into posts
        (
        post_title,
        post_description,
        is_active,
        is_delete,
        created_by,
        created_datetime
        )
        VALUE
        (
        postTitle,
        postDescription,
        1,
        0,
        createdBy,
        current_datetime
        );
    else
		if exists (select 1 from posts where post_id = postId) 
		Then
			Update posts
			set post_title = postTitle,
			post_description = postDescription,
			modified_by = createdBy,
			modified_datetime = current_datetime
			where post_id = postId;
		else
			select 'Post id is not correct Please check once!!' validation_message;
		end if;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_removeComment_v1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_removeComment_v1`(
IN postId int,
IN commentId int,
IN userCode int
)
BEGIN
	If exists (select 1 from comments where post_id = postId and comment_id = commentId)
    then 
		update comments
        set is_delete = 1,
        is_active = 0,
        modified_by = userCode,
        modified_datetime = now()
        where post_id = postId and comment_id = commentId;
	else
		select 'Comment/Post is not exists. Please refresh & check!!' validation_message;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_removePosts_v1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_removePosts_v1`(
IN postId int,
IN userCode int
)
BEGIN
	if exists (select 1 from posts where post_id = postId)
    then 
		update posts
        set is_active = 0,
        is_delete = 1,
        modified_by = userCode,
        modified_datetime = now()
        where post_id = postId;

        if exists (select 1 from comments where post_id = postId)
        then 
			update comments
            set is_active = 0,
            is_delete = 1,
            modified_by = userCode,
			modified_datetime = now()
            where post_id = postId;
        end if;
	else 
		select 'Oops Something went wrong. Please Refresh & check!!';
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_updateComment_v1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_updateComment_v1`(
IN postId int,
IN commentId int,
IN comments varchar(256),
IN userCode int
)
BEGIN
	If exists (select 1 from comments where post_id = postId and comment_id = commentId)
    then 
		update comments
        set 
        comments = comments,
        modified_by = userCode,
        modified_datetime = now()
        where post_id = postId and comment_id = commentId;
	else
		select 'Opps Something went wrong. Please Refresh & check!!' validation_message;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_upsertUserDetails_v1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_upsertUserDetails_v1`(
IN userCode int,
IN userName varchar(64),
IN loginName varchar(20),
IN userPassword varchar(20),
IN isActive bit
)
BEGIN
	if userCode = 0
    then 
		insert into users 
        (
		user_name,
        user_loginname,
        user_password,
        is_active,
        is_delete,
        created_datetime
        ) values
        (
        userName,
        loginName,
        userPassword,
        isActive,
        0,
        now()
        );
    else
		if exists (select 1 from users where user_id = userCode)
        then 
			update users
            set user_name = userName,
            user_loginname = loginName,
            user_password = userPassword,
            is_active = isActive,
            modified_by = userCode,
            modified_Datetime = now()
            where user_id = userCode;
		else 
			select 'Oops Something went wrong. Please Refresh & check!!';
        end if;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_UserAuthentication_v1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_UserAuthentication_v1`(
IN loginName varchar(20),
IN userPassword varchar(20),
IN token varchar(256)
)
BEGIN
	DECLARE userCode int;
    set userCode = (select user_id from users where user_loginname = loginName);
	If exists (select 1 from users where user_loginname = loginName and user_password = userPassword)
    then
		insert into token_manager
        (
        token,
        user_id,
        is_active,
        expired,
        created_by,
        created_datetime
        )
        values
        (
        token,
        userCode,
        1,
        84200,
        userCode,
        now()
        );
	else
		select 'Oops Something went wrong while login. Please Refresh & check!!' validation_message;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-08 23:57:22
