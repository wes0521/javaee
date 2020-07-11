/*
Navicat MySQL Data Transfer

Source Server         : wes
Source Server Version : 50543
Source Host           : localhost:3306
Source Database       : sdm

Target Server Type    : MYSQL
Target Server Version : 50543
File Encoding         : 65001

Date: 2019-12-31 00:00:37
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
  `ab_time` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `wr_person` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ab_id`),
  KEY `sno` (`st_sno`),
  CONSTRAINT `st1_sno` FOREIGN KEY (`st_sno`) REFERENCES `student` (`st_sno`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of absence
-- ----------------------------
INSERT INTO `absence` VALUES ('26', '174804002', '刘青闯', '男', '17级Java三班', '南苑402', '2019-01-01', 'admin');
INSERT INTO `absence` VALUES ('27', '174804003', '杨成刚', '男', '17级Java三班', '南苑403', '2019-01-01', '222');
INSERT INTO `absence` VALUES ('28', '174804004', '谢松成', '男', '17级Java三班', '南苑404', '2019-01-01', '222');
INSERT INTO `absence` VALUES ('30', '174804006', '张三', '男', '17级Java三班', '南苑406', '2019-01-01', '小红');
INSERT INTO `absence` VALUES ('31', '174804007', '李四', '男', '17级Java三班', '南苑407', '2019-01-01', '小红');
INSERT INTO `absence` VALUES ('32', '174804008', '王五', '男', '17级Java三班', '南苑408', '2019-01-01', '111');
INSERT INTO `absence` VALUES ('33', '174804009', '赵六', '男', '17级Java三班', '南苑409', '2019-01-01', '111');
INSERT INTO `absence` VALUES ('34', '174804010', '小明', '男', '17级Java三班', '南苑410', '2019-01-01', '小红');
INSERT INTO `absence` VALUES ('43', '174804001', '王恩帅', '男', '17Java', '4511', '2019-12-24', 'admin');

-- ----------------------------
-- Table structure for `announcement`
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `anno_id` int(11) NOT NULL AUTO_INCREMENT,
  `anno_content` text,
  `anno_data` date DEFAULT NULL,
  PRIMARY KEY (`anno_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES ('1', '脚太臭', '2019-12-24');
INSERT INTO `announcement` VALUES ('2', '脚太香', '2019-12-24');
INSERT INTO `announcement` VALUES ('3', '是内乱', '2019-12-24');
INSERT INTO `announcement` VALUES ('19', '产业园管', '2018-08-08');
INSERT INTO `announcement` VALUES ('24', '产业园管', '2018-08-08');
INSERT INTO `announcement` VALUES ('32', '按照国家规定，每两周放假一次，8号下午至10号为学校的放假时间，根据当地人生活习俗，为了让大家过好传统节日二月二，学校适当调整到11号下午至14号，15号上午照常上课', '2019-12-30');

-- ----------------------------
-- Table structure for `house`
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `house_num` int(255) NOT NULL,
  `house_floor` int(255) NOT NULL,
  PRIMARY KEY (`house_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of house
-- ----------------------------

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `ma_id` int(255) NOT NULL,
  `ma_name` varchar(255) NOT NULL,
  `ma_username` varchar(255) NOT NULL,
  `ma_password` varchar(255) NOT NULL,
  `ma_hs-num` varchar(255) NOT NULL,
  `ma_phone` varchar(255) NOT NULL,
  PRIMARY KEY (`ma_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of manager
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

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
INSERT INTO `repairs` VALUES ('40', '174804001', '王恩帅', '1wss', '123', '2018-12-20', '南苑401');

-- ----------------------------
-- Table structure for `st_in_out`
-- ----------------------------
DROP TABLE IF EXISTS `st_in_out`;
CREATE TABLE `st_in_out` (
  `st_id` int(255) NOT NULL,
  `st_name` varchar(255) NOT NULL,
  `house_num` varchar(255) NOT NULL,
  `in_time` time NOT NULL,
  `out_time` time NOT NULL,
  `out_house_num` int(255) NOT NULL,
  PRIMARY KEY (`st_id`,`in_time`,`out_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of st_in_out
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin');
INSERT INTO `user` VALUES ('2', 'student', '123456');
INSERT INTO `user` VALUES ('3', '111', '111');
INSERT INTO `user` VALUES ('5', '222', '222');
INSERT INTO `user` VALUES ('6', '333', '333');
INSERT INTO `user` VALUES ('8', '444', '444');
INSERT INTO `user` VALUES ('10', '5555', '555');

-- ----------------------------
-- Table structure for `words`
-- ----------------------------
DROP TABLE IF EXISTS `words`;
CREATE TABLE `words` (
  `wo_id` int(11) NOT NULL AUTO_INCREMENT,
  `wo_sno` int(11) DEFAULT NULL,
  `wo_name` varchar(255) DEFAULT NULL,
  `wo_address` varchar(255) DEFAULT NULL,
  `wo_content` varchar(255) DEFAULT NULL,
  `wo_date` date DEFAULT NULL,
  PRIMARY KEY (`wo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of words
-- ----------------------------
INSERT INTO `words` VALUES ('1', '174804312', '刘青闯', '403', '啦啦啦', '2019-12-27');
INSERT INTO `words` VALUES ('2', '123', '123', '312', '321', '2020-01-15');
INSERT INTO `words` VALUES ('3', '3', '312', '312', '231', '2019-12-02');
INSERT INTO `words` VALUES ('4', '2341', '123', '123', '32', '2019-12-27');
INSERT INTO `words` VALUES ('6', '1423', '1243', '1234', '1234', '2019-12-01');
INSERT INTO `words` VALUES ('8', '132', '123`', '132`q', 'rqwe', '2019-12-11');
INSERT INTO `words` VALUES ('9', '312', '13', '132', '312', '2019-12-27');
INSERT INTO `words` VALUES ('10', '4', '123', '123', '132', '2019-12-03');
INSERT INTO `words` VALUES ('11', '1234', '2341', '1234', '1234', '2019-12-09');
INSERT INTO `words` VALUES ('12', '3213213', '321321', '3321321', '321321321', '2019-12-28');
INSERT INTO `words` VALUES ('13', '321321311', '321321111', '321312', '33213', '2019-12-28');
INSERT INTO `words` VALUES ('14', '32132131', '123', '321312', '33213', '2019-12-28');
INSERT INTO `words` VALUES ('15', '213', '321321', '321312', '33213', '2019-12-28');
INSERT INTO `words` VALUES ('16', '213', '123', '321312', '33213', '2019-12-28');
INSERT INTO `words` VALUES ('17', '444', '444', '444', '4444', '2019-12-03');
INSERT INTO `words` VALUES ('18', '777', '77', '7', '7', '2019-12-02');
