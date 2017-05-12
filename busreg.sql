/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50535
Source Host           : localhost:3306
Source Database       : busreg

Target Server Type    : MYSQL
Target Server Version : 50535
File Encoding         : 65001

Date: 2017-05-12 17:42:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for broadband
-- ----------------------------
DROP TABLE IF EXISTS `broadband`;
CREATE TABLE `broadband` (
  `id` int(11) NOT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `cardNum` varchar(20) DEFAULT NULL,
  `cardPhotoFront` varchar(255) DEFAULT NULL,
  `cardPhotoBack` varchar(255) DEFAULT NULL,
  `subofficeId` int(11) NOT NULL,
  `businessHallId` int(11) NOT NULL,
  `dealState` tinyint(1) NOT NULL COMMENT '0：未处理\r\n1：已处理',
  `insertTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
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
  `id` int(11) NOT NULL,
  `num` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '0：停用\r\n1：启用',
  `usable` int(11) DEFAULT NULL COMMENT '0：停用\r\n1：启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of businesshall
-- ----------------------------
INSERT INTO `businesshall` VALUES ('1', '001001', '受理点1', '1');

-- ----------------------------
-- Table structure for limits
-- ----------------------------
DROP TABLE IF EXISTS `limits`;
CREATE TABLE `limits` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of limits
-- ----------------------------
INSERT INTO `limits` VALUES ('1', '一级权限');
INSERT INTO `limits` VALUES ('2', '分局用户');
INSERT INTO `limits` VALUES ('3', '分点用户');

-- ----------------------------
-- Table structure for suboffice
-- ----------------------------
DROP TABLE IF EXISTS `suboffice`;
CREATE TABLE `suboffice` (
  `id` int(11) NOT NULL,
  `num` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `usable` int(11) DEFAULT NULL COMMENT '0：停用\r\n1：启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of suboffice
-- ----------------------------
INSERT INTO `suboffice` VALUES ('1', '001', '分局1', '1');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uim
-- ----------------------------
INSERT INTO `uim` VALUES ('4', '2342', '11111111111111', '11111', '20170504154252_11111111111111_cardPhotoFrontF.txt', '20170504154252_11111111111111_cardPhotoBackF.txt', '20170504154252_11111111111111_userCardVoideoF.txt', '20170504154252_11111111111111_userCardPhotoF.txt', '1', '1', '0', '2017-05-04 15:42:52');
INSERT INTO `uim` VALUES ('5', '111', '11111111111111', '11111', '20170504164040_11111111111111_cardPhotoFrontF.txt', '20170504164040_11111111111111_cardPhotoBackF.txt', '20170504164040_11111111111111_userCardVoideoF.txt', '20170504164040_11111111111111_userCardPhotoF.txt', '1', '1', '0', '2017-05-04 16:40:41');
INSERT INTO `uim` VALUES ('6', '111', '11111111111111', '11111', '20170504172129_11111111111111_cardPhotoFrontF.txt', '20170504172129_11111111111111_cardPhotoBackF.txt', '20170504172129_11111111111111_userCardVoideoF.txt', '20170504172129_11111111111111_userCardPhotoF.txt', '1', '1', '0', '2017-05-04 17:21:29');
INSERT INTO `uim` VALUES ('7', '11', '11111111111111', '11111', '20170505085549_11111111111111_cardPhotoFrontF.txt', '20170505085549_11111111111111_cardPhotoBackF.txt', '20170505085549_11111111111111_userCardVoideoF.txt', '20170505085549_11111111111111_userCardPhotoF.txt', '1', '1', '0', '2017-05-05 08:55:49');
INSERT INTO `uim` VALUES ('8', '12', '11111111111112', '121211', '20170505142935_11111111111112_cardPhotoFrontF.txt', '20170505142935_11111111111112_cardPhotoBackF.txt', '20170505142935_11111111111112_userCardVoideoF.txt', '20170505142935_11111111111112_userCardPhotoF.txt', '1', '1', '0', '2017-05-05 14:29:35');
INSERT INTO `uim` VALUES ('9', '11', '11111111111112', '1111', '20170511170511_11111111111112_cardPhotoFrontF.txt', '20170511170511_11111111111112_cardPhotoBackF.txt', '20170511170511_11111111111112_userCardVoideoF.txt', '20170511170511_11111111111112_userCardPhotoF.txt', '1', '1', '0', '2017-05-11 17:05:12');
INSERT INTO `uim` VALUES ('10', '11', '11111111111112', '1111', '20170511170747_11111111111112_cardPhotoFrontF.txt', '20170511170747_11111111111112_cardPhotoBackF.txt', '20170511170747_11111111111112_userCardVoideoF.txt', '20170511170747_11111111111112_userCardPhotoF.txt', '1', '1', '0', '2017-05-11 17:07:47');
INSERT INTO `uim` VALUES ('11', '11', '11111111111112', '1111', '20170511170922_11111111111112_cardPhotoFrontF.txt', '20170511170922_11111111111112_cardPhotoBackF.txt', '20170511170922_11111111111112_userCardVoideoF.txt', '20170511170922_11111111111112_userCardPhotoF.txt', '1', '1', '0', '2017-05-11 17:09:22');
INSERT INTO `uim` VALUES ('12', '111', '12111111111111', '1212', '20170511171000_12111111111111_cardPhotoFrontF.txt', '20170511171000_12111111111111_cardPhotoBackF.txt', '20170511171000_12111111111111_userCardVoideoF.txt', '20170511171000_12111111111111_userCardPhotoF.txt', '1', '1', '0', '2017-05-11 17:10:00');
INSERT INTO `uim` VALUES ('13', '111', '12111111111111', '1212', '20170511171034_12111111111111_cardPhotoFrontF.txt', '20170511171034_12111111111111_cardPhotoBackF.txt', '20170511171034_12111111111111_userCardVoideoF.txt', '20170511171034_12111111111111_userCardPhotoF.txt', '1', '1', '0', '2017-05-11 17:10:34');
INSERT INTO `uim` VALUES ('14', '111', '11111111111112', '12222', '20170511171331_11111111111112_cardPhotoFrontF.txt', '20170511171331_11111111111112_cardPhotoBackF.txt', '20170511171331_11111111111112_userCardVoideoF.txt', '20170511171331_11111111111112_userCardPhotoF.txt', '1', '1', '0', '2017-05-11 17:13:32');
INSERT INTO `uim` VALUES ('15', '111', '11111111111112', '12222', '20170511171409_11111111111112_cardPhotoFrontF.txt', '20170511171409_11111111111112_cardPhotoBackF.txt', '20170511171409_11111111111112_userCardVoideoF.txt', '20170511171409_11111111111112_userCardPhotoF.txt', '1', '1', '0', '2017-05-11 17:14:09');
INSERT INTO `uim` VALUES ('16', '111', '11111111111112', '11', '20170511171503_11111111111112_cardPhotoFrontF.txt', '20170511171503_11111111111112_cardPhotoBackF.txt', '20170511171503_11111111111112_userCardVoideoF.txt', '20170511171503_11111111111112_userCardPhotoF.txt', '1', '1', '0', '2017-05-11 17:15:03');
INSERT INTO `uim` VALUES ('17', '2342', '11111111111111', '11111', '20170504154252_11111111111111_cardPhotoFrontF.txt', '20170504154252_11111111111111_cardPhotoBackF.txt', '20170504154252_11111111111111_userCardVoideoF.txt', '20170504154252_11111111111111_userCardPhotoF.txt', '1', '1', '0', '2017-05-12 11:13:05');
INSERT INTO `uim` VALUES ('18', '111', '11111111111111', '11111', '20170504164040_11111111111111_cardPhotoFrontF.txt', '20170504164040_11111111111111_cardPhotoBackF.txt', '20170504164040_11111111111111_userCardVoideoF.txt', '20170504164040_11111111111111_userCardPhotoF.txt', '1', '1', '0', '2017-05-12 11:13:05');
INSERT INTO `uim` VALUES ('19', '111', '11111111111111', '11111', '20170504172129_11111111111111_cardPhotoFrontF.txt', '20170504172129_11111111111111_cardPhotoBackF.txt', '20170504172129_11111111111111_userCardVoideoF.txt', '20170504172129_11111111111111_userCardPhotoF.txt', '1', '1', '0', '2017-05-12 11:13:05');
INSERT INTO `uim` VALUES ('20', '11', '11111111111111', '11111', '20170505085549_11111111111111_cardPhotoFrontF.txt', '20170505085549_11111111111111_cardPhotoBackF.txt', '20170505085549_11111111111111_userCardVoideoF.txt', '20170505085549_11111111111111_userCardPhotoF.txt', '1', '1', '0', '2017-05-12 11:13:05');
INSERT INTO `uim` VALUES ('21', '12', '11111111111112', '121211', '20170505142935_11111111111112_cardPhotoFrontF.txt', '20170505142935_11111111111112_cardPhotoBackF.txt', '20170505142935_11111111111112_userCardVoideoF.txt', '20170505142935_11111111111112_userCardPhotoF.txt', '1', '1', '0', '2017-05-12 11:13:05');
INSERT INTO `uim` VALUES ('22', '11', '11111111111112', '1111', '20170511170511_11111111111112_cardPhotoFrontF.txt', '20170511170511_11111111111112_cardPhotoBackF.txt', '20170511170511_11111111111112_userCardVoideoF.txt', '20170511170511_11111111111112_userCardPhotoF.txt', '1', '1', '0', '2017-05-12 11:13:05');
INSERT INTO `uim` VALUES ('23', '11', '11111111111112', '1111', '20170511170747_11111111111112_cardPhotoFrontF.txt', '20170511170747_11111111111112_cardPhotoBackF.txt', '20170511170747_11111111111112_userCardVoideoF.txt', '20170511170747_11111111111112_userCardPhotoF.txt', '1', '1', '0', '2017-05-12 11:13:05');
INSERT INTO `uim` VALUES ('24', '11', '11111111111112', '1111', '20170511170922_11111111111112_cardPhotoFrontF.txt', '20170511170922_11111111111112_cardPhotoBackF.txt', '20170511170922_11111111111112_userCardVoideoF.txt', '20170511170922_11111111111112_userCardPhotoF.txt', '1', '1', '0', '2017-05-12 11:13:05');
INSERT INTO `uim` VALUES ('25', '111', '12111111111111', '1212', '20170511171000_12111111111111_cardPhotoFrontF.txt', '20170511171000_12111111111111_cardPhotoBackF.txt', '20170511171000_12111111111111_userCardVoideoF.txt', '20170511171000_12111111111111_userCardPhotoF.txt', '1', '1', '0', '2017-05-12 11:13:05');
INSERT INTO `uim` VALUES ('26', '111', '12111111111111', '1212', '20170511171034_12111111111111_cardPhotoFrontF.txt', '20170511171034_12111111111111_cardPhotoBackF.txt', '20170511171034_12111111111111_userCardVoideoF.txt', '20170511171034_12111111111111_userCardPhotoF.txt', '1', '1', '0', '2017-05-12 11:13:05');
INSERT INTO `uim` VALUES ('27', '111', '11111111111112', '12222', '20170511171331_11111111111112_cardPhotoFrontF.txt', '20170511171331_11111111111112_cardPhotoBackF.txt', '20170511171331_11111111111112_userCardVoideoF.txt', '20170511171331_11111111111112_userCardPhotoF.txt', '1', '1', '0', '2017-05-12 11:13:05');
INSERT INTO `uim` VALUES ('28', '111', '11111111111112', '12222', '20170511171409_11111111111112_cardPhotoFrontF.txt', '20170511171409_11111111111112_cardPhotoBackF.txt', '20170511171409_11111111111112_userCardVoideoF.txt', '20170511171409_11111111111112_userCardPhotoF.txt', '1', '1', '0', '2017-05-12 11:13:05');
INSERT INTO `uim` VALUES ('32', '张三', '11111111111111', '111231123', '20170512114819_11111111111111_cardPhotoFrontF.txt', '20170512114819_11111111111111_cardPhotoBackF.txt', '20170512114819_11111111111111_userCardVoideoF.txt', '20170512114819_11111111111111_userCardPhotoF.txt', '1', '1', '0', '2017-05-12 11:48:19');

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
INSERT INTO `user` VALUES ('1', 'admin', '123456', '1', null, null, '0');
