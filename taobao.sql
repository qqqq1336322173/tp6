/*
 Navicat Premium Data Transfer

 Source Server         : hy2016
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : taobao

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 27/12/2020 23:03:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for taobao_address
-- ----------------------------
DROP TABLE IF EXISTS `taobao_address`;
CREATE TABLE `taobao_address`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `address_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '默认为0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index`(`address_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for taobao_admin
-- ----------------------------
DROP TABLE IF EXISTS `taobao_admin`;
CREATE TABLE `taobao_admin`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `aname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `join_time` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_aname`(`aname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of taobao_admin
-- ----------------------------
INSERT INTO `taobao_admin` VALUES (1, 'admin', '14e1b600b1fd579f47433b88e8d85291', 1608554388);

-- ----------------------------
-- Table structure for taobao_user
-- ----------------------------
DROP TABLE IF EXISTS `taobao_user`;
CREATE TABLE `taobao_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `user_telephone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机',
  `user_pwd` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `user_head` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `user_nick` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `user_true_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `user_sex` tinyint(255) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0:保密,1:男,:2:女',
  `user_habitation` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '居住地',
  `user_hometown` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '家乡',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_user`(`user_name`) USING BTREE,
  INDEX `index_users`(`user_email`, `user_telephone`, `user_pwd`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for checkallstudentexam
-- ----------------------------
DROP VIEW IF EXISTS `checkallstudentexam`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `checkallstudentexam` AS select `exam_stu_result`.`student_id` AS `student_id`,`exam_stu_result`.`resTotal` AS `resTotal`,`exam_stu_result`.`verify` AS `verify`,`exam_student`.`glass_id` AS `glass_id`,`exam_stu_result`.`id` AS `id` from (`exam_stu_result` left join `exam_student` on((`exam_stu_result`.`student_id` = `exam_student`.`id`)));

SET FOREIGN_KEY_CHECKS = 1;
