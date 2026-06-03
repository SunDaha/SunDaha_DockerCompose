/*
 Navicat Premium Dump SQL

 Source Server         : Ubuntu
 Source Server Type    : MySQL
 Source Server Version : 90500 (9.5.0)
 Source Host           : 192.168.200.131:3306
 Source Schema         : daha_admin

 Target Server Type    : MySQL
 Target Server Version : 90500 (9.5.0)
 File Encoding         : 65001

 Date: 05/04/2026 16:21:45
*/
-- 设置客户端字符集
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;


-- 创建daha-admin数据库
CREATE DATABASE IF NOT EXISTS `daha-server` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `daha-server`;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '生成功能名',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '生成功能作者',
  `gen_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '生成类型（crud单表 tree树表）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径',
  `front_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'naive-ui' COMMENT '前端模板类型',
  `parent_menu_id` bigint NULL DEFAULT NULL COMMENT '上级菜单ID',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (4, 'student', '学生表', 'Student', 'com.mars.system', 'system', 'student', '学生表', 'Mars', 'crud', '/', 'naive-ui', NULL, NULL, '2026-02-09 12:44:26', '2026-02-09 12:44:26');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '列类型',
  `java_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'Java类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'Java字段名',
  `is_pk` tinyint NULL DEFAULT 0 COMMENT '是否主键（1是）',
  `is_increment` tinyint NULL DEFAULT 0 COMMENT '是否自增（1是）',
  `is_required` tinyint NULL DEFAULT 0 COMMENT '是否必填（1是）',
  `is_insert` tinyint NULL DEFAULT 0 COMMENT '是否为插入字段（1是）',
  `is_edit` tinyint NULL DEFAULT 0 COMMENT '是否编辑字段（1是）',
  `is_list` tinyint NULL DEFAULT 0 COMMENT '是否列表字段（1是）',
  `is_query` tinyint NULL DEFAULT 0 COMMENT '是否查询字段（1是）',
  `query_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式',
  `html_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '显示类型',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_table_id`(`table_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成字段表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (34, 4, 'id', 'id', 'bigint', 'Long', 'id', 1, 1, 1, 0, 0, 1, 1, 'EQ', 'input', '', 1);
INSERT INTO `gen_table_column` VALUES (35, 4, 'student_no', '学号', 'varchar(50)', 'String', 'studentNo', 0, 0, 1, 1, 1, 1, 0, 'EQ', 'input', '', 2);
INSERT INTO `gen_table_column` VALUES (36, 4, 'name', '姓名', 'varchar(50)', 'String', 'name', 0, 0, 1, 1, 1, 1, 1, 'EQ', 'input', '', 3);
INSERT INTO `gen_table_column` VALUES (37, 4, 'gender', '性别 1男 2女', 'tinyint', 'Integer', 'gender', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'select', '', 4);
INSERT INTO `gen_table_column` VALUES (38, 4, 'birthday', '出生日期', 'date', 'LocalDate', 'birthday', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'datetime', '', 5);
INSERT INTO `gen_table_column` VALUES (39, 4, 'phone', '手机号', 'varchar(20)', 'String', 'phone', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 6);
INSERT INTO `gen_table_column` VALUES (40, 4, 'email', '邮箱', 'varchar(100)', 'String', 'email', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 7);
INSERT INTO `gen_table_column` VALUES (41, 4, 'address', '地址', 'varchar(200)', 'String', 'address', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 8);
INSERT INTO `gen_table_column` VALUES (42, 4, 'class_id', '班级ID', 'bigint', 'Long', 'classId', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 9);
INSERT INTO `gen_table_column` VALUES (43, 4, 'status', '状态', 'tinyint', 'Integer', 'status', 0, 0, 0, 1, 1, 1, 1, 'EQ', 'select', '', 10);
INSERT INTO `gen_table_column` VALUES (44, 4, 'deleted', 'deleted', 'tinyint', 'Integer', 'deleted', 0, 0, 0, 0, 0, 0, 0, 'EQ', 'input', '', 11);
INSERT INTO `gen_table_column` VALUES (45, 4, 'create_time', 'create_time', 'datetime', 'LocalDateTime', 'createTime', 0, 0, 0, 0, 0, 1, 0, 'EQ', 'datetime', '', 12);
INSERT INTO `gen_table_column` VALUES (46, 4, 'update_time', 'update_time', 'datetime', 'LocalDateTime', 'updateTime', 0, 0, 0, 0, 0, 1, 0, 'EQ', 'datetime', '', 13);

-- ----------------------------
-- Table structure for order_addresses
-- ----------------------------
DROP TABLE IF EXISTS `order_addresses`;
CREATE TABLE `order_addresses`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint NOT NULL COMMENT '关联订单ID',
  `receiver_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收货人手机号',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市',
  `district` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区/县',
  `detail_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '详细地址',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_id`(`order_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单收货地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_addresses
-- ----------------------------

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint NOT NULL COMMENT '关联订单ID',
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号（冗余）',
  `product_id` bigint NOT NULL COMMENT '商品ID',
  `sku_id` bigint NOT NULL COMMENT 'SKU ID',
  `product_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称快照',
  `product_img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品图片快照',
  `sku_attrs` json NULL COMMENT '规格属性快照（颜色/尺码等）',
  `unit_price` decimal(12, 2) NOT NULL DEFAULT 0.00 COMMENT '下单时单价快照',
  `quantity` int NOT NULL DEFAULT 1 COMMENT '购买数量',
  `total_price` decimal(12, 2) NOT NULL DEFAULT 0.00 COMMENT '小计金额',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_sku_id`(`sku_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单商品明细表（含商品信息快照）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------

-- ----------------------------
-- Table structure for order_logistics
-- ----------------------------
DROP TABLE IF EXISTS `order_logistics`;
CREATE TABLE `order_logistics`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint NOT NULL COMMENT '关联订单ID',
  `logistics_company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '快递公司名称',
  `tracking_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '快递单号',
  `shipped_at` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `received_at` datetime NULL DEFAULT NULL COMMENT '签收时间',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_tracking_no`(`tracking_no` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单物流表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_logistics
-- ----------------------------

-- ----------------------------
-- Table structure for order_payments
-- ----------------------------
DROP TABLE IF EXISTS `order_payments`;
CREATE TABLE `order_payments`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `order_id` bigint NOT NULL COMMENT '关联订单ID',
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号（冗余）',
  `pay_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '第三方支付流水号',
  `pay_type` tinyint NOT NULL COMMENT '支付方式：1微信 2支付宝 3余额',
  `pay_amount` decimal(12, 2) NOT NULL DEFAULT 0.00 COMMENT '支付金额',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '支付状态：0待支付 1支付成功 2支付失败',
  `paid_at` datetime NULL DEFAULT NULL COMMENT '支付完成时间',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_pay_no`(`pay_no` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单支付记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_payments
-- ----------------------------

-- ----------------------------
-- Table structure for order_service_appointments
-- ----------------------------
DROP TABLE IF EXISTS `order_service_appointments`;
CREATE TABLE `order_service_appointments`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '预约用户ID',
  `order_id` bigint NULL DEFAULT NULL COMMENT '关联订单ID',
  `service_requirement_id` bigint NOT NULL COMMENT '关联服务要求ID',
  `appoint_date` date NOT NULL COMMENT '预约日期',
  `appoint_time_slot` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预约时间段，如 09:00-11:00',
  `service_address_id` bigint NOT NULL COMMENT '服务地址ID（关联服务地址表）',
  `contact_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系人姓名',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系人电话',
  `verify_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务核销码（上门时出示）',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态：0待确认 1已确认 2服务中 3已完成 4已取消',
  `confirmed_at` datetime NULL DEFAULT NULL COMMENT '确认时间',
  `started_at` datetime NULL DEFAULT NULL COMMENT '服务开始时间',
  `finished_at` datetime NULL DEFAULT NULL COMMENT '服务完成时间',
  `user_rating` tinyint NULL DEFAULT NULL COMMENT '用户评分 1-5',
  `user_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户评价',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_appoint_date`(`appoint_date` ASC) USING BTREE,
  INDEX `idx_verify_code`(`verify_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '上门服务预约表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_service_appointments
-- ----------------------------

-- ----------------------------
-- Table structure for order_status_logs
-- ----------------------------
DROP TABLE IF EXISTS `order_status_logs`;
CREATE TABLE `order_status_logs`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint NOT NULL COMMENT '关联订单ID',
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号（冗余）',
  `from_status` tinyint NULL DEFAULT NULL COMMENT '变更前状态',
  `to_status` tinyint NOT NULL COMMENT '变更后状态',
  `operator_type` tinyint NOT NULL DEFAULT 0 COMMENT '操作人类型：0系统 1买家 2卖家 3平台',
  `operator_id` bigint NULL DEFAULT NULL COMMENT '操作人ID',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单状态变更日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_status_logs
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号（全局唯一，业务可见）',
  `user_id` bigint NOT NULL COMMENT '买家用户ID',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '订单状态：0待付款 1待发货 2待收货 3已完成 4已取消 5退款中 6已退款',
  `total_amount` decimal(12, 2) NOT NULL DEFAULT 0.00 COMMENT '商品总金额',
  `pay_amount` decimal(12, 2) NOT NULL DEFAULT 0.00 COMMENT '实付金额',
  `discount_amount` decimal(12, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠金额',
  `freight_amount` decimal(12, 2) NOT NULL DEFAULT 0.00 COMMENT '运费',
  `pay_type` tinyint NULL DEFAULT NULL COMMENT '支付方式：1微信 2支付宝 3余额',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '买家备注',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime NULL DEFAULT NULL COMMENT '软删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_user_id_created`(`user_id` ASC, `created_at` ASC) USING BTREE,
  INDEX `idx_status_created`(`status` ASC, `created_at` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------




-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------


-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------


-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------


-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------


-- ----------------------------
-- Table structure for service_address
-- ----------------------------
DROP TABLE IF EXISTS `service_address`;
CREATE TABLE `service_address`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `contact_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系人姓名',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系人电话',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '市',
  `district` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '区',
  `detail_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '详细地址',
  `is_default` tinyint NULL DEFAULT 0 COMMENT '是否默认地址 1是 0否',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '服务地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service_address
-- ----------------------------

-- ----------------------------
-- Table structure for service_requirement
-- ----------------------------
DROP TABLE IF EXISTS `service_requirement`;
CREATE TABLE `service_requirement`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `requirement_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务要求名称',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务说明',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态 1启用 0禁用',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '服务要求表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service_requirement
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `gender` tinyint NULL DEFAULT NULL COMMENT '性别 1男 2女',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `class_id` bigint NULL DEFAULT NULL COMMENT '班级ID',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态',
  `deleted` tinyint NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (4, '12', '12', NULL, NULL, '1', '1', '1', 1, 1, 1, '2026-02-09 12:55:30', '2026-02-09 12:55:33');

-- ----------------------------
-- Table structure for sys_chat_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_chat_group`;
CREATE TABLE `sys_chat_group`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '群ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '群名称',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '群头像',
  `owner_id` bigint NOT NULL COMMENT '群主ID',
  `announcement` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '群公告',
  `max_members` int NULL DEFAULT 200 COMMENT '最大成员数',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态：0-解散 1-正常',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_owner_id`(`owner_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '群聊表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_chat_group
-- ----------------------------

-- ----------------------------
-- Table structure for sys_chat_group_member
-- ----------------------------
DROP TABLE IF EXISTS `sys_chat_group_member`;
CREATE TABLE `sys_chat_group_member`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` bigint NOT NULL COMMENT '群ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '群内昵称',
  `role` tinyint NULL DEFAULT 0 COMMENT '角色：0-普通成员 1-管理员 2-群主',
  `muted` tinyint NULL DEFAULT 0 COMMENT '是否禁言：0-否 1-是',
  `join_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_user`(`group_id` ASC, `user_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '群成员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_chat_group_member
-- ----------------------------

-- ----------------------------
-- Table structure for sys_chat_group_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_chat_group_message`;
CREATE TABLE `sys_chat_group_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `group_id` bigint NOT NULL COMMENT '群ID',
  `sender_id` bigint NOT NULL COMMENT '发送者ID',
  `sender_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发送者名称',
  `sender_avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发送者头像',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息内容',
  `msg_type` tinyint NULL DEFAULT 1 COMMENT '消息类型：1-文本 2-图片 3-文件 4-系统消息',
  `send_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_group_id`(`group_id` ASC) USING BTREE,
  INDEX `idx_send_time`(`send_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '群消息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_chat_group_message
-- ----------------------------

-- ----------------------------
-- Table structure for sys_chat_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_chat_message`;
CREATE TABLE `sys_chat_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `sender_id` bigint NOT NULL COMMENT '发送者ID',
  `sender_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发送者名称',
  `sender_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发送者头像',
  `receiver_id` bigint NOT NULL COMMENT '接收者ID(0表示群发)',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '消息内容',
  `msg_type` tinyint NULL DEFAULT 1 COMMENT '消息类型(1文本 2图片 3文件)',
  `is_read` tinyint NULL DEFAULT 0 COMMENT '是否已读(0未读 1已读)',
  `send_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sender_id`(`sender_id` ASC) USING BTREE,
  INDEX `idx_receiver_id`(`receiver_id` ASC) USING BTREE,
  INDEX `idx_send_time`(`send_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 491 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '聊天消息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_chat_message
-- ----------------------------
INSERT INTO `sys_chat_message` VALUES (490, 18, '孙大哈', NULL, 1, '你好(test)', 1, 1, '2026-03-15 16:26:23');

-- ----------------------------
-- Table structure for sys_config_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_config_group`;
CREATE TABLE `sys_config_group`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分组编码',
  `group_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分组名称',
  `group_icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分组图标',
  `config_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '配置值(JSON格式)',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0-禁用 1-启用)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_code`(`group_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统配置分组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config_group
-- ----------------------------
INSERT INTO `sys_config_group` VALUES (1, 'system', '系统配置', NULL, '{\"siteName\":\"Daha Admin\",\"siteDescription\":\"现代化企业级管理系统\",\"siteLogo\":\"\",\"copyright\":\"版权所有 © 孙大哈\",\"icp\":\"\",\"watermarkEnabled\":true,\"watermarkType\":\"sitename\",\"watermarkOpacity\":0.06}', 1, 1, NULL, '2026-01-31 14:38:29', '2026-01-31 14:38:29');
INSERT INTO `sys_config_group` VALUES (2, 'register', '注册配置', NULL, '{\"enabled\":true,\"verifyEmail\":false,\"verifyPhone\":false,\"defaultRole\":\"user\",\"needAudit\":false,\"captchaEnabled\":true}', 2, 1, NULL, '2026-01-31 14:38:29', '2026-03-15 05:51:36');
INSERT INTO `sys_config_group` VALUES (3, 'login', '登录配置', NULL, '{\"captchaEnabled\":true,\"captchaType\":\"image\",\"maxRetryCount\":5,\"lockTime\":30,\"rememberMe\":true,\"singleLogin\":false}', 3, 1, NULL, '2026-01-31 14:38:29', '2026-01-31 15:38:39');
INSERT INTO `sys_config_group` VALUES (4, 'password', '密码配置', NULL, '{\"minLength\":6,\"maxLength\":20,\"requireUppercase\":true,\"requireLowercase\":true,\"requireNumber\":true,\"requireSpecial\":true,\"expireDays\":0}', 4, 1, NULL, '2026-01-31 14:38:29', '2026-01-31 14:38:29');
INSERT INTO `sys_config_group` VALUES (5, 'email', '邮件配置', NULL, '{\"host\":\"smtp.qq.com\",\"port\":465,\"username\":\"623070891@qq.com\",\"password\":\"pbfbulghhkqmbedj\",\"fromName\":\"Daha管理系统\",\"ssl\":true,\"enabled\":true}', 5, 1, NULL, '2026-01-31 14:38:29', '2026-01-31 22:13:14');
INSERT INTO `sys_config_group` VALUES (6, 'emailTemplate', '邮件模板', NULL, '{\"verifyCode\":\"您的验证码是：{code}，有效期{expire}分钟。\",\"resetPassword\":\"您正在重置密码，验证码：{code}，有效期{expire}分钟。\",\"welcome\":\"欢迎注册{siteName}，您的账号已创建成功。\"}', 6, 1, NULL, '2026-01-31 14:38:29', '2026-01-31 14:38:29');
INSERT INTO `sys_config_group` VALUES (7, 'sms', '短信配置', NULL, '{\"provider\":\"aliyun\",\"accessKeyId\":\"\",\"accessKeySecret\":\"\",\"signName\":\"\",\"enabled\":false}', 7, 1, NULL, '2026-01-31 14:38:29', '2026-01-31 14:38:29');
INSERT INTO `sys_config_group` VALUES (9, 'storage', '文件配置', NULL, '{\"provider\":\"minio\",\"domain\":\"http://localhost:8080\",\"localPath\":\"./uploads\",\"maxSize\":10,\"allowTypes\":\"jpg,jpeg,png,gif,webp,bmp,ico,svg,pdf,doc,docx,xls,xlsx,ppt,pptx,txt,md,csv,xml,json,yaml,yml,html,htm,css,js,ts,vue,java,py,go,sql,sh,bat,mp4,avi,mov,wmv,flv,mkv,webm,mp3,wav,ogg,flac,aac,zip,rar,7z,tar,gz,apk,exe,dmg\",\"minioEndpoint\":\"http://192.168.200.131:9000\",\"minioAccessKey\":\"admin\",\"minioSecretKey\":\"Admin@123456\",\"minioBucket\":\"daha-admin\",\"aliyunEndpoint\":\"https://oss-cn-beijing.aliyuncs.com\",\"aliyunAccessKey\":\"LTAI5tEPLV6eFkXgFiRcNAj1\",\"aliyunSecretKey\":\"rOOOUyxCxFsxfWru1NojIycWMOvCWJ\",\"aliyunBucket\":\"mars-coder\",\"tencentSecretId\":\"\",\"tencentSecretKey\":\"\",\"tencentBucket\":\"\",\"tencentRegion\":\"\"}', 9, 1, NULL, '2026-01-31 14:38:29', '2026-02-02 17:02:01');
INSERT INTO `sys_config_group` VALUES (10, 'push', '推送配置', NULL, '{\r\n  \"enabled\": false,\r\n  \"provider\": \"console\",\r\n  \"appKey\": \"\",\r\n  \"masterSecret\": \"\"\r\n}', 10, 1, NULL, '2026-01-31 14:38:29', '2026-01-31 16:26:34');
INSERT INTO `sys_config_group` VALUES (11, 'thirdParty', '第三方配置', NULL, '{\"wechat\":{\"enabled\":false,\"appId\":\"\",\"appSecret\":\"\"},\"alipay\":{\"enabled\":false,\"appId\":\"\",\"privateKey\":\"\",\"publicKey\":\"\"},\"github\":{\"enabled\":false,\"clientId\":\"\",\"clientSecret\":\"\"}}', 11, 1, NULL, '2026-01-31 14:38:29', '2026-01-31 14:38:29');
INSERT INTO `sys_config_group` VALUES (12, 'payment', '支付配置', NULL, '{\"wechatPay\":{\"enable\":true,\"appId\":\"wxd645023453542\",\"mchId\":\"345634532\",\"apiKey\":\"\",\"apiKey3\":\"8AalkBRNbrz3X0NdnN87IoYAgwjBDnY4\",\"keyPath\":\"\",\"publicKeyPath\":\"\",\"certPath\":\"\",\"certP12Path\":\"\",\"platformCertPath\":\"\",\"domain\":\"\"},\"aliPay\":{\"enable\":true,\"appId\":\"2021005192689177\",\"privateKey\":\"MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCc1KF+8tqemN/+k99xwIxtfrZ8Py7ZtSv6zoDa0Z9pW1IWpYmz+Zm1wtF3CTX5xApyyBTWQgK8Pb/oEz4u4zKzuwcZFX/IdfP2mWaMHRvWnDLunWqH8rQO+JOaWDvzA68lL02AfubuafQldXY+hdeOpt+t5Kj/OnC+o4z0qTAcM9uTpeX9Z8lttlcW9JtCATRP+klr52bRaOcACgh3MIJrQ3OteeiikvbVtZtw4u3X2h5tdRlCl2/youKO6/iZXGmAmtTGRU8Iy8iBAMI6Ow8K6XH5xHccTzTOx8xv1PZ2IszVvMVhLJDXaUg4DyVbhN8hrmKFmu1i9eBbdSZixkNpAgMBAAECggEAXDjFBqu0VxK6lS9Lc86wRSsAECvvVuIsjH2mVAZ0YTXsHZkWUpjyBGodVow6Czd2lWyGpD+I8Dy3frbiGBxOElZmpB96VtzVqyslnDr5xcdwQ9SZcnwL2cnesiI0joCaG5mnT2pQTd5MTUK3V6jIyv/iBJWzsvIgnln6Z1yeB9ai/3c5Lvu0/ZnhC7trqD73BB1x49E0AV90y0/C/IA+FLEKio9/asdcd3/fepcL8/asdesad+lFnPtewI8FAaVX4mI3AQKBgQDO8GxdEunrmRuOXbv/JqTj0dG2lXT7kUvDdJ6QVr3HIsmyxkZXQsp/7QdXh/FdRBNFwkOirmClUqrvYq3CbytgjNdxmYdZQ2A/YXqDdTs8J2Li36hbkOPIFNyMZsjtYF39eosf2oF0/ydRSlMqW5B6jpUh5qCYVWkVtUjLuXaM2QKBgQDCAwMqd6Um9X50dKNIqY1X2ImLiRdLVaqn4/pTwylxxIrRO9f5jF7PnenDci809+Sc+yCcZarvdh1QbUE+YGhYOjj2WGaB9sS2TGDFzOguGs7m7hCIQPa6VEyP2I07kaZcpb+r5GqnT9U47mPRcLJe3zop+w3B7cW5JcdtOSCREQKBgQCbpbALzWcOIoncado2Dk3lYPJ4fy+O6/jtWTDOZb+2IQ9OHN3ZUk5XK+PizUgYm1RXmscefEQK9QPGrBT/cnhQ1X5SXmS0Gf4xjdMFP06/buxsskbCIFeDLVW5cLHeASaQufQckE/gvO1IsjudV2NzGv1Gk13lVhCFGGZZfPSS+QKBgG4y2dSAWx1y6d3p9mkqbW9NPms0djfDNAji9GgpfVvyoErSbA2BzsSs1H/AVtIGUCNefRp4oQwdEe+B70In7nzWrU43zhnZ+cf2QC16AxNVBNqktF1AUSRrB4XZIfeI9m6/csyHFJFuRhVtSuNG2PoMX3RC9oCFtv5AWDNQ9I+RAoGAZF1dQs826kCeptQHXnlgTGNNIX9jLGyfO2qysBOCcqwFIrcJpsb11Q1xLrQmju6EHzr4kAINp32Qd5fo/oCM25JuSiw+fK6CgkAEYjSr/9dD4KpGicHmsib3GyfPj850K2RwFz2RckwX+If/NgI3dIecMTgTJ0tfytaaeqFH4PY=\",\"publicKey\":\"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiwci3m6eLWeR1kgfeWm/F0V1e68VWUyRB4N5mhnxryTHqiLeN8ilxN9Kn/Ute1C9cL3b4hfx3NYk7zt60QWP9ly8QJQOlqd1H7XsG16AlEpsIaN1SrMYWq16nAD6uwvMmK0nTdzhuNIKOfdC2YWyv3AJTWh0nCTddYV2D+eSH/Ui6xkfgK8pFn/X1Q0xjXvuZrsXxF+WTk5mymEy2u4Kp7/rD/lClfNAv68kOHe92iKj1VzhtROrSp5//xuvL2PA7FLMqo5olZpBmda3eMWgnvHNwvaJvHJENN2ubANwMPNkwMkQ7MKLCBI33fzEERxJBACrJCc6lo8t+wq3zDo/uwIDAQAB\",\"appCertPath\":\"\",\"aliPayCertPath\":\"\",\"aliPayRootCertPath\":\"\",\"serverUrl\":\"https://openapi.alipay.com/gateway.do\",\"domain\":\"\"}}', 12, 1, NULL, '2026-01-31 14:38:29', '2026-03-12 09:11:05');
INSERT INTO `sys_config_group` VALUES (13, 'security', '安全配置', NULL, '{\"encryptEnabled\":false,\"encryptScope\":\"global\",\"encryptPublicKey\":\"DSADASDASDASDASDDSAD+asdasdDDASEEEW3432/aVEUOm60SHm7OXFAbuwUeuo6Pu2P7qPffXiqCXBdC1joo7VywNlapnmkwXP6jhuP+oHM31BvG2uInv40LHocUIRbMhREavnw+By7kT3Cq2SmgLBGsRkoIrpAuMBe47n8DjRGq2cvFde/ASDEWQEQW/GJg5WruQ1piicy9YgbOhjWnmb6gJ1RUU9xypNeHI/jLQCdjBn4NGQFtD73v36/WFnv4MgFAZV6iKr5kSdQIDAQAB\",\"encryptPrivateKey\":\"ASDKFDIIOOERWKD45345/dasd7324/9pURQ6brRIebs5cUBu7BR66jo+7Y/uo999eKoJcF0LWOijtXLA2VqmeaTBc/qOG4/6gczfUG8ba4ie/jQsehxQhFsyFERq+fD4HLuRPcKrZKaAsEaxGSgiukC4wF7jufwONEarZy8V178SgKE7S47QDGVNSl81dq1QMYfQ20IQl4QKgwGSDicjQkA+dkROSKa6tuvI8WgBWTmV38YmDlau5DWmKJzL1iBs6GNaeZvqAnVFRT3HKk14cj+MtAJ2MGfg0ZAW0Pve/fr9YWe/gyAUBlXqIqvmRJ1AgMBAAECggEAIOYACRCK2EPJXDOGMqXDwc4nKMn8Zc9/AqjztqesJwiHyN1ygQT6rJGx7jIEaGdTNZtxaiztI01x+TkKUhRzfZ20XpkHFj4edxNnMYyZKfrQi0LtsEitqLD1icRNpmj23MpjQZP22SnTmYivJd2ljNJADTSnJUO1tPF5nAQUohipaHm9ikipKzT+Qa605nj1TvG1NF1a0y/IElBGb5FFyQGISgUoiPh8/aZXeO5pS6YMJTTQul/9Q7f9fwJFrzPl3qqc3kDxYjagJcPtV5VmX/nSrMpeLnaTvRIg78ocwNF+XYJ5L1Sr9wxYEADykw4P8E0ijGYynSeZlo0u+asdDCAs+4KQrR0r1HHGFWJPtFVKcwjC+EIm9I1S+gTOjZ/6SG45upDqlHtmCOMf1drRFhSehdD6UHUFL4xN/fAxkP3F+iKU/KfJy6yclCuhW+k0Efi6W4mKR9ZkhINJvVibsNdA0vXQa603bbr7hfHVeJl1xI761htsnEFuwKBgQDqW1s5f67gXowzjmK6a40Z+/DIoHBTd267zOIEknhUg6oaMtW1v/yPjwWrf6wJmpUFO3Mq3xTDd/k1iXBOke2vHmZG2AplNVScreRx20lRBmzuGe+9sSDozTfFJO25oPhH86wmIAmqMB5nu1L1TJjbKRAU+hcdC+v22NWMQ48tjwKBgALF9kIt2pO73Ol8mFi0s9JaWRz7FCiF8/iuehxmAHR1l2xHXdKb4rY9G9fpIEprmmh8Z10S7h1/OTTAkPpnmVV/ZUWsQcmxIGJDV+D32vyjwKu5QAdWMNSQLbuG4sN9vYU1bgPnbc6N8DW6vMPJ4D96Ngtw6QZri+v/wI0FrbNpAoGAcpvuxvXMXemfAu+VFLnYLWbqYBMmG4uC2dDej4HZ2urw2xMVNGcJamN1UGOFjMTOL9rc/ZBPJTCc7TOjeqke5c8mEWtB2jD0ihL4bz3gYwGTb/W7Krde8rq5lW3z3B3+jaF7BMISN+qEVBJmBZRKBJPWS4vqlcfow7VS6d94O70CgYBTLo2LdYZV9rn7FGmgC9/fuJOgWEfeqmunNx8SsYUjaXSyy+Vb+dlgH/YRfypb37rxxsNwWQKggZww6gSO1/TkFoV73W035XBKbMB3XLEFHp2v75qYBYEHvVpW1YEl2QGlUzOUWXrP5G/3v8O0/+5yJwjKcmkWDjPGIIKj8GPZsQ==\",\"xssFilter\":true,\"sqlInject\":true,\"tokenName\":\"Authorization\",\"tokenTimeout\":3600,\"tokenActiveTimeout\":86400,\"tokenIsConcurrent\":true,\"tokenIsShare\":true,\"tokenStyle\":\"uuid\",\"tokenIsLog\":false,\"tokenIsReadBody\":false,\"tokenIsReadCookie\":false,\"tokenIsReadHeader\":true,\"tokenIsPrint\":true,\"tokenIsWriteHeader\":false}', 13, 1, NULL, '2026-01-31 14:38:29', '2026-02-07 16:04:06');
INSERT INTO `sys_config_group` VALUES (15, 'wechatMiniProgram', '小程序配置', NULL, '{\"enabled\":true,\"appId\":\"wxd64503333b29542\",\"appSecret\":\"a4b13452342346b9e4cb5d\"}', 14, 1, '微信小程序登录配置', '2026-02-03 10:48:41', '2026-02-03 10:48:41');
INSERT INTO `sys_config_group` VALUES (16, 'wechatMp', '公众号配置', NULL, '{\"enabled\":true,\"appId\":\"wx12721c4ea1370b36\",\"appSecret\":\"f860891f96df4fffe78f0424b913aedd\",\"token\":\"mars_coding_wechat_token1\",\"aesKey\":\"zBtP7b8qZKCSW2eU7Ozm6Jyapv5PCQu2Vxpj1v72qBP\",\"callbackUrl\":\"https://api.mars-coder.cn/api/wechat/callback\",\"oauthRedirectUrl\":\"http://localhost:3001/login\",\"menuConfig\":\"\"}', 15, 1, '微信公众号配置', '2026-02-03 10:48:41', '2026-02-03 10:48:41');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门ID',
  `ancestors` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门名称',
  `sort` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0-停用 1-正常)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识(0-未删除 1-已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 0, '0', '主管部', 0, '管理员', NULL, NULL, 1, '2026-01-29 22:42:08', '2026-03-10 11:11:08', NULL, 1, 0);
INSERT INTO `sys_dept` VALUES (2, 1, '0,1', '技术部', 1, '张三', NULL, NULL, 1, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dept` VALUES (3, 1, '0,1', '产品部', 2, '李四', NULL, NULL, 1, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dept` VALUES (4, 1, '0,1', '运营部', 3, '王五', NULL, NULL, 1, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` tinyint NULL DEFAULT 0 COMMENT '是否默认(0-否 1-是)',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0-停用 1-正常)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识(0-未删除 1-已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '1', 'sys_user_sex', NULL, 'default', 0, 1, NULL, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '2', 'sys_user_sex', NULL, 'default', 0, 1, NULL, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '0', 'sys_user_sex', NULL, 'default', 0, 1, NULL, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dict_data` VALUES (4, 1, '正常', '1', 'sys_status', NULL, 'success', 0, 1, NULL, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dict_data` VALUES (5, 2, '停用', '0', 'sys_status', NULL, 'error', 0, 1, NULL, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dict_data` VALUES (6, 1, '是', '1', 'sys_yes_no', NULL, 'success', 0, 1, NULL, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dict_data` VALUES (7, 2, '否', '0', 'sys_yes_no', NULL, 'error', 0, 1, NULL, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dict_data` VALUES (8, 0, 'sex', '1', 'sex', NULL, 'default', 0, 1, '', '2026-01-29 23:21:38', '2026-01-29 23:21:38', 1, 1, 0);
INSERT INTO `sys_dict_data` VALUES (9, 0, '女', '0', 'sex', NULL, 'default', 0, 1, '', '2026-01-29 23:21:58', '2026-01-29 23:21:58', 1, 1, 0);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典类型',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0-停用 1-正常)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识(0-未删除 1-已删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', 1, '用户性别列表', '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dict_type` VALUES (2, '系统状态', 'sys_status', 1, '系统通用状态', '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dict_type` VALUES (3, '是否', 'sys_yes_no', 1, '是否选项', '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_dict_type` VALUES (4, '性别', 'sex', 1, '', '2026-01-29 23:21:29', '2026-02-07 15:33:54', 1, 1, 1);
INSERT INTO `sys_dict_type` VALUES (5, '111', '222', 1, '', '2026-02-07 19:42:53', '2026-02-07 23:26:19', 1, 1, 1);
INSERT INTO `sys_dict_type` VALUES (6, '222', '333', 1, '', '2026-02-07 19:43:46', '2026-02-07 23:26:17', 1, 1, 1);

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `original_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '原始文件名',
  `file_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '存储文件名',
  `file_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件路径',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '文件访问URL',
  `file_size` bigint NULL DEFAULT 0 COMMENT '文件大小（字节）',
  `file_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '文件类型（MIME类型）',
  `file_suffix` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '文件后缀',
  `storage_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '存储类型',
  `bucket_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '存储桶名称',
  `group_id` bigint NULL DEFAULT NULL COMMENT '分组ID',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_file_path`(`file_path`(191) ASC) USING BTREE,
  INDEX `idx_storage_type`(`storage_type` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_group_id`(`group_id` ASC) USING BTREE,
  INDEX `idx_file_type`(`file_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (8, '1.jpg', '72b14b562a7b4f6c81e9a3cc95bae644.jpg', 'avatar/1/72b14b562a7b4f6c81e9a3cc95bae644.jpg', '/api/files/avatar/1/72b14b562a7b4f6c81e9a3cc95bae644.jpg', 31263, 'image/jpeg', '.jpg', 'local', '', NULL, '', '1', '2026-03-13 00:05:50');
INSERT INTO `sys_file` VALUES (12, 'Avatar_Default.jpg', 'a98c796ed86e496b98c7718bb3bc0b77.jpg', '2026/04/02/a98c796ed86e496b98c7718bb3bc0b77.jpg', 'http://192.168.200.131:9000/daha-admin/2026/04/02/a98c796ed86e496b98c7718bb3bc0b77.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=admin%2F20260402%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20260402T151552Z&X-Amz-Expires=300&X-Amz-SignedHeaders=host&X-Amz-Signature=6c7ba8fd58aab6d6bd5cffac4726e83c7998e65487019eaee50b6ffe54cc3573', 80172, 'image/jpeg', '.jpg', 'minio', '', NULL, '', '1', '2026-04-02 23:15:53');
INSERT INTO `sys_file` VALUES (13, '关键词.txt', 'a6adf4e6b0e649f9867514938c4c9ab2.txt', '2026/04/02/a6adf4e6b0e649f9867514938c4c9ab2.txt', 'http://192.168.200.131:9000/daha-admin/2026/04/02/a6adf4e6b0e649f9867514938c4c9ab2.txt?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=admin%2F20260402%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20260402T151615Z&X-Amz-Expires=300&X-Amz-SignedHeaders=host&X-Amz-Signature=029e228f159f6aab769c5187f9c22553a4200b670ad03c80f30bf43d9fea0133', 52, 'text/plain', '.txt', 'minio', '', NULL, '', '1', '2026-04-02 23:16:15');

-- ----------------------------
-- Table structure for sys_file_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_config`;
CREATE TABLE `sys_file_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '配置名称',
  `storage_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '存储类型(local/minio/aliyun)',
  `master` tinyint NULL DEFAULT 0 COMMENT '是否为主配置(0否 1是)',
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问域名',
  `base_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '基础路径(本地存储)',
  `bucket_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存储桶名称',
  `access_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问密钥',
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '秘密密钥',
  `endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '端点地址',
  `region` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地域',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0禁用 1启用)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_storage_type`(`storage_type` ASC) USING BTREE,
  INDEX `idx_master`(`master` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件存储配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file_config
-- ----------------------------
INSERT INTO `sys_file_config` VALUES (1, '本地存储', 'local', 1, 'http://localhost:8080', 'D:/uploads', NULL, NULL, NULL, NULL, NULL, 1, '默认本地存储配置', NULL, '2026-01-30 23:35:08', NULL, '2026-01-30 23:35:08');

-- ----------------------------
-- Table structure for sys_file_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_group`;
CREATE TABLE `sys_file_group`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分组ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分组名称',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件分组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file_group
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'cron执行表达式',
  `misfire_policy` tinyint NULL DEFAULT 3 COMMENT '计划执行错误策略(1-立即执行 2-执行一次 3-放弃执行)',
  `concurrent` tinyint NULL DEFAULT 1 COMMENT '是否并发执行(0-允许 1-禁止)',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态(0-暂停 1-正常)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识(0-未删除 1-已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'sampleTask.noParams', '0/10 * * * * ?', 3, 1, 0, '无参数的示例任务', '2026-01-29 22:42:08', '2026-03-05 07:11:28', 1, 1, 0);
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'sampleTask.withParams(\'hello\')', '0/15 * * * * ?', 3, 1, 0, '有参数的示例任务', '2026-01-29 22:42:08', '2026-03-05 07:11:29', 1, 1, 0);
INSERT INTO `sys_job` VALUES (3, '系统默认（多参数）', 'DEFAULT', 'sampleTask.noParams(\'参数\',true,10L,0.5D,100)', '0/10 * * * * ?', 3, 1, 0, '多参数的示例任务', '2026-01-29 22:59:47', '2026-03-05 07:11:08', 1, 1, 0);

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` tinyint NULL DEFAULT 0 COMMENT '执行状态(0-正常 1-失败)',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '异常信息',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `stop_time` datetime NULL DEFAULT NULL COMMENT '停止时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务日志表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作系统',
  `status` tinyint NULL DEFAULT 0 COMMENT '登录状态(0-成功 1-失败)',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 268 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '登录日志表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父级ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `type` tinyint NOT NULL COMMENT '菜单类型(1-目录 2-菜单 3-按钮)',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由地址',
  `component` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `permission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `visible` tinyint NULL DEFAULT 1 COMMENT '是否可见(0-隐藏 1-显示)',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0-禁用 1-启用)',
  `is_frame` tinyint NULL DEFAULT 0 COMMENT '是否外链(0-否 1-是)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识(0-未删除 1-已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 279 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', 1, '/system', NULL, NULL, 'SettingsOutline', 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2, 1, '用户管理', 2, '/system/user', '/system/user/index', 'sys:user:list', 'PersonOutline', 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (3, 2, '新增用户', 3, NULL, NULL, 'sys:user:add', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (4, 2, '编辑用户', 3, NULL, NULL, 'sys:user:edit', NULL, 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (5, 2, '删除用户', 3, NULL, NULL, 'sys:user:delete', NULL, 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (6, 1, '角色管理', 2, '/system/role', '/system/role/index', 'sys:role:list', 'PeopleOutline', 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (7, 6, '新增角色', 3, NULL, NULL, 'sys:role:add', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '编辑角色', 3, NULL, NULL, 'sys:role:edit', NULL, 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '删除角色', 3, NULL, NULL, 'sys:role:delete', NULL, 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 1, '菜单管理', 2, '/system/menu', '/system/menu/index', 'sys:menu:list', 'MenuOutline', 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 10, '新增菜单', 3, NULL, NULL, 'sys:menu:add', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 10, '编辑菜单', 3, NULL, NULL, 'sys:menu:edit', NULL, 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 10, '删除菜单', 3, NULL, NULL, 'sys:menu:delete', NULL, 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 1, '字典管理', 2, '/system/dict', '/system/dict/index', 'sys:dict:list', 'BookOutline', 4, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 14, '新增字典', 3, NULL, NULL, 'sys:dict:add', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 14, '编辑字典', 3, NULL, NULL, 'sys:dict:edit', NULL, 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 14, '删除字典', 3, NULL, NULL, 'sys:dict:delete', NULL, 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 1, '系统配置', 2, '/system/config', '/system/config/index', 'sys:config:list', 'SettingsSharp', 5, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 18, '新增配置', 3, NULL, NULL, 'sys:config:add', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 18, '编辑配置', 3, NULL, NULL, 'sys:config:edit', NULL, 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 18, '删除配置', 3, NULL, NULL, 'sys:config:delete', NULL, 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 0, '组织管理', 1, '/org', NULL, NULL, 'BusinessOutline', 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 22, '部门管理', 2, '/org/dept', '/org/dept/index', 'sys:dept:list', 'GitNetworkOutline', 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 23, '新增部门', 3, NULL, NULL, 'sys:dept:add', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 23, '编辑部门', 3, NULL, NULL, 'sys:dept:edit', NULL, 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 23, '删除部门', 3, NULL, NULL, 'sys:dept:delete', NULL, 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 22, '岗位管理', 2, '/org/post', '/org/post/index', 'sys:post:list', 'IdCardOutline', 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (28, 27, '新增岗位', 3, NULL, NULL, 'sys:post:add', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (29, 27, '编辑岗位', 3, NULL, NULL, 'sys:post:edit', NULL, 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (30, 27, '删除岗位', 3, NULL, NULL, 'sys:post:delete', NULL, 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (31, 0, '系统日志', 1, '/log', NULL, NULL, 'DocumentTextOutline', 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (32, 31, '操作日志', 2, '/log/operlog', '/log/operlog/index', 'monitor:operlog:list', 'ListOutline', 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (33, 32, '删除日志', 3, NULL, NULL, 'monitor:operlog:delete', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (34, 31, '登录日志', 2, '/log/loginlog', '/log/loginlog/index', 'monitor:loginlog:list', 'LogInOutline', 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (35, 34, '删除日志', 3, NULL, NULL, 'monitor:loginlog:delete', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-03-15 07:10:33', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (36, 31, '注册日志', 2, '/log/registerlog', '/log/registerlog/index', 'monitor:registerlog:list', 'PersonAddOutline', 3, 1, 1, 0, '2026-01-29 22:42:10', '2026-03-16 03:25:14', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (37, 36, '删除日志', 3, NULL, NULL, 'monitor:registerlog:delete', NULL, 1, 1, 1, 0, '2026-01-29 22:53:08', '2026-03-15 07:10:33', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (38, 0, '系统监控', 1, '/monitor', NULL, NULL, 'PulseOutline', 4, 1, 1, 0, '2026-01-29 22:42:08', '2026-03-15 07:16:38', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (39, 38, '在线用户', 2, '/monitor/online', '/monitor/online/index', 'monitor:online:list', 'PeopleCircleOutline', 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-03-15 07:16:48', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (40, 39, '强退用户', 3, NULL, NULL, 'monitor:online:forceLogout', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-03-15 07:16:50', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (41, 38, '定时任务', 2, '/monitor/job', '/monitor/job/index', 'monitor:job:list', 'TimerOutline', 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-03-15 07:16:52', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (42, 41, '新增任务', 3, NULL, NULL, 'monitor:job:add', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-03-15 07:16:55', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (43, 41, '编辑任务', 3, NULL, NULL, 'monitor:job:edit', NULL, 2, 1, 1, 0, '2026-01-29 22:42:08', '2026-03-15 07:16:55', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (44, 41, '删除任务', 3, NULL, NULL, 'monitor:job:delete', NULL, 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-03-15 07:16:56', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (45, 38, '缓存监控', 2, '/monitor/cache', '/monitor/cache/index', 'monitor:cache:list', 'ServerOutline', 3, 1, 1, 0, '2026-01-29 22:42:08', '2026-03-15 07:16:59', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (46, 45, '删除缓存', 3, NULL, NULL, 'monitor:cache:delete', NULL, 1, 1, 1, 0, '2026-01-29 22:42:08', '2026-03-15 07:17:05', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (47, 38, '服务监控', 2, '/monitor/server', '/monitor/server/index', 'monitor:server:list', 'DesktopOutline', 4, 1, 1, 0, '2026-01-29 22:42:08', '2026-03-15 07:17:11', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (126, 0, '文件管理', 1, '/file', NULL, NULL, 'FolderOpenOutline', 5, 1, 1, 0, '2026-01-30 23:40:01', '2026-01-30 23:40:01', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (127, 126, '文件列表', 2, '/system/file', '/system/file/index', 'sys:file:list', 'DocumentOutline', 1, 1, 1, 0, '2026-01-30 23:40:01', '2026-01-30 23:40:01', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (128, 127, '上传文件', 3, NULL, NULL, 'sys:file:upload', NULL, 1, 1, 1, 0, '2026-01-30 23:40:01', '2026-01-30 23:40:01', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (129, 127, '删除文件', 3, NULL, NULL, 'sys:file:delete', NULL, 2, 1, 1, 0, '2026-01-30 23:40:01', '2026-01-30 23:40:01', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (130, 126, '文件配置', 2, '/system/file-config', '/system/file-config/index', 'sys:fileConfig:list', 'CloudOutline', 2, 1, 1, 0, '2026-01-30 23:40:01', '2026-01-31 14:43:52', NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (131, 130, '新增配置', 3, NULL, NULL, 'sys:fileConfig:add', NULL, 1, 1, 1, 0, '2026-01-30 23:40:01', '2026-01-31 14:43:45', NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (132, 130, '编辑配置', 3, NULL, NULL, 'sys:fileConfig:edit', NULL, 2, 1, 1, 0, '2026-01-30 23:40:01', '2026-01-31 14:43:47', NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (133, 130, '删除配置', 3, NULL, NULL, 'sys:fileConfig:delete', NULL, 3, 1, 1, 0, '2026-01-30 23:40:01', '2026-01-31 14:43:50', NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (134, 0, '消息中心', 1, '/message', NULL, NULL, 'NotificationsOutline', 6, 1, 1, 0, '2026-01-30 23:53:55', '2026-01-30 23:53:55', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (135, 134, '系统通知', 2, '/message/notice', '/message/notice/index', 'sys:notice:list', 'NotificationsOutline', 1, 1, 1, 0, '2026-01-30 23:53:55', '2026-01-30 23:53:55', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (136, 135, '新增通知', 3, NULL, NULL, 'sys:notice:add', NULL, 1, 1, 1, 0, '2026-01-30 23:53:55', '2026-01-30 23:53:55', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (137, 135, '编辑通知', 3, NULL, NULL, 'sys:notice:edit', NULL, 2, 1, 1, 0, '2026-01-30 23:53:55', '2026-01-30 23:53:55', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (138, 135, '删除通知', 3, NULL, NULL, 'sys:notice:delete', NULL, 3, 1, 1, 0, '2026-01-30 23:53:55', '2026-01-30 23:53:55', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (139, 134, '即时聊天', 2, '/message/chat', '/message/chat/index', 'sys:chat:list', 'ChatbubbleOutline', 2, 1, 1, 0, '2026-01-30 23:53:55', '2026-01-30 23:53:55', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (140, 0, '测试菜单', 1, '/test', '', '', 'StarOutline', 7, 0, 0, 0, '2026-01-31 20:17:37', '2026-01-31 20:17:37', 1, 1, 0);
INSERT INTO `sys_menu` VALUES (141, 140, '测试菜单', 2, '/test/test', '/test/test/index', '', 'SearchOutline', 0, 1, 1, 0, '2026-01-31 20:23:37', '2026-01-31 20:23:37', 1, 1, 0);
INSERT INTO `sys_menu` VALUES (142, 2, '用户列表', 3, '', '', 'sys:user:list', '', 0, 1, 1, 0, '2026-01-31 20:51:50', '2026-01-31 20:51:50', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (143, 6, '角色列表', 3, '', '', 'sys:role:list', '', 0, 1, 1, 0, '2026-01-31 20:52:13', '2026-01-31 20:52:13', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (144, 10, '菜单列表', 3, '', '', 'sys:menu:list', '', 0, 1, 1, 0, '2026-01-31 20:52:32', '2026-01-31 20:52:32', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (145, 14, '字典列表', 3, '', '', 'sys:dict:list', '', 0, 1, 1, 0, '2026-01-31 20:52:52', '2026-01-31 20:52:52', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (146, 23, '部门列表', 3, '', '', 'sys:dept:list', '', 0, 1, 1, 0, '2026-01-31 20:54:26', '2026-01-31 20:54:26', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (147, 27, '岗位列表', 3, '', '', 'sys:post:list', '', 0, 1, 1, 0, '2026-01-31 20:54:45', '2026-01-31 20:54:45', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (148, 32, '查询日志', 3, '', '', 'monitor:operlog:list', '', 0, 1, 1, 0, '2026-01-31 20:55:14', '2026-01-31 20:55:14', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (149, 34, '日志列表', 3, '', '', 'monitor:loginlog:list', '', 0, 1, 1, 0, '2026-01-31 20:55:32', '2026-01-31 20:55:32', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (150, 39, '在线用户列表', 3, '', '', 'monitor:online:list', '', 0, 1, 1, 0, '2026-01-31 20:56:04', '2026-03-15 07:24:28', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (151, 41, '任务列表', 3, '', '', 'monitor:job:list', '', 0, 1, 1, 0, '2026-01-31 20:56:20', '2026-03-15 07:24:51', 4, 4, 0);
INSERT INTO `sys_menu` VALUES (152, 127, '文件列表', 3, '', '', 'sys:file:list', '', 0, 1, 1, 0, '2026-01-31 20:57:18', '2026-01-31 20:57:18', 1, 1, 0);
INSERT INTO `sys_menu` VALUES (153, 135, '系统通知', 3, '', '', 'sys:notice:list', '', 0, 1, 1, 0, '2026-01-31 20:57:55', '2026-01-31 20:57:55', 1, 1, 0);
INSERT INTO `sys_menu` VALUES (154, 38, '服务器管理', 2, '/monitor/server-manager', '/monitor/server-manager/index', NULL, 'ServerOutline', 5, 1, 1, 0, '2026-01-31 23:37:21', '2026-03-15 07:31:44', NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (155, 154, '服务器列表', 3, NULL, NULL, 'monitor:server:list', NULL, 1, 1, 1, 0, '2026-01-31 23:37:21', '2026-01-31 23:37:21', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (156, 154, '服务器详情', 3, NULL, NULL, 'monitor:server:query', NULL, 2, 1, 1, 0, '2026-01-31 23:37:21', '2026-01-31 23:37:21', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (157, 154, '新增服务器', 3, NULL, NULL, 'monitor:server:add', NULL, 3, 1, 1, 0, '2026-01-31 23:37:21', '2026-01-31 23:37:21', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (158, 154, '编辑服务器', 3, NULL, NULL, 'monitor:server:edit', NULL, 4, 1, 1, 0, '2026-01-31 23:37:21', '2026-01-31 23:37:21', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (159, 154, '删除服务器', 3, NULL, NULL, 'monitor:server:remove', NULL, 5, 1, 1, 0, '2026-01-31 23:37:21', '2026-01-31 23:37:21', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (160, 154, '测试连接', 3, NULL, NULL, 'monitor:server:test', NULL, 6, 1, 1, 0, '2026-01-31 23:37:21', '2026-01-31 23:37:21', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (161, 0, '开发工具', 1, '', '', '', 'HammerOutline', 99, 1, 1, 0, '2026-02-02 19:50:38', '2026-02-02 19:52:36', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (162, 161, '代码生成', 2, '/tool/gen', '/tool/gen/index', '', 'CodeSlashOutline', 1, 1, 1, 0, '2026-02-02 19:50:38', '2026-02-02 19:53:12', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (163, 162, '查询', 3, '', '', 'tool:gen:list', '', 1, 1, 1, 0, '2026-02-02 19:50:38', '2026-02-02 19:52:40', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (164, 162, '详情', 3, '', '', 'tool:gen:query', '', 2, 1, 1, 0, '2026-02-02 19:50:38', '2026-02-02 19:52:40', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (165, 162, '导入', 3, '', '', 'tool:gen:import', '', 3, 1, 1, 0, '2026-02-02 19:50:38', '2026-02-02 19:52:40', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (166, 162, '编辑', 3, '', '', 'tool:gen:edit', '', 4, 1, 1, 0, '2026-02-02 19:50:38', '2026-02-02 19:52:40', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (167, 162, '删除', 3, '', '', 'tool:gen:remove', '', 5, 1, 1, 0, '2026-02-02 19:50:38', '2026-02-02 19:52:40', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (168, 162, '预览', 3, '', '', 'tool:gen:preview', '', 6, 1, 1, 0, '2026-02-02 19:50:38', '2026-02-02 19:52:40', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (169, 162, '生成代码', 3, '', '', 'tool:gen:code', '', 7, 1, 1, 0, '2026-02-02 19:50:38', '2026-02-02 19:52:40', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (170, 1, '客户表', 2, '/system/customer', '/system/customer/index', '', 'ListOutline', 1, 0, 0, 0, '2026-02-02 19:57:54', '2026-02-02 19:57:54', NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (171, 170, '客户表查询', 3, '', '', 'system:customer:list', '', 1, 1, 1, 0, '2026-02-02 19:57:54', '2026-02-02 19:57:54', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (172, 170, '客户表详情', 3, '', '', 'system:customer:query', '', 2, 1, 1, 0, '2026-02-02 19:57:54', '2026-02-02 19:57:54', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (173, 170, '客户表新增', 3, '', '', 'system:customer:add', '', 3, 1, 1, 0, '2026-02-02 19:57:54', '2026-02-02 19:57:54', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (174, 170, '客户表修改', 3, '', '', 'system:customer:edit', '', 4, 1, 1, 0, '2026-02-02 19:57:54', '2026-02-02 19:57:54', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (175, 170, '客户表删除', 3, '', '', 'system:customer:remove', '', 5, 1, 1, 0, '2026-02-02 19:57:54', '2026-02-02 19:57:54', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (272, 161, '学生管理', 2, 'system/student', 'system/student/index', 'system:student:list', 'ListOutline', 1, 1, 1, 0, '2026-02-03 08:58:09', '2026-02-09 12:55:57', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (273, 272, '学生管理查询', 3, NULL, NULL, 'system:student:list', NULL, 1, 1, 1, 0, '2026-02-03 08:58:09', '2026-02-09 12:55:57', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (274, 272, '学生管理详情', 3, NULL, NULL, 'system:student:query', NULL, 2, 1, 1, 0, '2026-02-03 08:58:09', '2026-02-09 12:55:57', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (275, 272, '学生管理新增', 3, NULL, NULL, 'system:student:add', NULL, 3, 1, 1, 0, '2026-02-03 08:58:09', '2026-02-09 12:55:57', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (276, 272, '学生管理修改', 3, NULL, NULL, 'system:student:edit', NULL, 4, 1, 1, 0, '2026-02-03 08:58:09', '2026-02-09 12:55:57', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (277, 272, '学生管理删除', 3, NULL, NULL, 'system:student:remove', NULL, 5, 1, 1, 0, '2026-02-03 08:58:09', '2026-02-09 12:55:57', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (278, 36, '日志列表', 3, '', '', 'monitor:loginlog:list', '', 0, 1, 1, 0, '2026-03-15 15:37:38', '2026-03-15 15:37:38', 1, 1, 0);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '通知ID',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '通知标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '通知内容',
  `notice_type` tinyint NULL DEFAULT 1 COMMENT '通知类型(1通知 2公告)',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态(0草稿 1发布)',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者ID',
  `create_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者名称',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_notice_type`(`notice_type` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统通知表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型(0-其它 1-新增 2-修改 3-删除)',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方式',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人员',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主机地址',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态(0-正常 1-异常)',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 399 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父岗位ID',
  `post_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `sort` int NULL DEFAULT 0 COMMENT '显示顺序',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0-停用 1-正常)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识(0-未删除 1-已删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_post_code`(`post_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 0, 'ceo', '董事长', 1, 1, '公司董事长', '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, NULL, 0);
INSERT INTO `sys_post` VALUES (2, 6, 'cto', '技术总监', 2, 1, '技术总监', '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, 1, 0);
INSERT INTO `sys_post` VALUES (3, 2, 'pm', '产品经理', 3, 1, '产品经理', '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, 1, 0);
INSERT INTO `sys_post` VALUES (4, 2, 'dev', '开发工程师', 4, 1, '开发工程师', '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, 1, 0);
INSERT INTO `sys_post` VALUES (6, 1, 'manager', '总经理', 2, 1, '', '2026-01-29 22:42:08', '2026-01-29 22:42:08', 1, 1, 0);
INSERT INTO `sys_post` VALUES (7, 2, 'test_coder', '测试工程师', 0, 1, '', '2026-02-09 15:47:35', '2026-02-09 17:03:40', 1, 1, 1);

-- ----------------------------
-- Table structure for sys_register_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_register_log`;
CREATE TABLE `sys_register_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '注册用户名',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '注册ip地址',
  `register_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '注册所在地',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作系统',
  `status` tinyint NULL DEFAULT NULL COMMENT '注册状态(0-成功，1-失败，2-等待审核)',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '提示信息',
  `register_time` datetime NULL DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_register_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色编码',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0-禁用 1-启用)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识(0-未删除 1-已删除)',
  `data_scope` tinyint NOT NULL DEFAULT 1 COMMENT '数据范围(1全部 2自定义 3本部门 4本部门及以下 5仅本人)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, 1, '拥有所有权限', '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, 1, 0, 1);
INSERT INTO `sys_role` VALUES (2, '普通用户', 'user', 2, 1, '普通用户角色', '2026-01-29 22:42:08', '2026-01-29 22:42:08', NULL, 1, 0, 3);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL,
  `dept_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_role_dept`(`role_id` ASC, `dept_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色-部门 数据权限关联' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE,
  INDEX `idx_menu_id`(`menu_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7696 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (7457, 2, 139);
INSERT INTO `sys_role_menu` VALUES (7458, 2, 153);
INSERT INTO `sys_role_menu` VALUES (7459, 2, 136);
INSERT INTO `sys_role_menu` VALUES (7460, 2, 137);
INSERT INTO `sys_role_menu` VALUES (7461, 2, 138);
INSERT INTO `sys_role_menu` VALUES (7462, 2, 150);
INSERT INTO `sys_role_menu` VALUES (7463, 2, 38);
INSERT INTO `sys_role_menu` VALUES (7464, 2, 151);
INSERT INTO `sys_role_menu` VALUES (7465, 2, 40);
INSERT INTO `sys_role_menu` VALUES (7466, 2, 41);
INSERT INTO `sys_role_menu` VALUES (7467, 2, 42);
INSERT INTO `sys_role_menu` VALUES (7468, 2, 44);
INSERT INTO `sys_role_menu` VALUES (7469, 2, 45);
INSERT INTO `sys_role_menu` VALUES (7470, 2, 155);
INSERT INTO `sys_role_menu` VALUES (7471, 2, 156);
INSERT INTO `sys_role_menu` VALUES (7472, 2, 157);
INSERT INTO `sys_role_menu` VALUES (7473, 2, 158);
INSERT INTO `sys_role_menu` VALUES (7474, 2, 159);
INSERT INTO `sys_role_menu` VALUES (7475, 2, 160);
INSERT INTO `sys_role_menu` VALUES (7476, 2, 148);
INSERT INTO `sys_role_menu` VALUES (7477, 2, 33);
INSERT INTO `sys_role_menu` VALUES (7478, 2, 149);
INSERT INTO `sys_role_menu` VALUES (7479, 2, 35);
INSERT INTO `sys_role_menu` VALUES (7480, 2, 142);
INSERT INTO `sys_role_menu` VALUES (7481, 2, 3);
INSERT INTO `sys_role_menu` VALUES (7482, 2, 4);
INSERT INTO `sys_role_menu` VALUES (7483, 2, 5);
INSERT INTO `sys_role_menu` VALUES (7484, 2, 171);
INSERT INTO `sys_role_menu` VALUES (7485, 2, 172);
INSERT INTO `sys_role_menu` VALUES (7486, 2, 173);
INSERT INTO `sys_role_menu` VALUES (7487, 2, 174);
INSERT INTO `sys_role_menu` VALUES (7488, 2, 175);
INSERT INTO `sys_role_menu` VALUES (7489, 2, 143);
INSERT INTO `sys_role_menu` VALUES (7490, 2, 7);
INSERT INTO `sys_role_menu` VALUES (7491, 2, 8);
INSERT INTO `sys_role_menu` VALUES (7492, 2, 9);
INSERT INTO `sys_role_menu` VALUES (7493, 2, 144);
INSERT INTO `sys_role_menu` VALUES (7494, 2, 11);
INSERT INTO `sys_role_menu` VALUES (7495, 2, 12);
INSERT INTO `sys_role_menu` VALUES (7496, 2, 13);
INSERT INTO `sys_role_menu` VALUES (7497, 2, 145);
INSERT INTO `sys_role_menu` VALUES (7498, 2, 15);
INSERT INTO `sys_role_menu` VALUES (7499, 2, 16);
INSERT INTO `sys_role_menu` VALUES (7500, 2, 17);
INSERT INTO `sys_role_menu` VALUES (7501, 2, 19);
INSERT INTO `sys_role_menu` VALUES (7502, 2, 20);
INSERT INTO `sys_role_menu` VALUES (7503, 2, 21);
INSERT INTO `sys_role_menu` VALUES (7504, 2, 146);
INSERT INTO `sys_role_menu` VALUES (7505, 2, 24);
INSERT INTO `sys_role_menu` VALUES (7506, 2, 25);
INSERT INTO `sys_role_menu` VALUES (7507, 2, 26);
INSERT INTO `sys_role_menu` VALUES (7508, 2, 147);
INSERT INTO `sys_role_menu` VALUES (7509, 2, 28);
INSERT INTO `sys_role_menu` VALUES (7510, 2, 29);
INSERT INTO `sys_role_menu` VALUES (7511, 2, 30);
INSERT INTO `sys_role_menu` VALUES (7512, 2, 152);
INSERT INTO `sys_role_menu` VALUES (7513, 2, 128);
INSERT INTO `sys_role_menu` VALUES (7514, 2, 129);
INSERT INTO `sys_role_menu` VALUES (7515, 2, 141);
INSERT INTO `sys_role_menu` VALUES (7516, 2, 163);
INSERT INTO `sys_role_menu` VALUES (7517, 2, 164);
INSERT INTO `sys_role_menu` VALUES (7518, 2, 165);
INSERT INTO `sys_role_menu` VALUES (7519, 2, 166);
INSERT INTO `sys_role_menu` VALUES (7520, 2, 167);
INSERT INTO `sys_role_menu` VALUES (7521, 2, 168);
INSERT INTO `sys_role_menu` VALUES (7522, 2, 169);
INSERT INTO `sys_role_menu` VALUES (7605, 1, 7);
INSERT INTO `sys_role_menu` VALUES (7606, 1, 8);
INSERT INTO `sys_role_menu` VALUES (7607, 1, 9);
INSERT INTO `sys_role_menu` VALUES (7608, 1, 143);
INSERT INTO `sys_role_menu` VALUES (7609, 1, 142);
INSERT INTO `sys_role_menu` VALUES (7610, 1, 3);
INSERT INTO `sys_role_menu` VALUES (7611, 1, 4);
INSERT INTO `sys_role_menu` VALUES (7612, 1, 5);
INSERT INTO `sys_role_menu` VALUES (7613, 1, 144);
INSERT INTO `sys_role_menu` VALUES (7614, 1, 11);
INSERT INTO `sys_role_menu` VALUES (7615, 1, 12);
INSERT INTO `sys_role_menu` VALUES (7616, 1, 13);
INSERT INTO `sys_role_menu` VALUES (7617, 1, 145);
INSERT INTO `sys_role_menu` VALUES (7618, 1, 15);
INSERT INTO `sys_role_menu` VALUES (7619, 1, 16);
INSERT INTO `sys_role_menu` VALUES (7620, 1, 17);
INSERT INTO `sys_role_menu` VALUES (7621, 1, 19);
INSERT INTO `sys_role_menu` VALUES (7622, 1, 20);
INSERT INTO `sys_role_menu` VALUES (7623, 1, 21);
INSERT INTO `sys_role_menu` VALUES (7624, 1, 146);
INSERT INTO `sys_role_menu` VALUES (7625, 1, 24);
INSERT INTO `sys_role_menu` VALUES (7626, 1, 25);
INSERT INTO `sys_role_menu` VALUES (7627, 1, 26);
INSERT INTO `sys_role_menu` VALUES (7628, 1, 147);
INSERT INTO `sys_role_menu` VALUES (7629, 1, 28);
INSERT INTO `sys_role_menu` VALUES (7630, 1, 29);
INSERT INTO `sys_role_menu` VALUES (7631, 1, 30);
INSERT INTO `sys_role_menu` VALUES (7632, 1, 148);
INSERT INTO `sys_role_menu` VALUES (7633, 1, 33);
INSERT INTO `sys_role_menu` VALUES (7634, 1, 149);
INSERT INTO `sys_role_menu` VALUES (7635, 1, 35);
INSERT INTO `sys_role_menu` VALUES (7636, 1, 150);
INSERT INTO `sys_role_menu` VALUES (7637, 1, 38);
INSERT INTO `sys_role_menu` VALUES (7638, 1, 151);
INSERT INTO `sys_role_menu` VALUES (7639, 1, 40);
INSERT INTO `sys_role_menu` VALUES (7640, 1, 41);
INSERT INTO `sys_role_menu` VALUES (7641, 1, 42);
INSERT INTO `sys_role_menu` VALUES (7642, 1, 44);
INSERT INTO `sys_role_menu` VALUES (7643, 1, 45);
INSERT INTO `sys_role_menu` VALUES (7644, 1, 153);
INSERT INTO `sys_role_menu` VALUES (7645, 1, 136);
INSERT INTO `sys_role_menu` VALUES (7646, 1, 137);
INSERT INTO `sys_role_menu` VALUES (7647, 1, 138);
INSERT INTO `sys_role_menu` VALUES (7648, 1, 139);
INSERT INTO `sys_role_menu` VALUES (7649, 1, 141);
INSERT INTO `sys_role_menu` VALUES (7650, 1, 155);
INSERT INTO `sys_role_menu` VALUES (7651, 1, 156);
INSERT INTO `sys_role_menu` VALUES (7652, 1, 157);
INSERT INTO `sys_role_menu` VALUES (7653, 1, 158);
INSERT INTO `sys_role_menu` VALUES (7654, 1, 159);
INSERT INTO `sys_role_menu` VALUES (7655, 1, 160);
INSERT INTO `sys_role_menu` VALUES (7656, 1, 171);
INSERT INTO `sys_role_menu` VALUES (7657, 1, 172);
INSERT INTO `sys_role_menu` VALUES (7658, 1, 173);
INSERT INTO `sys_role_menu` VALUES (7659, 1, 174);
INSERT INTO `sys_role_menu` VALUES (7660, 1, 175);
INSERT INTO `sys_role_menu` VALUES (7661, 1, 152);
INSERT INTO `sys_role_menu` VALUES (7662, 1, 128);
INSERT INTO `sys_role_menu` VALUES (7663, 1, 129);
INSERT INTO `sys_role_menu` VALUES (7664, 1, 2);
INSERT INTO `sys_role_menu` VALUES (7665, 1, 170);
INSERT INTO `sys_role_menu` VALUES (7666, 1, 6);
INSERT INTO `sys_role_menu` VALUES (7667, 1, 10);
INSERT INTO `sys_role_menu` VALUES (7668, 1, 14);
INSERT INTO `sys_role_menu` VALUES (7669, 1, 18);
INSERT INTO `sys_role_menu` VALUES (7670, 1, 23);
INSERT INTO `sys_role_menu` VALUES (7671, 1, 27);
INSERT INTO `sys_role_menu` VALUES (7672, 1, 32);
INSERT INTO `sys_role_menu` VALUES (7673, 1, 34);
INSERT INTO `sys_role_menu` VALUES (7674, 1, 37);
INSERT INTO `sys_role_menu` VALUES (7675, 1, 39);
INSERT INTO `sys_role_menu` VALUES (7676, 1, 43);
INSERT INTO `sys_role_menu` VALUES (7677, 1, 154);
INSERT INTO `sys_role_menu` VALUES (7678, 1, 127);
INSERT INTO `sys_role_menu` VALUES (7679, 1, 135);
INSERT INTO `sys_role_menu` VALUES (7680, 1, 1);
INSERT INTO `sys_role_menu` VALUES (7681, 1, 22);
INSERT INTO `sys_role_menu` VALUES (7682, 1, 31);
INSERT INTO `sys_role_menu` VALUES (7683, 1, 36);
INSERT INTO `sys_role_menu` VALUES (7684, 1, 126);
INSERT INTO `sys_role_menu` VALUES (7685, 1, 134);
INSERT INTO `sys_role_menu` VALUES (7686, 1, 140);
INSERT INTO `sys_role_menu` VALUES (7687, 1, 161);
INSERT INTO `sys_role_menu` VALUES (7688, 1, 162);
INSERT INTO `sys_role_menu` VALUES (7689, 1, 163);
INSERT INTO `sys_role_menu` VALUES (7690, 1, 164);
INSERT INTO `sys_role_menu` VALUES (7691, 1, 165);
INSERT INTO `sys_role_menu` VALUES (7692, 1, 166);
INSERT INTO `sys_role_menu` VALUES (7693, 1, 167);
INSERT INTO `sys_role_menu` VALUES (7694, 1, 168);
INSERT INTO `sys_role_menu` VALUES (7695, 1, 169);

-- ----------------------------
-- Table structure for sys_server
-- ----------------------------
DROP TABLE IF EXISTS `sys_server`;
CREATE TABLE `sys_server`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务器名称',
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务器地址',
  `port` int NOT NULL DEFAULT 22 COMMENT 'SSH端口',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `auth_type` tinyint NOT NULL DEFAULT 1 COMMENT '认证方式：1-密码 2-密钥',
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码（加密存储）',
  `private_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '私钥内容',
  `passphrase` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '私钥密码（加密存储）',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-禁用 1-启用',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `last_connect_time` datetime NULL DEFAULT NULL COMMENT '最后连接时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除：0-否 1-是',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_deleted`(`deleted` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '服务器管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_server
-- ----------------------------
INSERT INTO `sys_server` VALUES (1, '测试服务器', '47.108.187.25', 22, 'root', 1, '111', '', '', '', 1, 0, '2026-02-07 09:52:27', 1, '2026-01-31 23:46:31', 1, '2026-02-07 09:52:27', 0);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `gender` tinyint NULL DEFAULT 0 COMMENT '性别(0-未知 1-男 2-女)',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0-禁用 1-启用)',
  `is_quit` tinyint NULL DEFAULT 0 COMMENT '是否离职(0-否 1-是)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `user_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'admin' COMMENT '用户类型(admin-后台管理员 pc-PC前台用户 app-App/小程序用户)',
  `open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信openId(微信扫码登录时使用)',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识(0-未删除 1-已删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username` ASC) USING BTREE,
  INDEX `idx_open_id`(`open_id` ASC) USING BTREE,
  INDEX `idx_user_type`(`user_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 1, 'admin', '$2a$10$qcRKcAcyUd4dSrJqTz5BR.U2Phas9QsfIPU7Pyi3Ha15CplWNnkaG', '超级管理员', '/api/files/avatar/1/72b14b562a7b4f6c81e9a3cc95bae644.jpg', '', NULL, 0, 1, 0, NULL, '2026-01-29 22:42:08', '2026-03-10 02:52:21', NULL, 1, 'admin', NULL, 0);

-- ----------------------------
-- Table structure for sys_user_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_blacklist`;
CREATE TABLE `sys_user_blacklist`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `blocked_user_id` bigint NOT NULL COMMENT '被拉黑的用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '拉黑时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_blocked`(`user_id` ASC, `blocked_user_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_blocked_user_id`(`blocked_user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户黑名单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_blacklist
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_notice`;
CREATE TABLE `sys_user_notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `notice_id` bigint NOT NULL COMMENT '通知ID',
  `is_read` tinyint NULL DEFAULT 0 COMMENT '是否已读(0未读 1已读)',
  `read_time` datetime NULL DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_notice`(`user_id` ASC, `notice_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_notice_id`(`notice_id` ASC) USING BTREE,
  INDEX `idx_is_read`(`is_read` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户通知关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_post_id`(`post_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1, 1);
INSERT INTO `sys_user_post` VALUES (7, 18, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1);
INSERT INTO `sys_user_role` VALUES (39, 18, 2);
INSERT INTO `sys_user_role` VALUES (47, 26, 2);

SET FOREIGN_KEY_CHECKS = 1;
