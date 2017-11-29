/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : sglm

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-11-29 17:50:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` varchar(255) NOT NULL,
  `fruit` varchar(255) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '苹果', '5.50', '80dd77dc-24ec-487c-a212-ac51b1bc08ff.jpg');
INSERT INTO `goods` VALUES ('1013243b-c6ed-412f-91fc-bf58d6b828a3', '白心火龙果', '6.00', 'd2a10cb1-a8e7-4a8d-ab08-f4e546e20a68.jpeg');
INSERT INTO `goods` VALUES ('105b12f1-79c8-4eb6-a0bb-7d0202c20a58', '红心火龙果', '7.00', null);
INSERT INTO `goods` VALUES ('16da46ab-12e3-471f-88ed-b557a384653e', '水蜜桃', '7.00', null);
INSERT INTO `goods` VALUES ('1776c300-a72c-4be3-9678-5bdd30552931', '进口橙子', '12.00', null);
INSERT INTO `goods` VALUES ('1b55857e-0713-4a78-8c01-cda1ccbd15fd', '黄桃', '7.00', null);
INSERT INTO `goods` VALUES ('1f61d63b-4e0b-48fb-abfe-303e3bbc1d41', '橘子', '4.50', '288ebe88-6a2e-4e28-8aea-abd9ddcfd755.jpg');
INSERT INTO `goods` VALUES ('2', '砀山梨', '2.50', '405bc79b-4fde-4379-9e56-3d5381c60a0d.jpg');
INSERT INTO `goods` VALUES ('2c9da864-cd90-4f80-bb89-6f7cecdde878', '黄心西瓜', '3.50', null);
INSERT INTO `goods` VALUES ('32f03294-7de7-465a-a955-31ae4481d482', '柿子', '3.50', '4c925538-403b-48df-9f9a-5b4cb3671fb1.jpeg');
INSERT INTO `goods` VALUES ('34e0aa0d-1c58-47e2-82ff-26f0c9d7a5cf', '西柚', '12.00', null);
INSERT INTO `goods` VALUES ('3cf61c69-a2bf-4e3b-b3d0-f471084add71', '黑布李', '5.50', '5b6c9de7-9473-4f7a-957b-c7821c353780.jpeg');
INSERT INTO `goods` VALUES ('4c2fa731-38f3-4476-ab81-960db02a035e', '雪梨', '3.50', null);
INSERT INTO `goods` VALUES ('53b82d36-a4f9-45d2-b454-0f70eb83ad9b', '雪梨', '3.50', null);
INSERT INTO `goods` VALUES ('59673817-5e1b-4531-9870-cefef961aed8', '青苹果', '3.50', null);
INSERT INTO `goods` VALUES ('6617be1a-eecd-4e4a-971f-3cc19754f4c8', '白柚', '3.50', null);
INSERT INTO `goods` VALUES ('79d4f051-8c3b-4bee-89d5-fa953682afd4', '红柚', '7.00', null);
INSERT INTO `goods` VALUES ('7d1dc644-c5c9-4db5-8591-649cb6391c8b', '西瓜 备注注明半个还是1个', '2.50', '0b7d4ec5-9eec-4976-a419-98072061b629.jpg');
INSERT INTO `goods` VALUES ('8b9fe24f-c58c-4b94-a857-cc7a72a20d87', '冬枣', '9.00', 'c6e80a28-6050-4604-8d8e-621d613ad74c.jpeg');
INSERT INTO `goods` VALUES ('a0cfa88d-70d6-4f2f-a166-0bdb24d51000', '香蕉', '3.00', null);
INSERT INTO `goods` VALUES ('aaa0963d-a1ac-4017-8c10-5b7a7437cee3', '猕猴桃', '6.50', '0b93e1ba-8e51-4593-981e-bb9adc381119.jpeg');
INSERT INTO `goods` VALUES ('bd9c8e90-6c8a-439f-a308-e0e46eaadfd7', '红堤', '9.00', 'e4fb96e7-bf09-41af-8ede-91c8cf222532.jpeg');
INSERT INTO `goods` VALUES ('c0bc8cd3-b074-44c8-b93c-d7f34e6305f8', '石榴', '10.00', '5edccb8d-661c-4b09-9c8d-712ffa4f70bd.jpeg');
INSERT INTO `goods` VALUES ('cfcd8a35-bc24-453c-bfcd-61bb3df7852f', '圣女果', '8.00', null);
INSERT INTO `goods` VALUES ('e1078d5f-c1d4-4c61-ae05-c7a41d11bd35', '柠檬（7元2个）', '7.00', null);
INSERT INTO `goods` VALUES ('e29a0695-dd13-4a72-84cc-ddaff0507535', '葡萄', '8.00', null);
INSERT INTO `goods` VALUES ('f8c5bf70-7a1e-4969-b96b-32f4f458c24f', '哈密瓜', '3.50', 'fdf9705c-db23-4089-9b41-d6a32072aeab.jpg');
INSERT INTO `goods` VALUES ('f943a03c-d124-4431-8cac-db1143d335c2', '西红柿', '4.00', 'ccdb8881-e8b1-4a9d-878c-f3645b303857.jpeg');

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` varchar(255) NOT NULL,
  `price` double(10,2) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `goods_id` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `eachprice` double DEFAULT NULL,
  `goods_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('02108acb-7256-434c-888e-f915991ba80e', '3.50', 'e20de2f8-7f5c-47e6-ae65-2d70e928464a', '6617be1a-eecd-4e4a-971f-3cc19754f4c8', '1', '3.5', '白柚');
INSERT INTO `items` VALUES ('02a3764e-a3d1-4ed9-b9a2-8a98d1742332', '3.50', 'c96927af-731e-46d8-8e9c-b1bff99b3788', '32f03294-7de7-465a-a955-31ae4481d482', '1', '3.5', '柿子');
INSERT INTO `items` VALUES ('08e0bb34-4cc8-42b0-baed-300e6ebd72dc', '5.50', '3b3e3328-0e10-4ca2-8391-6f7c00699a29', '1', '1', '5.5', '苹果');
INSERT INTO `items` VALUES ('0a154f1c-79b0-46d7-a2f7-3f3585f79434', '9.00', '609244a5-c265-4df2-b3f2-208215ae4114', '8b9fe24f-c58c-4b94-a857-cc7a72a20d87', '1', '9', '冬枣');
INSERT INTO `items` VALUES ('0db8b2ab-2503-489f-adb3-160534939f2e', '5.50', '8f3cc377-39f8-46b5-b2c7-0424eb574369', '1', '1', '5.5', '苹果');
INSERT INTO `items` VALUES ('0dbc96d7-ecb7-4423-b569-5bfa800bd95e', '6.00', '3d98a475-a2ce-4fb7-97cd-3ca25b98c3f3', '1013243b-c6ed-412f-91fc-bf58d6b828a3', '1', '6', '白心火龙果');
INSERT INTO `items` VALUES ('0e9f79f7-a820-438c-88fc-ee315afb33b4', '11.00', 'a165273a-6b09-4057-9486-4691503cf601', '3cf61c69-a2bf-4e3b-b3d0-f471084add71', '2', '5.5', '黑布李');
INSERT INTO `items` VALUES ('0fd55f96-cf67-478f-b83f-9a0437930bdd', '8.00', 'acf46cb7-28fc-4c49-8806-cdc109b3d9f6', 'cfcd8a35-bc24-453c-bfcd-61bb3df7852f', '1', '8', '圣女果');
INSERT INTO `items` VALUES ('1010a25e-38bf-42a3-b600-c6e24a1b6b24', '9.00', 'cf734a2a-2cac-4e9f-bc47-b2ec2743f38d', '1f61d63b-4e0b-48fb-abfe-303e3bbc1d41', '2', '4.5', '橘子');
INSERT INTO `items` VALUES ('16cfa3ea-6930-4218-82ec-3b917e4e7ff8', '9.00', '3b901ec9-f850-4238-8ce8-46efc887e1ca', 'bd9c8e90-6c8a-439f-a308-e0e46eaadfd7', '1', '9', '红堤');
INSERT INTO `items` VALUES ('16d1a3a7-c2e0-42ec-9aaf-772957b013e6', '4.50', '8f3cc377-39f8-46b5-b2c7-0424eb574369', '1f61d63b-4e0b-48fb-abfe-303e3bbc1d41', '1', '4.5', '橘子');
INSERT INTO `items` VALUES ('1a51132a-1540-4f14-b4c1-914bdab5e85b', '9.00', 'f8b01bf6-fde6-425c-b618-34029ab2b63a', '8b9fe24f-c58c-4b94-a857-cc7a72a20d87', '1', '9', '冬枣');
INSERT INTO `items` VALUES ('1fb8aca7-285f-49b6-873b-a96e6ba37883', '3.50', 'f8b01bf6-fde6-425c-b618-34029ab2b63a', '32f03294-7de7-465a-a955-31ae4481d482', '1', '3.5', '柿子');
INSERT INTO `items` VALUES ('205861d6-e867-4356-8830-eba7cb557d42', '3.00', 'f4bf8cf2-de15-452d-9c56-f9e8be2f9f10', 'a0cfa88d-70d6-4f2f-a166-0bdb24d51000', '1', '3', '香蕉');
INSERT INTO `items` VALUES ('23e4160e-adae-4c7a-8b75-cb0e7f567925', '6.00', '0af1bccc-4107-4df8-93fb-eabb76511f72', '1013243b-c6ed-412f-91fc-bf58d6b828a3', '1', '6', '白心火龙果');
INSERT INTO `items` VALUES ('2626384c-79e7-46c9-9745-19f914b8194d', '18.00', 'acf46cb7-28fc-4c49-8806-cdc109b3d9f6', 'bd9c8e90-6c8a-439f-a308-e0e46eaadfd7', '2', '9', '红堤');
INSERT INTO `items` VALUES ('2a85204a-22c2-418c-8dc5-40cbedd5bf1a', '3.50', 'acf46cb7-28fc-4c49-8806-cdc109b3d9f6', '6617be1a-eecd-4e4a-971f-3cc19754f4c8', '1', '3.5', '白柚');
INSERT INTO `items` VALUES ('2c4a5a18-599e-4b13-9398-875b4876bd82', '2.50', '50202607-a442-4478-8ba2-4221e7fe9d3c', '2', '1', '2.5', '砀山梨');
INSERT INTO `items` VALUES ('2d95084e-ddd6-4e73-b251-836d7dcc502d', '3.50', '167e2f4f-eb74-40fd-953e-c93da6b6d130', 'f8c5bf70-7a1e-4969-b96b-32f4f458c24f', '1', '3.5', '哈密瓜');
INSERT INTO `items` VALUES ('301db59c-2b3e-4375-9593-348e9e0995c8', '9.00', '0af1bccc-4107-4df8-93fb-eabb76511f72', '8b9fe24f-c58c-4b94-a857-cc7a72a20d87', '1', '9', '冬枣');
INSERT INTO `items` VALUES ('3231f519-bf50-4720-b392-98d118cd4231', '4.50', '5c578a03-fd8e-4d57-a573-e107363266bd', '1f61d63b-4e0b-48fb-abfe-303e3bbc1d41', '1', '4.5', '橘子');
INSERT INTO `items` VALUES ('3302062f-1d95-44db-9e1b-2d59c26a56cc', '9.00', '813f34e3-5fbc-4fc7-befd-b7cfd4e69999', 'bd9c8e90-6c8a-439f-a308-e0e46eaadfd7', '1', '9', '红堤');
INSERT INTO `items` VALUES ('3814deba-6f88-4bee-b999-2ec8cf8d8cac', '9.00', 'a165273a-6b09-4057-9486-4691503cf601', 'bd9c8e90-6c8a-439f-a308-e0e46eaadfd7', '1', '9', '红堤');
INSERT INTO `items` VALUES ('38efce21-92da-40a4-b794-a8ee5e88e9fa', '7.00', 'd58950fb-c879-4892-88ea-65146220ec35', '6617be1a-eecd-4e4a-971f-3cc19754f4c8', '2', '3.5', '白柚');
INSERT INTO `items` VALUES ('3c642909-d4cc-48a9-8408-0cfc1f245f2c', '9.00', '8f3cc377-39f8-46b5-b2c7-0424eb574369', '8b9fe24f-c58c-4b94-a857-cc7a72a20d87', '1', '9', '冬枣');
INSERT INTO `items` VALUES ('4200e86e-9c2e-45dd-8c39-b89e5ef3ae2f', '7.00', 'c96927af-731e-46d8-8e9c-b1bff99b3788', '53b82d36-a4f9-45d2-b454-0f70eb83ad9b', '2', '3.5', '雪梨');
INSERT INTO `items` VALUES ('455675cb-d070-42c1-b393-d826fd75c7a4', '6.00', 'cf734a2a-2cac-4e9f-bc47-b2ec2743f38d', 'a0cfa88d-70d6-4f2f-a166-0bdb24d51000', '2', '3', '香蕉');
INSERT INTO `items` VALUES ('4c7a5d9e-c90a-424f-924f-e7f2b225ab30', '6.00', 'd58950fb-c879-4892-88ea-65146220ec35', 'a0cfa88d-70d6-4f2f-a166-0bdb24d51000', '2', '3', '香蕉');
INSERT INTO `items` VALUES ('4fc67e40-7c72-4eba-bb9d-2afdeb4568a8', '6.00', '1859889f-6a45-4656-9ba7-74ddbfdf6293', '1013243b-c6ed-412f-91fc-bf58d6b828a3', '1', '6', '白心火龙果');
INSERT INTO `items` VALUES ('537f4da9-d8e5-4d92-bb9f-a12b90eb2f94', '3.50', 'ff5bf462-9d4f-4daa-bd4e-77ff561aaa8a', '4c2fa731-38f3-4476-ab81-960db02a035e', '1', '3.5', '雪梨');
INSERT INTO `items` VALUES ('54cbfbd8-6672-49f7-a444-1724171bd26c', '0.53', '0fd051b4-cc40-4f07-bbf7-34ec6178a5cc', '1', '1', '0.53', '苹果');
INSERT INTO `items` VALUES ('56a3f54e-4bb8-461c-b47a-398ef916aa64', '16.50', 'a6e3c178-7e0b-4ec0-ae7c-122111a8555c', '1', '3', '5.5', '苹果');
INSERT INTO `items` VALUES ('59f83974-84b1-49be-b5a2-a1772d0a14ca', '11.00', 'a1d273d1-1258-4310-aad4-c0537058ed90', '3cf61c69-a2bf-4e3b-b3d0-f471084add71', '2', '5.5', '黑布李');
INSERT INTO `items` VALUES ('5ab572d9-c2fe-4d63-ab6e-68fde6bc47cd', '5.50', '9eb0785f-5293-408e-b336-6b1fa81740cf', '1', '1', '5.5', '苹果');
INSERT INTO `items` VALUES ('5c101aa2-90b8-4420-b7d3-d5b22befb091', '0.28', 'cd685e0f-7c22-4db0-a907-5efa08c11177', '082234d1-3123-4f1c-9e01-086ef552a73e', '1', '0.28', '火龙果');
INSERT INTO `items` VALUES ('5cb7cd9e-a85c-4383-ab3b-f720d37894a0', '12.00', 'f64bb0d1-9ed8-4689-9a8d-edb1dd41ccc9', 'a0cfa88d-70d6-4f2f-a166-0bdb24d51000', '4', '3', '香蕉');
INSERT INTO `items` VALUES ('60ca64f1-03cb-4db0-9e29-aafb3772f261', '5.50', 'a6e3c178-7e0b-4ec0-ae7c-122111a8555c', '3cf61c69-a2bf-4e3b-b3d0-f471084add71', '1', '5.5', '黑布李');
INSERT INTO `items` VALUES ('631e7ef4-1ad3-42a2-9a18-52debb6a1b85', '11.00', '5426723c-052a-42ff-bb46-e1bc10d4e57d', '1', '2', '5.5', '苹果');
INSERT INTO `items` VALUES ('647df9a4-bcfd-4bb6-bb71-89def8d9e2b8', '6.50', 'f28944b6-9c87-4a48-93a6-421799f9bb4c', 'aaa0963d-a1ac-4017-8c10-5b7a7437cee3', '1', '6.5', '猕猴桃');
INSERT INTO `items` VALUES ('6757d307-ffd6-4ad4-b4b4-2ff6009038a7', '9.00', 'a1d273d1-1258-4310-aad4-c0537058ed90', 'bd9c8e90-6c8a-439f-a308-e0e46eaadfd7', '1', '9', '红堤');
INSERT INTO `items` VALUES ('68030bb3-b142-4c6f-a19f-5e10361ebf3a', '5.50', 'bceaf8db-3118-4e24-bc77-bef8b2e376bc', '3cf61c69-a2bf-4e3b-b3d0-f471084add71', '1', '5.5', '黑布李');
INSERT INTO `items` VALUES ('6a6b314a-a905-4480-badc-3b9d2e0ed437', '11.00', 'aebe8397-13d8-4a04-875b-f73eb9cc94ce', '1', '2', '5.5', '苹果');
INSERT INTO `items` VALUES ('6d7127c5-e6b9-406a-be0c-a09fd0837d58', '6.00', '167e2f4f-eb74-40fd-953e-c93da6b6d130', '1013243b-c6ed-412f-91fc-bf58d6b828a3', '1', '6', '白心火龙果');
INSERT INTO `items` VALUES ('700f068b-c4b1-40a4-bed9-5d3c274ee59a', '4.50', '50202607-a442-4478-8ba2-4221e7fe9d3c', '1f61d63b-4e0b-48fb-abfe-303e3bbc1d41', '1', '4.5', '橘子');
INSERT INTO `items` VALUES ('70167809-9a17-4fa8-b145-fcf61e2ca25c', '2.50', 'f8b01bf6-fde6-425c-b618-34029ab2b63a', '2', '1', '2.5', '砀山梨');
INSERT INTO `items` VALUES ('71772357-01de-48d9-aaf7-8885cdec1581', '4.50', '74b414a1-42b8-4545-8b5a-85d698b05c78', '1f61d63b-4e0b-48fb-abfe-303e3bbc1d41', '1', '4.5', '橘子');
INSERT INTO `items` VALUES ('72456392-91e2-45bb-9348-2456236dc831', '11.00', '3b901ec9-f850-4238-8ce8-46efc887e1ca', '1', '2', '5.5', '苹果');
INSERT INTO `items` VALUES ('727d4083-b788-41bf-ae35-1569f69324e2', '3.00', 'f28944b6-9c87-4a48-93a6-421799f9bb4c', 'a0cfa88d-70d6-4f2f-a166-0bdb24d51000', '1', '3', '香蕉');
INSERT INTO `items` VALUES ('74162f8f-9f4d-4549-b5a4-ec7b49004976', '4.50', 'e650c1b7-37da-45b0-941c-89c958d18ac0', '1f61d63b-4e0b-48fb-abfe-303e3bbc1d41', '1', '4.5', '橘子');
INSERT INTO `items` VALUES ('75d74172-8c41-4bfe-803f-a616def7032e', '8.00', 'f28944b6-9c87-4a48-93a6-421799f9bb4c', 'cfcd8a35-bc24-453c-bfcd-61bb3df7852f', '1', '8', '圣女果');
INSERT INTO `items` VALUES ('76b44a99-1b04-4a2b-a012-fc057e9df3fc', '4.50', '642eccdc-035d-4797-92fb-e2676ba2cb68', '1f61d63b-4e0b-48fb-abfe-303e3bbc1d41', '1', '4.5', '橘子');
INSERT INTO `items` VALUES ('7ed2607e-ec82-4ff5-8ce2-1534c2dc2f78', '7.00', 'f28944b6-9c87-4a48-93a6-421799f9bb4c', '1b55857e-0713-4a78-8c01-cda1ccbd15fd', '1', '7', '黄桃');
INSERT INTO `items` VALUES ('8045540d-b03e-4555-a3f9-7c70cc8ad028', '3.00', 'f8873048-653d-46e5-b342-514544240fc0', 'a0cfa88d-70d6-4f2f-a166-0bdb24d51000', '1', '3', '香蕉');
INSERT INTO `items` VALUES ('80b705cc-1136-44de-a53c-fcdc1b8120ec', '3.00', 'c96927af-731e-46d8-8e9c-b1bff99b3788', 'a0cfa88d-70d6-4f2f-a166-0bdb24d51000', '1', '3', '香蕉');
INSERT INTO `items` VALUES ('817c1f11-abd3-406c-a228-b503fd9cbaf8', '5.50', 'e20de2f8-7f5c-47e6-ae65-2d70e928464a', '1', '1', '5.5', '苹果');
INSERT INTO `items` VALUES ('84a4a861-9e00-4ebb-9975-308cef573b7c', '2.50', 'aebe8397-13d8-4a04-875b-f73eb9cc94ce', '2', '1', '2.5', '砀山梨');
INSERT INTO `items` VALUES ('87696be0-edeb-48a9-8f78-9357ea59122a', '10.00', '28aa6462-5918-4d02-8321-caad0f788438', '2', '4', '2.5', '砀山梨');
INSERT INTO `items` VALUES ('8a08c971-a44d-428c-896c-5f3bbea7bbb2', '11.00', '5c578a03-fd8e-4d57-a573-e107363266bd', '1', '2', '5.5', '苹果');
INSERT INTO `items` VALUES ('8e5d85e2-66bf-43ba-9fb7-9ba3495c0c2c', '9.00', '50202607-a442-4478-8ba2-4221e7fe9d3c', 'bd9c8e90-6c8a-439f-a308-e0e46eaadfd7', '1', '9', '红堤');
INSERT INTO `items` VALUES ('8fb47b5c-2f74-455c-99c0-8056189ed1a3', '7.00', '1cc55c04-87b9-45f3-abbe-c4dc7da53f79', '59673817-5e1b-4531-9870-cefef961aed8', '2', '3.5', '青苹果');
INSERT INTO `items` VALUES ('98e83aea-1f56-4943-aa63-e56b37f8fef4', '3.50', 'dfa820bc-1138-41c1-9164-c1f77bedd748', 'f8c5bf70-7a1e-4969-b96b-32f4f458c24f', '1', '3.5', '哈密瓜');
INSERT INTO `items` VALUES ('9df8a41c-e9e6-4c05-b209-bbe5ba1a98aa', '0.28', '0fd051b4-cc40-4f07-bbf7-34ec6178a5cc', '082234d1-3123-4f1c-9e01-086ef552a73e', '1', '0.28', '火龙果');
INSERT INTO `items` VALUES ('a36eec75-88a4-4a9c-b8da-f10094732301', '4.50', 'f8873048-653d-46e5-b342-514544240fc0', '1f61d63b-4e0b-48fb-abfe-303e3bbc1d41', '1', '4.5', '橘子');
INSERT INTO `items` VALUES ('a4c86211-1ccf-4ee0-bcc5-9a644de9e8e7', '5.50', 'a993f823-2c3c-492a-8efa-5b4ff7febdb8', '3cf61c69-a2bf-4e3b-b3d0-f471084add71', '1', '5.5', '黑布李');
INSERT INTO `items` VALUES ('a7162d12-d71c-4580-9865-be8caab0d971', '2.50', 'abd299ae-45c6-4e92-995a-653cb7e38bbf', '7d1dc644-c5c9-4db5-8591-649cb6391c8b', '1', '2.5', '西瓜 备注注明半个还是1个');
INSERT INTO `items` VALUES ('a76b6293-48a6-4c1b-a19f-92671497c22e', '1.50', '0fd051b4-cc40-4f07-bbf7-34ec6178a5cc', '2', '1', '1.5', '梨');
INSERT INTO `items` VALUES ('a945963f-1004-4db5-9bb2-7f541a87b936', '5.00', '3d98a475-a2ce-4fb7-97cd-3ca25b98c3f3', '2', '2', '2.5', '砀山梨');
INSERT INTO `items` VALUES ('abf6f641-0469-42eb-9f0f-934f8b96f55b', '2.50', '5c578a03-fd8e-4d57-a573-e107363266bd', '7d1dc644-c5c9-4db5-8591-649cb6391c8b', '1', '2.5', '西瓜 备注注明半个还是1个');
INSERT INTO `items` VALUES ('ac453ef2-7572-4037-9ef2-fa11cdb406f0', '9.00', 'a165273a-6b09-4057-9486-4691503cf601', '1f61d63b-4e0b-48fb-abfe-303e3bbc1d41', '2', '4.5', '橘子');
INSERT INTO `items` VALUES ('af2d66bd-1571-41e6-ba5e-fbbaeda33f7e', '1000000.00', 'aba8dcd7-05eb-4e7f-ba91-b59d27f5269a', '34c973bb-378b-470e-baa1-a1112b2fde8e', '1', '1000000', '香蕉等其余水果会在11号晚上陆续补货');
INSERT INTO `items` VALUES ('b2eb41ed-5594-447b-b498-88923adfd7af', '10.50', 'd58950fb-c879-4892-88ea-65146220ec35', '59673817-5e1b-4531-9870-cefef961aed8', '3', '3.5', '青苹果');
INSERT INTO `items` VALUES ('b3af4788-441c-49b3-84c4-2d9e9176c729', '5.50', '9eb0785f-5293-408e-b336-6b1fa81740cf', '3cf61c69-a2bf-4e3b-b3d0-f471084add71', '1', '5.5', '黑布李');
INSERT INTO `items` VALUES ('b49feb9e-497b-4b38-9952-0328e2d41e11', '9.00', '74605ff6-7687-4cdf-8ace-acd37f31d3ac', 'bd9c8e90-6c8a-439f-a308-e0e46eaadfd7', '1', '9', '红堤');
INSERT INTO `items` VALUES ('b5204d9f-b900-4f88-b07b-9c4181987116', '5.00', '5426723c-052a-42ff-bb46-e1bc10d4e57d', '2', '2', '2.5', '砀山梨');
INSERT INTO `items` VALUES ('b7990f7f-698c-437e-84a2-a2bdde8d83c5', '10.50', 'db28d282-9b9a-4d43-a19b-ed61db6fe5c6', '53b82d36-a4f9-45d2-b454-0f70eb83ad9b', '3', '3.5', '雪梨');
INSERT INTO `items` VALUES ('b7efe9ad-16ef-475b-850a-5f1b5d93694e', '9.00', 'a1d273d1-1258-4310-aad4-c0537058ed90', '1f61d63b-4e0b-48fb-abfe-303e3bbc1d41', '2', '4.5', '橘子');
INSERT INTO `items` VALUES ('bc2ae082-ad0e-4d66-ac14-828895704eb0', '5.50', '74b414a1-42b8-4545-8b5a-85d698b05c78', '1', '1', '5.5', '苹果');
INSERT INTO `items` VALUES ('bd22d46d-be0d-4061-b88d-c03e58f1ca6d', '6.50', 'f4bf8cf2-de15-452d-9c56-f9e8be2f9f10', 'aaa0963d-a1ac-4017-8c10-5b7a7437cee3', '1', '6.5', '猕猴桃');
INSERT INTO `items` VALUES ('be88756e-b643-4228-9e38-32201dec9aef', '5.50', '045ce421-4678-4432-8354-4c8605c7c3f4', '1', '1', '5.5', '苹果');
INSERT INTO `items` VALUES ('beb5ea21-3723-4ef9-9301-69c63fd0ccbd', '6.00', '642eccdc-035d-4797-92fb-e2676ba2cb68', 'a0cfa88d-70d6-4f2f-a166-0bdb24d51000', '2', '3', '香蕉');
INSERT INTO `items` VALUES ('bef7b65f-f50c-4fd9-866e-dca8611bf8b2', '1.40', '0fd051b4-cc40-4f07-bbf7-34ec6178a5cc', '3', '1', '1.4', '香蕉');
INSERT INTO `items` VALUES ('c1c0c49d-2ce9-4867-b9c9-4739a7c2aecd', '2.50', '813f34e3-5fbc-4fc7-befd-b7cfd4e69999', '7d1dc644-c5c9-4db5-8591-649cb6391c8b', '1', '2.5', '西瓜');
INSERT INTO `items` VALUES ('c57abecb-b7dd-4cb1-ac8b-02f3456025dd', '9.00', '0af1bccc-4107-4df8-93fb-eabb76511f72', 'bd9c8e90-6c8a-439f-a308-e0e46eaadfd7', '1', '9', '红堤');
INSERT INTO `items` VALUES ('c718a904-2627-40d7-9a75-61c3f2b3cd26', '8.00', '167e2f4f-eb74-40fd-953e-c93da6b6d130', 'f943a03c-d124-4431-8cac-db1143d335c2', '2', '4', '西红柿');
INSERT INTO `items` VALUES ('c7d0acd8-7175-4198-b50b-426c1a193cb7', '4.00', '3b3e3328-0e10-4ca2-8391-6f7c00699a29', 'f943a03c-d124-4431-8cac-db1143d335c2', '1', '4', '西红柿');
INSERT INTO `items` VALUES ('c928f944-9a42-4f61-a3bf-743110f2bfd3', '5.00', '045ce421-4678-4432-8354-4c8605c7c3f4', '2', '2', '2.5', '砀山梨');
INSERT INTO `items` VALUES ('ca71add6-889b-4718-a20e-4c276580feeb', '2.50', '0af1bccc-4107-4df8-93fb-eabb76511f72', '2', '1', '2.5', '砀山梨');
INSERT INTO `items` VALUES ('caef090d-9618-4726-b77b-3394bbddb0b4', '3.00', '74605ff6-7687-4cdf-8ace-acd37f31d3ac', 'a0cfa88d-70d6-4f2f-a166-0bdb24d51000', '1', '3', '香蕉');
INSERT INTO `items` VALUES ('cb156c2e-5254-4488-b71d-880de8fb8000', '7.00', '74605ff6-7687-4cdf-8ace-acd37f31d3ac', 'f8c5bf70-7a1e-4969-b96b-32f4f458c24f', '2', '3.5', '哈密瓜');
INSERT INTO `items` VALUES ('cc5ed7c4-c293-4b90-8ef0-8fc693e8c20a', '1.38', '0fd051b4-cc40-4f07-bbf7-34ec6178a5cc', '1f61d63b-4e0b-48fb-abfe-303e3bbc1d41', '6', '0.23', '橘子');
INSERT INTO `items` VALUES ('ce86dc49-a99e-4ad6-a626-8717238f2597', '6.50', 'e20de2f8-7f5c-47e6-ae65-2d70e928464a', 'aaa0963d-a1ac-4017-8c10-5b7a7437cee3', '1', '6.5', '猕猴桃');
INSERT INTO `items` VALUES ('d3cbef2a-b5a2-49b6-be40-4873a158662c', '6.00', '533d8bcc-d537-423c-8496-f0512ac3664b', '1013243b-c6ed-412f-91fc-bf58d6b828a3', '1', '6', '白心火龙果');
INSERT INTO `items` VALUES ('d85b1389-c4b9-4202-ae1f-ab8c644314b5', '5.50', '5426723c-052a-42ff-bb46-e1bc10d4e57d', '3cf61c69-a2bf-4e3b-b3d0-f471084add71', '1', '5.5', '黑布李');
INSERT INTO `items` VALUES ('d9083c6a-003b-46f5-92cc-032957496178', '7.00', 'e20de2f8-7f5c-47e6-ae65-2d70e928464a', '105b12f1-79c8-4eb6-a0bb-7d0202c20a58', '1', '7', '红心火龙果');
INSERT INTO `items` VALUES ('da5111c7-332c-47df-8f33-c4daaab29e3e', '9.00', '1cc55c04-87b9-45f3-abbe-c4dc7da53f79', 'a0cfa88d-70d6-4f2f-a166-0bdb24d51000', '3', '3', '香蕉');
INSERT INTO `items` VALUES ('db7a593f-9140-496d-8689-14e5e3757ef7', '2.50', 'bceaf8db-3118-4e24-bc77-bef8b2e376bc', '7d1dc644-c5c9-4db5-8591-649cb6391c8b', '1', '2.5', '西瓜 备注注明半个还是1个');
INSERT INTO `items` VALUES ('de5c339f-913c-46a6-a6c4-9afa4684539c', '10.00', 'f4bf8cf2-de15-452d-9c56-f9e8be2f9f10', 'c0bc8cd3-b074-44c8-b93c-d7f34e6305f8', '1', '10', '石榴');
INSERT INTO `items` VALUES ('df14b39f-afc1-413d-b560-a0dff593d91b', '3.50', 'ff5bf462-9d4f-4daa-bd4e-77ff561aaa8a', '59673817-5e1b-4531-9870-cefef961aed8', '1', '3.5', '青苹果');
INSERT INTO `items` VALUES ('e10ea4f1-3fa4-4f6c-9d4c-7dea512cf6a0', '4.50', 'd58950fb-c879-4892-88ea-65146220ec35', '1f61d63b-4e0b-48fb-abfe-303e3bbc1d41', '1', '4.5', '橘子');
INSERT INTO `items` VALUES ('e5c9c14d-6c43-4b15-9b19-9c1efab5ccdb', '3.00', 'dfa820bc-1138-41c1-9164-c1f77bedd748', 'a0cfa88d-70d6-4f2f-a166-0bdb24d51000', '1', '3', '香蕉');
INSERT INTO `items` VALUES ('ec2e54d4-0795-41d2-b278-324001531492', '5.00', '9eb0785f-5293-408e-b336-6b1fa81740cf', '2', '2', '2.5', '砀山梨');
INSERT INTO `items` VALUES ('ed20b756-fd0e-4b3d-a848-2308fa28ff12', '5.50', '0af1bccc-4107-4df8-93fb-eabb76511f72', '1', '1', '5.5', '苹果');
INSERT INTO `items` VALUES ('ed65a470-70f6-4bbb-a8b4-4e61ace1cd4d', '3.50', '70114c2e-4225-4833-b167-70c5c5932572', '32f03294-7de7-465a-a955-31ae4481d482', '1', '3.5', '柿子');
INSERT INTO `items` VALUES ('f31acd61-0d2f-4b2f-a0df-cc984e459f2d', '4.50', 'aebe8397-13d8-4a04-875b-f73eb9cc94ce', '1f61d63b-4e0b-48fb-abfe-303e3bbc1d41', '1', '4.5', '橘子');
INSERT INTO `items` VALUES ('f5697251-bbb7-46a2-b822-e21821d67241', '5.50', 'f8873048-653d-46e5-b342-514544240fc0', '1', '1', '5.5', '苹果');
INSERT INTO `items` VALUES ('f59b976d-0eb9-4cc7-bad5-ba18875f7f23', '4.50', 'c96927af-731e-46d8-8e9c-b1bff99b3788', '1f61d63b-4e0b-48fb-abfe-303e3bbc1d41', '1', '4.5', '橘子');
INSERT INTO `items` VALUES ('f6f5b0c9-6bec-4545-a75a-8f72a737d71f', '18.00', 'e20de2f8-7f5c-47e6-ae65-2d70e928464a', 'bd9c8e90-6c8a-439f-a308-e0e46eaadfd7', '2', '9', '红堤');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(255) NOT NULL,
  `price` double(10,2) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('045ce421-4678-4432-8354-4c8605c7c3f4', '10.50', '吴嘉纯', '2017-09-11 12:30:48', '2', '');
INSERT INTO `orders` VALUES ('0af1bccc-4107-4df8-93fb-eabb76511f72', '32.00', 'wujunwen', '2017-09-12 10:21:16', '2', '火龙果一个，苹果两个，梨两个');
INSERT INTO `orders` VALUES ('0fd051b4-cc40-4f07-bbf7-34ec6178a5cc', '5.09', '沈大大', '2017-09-10 19:25:51', '2', '我最帅 所以要帅哥送');
INSERT INTO `orders` VALUES ('167e2f4f-eb74-40fd-953e-c93da6b6d130', '17.50', '45', '2017-09-13 20:30:38', '1', '一个火龙果，小半个哈密瓜，2个西红柿');
INSERT INTO `orders` VALUES ('1859889f-6a45-4656-9ba7-74ddbfdf6293', '6.00', '戴梦婷', '2017-09-11 12:31:10', '2', '四个黄桃，一个石榴（小一点）');
INSERT INTO `orders` VALUES ('1cc55c04-87b9-45f3-abbe-c4dc7da53f79', '16.00', '花花', '2017-09-12 12:40:31', '2', '青苹果5个，香蕉6个');
INSERT INTO `orders` VALUES ('28aa6462-5918-4d02-8321-caad0f788438', '10.00', 'ritian', '2017-09-12 17:42:16', '2', '');
INSERT INTO `orders` VALUES ('3b3e3328-0e10-4ca2-8391-6f7c00699a29', '9.50', '叽叽叽叽', '2017-09-12 13:19:05', '2', '六个苹果   四个西红柿');
INSERT INTO `orders` VALUES ('3b901ec9-f850-4238-8ce8-46efc887e1ca', '20.00', '布莱克', '2017-09-11 14:08:16', '2', '');
INSERT INTO `orders` VALUES ('3d98a475-a2ce-4fb7-97cd-3ca25b98c3f3', '11.00', '富江', '2017-09-12 11:39:11', '2', '');
INSERT INTO `orders` VALUES ('50202607-a442-4478-8ba2-4221e7fe9d3c', '16.00', '离笙', '2017-09-11 10:26:07', '2', '');
INSERT INTO `orders` VALUES ('533d8bcc-d537-423c-8496-f0512ac3664b', '6.00', '1812214177', '2017-09-10 22:43:37', '2', '');
INSERT INTO `orders` VALUES ('5426723c-052a-42ff-bb46-e1bc10d4e57d', '21.50', '18858471591', '2017-09-11 14:09:38', '2', '');
INSERT INTO `orders` VALUES ('5c578a03-fd8e-4d57-a573-e107363266bd', '18.00', '陈璐', '2017-09-11 14:48:55', '2', '西瓜半个 小一点的');
INSERT INTO `orders` VALUES ('609244a5-c265-4df2-b3f2-208215ae4114', '9.00', '倾图。', '2017-09-14 08:35:06', '1', '一斤冬枣');
INSERT INTO `orders` VALUES ('642eccdc-035d-4797-92fb-e2676ba2cb68', '10.50', '乌克丽丽', '2017-09-12 10:43:30', '2', '香蕉4根左右吧，橘子随便啦，要酸的');
INSERT INTO `orders` VALUES ('70114c2e-4225-4833-b167-70c5c5932572', '3.50', '43217', '2017-09-14 13:03:31', '1', '柿子一斤两根香蕉香蕉两根猕猴桃一斤香蕉一斤每行分开装，谢谢');
INSERT INTO `orders` VALUES ('74605ff6-7687-4cdf-8ace-acd37f31d3ac', '19.00', 'john751', '2017-09-12 17:31:51', '2', '39号楼404寝室 李秋明 香蕉要4个');
INSERT INTO `orders` VALUES ('74b414a1-42b8-4545-8b5a-85d698b05c78', '10.00', '万人迷', '2017-09-12 08:22:20', '2', '苹果5个 橘子5个');
INSERT INTO `orders` VALUES ('813f34e3-5fbc-4fc7-befd-b7cfd4e69999', '11.50', '阿孟', '2017-09-11 10:00:08', '2', '红提一斤左右，可以稍微多一点西瓜小半边三四节课有课');
INSERT INTO `orders` VALUES ('8f3cc377-39f8-46b5-b2c7-0424eb574369', '19.00', '胡歌的老婆', '2017-09-13 18:59:53', '1', '');
INSERT INTO `orders` VALUES ('9eb0785f-5293-408e-b336-6b1fa81740cf', '16.00', 'Elliott', '2017-09-13 14:30:58', '1', '苹果两到三个 梨要三四个');
INSERT INTO `orders` VALUES ('a165273a-6b09-4057-9486-4691503cf601', '29.00', '2016014708', '2017-09-11 19:40:07', '2', '');
INSERT INTO `orders` VALUES ('a1d273d1-1258-4310-aad4-c0537058ed90', '29.00', '2016014708', '2017-09-12 14:08:55', '2', '4个黑布李，最好3点前到，要上课');
INSERT INTO `orders` VALUES ('a6e3c178-7e0b-4ec0-ae7c-122111a8555c', '22.00', '43217', '2017-09-11 14:08:10', '2', '苹果分成3袋，差不多就行，贴上价格。');
INSERT INTO `orders` VALUES ('a993f823-2c3c-492a-8efa-5b4ff7febdb8', '5.50', '1120023921', '2017-09-11 10:02:25', '2', '');
INSERT INTO `orders` VALUES ('aba8dcd7-05eb-4e7f-ba91-b59d27f5269a', '1000000.00', 'ritian', '2017-09-11 21:38:00', '2', '');
INSERT INTO `orders` VALUES ('abd299ae-45c6-4e92-995a-653cb7e38bbf', '2.50', '71302', '2017-09-12 10:38:56', '2', '一个西瓜');
INSERT INTO `orders` VALUES ('acf46cb7-28fc-4c49-8806-cdc109b3d9f6', '29.50', '穿堂风', '2017-09-13 10:39:02', '1', '白柚1个');
INSERT INTO `orders` VALUES ('aebe8397-13d8-4a04-875b-f73eb9cc94ce', '18.00', 'ycm', '2017-09-12 08:10:42', '2', '苹果5个 橘子6个   梨2个');
INSERT INTO `orders` VALUES ('bceaf8db-3118-4e24-bc77-bef8b2e376bc', '8.00', '18858491193', '2017-09-12 08:01:48', '2', '西瓜半个');
INSERT INTO `orders` VALUES ('c96927af-731e-46d8-8e9c-b1bff99b3788', '18.00', '姜珊珊', '2017-09-12 10:01:04', '2', '');
INSERT INTO `orders` VALUES ('cd685e0f-7c22-4db0-a907-5efa08c11177', '0.28', '1120023921', '2017-09-10 22:13:01', '2', '栗子');
INSERT INTO `orders` VALUES ('cf734a2a-2cac-4e9f-bc47-b2ec2743f38d', '15.00', '2015014139', '2017-09-12 15:42:54', '2', '让有空就送，没空我去他寝室拿');
INSERT INTO `orders` VALUES ('d58950fb-c879-4892-88ea-65146220ec35', '28.00', '小燕子', '2017-09-12 13:37:46', '2', '');
INSERT INTO `orders` VALUES ('db28d282-9b9a-4d43-a19b-ed61db6fe5c6', '10.50', 'ritian', '2017-09-14 16:42:49', '0', '');
INSERT INTO `orders` VALUES ('dfa820bc-1138-41c1-9164-c1f77bedd748', '6.50', '林潇宇', '2017-09-12 12:21:05', '2', '需要下午5:00左右送到');
INSERT INTO `orders` VALUES ('e20de2f8-7f5c-47e6-ae65-2d70e928464a', '40.50', 'alisolt', '2017-09-13 10:11:22', '1', '苹果2个    红心火龙果1个（小一点）红提一串    白柚1个   猕猴桃2个');
INSERT INTO `orders` VALUES ('e650c1b7-37da-45b0-941c-89c958d18ac0', '4.50', 'hxr', '2017-09-10 23:47:25', '2', '');
INSERT INTO `orders` VALUES ('f28944b6-9c87-4a48-93a6-421799f9bb4c', '24.50', 'LINYANGHUI', '2017-09-13 13:27:09', '1', '');
INSERT INTO `orders` VALUES ('f4bf8cf2-de15-452d-9c56-f9e8be2f9f10', '19.50', '秦可嘉哇', '2017-09-12 10:03:35', '2', '');
INSERT INTO `orders` VALUES ('f64bb0d1-9ed8-4689-9a8d-edb1dd41ccc9', '12.00', '千与千寻', '2017-09-12 10:48:28', '2', '');
INSERT INTO `orders` VALUES ('f8873048-653d-46e5-b342-514544240fc0', '13.00', '784099892', '2017-09-12 10:07:55', '2', '苹果只要一个……特价香蕉6个，剩下的要橘子，也不知道够不够');
INSERT INTO `orders` VALUES ('f8b01bf6-fde6-425c-b618-34029ab2b63a', '15.00', '15657863715', '2017-09-12 08:05:31', '2', '梨4个柿子2个冬枣1斤');
INSERT INTO `orders` VALUES ('ff5bf462-9d4f-4daa-bd4e-77ff561aaa8a', '7.00', 'tyrant', '2017-09-12 10:37:43', '2', '');

-- ----------------------------
-- Table structure for t_s_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_s_resource`;
CREATE TABLE `t_s_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reid` varchar(45) NOT NULL COMMENT '资源名',
  `name` varchar(45) NOT NULL COMMENT '资源中文名',
  `type` varchar(1) NOT NULL COMMENT '类型',
  `enabled` varchar(1) DEFAULT NULL COMMENT '状态',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `update_date` date DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(45) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(45) DEFAULT NULL COMMENT '修改者',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `pid` int(11) DEFAULT NULL COMMENT '父资源ID',
  `value` varchar(45) DEFAULT NULL COMMENT '资源值',
  `leaf` varchar(1) DEFAULT NULL COMMENT '是否叶子节点',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reid_UNIQUE` (`reid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_resource
-- ----------------------------
INSERT INTO `t_s_resource` VALUES ('1', 'sytem', '系统管理', '0', 'Y', null, null, null, null, null, null, null, 'N');
INSERT INTO `t_s_resource` VALUES ('3', 'user', '用户管理', '0', 'Y', null, null, null, null, null, '1', 'user/render.do', null);
INSERT INTO `t_s_resource` VALUES ('4', 'role', '角色管理', '0', 'Y', null, null, null, null, null, '1', 'role/render.do', null);
INSERT INTO `t_s_resource` VALUES ('5', 'resource', '资源管理', '0', 'Y', null, null, null, null, null, '1', 'resource/render.do', null);
INSERT INTO `t_s_resource` VALUES ('6', '*', '通用权限', '1', 'Y', null, null, null, null, null, null, '*', null);
INSERT INTO `t_s_resource` VALUES ('15', 'monitor', '系统监控', '0', 'Y', null, null, null, null, null, '1', 'druid', null);
INSERT INTO `t_s_resource` VALUES ('99', 'account', '统计管理', '0', 'Y', null, null, null, null, null, '1', 'account/render.do', null);
INSERT INTO `t_s_resource` VALUES ('103', 'dictionary', '进士字典', '1', 'Y', null, null, null, null, null, '105', 'admin/jinShiAdmin.do', null);
INSERT INTO `t_s_resource` VALUES ('105', 'business', '美丽乡村', '0', 'Y', null, null, null, null, null, null, '', 'N');
INSERT INTO `t_s_resource` VALUES ('106', 'liuyan', '游客日记', '1', 'Y', null, null, null, null, null, '105', 'admin/tieZiAdmin.do', null);

-- ----------------------------
-- Table structure for t_s_role
-- ----------------------------
DROP TABLE IF EXISTS `t_s_role`;
CREATE TABLE `t_s_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roid` varchar(45) NOT NULL COMMENT '角色名',
  `name` varchar(45) NOT NULL COMMENT '角色中文名',
  `enabled` varchar(1) DEFAULT NULL COMMENT '状态',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `update_date` date DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(45) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(45) DEFAULT NULL COMMENT '修改者',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roid_Unique` (`roid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_role
-- ----------------------------
INSERT INTO `t_s_role` VALUES ('32', 'admin', '管理员', 'Y', null, null, null, null, null);
INSERT INTO `t_s_role` VALUES ('33', 'user', '普通用户', 'Y', null, null, null, null, null);

-- ----------------------------
-- Table structure for t_s_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_s_role_resource`;
CREATE TABLE `t_s_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ROLE_RESOURCE_ROLE_ID_idx` (`role_id`) USING BTREE,
  KEY `FK_ROLE_RESOURCE_RESOURCE_ID_idx` (`resource_id`) USING BTREE,
  CONSTRAINT `t_s_role_resource_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `t_s_resource` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_s_role_resource_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `t_s_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=796 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_role_resource
-- ----------------------------
INSERT INTO `t_s_role_resource` VALUES ('792', '32', '6');
INSERT INTO `t_s_role_resource` VALUES ('793', '33', '106');
INSERT INTO `t_s_role_resource` VALUES ('794', '33', '105');
INSERT INTO `t_s_role_resource` VALUES ('795', '33', '103');

-- ----------------------------
-- Table structure for t_s_user
-- ----------------------------
DROP TABLE IF EXISTS `t_s_user`;
CREATE TABLE `t_s_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) NOT NULL COMMENT '用户名',
  `name` varchar(45) NOT NULL COMMENT '中文名',
  `sex` varchar(1) DEFAULT NULL COMMENT '性别',
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(45) NOT NULL COMMENT '电话',
  `mail` varchar(45) DEFAULT NULL COMMENT '邮件',
  `enabled` varchar(1) DEFAULT NULL COMMENT '状态',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `update_date` date DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(45) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(45) DEFAULT NULL COMMENT '修改者',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `password` varchar(45) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_user
-- ----------------------------
INSERT INTO `t_s_user` VALUES ('1', 'admin', '管理员', null, null, '111', null, 'Y', null, null, null, null, '管理员', 'z3HnuEa5pSEP5zkUA62X9Q');
INSERT INTO `t_s_user` VALUES ('103', '1120023921', '胡', null, '39#315', '624609', null, 'Y', null, null, null, null, '普通用户', 'IKb5D+tYygYHXHl5jBxS0A');

-- ----------------------------
-- Table structure for t_s_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_s_user_role`;
CREATE TABLE `t_s_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_USER_ROLE_USER_ID_idx` (`user_id`) USING BTREE,
  KEY `FK_USER_ROLE_USER_ID_idx1` (`role_id`) USING BTREE,
  CONSTRAINT `t_s_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_s_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_user_role
-- ----------------------------
INSERT INTO `t_s_user_role` VALUES ('103', '1', '20');
INSERT INTO `t_s_user_role` VALUES ('104', '1', '2');
INSERT INTO `t_s_user_role` VALUES ('106', '1', '3');
INSERT INTO `t_s_user_role` VALUES ('120', '1', '32');
