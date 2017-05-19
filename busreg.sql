/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50535
Source Host           : localhost:3306
Source Database       : busreg

Target Server Type    : MYSQL
Target Server Version : 50535
File Encoding         : 65001

Date: 2017-05-19 14:47:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for broadband
-- ----------------------------
DROP TABLE IF EXISTS `broadband`;
CREATE TABLE `broadband` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `cardNum` varchar(20) DEFAULT NULL,
  `cardPhotoFront` varchar(255) DEFAULT NULL,
  `cardPhotoBack` varchar(255) DEFAULT NULL,
  `subofficeId` int(11) NOT NULL,
  `businessHallId` int(11) NOT NULL,
  `dealState` tinyint(1) NOT NULL COMMENT '0：未处理\r\n1：已处理',
  `insertTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of broadband
-- ----------------------------

-- ----------------------------
-- Table structure for businesshall
-- ----------------------------
DROP TABLE IF EXISTS `businesshall`;
CREATE TABLE `businesshall` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subofficeId` int(11) NOT NULL,
  `num` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '0：停用\r\n1：启用',
  `usable` int(11) DEFAULT NULL COMMENT '0：停用\r\n1：启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of businesshall
-- ----------------------------

-- ----------------------------
-- Table structure for limits
-- ----------------------------
DROP TABLE IF EXISTS `limits`;
CREATE TABLE `limits` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of limits
-- ----------------------------

-- ----------------------------
-- Table structure for suboffice
-- ----------------------------
DROP TABLE IF EXISTS `suboffice`;
CREATE TABLE `suboffice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `num` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `usable` int(11) DEFAULT NULL COMMENT '0：停用\r\n1：启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of suboffice
-- ----------------------------

-- ----------------------------
-- Table structure for uim
-- ----------------------------
DROP TABLE IF EXISTS `uim`;
CREATE TABLE `uim` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `cardNum` varchar(20) DEFAULT NULL,
  `uimNum` varchar(20) DEFAULT NULL,
  `cardPhotoFront` varchar(255) DEFAULT NULL,
  `cardPhotoBack` varchar(255) DEFAULT NULL,
  `userCardVoideo` varchar(255) DEFAULT NULL,
  `userCardPhoto` varchar(255) DEFAULT NULL,
  `subofficeId` int(11) NOT NULL,
  `businessHallId` int(11) NOT NULL,
  `dealState` tinyint(1) NOT NULL COMMENT '0：未处理\r\n1：已处理',
  `insertTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uim
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `limitsId` int(11) NOT NULL,
  `subofficeId` int(11) DEFAULT NULL,
  `businessHallId` int(11) DEFAULT NULL,
  `usable` int(11) NOT NULL COMMENT '0：停用\r\n1：启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', '1', '0', '0', '1');
