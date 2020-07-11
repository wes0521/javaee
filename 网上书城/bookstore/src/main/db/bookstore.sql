/*
Navicat MySQL Data Transfer

Source Server         : wes
Source Server Version : 50543
Source Host           : localhost:3306
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 50543
File Encoding         : 65001

Date: 2020-06-03 12:17:29
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `n_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '公共告1', '11111111111', '2018-04-05 00:00:00');
INSERT INTO `notice` VALUES ('2', '公告2', '本周图书销售量再创新高', '2018-04-14 15:40:34');
INSERT INTO `notice` VALUES ('3', '公告3', '你好吗', '2018-04-14 15:42:13');
INSERT INTO `notice` VALUES ('4', '公告4', '儿童袜无无无无无无无无拖无无无无无', '2018-04-14 15:43:34');
INSERT INTO `notice` VALUES ('7', '3333', '33333333333333', '2020-05-27 16:59:49');
INSERT INTO `notice` VALUES ('8', '444', '444444445555566', '2020-05-27 17:33:52');
INSERT INTO `notice` VALUES ('10', '7', '7777y8888888888', '2020-06-03 11:32:31');
INSERT INTO `notice` VALUES ('12', '测试', '测试测试测试测试测试测试', '2020-06-03 11:33:26');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `order_id` varchar(100) NOT NULL DEFAULT '',
  `product_id` varchar(100) NOT NULL DEFAULT '',
  `buynum` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('18891265-b9f8-48b5-a6d0-14b598c045f9', '1', '2');
INSERT INTO `orderitem` VALUES ('2d8d907f-ab6f-4124-abcb-bb5729c1f9b4', '3', '10');
INSERT INTO `orderitem` VALUES ('2f7043b8-415e-41e2-93da-f3a3aebba20a', '3', '1');
INSERT INTO `orderitem` VALUES ('4f9f6e39-ce4f-4ed5-b5e9-1306d2757bf3', '6', '4');
INSERT INTO `orderitem` VALUES ('564f0958-66ad-43ad-ab63-40185e7c95a8', '7', '3');
INSERT INTO `orderitem` VALUES ('57b5e2bf-caa6-4797-8b1a-a4cd178333dd', '1', '2');
INSERT INTO `orderitem` VALUES ('57b5e2bf-caa6-4797-8b1a-a4cd178333dd', '2', '1');
INSERT INTO `orderitem` VALUES ('57b5e2bf-caa6-4797-8b1a-a4cd178333dd', '6', '2');
INSERT INTO `orderitem` VALUES ('6d4c0827-161c-485a-a9a2-5a143da12f56', '6', '1');
INSERT INTO `orderitem` VALUES ('71f6936a-bc41-4191-87b4-cc21aab37f96', '6', '1');
INSERT INTO `orderitem` VALUES ('92f5e5eb-a85f-4801-b368-d5895d66e647', '6', '1');
INSERT INTO `orderitem` VALUES ('a7412132-8a31-4fa8-ac77-50a7095471c0', '2', '1');
INSERT INTO `orderitem` VALUES ('a89b1b6b-d874-4e8d-930a-98935c0c6ff4', '2', '3');
INSERT INTO `orderitem` VALUES ('c8651d74-820f-4c0a-84f3-dc2ea90ad9f0', '6', '4');
INSERT INTO `orderitem` VALUES ('ce8716a5-e615-48cc-af36-99b0409a998f', '8c0c5487-6008-40e4-bf85-a05c73ffccd3', '2');
INSERT INTO `orderitem` VALUES ('d44b1a93-aa94-454a-9934-1d07c751b89e', '4', '1');
INSERT INTO `orderitem` VALUES ('d45ac61d-2dbe-4a49-9617-d4ebe3a8c340', '1', '3');
INSERT INTO `orderitem` VALUES ('e9d583b2-7ed7-4006-80d2-9666024eddea', '3', '1');
INSERT INTO `orderitem` VALUES ('f5188291-3510-455b-a16b-54515cbe6e47', '6', '1');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(100) NOT NULL,
  `money` double DEFAULT NULL,
  `receiverAddress` varchar(255) DEFAULT NULL,
  `receiverName` varchar(20) DEFAULT NULL,
  `receiverPhone` varchar(20) DEFAULT NULL,
  `paystate` int(11) DEFAULT '0',
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('18891265-b9f8-48b5-a6d0-14b598c045f9', '64', '河南安阳', '安阳', '112233445566', '0', '2020-05-27 11:57:45', '36');
INSERT INTO `orders` VALUES ('2d8d907f-ab6f-4124-abcb-bb5729c1f9b4', '55', '河南商丘', '小红', '22222222', '1', '2020-05-06 16:34:29', '8');
INSERT INTO `orders` VALUES ('2f7043b8-415e-41e2-93da-f3a3aebba20a', '27.5', '河南安阳', '张三', '12245666', '0', '2020-06-02 12:06:30', '8');
INSERT INTO `orders` VALUES ('4f9f6e39-ce4f-4ed5-b5e9-1306d2757bf3', '95.2', '河南商丘', '张三1', '12245666', '1', '2020-05-06 16:34:31', '8');
INSERT INTO `orders` VALUES ('564f0958-66ad-43ad-ab63-40185e7c95a8', '84', '河南商丘', '商丘', '2222222', '1', '2020-05-27 12:16:40', '36');
INSERT INTO `orders` VALUES ('57b5e2bf-caa6-4797-8b1a-a4cd178333dd', '145.6', '河南商丘', '测试多本', '1111111', '0', '2020-05-28 23:02:18', '8');
INSERT INTO `orders` VALUES ('6d4c0827-161c-485a-a9a2-5a143da12f56', '47.6', '河南商丘', '张三', '12245666', '1', '2020-05-06 16:33:07', '8');
INSERT INTO `orders` VALUES ('a89b1b6b-d874-4e8d-930a-98935c0c6ff4', '102', '河南商丘', '小兰', '12245666', '1', '2020-06-03 09:51:43', '8');
INSERT INTO `orders` VALUES ('c8651d74-820f-4c0a-84f3-dc2ea90ad9f0', '95.2', '河南安阳', '张三', '111111', '0', '2020-06-01 16:03:42', '8');
INSERT INTO `orders` VALUES ('ce8716a5-e615-48cc-af36-99b0409a998f', '22', '河南安阳', '小红', '111111', '0', '2020-06-02 12:09:36', '8');
INSERT INTO `orders` VALUES ('d45ac61d-2dbe-4a49-9617-d4ebe3a8c340', '96', '河南商丘', '张三', '111111111111', '1', '2020-05-06 16:34:31', '8');
INSERT INTO `orders` VALUES ('f5188291-3510-455b-a16b-54515cbe6e47', '23.8', '河南商丘', '小红', '12245666', '0', '2020-05-27 12:13:43', '36');

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(40) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `pnum` int(11) DEFAULT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'java web', '32', '计算机', '6', '/productImg/10/5/36ee63bc-c251-49ce-9b9a-b5e1e2e75ec0.jpg', 'java webjava webjava webjava webjava webjava webjava web');
INSERT INTO `products` VALUES ('2', '时空穿行', '34', '科技', '0', '/productImg/11/4/d79dc124-de69-4b77-847e-bc461bfdb857.jpg', '时空穿行时空穿行时空穿行时空穿行');
INSERT INTO `products` VALUES ('3', '大勇和小花的欧洲日记', '27.5', '少儿', '13', '/productImg/12/1/986b5e98-ee73-4717-89fd-b6ac26a8dc2c.jpg', '大勇和小花的欧洲日记大勇和小花的欧洲日记大勇和小花的欧洲日记大勇和小花的欧洲日记大勇和小花的欧洲日记大勇和小花的欧洲日记');
INSERT INTO `products` VALUES ('4', 'Java基础入门', '38', '计算机', '6', '/productImg/12/14/a1ace169-b53a-41c6-bdea-000e5946b2a5.png', 'Java基础入门Java基础入门Java基础入门Java基础入门Java基础入门Java基础入门');
INSERT INTO `products` VALUES ('5', '别做正常的傻瓜', '19.5', '励志', '0', '/productImg/14/1/792116e7-6d83-4be4-b3e5-4dd11b0b4565.jpg', '别做正常的傻瓜别做正常的傻瓜别做正常的傻瓜别做正常的傻瓜');
INSERT INTO `products` VALUES ('6', '中国国家地理', '23.8', '社科', '5', '/productImg/2/0/2105fbe5-400f-4193-a7db-d7ebac389550.jpg', '中国国家地理中国国家地理中国国家地理中国国家地理中国国家地理');
INSERT INTO `products` VALUES ('7', '学会宽容', '28', '励志', '8', '/productImg/6/5/a2da626c-c72d-4972-83de-cf48405c5563.jpg', '学会宽容学会宽容学会宽容');
INSERT INTO `products` VALUES ('8c0c5487-6008-40e4-bf85-a05c73ffccd3', '11', '11', '原版', '9', '/productImg/f0942f25-e27e-4e57-a8f7-4ba0fd878391-1.png', '1111');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `introduce` varchar(100) DEFAULT NULL,
  `activeCode` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  `role` varchar(10) DEFAULT '普通用户',
  `registTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('8', 'abc', '111111', '女', '123@123.com', '123456', '', '38ea92ab-26c2-4725-aa73-b5e899e9767a', '1', '普通用户', '2020-05-28 13:14:01');
INSERT INTO `user` VALUES ('16', 'aaa', '111111', '男', 'yuyafangh@163.com', '', '', '9039c221-fef5-4f2a-b1b1-5f6944252cca', '1', '普通用户', '2018-04-15 22:50:35');
INSERT INTO `user` VALUES ('30', 'manager', '111111', '男', '731287448@qq.com', '111111', '111111', 'ef52474a-ddb4-4f01-b0c5-c0d15665f6a7', '0', '普通用户', '2020-04-08 17:12:12');
INSERT INTO `user` VALUES ('35', 'admin', '111111', '男', '2636742898@qq.com', '111111', '11111', 'c6633276-0311-4fe3-bb80-867dcdc99736', '0', '超级管理员', '2020-05-10 22:24:36');
INSERT INTO `user` VALUES ('36', 'wes', '111111', '男', 'wes2636742898@163.com', '111111', '1111', 'f8768dbe-1eb9-466b-b27d-c8be36cab465', '1', '普通用户', '2020-04-08 18:15:22');
