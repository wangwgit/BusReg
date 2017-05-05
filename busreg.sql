/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50535
Source Host           : localhost:3306
Source Database       : busreg

Target Server Type    : MYSQL
Target Server Version : 50535
File Encoding         : 65001

Date: 2017-05-05 16:17:27
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `insertTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
