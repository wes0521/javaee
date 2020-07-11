/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : sdm

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-01-03 15:04:58
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `absence`
-- ----------------------------
DROP TABLE IF EXISTS `absence`;
CREATE TABLE `absence` (
  `ab_id` int(20) NOT NULL AUTO_INCREMENT,
  `st_sno` varchar(20) NOT NULL,
  `st_name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `st_sex` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `st_class` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `house_num` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ab_time` varchar(20) CHARACTER SET utf8 NOT NULL,
  `wr_person` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ab_id`,`ab_time`),
  KEY `sno` (`st_sno`),
  CONSTRAINT `st1_sno` FOREIGN KEY (`st_sno`) REFERENCES `student` (`st_sno`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of absence
-- ----------------------------
INSERT INTO `absence` VALUES ('26', '174804002', '刘青闯', '男', '17级Java三班', '南苑402', '2019-12-19', 'admin');
INSERT INTO `absence` VALUES ('27', '174804003', '杨成刚', '男', '17级Java三班', '南苑403', '2019-01-01', '222');
INSERT INTO `absence` VALUES ('28', '174804004', '谢松成', '男', '17级Java三班', '南苑404', '2019-01-01', '222');
INSERT INTO `absence` VALUES ('29', '174804005', '刘梓涵', '男', '17级Java三班', '南苑405', '2019-01-01', '小红');
INSERT INTO `absence` VALUES ('30', '174804006', '张三', '男', '17级Java三班', '南苑406', '2019-01-01', '小红');
INSERT INTO `absence` VALUES ('31', '174804007', '李四', '男', '17级Java三班', '南苑407', '2019-01-01', '小红');
INSERT INTO `absence` VALUES ('32', '174804008', '王五', '男', '17级Java三班', '南苑408', '2019-01-01', '111');
INSERT INTO `absence` VALUES ('33', '174804009', '赵六', '男', '17级Java三班', '南苑409', '2019-01-01', '111');
INSERT INTO `absence` VALUES ('34', '174804010', '小明', '男', '17级Java三班', '南苑410', '2019-01-01', '小红');

-- ----------------------------
-- Table structure for `announcement`
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `anno_id` int(11) NOT NULL AUTO_INCREMENT,
  `anno_name` varchar(255) DEFAULT NULL,
  `anno_content` text,
  `anno_data` date DEFAULT NULL,
  PRIMARY KEY (`anno_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES ('1', '元旦放假的通知', '元旦放假的通知', '2019-12-12');
INSERT INTO `announcement` VALUES ('2', '中秋节放假的通知', '中秋节放假的通知222', '2019-12-24');
INSERT INTO `announcement` VALUES ('3', '415脚太臭的通知', '415脚太臭的通知', '2019-12-24');
INSERT INTO `announcement` VALUES ('19', '403脚很香的通知', '403脚很香的通知', '2018-08-08');
INSERT INTO `announcement` VALUES ('24', '违纪通知', '违纪通知123456', '2018-08-08');
INSERT INTO `announcement` VALUES ('35', '放假时间', '1月8号放假', '2019-12-31');
INSERT INTO `announcement` VALUES ('36', '过年通知', '祝大家过年好', '2019-12-30');
INSERT INTO `announcement` VALUES ('38', '一起来跨年', '跨年快乐', '2019-12-31');
INSERT INTO `announcement` VALUES ('39', '快放假了', '啦啦啦啦', '2019-12-31');
INSERT INTO `announcement` VALUES ('42', 'lalalalal', 'lalalallala5555555555', '2019-12-04');
INSERT INTO `announcement` VALUES ('44', '111', '111', '2019-12-13');

-- ----------------------------
-- Table structure for `repairs`
-- ----------------------------
DROP TABLE IF EXISTS `repairs`;
CREATE TABLE `repairs` (
  `rid` int(20) NOT NULL AUTO_INCREMENT,
  `st_sno` varchar(20) NOT NULL,
  `st_sname` varchar(20) DEFAULT NULL,
  `r_name` varchar(255) DEFAULT NULL,
  `r_case` varchar(255) DEFAULT NULL,
  `r_time` date DEFAULT NULL,
  `house_num` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of repairs
-- ----------------------------
INSERT INTO `repairs` VALUES ('25', '174804001', '王恩帅', '门窗', '门窗损坏', '2019-12-01', '南苑401');
INSERT INTO `repairs` VALUES ('26', '174804002', '刘青闯', '窗户', '窗户破损', '2019-12-01', '南苑402');
INSERT INTO `repairs` VALUES ('27', '174804003', '杨成刚', '门窗', '门窗损坏', '2019-12-01', '南苑403');
INSERT INTO `repairs` VALUES ('28', '174804004', '谢松成', '床铺', '床破损坏', '2019-12-01', '南苑404');
INSERT INTO `repairs` VALUES ('29', '174804005', '刘梓涵', '天花板', '天花板损坏', '2019-12-01', '南苑405');
INSERT INTO `repairs` VALUES ('30', '174804006', '张三', '门把手', '门把手损坏', '2019-12-01', '南苑406');
INSERT INTO `repairs` VALUES ('31', '174804007', '李四', '凳子', '凳子损坏', '2019-12-01', '南苑407');
INSERT INTO `repairs` VALUES ('32', '174804008', '王五', '桌子', '桌子损坏', '2019-12-01', '南苑408');
INSERT INTO `repairs` VALUES ('33', '174804009', '赵六', '开关', '开关损坏', '2019-12-01', '南苑409');
INSERT INTO `repairs` VALUES ('34', '174804010', '小明', '窗户', '窗户损坏', '2019-12-01', '南苑410');
INSERT INTO `repairs` VALUES ('41', '174804002', '刘青闯', 'ds', 'dfsdf', '2019-12-13', '南苑402');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `st_id` int(20) NOT NULL AUTO_INCREMENT,
  `st_sno` varchar(20) NOT NULL,
  `st_name` varchar(20) DEFAULT NULL,
  `st_password` varchar(255) DEFAULT NULL,
  `st_sex` varchar(255) DEFAULT NULL,
  `st_col` varchar(255) DEFAULT NULL,
  `st_class` varchar(255) DEFAULT NULL,
  `st_phone` varchar(255) DEFAULT NULL,
  `house_num` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`st_id`),
  KEY `st_name` (`st_name`),
  KEY `house` (`house_num`(191)) USING BTREE,
  KEY `sno` (`st_sno`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('25', '174804001', '王恩帅', '123456', '男', '软件学院', '17级Java三班', '123456789', '南苑401');
INSERT INTO `student` VALUES ('26', '174804002', '刘青闯', '123456', '男', '软件学院', '17级Java三班', '123456789', '南苑402');
INSERT INTO `student` VALUES ('27', '174804003', '杨成刚', '123456', '男', '软件学院', '17级Java三班', '123456789', '南苑403');
INSERT INTO `student` VALUES ('28', '174804004', '谢松成', '123456', '男', '软件学院', '17级Java三班', '123456789', '南苑404');
INSERT INTO `student` VALUES ('29', '174804005', '刘梓涵', '123456', '男', '软件学院', '17级java三班', '123456789', '南苑405');
INSERT INTO `student` VALUES ('30', '174804006', '张三', '123456', '男', '软件学院', '17级Java三班', '123456789', '南苑406');
INSERT INTO `student` VALUES ('31', '174804007', '李四', '123456', '男', '软件学院', '17级Java三班', '123456789', '南苑407');
INSERT INTO `student` VALUES ('32', '174804008', '王五', '123456', '男', '软件学院', '17级Java三班', '123456789', '南苑408');
INSERT INTO `student` VALUES ('33', '174804009', '赵六', '123456', '男', '软件学院', '17级Java三班', '123456789', '南苑409');
INSERT INTO `student` VALUES ('34', '174804010', '小明', '123456', '男', '软件学院', '18级Java三班', '123456789', '南苑410');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin');
INSERT INTO `user` VALUES ('2', 'student', '123456');
INSERT INTO `user` VALUES ('3', '111', '111');
INSERT INTO `user` VALUES ('5', '222', '222');
INSERT INTO `user` VALUES ('6', '333', '333');
