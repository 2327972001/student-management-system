/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50734
Source Host           : localhost:3306
Source Database       : fd_user

Target Server Type    : MYSQL
Target Server Version : 50734
File Encoding         : 65001

Date: 2021-11-11 20:45:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `sex` char(1) NOT NULL COMMENT '性别',
  `squad` varchar(100) NOT NULL COMMENT '班级',
  `teacher` char(1) NOT NULL COMMENT '1为老师、2为学生',
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '邹阳明', '2327972001', '123456', '男', '2135', '0');
INSERT INTO `user` VALUES ('2', '徐梦杰', '2486354871', '123456', '男', '2135', '0');
INSERT INTO `user` VALUES ('3', '陈鸿杰', '15951513133', '123456', '男', '2135', '0');
INSERT INTO `user` VALUES ('4', '油头', '1563052348', '123456', '男', '2135', '0');
INSERT INTO `user` VALUES ('5', '季美心', '26859402112', '123456', '女', '2135', '0');
INSERT INTO `user` VALUES ('6', '方卓旋', '2947632172', '123456', '女', '2135', '0');
INSERT INTO `user` VALUES ('15', '小红', '456789', '456789', '男', '2135', '0');
INSERT INTO `user` VALUES ('17', '小军', '3355691290', '123456', '男', '2135', '\0');
