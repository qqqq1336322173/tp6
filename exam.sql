/*
 Navicat Premium Data Transfer

 Source Server         : hy2016
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : exam

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 27/12/2020 23:04:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for exam_admin
-- ----------------------------
DROP TABLE IF EXISTS `exam_admin`;
CREATE TABLE `exam_admin`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `aname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `join_time` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_aname`(`aname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_admin
-- ----------------------------
INSERT INTO `exam_admin` VALUES (1, 'admin', '14e1b600b1fd579f47433b88e8d85291', 1608554388);

-- ----------------------------
-- Table structure for exam_course
-- ----------------------------
DROP TABLE IF EXISTS `exam_course`;
CREATE TABLE `exam_course`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_cname`(`cname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_course
-- ----------------------------
INSERT INTO `exam_course` VALUES (5, 'C##');
INSERT INTO `exam_course` VALUES (3, 'Java');
INSERT INTO `exam_course` VALUES (1, 'JavaScript');
INSERT INTO `exam_course` VALUES (4, 'net');
INSERT INTO `exam_course` VALUES (2, 'php');

-- ----------------------------
-- Table structure for exam_dan_questions
-- ----------------------------
DROP TABLE IF EXISTS `exam_dan_questions`;
CREATE TABLE `exam_dan_questions`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` smallint(2) UNSIGNED NOT NULL,
  `join_time` int(10) UNSIGNED NOT NULL COMMENT '开始时间',
  `tao_id` int(11) UNSIGNED DEFAULT NULL COMMENT '套题id',
  `course_id` int(11) UNSIGNED DEFAULT NULL,
  `res` float(5, 2) UNSIGNED NOT NULL COMMENT '分数',
  `optionA` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '选项A',
  `optionB` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '选项B',
  `optionC` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '选项C',
  `optionD` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '选项D',
  `answer` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '0:\'A\',1:\'B\',2:\"C\",3:\'D\'',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '答案解析',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_subject`(`subject`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_dan_questions
-- ----------------------------
INSERT INTO `exam_dan_questions` VALUES (1, '数字转变为字符串的函数是', 1, 1596682214, 1, 1, 2.00, 'parseInt()', 'parseFloat( )', 'Number( )', 'toString()', '1', NULL);
INSERT INTO `exam_dan_questions` VALUES (2, '数组合并的函数是', 1, 1596682214, 1, 1, 2.00, 'array_merge()', 'array_push( )', 'push( )', 'toString()', '1', NULL);
INSERT INTO `exam_dan_questions` VALUES (3, '数组合并的函数是', 1, 1596682214, 1, 1, 2.00, 'array_merge()', 'array_push( )', 'push( )', 'toString()', '1', NULL);
INSERT INTO `exam_dan_questions` VALUES (4, '数字转变为字符串的函数是', 1, 1596682214, 2, 1, 2.00, 'parseInt()', 'parseFloat( )', 'Number( )', 'toString()', '1', NULL);
INSERT INTO `exam_dan_questions` VALUES (5, '数组合并的函数是', 1, 1596682214, 2, 1, 2.00, 'array_merge()', 'array_push( )', 'push( )', 'toString()', '1', NULL);
INSERT INTO `exam_dan_questions` VALUES (6, '数组合并的函数是', 1, 1596682214, 2, 1, 2.00, 'array_merge()', 'array_push( )', 'push( )', 'toString()', '1', NULL);
INSERT INTO `exam_dan_questions` VALUES (7, '数字转变为字符串的函数是', 1, 1596682214, NULL, NULL, 2.00, 'parseInt()', 'parseFloat( )', 'Number( )', 'toString()', '3', NULL);
INSERT INTO `exam_dan_questions` VALUES (8, '数组合并的函数是', 1, 1596682214, NULL, NULL, 2.00, 'array_merge()', 'array_push( )', 'push( )', 'toString()', '1', NULL);

-- ----------------------------
-- Table structure for exam_duo_questions
-- ----------------------------
DROP TABLE IF EXISTS `exam_duo_questions`;
CREATE TABLE `exam_duo_questions`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` smallint(2) UNSIGNED NOT NULL,
  `join_time` int(10) UNSIGNED NOT NULL,
  `course_id` int(11) UNSIGNED NOT NULL,
  `tao_id` int(11) UNSIGNED NOT NULL,
  `res` float(5, 2) UNSIGNED NOT NULL,
  `optionA` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optionB` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optionC` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optionD` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answer` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '0:\'A\',1:\'B\',2:\"C\",3:\'D\'',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '答案解析',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_subject`(`subject`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_duo_questions
-- ----------------------------
INSERT INTO `exam_duo_questions` VALUES (1, '如何判断一个数组是不是数组，用哪个函数', 2, 1596682214, 1, 1, 2.00, 'Array.splice()', 'Array.isArray()', 'Array.push()', 'Object.prototype.toString.call()', '1,2', NULL);
INSERT INTO `exam_duo_questions` VALUES (2, '如何判断一个数组是不是数组，用哪个函数', 2, 1596682214, 1, 1, 3.00, 'Array.splice1()', 'Array.isArray1()', 'Array.push1()', 'Object.prototype.toString.call1()', '1,2', NULL);
INSERT INTO `exam_duo_questions` VALUES (3, '如何判断一个数组是不是数组，用哪个函数', 2, 1596682214, 1, 2, 2.00, 'Array.splice()', 'Array.isArray()', 'Array.push()', 'Object.prototype.toString.call()', '1,2', NULL);
INSERT INTO `exam_duo_questions` VALUES (4, '如何判断一个数组是不是数组，用哪个函数', 2, 1596682214, 1, 2, 3.00, 'Array.splice1()', 'Array.isArray1()', 'Array.push1()', 'Object.prototype.toString.call1()', '1,2', NULL);

-- ----------------------------
-- Table structure for exam_glass
-- ----------------------------
DROP TABLE IF EXISTS `exam_glass`;
CREATE TABLE `exam_glass`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_gname`(`gname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_glass
-- ----------------------------
INSERT INTO `exam_glass` VALUES (1, '软件技术181');

-- ----------------------------
-- Table structure for exam_obj_questions
-- ----------------------------
DROP TABLE IF EXISTS `exam_obj_questions`;
CREATE TABLE `exam_obj_questions`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` smallint(2) UNSIGNED NOT NULL,
  `join_time` int(10) UNSIGNED NOT NULL,
  `course_id` int(11) UNSIGNED NOT NULL COMMENT '课程id',
  `tao_id` int(11) UNSIGNED NOT NULL COMMENT '套题id',
  `res` float(5, 2) UNSIGNED NOT NULL COMMENT '分数',
  `answer` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答案',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '答案解析',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_subject`(`subject`) USING BTREE,
  FULLTEXT INDEX `note_index`(`note`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_obj_questions
-- ----------------------------
INSERT INTO `exam_obj_questions` VALUES (1, '编写一段程序，让它10s后跳转到百度页面', 5, 1596682214, 1, 1, 8.00, 'function change(){\r\nvar str = ‘#’;\r\nvar color = Math.random();\r\ncolor = color.toString(12);\r\ncolor = color.substr(-6);\r\nstr += color;\r\ndocument.body.style.backgroundColor = str;\r\n}', '32');
INSERT INTO `exam_obj_questions` VALUES (2, '写一个轮播图', 5, 1596682214, 1, 1, 8.00, 'function change(){\r\nvar str = ‘#’;\r\nvar color = Math.random();\r\ncolor = color.toString(12);\r\ncolor = color.substr(-6);\r\nstr += color;\r\ndocument.body.style.backgroundColor = str;\r\n}', '22');

-- ----------------------------
-- Table structure for exam_pan_questions
-- ----------------------------
DROP TABLE IF EXISTS `exam_pan_questions`;
CREATE TABLE `exam_pan_questions`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` smallint(2) UNSIGNED NOT NULL,
  `join_time` int(10) UNSIGNED NOT NULL COMMENT '添加时间',
  `course_id` int(11) UNSIGNED NOT NULL,
  `tao_id` int(11) UNSIGNED NOT NULL,
  `res` float(5, 2) UNSIGNED NOT NULL COMMENT '分数',
  `answer` tinyint(1) UNSIGNED NOT NULL COMMENT '(0:true,1:false)',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '答案解析',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_subject`(`subject`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_pan_questions
-- ----------------------------
INSERT INTO `exam_pan_questions` VALUES (1, '计算机的硬件系统由控制器、显示器、打印机、主机、键盘组成', 3, 1596682214, 1, 1, 2.00, 1, NULL);
INSERT INTO `exam_pan_questions` VALUES (2, '计算机的硬件系统由控制器、显示器、打印机、主机、键盘组成是什么', 3, 1596682214, 1, 1, 2.00, 1, NULL);
INSERT INTO `exam_pan_questions` VALUES (3, '计算机的硬件系统由控制器、显示器、打印机、主机、键盘组成', 3, 1596682214, 1, 2, 2.00, 1, NULL);
INSERT INTO `exam_pan_questions` VALUES (4, '计算机的硬件系统由控制器、显示器、打印机、主机、键盘组成是什么', 3, 1596682214, 1, 2, 7.00, 1, NULL);

-- ----------------------------
-- Table structure for exam_stu_course
-- ----------------------------
DROP TABLE IF EXISTS `exam_stu_course`;
CREATE TABLE `exam_stu_course`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int(11) UNSIGNED NOT NULL,
  `course_id` int(11) UNSIGNED NOT NULL,
  `tao_id` int(11) NOT NULL,
  `join_time` int(10) UNSIGNED NOT NULL COMMENT '创建时间',
  `page_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0:\'未交卷\',1:\'一交卷\'',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_stu_course
-- ----------------------------
INSERT INTO `exam_stu_course` VALUES (1, 1, 1, 1, 1588278391, 1);
INSERT INTO `exam_stu_course` VALUES (2, 1, 1, 2, 1596682214, 1);
INSERT INTO `exam_stu_course` VALUES (3, 1, 2, 3, 1588278391, 0);
INSERT INTO `exam_stu_course` VALUES (4, 1, 2, 4, 1588278391, 0);
INSERT INTO `exam_stu_course` VALUES (5, 1, 1, 5, 1588278391, 0);

-- ----------------------------
-- Table structure for exam_stu_result
-- ----------------------------
DROP TABLE IF EXISTS `exam_stu_result`;
CREATE TABLE `exam_stu_result`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int(11) UNSIGNED NOT NULL,
  `tao_id` int(11) UNSIGNED NOT NULL,
  `course_id` int(11) UNSIGNED NOT NULL,
  `resSingle` float(5, 2) UNSIGNED NOT NULL COMMENT '单选题分数',
  `resTian` float(5, 2) UNSIGNED NOT NULL COMMENT '填空题分数',
  `resMore` float(5, 2) UNSIGNED NOT NULL COMMENT '多选题分数',
  `resPan` float(5, 2) UNSIGNED NOT NULL COMMENT '判断题分数',
  `resObj` float(5, 2) UNSIGNED NOT NULL COMMENT '客观题分数',
  `resTotal` float(5, 2) UNSIGNED NOT NULL COMMENT '合计分数',
  `join_time` int(10) UNSIGNED NOT NULL COMMENT '考试时间',
  `erro_subject` json NOT NULL COMMENT '错误的题目',
  `verify` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0:不用老师审核,1:需要老师审核',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_stu_result
-- ----------------------------
INSERT INTO `exam_stu_result` VALUES (1, 1, 2, 1, 4.00, 0.00, 0.00, 0.00, 0.00, 4.00, 1598858562, '[{\"type\": \"1\", \"tao_id\": \"6\", \"question_answer\": \"\"}, {\"type\": \"2\", \"tao_id\": \"3\", \"question_answer\": []}, {\"type\": \"2\", \"tao_id\": \"4\", \"question_answer\": []}, {\"type\": \"3\", \"tao_id\": \"3\", \"question_answer\": \"\"}, {\"type\": \"3\", \"tao_id\": \"4\", \"question_answer\": \"\"}]', 0);
INSERT INTO `exam_stu_result` VALUES (2, 1, 1, 1, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1606404125, '[{\"type\": \"1\", \"tao_id\": \"1\", \"question_answer\": 0}, {\"type\": \"1\", \"tao_id\": \"2\", \"question_answer\": \"\"}, {\"type\": \"1\", \"tao_id\": \"3\", \"question_answer\": \"\"}, {\"type\": \"2\", \"tao_id\": \"1\", \"question_answer\": [2, 1]}, {\"type\": \"2\", \"tao_id\": \"2\", \"question_answer\": []}, {\"type\": \"3\", \"tao_id\": \"1\", \"question_answer\": \"\"}, {\"type\": \"3\", \"tao_id\": \"2\", \"question_answer\": \"\"}]', 1);

-- ----------------------------
-- Table structure for exam_student
-- ----------------------------
DROP TABLE IF EXISTS `exam_student`;
CREATE TABLE `exam_student`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `join_time` int(10) UNSIGNED NOT NULL COMMENT '注册时间',
  `prefession` tinyint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '(0:软件技术专业,1:计算机科学与技术,2:软件工程,3:数字媒体技术)',
  `sstate` smallint(2) UNSIGNED NOT NULL COMMENT '(0:待审核,1审核通过)',
  `glass_id` int(11) UNSIGNED NOT NULL COMMENT '班级id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_sname`(`sname`) USING BTREE,
  INDEX `foreign_glass_id`(`glass_id`) USING BTREE,
  CONSTRAINT `foreign_glass_id` FOREIGN KEY (`glass_id`) REFERENCES `exam_glass` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_student
-- ----------------------------
INSERT INTO `exam_student` VALUES (1, 'liusunyin', '14e1b600b1fd579f47433b88e8d85291', 1588278391, 0, 1, 1);

-- ----------------------------
-- Table structure for exam_tao
-- ----------------------------
DROP TABLE IF EXISTS `exam_tao`;
CREATE TABLE `exam_tao`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_id` int(11) UNSIGNED NOT NULL COMMENT '课程id',
  `start_time` int(10) UNSIGNED NOT NULL COMMENT '开始时间',
  `end_time` int(10) UNSIGNED NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_tname`(`tname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_tao
-- ----------------------------
INSERT INTO `exam_tao` VALUES (1, 'JavaScript期末试卷一', 1, 1596682214, 1696870011);
INSERT INTO `exam_tao` VALUES (2, 'JavaScript期末试卷二', 1, 1596682214, 1696880011);
INSERT INTO `exam_tao` VALUES (3, 'php期末试卷一', 2, 1596682214, 1596770011);
INSERT INTO `exam_tao` VALUES (4, 'php期末试卷二', 2, 1596682214, 1596880011);
INSERT INTO `exam_tao` VALUES (5, 'JavaScript期末试卷二', 1, 1596682214, 1596770011);

-- ----------------------------
-- Table structure for exam_teacher
-- ----------------------------
DROP TABLE IF EXISTS `exam_teacher`;
CREATE TABLE `exam_teacher`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `join_time` int(10) UNSIGNED NOT NULL COMMENT '注册时间',
  `tstate` smallint(2) UNSIGNED NOT NULL COMMENT '(0：待审核，1审核通过)\r\n(0:待审核,1审核通过)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_tname`(`tname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_teacher
-- ----------------------------
INSERT INTO `exam_teacher` VALUES (1, 'liusunyin', '14e1b600b1fd579f47433b88e8d85291', 1588278391, 1);

-- ----------------------------
-- Table structure for exam_teacher_course
-- ----------------------------
DROP TABLE IF EXISTS `exam_teacher_course`;
CREATE TABLE `exam_teacher_course`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) UNSIGNED NOT NULL,
  `course_id` int(11) UNSIGNED NOT NULL,
  `tao_id` int(11) UNSIGNED NOT NULL,
  `join_time` int(11) UNSIGNED NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_teacher_course
-- ----------------------------
INSERT INTO `exam_teacher_course` VALUES (1, 1, 1, 1, 1596682214);

-- ----------------------------
-- Table structure for exam_teacher_glass
-- ----------------------------
DROP TABLE IF EXISTS `exam_teacher_glass`;
CREATE TABLE `exam_teacher_glass`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) UNSIGNED NOT NULL,
  `glass_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for exam_teacher_questions
-- ----------------------------
DROP TABLE IF EXISTS `exam_teacher_questions`;
CREATE TABLE `exam_teacher_questions`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) UNSIGNED NOT NULL,
  `question_id` int(11) NOT NULL COMMENT '题目的id',
  `type` smallint(3) UNSIGNED NOT NULL COMMENT '题目的类型(1:单选题,2:多选题,3:判断题,4:填空题,5:程序题)',
  `state` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '(0:未被组成试卷,1:被组成试卷)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of exam_teacher_questions
-- ----------------------------
INSERT INTO `exam_teacher_questions` VALUES (1, 1, 1, 1, 1);
INSERT INTO `exam_teacher_questions` VALUES (2, 1, 2, 1, 1);
INSERT INTO `exam_teacher_questions` VALUES (3, 1, 3, 1, 1);
INSERT INTO `exam_teacher_questions` VALUES (4, 1, 7, 1, 0);
INSERT INTO `exam_teacher_questions` VALUES (5, 2, 8, 1, 0);

-- ----------------------------
-- Table structure for exam_tian_questions
-- ----------------------------
DROP TABLE IF EXISTS `exam_tian_questions`;
CREATE TABLE `exam_tian_questions`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` smallint(2) UNSIGNED NOT NULL,
  `join_time` int(10) UNSIGNED NOT NULL,
  `course_id` int(11) UNSIGNED NOT NULL,
  `tao_id` int(11) UNSIGNED NOT NULL,
  `res` float(5, 2) UNSIGNED NOT NULL,
  `count` int(5) UNSIGNED NOT NULL COMMENT '空格数',
  `answerA` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '第一个空答案',
  `answerB` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '第二个空答案',
  `answerC` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '第三个空答案',
  `answerD` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '第四个空答案',
  `answerE` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '第五个空答案',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '答案解析',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_subject`(`subject`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_tian_questions
-- ----------------------------
INSERT INTO `exam_tian_questions` VALUES (1, '被称作“前四史”的史bai书是', 4, 1596682214, 1, 1, 5.00, 4, '司马', '李白', '杜甫', '白居易', NULL, NULL);
INSERT INTO `exam_tian_questions` VALUES (2, '被称作“前四史”的史bai书是1', 4, 1596682214, 1, 1, 5.00, 5, '司马', '李白', '杜甫', '白居易', '王安石', NULL);

-- ----------------------------
-- View structure for checkallstudentexam
-- ----------------------------
DROP VIEW IF EXISTS `checkallstudentexam`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `checkallstudentexam` AS select `exam_stu_result`.`student_id` AS `student_id`,`exam_stu_result`.`resTotal` AS `resTotal`,`exam_stu_result`.`verify` AS `verify`,`exam_student`.`glass_id` AS `glass_id`,`exam_stu_result`.`id` AS `id` from (`exam_stu_result` left join `exam_student` on((`exam_stu_result`.`student_id` = `exam_student`.`id`)));

SET FOREIGN_KEY_CHECKS = 1;
