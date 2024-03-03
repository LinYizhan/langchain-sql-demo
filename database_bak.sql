-- MySQL dump 10.13  Distrib 5.7.15, for osx10.11 (x86_64)
--
-- Host: localhost    Database: drug_mini
-- ------------------------------------------------------
-- Server version	5.7.15-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `drug_applicant_info`
--

DROP TABLE IF EXISTS `drug_applicant_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_applicant_info` (
  `id` bigint(63) NOT NULL AUTO_INCREMENT,
  `durg_uuid` varchar(63) NOT NULL COMMENT '药物唯一标识',
  `applicant_name` varchar(1024) DEFAULT NULL COMMENT '申请人名称',
  `contact_person_name` varchar(1024) DEFAULT NULL COMMENT '联系人姓名',
  `contact_landline` varchar(255) DEFAULT NULL COMMENT '联系人座机',
  `contact_phone` varchar(255) DEFAULT NULL COMMENT '联系人手机',
  `contact_email` varchar(255) DEFAULT NULL COMMENT '联系人邮箱',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uuid` (`durg_uuid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3857 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='药物申请人信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drug_base_info`
--

DROP TABLE IF EXISTS `drug_base_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_base_info` (
  `id` bigint(63) NOT NULL AUTO_INCREMENT,
  `uid` varchar(63) NOT NULL,
  `license_num` varchar(63) NOT NULL COMMENT '登记号',
  `experiment_status` int(63) NOT NULL DEFAULT '-1' COMMENT '实验状态 1-进行中 2-已完成',
  `publicity_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '公示时间',
  `drug_name` varchar(255) NOT NULL COMMENT '药物名称',
  `durg_type` varchar(255) NOT NULL COMMENT '药物类型',
  `durg_indications` varchar(2048) DEFAULT NULL COMMENT '适应症',
  `professional_topic` varchar(255) DEFAULT NULL COMMENT '专业题目',
  `popular_topic` varchar(255) DEFAULT NULL COMMENT '通俗题目',
  `target_participants_num` int(11) DEFAULT NULL COMMENT '目标入组人数',
  `target_participants_num_str` varchar(255) DEFAULT NULL,
  `video_url` varchar(1024) DEFAULT NULL COMMENT '视频',
  `is_push` int(16) NOT NULL DEFAULT '0' COMMENT '是否推荐 0-否 1-推荐',
  `is_deleted` int(16) NOT NULL COMMENT '是否删除 0-未删除 1-已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `min_experiment_age` double(11,2) DEFAULT NULL COMMENT '试验最小年龄',
  `max_experiment_age` double(11,2) DEFAULT NULL COMMENT '试验最大年龄',
  `experiment_gender` int(11) DEFAULT NULL COMMENT '试验性别 0-男女 1-男 2-女',
  `experiment_staging` varchar(255) DEFAULT '' COMMENT '试验分期',
  `order` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uuid_time` (`uid`,`publicity_time`) USING BTREE,
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3854 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='药物基本信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drug_city_recommend`
--

DROP TABLE IF EXISTS `drug_city_recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_city_recommend` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `drug_uid` varchar(63) NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drug_disease_type_list`
--

DROP TABLE IF EXISTS `drug_disease_type_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_disease_type_list` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `drug_uuid` varchar(256) NOT NULL,
  `diseace_type` varchar(768) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_type` (`diseace_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4406 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drug_experiment_standard`
--

DROP TABLE IF EXISTS `drug_experiment_standard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_experiment_standard` (
  `id` bigint(63) NOT NULL AUTO_INCREMENT,
  `drug_uuid` varchar(63) NOT NULL COMMENT '药物唯一标识',
  `standard_type` int(11) NOT NULL COMMENT '标准类型 1-入选 2-排除',
  `standard_info` varchar(4096) DEFAULT NULL COMMENT '标准信息',
  `order` int(255) NOT NULL COMMENT '顺序',
  `is_deleted` int(255) NOT NULL COMMENT '是否删除 0-未删除 1-已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_uuid_type` (`drug_uuid`,`standard_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=94261 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='药物临床试验标准信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drug_reseacher_agency_info`
--

DROP TABLE IF EXISTS `drug_reseacher_agency_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_reseacher_agency_info` (
  `id` bigint(63) NOT NULL AUTO_INCREMENT,
  `drug_uuid` varchar(63) NOT NULL COMMENT '药物唯一标识',
  `agency_name` varchar(255) DEFAULT NULL COMMENT '机构名称',
  `agency_researcher` varchar(255) DEFAULT '' COMMENT '研究者',
  `agency_country` varchar(255) DEFAULT '' COMMENT '国家',
  `agency_province` varchar(255) DEFAULT NULL COMMENT '省',
  `agency_city` varchar(255) DEFAULT '' COMMENT '城市',
  `is_deleted` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '顺序',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `udpate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_uuid` (`drug_uuid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63440 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='药物研究机构信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drug_user_collect_log`
--

DROP TABLE IF EXISTS `drug_user_collect_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_user_collect_log` (
  `id` bigint(63) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(100) NOT NULL DEFAULT '' COMMENT '用户openId',
  `drug_uid` varchar(63) NOT NULL COMMENT '药物唯一标识',
  `is_deleted` int(11) NOT NULL COMMENT '状态 0-已收藏 1-取消',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_openId_uid` (`open_id`,`drug_uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='收藏记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `durg_experiment_base_info`
--

DROP TABLE IF EXISTS `durg_experiment_base_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `durg_experiment_base_info` (
  `id` bigint(63) NOT NULL AUTO_INCREMENT,
  `drug_uuid` varchar(63) NOT NULL COMMENT '药物唯一标识',
  `experiment_purposes` varchar(2048) DEFAULT '' COMMENT '试验目的',
  `experiment_type` varchar(255) DEFAULT '' COMMENT '试验分类',
  `experiment_staging` varchar(255) DEFAULT '' COMMENT '试验分期',
  `experiment_age` varchar(255) DEFAULT '' COMMENT '年龄',
  `experiment_gender` varchar(255) DEFAULT NULL COMMENT '性别',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uuid` (`drug_uuid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3854 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='药物临床实践基本信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `durg_major_researcher_info`
--

DROP TABLE IF EXISTS `durg_major_researcher_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `durg_major_researcher_info` (
  `id` bigint(63) NOT NULL AUTO_INCREMENT,
  `drug_uuid` varchar(63) DEFAULT NULL,
  `researcher_name` varchar(255) DEFAULT '' COMMENT '研究者姓名',
  `researcher_degree` varchar(255) DEFAULT '' COMMENT '研究者学位',
  `researcher_title` varchar(255) DEFAULT '' COMMENT '研究者职称',
  `researcher_phone` varchar(255) DEFAULT '' COMMENT '研究者电话',
  `researcher_email` varchar(255) DEFAULT '' COMMENT '研究者邮箱',
  `researcher_address` varchar(255) DEFAULT '' COMMENT '研究者邮政地址',
  `postcode` varchar(255) DEFAULT '' COMMENT '邮编',
  `company_name` varchar(255) DEFAULT '' COMMENT '单位名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_uuid` (`drug_uuid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3854 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='药物主要研究者信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manage_user_info`
--

DROP TABLE IF EXISTS `manage_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manage_user_info` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `āuthority` varchar(255) NOT NULL COMMENT '权限',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `upadte_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_username` (`user_name`) USING BTREE
) /*!50100 STORAGE MEMORY */ ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理后台-用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `record_wx_token`
--

DROP TABLE IF EXISTS `record_wx_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_wx_token` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '类型 1-小程序token',
  `token` varchar(2048) NOT NULL,
  `expire_time` datetime NOT NULL COMMENT '失效时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='微信相关token记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'open_id',
  `skey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'skey',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_visit_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后登录时间',
  `session_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'session_key',
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `province` varchar(255) DEFAULT NULL COMMENT '省',
  `country` varchar(255) DEFAULT NULL COMMENT '国',
  `avatar_url` varchar(255) DEFAULT NULL COMMENT '头像',
  `gender` tinyint(11) DEFAULT NULL COMMENT '性别',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '网名',
  PRIMARY KEY (`open_id`) USING BTREE,
  KEY `idx_skey` (`skey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_applicant_log`
--

DROP TABLE IF EXISTS `user_applicant_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_applicant_log` (
  `id` bigint(63) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(63) NOT NULL,
  `drug_uid` varchar(63) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `applicant_type` int(11) NOT NULL DEFAULT '0' COMMENT '报名方式 1-自己 2-帮人报名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_uuid` (`drug_uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='报名记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_base_info`
--

DROP TABLE IF EXISTS `user_base_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_base_info` (
  `id` bigint(63) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(100) NOT NULL COMMENT 'user表openId',
  `name` varchar(255) DEFAULT '',
  `sex` int(11) NOT NULL DEFAULT '0' COMMENT '性别 0-男 1-女',
  `id_card` varchar(255) DEFAULT '' COMMENT '身份证号码',
  `mobile` varchar(255) DEFAULT '' COMMENT '手机号',
  `height` int(11) DEFAULT NULL COMMENT '身高(cm)',
  `weight` int(11) DEFAULT NULL COMMENT '体重(kg)',
  `disease` varchar(255) DEFAULT '' COMMENT '所患疾病',
  `past_medical_history` varchar(255) DEFAULT '' COMMENT '既往病史',
  `drugs_focus` varchar(255) DEFAULT '' COMMENT '关注药物',
  `medical_record_url` longtext COMMENT '病历cos地址',
  `match_status` int(11) DEFAULT NULL COMMENT '匹配结果 0-匹配中 1-匹配成功',
  `is_deleted` int(11) DEFAULT NULL COMMENT '是否删除 0-未删除 1-已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `birthday` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_msg_log`
--

DROP TABLE IF EXISTS `user_msg_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_msg_log` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(63) CHARACTER SET utf8mb4 NOT NULL,
  `durg_list` longtext COLLATE utf8mb4_german2_ci,
  `is_deleted` int(11) NOT NULL DEFAULT '0',
  `msg_template` varchar(1024) COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_openId` (`open_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci COMMENT='用户消息通知列表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-03 17:53:09
