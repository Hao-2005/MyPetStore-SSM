/*
 Navicat Premium Data Transfer

 Source Server         : JavaFX
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : mypetstore-ssm

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 09/06/2025 15:05:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `userid` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `firstname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `addr1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addr2` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `state` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `zip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('ACID', 'acid@yourdomain.com', 'ABC', 'XYX', 'OK', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '555-555-5555');
INSERT INTO `account` VALUES ('CSUstudent', '8209230701@csu.edu.cn', 'ABCD', 'XYXY', 'OK', '902 San Antonio Road', 'MS UCUP02-210', 'Palo Alto', 'CA', '94303', 'USA', '777-777-7777');
INSERT INTO `account` VALUES ('forgetfulMan', 'secret@qq.com', 'ABC', 'XYX', 'OK', '902 San Antonio Road', 'MS UCUP02-208', 'Palo Alto', 'CA', '94303', 'USA', '555-555-5555');
INSERT INTO `account` VALUES ('j2ee', 'yourname@yourdomain.com', 'DDDD', 'XYXY', 'OK', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', '555-555-5555');
INSERT INTO `account` VALUES ('XiheLiu', '123456@qq.com', 'Xihe', 'Liu', 'OK', '902 San Antonio Road', 'MS UCUP02-209', 'Palo Alto', 'CA', '94303', 'USA', '666-666-6666');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin');

-- ----------------------------
-- Table structure for bannerdata
-- ----------------------------
DROP TABLE IF EXISTS `bannerdata`;
CREATE TABLE `bannerdata`  (
  `favcategory` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bannername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`favcategory`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bannerdata
-- ----------------------------
INSERT INTO `bannerdata` VALUES ('BIRDS', '<image src=\"../images/banner_birds.gif\">');
INSERT INTO `bannerdata` VALUES ('CATS', '<image src=\"../images/banner_cats.gif\">');
INSERT INTO `bannerdata` VALUES ('DOGS', '<image src=\"../images/banner_dogs.gif\">');
INSERT INTO `bannerdata` VALUES ('FISH', '<image src=\"../images/banner_fish.gif\">');
INSERT INTO `bannerdata` VALUES ('REPTILES', '<image src=\"../images/banner_reptiles.gif\">');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `itemid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `catid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `descn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`catid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('BIRDS', 'Birds', '<image src=\"../images/birds_icon.gif\"><font size=\"5\" color=\"blue\"> Birds</font>');
INSERT INTO `category` VALUES ('CATS', 'Cats', '<image src=\"../images/cats_icon.gif\"><font size=\"5\" color=\"blue\"> Cats</font>');
INSERT INTO `category` VALUES ('DOGS', 'Dogs', '<image src=\"../images/dogs_icon.gif\"><font size=\"5\" color=\"blue\"> Dogs</font>');
INSERT INTO `category` VALUES ('FISH', 'Fish', '<image src=\"../images/fish_icon.gif\"><font size=\"5\" color=\"blue\"> Fish</font>');
INSERT INTO `category` VALUES ('REPTILES', 'Reptiles', '<image src=\"../images/reptiles_icon.gif\"><font size=\"5\" color=\"blue\"> Reptiles</font>');

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `itemid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `qty` int NOT NULL,
  PRIMARY KEY (`itemid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES ('EST-1', 9999);
INSERT INTO `inventory` VALUES ('EST-10', 10000);
INSERT INTO `inventory` VALUES ('EST-11', 9999);
INSERT INTO `inventory` VALUES ('EST-12', 10000);
INSERT INTO `inventory` VALUES ('EST-13', 9996);
INSERT INTO `inventory` VALUES ('EST-14', 9997);
INSERT INTO `inventory` VALUES ('EST-15', 10000);
INSERT INTO `inventory` VALUES ('EST-16', 8769);
INSERT INTO `inventory` VALUES ('EST-17', 9997);
INSERT INTO `inventory` VALUES ('EST-18', 9996);
INSERT INTO `inventory` VALUES ('EST-19', 10000);
INSERT INTO `inventory` VALUES ('EST-2', 10000);
INSERT INTO `inventory` VALUES ('EST-20', 9999);
INSERT INTO `inventory` VALUES ('EST-21', 10000);
INSERT INTO `inventory` VALUES ('EST-22', 10000);
INSERT INTO `inventory` VALUES ('EST-23', 10000);
INSERT INTO `inventory` VALUES ('EST-24', 10000);
INSERT INTO `inventory` VALUES ('EST-25', 10000);
INSERT INTO `inventory` VALUES ('EST-26', 10000);
INSERT INTO `inventory` VALUES ('EST-27', 9998);
INSERT INTO `inventory` VALUES ('EST-28', 10000);
INSERT INTO `inventory` VALUES ('EST-3', 10000);
INSERT INTO `inventory` VALUES ('EST-4', 9976);
INSERT INTO `inventory` VALUES ('EST-5', 10000);
INSERT INTO `inventory` VALUES ('EST-6', 9979);
INSERT INTO `inventory` VALUES ('EST-7', 9999);
INSERT INTO `inventory` VALUES ('EST-8', 10000);
INSERT INTO `inventory` VALUES ('EST-9', 10000);

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `itemid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `productid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `listprice` decimal(10, 2) NULL DEFAULT NULL,
  `unitcost` decimal(10, 2) NULL DEFAULT NULL,
  `supplier` int NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `attr1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `attr2` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `attr3` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `attr4` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `attr5` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `modifying` int NULL DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE,
  INDEX `fk_item_2`(`supplier` ASC) USING BTREE,
  INDEX `itemProd`(`productid` ASC) USING BTREE,
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`suppid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('EST-1', 'FI-SW-01', 16.50, 10.00, 1, 'P', 'Large', NULL, NULL, NULL, NULL, 1);
INSERT INTO `item` VALUES ('EST-10', 'K9-DL-01', 18.50, 12.00, 1, 'P', 'Spotted Adult Female', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-11', 'RP-SN-01', 18.50, 12.00, 1, 'P', 'Venomless', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-12', 'RP-SN-01', 18.50, 12.00, 1, 'P', 'Rattleless', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-13', 'RP-LI-02', 18.50, 12.00, 1, 'P', 'Green Adult', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-14', 'FL-DSH-01', 58.50, 12.00, 1, 'P', 'Tailless', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-15', 'FL-DSH-01', 23.50, 12.00, 1, 'P', 'With tail', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-16', 'FL-DLH-02', 93.50, 12.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-17', 'FL-DLH-02', 93.50, 12.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-18', 'AV-CB-01', 193.50, 92.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-19', 'AV-SB-02', 15.50, 2.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-2', 'FI-SW-01', 16.50, 10.00, 1, 'P', 'Small', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-20', 'FI-FW-02', 5.50, 2.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-21', 'FI-FW-02', 5.29, 1.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-22', 'K9-RT-02', 135.50, 100.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-23', 'K9-RT-02', 145.49, 100.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-24', 'K9-RT-02', 255.50, 92.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-25', 'K9-RT-02', 325.29, 90.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-26', 'K9-CW-01', 125.50, 92.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-27', 'K9-CW-01', 155.29, 90.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-28', 'K9-RT-01', 155.29, 90.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-3', 'FI-SW-02', 18.50, 12.00, 1, 'P', 'Toothless', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-4', 'FI-FW-01', 18.50, 12.00, 1, 'P', 'Spotted', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-5', 'FI-FW-01', 18.50, 12.00, 1, 'P', 'Spotless', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-6', 'K9-BD-01', 18.50, 12.00, 1, 'P', 'Male Adult', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-7', 'K9-BD-01', 18.50, 12.00, 1, 'P', 'Female Puppy', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-8', 'K9-PO-02', 18.50, 12.00, 1, 'P', 'Male Puppy', NULL, NULL, NULL, NULL, 0);
INSERT INTO `item` VALUES ('EST-9', 'K9-DL-01', 18.50, 12.00, 1, 'P', 'Spotless Male Puppy', NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for journal
-- ----------------------------
DROP TABLE IF EXISTS `journal`;
CREATE TABLE `journal`  (
  `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of journal
-- ----------------------------
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '06-11-2024 08:20:14', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '06-11-2024 08:20:16', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '06-11-2024 08:20:19', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '06-11-2024 08:20:42', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '06-11-2024 08:20:44', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '06-11-2024 08:20:46', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-SW-02\">FI-SW-02</a>.', '06-11-2024 08:20:47', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '06-11-2024 08:20:49', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-SW-01\">FI-SW-01</a>.', '06-11-2024 08:20:49', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '06-11-2024 08:20:51', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '06-11-2024 08:20:51', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-BD-01\">K9-BD-01</a>.', '06-11-2024 08:20:52', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '06-11-2024 08:20:53', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-CW-01\">K9-CW-01</a>.', '06-11-2024 08:20:54', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '06-11-2024 08:20:55', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-RT-02\">K9-RT-02</a>.', '06-11-2024 08:20:56', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '06-11-2024 08:20:58', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-RT-01\">K9-RT-01</a>.', '06-11-2024 08:20:58', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '06-11-2024 08:20:59', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-PO-02\">K9-PO-02</a>.', '06-11-2024 08:21:00', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '06-11-2024 08:21:01', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-DL-01\">K9-DL-01</a>.', '06-11-2024 08:21:02', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-9\">EST-9</a>.', '06-11-2024 08:21:04', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-9\">EST-9</a> to the <a href=\"cartForm\">cart</a>.', '06-11-2024 08:21:08', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-9\">EST-9</a>.', '06-11-2024 08:21:27', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-9\">EST-9</a>.', '06-11-2024 08:25:55', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-9\">EST-9</a>.', '06-11-2024 08:26:01', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee deleted product <a href=\"productForm?productId=EST-9\">EST-9<\\a> from the <a href=\"cartForm\">cart</a>.', '06-11-2024 08:26:11', '#BF9000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=EST-9\">EST-9</a>.', '06-11-2024 08:26:16', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '06-11-2024 15:35:51', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '06-11-2024 15:35:53', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '06-11-2024 15:35:56', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-18\">EST-18</a> to the <a href=\"cartForm\">cart</a>.', '06-11-2024 15:35:58', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1014\">1014</a>.', '06-11-2024 15:36:07', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '06-11-2024 15:36:11', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '06-11-2024 15:36:32', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '06-11-2024 15:36:33', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-18\">EST-18</a> to the <a href=\"cartForm\">cart</a>.', '06-11-2024 15:36:34', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1015\">1015</a>.', '06-11-2024 15:36:48', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '06-11-2024 15:37:22', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '06-11-2024 15:37:22', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '06-11-2024 15:37:25', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-16\">EST-16</a>.', '06-11-2024 15:37:26', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '06-11-2024 15:37:54', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '06-11-2024 15:37:55', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '06-11-2024 15:38:01', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '06-11-2024 15:38:03', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '19-12-2024 16:12:37', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '19-12-2024 17:28:49', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '20-12-2024 15:47:34', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '20-12-2024 15:47:48', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '20-12-2024 15:47:56', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '20-12-2024 15:47:58', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '20-12-2024 15:47:59', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '20-12-2024 15:48:00', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 15:08:43', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '22-12-2024 15:08:58', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 15:09:22', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 15:33:27', '#4472C4');
INSERT INTO `journal` VALUES (NULL, 'User null logged out.', '22-12-2024 15:33:32', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 17:43:03', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '22-12-2024 17:43:18', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '22-12-2024 17:43:24', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '22-12-2024 17:43:34', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-BD-01\">K9-BD-01</a>.', '22-12-2024 17:43:35', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-6\">EST-6</a> to the <a href=\"cartForm\">cart</a>.', '22-12-2024 17:43:36', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 20:07:44', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '22-12-2024 20:08:17', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-BD-01\">K9-BD-01</a>.', '22-12-2024 20:08:23', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 20:59:52', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:01:53', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:04:50', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:07:04', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '22-12-2024 21:08:18', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:10:06', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:18:19', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:24:34', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '22-12-2024 21:24:36', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:25:42', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:30:33', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '22-12-2024 21:30:43', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:31:48', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '22-12-2024 21:33:21', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:34:58', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 12:30:30', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 12:50:59', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '23-12-2024 12:51:07', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 13:01:22', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 13:19:49', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 16:57:31', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '23-12-2024 16:57:45', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '23-12-2024 16:58:17', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 16:59:43', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 17:02:30', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 17:06:20', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '23-12-2024 17:13:26', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '23-12-2024 17:13:33', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '23-12-2024 17:13:40', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '23-12-2024 17:13:41', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 17:26:17', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 17:28:18', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 17:31:19', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '23-12-2024 17:34:28', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '23-12-2024 17:34:31', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-4\">EST-4</a>.', '23-12-2024 17:34:33', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 17:42:15', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 17:46:52', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 17:49:34', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 17:52:08', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:01:53', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:09:03', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:12:10', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:13:25', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:22:47', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:26:16', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '23-12-2024 21:27:51', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:28:40', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:32:21', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:34:11', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:39:08', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:04:11', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:05:31', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:06:36', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:11:46', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:18:10', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:19:58', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:20:34', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:21:28', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:23:28', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:29:14', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:41:47', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:47:02', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:54:41', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:56:11', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:58:27', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 23:00:53', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 23:07:34', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:19:39', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:24:50', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:26:53', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:28:40', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:32:05', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:38:58', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:46:29', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:52:32', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '24-12-2024 01:55:05', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:55:56', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:57:56', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 02:02:17', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '24-12-2024 02:03:36', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '24-12-2024 02:04:23', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 02:05:26', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 02:05:36', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1016\">1016</a>.', '24-12-2024 02:07:26', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 02:11:30', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1017\">1017</a>.', '24-12-2024 02:14:10', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 02:19:27', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 02:19:28', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 02:19:30', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 02:19:31', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1018\">1018</a>.', '24-12-2024 02:19:54', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 02:22:48', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 02:22:49', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 02:22:50', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 02:22:52', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-5\">EST-5</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 02:22:53', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-SW-02\">FI-SW-02</a>.', '24-12-2024 02:23:01', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-3\">EST-3</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 02:23:02', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1019\">1019</a>.', '24-12-2024 02:23:04', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 02:26:01', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:06:14', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 10:11:56', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '24-12-2024 10:12:00', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '24-12-2024 10:12:01', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '24-12-2024 10:12:35', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-13\">EST-13</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 10:12:37', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '24-12-2024 10:12:46', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-SN-01\">RP-SN-01</a>.', '24-12-2024 10:12:48', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-12\">EST-12</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 10:12:50', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-SN-01\">RP-SN-01</a>.', '24-12-2024 10:12:50', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-11\">EST-11</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 10:12:51', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1020\">1020</a>.', '24-12-2024 10:17:04', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:27:14', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 10:27:34', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:28:58', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:31:34', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:32:58', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 10:34:32', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:36:40', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:37:43', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:40:10', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:41:58', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:44:24', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 10:44:36', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 10:44:37', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 10:44:38', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-5\">EST-5</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 10:44:38', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '24-12-2024 10:44:39', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-20\">EST-20</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 10:44:40', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '24-12-2024 10:44:41', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-21\">EST-21</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 10:44:43', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:49:31', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:50:20', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:53:08', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:54:25', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:57:11', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:59:35', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 11:01:08', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1021\">1021</a>.', '24-12-2024 11:03:33', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 11:06:10', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 11:06:16', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:06:17', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 11:06:18', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-5\">EST-5</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:06:19', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '24-12-2024 11:06:20', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-20\">EST-20</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:06:21', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '24-12-2024 11:06:22', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-SW-02\">FI-SW-02</a>.', '24-12-2024 11:06:27', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-3\">EST-3</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:06:28', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-SW-01\">FI-SW-01</a>.', '24-12-2024 11:06:29', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-2\">EST-2</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:06:30', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1022\">1022</a>.', '24-12-2024 11:07:08', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 11:09:02', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 11:09:23', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:09:25', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1023\">1023</a>.', '24-12-2024 11:09:31', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 11:12:14', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 11:12:17', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-5\">EST-5</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:12:19', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1024\">1024</a>.', '24-12-2024 11:12:22', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '24-12-2024 11:18:56', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 11:20:25', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 11:20:27', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 11:20:32', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:20:33', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '24-12-2024 11:20:34', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-21\">EST-21</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:20:36', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1025\">1025</a>.', '24-12-2024 11:20:55', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 11:27:34', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 11:27:38', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:27:39', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1026\">1026</a>.', '24-12-2024 11:27:43', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 11:27:50', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 11:33:13', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '24-12-2024 11:34:04', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '24-12-2024 11:34:08', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '24-12-2024 11:34:28', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 11:36:14', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 14:04:34', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '24-12-2024 14:04:45', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '24-12-2024 14:04:47', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-19\">EST-19</a>.', '24-12-2024 14:04:49', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 14:47:31', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '24-12-2024 14:47:40', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-18\">EST-18</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 14:47:41', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 14:51:51', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 14:54:42', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 14:55:57', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 15:14:35', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 15:16:14', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 15:17:01', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 15:17:42', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-SW-01\">FI-SW-01</a>.', '24-12-2024 15:18:28', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-SW-01\">FI-SW-01</a>.', '24-12-2024 15:18:28', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 15:31:02', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 16:33:11', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 16:56:57', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 16:56:59', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 16:57:00', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 16:57:02', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1027\">1027</a>.', '24-12-2024 16:57:17', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:00:28', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 17:00:30', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 17:00:31', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 17:00:32', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1028\">1028</a>.', '24-12-2024 17:00:37', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:05:58', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 17:06:03', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 17:06:04', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 17:06:05', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1029\">1029</a>.', '24-12-2024 17:06:11', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:07:29', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 17:07:31', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 17:07:32', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 17:07:33', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1030\">1030</a>.', '24-12-2024 17:07:39', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:08:07', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 17:08:09', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 17:08:11', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 17:08:12', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1031\">1031</a>.', '24-12-2024 17:08:16', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:08:51', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 17:08:54', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 17:08:55', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 17:08:56', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1032\">1032</a>.', '24-12-2024 17:08:59', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:10:10', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 17:10:11', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '24-12-2024 17:10:13', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-20\">EST-20</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 17:10:14', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1033\">1033</a>.', '24-12-2024 17:10:18', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:12:32', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 17:12:34', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 17:12:35', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 17:12:36', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1034\">1034</a>.', '24-12-2024 17:12:39', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:13:10', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '24-12-2024 17:13:14', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '24-12-2024 17:13:16', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 17:13:17', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1035\">1035</a>.', '24-12-2024 17:13:26', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:14:08', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '24-12-2024 17:14:10', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '24-12-2024 17:14:11', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 17:14:12', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1036\">1036</a>.', '24-12-2024 17:14:18', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:15:37', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 19:17:52', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 19:41:22', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 19:41:24', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '24-12-2024 19:41:26', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-21\">EST-21</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 19:41:28', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 20:13:44', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 20:40:14', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '24-12-2024 20:40:16', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '24-12-2024 20:40:18', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 20:40:19', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1037\">1037</a>.', '24-12-2024 20:40:33', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 20:41:36', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 20:43:41', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 20:44:42', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '24-12-2024 20:44:56', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DSH-01\">FL-DSH-01</a>.', '24-12-2024 20:44:57', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-15\">EST-15</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 20:44:58', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1038\">1038</a>.', '24-12-2024 20:45:11', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 22:21:34', '#4472C4');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 22:21:36', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '24-12-2024 22:21:37', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null added product <a href=\"itemForm?itemId=EST-20\">EST-20</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:21:38', '#FFC000');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '24-12-2024 22:21:41', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=K9-PO-02\">K9-PO-02</a>.', '24-12-2024 22:21:43', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null added product <a href=\"itemForm?itemId=EST-8\">EST-8</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:21:44', '#FFC000');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '24-12-2024 22:21:50', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '24-12-2024 22:21:51', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:21:52', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 22:22:33', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '24-12-2024 22:22:34', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '24-12-2024 22:22:35', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:22:36', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '24-12-2024 22:22:52', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-18\">EST-18</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:22:54', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '24-12-2024 22:22:59', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '24-12-2024 22:23:00', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:23:01', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '24-12-2024 22:24:04', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-BD-01\">K9-BD-01</a>.', '24-12-2024 22:24:05', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-6\">EST-6</a>.', '24-12-2024 22:24:06', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-6\">EST-6</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:24:08', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '24-12-2024 22:24:19', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '24-12-2024 22:24:19', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-13\">EST-13</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:24:20', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '24-12-2024 22:24:22', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '24-12-2024 22:24:23', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:24:23', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 22:24:30', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-SW-01\">FI-SW-01</a>.', '24-12-2024 22:24:31', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-2\">EST-2</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:24:32', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '24-12-2024 22:24:53', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '24-12-2024 22:24:54', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:24:57', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 22:25:42', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '24-12-2024 22:25:45', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '24-12-2024 22:25:47', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 22:26:21', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 22:26:22', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:26:23', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '24-12-2024 22:26:25', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-DL-01\">K9-DL-01</a>.', '24-12-2024 22:26:26', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-9\">EST-9</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:26:27', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '24-12-2024 22:26:28', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '24-12-2024 22:26:29', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-13\">EST-13</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:26:30', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '24-12-2024 22:26:32', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DSH-01\">FL-DSH-01</a>.', '24-12-2024 22:26:33', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-15\">EST-15</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:26:34', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '24-12-2024 22:26:35', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '24-12-2024 22:26:36', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-18\">EST-18</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:26:36', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '24-12-2024 22:26:57', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '24-12-2024 22:26:58', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:26:59', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '24-12-2024 22:27:02', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '24-12-2024 22:27:03', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '25-12-2024 08:14:29', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '25-12-2024 08:14:31', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '25-12-2024 08:49:06', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1039\">1039</a>.', '25-12-2024 08:49:43', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '25-12-2024 08:51:31', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DSH-01\">FL-DSH-01</a>.', '25-12-2024 08:51:36', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-15\">EST-15</a> to the <a href=\"cartForm\">cart</a>.', '25-12-2024 08:51:38', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '25-12-2024 08:53:17', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1040\">1040</a>.', '25-12-2024 08:53:48', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '10-01-2025 14:41:19', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '10-01-2025 14:44:36', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '10-01-2025 14:44:37', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-13\">EST-13</a> to the <a href=\"cartForm\">cart</a>.', '10-01-2025 14:44:38', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1041\">1041</a>.', '10-01-2025 14:48:39', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '10-01-2025 15:04:23', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '10-01-2025 15:11:40', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '10-01-2025 15:18:29', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DSH-01\">FL-DSH-01</a>.', '10-01-2025 15:18:30', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-14\">EST-14</a> to the <a href=\"cartForm\">cart</a>.', '10-01-2025 15:18:31', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '10-01-2025 15:18:41', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '10-01-2025 15:18:42', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '10-01-2025 15:18:44', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '10-01-2025 15:18:46', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '10-01-2025 15:18:47', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-20\">EST-20</a> to the <a href=\"cartForm\">cart</a>.', '10-01-2025 15:18:47', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '10-01-2025 15:18:51', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '10-01-2025 15:18:52', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '10-01-2025 15:18:53', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '10-01-2025 15:19:00', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '10-01-2025 15:19:01', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '10-01-2025 15:19:45', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '10-01-2025 15:19:56', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '10-01-2025 15:20:00', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '10-01-2025 15:20:02', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-4\">EST-4</a>.', '10-01-2025 15:20:03', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '10-01-2025 15:20:04', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '10-01-2025 15:20:22', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '10-01-2025 15:20:23', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '10-01-2025 15:20:24', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '10-01-2025 15:20:28', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '10-01-2025 15:20:29', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-13\">EST-13</a> to the <a href=\"cartForm\">cart</a>.', '10-01-2025 15:20:29', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-19\">EST-19</a>.', '10-01-2025 15:51:25', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '11-01-2025 13:52:07', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '11-01-2025 13:52:26', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '11-01-2025 13:52:44', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '11-01-2025 13:53:03', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '11-01-2025 13:53:13', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '11-01-2025 13:53:24', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '11-01-2025 13:53:33', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '11-01-2025 13:53:34', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-BD-01\">K9-BD-01</a>.', '11-01-2025 13:53:35', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-6\">EST-6</a>.', '11-01-2025 13:53:48', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '11-01-2025 13:53:50', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '11-01-2025 13:53:51', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-4\">EST-4</a>.', '11-01-2025 13:53:52', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '11-01-2025 13:53:53', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '11-01-2025 13:53:54', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-13\">EST-13</a>.', '11-01-2025 13:53:55', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '11-01-2025 13:53:57', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '11-01-2025 13:53:58', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-16\">EST-16</a>.', '11-01-2025 13:53:59', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '11-01-2025 13:54:00', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '11-01-2025 13:54:01', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-16\">EST-16</a>.', '11-01-2025 13:54:12', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '11-01-2025 14:25:32', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee deleted product <a href=\"itemForm?itemId=EST-4\">EST-4</a> from the <a href=\"cartForm\">cart</a>.', '11-01-2025 14:26:15', '#BF9000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee deleted product <a href=\"itemForm?itemId=EST-13\">EST-13</a> from the <a href=\"cartForm\">cart</a>.', '11-01-2025 14:33:05', '#BF9000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee deleted product <a href=\"itemForm?itemId=EST-14\">EST-14</a> from the <a href=\"cartForm\">cart</a>.', '11-01-2025 14:33:06', '#BF9000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee deleted product <a href=\"itemForm?itemId=EST-19\">EST-19</a> from the <a href=\"cartForm\">cart</a>.', '11-01-2025 14:33:06', '#BF9000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '11-01-2025 14:33:08', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '11-01-2025 14:33:32', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '11-01-2025 14:33:34', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '11-01-2025 14:54:25', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '11-01-2025 14:55:32', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '11-01-2025 14:56:18', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '11-01-2025 14:57:36', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '11-01-2025 15:00:34', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '11-01-2025 15:01:35', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '11-01-2025 15:31:28', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-20\">EST-20</a> to the <a href=\"cartForm\">cart</a>.', '11-01-2025 15:31:29', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '11-01-2025 16:12:42', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '11-01-2025 16:30:21', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '11-01-2025 16:37:51', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-16\">EST-16</a>.', '11-01-2025 16:42:23', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '07-03-2025 19:38:39', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '07-03-2025 19:39:59', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '07-03-2025 19:52:25', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '08-03-2025 14:24:45', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '08-03-2025 21:01:22', '#4472C4');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '09-03-2025 19:37:11', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '09-03-2025 19:37:12', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=EST-4\">EST-4</a>.', '09-03-2025 19:37:14', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '09-03-2025 19:37:19', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '09-03-2025 19:37:20', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=EST-18\">EST-18</a>.', '09-03-2025 19:37:22', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '09-03-2025 19:38:28', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '09-03-2025 19:38:29', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=EST-4\">EST-4</a>.', '09-03-2025 19:38:30', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '09-03-2025 19:38:31', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '09-03-2025 19:38:32', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '09-03-2025 19:38:33', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=FL-DSH-01\">FL-DSH-01</a>.', '09-03-2025 19:38:34', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '09-03-2025 19:38:36', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '09-03-2025 19:38:37', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '09-03-2025 19:38:38', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=K9-BD-01\">K9-BD-01</a>.', '09-03-2025 19:38:38', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '09-03-2025 19:38:40', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '10-03-2025 16:05:19', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '10-03-2025 16:05:47', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '10-03-2025 16:05:49', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '10-03-2025 16:05:52', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '10-03-2025 16:05:53', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '10-03-2025 16:05:55', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=FI-SW-01\">FI-SW-01</a>.', '10-03-2025 16:05:57', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-1\">EST-1</a> to the <a href=\"cartForm\">cart</a>.', '10-03-2025 16:05:59', '#FFC000');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=FI-SW-01\">FI-SW-01</a>.', '10-03-2025 16:56:45', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1043\">1043</a >.', '10-03-2025 16:57:57', '#ED7D31');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '12-03-2025 08:08:10', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '12-03-2025 08:08:11', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '12-03-2025 08:08:12', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1044\">1044</a >.', '12-03-2025 08:08:16', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '12-03-2025 08:08:18', '#4472C4');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '12-03-2025 08:25:38', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '12-03-2025 08:25:39', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '12-03-2025 08:25:53', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '12-03-2025 08:25:54', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-18\">EST-18</a> to the <a href=\"cartForm\">cart</a>.', '12-03-2025 08:25:55', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee deleted product <a href=\"itemForm?itemId=EST-18\">EST-18</a> from the <a href=\"cartForm\">cart</a>.', '08-04-2025 17:09:15', '#BF9000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '08-04-2025 17:10:05', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-5\">EST-5</a> to the <a href=\"cartForm\">cart</a>.', '08-04-2025 17:10:07', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee deleted product <a href=\"itemForm?itemId=EST-5\">EST-5</a> from the <a href=\"cartForm\">cart</a>.', '08-04-2025 17:10:18', '#BF9000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee deleted product <a href=\"itemForm?itemId=EST-4\">EST-4</a> from the <a href=\"cartForm\">cart</a>.', '08-04-2025 17:30:24', '#BF9000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-13\">EST-13</a> to the <a href=\"cartForm\">cart</a>.', '08-04-2025 17:31:14', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-18\">EST-18</a> to the <a href=\"cartForm\">cart</a>.', '08-04-2025 17:31:42', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee deleted product <a href=\"itemForm?itemId=EST-18\">EST-18</a> from the <a href=\"cartForm\">cart</a>.', '08-04-2025 17:31:46', '#BF9000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee deleted product <a href=\"itemForm?itemId=EST-13\">EST-13</a> from the <a href=\"cartForm\">cart</a>.', '08-04-2025 18:30:15', '#BF9000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-6\">EST-6</a> to the <a href=\"cartForm\">cart</a>.', '08-04-2025 18:35:16', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-7\">EST-7</a> to the <a href=\"cartForm\">cart</a>.', '08-04-2025 18:35:18', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1045\">1045</a >.', '09-04-2025 00:04:04', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 00:06:21', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-17\">EST-17</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 00:06:22', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1046\">1046</a >.', '09-04-2025 00:07:56', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 00:13:02', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1047\">1047</a >.', '09-04-2025 00:13:15', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1048\">1048</a >.', '09-04-2025 00:16:22', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 00:20:31', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1049\">1049</a >.', '09-04-2025 00:20:40', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 00:21:33', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1050\">1050</a >.', '09-04-2025 00:21:42', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-6\">EST-6</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 00:23:12', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1051\">1051</a >.', '09-04-2025 00:23:23', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 00:29:53', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1052\">1052</a >.', '09-04-2025 00:30:04', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 00:33:18', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1053\">1053</a >.', '09-04-2025 00:33:25', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-18\">EST-18</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 00:36:27', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1054\">1054</a >.', '09-04-2025 00:36:40', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-14\">EST-14</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 00:38:12', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1055\">1055</a >.', '09-04-2025 00:38:22', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-11\">EST-11</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 00:39:18', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1056\">1056</a >.', '09-04-2025 00:39:25', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-6\">EST-6</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 00:40:19', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1057\">1057</a >.', '09-04-2025 00:40:28', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-13\">EST-13</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 00:42:51', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1058\">1058</a >.', '09-04-2025 00:43:03', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 00:49:25', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1059\">1059</a >.', '09-04-2025 00:49:35', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 00:57:48', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1060\">1060</a >.', '09-04-2025 00:58:03', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-18\">EST-18</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 01:03:32', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1061\">1061</a >.', '09-04-2025 01:03:42', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-6\">EST-6</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 01:05:09', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1062\">1062</a >.', '09-04-2025 01:05:23', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-13\">EST-13</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 01:14:29', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1063\">1063</a >.', '09-04-2025 01:14:41', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-14\">EST-14</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 01:29:16', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 01:48:29', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-6\">EST-6</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 01:48:56', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1065\">1065</a >.', '09-04-2025 01:50:27', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 01:52:56', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1066\">1066</a >.', '09-04-2025 01:53:17', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 01:53:32', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1067\">1067</a >.', '09-04-2025 01:53:38', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-14\">EST-14</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 01:53:58', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 01:54:04', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1076\">1076</a >.', '09-04-2025 02:09:13', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 02:09:41', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1078\">1078</a >.', '09-04-2025 02:11:28', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-6\">EST-6</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 02:12:39', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1082\">1082</a >.', '09-04-2025 02:30:39', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 02:30:57', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1083\">1083</a >.', '09-04-2025 02:31:08', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 08:28:12', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1084\">1084</a >.', '09-04-2025 08:28:48', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-18\">EST-18</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 08:29:10', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1085\">1085</a >.', '09-04-2025 08:29:19', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-13\">EST-13</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 08:33:51', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1086\">1086</a >.', '09-04-2025 08:34:02', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-6\">EST-6</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 08:39:20', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1087\">1087</a >.', '09-04-2025 09:01:25', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-6\">EST-6</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 09:02:57', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1088\">1088</a >.', '09-04-2025 09:03:08', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-14\">EST-14</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 09:06:04', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 09:06:59', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '09-04-2025 09:17:28', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '24-04-2025 11:23:19', '#4472C4');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '24-04-2025 11:25:06', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=K9-BD-01\">K9-BD-01</a>.', '24-04-2025 11:25:21', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '24-04-2025 11:25:23', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=K9-CW-01\">K9-CW-01</a>.', '24-04-2025 11:25:24', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=EST-26\">EST-26</a>.', '24-04-2025 11:25:38', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '24-04-2025 11:26:12', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=K9-CW-01\">K9-CW-01</a>.', '24-04-2025 11:26:13', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-27\">EST-27</a> to the <a href=\"cartForm\">cart</a>.', '24-04-2025 11:26:15', '#FFC000');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '24-04-2025 11:26:16', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '24-04-2025 11:26:17', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-17\">EST-17</a> to the <a href=\"cartForm\">cart</a>.', '24-04-2025 11:26:18', '#FFC000');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '24-04-2025 11:26:34', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '24-04-2025 11:26:36', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-13\">EST-13</a> to the <a href=\"cartForm\">cart</a>.', '24-04-2025 11:26:37', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1089\">1089</a >.', '24-04-2025 12:32:06', '#ED7D31');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '24-04-2025 12:34:32', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=K9-CW-01\">K9-CW-01</a>.', '24-04-2025 12:34:33', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-27\">EST-27</a> to the <a href=\"cartForm\">cart</a>.', '24-04-2025 12:34:39', '#FFC000');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '24-04-2025 12:34:41', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '24-04-2025 12:34:42', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-17\">EST-17</a> to the <a href=\"cartForm\">cart</a>.', '24-04-2025 12:34:47', '#FFC000');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '24-04-2025 12:34:48', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '24-04-2025 12:34:49', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-13\">EST-13</a> to the <a href=\"cartForm\">cart</a>.', '24-04-2025 12:34:53', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1090\">1090</a >.', '24-04-2025 12:34:57', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '24-04-2025 15:36:41', '#4472C4');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-04-2025 19:57:09', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-04-2025 19:57:11', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=EST-4\">EST-4</a>.', '24-04-2025 19:57:11', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-04-2025 19:59:17', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-04-2025 19:59:18', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=EST-4\">EST-4</a>.', '24-04-2025 19:59:21', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-04-2025 21:18:13', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-18\">EST-18</a> to the <a href=\"cartForm\">cart</a>.', '24-04-2025 21:18:22', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '24-04-2025 21:18:31', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-6\">EST-6</a> to the <a href=\"cartForm\">cart</a>.', '24-04-2025 21:18:44', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1091\">1091</a >.', '24-04-2025 21:22:47', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '24-04-2025 22:14:44', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '24-04-2025 22:28:35', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '24-04-2025 22:37:16', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '25-04-2025 11:10:46', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-18\">EST-18</a> to the <a href=\"cartForm\">cart</a>.', '25-04-2025 11:10:50', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '25-04-2025 11:10:55', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-6\">EST-6</a> to the <a href=\"cartForm\">cart</a>.', '25-04-2025 11:11:20', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-1\">EST-1</a> to the <a href=\"cartForm\">cart</a>.', '25-04-2025 14:49:22', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee deleted product <a href=\"itemForm?itemId=EST-1\">EST-1</a> from the <a href=\"cartForm\">cart</a>.', '25-04-2025 14:52:35', '#BF9000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href= \"viewOrder?orderId=1092\">1092</a >.', '25-04-2025 15:07:51', '#ED7D31');

-- ----------------------------
-- Table structure for lineitem
-- ----------------------------
DROP TABLE IF EXISTS `lineitem`;
CREATE TABLE `lineitem`  (
  `orderid` int NOT NULL,
  `linenum` int NOT NULL,
  `itemid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `quantity` int NOT NULL,
  `unitprice` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`orderid`, `linenum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lineitem
-- ----------------------------
INSERT INTO `lineitem` VALUES (1000, 1, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1001, 1, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1002, 1, 'EST-22', 1, 135.50);
INSERT INTO `lineitem` VALUES (1003, 1, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1004, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1005, 1, 'EST-1', 1, 16.50);
INSERT INTO `lineitem` VALUES (1006, 1, 'EST-18', 2, 193.50);
INSERT INTO `lineitem` VALUES (1007, 1, 'EST-1', 1, 16.50);
INSERT INTO `lineitem` VALUES (1007, 2, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1007, 3, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1007, 4, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1008, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1009, 1, 'EST-14', 1, 58.50);
INSERT INTO `lineitem` VALUES (1009, 2, 'EST-16', 10007, 93.50);
INSERT INTO `lineitem` VALUES (1009, 3, 'EST-18', 2, 193.50);
INSERT INTO `lineitem` VALUES (1009, 4, 'EST-4', 2, 18.50);
INSERT INTO `lineitem` VALUES (1010, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1012, 1, 'EST-16', 1, 93.50);
INSERT INTO `lineitem` VALUES (1013, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1014, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1015, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1015, 2, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1016, 1, 'EST-6', 1, 18.50);
INSERT INTO `lineitem` VALUES (1017, 1, 'EST-6', 1, 18.50);
INSERT INTO `lineitem` VALUES (1018, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1019, 1, 'EST-3', 1, 18.50);
INSERT INTO `lineitem` VALUES (1019, 2, 'EST-4', 2, 18.50);
INSERT INTO `lineitem` VALUES (1019, 3, 'EST-5', 1, 18.50);
INSERT INTO `lineitem` VALUES (1020, 1, 'EST-11', 1, 18.50);
INSERT INTO `lineitem` VALUES (1020, 2, 'EST-12', 1, 18.50);
INSERT INTO `lineitem` VALUES (1020, 3, 'EST-13', 2, 18.50);
INSERT INTO `lineitem` VALUES (1021, 1, 'EST-20', 1, 5.50);
INSERT INTO `lineitem` VALUES (1021, 2, 'EST-21', 1, 5.29);
INSERT INTO `lineitem` VALUES (1021, 3, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1021, 4, 'EST-5', 1, 18.50);
INSERT INTO `lineitem` VALUES (1022, 1, 'EST-2', 1, 16.50);
INSERT INTO `lineitem` VALUES (1022, 2, 'EST-20', 2, 5.50);
INSERT INTO `lineitem` VALUES (1022, 3, 'EST-3', 1, 18.50);
INSERT INTO `lineitem` VALUES (1022, 4, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1022, 5, 'EST-5', 1, 18.50);
INSERT INTO `lineitem` VALUES (1023, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1024, 1, 'EST-5', 1, 18.50);
INSERT INTO `lineitem` VALUES (1025, 1, 'EST-21', 1, 5.29);
INSERT INTO `lineitem` VALUES (1025, 2, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1026, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1027, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1027, 2, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1028, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1029, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1030, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1031, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1032, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1033, 1, 'EST-20', 1, 5.50);
INSERT INTO `lineitem` VALUES (1034, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1035, 1, 'EST-16', 1, 93.50);
INSERT INTO `lineitem` VALUES (1036, 1, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1037, 1, 'EST-16', 1, 93.50);
INSERT INTO `lineitem` VALUES (1037, 2, 'EST-21', 1, 5.29);
INSERT INTO `lineitem` VALUES (1038, 1, 'EST-15', 1, 23.50);
INSERT INTO `lineitem` VALUES (1039, 1, 'EST-13', 1, 18.50);
INSERT INTO `lineitem` VALUES (1039, 2, 'EST-15', 3, 23.50);
INSERT INTO `lineitem` VALUES (1039, 3, 'EST-16', 2, 93.50);
INSERT INTO `lineitem` VALUES (1039, 4, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1039, 5, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1039, 6, 'EST-9', 1, 18.50);
INSERT INTO `lineitem` VALUES (1040, 1, 'EST-15', 2, 23.50);
INSERT INTO `lineitem` VALUES (1041, 1, 'EST-13', 1, 18.50);
INSERT INTO `lineitem` VALUES (1043, 1, 'EST-1', 1, 16.50);
INSERT INTO `lineitem` VALUES (1043, 2, 'EST-20', 1, 5.50);
INSERT INTO `lineitem` VALUES (1044, 1, 'EST-16', 1, 93.50);
INSERT INTO `lineitem` VALUES (1045, 1, 'EST-6', 12, 18.50);
INSERT INTO `lineitem` VALUES (1045, 2, 'EST-7', 1, 18.50);
INSERT INTO `lineitem` VALUES (1046, 1, 'EST-16', 1, 93.50);
INSERT INTO `lineitem` VALUES (1046, 2, 'EST-17', 1, 93.50);
INSERT INTO `lineitem` VALUES (1047, 1, 'EST-16', 1, 93.50);
INSERT INTO `lineitem` VALUES (1049, 1, 'EST-16', 1, 93.50);
INSERT INTO `lineitem` VALUES (1050, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1051, 1, 'EST-6', 1, 18.50);
INSERT INTO `lineitem` VALUES (1052, 1, 'EST-16', 1, 93.50);
INSERT INTO `lineitem` VALUES (1053, 1, 'EST-16', 1, 93.50);
INSERT INTO `lineitem` VALUES (1054, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1055, 1, 'EST-14', 1, 58.50);
INSERT INTO `lineitem` VALUES (1056, 1, 'EST-11', 1, 18.50);
INSERT INTO `lineitem` VALUES (1057, 1, 'EST-6', 1, 18.50);
INSERT INTO `lineitem` VALUES (1058, 1, 'EST-13', 1, 18.50);
INSERT INTO `lineitem` VALUES (1059, 1, 'EST-16', 1, 93.50);
INSERT INTO `lineitem` VALUES (1060, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1061, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1062, 1, 'EST-6', 1, 18.50);
INSERT INTO `lineitem` VALUES (1063, 1, 'EST-13', 1, 18.50);
INSERT INTO `lineitem` VALUES (1065, 1, 'EST-16', 1222, 93.50);
INSERT INTO `lineitem` VALUES (1065, 2, 'EST-6', 1, 18.50);
INSERT INTO `lineitem` VALUES (1066, 1, 'EST-16', 1, 93.50);
INSERT INTO `lineitem` VALUES (1067, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1076, 1, 'EST-14', 2, 58.50);
INSERT INTO `lineitem` VALUES (1076, 2, 'EST-4', 19, 18.50);
INSERT INTO `lineitem` VALUES (1078, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1087, 1, 'EST-6', 2, 18.50);
INSERT INTO `lineitem` VALUES (1088, 1, 'EST-6', 1, 18.50);
INSERT INTO `lineitem` VALUES (1089, 1, 'EST-13', 1, 18.50);
INSERT INTO `lineitem` VALUES (1089, 2, 'EST-17', 1, 93.50);
INSERT INTO `lineitem` VALUES (1089, 3, 'EST-27', 1, 155.29);
INSERT INTO `lineitem` VALUES (1090, 1, 'EST-13', 1, 18.50);
INSERT INTO `lineitem` VALUES (1090, 2, 'EST-17', 1, 93.50);
INSERT INTO `lineitem` VALUES (1090, 3, 'EST-27', 1, 155.29);
INSERT INTO `lineitem` VALUES (1091, 1, 'EST-16', 1, 93.50);
INSERT INTO `lineitem` VALUES (1091, 2, 'EST-18', 2, 193.50);
INSERT INTO `lineitem` VALUES (1091, 3, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1091, 4, 'EST-6', 5, 18.50);
INSERT INTO `lineitem` VALUES (1092, 1, 'EST-16', 1, 93.50);
INSERT INTO `lineitem` VALUES (1092, 2, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1092, 3, 'EST-6', 1, 18.50);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderid` int NOT NULL,
  `userid` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `orderdate` date NOT NULL,
  `shipaddr1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shipaddr2` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `shipcity` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shipstate` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shipzip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shipcountry` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billaddr1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billaddr2` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `billcity` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billstate` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billzip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billcountry` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `courier` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `totalprice` decimal(10, 2) NOT NULL,
  `billtofirstname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billtolastname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shiptofirstname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shiptolastname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `creditcard` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `exprdate` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cardtype` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `locale` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1002, 'j2ee', '2024-10-29', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', '901 San Antonio Road', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 135.50, 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1003, 'j2ee', '2024-10-29', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', '901 San Antonio Road', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 15.50, 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1004, 'j2ee', '2024-10-29', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', '901 San Antonio Road', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 193.50, 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1005, 'j2ee', '2024-10-29', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', '901 San Antonio Road', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 16.50, 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1006, 'j2ee', '2024-10-30', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', '901 San Antonio Road', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 387.00, 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1007, 'j2ee', '2024-10-31', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', '901 San Antonio Road', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 244.00, 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1008, 'j2ee', '2024-10-31', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', '901 San Antonio Road', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1009, 'j2ee', '2024-10-31', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', '901 San Antonio Road', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 936137.00, 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1010, 'j2ee', '2024-11-02', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', '901 San Antonio Road', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 193.50, 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1012, 'j2ee', '2024-11-02', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', '901 San Antonio Road', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 93.50, 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1013, 'j2ee', '2024-11-02', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', '901 San Antonio Road', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 193.50, 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1014, 'j2ee', '2024-11-06', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', '901 San Antonio Road', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 193.50, 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1041, 'j2ee', '2025-01-10', 'ABCD', 'ABCD', 'Palo Alto', 'CA', '94303', 'USA', '902 San Antonio Road', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'ABCD', 'XYXY', '902 San Antonio Road', 'MS UCUP02-207', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1043, 'j2ee', '2025-03-10', '902 San Antonio Road', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', '902 San Antonio Road', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 22.00, 'ABCD', 'XYXY', 'ABCD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1044, 'j2ee', '2025-03-12', '902 San Antonio Road', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', '902 San Antonio Road', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 93.50, 'ABCD', 'XYXY', 'ABCD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1045, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 240.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1046, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 187.00, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1047, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 93.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1048, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 0.00, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1049, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 93.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1050, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1051, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1052, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 93.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1053, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 93.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1054, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 193.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1055, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 58.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1056, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1057, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1058, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1059, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 93.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1060, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1061, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 193.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1062, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1063, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1065, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 114275.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1066, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 93.50, 'DDDD', 'XYXY', 'DDDD', '123', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1067, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1076, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 468.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1078, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1082, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'ABC', 'XYX', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1083, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 93.50, 'ABC', 'XYX', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1084, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'ABC', 'XYX', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1085, 'j2ee', '2025-04-09', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 193.50, 'DDDD', 'XYXY', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1086, 'j2ee', '2025-04-09', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'DDDD', 'XYXY', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1087, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 37.00, 'ABC', 'XYX', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1088, 'j2ee', '2025-04-09', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'ABC', 'XYX', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1089, 'j2ee', '2025-04-24', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 267.29, 'Hao', 'XYXY', 'Hao', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1090, 'j2ee', '2025-04-24', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 267.29, 'Hao', 'XYXY', 'Hao', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1091, 'j2ee', '2025-04-24', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 591.50, 'Hao', 'XYXY', 'Hao', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1092, 'j2ee', '2025-04-25', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 305.50, 'DDDD', 'XYXY', 'DDDD', 'XYXY', '999 9999 9999 9999', '12/03', 'Visa', 'CA');

-- ----------------------------
-- Table structure for orderstatus
-- ----------------------------
DROP TABLE IF EXISTS `orderstatus`;
CREATE TABLE `orderstatus`  (
  `orderid` int NOT NULL,
  `linenum` int NOT NULL,
  `timestamp` date NOT NULL,
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`orderid`, `linenum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderstatus
-- ----------------------------
INSERT INTO `orderstatus` VALUES (1002, 1, '2024-10-30', 'N');
INSERT INTO `orderstatus` VALUES (1003, 1, '2024-10-30', 'W');
INSERT INTO `orderstatus` VALUES (1004, 1, '2024-10-30', 'W');
INSERT INTO `orderstatus` VALUES (1005, 1, '2024-10-30', 'W');
INSERT INTO `orderstatus` VALUES (1006, 1, '2024-10-30', 'W');
INSERT INTO `orderstatus` VALUES (1007, 1, '2024-10-31', 'W');
INSERT INTO `orderstatus` VALUES (1008, 1, '2024-10-31', 'P');
INSERT INTO `orderstatus` VALUES (1009, 1, '2024-10-31', 'P');
INSERT INTO `orderstatus` VALUES (1010, 1, '2024-11-02', 'P');
INSERT INTO `orderstatus` VALUES (1012, 1, '2024-11-02', 'P');
INSERT INTO `orderstatus` VALUES (1013, 1, '2024-11-02', 'P');
INSERT INTO `orderstatus` VALUES (1014, 1, '2024-11-06', 'P');
INSERT INTO `orderstatus` VALUES (1015, 1, '2024-11-06', 'P');
INSERT INTO `orderstatus` VALUES (1016, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1017, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1018, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1019, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1020, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1021, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1022, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1023, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1024, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1025, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1026, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1027, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1028, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1029, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1030, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1031, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1032, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1033, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1034, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1035, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1036, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1037, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1038, 1, '2024-12-24', 'P');
INSERT INTO `orderstatus` VALUES (1039, 1, '2024-12-25', 'P');
INSERT INTO `orderstatus` VALUES (1040, 1, '2024-12-25', 'P');
INSERT INTO `orderstatus` VALUES (1041, 1, '2025-01-10', 'P');
INSERT INTO `orderstatus` VALUES (1043, 0, '2025-03-10', 'P');
INSERT INTO `orderstatus` VALUES (1044, 0, '2025-03-12', 'P');
INSERT INTO `orderstatus` VALUES (1045, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1046, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1047, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1048, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1049, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1050, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1051, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1052, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1053, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1054, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1055, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1056, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1057, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1058, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1059, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1060, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1061, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1062, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1063, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1065, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1066, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1067, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1076, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1078, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1082, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1083, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1084, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1085, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1086, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1087, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1088, 0, '2025-04-09', 'P');
INSERT INTO `orderstatus` VALUES (1089, 0, '2025-04-24', 'P');
INSERT INTO `orderstatus` VALUES (1090, 0, '2025-04-24', 'P');
INSERT INTO `orderstatus` VALUES (1091, 0, '2025-04-24', 'P');
INSERT INTO `orderstatus` VALUES (1092, 0, '2025-04-25', 'P');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `productid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `descn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `modifying` int NULL DEFAULT NULL,
  PRIMARY KEY (`productid`) USING BTREE,
  INDEX `productCat`(`category` ASC) USING BTREE,
  INDEX `productName`(`name` ASC) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`catid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('AV-CB-01', 'BIRDS', 'Amazon Parrot', '<image src=\"/images/bird2.gif\"><span id=\"itemDescription\">Great companion for up to 75 years</span>', 0);
INSERT INTO `product` VALUES ('AV-SB-02', 'BIRDS', 'Finch', '<image src=\"/images/bird1.gif\"><span id=\"itemDescription\">Great stress reliever</span>', 0);
INSERT INTO `product` VALUES ('FI-FW-01', 'FISH', 'Koi', '<image src=\"/images/fish3.gif\"><span id=\"itemDescription\">Fresh Water fish from Japan</span>', 0);
INSERT INTO `product` VALUES ('FI-FW-02', 'FISH', 'Goldfish', '<image src=\"/images/fish2.gif\"><span id=\"itemDescription\">Fresh Water fish from China</span>', 0);
INSERT INTO `product` VALUES ('FI-SW-01', 'FISH', 'Angelfish', '<image src=\"/images/fish1.gif\"><span id=\"itemDescription\">Salt Water fish from Australia</span>', 0);
INSERT INTO `product` VALUES ('FI-SW-02', 'FISH', 'Tiger Shark', '<image src=\"/images/fish4.gif\"><span id=\"itemDescription\">Salt Water fish from Australia</span>', 0);
INSERT INTO `product` VALUES ('FL-DLH-02', 'CATS', 'Persian', '<image src=\"/images/cat1.gif\"><span id=\"itemDescription\">Friendly house cat, doubles as a princess</span>', 0);
INSERT INTO `product` VALUES ('FL-DSH-01', 'CATS', 'Manx', '<image src=\"/images/cat2.gif\"><span id=\"itemDescription\">Great for reducing mouse populations</span>', 0);
INSERT INTO `product` VALUES ('K9-BD-01', 'DOGS', 'Bulldog', '<image src=\"/images/dog2.gif\"><span id=\"itemDescription\">Friendly dog from England</span>', 0);
INSERT INTO `product` VALUES ('K9-CW-01', 'DOGS', 'Chihuahua', '<image src=\"/images/dog4.gif\"><span id=\"itemDescription\">Great companion dog</span>', 0);
INSERT INTO `product` VALUES ('K9-DL-01', 'DOGS', 'Dalmation', '<image src=\"/images/dog5.gif\"><span id=\"itemDescription\">Great dog for a Fire Station</span>', 0);
INSERT INTO `product` VALUES ('K9-PO-02', 'DOGS', 'Poodle', '<image src=\"/images/dog6.gif\"><span id=\"itemDescription\">Cute dog from France</span>', 0);
INSERT INTO `product` VALUES ('K9-RT-01', 'DOGS', 'Golden Retriever', '<image src=\"/images/dog1.gif\"><span id=\"itemDescription\">Great family dog</span>', 0);
INSERT INTO `product` VALUES ('K9-RT-02', 'DOGS', 'Labrador Retriever', '<image src=\"/images/dog5.gif\"><span id=\"itemDescription\">Great hunting dog</span>', 0);
INSERT INTO `product` VALUES ('RP-LI-02', 'REPTILES', 'Iguana', '<image src=\"/images/lizard1.gif\"><span id=\"itemDescription\">Friendly green friend</span>', 0);
INSERT INTO `product` VALUES ('RP-SN-01', 'REPTILES', 'Rattlesnake', '<image src=\"/images/snake1.gif\"><span id=\"itemDescription\">Doubles as a watch dog</span>', 0);

-- ----------------------------
-- Table structure for productjournal
-- ----------------------------
DROP TABLE IF EXISTS `productjournal`;
CREATE TABLE `productjournal`  (
  `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `productId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of productjournal
-- ----------------------------

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `userid` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `langpref` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `favcategory` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mylistopt` int NULL DEFAULT NULL,
  `banneropt` int NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('ACID', 'english', 'CATS', 1, 1);
INSERT INTO `profile` VALUES ('j2ee', 'english', 'CATS', 1, 1);

-- ----------------------------
-- Table structure for resetpassword
-- ----------------------------
DROP TABLE IF EXISTS `resetpassword`;
CREATE TABLE `resetpassword`  (
  `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of resetpassword
-- ----------------------------
INSERT INTO `resetpassword` VALUES ('j2ee', 0);
INSERT INTO `resetpassword` VALUES ('XiheLiu', 0);

-- ----------------------------
-- Table structure for returnorders
-- ----------------------------
DROP TABLE IF EXISTS `returnorders`;
CREATE TABLE `returnorders`  (
  `orderId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `descn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`orderId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of returnorders
-- ----------------------------
INSERT INTO `returnorders` VALUES ('1002', 'Don\'t Want It', 'i dont want it', NULL, 'N');
INSERT INTO `returnorders` VALUES ('1003', 'Don\'t Want It', 'Seven days return without reason', '/../Images/1003.jpg', 'W');
INSERT INTO `returnorders` VALUES ('1004', 'Inconsistent Description', '111', '/../Images/1004.jpg', 'W');
INSERT INTO `returnorders` VALUES ('1005', 'Inconsistent Description', '123', '/../Images/1005.jpg', 'W');
INSERT INTO `returnorders` VALUES ('1006', 'Inconsistent Description', 'TOO UGLY!', '/../Images/1006.jpg', 'N');
INSERT INTO `returnorders` VALUES ('1007', 'Quality Issues', 'Your product quality is too poor! I am very dissatisfied!', '/../Images/1007.jpg', 'W');

-- ----------------------------
-- Table structure for sells
-- ----------------------------
DROP TABLE IF EXISTS `sells`;
CREATE TABLE `sells`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `item_id`(`item_id` ASC) USING BTREE,
  CONSTRAINT `sells_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `account` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sells_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`itemid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sells
-- ----------------------------
INSERT INTO `sells` VALUES (1, 'EST-1', 'j2ee', 1, '2024-01-23 00:00:00');
INSERT INTO `sells` VALUES (2, 'EST-10', 'j2ee', 1, '2024-02-20 00:00:00');
INSERT INTO `sells` VALUES (3, 'EST-1', 'j2ee', 3, '2024-03-10 00:00:00');
INSERT INTO `sells` VALUES (4, 'EST-2', 'j2ee', 1, '2024-04-10 00:00:00');
INSERT INTO `sells` VALUES (5, 'EST-3', 'j2ee', 1, '2024-05-10 00:00:00');
INSERT INTO `sells` VALUES (6, 'EST-4', 'j2ee', 1, '2024-06-10 00:00:00');
INSERT INTO `sells` VALUES (7, 'EST-5', 'j2ee', 1, '2024-07-10 00:00:00');
INSERT INTO `sells` VALUES (8, 'EST-6', 'j2ee', 1, '2024-08-10 00:00:00');
INSERT INTO `sells` VALUES (9, 'EST-7', 'j2ee', 1, '2024-09-10 00:00:00');
INSERT INTO `sells` VALUES (10, 'EST-8', 'j2ee', 1, '2024-10-10 00:00:00');
INSERT INTO `sells` VALUES (11, 'EST-9', 'j2ee', 1, '2024-11-10 00:00:00');
INSERT INTO `sells` VALUES (12, 'EST-11', 'j2ee', 1, '2024-12-10 00:00:00');
INSERT INTO `sells` VALUES (13, 'EST-11', 'ACID', 1, '2024-02-10 00:00:00');
INSERT INTO `sells` VALUES (14, 'EST-12', 'ACID', 3, '2024-03-10 00:00:00');
INSERT INTO `sells` VALUES (15, 'EST-13', 'ACID', 1, '2024-04-10 00:00:00');
INSERT INTO `sells` VALUES (16, 'EST-14', 'ACID', 1, '2024-05-10 00:00:00');
INSERT INTO `sells` VALUES (17, 'EST-15', 'ACID', 1, '2024-06-10 00:00:00');
INSERT INTO `sells` VALUES (18, 'EST-16', 'ACID', 1, '2024-06-10 00:00:00');
INSERT INTO `sells` VALUES (19, 'EST-17', 'ACID', 1, '2024-07-10 00:00:00');
INSERT INTO `sells` VALUES (20, 'EST-18', 'ACID', 1, '2024-08-10 00:00:00');
INSERT INTO `sells` VALUES (21, 'EST-19', 'ACID', 1, '2024-09-10 00:00:00');
INSERT INTO `sells` VALUES (22, 'EST-20', 'ACID', 1, '2024-10-10 00:00:00');
INSERT INTO `sells` VALUES (23, 'EST-21', 'ACID', 1, '2024-11-10 00:00:00');
INSERT INTO `sells` VALUES (24, 'EST-22', 'ACID', 1, '2024-12-10 00:00:00');

-- ----------------------------
-- Table structure for sequence
-- ----------------------------
DROP TABLE IF EXISTS `sequence`;
CREATE TABLE `sequence`  (
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nextid` int NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sequence
-- ----------------------------
INSERT INTO `sequence` VALUES ('ordernum', 1092);

-- ----------------------------
-- Table structure for signon
-- ----------------------------
DROP TABLE IF EXISTS `signon`;
CREATE TABLE `signon`  (
  `username` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of signon
-- ----------------------------
INSERT INTO `signon` VALUES ('ACID', 'ACID');
INSERT INTO `signon` VALUES ('CSUstudent', '789');
INSERT INTO `signon` VALUES ('forgetfulMan', '123');
INSERT INTO `signon` VALUES ('j2ee', 'j2ee');
INSERT INTO `signon` VALUES ('XiheLiu', '456');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `suppid` int NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addr1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `addr2` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `zip` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`suppid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, 'XYZ Pets', 'AC', '600 Avon Way', '', 'Los Angeles', 'CA', '94024', '212-947-0797');
INSERT INTO `supplier` VALUES (2, 'ABC Pets', 'AC', '700 Abalone Way', '', 'San Francisco ', 'CA', '94024', '415-947-0797');

-- ----------------------------
-- Table structure for useraddress
-- ----------------------------
DROP TABLE IF EXISTS `useraddress`;
CREATE TABLE `useraddress`  (
  `userid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `addrid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `addr1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `addr2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of useraddress
-- ----------------------------
INSERT INTO `useraddress` VALUES ('ACID', '1', 'ABC', 'XYX', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'OK');
INSERT INTO `useraddress` VALUES ('j2ee', '1', 'ABC', 'XYX', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'OK');
INSERT INTO `useraddress` VALUES ('j2ee', '2', 'DDDD', 'XYXY', 'LuShanNanLu', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'OK');
INSERT INTO `useraddress` VALUES ('j2ee', '3', 'ABC', 'XYX', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'OK');

-- ----------------------------
-- Table structure for viewproduct
-- ----------------------------
DROP TABLE IF EXISTS `viewproduct`;
CREATE TABLE `viewproduct`  (
  `productId` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `viewCount` int NULL DEFAULT NULL,
  PRIMARY KEY (`productId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of viewproduct
-- ----------------------------
INSERT INTO `viewproduct` VALUES ('AV-CB-01', 4);
INSERT INTO `viewproduct` VALUES ('AV-SB-02', 0);
INSERT INTO `viewproduct` VALUES ('FI-FW-01', 7);
INSERT INTO `viewproduct` VALUES ('FI-FW-02', 4);
INSERT INTO `viewproduct` VALUES ('FI-SW-01', 3);
INSERT INTO `viewproduct` VALUES ('FI-SW-02', 0);
INSERT INTO `viewproduct` VALUES ('FL-DLH-02', 3);
INSERT INTO `viewproduct` VALUES ('FL-DSH-01', 1);
INSERT INTO `viewproduct` VALUES ('K9-BD-01', 2);
INSERT INTO `viewproduct` VALUES ('K9-CW-01', 3);
INSERT INTO `viewproduct` VALUES ('K9-DL-01', 0);
INSERT INTO `viewproduct` VALUES ('K9-PO-02', 0);
INSERT INTO `viewproduct` VALUES ('K9-RT-01', 0);
INSERT INTO `viewproduct` VALUES ('K9-RT-02', 0);
INSERT INTO `viewproduct` VALUES ('RP-LI-02', 3);
INSERT INTO `viewproduct` VALUES ('RP-SN-01', 0);

SET FOREIGN_KEY_CHECKS = 1;
