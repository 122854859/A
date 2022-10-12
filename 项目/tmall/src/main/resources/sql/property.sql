/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80025
Source Host           : localhost:3306
Source Database       : tmalldemodb

Target Server Type    : MYSQL
Target Server Version : 80025
File Encoding         : 65001

Date: 2022-10-10 13:52:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for property
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property` (
  `property_id` int NOT NULL AUTO_INCREMENT,
  `property_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称',
  `property_category_id` int NOT NULL COMMENT '关联类别id',
  PRIMARY KEY (`property_id`) USING BTREE,
  KEY `property_category_id` (`property_category_id`) USING BTREE,
  CONSTRAINT `property_ibfk_1` FOREIGN KEY (`property_category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='类别属性表';

-- ----------------------------
-- Records of property
-- ----------------------------
INSERT INTO `property` VALUES ('1', '材质成分', '1');
INSERT INTO `property` VALUES ('2', '服装版型', '1');
INSERT INTO `property` VALUES ('3', '风格', '1');
INSERT INTO `property` VALUES ('4', '衣长', '1');
INSERT INTO `property` VALUES ('5', '袖长', '1');
INSERT INTO `property` VALUES ('6', '领型', '1');
INSERT INTO `property` VALUES ('7', '图案', '1');
INSERT INTO `property` VALUES ('8', '品牌', '1');
INSERT INTO `property` VALUES ('9', '适用年龄', '1');
INSERT INTO `property` VALUES ('10', '年份季节', '1');
INSERT INTO `property` VALUES ('11', '颜色分类', '1');
INSERT INTO `property` VALUES ('12', '尺码', '1');
INSERT INTO `property` VALUES ('13', '材质成分', '2');
INSERT INTO `property` VALUES ('14', '服装版型', '2');
INSERT INTO `property` VALUES ('15', '风格', '2');
INSERT INTO `property` VALUES ('16', '衣长', '2');
INSERT INTO `property` VALUES ('17', '袖长', '2');
INSERT INTO `property` VALUES ('18', '领型', '2');
INSERT INTO `property` VALUES ('19', '图案', '2');
INSERT INTO `property` VALUES ('20', '品牌', '2');
INSERT INTO `property` VALUES ('21', '适用年龄', '2');
INSERT INTO `property` VALUES ('22', '年份季节', '2');
INSERT INTO `property` VALUES ('23', '颜色分类', '2');
INSERT INTO `property` VALUES ('24', '尺码', '2');
INSERT INTO `property` VALUES ('25', '品牌', '3');
INSERT INTO `property` VALUES ('26', '上市年份季节', '3');
INSERT INTO `property` VALUES ('27', '帮面材质', '3');
INSERT INTO `property` VALUES ('28', '鞋底材质', '3');
INSERT INTO `property` VALUES ('29', '鞋头款式', '3');
INSERT INTO `property` VALUES ('30', '后跟高', '3');
INSERT INTO `property` VALUES ('31', '跟底款式', '3');
INSERT INTO `property` VALUES ('32', '鞋帮高度', '3');
INSERT INTO `property` VALUES ('33', '颜色分类', '3');
INSERT INTO `property` VALUES ('34', '尺码', '3');
INSERT INTO `property` VALUES ('35', '后帮', '3');
INSERT INTO `property` VALUES ('41', '是否商场同款', '5');
INSERT INTO `property` VALUES ('42', '品牌', '5');
INSERT INTO `property` VALUES ('43', '型号', '5');
INSERT INTO `property` VALUES ('44', '机芯类型', '5');
INSERT INTO `property` VALUES ('45', '手表种类', '5');
INSERT INTO `property` VALUES ('46', '风格', '5');
INSERT INTO `property` VALUES ('47', '表带材质', '5');
INSERT INTO `property` VALUES ('48', '形状', '5');
INSERT INTO `property` VALUES ('49', '显示方式', '5');
INSERT INTO `property` VALUES ('50', '上市时间', '5');
INSERT INTO `property` VALUES ('51', '颜色分类', '5');
INSERT INTO `property` VALUES ('52', '防水深度', '5');
INSERT INTO `property` VALUES ('53', '品牌产地', '5');
INSERT INTO `property` VALUES ('54', '证书编号', '6');
INSERT INTO `property` VALUES ('55', '证书状态', '6');
INSERT INTO `property` VALUES ('56', '产品名称', '6');
INSERT INTO `property` VALUES ('57', '3C规格型号', '6');
INSERT INTO `property` VALUES ('58', '产品名称', '6');
INSERT INTO `property` VALUES ('59', '品牌名称', '6');
INSERT INTO `property` VALUES ('60', 'CPU型号', '6');
INSERT INTO `property` VALUES ('61', '机身颜色', '6');
INSERT INTO `property` VALUES ('62', '网络模式', '6');
INSERT INTO `property` VALUES ('63', '品牌', '7');
INSERT INTO `property` VALUES ('64', '安全等级', '7');
INSERT INTO `property` VALUES ('65', '材质成分', '7');
INSERT INTO `property` VALUES ('66', '货号', '7');
INSERT INTO `property` VALUES ('67', '适用性别', '7');
INSERT INTO `property` VALUES ('68', '颜色分类', '7');
INSERT INTO `property` VALUES ('69', '参考身高', '7');
INSERT INTO `property` VALUES ('70', '款式', '7');
INSERT INTO `property` VALUES ('71', '风格', '7');
INSERT INTO `property` VALUES ('72', '适用季节', '7');
INSERT INTO `property` VALUES ('73', '面料', '7');
INSERT INTO `property` VALUES ('74', '衣门襟', '7');
INSERT INTO `property` VALUES ('75', '袖长', '7');
INSERT INTO `property` VALUES ('76', '生产许可编号', '8');
INSERT INTO `property` VALUES ('77', '产品标准号', '8');
INSERT INTO `property` VALUES ('78', '厂名', '8');
INSERT INTO `property` VALUES ('79', '厂址', '8');
INSERT INTO `property` VALUES ('80', '厂家联系方式', '8');
INSERT INTO `property` VALUES ('81', '配料表', '8');
INSERT INTO `property` VALUES ('82', '储藏方法', '8');
INSERT INTO `property` VALUES ('83', '保质期', '8');
INSERT INTO `property` VALUES ('84', '食品添加剂', '8');
INSERT INTO `property` VALUES ('85', '净含量', '8');
INSERT INTO `property` VALUES ('86', '包装方式', '8');
INSERT INTO `property` VALUES ('87', '包装种类', '8');
INSERT INTO `property` VALUES ('88', '品牌', '8');
INSERT INTO `property` VALUES ('89', '系列', '8');
INSERT INTO `property` VALUES ('90', '有机食品', '8');
INSERT INTO `property` VALUES ('91', '食品口味', '8');
INSERT INTO `property` VALUES ('92', '是否含糖', '8');
INSERT INTO `property` VALUES ('93', '产地', '8');
INSERT INTO `property` VALUES ('94', '省份', '8');
INSERT INTO `property` VALUES ('95', '城市', '8');
INSERT INTO `property` VALUES ('96', '厂名', '9');
INSERT INTO `property` VALUES ('97', '厂址', '9');
INSERT INTO `property` VALUES ('98', '厂家联系方式', '9');
INSERT INTO `property` VALUES ('99', '配料表', '9');
INSERT INTO `property` VALUES ('100', '储藏方法', '9');
INSERT INTO `property` VALUES ('101', '保质期', '9');
INSERT INTO `property` VALUES ('102', '食品添加剂', '9');
INSERT INTO `property` VALUES ('103', '个数', '9');
INSERT INTO `property` VALUES ('104', '净含量', '9');
INSERT INTO `property` VALUES ('105', '包装方式', '9');
INSERT INTO `property` VALUES ('106', '原产地', '9');
INSERT INTO `property` VALUES ('107', '同城服务', '9');
INSERT INTO `property` VALUES ('108', '品牌', '9');
INSERT INTO `property` VALUES ('109', '售卖方式', '9');
INSERT INTO `property` VALUES ('110', '有机食品', '9');
INSERT INTO `property` VALUES ('111', '生鲜储存温度', '9');
INSERT INTO `property` VALUES ('112', '热卖时间', '9');
INSERT INTO `property` VALUES ('113', '产地', '9');
INSERT INTO `property` VALUES ('114', '省份', '9');
INSERT INTO `property` VALUES ('115', '城市', '9');
INSERT INTO `property` VALUES ('116', '套餐份量', '9');
INSERT INTO `property` VALUES ('117', '套餐周期', '9');
INSERT INTO `property` VALUES ('118', '配送频次', '9');
INSERT INTO `property` VALUES ('119', '特产品类', '9');
INSERT INTO `property` VALUES ('120', '价格', '9');
INSERT INTO `property` VALUES ('121', '水果种类', '9');
INSERT INTO `property` VALUES ('122', '证书编号', '10');
INSERT INTO `property` VALUES ('123', '证书状态', '10');
INSERT INTO `property` VALUES ('124', '产品名称', '10');
INSERT INTO `property` VALUES ('125', '3C规格型号', '10');
INSERT INTO `property` VALUES ('127', '保修期', '10');
INSERT INTO `property` VALUES ('128', '品牌', '10');
INSERT INTO `property` VALUES ('129', '型号', '10');
INSERT INTO `property` VALUES ('130', '能效等级', '10');
INSERT INTO `property` VALUES ('131', '空调类型', '10');
INSERT INTO `property` VALUES ('132', '分辨率', '10');
INSERT INTO `property` VALUES ('133', '工作方式', '10');
INSERT INTO `property` VALUES ('134', '适用面积', '10');
INSERT INTO `property` VALUES ('135', '产品类型', '10');
INSERT INTO `property` VALUES ('136', '使用方式', '10');
INSERT INTO `property` VALUES ('137', '电机类型', '10');
INSERT INTO `property` VALUES ('138', '品牌', '11');
INSERT INTO `property` VALUES ('139', '型号', '11');
INSERT INTO `property` VALUES ('140', '安装辅材包', '11');
INSERT INTO `property` VALUES ('141', '计价单位', '11');
INSERT INTO `property` VALUES ('142', '颜色分类', '11');
INSERT INTO `property` VALUES ('143', '厚度', '11');
INSERT INTO `property` VALUES ('144', '基材', '11');
INSERT INTO `property` VALUES ('145', '尺寸', '11');
INSERT INTO `property` VALUES ('146', '材质', '11');
INSERT INTO `property` VALUES ('147', '品牌', '12');
INSERT INTO `property` VALUES ('148', '型号', '12');
INSERT INTO `property` VALUES ('149', '汽车品牌', '12');
INSERT INTO `property` VALUES ('150', '适用季节', '12');
INSERT INTO `property` VALUES ('151', '表层材质', '12');
INSERT INTO `property` VALUES ('152', '颜色分类', '12');
INSERT INTO `property` VALUES ('153', '主要材质含量', '12');
INSERT INTO `property` VALUES ('154', '图案', '12');
INSERT INTO `property` VALUES ('155', '座位数', '12');
INSERT INTO `property` VALUES ('156', '替换原车套', '12');
INSERT INTO `property` VALUES ('157', '发动机种类', '12');
INSERT INTO `property` VALUES ('158', '产品名称', '12');
INSERT INTO `property` VALUES ('159', '净含量', '12');
INSERT INTO `property` VALUES ('160', '机油分类', '12');
INSERT INTO `property` VALUES ('161', '粘度级别', '12');
INSERT INTO `property` VALUES ('162', '机油级别', '12');
INSERT INTO `property` VALUES ('163', '品牌', '13');
INSERT INTO `property` VALUES ('164', '产品等级', '13');
INSERT INTO `property` VALUES ('165', '制造工艺', '13');
INSERT INTO `property` VALUES ('166', '尺寸', '13');
INSERT INTO `property` VALUES ('167', '羽绒羽毛种类', '13');
INSERT INTO `property` VALUES ('168', '被套织造工艺', '13');
INSERT INTO `property` VALUES ('169', '被套面料', '13');
INSERT INTO `property` VALUES ('170', '被子种类', '13');
INSERT INTO `property` VALUES ('171', '绒子含量', '13');
INSERT INTO `property` VALUES ('172', '货号', '13');
INSERT INTO `property` VALUES ('173', '适用季节', '13');
INSERT INTO `property` VALUES ('174', '颜色分类', '13');
INSERT INTO `property` VALUES ('175', '适用场景', '13');
INSERT INTO `property` VALUES ('176', '鲜花主花材', '13');
INSERT INTO `property` VALUES ('177', '适用对象', '13');
INSERT INTO `property` VALUES ('178', '鲜花朵数', '13');
INSERT INTO `property` VALUES ('179', '适用节日', '13');
INSERT INTO `property` VALUES ('180', '绿植工艺', '13');
INSERT INTO `property` VALUES ('181', '鲜花规格', '13');
INSERT INTO `property` VALUES ('182', '花束辅材', '13');
INSERT INTO `property` VALUES ('183', '品牌', '14');
INSERT INTO `property` VALUES ('184', '产品名称', '14');
INSERT INTO `property` VALUES ('185', '产品剂型', '14');
INSERT INTO `property` VALUES ('186', '使用剂量', '14');
INSERT INTO `property` VALUES ('187', '套餐类型', '14');
INSERT INTO `property` VALUES ('188', '有效期', '14');
INSERT INTO `property` VALUES ('189', '用法', '14');
INSERT INTO `property` VALUES ('190', '药品分类', '14');
INSERT INTO `property` VALUES ('191', '药品名称', '14');
INSERT INTO `property` VALUES ('192', '药品通用名', '14');
INSERT INTO `property` VALUES ('193', '批准文号', '14');
INSERT INTO `property` VALUES ('194', '生产企业', '14');
INSERT INTO `property` VALUES ('195', '规格', '14');
INSERT INTO `property` VALUES ('196', '类别', '14');
INSERT INTO `property` VALUES ('197', '品牌', '15');
INSERT INTO `property` VALUES ('198', '产品名称', '15');
INSERT INTO `property` VALUES ('199', '包装体积', '15');
INSERT INTO `property` VALUES ('200', '流行元素', '15');
INSERT INTO `property` VALUES ('201', '适用人群', '15');
INSERT INTO `property` VALUES ('202', '适用场景', '15');
INSERT INTO `property` VALUES ('203', '颜色分类', '15');
INSERT INTO `property` VALUES ('204', '风格', '15');
INSERT INTO `property` VALUES ('205', '型号', '15');
INSERT INTO `property` VALUES ('206', '材质', '15');
INSERT INTO `property` VALUES ('207', '产地', '15');
INSERT INTO `property` VALUES ('208', '净重', '15');
INSERT INTO `property` VALUES ('209', '原产地', '15');
INSERT INTO `property` VALUES ('210', '品名', '15');
INSERT INTO `property` VALUES ('211', '毛重', '15');
INSERT INTO `property` VALUES ('212', '厂家名称', '15');
INSERT INTO `property` VALUES ('213', '厂家地址', '15');
INSERT INTO `property` VALUES ('214', '狗狗品种', '15');
INSERT INTO `property` VALUES ('215', '适用阶段', '15');
INSERT INTO `property` VALUES ('216', '食品口味', '15');
INSERT INTO `property` VALUES ('217', '配方/口味', '15');
INSERT INTO `property` VALUES ('218', '产品名称', '16');
INSERT INTO `property` VALUES ('219', '是否是套装', '16');
INSERT INTO `property` VALUES ('220', '书名', '16');
INSERT INTO `property` VALUES ('221', '定价', '16');
INSERT INTO `property` VALUES ('222', '出版社名称', '16');
INSERT INTO `property` VALUES ('223', '出版时间', '16');
INSERT INTO `property` VALUES ('224', '作者', '16');
INSERT INTO `property` VALUES ('225', '编者', '16');
INSERT INTO `property` VALUES ('226', '开本', '16');
INSERT INTO `property` VALUES ('227', '书名', '16');
INSERT INTO `property` VALUES ('228', 'ISBN编号', '16');
INSERT INTO `property` VALUES ('229', '品牌', '4');
INSERT INTO `property` VALUES ('230', '产品名称', '4');
INSERT INTO `property` VALUES ('231', '保质期', '4');
INSERT INTO `property` VALUES ('232', '面膜分类', '4');
INSERT INTO `property` VALUES ('233', '规格类型', '4');
INSERT INTO `property` VALUES ('234', '适合肤质', '4');
INSERT INTO `property` VALUES ('235', '净含量', '4');
INSERT INTO `property` VALUES ('236', '品名', '4');
INSERT INTO `property` VALUES ('237', '批准文号', '4');
INSERT INTO `property` VALUES ('238', '功效', '4');
INSERT INTO `property` VALUES ('239', '产地', '4');
INSERT INTO `property` VALUES ('240', '上市时间', '4');
INSERT INTO `property` VALUES ('241', '型号', '4');
INSERT INTO `property` VALUES ('242', '适用对象', '4');
INSERT INTO `property` VALUES ('243', '件数', '4');
INSERT INTO `property` VALUES ('244', '适用发质', '4');
