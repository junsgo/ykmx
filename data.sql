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
/*Table structure for table `go_ad_area` */

CREATE TABLE `go_ad_area` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `width` smallint(6) unsigned DEFAULT NULL,
  `height` smallint(6) unsigned DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `checked` tinyint(1) DEFAULT '0' COMMENT '1表示通过',
  PRIMARY KEY (`id`),
  KEY `checked` (`checked`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='广告位';

/*Data for the table `go_ad_area` */

insert  into `go_ad_area`(`id`,`title`,`width`,`height`,`des`,`checked`) values (2,'&lt;div&gt;453453451&lt;/div&gt;',750,60,'sd',1),(3,'546',456,456,'456',1);

/*Table structure for table `go_ad_data` */

CREATE TABLE `go_ad_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` char(10) DEFAULT NULL COMMENT 'code,text,img',
  `content` text,
  `checked` tinyint(1) DEFAULT '0' COMMENT '1表示通过',
  `addtime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告';

/*Data for the table `go_ad_data` */

/*Table structure for table `go_admin` */

CREATE TABLE `go_admin` (
  `uid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `mid` tinyint(3) unsigned NOT NULL,
  `username` char(15) NOT NULL,
  `userpass` char(32) NOT NULL,
  `useremail` varchar(100) DEFAULT NULL,
  `addtime` int(10) unsigned DEFAULT NULL,
  `logintime` int(10) unsigned DEFAULT NULL,
  `loginip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

/*Data for the table `go_admin` */

insert  into `go_admin`(`uid`,`mid`,`username`,`userpass`,`useremail`,`addtime`,`logintime`,`loginip`) values (1,0,'admin','14e1b600b1fd579f47433b88e8d85291',NULL,NULL,1454386739,'127.0.0.1');

/*Table structure for table `go_article` */

CREATE TABLE `go_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `cateid` char(30) NOT NULL COMMENT '文章父ID',
  `author` char(20) DEFAULT NULL,
  `title` char(100) NOT NULL COMMENT '标题',
  `title_style` varchar(100) DEFAULT NULL,
  `thumb` varchar(3) DEFAULT NULL,
  `picarr` text,
  `keywords` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `content` mediumtext COMMENT '内容',
  `hit` int(10) unsigned DEFAULT '0',
  `order` tinyint(3) unsigned DEFAULT NULL,
  `posttime` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `cateid` (`cateid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `go_article` */

insert  into `go_article`(`id`,`cateid`,`author`,`title`,`title_style`,`thumb`,`picarr`,`keywords`,`description`,`content`,`hit`,`order`,`posttime`) values (1,'2','','了解云购','','','a:2:{i:0;s:33:\"photo/20130902/41484375056924.jpg\";i:1;s:33:\"photo/20130902/26578125056924.jpg\";}','','','<p>	</p><p>345</p>',1,1,1375862513),(2,'2','','常见问题','','','a:0:{}','','','<p>	</p><p>567567234234</p>',0,3,1375862591),(3,'2','','服务协议','','','a:0:{}','','','<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;	9 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 56 &nbsp; 56</p>',0,0,1375862644),(4,'3','','购保障体系','','','a:0:{}','','','<p>	</p><p>欢迎使用云购系统!56456</p>',0,0,1375862690),(5,'3',NULL,'正品保障',NULL,NULL,'a:0:{}',NULL,NULL,'',0,0,1375862702),(6,'3',NULL,'安全支付',NULL,NULL,'a:0:{}',NULL,NULL,'',0,0,1375862712),(7,'4',NULL,'商品配送',NULL,NULL,'a:0:{}',NULL,NULL,'',0,0,1375862725),(8,'4',NULL,'配送费用',NULL,NULL,'a:0:{}',NULL,NULL,'',0,0,1375862737),(9,'4',NULL,'商品验货与签收',NULL,NULL,'a:0:{}',NULL,NULL,'',0,0,1375862747),(10,'4',NULL,'长时间未收到商品',NULL,'','a:0:{}',NULL,NULL,'',0,0,1375862760),(12,'3','','隐私声明','','','a:0:{}','','','<p>	</p><p>欢迎使用云购系统</p><p>隐私声明</p>',71,1,1378451819),(13,'16','疯狂的屠夫','测试一下','','','a:0:{}','测试','测试','<p>测试</p>',82,1,1417758811),(14,'1','5115','1512','','pho','a:0:{}','2','','<p>欢迎使用云购系统!</p>',23,1,1417767065),(15,'1','5115','1512','','pho','a:0:{}','2','','<p>欢迎使用云购系统!</p>',23,1,1417767065);

/*Table structure for table `go_brand` */

CREATE TABLE `go_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` varchar(255) DEFAULT NULL COMMENT '所属栏目ID',
  `status` char(1) DEFAULT 'Y' COMMENT '显示隐藏',
  `name` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `order` (`order`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='品牌表';

/*Data for the table `go_brand` */

insert  into `go_brand`(`id`,`cateid`,`status`,`name`,`thumb`,`url`,`order`) values (1,'5,13,6','Y','洛基亚',NULL,NULL,1),(2,'13,6','Y','苹果',NULL,NULL,2),(3,'5,6','Y','oppo',NULL,NULL,1),(4,'5','Y','华为',NULL,NULL,1);

/*Table structure for table `go_caches` */

CREATE TABLE `go_caches` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `go_caches` */

insert  into `go_caches`(`id`,`key`,`value`) values (1,'member_name_key','admin,administrator,云购官方'),(2,'shopcodes_table','1'),(3,'goods_count_num','1406'),(4,'template_mobile_reg','你好,你的注册验证码是:000000 '),(5,'template_mobile_shop','恭喜你云购用户！您在1元云购网够买的商品已中奖,获得的云购码为：00000000 请登陆网站查看详情！请尽快联系管理员发货！'),(6,'template_email_reg','你好,请在24小时内激活注册邮件，点击连接激活邮件：{地址}'),(7,'template_email_shop','恭喜您：{用户名}，你在云购网够买的商品：{商品名称} 已中奖，中奖码是:{中奖码}'),(8,'pay_bank_type','yeepay'),(9,'template_mobile_pwd','你好,你现在正在找回密码，你的验证码是【000000】。'),(10,'template_email_pwd','请在24小时内激活邮件，点击连接激活邮件：{地址}');

/*Table structure for table `go_category` */

CREATE TABLE `go_category` (
  `cateid` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '栏目id',
  `parentid` smallint(6) DEFAULT NULL COMMENT '父ID',
  `channel` tinyint(4) NOT NULL DEFAULT '0',
  `model` tinyint(1) DEFAULT NULL COMMENT '栏目模型',
  `name` varchar(255) DEFAULT NULL COMMENT '栏目名称',
  `catdir` char(20) DEFAULT NULL COMMENT '英文名',
  `url` varchar(255) DEFAULT NULL,
  `info` text,
  `order` smallint(6) unsigned DEFAULT '1' COMMENT '排序',
  PRIMARY KEY (`cateid`),
  KEY `name` (`name`),
  KEY `order` (`order`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='栏目表';

/*Data for the table `go_category` */

insert  into `go_category`(`cateid`,`parentid`,`channel`,`model`,`name`,`catdir`,`url`,`info`,`order`) values (1,0,0,2,'帮助','help','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";N;s:7:\"content\";N;s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}',1),(2,1,0,2,'新手指南','xinshouzhinan','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";N;s:7:\"content\";N;s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}',1),(3,1,0,2,'云购保障','yunbaozhang','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:30:\"司法所发射点发射得分\";s:8:\"template\";N;s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}',1),(4,1,0,2,'商品配送','peisong','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";N;s:7:\"content\";N;s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}',1),(5,0,0,1,'手机','shouji','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";N;s:7:\"content\";N;s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}',6),(6,0,0,1,'平板电脑','pingban','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";N;s:7:\"content\";N;s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}',4),(7,0,0,-1,'新手指南','newbie','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";s:22:\"single_web.newbie.html\";s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}',1),(8,0,0,-1,'合作专区','business','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";s:24:\"single_web.business.html\";s:7:\"content\";s:34:\"<p>输入栏目内容...567678</p>\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}',1),(9,0,0,-1,'公益基金','fund','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";s:20:\"single_web.fund.html\";s:7:\"content\";s:28:\"<p>输入栏目内容...</p>\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}',1),(10,0,0,-1,'云购QQ群','qqgroup','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";s:23:\"single_web.qqgroup.html\";s:7:\"content\";s:40:\"PHA+6L6T5YWl5qCP55uu5YaF5a65Li4uPC9wPg==\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}',1),(11,0,0,-1,'邀请注册','pleasereg','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";s:25:\"single_web.pleasereg.html\";s:7:\"content\";s:28:\"<p>输入栏目内容...</p>\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}',1),(12,0,0,1,'数码相机','shuma','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:12:\"数码相机\";s:8:\"template\";s:0:\"\";s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:12:\"数码相机\";s:13:\"meta_keywords\";s:12:\"数码相机\";s:16:\"meta_description\";s:12:\"数码相机\";}',3),(13,0,0,1,'电脑','diannao','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:6:\"电脑\";s:8:\"template\";s:0:\"\";s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:6:\"电脑\";s:13:\"meta_keywords\";s:6:\"电脑\";s:16:\"meta_description\";s:6:\"电脑\";}',5),(14,0,0,1,'钟表首饰','zhongbiao','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:12:\"钟表首饰\";s:8:\"template\";s:0:\"\";s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:12:\"钟表首饰\";s:13:\"meta_keywords\";s:12:\"钟表首饰\";s:16:\"meta_description\";s:12:\"钟表首饰\";}',2),(15,0,0,1,'其他商品','qita','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:12:\"其他商品\";s:8:\"template\";s:0:\"\";s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:12:\"其他商品\";s:13:\"meta_keywords\";s:12:\"其他商品\";s:16:\"meta_description\";s:12:\"其他商品\";}',1),(16,1,0,2,'云购基金','fund','','a:7:{s:5:\"thumb\";s:0:\"\";s:3:\"des\";s:0:\"\";s:8:\"template\";s:0:\"\";s:7:\"content\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";}',1);

/*Table structure for table `go_config` */

CREATE TABLE `go_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `value` mediumtext,
  `zhushi` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `go_config` */

insert  into `go_config`(`id`,`name`,`value`,`zhushi`) values (1,'web_name','云购CMS — 惊喜无线','网站名'),(2,'web_key','是一个云购系统','网站关键字'),(3,'web_des','是一个云购系统','网站介绍'),(4,'web_path','http://www.yungoucms.cn/','网站地址'),(5,'templates_edit','1','是否允许在线编辑模板'),(6,'templates_name','templet2','当前模板方案'),(7,'charset','utf-8','网站字符集'),(8,'timezone','Asia/Shanghai','网站时区'),(9,'error','1','1、保存错误日志到 cache/error_log.php | 0、在页面直接显示'),(10,'gzip','0','是否Gzip压缩后输出,服务器没有gzip请不要启用'),(11,'lang','zh-cn','网站语言包'),(12,'cache','3600','默认缓存时间'),(13,'web_off','1','网站是否开启'),(14,'web_off_text','网站关闭。升级中....','关闭原因'),(15,'tablepre','QCNf',NULL),(16,'index_name','?','隐藏首页文件名'),(17,'expstr','/','url分隔符号'),(18,'admindir','admin','后台管理文件夹'),(19,'qq','4006810039','qq'),(20,'cell','4006810039','联系电话'),(21,'web_logo','banner/logo.png','logo'),(22,'web_copyright','Copyright © 2011 - 2013, 版权所有 粤ICP备09213115号-12','版权'),(23,'web_name_two','1元云购7','短网站名'),(24,'qq_qun','123456|456789|sdfdsfds','QQ群'),(25,'goods_end_time','180','开奖动画秒数(单位秒)');

/*Table structure for table `go_egglotter_award` */

CREATE TABLE `go_egglotter_award` (
  `award_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(11) DEFAULT NULL COMMENT '用户名字',
  `rule_id` int(11) DEFAULT NULL COMMENT '活动ID',
  `subtime` int(11) DEFAULT NULL COMMENT '中奖时间',
  `spoil_id` int(11) DEFAULT NULL COMMENT '奖品等级',
  PRIMARY KEY (`award_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_egglotter_award` */

/*Table structure for table `go_egglotter_rule` */

CREATE TABLE `go_egglotter_rule` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(200) DEFAULT NULL,
  `starttime` int(11) DEFAULT NULL COMMENT '活动开始时间',
  `endtime` int(11) DEFAULT NULL COMMENT '活动结束时间',
  `subtime` int(11) DEFAULT NULL COMMENT '活动编辑时间',
  `lotterytype` int(11) DEFAULT NULL COMMENT '抽奖按币分类',
  `lotterjb` int(11) DEFAULT NULL COMMENT '每一次抽奖使用的金币',
  `ruledesc` text COMMENT '规则介绍',
  `startusing` tinyint(4) DEFAULT NULL COMMENT '启用',
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_egglotter_rule` */

/*Table structure for table `go_egglotter_spoil` */

CREATE TABLE `go_egglotter_spoil` (
  `spoil_id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) DEFAULT NULL,
  `spoil_name` text COMMENT '名称',
  `spoil_jl` int(11) DEFAULT NULL COMMENT '机率',
  `spoil_dj` int(11) DEFAULT NULL,
  `urlimg` varchar(200) DEFAULT NULL,
  `subtime` int(11) DEFAULT NULL COMMENT '提交时间',
  PRIMARY KEY (`spoil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_egglotter_spoil` */

/*Table structure for table `go_fund` */

CREATE TABLE `go_fund` (
  `id` int(10) unsigned NOT NULL,
  `fund_off` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `fund_money` decimal(10,2) unsigned NOT NULL,
  `fund_count_money` decimal(12,2) DEFAULT NULL COMMENT '云购基金',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_fund` */

insert  into `go_fund`(`id`,`fund_off`,`fund_money`,`fund_count_money`) values (1,1,'11.00','5896.00');

/*Table structure for table `go_link` */

CREATE TABLE `go_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '友情链接ID',
  `type` tinyint(1) unsigned NOT NULL COMMENT '链接类型',
  `name` char(20) NOT NULL COMMENT '名称',
  `logo` varchar(250) NOT NULL COMMENT '图片',
  `url` varchar(50) NOT NULL COMMENT '地址',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_link` */

/*Table structure for table `go_member` */

CREATE TABLE `go_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL COMMENT '用户名',
  `email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `mobile` char(11) DEFAULT NULL COMMENT '用户手机',
  `password` char(32) DEFAULT NULL COMMENT '密码',
  `user_ip` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `qianming` varchar(255) DEFAULT NULL COMMENT '用户签名',
  `groupid` tinyint(4) unsigned DEFAULT '0' COMMENT '用户权限组',
  `addgroup` varchar(255) DEFAULT NULL COMMENT '用户加入的圈子组1|2|3',
  `money` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '账户金额',
  `emailcode` char(21) DEFAULT '-1' COMMENT '邮箱认证码',
  `mobilecode` char(21) DEFAULT '-1' COMMENT '手机认证码',
  `passcode` char(21) DEFAULT '-1' COMMENT '找会密码认证码-1,1,码',
  `reg_key` varchar(100) DEFAULT NULL COMMENT '注册参数',
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  `jingyan` int(10) unsigned DEFAULT '0',
  `yaoqing` int(10) unsigned DEFAULT NULL,
  `band` varchar(255) DEFAULT NULL,
  `time` int(10) unsigned DEFAULT '0',
  `login_time` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会员表';

/*Data for the table `go_member` */

insert  into `go_member`(`uid`,`username`,`email`,`mobile`,`password`,`user_ip`,`img`,`qianming`,`groupid`,`addgroup`,`money`,`emailcode`,`mobilecode`,`passcode`,`reg_key`,`score`,`jingyan`,`yaoqing`,`band`,`time`,`login_time`) values (1,'测试一号','326397977@qq.com','17710160883','77fab95de2c362ba0ad0b1b27a9f058a',',127.0.0.1','photo/member.jpg','',1,NULL,'9984.00','1','1','-1',NULL,320,320,NULL,NULL,1451465883,1453979976),(2,'测试二号','313766018@qq.com','17710160884','77fab95de2c362ba0ad0b1b27a9f058a',',127.0.0.1','photo/member.jpg','',1,NULL,'9978.00','1','1','-1',NULL,440,440,NULL,NULL,1451466169,1452077135),(3,'测试三号','3@qq.com','17710160883','77fab95de2c362ba0ad0b1b27a9f058a',',127.0.0.1','touimg/20160106/54658366076664.jpg','dsfdsf',1,NULL,'9979.00','1','1','-1',NULL,420,420,NULL,NULL,1452076667,1452076686);

/*Table structure for table `go_member_account` */

CREATE TABLE `go_member_account` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(1) DEFAULT NULL COMMENT '充值1/消费-1',
  `pay` char(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL COMMENT '详情',
  `money` mediumint(8) NOT NULL DEFAULT '0' COMMENT '金额',
  `time` char(20) NOT NULL,
  KEY `uid` (`uid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员账户明细';

/*Data for the table `go_member_account` */

insert  into `go_member_account`(`uid`,`type`,`pay`,`content`,`money`,`time`) values (1,-1,'账户','云购了商品',14,'1451466124'),(1,1,'福分','云购了14人次商品',280,'1451466124'),(2,-1,'账户','云购了商品',6,'1451466513'),(2,1,'福分','云购了6人次商品',120,'1451466513'),(1,-1,'账户','云购了商品',1,'1451909488'),(1,1,'福分','云购了1人次商品',20,'1451909488'),(2,-1,'账户','云购了商品',8,'1452076592'),(2,1,'福分','云购了8人次商品',160,'1452076592'),(3,-1,'账户','云购了商品',11,'1452076709'),(3,1,'福分','云购了11人次商品',220,'1452076709'),(3,-1,'账户','云购了商品',10,'1452076764'),(3,1,'福分','云购了10人次商品',200,'1452076764'),(2,-1,'账户','云购了商品',8,'1452077149'),(2,1,'福分','云购了8人次商品',160,'1452077149'),(1,-1,'账户','云购了商品',1,'1452080047'),(1,1,'福分','云购了1人次商品',20,'1452080047');

/*Table structure for table `go_member_addmoney_record` */

CREATE TABLE `go_member_addmoney_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `code` char(20) NOT NULL,
  `money` decimal(10,2) unsigned NOT NULL,
  `pay_type` char(10) NOT NULL,
  `status` char(20) NOT NULL,
  `time` int(10) NOT NULL,
  `score` int(10) unsigned DEFAULT NULL,
  `scookies` text COMMENT '购物车cookie',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_member_addmoney_record` */

/*Table structure for table `go_member_band` */

CREATE TABLE `go_member_band` (
  `b_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `b_uid` int(10) DEFAULT NULL COMMENT '用户ID',
  `b_type` char(10) DEFAULT NULL COMMENT '绑定登陆类型',
  `b_code` varchar(100) DEFAULT NULL COMMENT '返回数据1',
  `b_data` varchar(100) DEFAULT NULL COMMENT '返回数据2',
  `b_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`b_id`),
  KEY `b_uid` (`b_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_member_band` */

/*Table structure for table `go_member_cashout` */

CREATE TABLE `go_member_cashout` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `username` varchar(20) NOT NULL COMMENT '开户人',
  `bankname` varchar(255) NOT NULL COMMENT '银行名称',
  `branch` varchar(255) NOT NULL COMMENT '支行',
  `money` decimal(8,0) NOT NULL DEFAULT '0' COMMENT '申请提现金额',
  `time` char(20) NOT NULL COMMENT '申请时间',
  `banknumber` varchar(50) NOT NULL COMMENT '银行帐号',
  `linkphone` varchar(100) NOT NULL COMMENT '联系电话',
  `auditstatus` tinyint(4) NOT NULL COMMENT '1审核通过',
  `procefees` decimal(8,2) NOT NULL COMMENT '手续费',
  `reviewtime` char(20) NOT NULL COMMENT '审核通过时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `type` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员账户明细';

/*Data for the table `go_member_cashout` */

/*Table structure for table `go_member_del` */

CREATE TABLE `go_member_del` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL COMMENT '用户名',
  `email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `mobile` char(11) DEFAULT NULL COMMENT '用户手机',
  `password` char(32) DEFAULT NULL COMMENT '密码',
  `user_ip` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `qianming` varchar(255) DEFAULT NULL COMMENT '用户签名',
  `groupid` tinyint(4) unsigned DEFAULT '0' COMMENT '用户权限组',
  `addgroup` varchar(255) DEFAULT NULL COMMENT '用户加入的圈子组1|2|3',
  `money` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '账户金额',
  `emailcode` char(21) DEFAULT '-1' COMMENT '邮箱认证码',
  `mobilecode` char(21) DEFAULT '-1' COMMENT '手机认证码',
  `passcode` char(21) DEFAULT '-1' COMMENT '找会密码认证码-1,1,码',
  `reg_key` varchar(100) DEFAULT NULL COMMENT '注册参数',
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  `jingyan` int(10) unsigned DEFAULT '0',
  `yaoqing` int(10) unsigned DEFAULT NULL,
  `band` varchar(255) DEFAULT NULL,
  `time` int(10) unsigned DEFAULT '0',
  `login_time` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员表';

/*Data for the table `go_member_del` */

/*Table structure for table `go_member_dizhi` */

CREATE TABLE `go_member_dizhi` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) NOT NULL COMMENT '用户id',
  `sheng` varchar(15) DEFAULT NULL COMMENT '省',
  `shi` varchar(15) DEFAULT NULL COMMENT '市',
  `xian` varchar(15) DEFAULT NULL COMMENT '县',
  `jiedao` varchar(255) DEFAULT NULL COMMENT '街道地址',
  `youbian` mediumint(8) DEFAULT NULL COMMENT '邮编',
  `shouhuoren` varchar(15) DEFAULT NULL COMMENT '收货人',
  `mobile` char(11) DEFAULT NULL COMMENT '手机',
  `qq` char(11) DEFAULT NULL COMMENT 'QQ',
  `tell` varchar(15) DEFAULT NULL COMMENT '座机号',
  `default` char(1) DEFAULT 'N' COMMENT '是否默认',
  `time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员地址表';

/*Data for the table `go_member_dizhi` */

/*Table structure for table `go_member_go_record` */

CREATE TABLE `go_member_go_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(20) DEFAULT NULL COMMENT '订单号',
  `code_tmp` tinyint(3) unsigned DEFAULT NULL COMMENT '相同订单',
  `username` varchar(30) NOT NULL,
  `uphoto` varchar(255) DEFAULT NULL,
  `uid` int(10) unsigned NOT NULL COMMENT '会员id',
  `shopid` int(6) unsigned NOT NULL COMMENT '商品id',
  `shopname` varchar(255) NOT NULL COMMENT '商品名',
  `shopqishu` smallint(6) NOT NULL DEFAULT '0' COMMENT '期数',
  `gonumber` smallint(5) unsigned DEFAULT NULL COMMENT '购买次数',
  `goucode` longtext NOT NULL COMMENT '云购码',
  `moneycount` decimal(10,2) NOT NULL,
  `huode` char(50) NOT NULL DEFAULT '0' COMMENT '中奖码',
  `pay_type` char(10) DEFAULT NULL COMMENT '付款方式',
  `ip` varchar(255) DEFAULT NULL,
  `status` char(30) DEFAULT NULL COMMENT '订单状态',
  `company_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `company_code` char(20) DEFAULT NULL,
  `company` char(10) DEFAULT NULL,
  `time` char(21) NOT NULL COMMENT '购买时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `shopid` (`shopid`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='云购记录表';

/*Data for the table `go_member_go_record` */

insert  into `go_member_go_record`(`id`,`code`,`code_tmp`,`username`,`uphoto`,`uid`,`shopid`,`shopname`,`shopqishu`,`gonumber`,`goucode`,`moneycount`,`huode`,`pay_type`,`ip`,`status`,`company_money`,`company_code`,`company`,`time`) values (1,'A14514661243517148',0,'测试一号','photo/member.jpg',1,1,'测试手机测试手机',1,14,'10000020,10000017,10000006,10000003,10000012,10000002,10000016,10000005,10000013,10000018,10000009,10000001,10000019,10000004','14.00','10000001','账户',',127.0.0.1','已付款,未发货,未完成','0.00',NULL,NULL,'1451466124.352'),(2,'A14514665137329866',0,'测试二号','photo/member.jpg',2,1,'测试手机测试手机',1,6,'10000010,10000008,10000015,10000011,10000007,10000014','6.00','0','账户',',127.0.0.1','已付款,未发货,未完成','0.00',NULL,NULL,'1451466513.733'),(3,'A14519094888415438',0,'测试一号','photo/member.jpg',1,2,'测试手机测试手机',2,1,'10000009','1.00','0','账户',',127.0.0.1','已付款,未发货,未完成','0.00',NULL,NULL,'1451909488.842'),(4,'A14520765925822440',0,'测试二号','photo/member.jpg',2,2,'测试手机测试手机',2,8,'10000013,10000008,10000001,10000010,10000019,10000004,10000017,10000016','8.00','10000001','账户',',127.0.0.1','已付款,未发货,未完成','0.00',NULL,NULL,'1452076592.582'),(5,'A14520767092089142',0,'测试三号','touimg/20160106/54658366076664.jpg',3,2,'测试手机测试手机',2,11,'10000002,10000003,10000015,10000005,10000006,10000012,10000011,10000018,10000007,10000014,10000020','11.00','0','账户',',127.0.0.1','已付款,未发货,未完成','0.00',NULL,NULL,'1452076709.210'),(6,'A14520767641820583',0,'测试三号','touimg/20160106/54658366076664.jpg',3,3,'测试手机测试手机',3,10,'10000017,10000020,10000004,10000002,10000015,10000008,10000013,10000012,10000006,10000019','10.00','0','账户',',127.0.0.1','已付款,未发货,未完成','0.00',NULL,NULL,'1452076764.185'),(7,'A14520771491100755',0,'测试二号','photo/member.jpg',2,3,'测试手机测试手机',3,8,'10000007,10000009,10000001,10000018,10000014,10000003,10000016,10000011','8.00','0','账户',',127.0.0.1','已付款,未发货,未完成','0.00',NULL,NULL,'1452077149.113'),(8,'A14520800475408560',0,'测试一号','photo/member.jpg',1,3,'测试手机测试手机',3,1,'10000005','1.00','0','账户',',127.0.0.1','已付款,未发货,未完成','0.00',NULL,NULL,'1452080047.543');

/*Table structure for table `go_member_group` */

CREATE TABLE `go_member_group` (
  `groupid` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL COMMENT '会员组名',
  `jingyan_start` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '需要的经验值',
  `jingyan_end` int(10) NOT NULL,
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `type` char(1) NOT NULL DEFAULT 'N' COMMENT '是否是系统组',
  PRIMARY KEY (`groupid`),
  KEY `jingyan` (`jingyan_start`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员权限组';

/*Data for the table `go_member_group` */

insert  into `go_member_group`(`groupid`,`name`,`jingyan_start`,`jingyan_end`,`icon`,`type`) values (1,'云购新手',0,500,NULL,'N'),(2,'云购小将',501,1000,NULL,'N'),(3,'云购中将',1001,3000,NULL,'N'),(4,'云购上将',3001,6000,NULL,'N'),(5,'云购大将',6001,20000,NULL,'N'),(6,'云购将军',20001,40000,NULL,'N');

/*Table structure for table `go_member_message` */

CREATE TABLE `go_member_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(1) DEFAULT '0' COMMENT '消息来源,0系统,1私信',
  `sendid` int(10) unsigned DEFAULT '0' COMMENT '发送人ID',
  `sendname` char(20) DEFAULT NULL COMMENT '发送人名',
  `content` varchar(255) DEFAULT NULL COMMENT '发送内容',
  `time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员消息表';

/*Data for the table `go_member_message` */

/*Table structure for table `go_member_recodes` */

CREATE TABLE `go_member_recodes` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(1) NOT NULL COMMENT '收取1//充值-2/提现-3',
  `content` varchar(255) NOT NULL COMMENT '详情',
  `shopid` int(11) DEFAULT NULL COMMENT '商品id',
  `money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '佣金',
  `time` char(20) NOT NULL,
  `ygmoney` decimal(8,2) NOT NULL COMMENT '云购金额',
  `cashoutid` int(11) DEFAULT NULL COMMENT '申请提现记录表id',
  KEY `uid` (`uid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员账户明细';

/*Data for the table `go_member_recodes` */

/*Table structure for table `go_member_white` */

CREATE TABLE `go_member_white` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(200) NOT NULL DEFAULT '' COMMENT '用户id',
  `shopid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `time` datetime NOT NULL COMMENT '添加时间',
  `add_user` char(30) NOT NULL DEFAULT '' COMMENT '操作人',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除0：正常 1：删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_shopid` (`shopid`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_member_white` */

/*Table structure for table `go_model` */

CREATE TABLE `go_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(10) NOT NULL,
  `table` char(20) NOT NULL,
  PRIMARY KEY (`modelid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='模型表';

/*Data for the table `go_model` */

insert  into `go_model`(`modelid`,`name`,`table`) values (1,'云购模型','shoplist'),(2,'文章模型','article');

/*Table structure for table `go_navigation` */

CREATE TABLE `go_navigation` (
  `cid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` char(10) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` char(1) DEFAULT 'Y' COMMENT '显示/隐藏',
  `order` smallint(6) unsigned DEFAULT '1',
  PRIMARY KEY (`cid`),
  KEY `status` (`status`),
  KEY `order` (`order`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `go_navigation` */

insert  into `go_navigation`(`cid`,`parentid`,`name`,`type`,`url`,`status`,`order`) values (1,0,'所有商品','index','/goods_list','Y',2),(2,0,'新手指南','index','/single/newbie','Y',2),(3,0,'云购圈','foot','/group','Y',2),(4,0,'关于云购','foot','/help/1','Y',1),(5,0,'隐私声明','foot','/help/12','Y',1),(6,0,'合作专区','foot','/single/business','Y',1),(7,0,'友情链接','foot','/link','Y',1),(8,0,'联系我们','foot','/help/13','Y',1),(10,0,'晒单分享','index','/go/shaidan/','Y',1),(12,0,'最新揭晓','index','/goods_lottery','N',1),(13,0,'邀请','index','/single/pleasereg','Y',1),(14,0,'限时揭晓','index','/go/autolottery','Y',1),(16,0,'最新揭晓','index','/goods_lottery','Y',1);

/*Table structure for table `go_pay` */

CREATE TABLE `go_pay` (
  `pay_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pay_name` char(20) NOT NULL,
  `pay_class` char(20) NOT NULL,
  `pay_type` tinyint(3) NOT NULL,
  `pay_thumb` varchar(255) DEFAULT NULL,
  `pay_des` text,
  `pay_start` tinyint(4) NOT NULL,
  `pay_key` text,
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `go_pay` */

insert  into `go_pay`(`pay_id`,`pay_name`,`pay_class`,`pay_type`,`pay_thumb`,`pay_des`,`pay_start`,`pay_key`) values (1,'财付通','tenpay',1,'photo/cft.gif','腾讯财付通	',0,'a:2:{s:2:\"id\";a:2:{s:4:\"name\";s:19:\"财付通商户号:\";s:3:\"val\";s:0:\"\";}s:3:\"key\";a:2:{s:4:\"name\";s:16:\"财付通密钥:\";s:3:\"val\";s:0:\"\";}}'),(2,'支付宝','alipay',1,'photo/20130929/82028078450752.jpg','支付宝支付',0,'a:3:{s:2:\"id\";a:2:{s:4:\"name\";s:19:\"支付宝商户号:\";s:3:\"val\";s:0:\"\";}s:3:\"key\";a:2:{s:4:\"name\";s:16:\"支付宝密钥:\";s:3:\"val\";s:0:\"\";}s:4:\"user\";a:2:{s:4:\"name\";s:16:\"支付宝账号:\";s:3:\"val\";s:0:\"\";}}'),(3,'易宝支付','yeepay',1,'photo/20130929/93656812450898.jpg','易宝支付',0,'a:2:{s:2:\"id\";a:2:{s:4:\"name\";s:16:\"易宝商户号:\";s:3:\"val\";s:0:\"\";}s:3:\"key\";a:2:{s:4:\"name\";s:13:\"易宝密钥:\";s:3:\"val\";s:0:\"\";}}'),(4,'微信支付','wxpay',1,NULL,'微信支付',1,'a:3:{s:2:\"id\";a:2:{s:4:\"name\";s:19:\"微信支付APPID:\";s:3:\"val\";s:18:\"\";}s:3:\"key\";a:2:{s:4:\"name\";s:16:\"微信支付KEY:\";s:3:\"val\";s:32:\"\";}s:4:\"user\";a:2:{s:4:\"name\";s:16:\"微信支付MCHID:\";s:3:\"val\";s:8:\"\";}}');

/*Table structure for table `go_position` */

CREATE TABLE `go_position` (
  `pos_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pos_model` tinyint(3) unsigned NOT NULL,
  `pos_name` varchar(30) NOT NULL,
  `pos_num` tinyint(3) unsigned NOT NULL,
  `pos_maxnum` tinyint(3) unsigned NOT NULL,
  `pos_this_num` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pos_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pos_id`),
  KEY `pos_id` (`pos_id`),
  KEY `pos_model` (`pos_model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_position` */

/*Table structure for table `go_position_data` */

CREATE TABLE `go_position_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `con_id` int(10) unsigned NOT NULL,
  `mod_id` tinyint(3) unsigned NOT NULL,
  `mod_name` char(20) NOT NULL,
  `pos_id` int(10) unsigned NOT NULL,
  `pos_data` mediumtext NOT NULL,
  `pos_order` int(10) unsigned NOT NULL DEFAULT '1',
  `pos_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_position_data` */

/*Table structure for table `go_qqset` */

CREATE TABLE `go_qqset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qq` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `county` varchar(50) DEFAULT NULL,
  `qqurl` varchar(250) DEFAULT NULL,
  `full` varchar(6) DEFAULT NULL COMMENT '是否已满',
  `subtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `go_qqset` */

insert  into `go_qqset`(`id`,`qq`,`name`,`type`,`province`,`city`,`county`,`qqurl`,`full`,`subtime`) values (18,'156556','苏珊丹','直属群','省份','地级市','市、县级市','<srcipt> alert(1)</script>','未满',1418873873);

/*Table structure for table `go_quanzi` */

CREATE TABLE `go_quanzi` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` char(15) NOT NULL COMMENT '标题',
  `img` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `chengyuan` mediumint(8) unsigned DEFAULT '0' COMMENT '成员数',
  `tiezi` mediumint(8) unsigned DEFAULT '0' COMMENT '帖子数',
  `guanli` mediumint(8) unsigned NOT NULL COMMENT '管理员',
  `jinhua` smallint(5) unsigned DEFAULT NULL COMMENT '精华帖',
  `jianjie` varchar(255) DEFAULT '暂无介绍' COMMENT '简介',
  `gongao` varchar(255) DEFAULT '暂无' COMMENT '公告',
  `jiaru` char(1) DEFAULT 'Y' COMMENT '申请加入',
  `glfatie` char(1) DEFAULT 'N' COMMENT '发帖权限',
  `shenhe` char(1) NOT NULL DEFAULT 'N',
  `huifu` char(1) NOT NULL DEFAULT 'Y',
  `time` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_quanzi` */

/*Table structure for table `go_quanzi_hueifu` */

CREATE TABLE `go_quanzi_hueifu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tzid` int(11) DEFAULT NULL COMMENT '帖子ID匹配',
  `hueifu` text COMMENT '回复内容',
  `hueiyuan` varchar(255) DEFAULT NULL COMMENT '会员',
  `hftime` int(11) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_quanzi_hueifu` */

/*Table structure for table `go_quanzi_tiezi` */

CREATE TABLE `go_quanzi_tiezi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `qzid` int(10) unsigned DEFAULT NULL COMMENT '圈子ID匹配',
  `tiezi` int(10) unsigned NOT NULL DEFAULT '0',
  `hueiyuan` varchar(255) DEFAULT NULL COMMENT '会员信息',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `neirong` text COMMENT '内容',
  `hueifu` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '回复',
  `dianji` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `zhiding` char(1) DEFAULT 'N' COMMENT '置顶',
  `jinghua` char(1) DEFAULT 'N' COMMENT '精华',
  `zuihou` varchar(255) DEFAULT NULL COMMENT '最后回复',
  `shenhe` char(1) NOT NULL DEFAULT 'Y' COMMENT '是否通过',
  `time` int(10) unsigned DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_quanzi_tiezi` */

/*Table structure for table `go_recom` */

CREATE TABLE `go_recom` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '推荐位id',
  `img` varchar(50) DEFAULT NULL COMMENT '推荐位图片',
  `title` varchar(30) DEFAULT NULL COMMENT '推荐位标题',
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_recom` */

/*Table structure for table `go_send` */

CREATE TABLE `go_send` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `gid` int(10) unsigned NOT NULL,
  `username` varchar(30) NOT NULL,
  `shoptitle` varchar(200) NOT NULL,
  `send_type` tinyint(4) NOT NULL,
  `send_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `gid` (`gid`),
  KEY `send_type` (`send_type`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `go_send` */

insert  into `go_send`(`id`,`uid`,`gid`,`username`,`shoptitle`,`send_type`,`send_time`) values (8,1,1,'测试一号','测试手机测试手机',3,1451466513);

/*Table structure for table `go_shaidan` */

CREATE TABLE `go_shaidan` (
  `sd_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '晒单id',
  `sd_userid` int(10) unsigned DEFAULT NULL COMMENT '用户ID',
  `sd_shopid` int(10) unsigned DEFAULT NULL COMMENT '商品ID',
  `sd_shopsid` int(10) unsigned DEFAULT NULL,
  `sd_qishu` int(10) unsigned DEFAULT NULL,
  `sd_ip` varchar(255) DEFAULT NULL,
  `sd_title` varchar(255) DEFAULT NULL COMMENT '晒单标题',
  `sd_thumbs` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `sd_content` text COMMENT '晒单内容',
  `sd_photolist` text COMMENT '晒单图片',
  `sd_zhan` int(10) unsigned DEFAULT '0' COMMENT '点赞',
  `sd_ping` int(10) unsigned DEFAULT '0' COMMENT '评论',
  `sd_time` int(10) unsigned DEFAULT NULL COMMENT '晒单时间',
  PRIMARY KEY (`sd_id`),
  KEY `sd_userid` (`sd_userid`),
  KEY `sd_shopid` (`sd_shopid`),
  KEY `sd_zhan` (`sd_zhan`),
  KEY `sd_ping` (`sd_ping`),
  KEY `sd_time` (`sd_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='晒单';

/*Data for the table `go_shaidan` */

/*Table structure for table `go_shaidan_hueifu` */

CREATE TABLE `go_shaidan_hueifu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sdhf_id` int(11) NOT NULL COMMENT '晒单ID',
  `sdhf_userid` int(11) DEFAULT NULL COMMENT '晒单回复会员ID',
  `sdhf_content` text COMMENT '晒单回复内容',
  `sdhf_time` int(11) DEFAULT NULL,
  `sdhf_username` char(20) DEFAULT NULL,
  `sdhf_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_shaidan_hueifu` */

/*Table structure for table `go_shopcodes_1` */

CREATE TABLE `go_shopcodes_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_id` int(10) unsigned NOT NULL,
  `s_cid` smallint(5) unsigned NOT NULL,
  `s_len` smallint(5) DEFAULT NULL,
  `s_codes` text,
  `s_codes_tmp` text,
  PRIMARY KEY (`id`),
  KEY `s_id` (`s_id`),
  KEY `s_cid` (`s_cid`),
  KEY `s_len` (`s_len`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `go_shopcodes_1` */

insert  into `go_shopcodes_1`(`id`,`s_id`,`s_cid`,`s_len`,`s_codes`,`s_codes_tmp`) values (2,1,0,0,'a:0:{}','a:20:{i:0;i:10000020;i:1;i:10000017;i:2;i:10000006;i:3;i:10000003;i:4;i:10000012;i:5;i:10000002;i:6;i:10000016;i:7;i:10000005;i:8;i:10000013;i:9;i:10000018;i:10;i:10000009;i:11;i:10000001;i:12;i:10000019;i:13;i:10000004;i:14;i:10000010;i:15;i:10000008;i:16;i:10000015;i:17;i:10000011;i:18;i:10000007;i:19;i:10000014;}'),(3,2,0,0,'a:0:{}','a:20:{i:0;i:10000009;i:1;i:10000013;i:2;i:10000008;i:3;i:10000001;i:4;i:10000010;i:5;i:10000019;i:6;i:10000004;i:7;i:10000017;i:8;i:10000016;i:9;i:10000002;i:10;i:10000003;i:11;i:10000015;i:12;i:10000005;i:13;i:10000006;i:14;i:10000012;i:15;i:10000011;i:16;i:10000018;i:17;i:10000007;i:18;i:10000014;i:19;i:10000020;}'),(4,3,1,1,'a:1:{i:0;i:10000010;}','a:20:{i:0;i:10000017;i:1;i:10000020;i:2;i:10000004;i:3;i:10000002;i:4;i:10000015;i:5;i:10000008;i:6;i:10000013;i:7;i:10000012;i:8;i:10000006;i:9;i:10000019;i:10;i:10000007;i:11;i:10000009;i:12;i:10000001;i:13;i:10000018;i:14;i:10000014;i:15;i:10000003;i:16;i:10000016;i:17;i:10000011;i:18;i:10000005;i:19;i:10000010;}');

/*Table structure for table `go_shoplist` */

CREATE TABLE `go_shoplist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `sid` int(10) unsigned NOT NULL COMMENT '同一个商品',
  `cateid` smallint(6) unsigned DEFAULT NULL COMMENT '所属栏目ID',
  `brandid` smallint(6) unsigned DEFAULT NULL COMMENT '所属品牌ID',
  `title` varchar(100) DEFAULT NULL COMMENT '商品标题',
  `title_style` varchar(100) DEFAULT NULL,
  `title2` varchar(100) DEFAULT NULL COMMENT '副标题',
  `keywords` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `yunjiage` decimal(4,2) unsigned DEFAULT '1.00' COMMENT '云购人次价格',
  `zongrenshu` int(10) unsigned DEFAULT '0' COMMENT '总需人数',
  `canyurenshu` int(10) unsigned DEFAULT '0' COMMENT '已参与人数',
  `shenyurenshu` int(10) unsigned DEFAULT NULL,
  `def_renshu` int(10) unsigned DEFAULT '0',
  `qishu` smallint(6) unsigned DEFAULT '0' COMMENT '期数',
  `maxqishu` smallint(5) unsigned DEFAULT '1' COMMENT ' 最大期数',
  `thumb` varchar(255) DEFAULT NULL,
  `picarr` text COMMENT '商品图片',
  `content` mediumtext COMMENT '商品内容详情',
  `codes_table` char(20) DEFAULT NULL,
  `xsjx_time` int(10) unsigned DEFAULT NULL,
  `pos` tinyint(4) unsigned DEFAULT NULL COMMENT '是否推荐',
  `renqi` tinyint(4) unsigned DEFAULT '0' COMMENT '是否人气商品0否1是',
  `time` int(10) unsigned DEFAULT NULL COMMENT '时间',
  `order` int(10) unsigned DEFAULT '1',
  `q_uid` int(10) unsigned DEFAULT NULL COMMENT '中奖人ID',
  `q_user` text COMMENT '中奖人信息',
  `q_user_code` char(20) DEFAULT NULL COMMENT '中奖码',
  `q_content` mediumtext COMMENT '揭晓内容',
  `q_counttime` char(20) DEFAULT NULL COMMENT '总时间相加',
  `q_end_time` char(20) DEFAULT NULL COMMENT '揭晓时间',
  `q_showtime` char(1) DEFAULT 'N' COMMENT 'Y/N揭晓动画',
  PRIMARY KEY (`id`),
  KEY `renqi` (`renqi`),
  KEY `order` (`yunjiage`),
  KEY `q_uid` (`q_uid`),
  KEY `sid` (`sid`),
  KEY `shenyurenshu` (`shenyurenshu`),
  KEY `q_showtime` (`q_showtime`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商品表';

/*Data for the table `go_shoplist` */

insert  into `go_shoplist`(`id`,`sid`,`cateid`,`brandid`,`title`,`title_style`,`title2`,`keywords`,`description`,`money`,`yunjiage`,`zongrenshu`,`canyurenshu`,`shenyurenshu`,`def_renshu`,`qishu`,`maxqishu`,`thumb`,`picarr`,`content`,`codes_table`,`xsjx_time`,`pos`,`renqi`,`time`,`order`,`q_uid`,`q_user`,`q_user_code`,`q_content`,`q_counttime`,`q_end_time`,`q_showtime`) values (1,1,5,1,'测试手机测试手机','','测试手机','手机','测试手机测试手机测试手机测试手机测试手机测试手机','20.00','1.00',20,20,0,0,1,100,'shopimg/20151230/36114967463646.jpg','a:2:{i:0;s:35:\"shopimg/20151230/48100481463655.jpg\";i:1;s:35:\"shopimg/20151230/81215488463655.jpg\";}','<p>欢迎使用一块梦想系统!</p>','shopcodes_1',0,0,0,1451463722,1,1,'a:5:{s:3:\"uid\";s:1:\"1\";s:8:\"username\";s:12:\"测试一号\";s:5:\"email\";s:16:\"326397977@qq.com\";s:6:\"mobile\";s:11:\"17710160883\";s:3:\"img\";s:16:\"photo/member.jpg\";}','10000001','','','1451466693.773','N'),(2,1,5,1,'测试手机测试手机','','测试手机','手机','测试手机测试手机测试手机测试手机测试手机测试手机','20.00','1.00',20,20,0,0,2,100,'shopimg/20151230/36114967463646.jpg','a:2:{i:0;s:35:\"shopimg/20151230/48100481463655.jpg\";i:1;s:35:\"shopimg/20151230/81215488463655.jpg\";}','<p>欢迎使用一块梦想系统!</p>','shopcodes_1',0,0,0,1451466513,1,2,'a:5:{s:3:\"uid\";s:1:\"2\";s:8:\"username\";s:12:\"测试二号\";s:5:\"email\";s:16:\"313766018@qq.com\";s:6:\"mobile\";s:11:\"17710160884\";s:3:\"img\";s:16:\"photo/member.jpg\";}','10000001','','','1452076889.237','N'),(3,1,5,1,'测试手机测试手机','','测试手机','手机','测试手机测试手机测试手机测试手机测试手机测试手机','20.00','1.00',20,19,1,0,3,100,'shopimg/20151230/36114967463646.jpg','a:2:{i:0;s:35:\"shopimg/20151230/48100481463655.jpg\";i:1;s:35:\"shopimg/20151230/81215488463655.jpg\";}','<p>	欢迎使用一块梦想系统!\n</p>','shopcodes_1',1452088800,0,1,1452076709,1,NULL,NULL,NULL,NULL,NULL,NULL,'N');

/*Table structure for table `go_shoplist_del` */

CREATE TABLE `go_shoplist_del` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) NOT NULL COMMENT '同一个商品',
  `cateid` smallint(6) unsigned DEFAULT NULL,
  `brandid` smallint(6) unsigned DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `title_style` varchar(100) DEFAULT NULL,
  `title2` varchar(100) DEFAULT NULL,
  `keywords` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT '0.00',
  `yunjiage` decimal(4,2) unsigned DEFAULT '1.00',
  `zongrenshu` int(10) unsigned DEFAULT '0',
  `canyurenshu` int(10) unsigned DEFAULT '0',
  `shenyurenshu` int(10) unsigned DEFAULT NULL,
  `def_renshu` int(10) unsigned DEFAULT '0',
  `qishu` smallint(6) unsigned DEFAULT '0',
  `maxqishu` smallint(5) unsigned DEFAULT '1',
  `thumb` varchar(255) DEFAULT NULL,
  `picarr` text,
  `content` mediumtext,
  `codes_table` char(20) DEFAULT NULL,
  `xsjx_time` int(10) unsigned DEFAULT NULL,
  `pos` tinyint(4) unsigned DEFAULT NULL,
  `renqi` tinyint(4) unsigned DEFAULT '0',
  `time` int(10) unsigned DEFAULT NULL,
  `order` int(10) unsigned DEFAULT '1',
  `q_uid` int(10) unsigned DEFAULT NULL,
  `q_user` text COMMENT '中奖人信息',
  `q_user_code` char(20) DEFAULT NULL,
  `q_content` mediumtext,
  `q_counttime` char(20) DEFAULT NULL,
  `q_end_time` char(20) DEFAULT NULL,
  `q_showtime` char(1) DEFAULT 'N' COMMENT 'Y/N揭晓动画',
  PRIMARY KEY (`id`),
  KEY `renqi` (`renqi`),
  KEY `order` (`yunjiage`),
  KEY `q_uid` (`q_uid`),
  KEY `sid` (`sid`),
  KEY `shenyurenshu` (`shenyurenshu`),
  KEY `q_showtime` (`q_showtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_shoplist_del` */

/*Table structure for table `go_slide` */

CREATE TABLE `go_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img` varchar(50) DEFAULT NULL COMMENT '幻灯片',
  `title` varchar(30) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `img` (`img`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

/*Data for the table `go_slide` */

insert  into `go_slide`(`id`,`img`,`title`,`link`) values (8,'banner/20130613112718336.jpg','sd56',''),(9,'banner/20130401112535761.jpg','sdf',''),(10,'banner/20130510152637850.jpg','ert',''),(11,'banner/20130510163624847.jpg','ert','');

/*Table structure for table `go_template` */

CREATE TABLE `go_template` (
  `template_name` char(25) NOT NULL,
  `template` char(25) NOT NULL,
  `des` varchar(100) DEFAULT NULL,
  KEY `template` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_template` */

/*Table structure for table `go_vote_activer` */

CREATE TABLE `go_vote_activer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `vote_id` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `ip` char(20) DEFAULT NULL,
  `subtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_vote_activer` */

/*Table structure for table `go_vote_option` */

CREATE TABLE `go_vote_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_id` int(11) DEFAULT NULL,
  `option_title` varchar(100) DEFAULT NULL,
  `option_number` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_vote_option` */

/*Table structure for table `go_vote_subject` */

CREATE TABLE `go_vote_subject` (
  `vote_id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_title` varchar(100) DEFAULT NULL,
  `vote_starttime` int(11) DEFAULT NULL,
  `vote_endtime` int(11) DEFAULT NULL,
  `vote_sendtime` int(11) DEFAULT NULL,
  `vote_description` text,
  `vote_allowview` tinyint(1) DEFAULT NULL,
  `vote_allowguest` tinyint(1) DEFAULT NULL,
  `vote_interval` int(11) DEFAULT '0',
  `vote_enabled` tinyint(1) DEFAULT NULL,
  `vote_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`vote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `go_vote_subject` */

/*Table structure for table `go_wap` */

CREATE TABLE `go_wap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img` varchar(50) DEFAULT NULL COMMENT '幻灯片',
  `title` varchar(30) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `img` (`img`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

/*Data for the table `go_wap` */

/*Table structure for table `go_white_list` */

CREATE TABLE `go_white_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `username` char(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `add_user` char(50) NOT NULL DEFAULT '' COMMENT '添加人',
  `dateline` int(11) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0：正常 1：删除',
  `update_user` char(30) NOT NULL DEFAULT '' COMMENT '修改人',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `go_white_list` */

insert  into `go_white_list`(`id`,`uid`,`username`,`add_user`,`dateline`,`remark`,`status`,`update_user`,`update_time`) values (1,2,'测试二号','test',1454048435,'大师傅',0,'test',1454050404),(4,1,'测试一号','test',1454048597,'等发达',0,'',0),(5,3,'测试三号','test',1454054364,'',0,'test',1454054389);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
