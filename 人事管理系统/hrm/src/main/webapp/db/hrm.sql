/*
Navicat MySQL Data Transfer

Source Server         : wes
Source Server Version : 50543
Source Host           : localhost:3306
Source Database       : hrm

Target Server Type    : MYSQL
Target Server Version : 50543
File Encoding         : 65001

Date: 2020-04-11 16:11:16
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `dept_inf`
-- ----------------------------
DROP TABLE IF EXISTS `dept_inf`;
CREATE TABLE `dept_inf` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `REMARK` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept_inf
-- ----------------------------
INSERT INTO `dept_inf` VALUES ('1', '技术部', '技术部');
INSERT INTO `dept_inf` VALUES ('2', '运营部', '运营部');
INSERT INTO `dept_inf` VALUES ('3', '财务部', '财务部');
INSERT INTO `dept_inf` VALUES ('5', '总公办', '总公办');
INSERT INTO `dept_inf` VALUES ('6', '市场部', '市场部');
INSERT INTO `dept_inf` VALUES ('7', '教学部', '教学部');
INSERT INTO `dept_inf` VALUES ('8', '武装部', '武装部');
INSERT INTO `dept_inf` VALUES ('9', '策划部', '策划部');
INSERT INTO `dept_inf` VALUES ('10', '组织部', '组织部');
INSERT INTO `dept_inf` VALUES ('11', '心理部', '心理部');
INSERT INTO `dept_inf` VALUES ('12', '运营部2', '运营部2');
INSERT INTO `dept_inf` VALUES ('13', '运营部3', '运营部3');
INSERT INTO `dept_inf` VALUES ('14', '运营部4', '运营部4');
INSERT INTO `dept_inf` VALUES ('15', '运营部5', '运营部5');
INSERT INTO `dept_inf` VALUES ('16', '运营部6', '运营部6');
INSERT INTO `dept_inf` VALUES ('17', '技术部2', '技术部2');
INSERT INTO `dept_inf` VALUES ('21', '李四', '22333');
INSERT INTO `dept_inf` VALUES ('22', '李四d', 'dd');

-- ----------------------------
-- Table structure for `document_inf`
-- ----------------------------
DROP TABLE IF EXISTS `document_inf`;
CREATE TABLE `document_inf` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) NOT NULL,
  `filename` varchar(300) NOT NULL,
  `REMARK` varchar(300) DEFAULT NULL,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_DOCUMENT_USER` (`USER_ID`),
  CONSTRAINT `document_inf_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user_inf` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document_inf
-- ----------------------------
INSERT INTO `document_inf` VALUES ('1', '安师', '安师.jpg', '111', '2020-03-24 19:27:18', '2');
INSERT INTO `document_inf` VALUES ('2', '软件1', '1586591060415-error.png', '软件软件软件软件软件', '2020-03-24 19:27:44', '3');
INSERT INTO `document_inf` VALUES ('3', '四级', '四级.jpg', '333', '2020-03-24 19:28:09', '1');
INSERT INTO `document_inf` VALUES ('4', '111', '111.jpg', '11111', '2020-03-25 12:16:29', '3');
INSERT INTO `document_inf` VALUES ('5', '222', '22.png', '22222', '2020-03-25 12:16:44', '1');
INSERT INTO `document_inf` VALUES ('6', '333', '33.png', '33333', '2020-03-25 12:16:59', '3');
INSERT INTO `document_inf` VALUES ('7', '444', '44.jpg', '44444', '2020-03-25 12:17:24', '4');
INSERT INTO `document_inf` VALUES ('8', '555', '55.jpg', '55555', '2020-03-25 12:17:37', '5');
INSERT INTO `document_inf` VALUES ('9', '公告2', '1585462067075-23.png', '2223222', '2020-03-25 13:27:32', '1');
INSERT INTO `document_inf` VALUES ('10', '公告33', '1.2.jpg', '333', '2020-03-25 13:29:14', '1');
INSERT INTO `document_inf` VALUES ('11', '公告77', '1.3.jpg', '77', '2020-03-25 13:31:32', '1');
INSERT INTO `document_inf` VALUES ('14', '444', '1585467670115-操作系统作业.png', '444', '2020-03-25 13:53:20', '1');
INSERT INTO `document_inf` VALUES ('15', '公告2', '1585115734757-2.2.3.jpg', '2222', '2020-03-25 13:55:34', '1');
INSERT INTO `document_inf` VALUES ('16', '公告3333', '1585115819649-MC张凯 - 樱花树下的约定.mp3', '3232333', '2020-03-25 13:56:59', '1');

-- ----------------------------
-- Table structure for `employee_inf`
-- ----------------------------
DROP TABLE IF EXISTS `employee_inf`;
CREATE TABLE `employee_inf` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEPT_ID` int(11) NOT NULL,
  `JOB_ID` int(11) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `CARD_ID` varchar(18) NOT NULL,
  `ADDRESS` varchar(50) NOT NULL,
  `POST_CODE` varchar(50) DEFAULT NULL,
  `TEL` varchar(16) DEFAULT NULL,
  `PHONE` varchar(11) NOT NULL,
  `QQ_NUM` varchar(10) DEFAULT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `SEX` int(11) NOT NULL DEFAULT '1',
  `PARTY` varchar(10) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `RACE` varchar(100) DEFAULT NULL,
  `EDUCATION` varchar(10) DEFAULT NULL,
  `SPECIALITY` varchar(20) DEFAULT NULL,
  `HOBBY` varchar(100) DEFAULT NULL,
  `REMARK` varchar(500) DEFAULT NULL,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `FK_EMP_DEPT` (`DEPT_ID`),
  KEY `FK_EMP_JOB` (`JOB_ID`),
  CONSTRAINT `employee_inf_ibfk_1` FOREIGN KEY (`DEPT_ID`) REFERENCES `dept_inf` (`ID`),
  CONSTRAINT `employee_inf_ibfk_2` FOREIGN KEY (`JOB_ID`) REFERENCES `job_inf` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_inf
-- ----------------------------
INSERT INTO `employee_inf` VALUES ('1', '1', '3', '爱丽丝', '410401199401051120', '广州天河', '510000', '020-77777777', '13902001111', '367500662', '251425887@qq.com', '2', '党员', '1980-01-01 00:00:00', '满', '本科', '美声', '唱歌', '四大天王', '2016-03-14 11:35:18');
INSERT INTO `employee_inf` VALUES ('2', '2', '1', '杰克', '410404199010051322', '43234', '42427424', '42242', '4247242', '42424', '251425887@qq.com', '2', null, null, null, null, null, null, null, '2016-03-14 11:35:18');
INSERT INTO `employee_inf` VALUES ('3', '1', '2', 'bb', '432801197711251038', '广州', '510000', '020-99999999', '13907351532', '36750064', '36750064@qq.com', '1', '党员', '1977-11-25 00:00:00', '汉', '本科', '计算机', '爬山', '无', '2016-07-14 09:54:52');
INSERT INTO `employee_inf` VALUES ('4', '2', '3', '111', '11111', '11111', '11111', '111111', '111111', '11111', '1111111@', '2', '党员', '2020-03-14 16:08:04', '汉', '硕士', null, 'rap', null, '2020-03-15 16:07:57');
INSERT INTO `employee_inf` VALUES ('5', '3', '3', '2222', '222222222222222222', '2222', '222222', '2222222', '222222', '2222222', '22222222222222@qq.com', '1', '22', '2020-03-08 18:09:50', '汉', '22', '22', '22', '222', '2020-03-15 18:10:03');
INSERT INTO `employee_inf` VALUES ('7', '2', '6', '44', '444444444444444444', '4444444', '444440', '020-4444444', '15144444444', '444444444', '4444@qq.com', '2', '444', '2020-03-05 00:00:00', '44', '44', '44', '44', '44', '2020-03-15 18:13:48');
INSERT INTO `employee_inf` VALUES ('8', '1', '4', '冷潇', '402403199902655502', '安阳师范学院文明大道265号', '102364', '0102354568', '15993259852', '2222222', '2636742898@qq.com', '1', '党员', '2020-03-10 00:00:00', '汉', '本科', '软件工程', 'rap', '加油', '2020-03-15 21:29:59');
INSERT INTO `employee_inf` VALUES ('9', '12', '5', '林', '402403199902655502', '安阳师范学院文明大道265号', '111111', '0102020321', '15145678901', '111111', '2636742898@qq.com', '1', '额', '2020-03-12 00:00:00', '1', '我', '111', '1', '1', '2020-03-15 21:39:53');
INSERT INTO `employee_inf` VALUES ('10', '13', '2', '李四', '402403199902655502', '安阳师范学院文明大道265号', '333333', '010993982595', '15993021035', '3333333', '2636742898@qq.com', '2', '3', '2020-03-10 00:00:00', '3', '发', '3', '3', '3', '2020-03-15 21:44:57');

-- ----------------------------
-- Table structure for `job_inf`
-- ----------------------------
DROP TABLE IF EXISTS `job_inf`;
CREATE TABLE `job_inf` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `REMARK` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job_inf
-- ----------------------------
INSERT INTO `job_inf` VALUES ('1', '职员', '职员123');
INSERT INTO `job_inf` VALUES ('2', 'Java开发工程师', 'Java开发工程师');
INSERT INTO `job_inf` VALUES ('3', 'Java中级开发工程师', 'Java中级开发工程师');
INSERT INTO `job_inf` VALUES ('4', 'Java高级开发工程师', 'Java高级开发工程师');
INSERT INTO `job_inf` VALUES ('5', '系统管理员', '系统管理员');
INSERT INTO `job_inf` VALUES ('6', '架构师', '架构师');
INSERT INTO `job_inf` VALUES ('7', '主管', '主管');
INSERT INTO `job_inf` VALUES ('8', '经理', '经理123');
INSERT INTO `job_inf` VALUES ('10', '总经理1', '总经理1');

-- ----------------------------
-- Table structure for `notice_inf`
-- ----------------------------
DROP TABLE IF EXISTS `notice_inf`;
CREATE TABLE `notice_inf` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) NOT NULL,
  `CONTENT` text NOT NULL,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_NOTICE_USER` (`USER_ID`),
  CONSTRAINT `notice_inf_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user_inf` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice_inf
-- ----------------------------
INSERT INTO `notice_inf` VALUES ('19', '公告1', '疫情严重，推迟开学', '2020-02-26 18:31:01', '7');
INSERT INTO `notice_inf` VALUES ('20', '公告2', '公告2公告2公告2', '2020-03-22 22:00:37', '1');
INSERT INTO `notice_inf` VALUES ('21', '公告33', '公告333333333', '2020-03-22 22:00:48', '2');
INSERT INTO `notice_inf` VALUES ('23', '公告5', '公告5公告5公告5', '2020-03-22 22:01:09', '4');
INSERT INTO `notice_inf` VALUES ('24', '公告66', '公告66666', '2020-03-22 22:01:47', '5');
INSERT INTO `notice_inf` VALUES ('26', '放假', '放假放假放假', '2020-03-22 22:16:44', '2');
INSERT INTO `notice_inf` VALUES ('27', '考试', '考试考试考试', '2020-03-22 22:16:56', '3');
INSERT INTO `notice_inf` VALUES ('32', '4444444444444', '4444444444444', '2020-03-23 10:27:04', '1');

-- ----------------------------
-- Table structure for `user_inf`
-- ----------------------------
DROP TABLE IF EXISTS `user_inf`;
CREATE TABLE `user_inf` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(20) NOT NULL,
  `PASSWORD` varchar(16) NOT NULL,
  `STATUS` int(11) NOT NULL DEFAULT '1',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_inf
-- ----------------------------
INSERT INTO `user_inf` VALUES ('1', 'admin', '123456', '2', '2016-03-12 09:34:28', '超级管理员');
INSERT INTO `user_inf` VALUES ('2', '111111', '111111', '1', '2020-02-23 13:01:27', '张三');
INSERT INTO `user_inf` VALUES ('3', '222222', '222222', '2', '2020-02-23 13:01:41', '张三三');
INSERT INTO `user_inf` VALUES ('4', '333333', '333333', '1', '2020-02-23 13:01:51', '张1三');
INSERT INTO `user_inf` VALUES ('5', '555555', '55555', '1', '2020-02-23 13:04:05', '张三1');
INSERT INTO `user_inf` VALUES ('6', '666666', '66666', '1', '2020-02-23 14:38:25', '李四');
INSERT INTO `user_inf` VALUES ('7', '777777', '77777', '1', '2020-02-23 15:05:03', '李三');
INSERT INTO `user_inf` VALUES ('10', '111', '66666', '1', '2020-03-02 10:45:48', 'admin');
