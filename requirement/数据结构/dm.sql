/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : qingke

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-11-17 15:40:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dm_area
-- ----------------------------
DROP TABLE IF EXISTS `dm_area`;
CREATE TABLE `dm_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '区域名称',
  `parent` varchar(255) DEFAULT NULL COMMENT '父级区域',
  `level` int(255) DEFAULT NULL COMMENT '分类级别;select;(0:全国,1:1级,2:2级)',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatedTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of dm_area
-- ----------------------------

-- ----------------------------
-- Table structure for dm_cinema
-- ----------------------------
DROP TABLE IF EXISTS `dm_cinema`;
CREATE TABLE `dm_cinema` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '剧场名称',
  `adress` varchar(255) DEFAULT NULL COMMENT '剧场地址',
  `areaId` bigint(20) DEFAULT NULL COMMENT '区域ID',
  `xLength` int(2) DEFAULT NULL COMMENT 'X轴座位长度',
  `yLength` int(2) DEFAULT NULL COMMENT 'Y轴座位长度',
  `latitude` varchar(255) DEFAULT NULL COMMENT '纬度',
  `longitude` varchar(255) DEFAULT NULL COMMENT '经度',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatedTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `areaId` (`areaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='剧场表';

-- ----------------------------
-- Records of dm_cinema
-- ----------------------------

-- ----------------------------
-- Table structure for dm_cinema_seat
-- ----------------------------
DROP TABLE IF EXISTS `dm_cinema_seat`;
CREATE TABLE `dm_cinema_seat` (
  `id` bigint(20) NOT NULL,
  `x` int(2) DEFAULT NULL COMMENT 'x坐标',
  `y` int(2) DEFAULT NULL COMMENT 'y坐标',
  `areaLevel` int(2) DEFAULT NULL COMMENT '区域级别(1:A;2:B;3:C)',
  `cinemaId` bigint(20) DEFAULT NULL COMMENT '排期Id',
  `sort` int(1) DEFAULT NULL COMMENT '排序',
  `status` int(1) DEFAULT '0' COMMENT '座位状态(0:没座位 1:有座位)',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatedTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `dm_cinema_seat_ibfk_1` (`cinemaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='剧场座位表';

-- ----------------------------
-- Records of dm_cinema_seat
-- ----------------------------

-- ----------------------------
-- Table structure for dm_comment
-- ----------------------------
DROP TABLE IF EXISTS `dm_comment`;
CREATE TABLE `dm_comment` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `itemId` bigint(11) DEFAULT NULL COMMENT '剧目Id',
  `userId` bigint(20) DEFAULT NULL COMMENT '评论用户ID',
  `score` int(2) DEFAULT NULL COMMENT '评分(1-10)',
  `content` text COMMENT '剧评',
  `createdTime` datetime DEFAULT NULL COMMENT '更新时间',
  `updatedTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `dm_comment_ibfk_1` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='剧评表';

-- ----------------------------
-- Records of dm_comment
-- ----------------------------

-- ----------------------------
-- Table structure for dm_image
-- ----------------------------
DROP TABLE IF EXISTS `dm_image`;
CREATE TABLE `dm_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `imgUrl` varchar(255) DEFAULT NULL COMMENT '图片URL',
  `targetId` int(2) DEFAULT NULL COMMENT '关联表ID',
  `sort` int(2) DEFAULT NULL COMMENT '顺序',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatedTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片表';

-- ----------------------------
-- Records of dm_image
-- ----------------------------

-- ----------------------------
-- Table structure for dm_item
-- ----------------------------
DROP TABLE IF EXISTS `dm_item`;
CREATE TABLE `dm_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(255) DEFAULT NULL COMMENT '节目名称',
  `itemTypeId` bigint(20) DEFAULT NULL COMMENT '节目类型管理ID',
  `itemTypeName` varchar(255) DEFAULT NULL COMMENT '节目名称',
  `state` int(2) DEFAULT NULL COMMENT '状态(1:项目待定2:预售/预订3:开始售票4:演出开始)',
  `basicDescription` text COMMENT '基础描述',
  `projectDescription` text COMMENT '项目描述',
  `reminderDescription` text COMMENT '温馨提示',
  `longitude` varchar(255) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(255) DEFAULT NULL COMMENT '纬度',
  `isRecommend` int(1) DEFAULT NULL COMMENT '是否推荐(0:不推荐 1:推荐)',
  `avgScore` decimal(4,0) DEFAULT NULL COMMENT '平均分',
  `commentCount` int(2) DEFAULT NULL COMMENT '评论数目',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatedTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `dm_item_ibfk_1` (`itemTypeName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节目表';

-- ----------------------------
-- Records of dm_item
-- ----------------------------

-- ----------------------------
-- Table structure for dm_item_type
-- ----------------------------
DROP TABLE IF EXISTS `dm_item_type`;
CREATE TABLE `dm_item_type` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `itemType` varchar(255) DEFAULT NULL COMMENT '类型名称',
  `level` varchar(255) DEFAULT NULL COMMENT '分类级别;select;(1:1级,2:2级)',
  `parent` bigint(11) DEFAULT NULL COMMENT '父级类型',
  `aliasName` varchar(255) DEFAULT NULL COMMENT '类别别名',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatedTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节目类型表';

-- ----------------------------
-- Records of dm_item_type
-- ----------------------------

-- ----------------------------
-- Table structure for dm_keyword_sort
-- ----------------------------
DROP TABLE IF EXISTS `dm_keyword_sort`;
CREATE TABLE `dm_keyword_sort` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) DEFAULT NULL COMMENT '搜索关键词',
  `count` int(11) DEFAULT NULL COMMENT '搜索数目',
  `createdTime` datetime DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='热门关键词排序表';

-- ----------------------------
-- Records of dm_keyword_sort
-- ----------------------------

-- ----------------------------
-- Table structure for dm_link_user
-- ----------------------------
DROP TABLE IF EXISTS `dm_link_user`;
CREATE TABLE `dm_link_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '联系人姓名',
  `idCard` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `cardType` int(1) DEFAULT NULL COMMENT '证件类型(0:身份证 1:护照)',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatedTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='常用联系人表\r\n';

-- ----------------------------
-- Records of dm_link_user
-- ----------------------------

-- ----------------------------
-- Table structure for dm_order
-- ----------------------------
DROP TABLE IF EXISTS `dm_order`;
CREATE TABLE `dm_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderNo` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `userId` bigint(20) DEFAULT NULL COMMENT '下单用户Id',
  `schedulerId` bigint(20) DEFAULT NULL COMMENT '排期ID',
  `itemId` bigint(20) DEFAULT NULL COMMENT '剧集Id(冗余)',
  `wxTradeNo` varchar(255) DEFAULT NULL COMMENT '微信交易号',
  `aliTradeNo` varchar(255) DEFAULT NULL COMMENT '支付宝交易号',
  `orderType` int(255) DEFAULT NULL COMMENT '订单类型(0:未支付 -1:支付超时/支付取消 2:已支付)',
  `payType` varchar(255) DEFAULT NULL COMMENT '支付类型(1:微信支付 2：支付宝支付)',
  `totalCount` int(255) DEFAULT NULL COMMENT '购买数目',
  `sourceType` int(1) DEFAULT NULL COMMENT '0:WEB端 1:手机端 2:其他客户端',
  `isNeedInvoice` int(1) DEFAULT NULL COMMENT '是否需要发票（0：不需要 1：需要）',
  `invoiceType` int(255) DEFAULT NULL COMMENT '发票类型（0：个人 1：公司）',
  `invoiceHead` varchar(255) DEFAULT NULL COMMENT '发票抬头',
  `invoiceNo` varchar(30) DEFAULT NULL COMMENT '发票号',
  `isNeedInsurance` int(1) DEFAULT NULL COMMENT '是否需要保险(0：不需要 1:需要)',
  `totalAmount` decimal(5,0) DEFAULT NULL COMMENT '总价',
  `insuranceAmount` decimal(5,0) DEFAULT NULL COMMENT '保险金额',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatedTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `schedulerId` (`schedulerId`),
  KEY `dm_order_ibfk_3` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of dm_order
-- ----------------------------

-- ----------------------------
-- Table structure for dm_order_link_user
-- ----------------------------
DROP TABLE IF EXISTS `dm_order_link_user`;
CREATE TABLE `dm_order_link_user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderId` bigint(11) NOT NULL COMMENT '订单id',
  `linkUserId` bigint(11) NOT NULL COMMENT '联系人id',
  `seatId` bigint(11) DEFAULT NULL COMMENT '座位Id',
  `linkUserName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入住人姓名逗号分隔',
  `createdTime` datetime DEFAULT NULL,
  `updatedTime` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seatId` (`seatId`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='订单联系人表';

-- ----------------------------
-- Records of dm_order_link_user
-- ----------------------------

-- ----------------------------
-- Table structure for dm_scheduler
-- ----------------------------
DROP TABLE IF EXISTS `dm_scheduler`;
CREATE TABLE `dm_scheduler` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '排期名称',
  `startTime` datetime DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '结束时间',
  `itemId` bigint(20) DEFAULT NULL COMMENT '剧集Id',
  `cinemaId` bigint(20) DEFAULT NULL COMMENT '剧场Id',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatedTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `dm_scheduler_ibfk_1` (`itemId`),
  KEY `dm_scheduler_ibfk_2` (`cinemaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节目排期表';

-- ----------------------------
-- Records of dm_scheduler
-- ----------------------------

-- ----------------------------
-- Table structure for dm_scheduler_seat
-- ----------------------------
DROP TABLE IF EXISTS `dm_scheduler_seat`;
CREATE TABLE `dm_scheduler_seat` (
  `id` bigint(20) NOT NULL,
  `x` int(2) DEFAULT NULL COMMENT 'x坐标',
  `y` int(2) DEFAULT NULL COMMENT 'y坐标',
  `areaLevel` int(2) DEFAULT NULL COMMENT '区域级别(1:A;2:B;3:C)',
  `scheduleId` bigint(20) DEFAULT NULL COMMENT '排期Id',
  `userId` bigint(20) DEFAULT NULL COMMENT '如果已经售出记录购买用户id',
  `status` int(1) DEFAULT '0' COMMENT '座位状态(0:没座位 1:有座位 2:锁定待付款 3:已售出 )',
  `sort` int(1) DEFAULT NULL COMMENT '排序',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatedTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `scheduleId` (`scheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='排期座位表';

-- ----------------------------
-- Records of dm_scheduler_seat
-- ----------------------------

-- ----------------------------
-- Table structure for dm_scheduler_seat_price
-- ----------------------------
DROP TABLE IF EXISTS `dm_scheduler_seat_price`;
CREATE TABLE `dm_scheduler_seat_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `price` decimal(10,0) DEFAULT NULL COMMENT '价格',
  `areaLevel` int(2) DEFAULT NULL COMMENT '区域级别(1:A;2:B;3:C)',
  `scheduleId` bigint(20) DEFAULT NULL COMMENT '排期Id',
  `createdTime` datetime DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `scheduleId` (`scheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节目排期座位价格表';

-- ----------------------------
-- Records of dm_scheduler_seat_price
-- ----------------------------

-- ----------------------------
-- Table structure for dm_user
-- ----------------------------
DROP TABLE IF EXISTS `dm_user`;
CREATE TABLE `dm_user` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `wxUserId` bigint(20) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatedTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of dm_user
-- ----------------------------
