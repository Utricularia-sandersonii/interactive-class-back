/*
 Navicat Premium Data Transfer

 Source Server         : my
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : interactive_class

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 16/05/2024 19:43:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `class_num` int(0) NULL DEFAULT 0 COMMENT '班级人数',
  `class_introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级简介',
  `class_create_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '班级创建j标识,可以根据班级code 搜索',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除。1标识被删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_class_code`(`class_create_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('18952731-e1db-4415-90ff-197ff048b6b4', '1502', 40, '1502班级简介。。。', '715596', '2020-04-25 23:48:35', '2020-04-25 23:48:35', 0);
INSERT INTO `class` VALUES ('1bca9be7-09e4-41cd-998a-f3e9bd89f202', '1991', 23, '6', '160765', '2024-05-15 10:29:20', '2024-05-15 10:29:20', 0);
INSERT INTO `class` VALUES ('25b929ef-1134-4333-b747-30b34a9c78a8', '1401', 32, '这是1401班', '399343', '2020-05-07 23:46:39', '2020-05-07 23:46:39', 0);
INSERT INTO `class` VALUES ('504bf968-0735-4892-ac3b-aa0d1a3257aa', '1403', 24, '这是1403班', '440325', '2020-05-07 23:47:20', '2020-05-07 23:47:20', 0);
INSERT INTO `class` VALUES ('64f5fa91-8c22-43e6-a63c-6184d84711ad', '1506', 34, '777777', '940221', '2020-05-04 20:22:20', '2020-05-04 20:22:20', 0);
INSERT INTO `class` VALUES ('746b85a3-b2d2-4d56-98f1-999eb7113253', 'kafka班级', 5, 'kafka班级', '633217', '2021-05-22 02:43:53', '2021-05-22 02:43:53', 0);
INSERT INTO `class` VALUES ('7c407235-7567-4fb5-9833-a1fc21aeb5c5', 'javaee班级', 5, '无', '372496', '2021-05-22 02:39:32', '2021-05-22 02:39:32', 0);
INSERT INTO `class` VALUES ('84665326-f551-4e1f-9b54-eead4179fa97', 'c++班级', 10, 'c++作业', '429031', '2021-05-24 22:10:29', '2021-05-24 22:10:29', 0);
INSERT INTO `class` VALUES ('9c68ae80-a913-435b-a434-722c97ad804f', '1501', 34, '1501班级简介。。。', '697042', '2020-04-25 23:48:17', '2020-04-25 23:48:17', 0);
INSERT INTO `class` VALUES ('c77112f8-30bd-491a-b6af-c1bb0dc95674', '1402', 20, '这是1402班', '420185', '2020-05-07 23:47:00', '2020-05-07 23:47:00', 0);
INSERT INTO `class` VALUES ('fc343902-b4ca-4e21-a238-c38539e587b2', 'test', 22, '22', '914360', '2020-05-08 09:55:14', '2020-05-08 09:55:14', 0);

-- ----------------------------
-- Table structure for class_course
-- ----------------------------
DROP TABLE IF EXISTS `class_course`;
CREATE TABLE `class_course`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `select_course_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_class_course`(`class_id`, `course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_course
-- ----------------------------
INSERT INTO `class_course` VALUES ('0922009543d94e29a1eab137838ec8c1', '64f5fa91-8c22-43e6-a63c-6184d84711ad', '3b3c1a18-0512-41e1-9376-63f9c67ae950', '2020-05-11 22:15:35');
INSERT INTO `class_course` VALUES ('1fc92152cae54e4ebce2adb6cebbbd35', '64f5fa91-8c22-43e6-a63c-6184d84711ad', 'a1b1f255-797a-4bb0-a5cb-ce6f0470b8b1', '2021-05-22 02:16:03');
INSERT INTO `class_course` VALUES ('28bde40a19af43cea3180c7bd93ffd82', '64f5fa91-8c22-43e6-a63c-6184d84711ad', '3b3c1a18-0512-41e1-9376-63f9c67ae950', '2020-05-11 22:36:03');
INSERT INTO `class_course` VALUES ('3525970a3e004d8d82e06c90dc3d1b2d', 'fc343902-b4ca-4e21-a238-c38539e587b2', '51e11ab2-9d48-492c-9348-031ce1237dbe', '2020-05-12 22:40:55');
INSERT INTO `class_course` VALUES ('43bf974d714b4fb1b9f49ed982e8b244', '18952731-e1db-4415-90ff-197ff048b6b4', '0356136e-c94b-497e-acd3-8e25679d2d78', '2020-05-11 22:15:09');
INSERT INTO `class_course` VALUES ('4dc4ae33d31d46318c630c371edc4371', '64f5fa91-8c22-43e6-a63c-6184d84711ad', '3b3c1a18-0512-41e1-9376-63f9c67ae950', '2020-05-11 22:38:35');
INSERT INTO `class_course` VALUES ('51083f66327741369dc3ea25e9bae331', '64f5fa91-8c22-43e6-a63c-6184d84711ad', '430c839e-96d4-4768-b0a2-262ffff36048', '2020-05-12 00:12:39');
INSERT INTO `class_course` VALUES ('65a925342353464fb861dc68d48eebe2', '64f5fa91-8c22-43e6-a63c-6184d84711ad', '0356136e-c94b-497e-acd3-8e25679d2d78', '2020-05-11 22:15:09');
INSERT INTO `class_course` VALUES ('6fbf9bc19ce04be585af6a2e137fc9e7', '64f5fa91-8c22-43e6-a63c-6184d84711ad', '430c839e-96d4-4768-b0a2-262ffff36048', '2020-05-11 22:24:15');
INSERT INTO `class_course` VALUES ('703154f008bd4a3b8729b147965f5a2a', '18952731-e1db-4415-90ff-197ff048b6b4', '3b3c1a18-0512-41e1-9376-63f9c67ae950', '2020-05-12 00:12:33');
INSERT INTO `class_course` VALUES ('82aad0c1a6b74b2894edbd433adef937', '64f5fa91-8c22-43e6-a63c-6184d84711ad', '0356136e-c94b-497e-acd3-8e25679d2d78', '2020-05-11 21:53:01');
INSERT INTO `class_course` VALUES ('8df5a1ac89f649d39a20610d700f2557', '18952731-e1db-4415-90ff-197ff048b6b4', '3b3c1a18-0512-41e1-9376-63f9c67ae950', '2020-05-11 22:36:03');
INSERT INTO `class_course` VALUES ('ab5041acdeea4eedb19a3b319f2c5cfc', '746b85a3-b2d2-4d56-98f1-999eb7113253', '544a246d-6427-4437-97aa-0d36bac401e0', '2021-05-24 22:21:38');
INSERT INTO `class_course` VALUES ('b2e53c179899499fb37534814545a3f1', 'c77112f8-30bd-491a-b6af-c1bb0dc95674', '265ae47b-79be-4854-97f4-533f689f9f64', '2020-05-12 22:25:31');
INSERT INTO `class_course` VALUES ('b53eed3c703645fd9aaf2897364826fa', '18952731-e1db-4415-90ff-197ff048b6b4', '3b3c1a18-0512-41e1-9376-63f9c67ae950', '2020-05-11 22:38:35');
INSERT INTO `class_course` VALUES ('d38e659c8818437dae87421d4abfa11d', '746b85a3-b2d2-4d56-98f1-999eb7113253', '544a246d-6427-4437-97aa-0d36bac401e0', '2021-05-22 02:44:26');
INSERT INTO `class_course` VALUES ('d442992c05a245f882bb291712a6ccd2', '64f5fa91-8c22-43e6-a63c-6184d84711ad', '3b3c1a18-0512-41e1-9376-63f9c67ae950', '2020-05-12 00:12:33');
INSERT INTO `class_course` VALUES ('e50eb2a29088461f883f119daabb8aeb', '18952731-e1db-4415-90ff-197ff048b6b4', '3b3c1a18-0512-41e1-9376-63f9c67ae950', '2020-05-11 22:15:35');
INSERT INTO `class_course` VALUES ('ed85a792e37946b986ae5bd74ea4740f', '746b85a3-b2d2-4d56-98f1-999eb7113253', '544a246d-6427-4437-97aa-0d36bac401e0', '2024-05-15 11:24:02');
INSERT INTO `class_course` VALUES ('ee4d97dbb9be492688d19245dd61fa14', '746b85a3-b2d2-4d56-98f1-999eb7113253', '544a246d-6427-4437-97aa-0d36bac401e0', '2021-05-24 22:23:21');
INSERT INTO `class_course` VALUES ('efafaea46cd844d691676d330c0f55cd', '746b85a3-b2d2-4d56-98f1-999eb7113253', '855bc349-1b40-464a-a943-f40e26ca8d3f', '2021-05-25 21:14:04');
INSERT INTO `class_course` VALUES ('f34c4a1b011a478c83da935d2ca4baf7', 'fc343902-b4ca-4e21-a238-c38539e587b2', '51e11ab2-9d48-492c-9348-031ce1237dbe', '2020-06-20 09:26:04');

-- ----------------------------
-- Table structure for class_user
-- ----------------------------
DROP TABLE IF EXISTS `class_user`;
CREATE TABLE `class_user`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `class_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '班级成员id',
  `created_user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '班级创建者Id',
  `creat_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_user
-- ----------------------------
INSERT INTO `class_user` VALUES ('188959307a314b6296c2e82433052dbf', '746b85a3-b2d2-4d56-98f1-999eb7113253', NULL, '1479574d4264403ca52384e87f6c1659', '', '2021-05-22 02:51:01', '2021-05-22 02:51:01');
INSERT INTO `class_user` VALUES ('2420cc1f58da4c15b16b5b1fd0c2353b', '746b85a3-b2d2-4d56-98f1-999eb7113253', NULL, 'cf4ecc60a70b4e2ca4a617b403cfede6', '', '2021-05-24 22:15:02', '2021-05-24 22:15:02');
INSERT INTO `class_user` VALUES ('44f868cc1d5f4acbb9344ce63165843b', '18952731-e1db-4415-90ff-197ff048b6b4', NULL, '1479574d4264403ca52384e87f6c1659', '', '2020-05-12 22:18:27', '2020-05-12 22:18:27');
INSERT INTO `class_user` VALUES ('47fdedb98e5c4a4aaee08689983c7176', '64f5fa91-8c22-43e6-a63c-6184d84711ad', NULL, '99b9a2f574d94a3491f8bec131d1c502', '99b9a2f574d94a3491f8bec131d1c502', '2020-05-04 20:22:20', '2020-05-04 20:22:20');
INSERT INTO `class_user` VALUES ('661500a06b57439c96335d06d1e91b5e', 'c77112f8-30bd-491a-b6af-c1bb0dc95674', NULL, '68b9a2f57443803491f8bec131d1c254', '68b9a2f57443803491f8bec131d1c254', '2020-05-07 23:47:00', '2020-05-07 23:47:00');
INSERT INTO `class_user` VALUES ('662530fcbfba4127a4cb93028f651fd5', '18952731-e1db-4415-90ff-197ff048b6b4', NULL, '99b9a2f574d94a3491f8bec131d1c502', '', '2020-04-26 00:21:40', '2020-04-26 00:21:40');
INSERT INTO `class_user` VALUES ('70185e59b1b7484194ba18aa442d9ca4', '504bf968-0735-4892-ac3b-aa0d1a3257aa', NULL, '68b9a2f57443803491f8bec131d1c254', '68b9a2f57443803491f8bec131d1c254', '2020-05-07 23:47:20', '2020-05-07 23:47:20');
INSERT INTO `class_user` VALUES ('8e89456304d14163bd479ffee94944fb', '25b929ef-1134-4333-b747-30b34a9c78a8', NULL, '68b9a2f57443803491f8bec131d1c254', '68b9a2f57443803491f8bec131d1c254', '2020-05-07 23:46:39', '2020-05-07 23:46:39');
INSERT INTO `class_user` VALUES ('946c44ec063a44838518dde66f285794', '25b929ef-1134-4333-b747-30b34a9c78a8', NULL, '1479574d4264403ca52384e87f6c1659', '', '2020-05-12 22:21:41', '2020-05-12 22:21:41');
INSERT INTO `class_user` VALUES ('96e582667a234e938912ff34d267d544', '504bf968-0735-4892-ac3b-aa0d1a3257aa', NULL, '1479574d4264403ca52384e87f6c1659', '', '2020-05-12 22:22:12', '2020-05-12 22:22:12');
INSERT INTO `class_user` VALUES ('a35155e771f44e069b2bee6df7d52962', 'af41805a-f3cb-4ea2-8359-cba0eb8c1885', NULL, '99b9a2f574d94a3491f8bec131d1c502', '99b9a2f574d94a3491f8bec131d1c502', '2021-05-22 02:15:17', '2021-05-22 02:15:17');
INSERT INTO `class_user` VALUES ('a6cace5927814ffa93fcd7f8d38db83d', 'c77112f8-30bd-491a-b6af-c1bb0dc95674', NULL, '99b9a2f574d94a3491f8bec131d1c502', '', '2020-05-07 23:50:59', '2020-05-07 23:50:59');
INSERT INTO `class_user` VALUES ('ac1fb0a2c77f43aea6a0be83a9f268ed', '18952731-e1db-4415-90ff-197ff048b6b4', NULL, 'cf4ecc60a70b4e2ca4a617b403cfede6', '', '2024-05-15 20:42:38', '2024-05-15 20:42:38');
INSERT INTO `class_user` VALUES ('ae247f5b758a4a10b6c01783afc0dbf9', '746b85a3-b2d2-4d56-98f1-999eb7113253', NULL, '99b9a2f574d94a3491f8bec131d1c502', '99b9a2f574d94a3491f8bec131d1c502', '2021-05-22 02:43:53', '2021-05-22 02:43:53');
INSERT INTO `class_user` VALUES ('d8617cf675134dfd87ecf6ba5511d429', '1bca9be7-09e4-41cd-998a-f3e9bd89f202', NULL, '99b9a2f574d94a3491f8bec131d1c502', '99b9a2f574d94a3491f8bec131d1c502', '2024-05-15 10:29:20', '2024-05-15 10:29:20');
INSERT INTO `class_user` VALUES ('e77843188156401697f77288794b980b', '84665326-f551-4e1f-9b54-eead4179fa97', NULL, '80dbfc1af25e49b7b8e38df7a66e3b91', '80dbfc1af25e49b7b8e38df7a66e3b91', '2021-05-24 22:10:29', '2021-05-24 22:10:29');
INSERT INTO `class_user` VALUES ('f059f987aa70472aa51680ad3292f132', '7c407235-7567-4fb5-9833-a1fc21aeb5c5', NULL, '99b9a2f574d94a3491f8bec131d1c502', '99b9a2f574d94a3491f8bec131d1c502', '2021-05-22 02:39:32', '2021-05-22 02:39:32');
INSERT INTO `class_user` VALUES ('f088e10eae4444fd91ec25ce6922aec8', 'fc343902-b4ca-4e21-a238-c38539e587b2', NULL, '80dbfc1af25e49b7b8e38df7a66e3b91', '80dbfc1af25e49b7b8e38df7a66e3b91', '2020-05-08 09:55:14', '2020-05-08 09:55:14');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_name` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '课程名称',
  `course_introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '课程介绍',
  `course_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '课程时长',
  `course_score` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '课程学分',
  `created_user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '课程创建者Id',
  `student_num` int(0) NULL DEFAULT 0 COMMENT '上课人数',
  `begin_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '上课时间',
  `end_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '下课时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('0356136e-c94b-497e-acd3-8e25679d2d78', 'tes', '', '', '3', '99b9a2f574d94a3491f8bec131d1c502', 0, '2020-05-07 12:00:00', '2020-05-22 12:00:00');
INSERT INTO `course` VALUES ('3b3c1a18-0512-41e1-9376-63f9c67ae950', '555666', '', '', '55', '99b9a2f574d94a3491f8bec131d1c502', 40, '2020-05-15 12:00:00', '2020-05-23 12:00:00');
INSERT INTO `course` VALUES ('544a246d-6427-4437-97aa-0d36bac401e0', 'kafka专题', '', '', '5', '99b9a2f574d94a3491f8bec131d1c502', 5, '2021-05-05 12:00:00', '2021-05-27 12:00:00');
INSERT INTO `course` VALUES ('855bc349-1b40-464a-a943-f40e26ca8d3f', 'redis的使用', '', '', '10', '99b9a2f574d94a3491f8bec131d1c502', 5, '2021-05-28 12:00:00', '2021-05-29 12:00:00');
INSERT INTO `course` VALUES ('a1b1f255-797a-4bb0-a5cb-ce6f0470b8b1', '1', '', '', '1', '99b9a2f574d94a3491f8bec131d1c502', 34, '2021-04-02 12:00:00', '2021-05-28 12:00:00');

-- ----------------------------
-- Table structure for course_resource
-- ----------------------------
DROP TABLE IF EXISTS `course_resource`;
CREATE TABLE `course_resource`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_resource_name` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程资源名称',
  `resource_des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '课件资源说明',
  `resource_type` int(0) NULL DEFAULT 1 COMMENT '课件类型1：ppt；2：视频',
  `resource_path` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '资源存储路径',
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '资源作者id',
  `course_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `class_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_resource
-- ----------------------------
INSERT INTO `course_resource` VALUES ('0c911b3a0af84cdcbba4181585aac8d0', '1 毕业设计(毕业论文)手册-样例.pdf', 'ppt、word资源', 1, '202105/955859_1 毕业设计(毕业论文)手册-样例.pdf', '99b9a2f574d94a3491f8bec131d1c502', 'a1b1f255-797a-4bb0-a5cb-ce6f0470b8b1', NULL, '2021-05-22 02:16:03');
INSERT INTO `course_resource` VALUES ('226dcc8ceb3f47738f37626913658d3a', 'text.pdf', 'ppt、word资源', 1, '202105/199601_text.pdf', '99b9a2f574d94a3491f8bec131d1c502', '544a246d-6427-4437-97aa-0d36bac401e0', NULL, '2024-05-15 11:24:02');
INSERT INTO `course_resource` VALUES ('347bdb1a2d5a4f57afcf8572cc89f62c', '002.考试二.Web后台开发技术.pdf', 'ppt、word资源', 1, '202105/434835_002.考试二.Web后台开发技术.pdf', '99b9a2f574d94a3491f8bec131d1c502', '855bc349-1b40-464a-a943-f40e26ca8d3f', NULL, '2021-05-25 21:14:04');
INSERT INTO `course_resource` VALUES ('47c90e71704f48a1a5b46146a44f3d5a', '5个项目的启动.mp4', '视频资源', 2, '202105/029289_5个项目的启动.mp4', '99b9a2f574d94a3491f8bec131d1c502', '544a246d-6427-4437-97aa-0d36bac401e0', NULL, '2024-05-15 11:24:02');
INSERT INTO `course_resource` VALUES ('4c638b9c2fe84a3d82f67dfdbe91e541', 'git命令.mp4', '视频资源', 2, '202105/665012_git命令.mp4', '99b9a2f574d94a3491f8bec131d1c502', '544a246d-6427-4437-97aa-0d36bac401e0', NULL, '2024-05-15 11:24:02');
INSERT INTO `course_resource` VALUES ('6a634acd8577450abeadee2014d08212', 'jdk安装与运行java.mp4', '视频资源', 2, '202105/443393_jdk安装与运行java.mp4', '99b9a2f574d94a3491f8bec131d1c502', '855bc349-1b40-464a-a943-f40e26ca8d3f', NULL, '2021-05-25 21:14:04');
INSERT INTO `course_resource` VALUES ('7a531be1f3f64816aac24962bdb83226', '20200508212041.zip', 'ppt、word资源', 1, '202005/547213_刘博包1单位_20200508212041.zip', '99b9a2f574d94a3491f8bec131d1c502', '3b3c1a18-0512-41e1-9376-63f9c67ae950', NULL, '2020-05-12 00:12:33');
INSERT INTO `course_resource` VALUES ('9c976fdb4bd148ba95cec6533b78a093', '5个项目的启动.mp4', '视频资源', 2, '202105/962242_5个项目的启动.mp4', '99b9a2f574d94a3491f8bec131d1c502', 'a1b1f255-797a-4bb0-a5cb-ce6f0470b8b1', NULL, '2021-05-22 02:16:03');
INSERT INTO `course_resource` VALUES ('a3a95461620e433d8eaf217c381c5ef3', '讲解.docx', 'ppt、word资源', 1, '202405/438399_讲解.docx', '99b9a2f574d94a3491f8bec131d1c502', '544a246d-6427-4437-97aa-0d36bac401e0', NULL, '2024-05-15 11:24:02');

-- ----------------------------
-- Table structure for home_work
-- ----------------------------
DROP TABLE IF EXISTS `home_work`;
CREATE TABLE `home_work`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `work_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业标题',
  `work_des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业描述',
  `attach_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件路径',
  `student_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作业提交者id',
  `submit_time` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teacher_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `course_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程id',
  `class_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `download_num` int(0) NULL DEFAULT 0 COMMENT '下载次数',
  `last_down_time` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of home_work
-- ----------------------------
INSERT INTO `home_work` VALUES ('09a2b1ea515142fabc59a92f20255fee', 'kafka作业', 'kafka作业', '202105/798790_Spark管理与开发直播课（新版）.pdf', '1479574d4264403ca52384e87f6c1659', '2021-05-22 02:46:39', '99b9a2f574d94a3491f8bec131d1c502', '3b3c1a18-0512-41e1-9376-63f9c67ae950', NULL, 0, NULL, '1');
INSERT INTO `home_work` VALUES ('219fcddb1cfe453cbe27f3addde4232c', '22', '22', '202005/202408_pass.txt', '1479574d4264403ca52384e87f6c1659', '2020-05-13 00:33:23', '99b9a2f574d94a3491f8bec131d1c502', '3b3c1a18-0512-41e1-9376-63f9c67ae950', NULL, 0, NULL, '1');
INSERT INTO `home_work` VALUES ('abe43e51a3fb4284b782fd078f26e434', 'redis的安装', 'redis的安装', '202105/549415_text.pdf', 'cf4ecc60a70b4e2ca4a617b403cfede6', '2021-05-25 21:15:50', '99b9a2f574d94a3491f8bec131d1c502', '855bc349-1b40-464a-a943-f40e26ca8d3f', NULL, 0, NULL, '0');
INSERT INTO `home_work` VALUES ('e9272adfbe9b44518327005293c04c56', '11', '11', '202105/199071_1 毕业设计(毕业论文)手册-样例.pdf', '1479574d4264403ca52384e87f6c1659', '2021-05-22 02:20:00', '99b9a2f574d94a3491f8bec131d1c502', '0356136e-c94b-497e-acd3-8e25679d2d78', NULL, 0, NULL, '1');

-- ----------------------------
-- Table structure for msg
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息id',
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `send_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息发送id',
  `send_name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '发送者名字',
  `msg_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `class_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `send_time` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '发送日期',
  `to_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '消息接收者id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of msg
-- ----------------------------
INSERT INTO `msg` VALUES ('0bc16a343a4f45fa94790d0b1faf4e3f', '222', '99b9a2f574d94a3491f8bec131d1c502', 'aaa', 'classGroup', '18952731-e1db-4415-90ff-197ff048b6b4', '2020-05-13 01:10:23', '');
INSERT INTO `msg` VALUES ('1aa6bdc20aa44404b35cff48ac265592', '333', '99b9a2f574d94a3491f8bec131d1c502', 'aaa', 'classGroup', '18952731-e1db-4415-90ff-197ff048b6b4', '2020-05-13 01:19:15', '');
INSERT INTO `msg` VALUES ('24e35b556f334083805bab25a2d72132', '22', '99b9a2f574d94a3491f8bec131d1c502', 'aaa', 'classGroup', '18952731-e1db-4415-90ff-197ff048b6b4', '2020-05-13 01:15:16', '');
INSERT INTO `msg` VALUES ('2fc7a8a007224ec8b417902856a64722', '222', '99b9a2f574d94a3491f8bec131d1c502', 'aaa', 'classGroup', '18952731-e1db-4415-90ff-197ff048b6b4', '2020-05-13 01:10:19', '');
INSERT INTO `msg` VALUES ('335ba64edf40473a9189381d2d37b34c', '2222', '99b9a2f574d94a3491f8bec131d1c502', 'aaa', 'classGroup', '9c68ae80-a913-435b-a434-722c97ad804f', '2020-05-10 23:40:57', '');
INSERT INTO `msg` VALUES ('484803487ee04b70b208010322b75a24', '222', '99b9a2f574d94a3491f8bec131d1c502', '222', 'classGroup', '18952731-e1db-4415-90ff-197ff048b6b4', '2020-05-10 21:02:11', '');
INSERT INTO `msg` VALUES ('54ec964b91864af68985106e4fd61d06', '3', 'cf4ecc60a70b4e2ca4a617b403cfede6', '222', 'classGroup', '746b85a3-b2d2-4d56-98f1-999eb7113253', '2024-05-15 23:21:34', '');
INSERT INTO `msg` VALUES ('641388508a634908b5bb605b51d98f1b', '566', '99b9a2f574d94a3491f8bec131d1c502', 'aaa', 'classGroup', '9c68ae80-a913-435b-a434-722c97ad804f', '2020-05-10 22:20:27', '');
INSERT INTO `msg` VALUES ('7e4762ab5c33478a8f61026b43599394', '342', 'cf4ecc60a70b4e2ca4a617b403cfede6', '222', 'classGroup', '746b85a3-b2d2-4d56-98f1-999eb7113253', '2024-05-15 23:21:57', '');
INSERT INTO `msg` VALUES ('7ef29ae652ff447e8050486776be9703', '你好', 'cf4ecc60a70b4e2ca4a617b403cfede6', '222', 'classGroup', '746b85a3-b2d2-4d56-98f1-999eb7113253', '2024-05-15 09:32:21', '');
INSERT INTO `msg` VALUES ('80b0e4e44df64a208177109c5392c972', 'hahha', '99b9a2f574d94a3491f8bec131d1c502', 'aaa', 'classGroup', '746b85a3-b2d2-4d56-98f1-999eb7113253', '2021-05-22 02:48:26', '');
INSERT INTO `msg` VALUES ('842649eb6ec5438293c62422dfa225dc', '有人在吗', '99b9a2f574d94a3491f8bec131d1c502', 'aaa', 'classGroup', '746b85a3-b2d2-4d56-98f1-999eb7113253', '2021-05-22 02:48:38', '');
INSERT INTO `msg` VALUES ('8d06d24ac1e64dae80c505ad782243fd', '在', 'cf4ecc60a70b4e2ca4a617b403cfede6', '222', 'classGroup', '746b85a3-b2d2-4d56-98f1-999eb7113253', '2024-05-15 22:05:58', '');
INSERT INTO `msg` VALUES ('95bc87c3c73f49068a24c27b1a1448bc', '1', 'cf4ecc60a70b4e2ca4a617b403cfede6', '222', 'classGroup', '746b85a3-b2d2-4d56-98f1-999eb7113253', '2024-05-15 23:21:00', '');
INSERT INTO `msg` VALUES ('f4036b33770243a58c089d714b5acfea', '333', '99b9a2f574d94a3491f8bec131d1c502', 'aaa\r\naaa\r\n', 'classGroup', '64f5fa91-8c22-43e6-a63c-6184d84711ad', '2020-05-13 00:46:09', '');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notice_title` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '通知、公告标题',
  `notice_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知公告内容',
  `publish_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publish_user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `class_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `course_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('32b06749-cd3f-41d8-931b-a365c5efdbb2', '今天放假通知', '今天放假通知', '2021-05-22 02:47:25', '99b9a2f574d94a3491f8bec131d1c502', '746b85a3-b2d2-4d56-98f1-999eb7113253', '544a246d-6427-4437-97aa-0d36bac401e0');
INSERT INTO `notice` VALUES ('772def1f-17c2-43ce-8e78-b9456f3d6956', '关于放假的通知', '关于放假的通知', '2021-05-22 02:33:19', '99b9a2f574d94a3491f8bec131d1c502', '18952731-e1db-4415-90ff-197ff048b6b4', '0356136e-c94b-497e-acd3-8e25679d2d78');
INSERT INTO `notice` VALUES ('f1d5682d-64f0-4abd-81ba-5924d22ba03c', '44', '444444.。。。', '2020-04-27 00:37:05', '99b9a2f574d94a3491f8bec131d1c502', '18952731-e1db-4415-90ff-197ff048b6b4', '0356136e-c94b-497e-acd3-8e25679d2d78');

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `paper_name` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `paper_score` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `paper_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '答题时长',
  `answer_begin_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `answer_end_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publish_user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '试卷发布者id',
  `publish_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `answer_user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '试卷答题用户id',
  `class_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '试卷答题班级班级',
  `course_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `student_num` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES ('11e81f9206d94dfbb135773d5db42613', '2019年12月份摸底考试', NULL, '120分钟', NULL, NULL, '68b9a2f57443803491f8bec131d1c254', '2020-57-07 11:57:56', '', 'c77112f8-30bd-491a-b6af-c1bb0dc95674', '6bae0c16-84d8-4b23-9693-6621c08cd522', NULL);
INSERT INTO `paper` VALUES ('4ee2dddfa0a7483a8d573595cd903ea8', '2020年1月测试', NULL, '120分钟', NULL, NULL, '99b9a2f574d94a3491f8bec131d1c502', '2020-31-04 08:31:52', '', '18952731-e1db-4415-90ff-197ff048b6b4', '799c8d7e-bc3a-41f5-9d49-d256f075058d', NULL);
INSERT INTO `paper` VALUES ('7ec8dac0c545473a92373ed31a24922a', '2019年3月份月考', NULL, '120分钟', NULL, NULL, '99b9a2f574d94a3491f8bec131d1c502', '2020-58-03 10:58:45', '', '18952731-e1db-4415-90ff-197ff048b6b4', '799c8d7e-bc3a-41f5-9d49-d256f075058d', NULL);
INSERT INTO `paper` VALUES ('fe44bbc4c9f749568f0e966150671bfd', 'kafka专题1', NULL, '2', NULL, NULL, '99b9a2f574d94a3491f8bec131d1c502', '2021-48-22 02:48:08', '', '746b85a3-b2d2-4d56-98f1-999eb7113253', '544a246d-6427-4437-97aa-0d36bac401e0', NULL);
INSERT INTO `paper` VALUES ('ff516e352ba24f90b67a55aa61e0655c', 'a', NULL, 'a', NULL, NULL, '99b9a2f574d94a3491f8bec131d1c502', '2024-47-15 01:47:22', '', '746b85a3-b2d2-4d56-98f1-999eb7113253', '544a246d-6427-4437-97aa-0d36bac401e0', NULL);

-- ----------------------------
-- Table structure for paper_question
-- ----------------------------
DROP TABLE IF EXISTS `paper_question`;
CREATE TABLE `paper_question`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `question_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '问题名称',
  `question_type` tinyint(0) NULL DEFAULT 1 COMMENT '试卷题目类型。1：选择题；2：填空题',
  `question_answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '问题答案',
  `question_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '问题编号',
  `score` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `paper_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order` smallint(0) NULL DEFAULT 1 COMMENT '试题排序顺序',
  `question_a` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_b` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_c` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_d` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_self_answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '填空题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper_question
-- ----------------------------
INSERT INTO `paper_question` VALUES ('5799ea957a7049c0aca3d5b7e5582498', '英文字母', 2, 'r,g', '3', '4', 'fe44bbc4c9f749568f0e966150671bfd', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `paper_question` VALUES ('5eefd272aa1547759dad275b0ca253d6', '英文字母', 2, 'r,g', '3', '4', 'fe44bbc4c9f749568f0e966150671bfd', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `paper_question` VALUES ('5fc0084289834d349b8a1a7ffce297a8', '三角形的周长', 1, 'A', '1', '5', '4ee2dddfa0a7483a8d573595cd903ea8', 1, '10', '12', '13', '14', NULL);
INSERT INTO `paper_question` VALUES ('6bc386a55d9f45a4958f159a38f6c498', 'javase是什么', 1, 'C', '2', '5', '4ee2dddfa0a7483a8d573595cd903ea8', 1, 'js', 'html', 'css', 'kafka', NULL);
INSERT INTO `paper_question` VALUES ('7d65da012fb64e9c88e4b6b61b57dd23', '三角形的周长', 1, 'A', '1', '5', '4ee2dddfa0a7483a8d573595cd903ea8', 1, '10', '12', '13', '14', NULL);
INSERT INTO `paper_question` VALUES ('92d120eb7f0347bd9b3d707b5f06a743', '那个是什么', 1, 'D', '1', '4', 'fe44bbc4c9f749568f0e966150671bfd', 1, 'a', 'b', 'c', 'd', NULL);
INSERT INTO `paper_question` VALUES ('b99472a92bdd4dc3a6015fa2b5f5e495', 'javaee是什么', 1, 'C', '1', '5', '4ee2dddfa0a7483a8d573595cd903ea8', 1, 'js', 'html', 'css', 'kafka', NULL);
INSERT INTO `paper_question` VALUES ('c3af37ab984d47998c13ee140c0869d7', '三角形的周长', 1, 'A', '1', '5', '4ee2dddfa0a7483a8d573595cd903ea8', 1, '10', '12', '13', '14', NULL);
INSERT INTO `paper_question` VALUES ('c409045f27254a8991449238df2f2287', '那个是什么', 1, 'D', '1', '4', 'fe44bbc4c9f749568f0e966150671bfd', 1, 'a', 'b', 'c', 'd', NULL);
INSERT INTO `paper_question` VALUES ('d3c1e73955e6415087bf5ea19183ec57', '那个是什么?', 1, 'D', '1', '4', 'fe44bbc4c9f749568f0e966150671bfd', 1, 'a', 'b', 'c', 'd', NULL);
INSERT INTO `paper_question` VALUES ('e6f44832951749a488842c6a47f3e933', 'javase是什么', 1, 'C', '1', '5', '4ee2dddfa0a7483a8d573595cd903ea8', 1, 'js', 'html', 'css', 'kafka', NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色权限标识（要求输入英文）',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '角色描述',
  `is_delete` tinyint(0) NULL DEFAULT 0 COMMENT '用于逻辑删除，1标识数据被删除',
  `is_used` tinyint(0) NULL DEFAULT 1 COMMENT '是否使用。1正在使用，0禁止使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '学生', 'student', '学生', 0, 1);
INSERT INTO `role` VALUES (2, '老师', 'teacher', '拥有老师权限', 0, 1);
INSERT INTO `role` VALUES (3, '管理员', 'admin', 'admin', 0, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` tinyint(0) NULL DEFAULT 0 COMMENT '性别，0：未知；1：男性；2：女性。',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '学号',
  `user_avatar` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户图像路径',
  `role_id` int(0) NULL DEFAULT 0 COMMENT '角色id',
  `login_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录ip',
  `login_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录时间',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除。1被删除',
  `is_used` tinyint(1) NULL DEFAULT 1 COMMENT '是否禁用。0账号被禁用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1479574d4264403ca52384e87f6c1659', '111', 1, '111', '111', '111', '', 1, '192.168.208.180', '2024-05-15 21:06:22', '2020-04-25 23:47:16', '2021-05-25 20:44:31', 0, 1);
INSERT INTO `user` VALUES ('68b9a2f57443803491f8bec131d1c254', 'bbb', 0, 'bbb', 'bbb', 'bbb', '', 2, '127.0.0.1', '2021-05-22 02:18:41', '2020-05-07 23:44:28', '2021-05-25 20:44:35', 0, 1);
INSERT INTO `user` VALUES ('80dbfc1af25e49b7b8e38df7a66e3b91', 'admin', 0, 'admin', 'admin', 'admin', '', 3, '127.0.0.1', '2021-05-25 21:08:12', '2020-05-08 09:43:08', '2021-05-25 20:44:37', 0, 1);
INSERT INTO `user` VALUES ('99b9a2f574d94a3491f8bec131d1c502', 'aaa', 0, 'aaa', 'aaa', 'aaa', '', 2, '192.168.208.180', '2024-05-16 14:21:50', '2020-04-25 23:46:52', '2021-05-25 20:44:40', 0, 1);
INSERT INTO `user` VALUES ('ba91b2bcc4944a358eccdc1de69c0af9', '333', 0, '333', '333', '333', '', 1, '192.168.208.180', '2024-05-15 09:33:35', '2021-05-25 21:02:12', '2021-05-25 21:02:12', 0, 1);
INSERT INTO `user` VALUES ('baa2dcda4b1847b98c4e5250547831ea', 'root', 0, 'root', 'root', 'root', '', 3, '', '', '2021-05-25 21:08:45', '2021-05-25 21:08:45', 0, 1);
INSERT INTO `user` VALUES ('cf4ecc60a70b4e2ca4a617b403cfede6', '222', 0, '222', '222', '222', '', 1, '192.168.208.180', '2024-05-16 14:22:07', '2021-05-24 22:14:40', '2021-05-25 20:44:45', 0, 1);

-- ----------------------------
-- Table structure for user_question
-- ----------------------------
DROP TABLE IF EXISTS `user_question`;
CREATE TABLE `user_question`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `my_answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '我的答案',
  `correct_answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正确答案',
  `score` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所得分数',
  `create_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_question
-- ----------------------------
INSERT INTO `user_question` VALUES ('6484192c8e5c4685b594bd58c4fe9bcf', '8c91c81a5266470db11e8df1ccb0f8d9', '99b9a2f574d94a3491f8bec131d1c502', 'C', NULL, '4', '2020-05-07 22:14:37', NULL);
INSERT INTO `user_question` VALUES ('6206545c755e4ce7b2d404cdbb58b11b', '7c3126e1b2e549f6902a7275c37283a6', '99b9a2f574d94a3491f8bec131d1c502', 'A', NULL, '4', '2020-05-07 22:14:37', NULL);
INSERT INTO `user_question` VALUES ('ce65765085384a2581448c843cfaeea5', '6a457f5b04594476b52d523490ca6fb5', '99b9a2f574d94a3491f8bec131d1c502', 'B', NULL, '5', '2020-05-07 22:14:37', NULL);
INSERT INTO `user_question` VALUES ('f40322fb39884b5180b701c92a696064', '33fb5dcd2d5f435d845f22dd0ee39aed', '99b9a2f574d94a3491f8bec131d1c502', 'A', NULL, '0', '2020-05-07 22:14:37', NULL);
INSERT INTO `user_question` VALUES ('5d8220b47bbf4bf69ef553cdfb9ad1b9', 'd0ada3512b534f9487607437608f0268', '99b9a2f574d94a3491f8bec131d1c502', 'B', NULL, '4', '2020-05-07 22:14:37', NULL);
INSERT INTO `user_question` VALUES ('b9123df32ab148df85f5cf2b5f6dec63', '3910895a15db4f94a09ad8be71ac2c95', '99b9a2f574d94a3491f8bec131d1c502', '2', NULL, '0', '2020-05-07 22:14:37', NULL);
INSERT INTO `user_question` VALUES ('9887537988dc4d9d95ce8a681ecea038', 'e8cbd6430a724c4a9c55b02fa0900cb6', '99b9a2f574d94a3491f8bec131d1c502', '2', NULL, '0', '2020-05-07 22:14:37', NULL);
INSERT INTO `user_question` VALUES ('5a9be2b88021427e8c3bde3e49953da8', 'f523fec27fe447b19c88bf01279377de', '99b9a2f574d94a3491f8bec131d1c502', '2', NULL, '2', '2020-05-07 22:14:37', NULL);
INSERT INTO `user_question` VALUES ('0d5464b809e34dd1b28912e509d3921a', 'a8c4f337ecff48f7afe3ec20f51fe847', '99b9a2f574d94a3491f8bec131d1c502', 'class', NULL, '0', '2020-05-07 22:14:37', NULL);
INSERT INTO `user_question` VALUES ('095cf7683ee94c188404826c586c64ab', '92d120eb7f0347bd9b3d707b5f06a743', 'cf4ecc60a70b4e2ca4a617b403cfede6', 'C', NULL, '0', '2024-05-15 10:19:03', NULL);
INSERT INTO `user_question` VALUES ('c3b33dd704be4620942ba843dae7d946', 'c409045f27254a8991449238df2f2287', 'cf4ecc60a70b4e2ca4a617b403cfede6', 'D', NULL, '4', '2024-05-15 10:19:03', NULL);
INSERT INTO `user_question` VALUES ('aac5cc1f36b345c7b0f2a56b200972f0', 'd3c1e73955e6415087bf5ea19183ec57', 'cf4ecc60a70b4e2ca4a617b403cfede6', 'C', NULL, '0', '2024-05-15 10:19:03', NULL);

-- ----------------------------
-- Table structure for user_score
-- ----------------------------
DROP TABLE IF EXISTS `user_score`;
CREATE TABLE `user_score`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `paper_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `course_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_score` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '总分',
  `create_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_score
-- ----------------------------
INSERT INTO `user_score` VALUES ('03a233a79a284cd19cee29b33ce33189', 'cf4ecc60a70b4e2ca4a617b403cfede6', 'fe44bbc4c9f749568f0e966150671bfd', NULL, '4', '2024-05-15 10:19:03');
INSERT INTO `user_score` VALUES ('239c04b6ce9945819119658f19b46822', '99b9a2f574d94a3491f8bec131d1c502', '4ee2dddfa0a7483a8d573595cd903ea8', NULL, '19', '2020-05-07 22:14:37');

-- ----------------------------
-- Table structure for user_sign
-- ----------------------------
DROP TABLE IF EXISTS `user_sign`;
CREATE TABLE `user_sign`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sign_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sign_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sign_in` tinyint(1) NOT NULL DEFAULT 1 COMMENT '签到。1表示签到，0表示签退',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `course_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_sign
-- ----------------------------
INSERT INTO `user_sign` VALUES ('2d59b3f07fc248cea70ddf4458ce379c', '18952731-e1db-4415-90ff-197ff048b6b4', '99b9a2f574d94a3491f8bec131d1c502', '222', '17:03:42', '大悟县人民政府(府前街东)', 0, '192.168.0.104', 'bbc7f50e-702a-4314-b70a-fd30e3d682eb', NULL);
INSERT INTO `user_sign` VALUES ('3b045244655746eda8428e1c152b0b66', '746b85a3-b2d2-4d56-98f1-999eb7113253', 'cf4ecc60a70b4e2ca4a617b403cfede6', 'stu1', '22:15:19', '假日广场中山市政府(松苑路北)', 0, '192.168.179.1', '544a246d-6427-4437-97aa-0d36bac401e0', NULL);
INSERT INTO `user_sign` VALUES ('3ec9527eb789407c8c4bcac2240f926b', 'c77112f8-30bd-491a-b6af-c1bb0dc95674', '68b9a2f57443803491f8bec131d1c254', '8888', '23:59:56', '大悟县人民政府(府前街东)', 0, '192.168.0.104', '6bae0c16-84d8-4b23-9693-6621c08cd522', NULL);
INSERT INTO `user_sign` VALUES ('50816f497d97483483d7170b04b93ea6', '18952731-e1db-4415-90ff-197ff048b6b4', '99b9a2f574d94a3491f8bec131d1c502', '222', '22:13:04', '大悟县人民政府(府前街东)', 1, '192.168.0.104', '799c8d7e-bc3a-41f5-9d49-d256f075058d', NULL);
INSERT INTO `user_sign` VALUES ('67fc85cc07c546f0a707fd9110cd59f8', '18952731-e1db-4415-90ff-197ff048b6b4', '99b9a2f574d94a3491f8bec131d1c502', '222', '17:03:41', '大悟县人民政府(府前街东)', 1, '192.168.0.104', 'bbc7f50e-702a-4314-b70a-fd30e3d682eb', NULL);
INSERT INTO `user_sign` VALUES ('706b633f2ddb473787e6974353eea3ff', '746b85a3-b2d2-4d56-98f1-999eb7113253', '99b9a2f574d94a3491f8bec131d1c502', '222', '00:53:45', '假日广场中山市政府(松苑路北)', 0, '192.168.179.1', '544a246d-6427-4437-97aa-0d36bac401e0', '是');
INSERT INTO `user_sign` VALUES ('8b975fc74925400ea7aac6099c19d62e', '18952731-e1db-4415-90ff-197ff048b6b4', '99b9a2f574d94a3491f8bec131d1c502', '222', '22:13:11', '大悟县人民政府(府前街东)', 0, '192.168.0.104', '799c8d7e-bc3a-41f5-9d49-d256f075058d', NULL);
INSERT INTO `user_sign` VALUES ('c038872929af42a0b73f91f3257df895', 'c77112f8-30bd-491a-b6af-c1bb0dc95674', '68b9a2f57443803491f8bec131d1c254', '8888', '23:59:53', '大悟县人民政府(府前街东)', 1, '192.168.0.104', '6bae0c16-84d8-4b23-9693-6621c08cd522', NULL);
INSERT INTO `user_sign` VALUES ('e2dc9a82e3ba4994879698821aacaa1d', '64f5fa91-8c22-43e6-a63c-6184d84711ad', '99b9a2f574d94a3491f8bec131d1c502', '222', '00:46:30', '万柳中共北京市海淀区委员会', 1, '192.168.3.12', '430c839e-96d4-4768-b0a2-262ffff36048', NULL);
INSERT INTO `user_sign` VALUES ('f668c10c7d33460ba7165c1ba63c5f5c', '746b85a3-b2d2-4d56-98f1-999eb7113253', 'cf4ecc60a70b4e2ca4a617b403cfede6', 'stu1', '22:15:16', '假日广场中山市政府(松苑路北)', 1, '192.168.179.1', '544a246d-6427-4437-97aa-0d36bac401e0', '是');
INSERT INTO `user_sign` VALUES ('ffeabfc40e044b45b255a5a2e84a5463', '746b85a3-b2d2-4d56-98f1-999eb7113253', '99b9a2f574d94a3491f8bec131d1c502', '222', '00:53:39', '假日广场中山市政府(松苑路北)', 1, '192.168.179.1', '544a246d-6427-4437-97aa-0d36bac401e0', NULL);

-- ----------------------------
-- Table structure for work
-- ----------------------------
DROP TABLE IF EXISTS `work`;
CREATE TABLE `work`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `work_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业描述',
  `answer_begin_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `answer_end_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publish_user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '发布者id',
  `publish_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `class_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '班级',
  `course_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work
-- ----------------------------
INSERT INTO `work` VALUES ('1', '第一次', '好好好', NULL, NULL, '99b9a2f574d94a3491f8bec131d1c502', NULL, '746b85a3-b2d2-4d56-98f1-999eb7113253', '544a246d-6427-4437-97aa-0d36bac401e0');
INSERT INTO `work` VALUES ('b7049cf30cde493bbb57ddafc537bf47', '第二次', '666', NULL, NULL, '99b9a2f574d94a3491f8bec131d1c502', '2024-19-16 02:19:37', '746b85a3-b2d2-4d56-98f1-999eb7113253', '544a246d-6427-4437-97aa-0d36bac401e0');

SET FOREIGN_KEY_CHECKS = 1;
