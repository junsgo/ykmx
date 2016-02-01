/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.24 : Database - ykmx
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `go_member_white` */

CREATE TABLE `go_member_white` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `shopid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `time` datetime NOT NULL COMMENT '添加时间',
  `add_user` varchar(20) NOT NULL DEFAULT '' COMMENT '操作人',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除0：正常 1：删除',
  PRIMARY KEY (`id`),
  KEY `idx_shopid` (`shopid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `go_white_list` */

CREATE TABLE `go_white_list` (
  `int` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `add_user` varchar(20) NOT NULL DEFAULT '' COMMENT '添加人',
  `dateline` datetime NOT NULL COMMENT '操作时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0：正常 1：删除',
  PRIMARY KEY (`int`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
