-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 年 07 月 27 日 14:54
-- 服务器版本: 5.5.53
-- PHP 版本: 5.4.45

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `cbdc`
--

-- --------------------------------------------------------

--
-- 表的结构 `ncconfig`
--

CREATE TABLE IF NOT EXISTS `ncconfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置名称',
  `config_group` varchar(20) NOT NULL COMMENT '配置分组',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `value` text NOT NULL COMMENT '配置值',
  `info` varchar(255) NOT NULL COMMENT '描述',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_name` (`name`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `group` (`config_group`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=147 ;

--
-- 转存表中的数据 `ncconfig`
--

INSERT INTO `ncconfig` (`id`, `name`, `config_group`, `create_time`, `value`, `info`, `sort`) VALUES
(7, 'SMTP_HOST', 'smtp', 1448266020, 'smtp.ym.163.com', '', 0),
(8, 'SMTP_PORT', 'smtp', 1448266020, '25', '', 0),
(9, 'SMTP_USER', 'smtp', 1448266020, '', '', 0),
(10, 'SMTP_PASS', 'smtp', 1448266020, '', '', 0),
(11, 'FROM_EMAIL', 'smtp', 1448266020, '', '', 0),
(12, 'FROM_NAME', 'smtp', 1448266020, '', '', 0),
(13, 'SITE_TITLE', 'site', 1448285156, 'CBDC商城', '', 0),
(14, 'SITE_NAME', 'site', 1448285156, 'CBDC', '', 0),
(15, 'SITE_DESCRIPTION', 'site', 1448285156, '《CBDC商城》协议《CBDC商城》协议《CBDC商城》协议《Wepay商城》协议《CBDC商城》协议《cctoken商城》协议《cctoken商城》协议', '', 0),
(16, 'SITE_KEYWORDS', 'site', 1448285156, 'CBDC商城', '', 0),
(17, 'SITE_URL', 'site', 1448285156, '', '', 0),
(18, 'SHORT_URL', 'site', 1448285156, '', '', 0),
(19, 'SITE_ICP', 'site', 1448285156, '', 'ICP备案号', 0),
(20, 'EMAIL', 'site', 1448285156, '123456', '', 0),
(21, 'TELEPHONE', 'site', 1448285156, '', '', 0),
(22, 'WEB_SITE_CLOSE', 'site', 1448285156, '1', '', 0),
(23, 'common_image_thumb_width', 'image', 1448293183, '255', '', 0),
(24, 'common_image_thumb_height', 'image', 1448293183, '255', '', 0),
(25, 'gallery_thumb_width', 'image', 1448293183, '127', '', 0),
(26, 'gallery_thumb_height', 'image', 1448293183, '127', '', 0),
(27, 'gallery_related_thumb_width', 'image', 1448293183, '150', '', 0),
(28, 'gallery_related_thumb_height', 'image', 1448293183, '150', '', 0),
(29, 'blog_list_thumb_width', 'image', 1448293183, '280', '', 0),
(30, 'blog_list_thumb_height', 'image', 1448293183, '140', '', 0),
(31, 'goods_thumb_width', 'image', 1448293183, '360', '', 0),
(32, 'goods_thumb_height', 'image', 1448293183, '360', '', 0),
(33, 'goods_gallery_thumb_width', 'image', 1448293183, '75', '', 0),
(34, 'goods_gallery_thumb_height', 'image', 1448293183, '75', '', 0),
(35, 'goods_cart_thumb_width', 'image', 1448293183, '80', '', 0),
(36, 'goods_cart_thumb_height', 'image', 1448293183, '80', '', 0),
(39, 'length_clasisz_id', 'other', 1448588459, '2', '', 0),
(40, 'WEIGHT_ID', 'other', 1448588459, '1', '', 0),
(41, 'FRONT_PAGE_NUM', 'other', 1448588459, '8', '', 0),
(42, 'BACK_PAGE_NUM', 'other', 1448588459, '10', '', 0),
(43, 'default_order_status_id', 'other', 1448588459, '3', '', 0),
(44, 'paid_order_status_id', 'other', 1448588459, '1', '', 0),
(45, 'complete_order_status_id', 'other', 1448588459, '4', '', 0),
(47, 'URL_ID', 'other', 1448588459, '10', '', 0),
(48, 'SITE_SLOGAN', 'site', 1448285156, '', '', 0),
(51, 'cancel_order_status_id', 'other', 0, '5', '', 0),
(52, 'BLOG_TITLE', 'other', 0, '博客', '', 0),
(53, 'SITE_ICON', 'site', 0, 'product/57a654b160dd9.png', '网站图标', 0),
(54, 'goods_related_thumb_width', 'image', 0, '280', '', 0),
(55, 'goods_related_thumb_height', 'image', 0, '280', '', 0),
(59, 'PWD_KEY', 'site', 1470304751, '.O&4893h99s-pXf~F9(H4xZ@8NqsP#A3r', '', 0),
(60, 'ewm', 'site', 0, '/ewm.jpg', '', 0),
(61, 'gg', 'site', 0, '', '公告', 0),
(72, 'payid', 'site', 0, 'd4m7xoorsaomtjw3shpzu2tq', '商户ID', 0),
(73, 'paymi', 'site', 0, 't2iiufvwcky4nvn5tsek4janfmmvmt4x', '商户密钥', 0),
(74, 'KM_KEY', 'site', 0, '', '', 0),
(110, 'phone', 'site', 0, '88888888888888', '电话', 0),
(113, 'chandan_time', 'site', 0, '8', '', 0),
(115, 'add_hy', 'site', 0, '30', '', 0),
(116, 'default_tx', 'site', 0, 'shop/597314adc65d4.jpg', '', 0),
(117, 'kefu', 'site', 0, 'product/59812e9c2b24b.png', '', 0),
(118, 'shuoming', 'site', 0, '&lt;h3&gt;奖励说明：&lt;/h3&gt;\r\n\r\n&lt;p&gt;直推10人，团队业绩150万，奖励每天团队新增业绩0.5%.&lt;/p&gt;\r\n\r\n&lt;p&gt;直推15人，团队业绩350万，奖励每天团队新增业绩1%.&lt;/p&gt;\r\n\r\n&lt;p&gt;直推20人，团队业绩800万，奖励每天团队新增业绩1.5%&lt;/p&gt;\r\n', '', 0),
(119, 'sxf', 'site', 0, '0.1', '手续费', 0),
(124, 'btd', 'site', 0, '2', '每次被偷蛋数', 0),
(125, 'ydd', 'site', 0, '2', '被狗咬掉蛋', 0),
(126, 'sd_one', 'site', 0, '0.1', '收蛋一代10%', 0),
(127, 'sd_two', 'site', 0, '0.03', '收蛋二代3%', 0),
(128, 'sd_three', 'site', 0, '0.02', '收蛋三代2%', 0),
(129, 'mai_one', 'site', 0, '0.1', '买动物一代10%', 0),
(130, 'mai_two', 'site', 0, '0.03', '买动物二代3%', 0),
(131, 'mai_three', 'site', 0, '0.02', '买动物三代2%', 0),
(132, 'qq', 'site', 0, '123456', '', 0),
(133, 'm_sms_id', 'site', 0, 'yakrNoOUFiat3qTJRu5F9We9rXAVgz', 'accessKeyId', 0),
(134, 'm_sms_user', 'site', 0, 'LTAIeVSBAFgHdKuK', 'accessKeySecret', 0),
(135, 'm_sms_pwd', 'site', 0, 'SMS_78790147', 'SMS_77505064', 0),
(136, 'm_sms_name', 'site', 0, '全民养殖', 'name', 0),
(137, 'tui_one', 'site', 0, '0.005', '直推20人,150万', 0),
(138, 'tui_two', 'site', 0, '0.01', '直推15人,350万', 0),
(139, 'tui_three', 'site', 0, '0.015', '直推20人,800万', 0),
(140, 'tui_one_rmb', 'site', 0, '1500000', '直推20人,150万', 0),
(141, 'tui_two_rmb', 'site', 0, '3500000', '直推15人,350万', 0),
(142, 'tui_three_rmb', 'site', 0, '8000000', '直推20人,800万', 0),
(144, 'MSG_password', 'site', 0, '89140', '短信接口密码', 0),
(145, 'MSG_account', 'site', 0, '350a3dfd5cad9b6d93fc4a7c4c69530f', '短信接口', 0),
(146, 'MSG', 'site', 0, '&quot;你的验证码是&quot;.$code.&quot;，如非本人操作，请忽略本短信&quot;', '短信模板', 0);

-- --------------------------------------------------------

--
-- 表的结构 `nc_admin`
--

CREATE TABLE IF NOT EXISTS `nc_admin` (
  `a_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `a_uname` varchar(20) NOT NULL COMMENT '用户名',
  `a_true_name` varchar(20) NOT NULL COMMENT '真名',
  `a_telephone` varchar(40) NOT NULL,
  `a_email` varchar(64) NOT NULL,
  `a_passwd` varchar(255) NOT NULL,
  `a_login_count` mediumint(8) NOT NULL COMMENT '登录次数',
  `a_last_login_ip` varchar(40) NOT NULL COMMENT '最后登录ip',
  `a_last_ip_region` varchar(40) NOT NULL,
  `a_create_time` int(11) NOT NULL COMMENT '创建时间',
  `a_last_login_time` int(11) NOT NULL COMMENT '最后登录',
  `a_status` tinyint(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台管理员' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `nc_admin`
--

INSERT INTO `nc_admin` (`a_id`, `a_uname`, `a_true_name`, `a_telephone`, `a_email`, `a_passwd`, `a_login_count`, `a_last_login_ip`, `a_last_ip_region`, `a_create_time`, `a_last_login_time`, `a_status`) VALUES
(1, 'admin', '蒋翔', '13266864166', 'admin@admin.com', 'MDAwMDAwMDAwMH+Ket20dYll', 1088, '127.0.0.1', '', 1470304751, 1532674416, 1),
(2, 'ceshi', 'jiangxiang', '13266864166', '12113213', 'MDAwMDAwMDAwMHh4qdTHiHqov5Wbpo29ZqWwdMWrsHd6mA', 11, '11', '1', 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `nc_menu`
--

CREATE TABLE IF NOT EXISTS `nc_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `url` char(255) DEFAULT NULL COMMENT '链接地址',
  `icon` varchar(20) DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台菜单' AUTO_INCREMENT=142 ;

--
-- 转存表中的数据 `nc_menu`
--

INSERT INTO `nc_menu` (`id`, `pid`, `title`, `url`, `icon`, `sort_order`) VALUES
(1, 0, '系统信息', '', 'icon-book', 7),
(29, 28, '商品管理', 'Goods/index', '', 2),
(36, 35, '订单管理', 'Order/index', '', 1),
(38, 37, '基本信息', 'settings/general', '', 1),
(40, 37, '邮件配置', 'settings/smtp_mail', '', 3),
(43, 0, '用户', '', 'icon-user-md', 0),
(46, 37, '配置管理', 'Config/index', '', 5),
(47, 43, '后台用户', 'AdminUser/index', '', 3),
(51, 1, '基本信息', 'settings/general', '', 1),
(54, 53, '文章分类', 'BlogCategory/index', '', 0),
(55, 53, '文章列表', 'Blog/index', '', 3),
(56, 28, '商品分类', 'GoodsCategory/index', '', 1),
(66, 65, '充值管理', 'member/chongzhi', NULL, 2),
(68, 65, '资金充值', 'Member/rmb', NULL, 1),
(69, 65, '资金记录', 'Member/zijing', NULL, 5),
(75, 74, '投诉列表', '/Form/bdlist/bd_id/8', NULL, 0),
(83, 82, '投诉列表', 'Form/bdlist/bd_id/8', NULL, 0),
(85, 84, '分润记录', 'Record/fenrun', NULL, 1),
(88, 84, '赠送记录', 'Record/transaction', NULL, 4),
(140, 107, '总后台店铺', 'Goods/dianpu', NULL, 1),
(93, 84, '交易记录', 'Record/sell', NULL, 3),
(94, 84, '团队分红', 'Record/tuandui', NULL, 0),
(97, 96, '商品管理', 'Goods/index', NULL, 0),
(99, 96, '商城订单', 'Goods/shoporder', NULL, 0),
(102, 101, '道具管理', 'Gpgoods/index', '', 0),
(106, 0, '订单', '', 'icon-book', 3),
(107, 0, '商城', '', 'icon-gift', 2),
(108, 106, '订单管理', 'Order/index', NULL, 0),
(109, 107, '商品管理', 'Goods/index', NULL, 5),
(115, 110, '其他配置', 'Gameconfigs/Othersconfig', NULL, 16),
(116, 0, '提现管理', '', 'icon-book', 5),
(117, 116, '提现订单', 'Tixian/tixian', NULL, 0),
(118, 116, '转账订单', 'Tixian/Transfers', NULL, 0),
(119, 1, '公告', 'settings/notice', NULL, 3),
(121, 107, '分类管理', 'Goods/cate', NULL, 3),
(123, 122, '普通会员三级', 'Gameconfigs/sanjione', NULL, 20),
(124, 122, '中级会员三级', 'Gameconfigs/sanjitwo', NULL, 21),
(125, 122, '高级会员三级', 'Gameconfigs/sanjithree', NULL, 22),
(126, 122, '三级达成条件', 'Gameconfigs/sanjiconditions', NULL, 18),
(131, 90, '充值E余额记录', 'Member/chongzhibiao', 'icon-dashboard', 55),
(132, 90, '出售E余额记录', 'Member/chushoubiao', 'icon-dashboard', 44),
(133, 1, '文章列表', 'settings/wenzhang', 'icon-dashboard', 33),
(134, 1, '文章类型', 'settings/wentype', 'icon-dashboard', 32),
(135, 0, '商家入驻', NULL, 'icon-gift', 3),
(136, 135, '个人店铺', 'Goods/ggshop', 'icon-dashboard', 0),
(137, 135, '认证列表', 'Goods/verify', 'icon-dashboard', 2),
(139, 138, '升级列表', 'Goods/level', 'icon-dashboard', 10),
(141, 1, '短信设置', 'settings/msgs', 'icon-dashboard', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_activate_num`
--

CREATE TABLE IF NOT EXISTS `ysk_activate_num` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '激活码',
  `activate_num` varchar(20) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL DEFAULT '',
  `mobile` varchar(20) DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-未使用 1已只用',
  `create_time` int(11) NOT NULL,
  `user_time` int(11) NOT NULL DEFAULT '0' COMMENT '使用时间',
  `user_ip` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `activate_num` (`activate_num`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_address`
--

CREATE TABLE IF NOT EXISTS `ysk_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` text NOT NULL,
  `name` varchar(20) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL DEFAULT '地址',
  `city_id` varchar(200) NOT NULL DEFAULT '市',
  `country_id` varchar(200) NOT NULL DEFAULT '县乡',
  `province_id` varchar(200) NOT NULL DEFAULT '省',
  `zt_` int(11) NOT NULL,
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=58 ;

--
-- 转存表中的数据 `ysk_address`
--

INSERT INTO `ysk_address` (`address_id`, `member_id`, `name`, `telephone`, `address`, `city_id`, `country_id`, `province_id`, `zt_`) VALUES
(9, '1688', '李生', '13713882780', '楼村新村17巷7号', '深圳市', '光明新区', '广东', 1),
(10, '1697', '郭', '15989408882', '布吉启迪科技', '深圳市', '龙岗区', '广东', 1),
(11, '1736', '刘文焕', '17620420588', '深圳', '广州市', '越秀区', '广东', 1),
(12, '1746', '杨永恒', '15343827588', '人民路22号', '广州市', '越秀区', '广东', 0),
(18, '2084', '李智明', '15672204998', '金石镇大兴路512号', '邵阳市', '新宁县', '湖南', 0),
(19, '2096', '倪小华', '15873945803', '金石镇解放街9号', '邵阳市', '新宁县', '湖南', 0),
(20, '1878', 'aa', '15575566666', '某某某木木木木木', '泸州市', '泸　县', '四川', 0),
(21, '1878', '解决', '15573256276', '啊啊啊啊啊啊', '广州市', '天河区', '广东', 1),
(22, '2080', '啊啊', '15732562764', '啊啊', '广州市', '海珠区', '广东', 1),
(23, '1745', 'retr', '15124853648', '布沙路玉玲花园a1栋1245', '深圳市', '龙岗区', '广东', 0),
(27, '1710', '环境规划', '15170788826', '大幅度发给', '县', '蓟　县', '天津', 1),
(28, '1870', '阮先生', '18975978788', '城东南工业园高速公路桥底顺风洗车', '邵阳市', '隆回县', '湖南', 0),
(29, '1870', '阮先生', '18975978788', '城东南工业园高速公路桥底顺风洗车', '邵阳市', '隆回县', '湖南', 0),
(30, '1870', '阮先生', '18975978788', '城东南工业园高速公路桥底顺风洗车', '邵阳市', '隆回县', '湖南', 0),
(31, '1870', '阮先生', '18975978788', '城东南工业园高速公路桥底顺风洗车', '邵阳市', '隆回县', '湖南', 0),
(32, '1870', '阮先生', '18975978788', '城东南工业园高速公路桥底顺风洗车', '邵阳市', '隆回县', '湖南', 0),
(33, '1870', '阮先生', '18975978788', '城东南工业园高速公路桥底顺风洗车', '邵阳市', '隆回县', '湖南', 0),
(34, '1870', '阮先生', '18975978788', '城东南工业园高速公路桥底顺风洗车', '邵阳市', '隆回县', '湖南', 0),
(35, '1870', '阮先生', '18975978788', '城东南工业园高速公路桥底顺风洗车', '邵阳市', '隆回县', '湖南', 0),
(36, '1870', '阮先生', '18975978788', '城东南工业园高速公路桥底顺风洗车', '邵阳市', '隆回县', '湖南', 1),
(37, '1821', '卢小龙', '13713963037', '吧呃呃呃额额', '深圳市', '龙岗区', '广东', 1),
(38, '1689', '李生', '13713882780', '楼村', '深圳市', '光明新区', '广东', 0),
(39, '1689', '李', '13713882780', '新村', '深圳市', '光明新区', '广东', 1),
(40, '3053', 'dfg', '15170788826', 'dfg ', '市辖区', '河北区', '天津', 1),
(41, '1715', '风格化', '15170788826', '对方回合', '安顺市', '平坝县', '贵州', 1),
(42, '4184', '刘芳华', '13517375551', '橡胶厂小区', '益阳市', '南　县', '湖南', 1),
(43, '5892', '周鸿逦', '18173121063', '东二环一段1055号', '长沙市', '芙蓉区', '湖南', 1),
(44, '5497', '尚君展', '13810284400', '绿地老街三期19号楼1单元402', '郑州市', '金水区', '河南', 1),
(45, '5533', '张三', '13123456762', '你们都是这样的', '广州市', '荔湾区', '广东', 1),
(46, '5912', '周元新', '18008465847', '荷花园街道万家丽中路一段42号湘运新村7-4-514', '长沙市', '芙蓉区', '湖南', 1),
(47, '8536', '王成明', '13500000000', '辉煌家园', '淮安市', '淮阴区', '江苏', 1),
(48, '4125', '朱', '13478987503', '我是来测试的', '郑州市', '金水区', '河南', 1),
(49, '4124', '111111', '13007516318', '111111', '市辖区', '西城区', '北京', 1),
(50, '8546', '刘广志', '13088888696', 'hhjj？？？？？？？？？', '广州市', '海珠区', '广东', 1),
(51, '8550', '张飞', '15698530661', '槐东花园南门新兴巷13号', '运城市', '盐湖区', '山西', 1),
(52, '8547', '666', '13011111156', '？？？？？？，，，，，，1111', '广州市', '荔湾区', '广东', 1),
(53, '8553', '张杰', '17791517166', '虹口足球场商务大厦', '市辖区', '卢湾区', '上海', 1),
(54, '8552', '213', '13243253232', '1321', '县', '密云县', '北京', 1),
(55, '8545', '小猪', '13478987503', '我是来测试的', '市辖区', '长宁区', '上海', 1),
(56, '8555', '才华', '13478954569', '郑州', '广州市', '荔湾区', '广东', 1),
(57, '8570', '546456', '13145847891', '上课电话卡很少看到', '广州市', '越秀区', '广东', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_admin`
--

CREATE TABLE IF NOT EXISTS `ysk_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UID',
  `auth_id` int(11) NOT NULL DEFAULT '1' COMMENT '角色ID',
  `nickname` varchar(63) DEFAULT NULL COMMENT '昵称',
  `username` varchar(31) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(63) NOT NULL DEFAULT '' COMMENT '密码',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  `reg_type` varchar(20) DEFAULT NULL COMMENT '注册人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账号表' AUTO_INCREMENT=116 ;

--
-- 转存表中的数据 `ysk_admin`
--

INSERT INTO `ysk_admin` (`id`, `auth_id`, `nickname`, `username`, `password`, `mobile`, `reg_ip`, `create_time`, `update_time`, `status`, `reg_type`) VALUES
(1, 1, '超级管理员', 'adminzyf', '5ca76c10a98835e632f7333de67c30bd', '13266864166', 0, 1438651748, 1532249568, 1, ''),
(5, 1, '超级管理1', 'admin', '8f3bd6b4d00391c9d09cc14e32fee28c', '', 1902173178, 1526153248, 1530002569, 1, ''),
(112, 10, 'test', 'test', '611fd61468729d297328a05cb48f9a86', '', 3549796621, 1529228005, 1529661445, 0, NULL),
(115, 1, 'ceshi', 'ceshi', '8f3bd6b4d00391c9d09cc14e32fee28c', '', 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_admin_kucun`
--

CREATE TABLE IF NOT EXISTS `ysk_admin_kucun` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '平台仓库',
  `total_num` decimal(15,2) NOT NULL COMMENT '累计添加总数',
  `less_num` decimal(15,2) NOT NULL COMMENT '库存余量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_admin_zhuangz`
--

CREATE TABLE IF NOT EXISTS `ysk_admin_zhuangz` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员给用户拨发果子明细表id',
  `manage_id` int(11) NOT NULL COMMENT '管理员id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `guozi_num` decimal(15,0) NOT NULL COMMENT '转给用户的果子数量',
  `create_time` int(11) NOT NULL COMMENT '转果子时间',
  `ip` varchar(20) NOT NULL COMMENT '转果子时使用的电脑ip',
  `before_cangku_num` decimal(11,0) NOT NULL DEFAULT '0',
  `after_cangku_num` decimal(11,0) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1-加 2-减',
  `content` varchar(255) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `account` varchar(20) NOT NULL,
  `manage_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=52 ;

--
-- 转存表中的数据 `ysk_admin_zhuangz`
--

INSERT INTO `ysk_admin_zhuangz` (`id`, `manage_id`, `uid`, `guozi_num`, `create_time`, `ip`, `before_cangku_num`, `after_cangku_num`, `type`, `content`, `username`, `account`, `manage_name`) VALUES
(51, 1, 1718, '2', 1523534817, '121.33.33.195', '0', '2', 1, '转给用户', '肥肥鱼', '13316098335', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `ysk_baner`
--

CREATE TABLE IF NOT EXISTS `ysk_baner` (
  `baner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `baner_px` int(11) DEFAULT '0' COMMENT '排序序号',
  `baner_url` varchar(250) NOT NULL COMMENT '图片路径',
  `baner_name` varchar(250) DEFAULT NULL COMMENT '点击链接',
  `baner_type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`baner_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `ysk_baner`
--

INSERT INTO `ysk_baner` (`baner_id`, `baner_px`, `baner_url`, `baner_name`, `baner_type`) VALUES
(5, 1, '2017-08-25/599ffda5edb9c.jpg', '###', 0),
(8, 19, '2017-08-25/599ffd8c46b57.jpg', '###', 0),
(9, 3, '2017-08-25/599ffd9920d0b.jpg', '###', 0),
(10, 0, '2017-08-25/599ffdc415550.jpg', '###', 1),
(11, 0, '2017-08-25/599ffdd60ab76.jpg', '###', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_bank_name`
--

CREATE TABLE IF NOT EXISTS `ysk_bank_name` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` int(11) NOT NULL COMMENT '外键',
  `banq_genre` varchar(20) NOT NULL COMMENT '银行类型',
  `banq_img` varchar(150) NOT NULL COMMENT '银行卡类型图片',
  PRIMARY KEY (`q_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='银行卡类型表' AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `ysk_bank_name`
--

INSERT INTO `ysk_bank_name` (`q_id`, `pid`, `banq_genre`, `banq_img`) VALUES
(1, 1, '广州市农村信用合作社', 'ncxys.png'),
(2, 2, '中国农业银行', 'zgnyyh.png'),
(3, 3, '中国工商银行', 'zggsyh.png'),
(4, 4, '中国招商银行', 'zsyh.png'),
(5, 5, '中国邮政储蓄银行', 'zgyz.png'),
(6, 6, '中国建设银行', 'zgjsyh.png'),
(7, 7, '中国银行', 'zgyh.png'),
(8, 8, '交通银行', 'jtyh.png'),
(9, 9, '广州市商业银行', 'fjxyyh.png'),
(10, 10, '中国民生银行', 'zgmsyh.png'),
(11, 11, '深圳发展银行', 'szfzyh.png'),
(12, 12, '上海浦东发展银行', 'shpdfzyh.png'),
(13, 13, '华夏银行', 'hxyh.png'),
(14, 14, '兴业银行', 'fjxyyh.png'),
(15, 15, '广东发展银行', 'fjxyyh.png'),
(16, 16, '中国光大银行', 'gdyh.jpg'),
(17, 17, '支付宝', 'zfb.png');

-- --------------------------------------------------------

--
-- 表的结构 `ysk_bofamx`
--

CREATE TABLE IF NOT EXISTS `ysk_bofamx` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '拨发果子到平台表的id',
  `manage_id` int(11) NOT NULL COMMENT '管理员id',
  `bofa_num` decimal(15,2) NOT NULL COMMENT '拨发的果子数量',
  `create_time` int(11) NOT NULL COMMENT '拨发时间',
  `note` tinytext NOT NULL COMMENT '备注',
  `manage_name` varchar(20) NOT NULL COMMENT '管理员账号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ysk_bofamx`
--

INSERT INTO `ysk_bofamx` (`id`, `manage_id`, `bofa_num`, `create_time`, `note`, `manage_name`) VALUES
(1, 1, '50000.00', 1506487943, '', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `ysk_caimi`
--

CREATE TABLE IF NOT EXISTS `ysk_caimi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '每天从好有那采矿记录   ',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'uid=用户ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '采矿时间',
  `num` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '采矿数量',
  `fid` int(11) NOT NULL DEFAULT '0',
  `f_username` varchar(20) NOT NULL,
  `f_account` varchar(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=523 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_childcoop_configs`
--

CREATE TABLE IF NOT EXISTS `ysk_childcoop_configs` (
  `id` int(11) NOT NULL,
  `jiwo_ord` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '普通鸡窝开窝消耗P积分',
  `jiwo_senior` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '高级鸡窝开窝消耗P积分',
  `jiwo_ord_highst` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '普通鸡窝最高收益值',
  `jiwo_senior_highst` decimal(11,2) NOT NULL COMMENT '高级鸡窝最大收益',
  `guoyuan_ord` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '普通地开启消耗',
  `guoyuan_senior` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '果园中级地开启消耗果园P积分',
  `guoyuan_henior` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '果园地高级开启消耗P积分',
  `guoyuan_higest` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '果园普通地达到最高收益值',
  `yuchang_ord` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '普通渔场开池消耗P积分',
  `yucahng_senior` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '高级渔场开池消耗P积分',
  `yuchang_higest` int(1) NOT NULL DEFAULT '4' COMMENT '渔场最高收益（倍数）',
  `fengce_add` float(5,4) NOT NULL DEFAULT '0.0000' COMMENT '风车增益率',
  `guanjia_add` float(5,4) NOT NULL DEFAULT '0.0000' COMMENT '管家增益率',
  `dengji_add` float(8,4) NOT NULL DEFAULT '0.0001' COMMENT '等级增益率',
  `zhuanjia_add` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '专家增益率',
  `chai_fen_min` float(8,3) NOT NULL DEFAULT '0.005' COMMENT '最小拆分率',
  `chai_fen_max` float(8,3) NOT NULL DEFAULT '0.250' COMMENT '最大拆分率',
  `chaifenmin_yu` float(8,3) NOT NULL DEFAULT '0.000' COMMENT '渔场最低拆分率',
  `chaifenmax_yu` float(8,3) NOT NULL DEFAULT '0.000' COMMENT '渔场最高拆分率',
  `jifen_cost` float(5,2) NOT NULL DEFAULT '0.00' COMMENT 'P积分服务费',
  `jifen_transmutation` float(5,2) NOT NULL DEFAULT '0.00' COMMENT 'P积分转化为消费的比例',
  `fengche_enddays` int(10) NOT NULL DEFAULT '0' COMMENT '风车有效期',
  `jiaoyi_cost` float(5,3) NOT NULL DEFAULT '0.000' COMMENT '交易手续费',
  `housekeeper` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '达到对应收益送专家',
  `expert` int(10) NOT NULL COMMENT '达到推荐人数送管家',
  `zhituijiang` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '第一次建窝给上级奖励',
  `yuchang_earns_max` tinyint(1) NOT NULL DEFAULT '3' COMMENT '渔场可拿最高收益',
  `add_tixian` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1->增养,2->提现',
  `nianhua_shouyi` float(8,2) NOT NULL DEFAULT '3.00' COMMENT '果园年化收益',
  `guoyuan_jiaoshui` float(8,4) NOT NULL DEFAULT '0.0050' COMMENT '果园浇水释放率',
  `gongtongdi_sifang` float(8,4) NOT NULL DEFAULT '0.0000' COMMENT '共同果园浇水释放率',
  `yuchang_guanjia_add` float(8,4) NOT NULL DEFAULT '0.0000' COMMENT '管家增益率',
  `yuchang_ord_max` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '普通渔场最高投资值',
  `yuchang_higst_max` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '高级渔场最高投资值',
  `tixian_beishu` int(10) NOT NULL DEFAULT '20' COMMENT '提现倍数',
  `tixian_start` int(10) NOT NULL DEFAULT '0' COMMENT '起提数量',
  `tixian_shouxu_yj` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '佣金/代理佣金/农联P积分提现扣除手续费',
  `tixian_xiaofei_yj` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '佣金/代理佣金/农联P积分提现拆分消费P积分',
  `ji_tixian_shouxu` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '鸡场提现手续费',
  `guo_tixian_shouxu` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '果园提现手续费',
  `yu_tixian_shouxu` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '渔场提现手续费',
  `ji_tixian_xiaofe` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '鸡场提现消费',
  `guo_tixian_xiaofe` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '果园提现消费',
  `yu_tixian_xiaofe` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '渔场提现消费',
  `putong_member` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '普通会员达成条件',
  `senior_member` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '中级会员达成条件',
  `higst_member` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '高级会员达成条件',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ysk_childcoop_configs`
--

INSERT INTO `ysk_childcoop_configs` (`id`, `jiwo_ord`, `jiwo_senior`, `jiwo_ord_highst`, `jiwo_senior_highst`, `guoyuan_ord`, `guoyuan_senior`, `guoyuan_henior`, `guoyuan_higest`, `yuchang_ord`, `yucahng_senior`, `yuchang_higest`, `fengce_add`, `guanjia_add`, `dengji_add`, `zhuanjia_add`, `chai_fen_min`, `chai_fen_max`, `chaifenmin_yu`, `chaifenmax_yu`, `jifen_cost`, `jifen_transmutation`, `fengche_enddays`, `jiaoyi_cost`, `housekeeper`, `expert`, `zhituijiang`, `yuchang_earns_max`, `add_tixian`, `nianhua_shouyi`, `guoyuan_jiaoshui`, `gongtongdi_sifang`, `yuchang_guanjia_add`, `yuchang_ord_max`, `yuchang_higst_max`, `tixian_beishu`, `tixian_start`, `tixian_shouxu_yj`, `tixian_xiaofei_yj`, `ji_tixian_shouxu`, `guo_tixian_shouxu`, `yu_tixian_shouxu`, `ji_tixian_xiaofe`, `guo_tixian_xiaofe`, `yu_tixian_xiaofe`, `putong_member`, `senior_member`, `higst_member`) VALUES
(1, '360.00', '3600.00', '1440.00', '14440.00', '400.00', '800.00', '1200.00', '1600.00', '399.000', '800.000', 6, 0.0500, 0.0001, 0.0000, 0.00, 0.000, 0.010, 0.001, 0.150, 0.10, 0.25, 60, 0.100, '0.00', 80, '40.00', 3, 1, 3.00, 0.0050, 0.0002, 0.0100, '48000.000', '96000.000', 154, 154, 0.00, 0.00, 0.10, 0.10, 0.10, 0.25, 0.25, 0.00, '0.00', '50000.00', '100000.00');

-- --------------------------------------------------------

--
-- 表的结构 `ysk_chongzhi`
--

CREATE TABLE IF NOT EXISTS `ysk_chongzhi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '昵称',
  `phone` varchar(22) NOT NULL COMMENT '手机号',
  `username` varchar(255) NOT NULL COMMENT '帐号',
  `addtime` varchar(222) NOT NULL COMMENT '提交时间',
  `img` varchar(255) DEFAULT NULL COMMENT '二维码',
  `money` int(233) NOT NULL COMMENT '充值金钱',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态：0未审核，1通过，2拒绝',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_chushou`
--

CREATE TABLE IF NOT EXISTS `ysk_chushou` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `addtime` varchar(222) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `some` varchar(255) NOT NULL COMMENT '价值',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态：0未审核，1通过，2拒绝',
  `jiawei` varchar(255) NOT NULL COMMENT '出售价位',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_coindets`
--

CREATE TABLE IF NOT EXISTS `ysk_coindets` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '币价格表',
  `cid` int(10) NOT NULL COMMENT '币价格表',
  `coin_name` char(40) NOT NULL COMMENT '币名称',
  `coin_price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '币价格',
  `coin_addtime` char(40) NOT NULL COMMENT '币添加时间',
  `max` float(10,4) DEFAULT NULL,
  `min` float(10,4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=20904 ;

--
-- 转存表中的数据 `ysk_coindets`
--

INSERT INTO `ysk_coindets` (`id`, `cid`, `coin_name`, `coin_price`, `coin_addtime`, `max`, `min`) VALUES
(20881, 2, '比特币', '41746.4784', '1531453117', 45921.1250, 37571.8320),
(20882, 3, '莱特币', '516.2832', '1531453117', 567.9115, 464.6549),
(20883, 4, '以太坊', '2916.8802', '1531453117', 3208.5681, 2625.1921),
(20884, 5, '狗狗币', '0.0152', '1531453117', 0.0167, 0.0137),
(20885, 1, 'CBDC', '0.0000', '1531453120', 0.0000, 0.0000),
(20886, 2, '比特币', '41634.1242', '1531453120', 45797.5352, 37470.7109),
(20887, 3, '莱特币', '516.2832', '1531453120', 567.9115, 464.6549),
(20888, 4, '以太坊', '2913.6834', '1531453120', 3205.0518, 2622.3152),
(20889, 5, '狗狗币', '0.0152', '1531453120', 0.0167, 0.0137),
(20890, 2, '比特币', '41511.7800', '1531550864', 45662.9570, 37360.6016),
(20891, 3, '莱特币', '506.1600', '1531550864', 556.7760, 455.5440),
(20892, 4, '以太坊', '2885.1786', '1531550864', 3173.6965, 2596.6606),
(20893, 5, '狗狗币', '0.0152', '1531550864', 0.0167, 0.0137),
(20894, 1, 'CBDC', '0.0000', '1531550994', 0.0000, 0.0000),
(20895, 2, '比特币', '41291.1135', '1531550994', 45420.2266, 37162.0039),
(20896, 3, '莱特币', '506.6635', '1531550994', 557.3298, 455.9971),
(20897, 4, '以太坊', '2880.8465', '1531550994', 3168.9312, 2592.7617),
(20898, 5, '狗狗币', '0.0152', '1531550994', 0.0167, 0.0137),
(20899, 1, 'CBDC', '0.0000', '1531559076', 0.0000, 0.0000),
(20900, 2, '比特币', '41290.5150', '1531559076', 45419.5664, 37161.4648),
(20901, 3, '莱特币', '507.4615', '1531559076', 558.2076, 456.7154),
(20902, 4, '以太坊', '2871.9355', '1531559076', 3159.1292, 2584.7419),
(20903, 5, '狗狗币', '0.0153', '1531559076', 0.0168, 0.0138);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_coindets_copy`
--

CREATE TABLE IF NOT EXISTS `ysk_coindets_copy` (
  `cid` int(10) NOT NULL AUTO_INCREMENT COMMENT '币价格表',
  `coin_name` char(40) NOT NULL COMMENT '币名称',
  `coin_price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '币价格',
  `coin_addtime` char(40) NOT NULL COMMENT '币添加时间',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ysk_coindets_copy`
--

INSERT INTO `ysk_coindets_copy` (`cid`, `coin_name`, `coin_price`, `coin_addtime`) VALUES
(1, 'cctoken资产', '1.1857', '1522825163'),
(2, '比特币', '42604.9263', '1522825163'),
(3, '莱特币', '709.1594', '1522825163'),
(4, '以太坊', '2390.0137', '1522825163'),
(5, '狗狗币', '0.0175', '1522825163');

-- --------------------------------------------------------

--
-- 表的结构 `ysk_collect`
--

CREATE TABLE IF NOT EXISTS `ysk_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `type` int(1) DEFAULT NULL COMMENT '收藏类型',
  `proid` int(11) NOT NULL COMMENT 'ID',
  `time` int(11) NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_config`
--

CREATE TABLE IF NOT EXISTS `ysk_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '配置标题',
  `name` varchar(32) DEFAULT NULL COMMENT '配置名称',
  `value` text NOT NULL COMMENT '配置值',
  `group` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `type` varchar(16) NOT NULL DEFAULT '' COMMENT '配置类型',
  `options` varchar(255) NOT NULL DEFAULT '' COMMENT '配置额外值',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统配置表' AUTO_INCREMENT=65 ;

--
-- 转存表中的数据 `ysk_config`
--

INSERT INTO `ysk_config` (`id`, `title`, `name`, `value`, `group`, `type`, `options`, `tip`, `create_time`, `update_time`, `sort`, `status`) VALUES
(1, '站点开关', 'TOGGLE_WEB_SITE', '1', 3, '0', '0:关闭\r\n1:开启', '', 1378898976, 1406992386, 1, 1),
(2, '网站标题', 'WEB_SITE_TITLE', '', 1, '0', '', '网站标题前台显示标题', 1378898976, 1379235274, 2, 1),
(3, '网站LOGO', 'WEB_SITE_LOGO', '', 1, '0', '', '网站LOGO', 1407003397, 1407004692, 3, 1),
(4, '网站描述', 'WEB_SITE_DESCRIPTION', '', 1, '0', '', '网站搜索引擎描述', 1378898976, 1379235841, 4, 1),
(5, '网站关键字', 'WEB_SITE_KEYWORD', '', 1, '0', '', '网站搜索引擎关键字', 1378898976, 1381390100, 5, 1),
(6, '版权信息', 'WEB_SITE_COPYRIGHT', '', 1, '0', '', '设置在网站底部显示的版权信息，如“版权所有 © 2014-2015 科斯克网络科技”', 1406991855, 1406992583, 6, 1),
(7, '网站备案号', 'WEB_SITE_ICP', '', 1, '0', '', '设置在网站底部显示的备案号，如“苏ICP备1502009号"', 1378900335, 1415983236, 9, 1),
(8, '黄土地最小值', 'huang_min', '300', 2, '1', '', '', 0, 0, 20, 1),
(9, '黄土地最大值', 'huang_max', '600', 2, '1', '', '', 0, 0, 21, 1),
(10, '红土地最小值', 'hong_min', '1000', 2, '2', '', '', 0, 0, 21, 1),
(11, '红土地最大值', 'hong_max', '2000', 2, '2', '', '', 0, 0, 30, 1),
(12, '黑土地最小值', 'hei_min', '2000', 2, '3', '', '', 0, 0, 31, 1),
(13, '黑土地最大值', 'hei_max', '4000', 2, '3', '', '', 0, 0, 31, 1),
(14, 'P积分基础释放率', 'sell_fee', '0.3', 4, '', '', '', 0, 0, 23, 1),
(15, '1代P积分加速放率', 'direct_fee', '5', 4, '', '', '', 0, 0, 0, 1),
(16, '2-15代P积分加速放率', 'shop_fee', '1', 4, '', '', '', 0, 0, 33, 1),
(29, '2代Vip增加P积分率', 'vadd_lv', '8', 4, '', '', '', 0, 0, 0, 1),
(30, '2-15代Vip增加P积分率', 'morevadd_lv', '5', 4, '0', '', '', 0, 0, 0, 1),
(31, '总要扣比例', 'des_lv', '0.4', 2, '5', '', '', 0, 0, 0, 1),
(27, '基础拆分倍数', 'base_lv', '2.5', 2, '5', '', '', 0, 0, 0, 1),
(28, '哈士奇拆分倍数', 'hashiqi_lv', '0.05', 2, '5', '', '', 0, 0, 0, 1),
(24, '一级好友采矿拆分', 'friends_one', '10', 2, '', '', '', 0, 0, 0, 1),
(25, '二级好友采矿拆分', 'friends_two', '0', 2, '', '', '', 0, 0, 0, 1),
(26, '微信二维码', 'WEB_SITE_WX', '', 1, '', '', '', 0, 0, 0, 1),
(32, '注册开关', 'close_reg', '1', 3, '', '0:关闭1:开启', '关闭注册功能说明', 0, 0, 12, 1),
(33, '交易开关', 'close_trading', '1', 3, '', '0:关闭1:开启', '交易暂时关闭，16:00后开启', 0, 0, 13, 0),
(34, '果子转出开关', 'close_sellnum', '0', 3, '', '0:关闭1:开启', '关闭果子转出说明11', 0, 0, 0, 0),
(35, '三级好友采矿拆分', 'friends_tree', '0', 2, '', '', '', 0, 0, 0, 1),
(36, '体验地最小值', 'tiyan_min', '66', 2, '4', '', '', 0, 0, 0, 1),
(37, '体验地最大值', 'tiyan_max', '130', 2, '4', '', '', 0, 0, 0, 1),
(38, '鸡拆分倍数', 'ji_lv', '0.05', 2, '5', '', '', 0, 0, 0, 1),
(39, '鸟拆分倍数', 'niao_lv', '0.15', 2, '5', '', '', 0, 0, 0, 1),
(40, '猫拆分倍数', 'mao_lv', '0.1', 2, '5', '', '', 0, 0, 0, 1),
(41, '实时价格每分钟增长', 'growem', '10', 2, '', '', '', 0, 0, 12, 1),
(42, '商城开关', 'TOGGLE_MALL_SITE', '1', 3, '0', '0:关闭\r\n1:开启', '商城暂未开放', 1378898976, 1406992386, 1, 1),
(43, '注册送P积分数', 'jifen', '50', 1, '0', '', '', 1407003397, 1407004692, 3, 1),
(44, '奖励开关', 'regjifen', '1', 1, '0', '', '', 1407003397, 1407004692, 3, 1),
(45, '直推奖条件', 'zhitui1', '5', 6, '', '', '5000', 0, 0, 0, 1),
(46, '直推奖条件', 'zhitui2', '6', 6, '', '', '50000', 0, 0, 33, 1),
(47, '直推奖条件', 'zhitui3', '7', 6, '', '', '250000', 0, 0, 0, 1),
(48, '直推奖条件', 'zhitui4', '8', 6, '', '', '1000000', 0, 0, 0, 1),
(49, '管理奖条件', 'guanli1', '5', 7, '', '', '2', 0, 0, 0, 1),
(50, '管理奖条件', 'guanli2', '6', 7, '', '', '2', 0, 0, 33, 1),
(51, '管理奖条件', 'guanli3', '8', 7, '', '', '5', 0, 0, 0, 1),
(52, 'E余额转动奖条件', 'zhuand1', '0.4', 8, '', '', '5000', 0, 0, 0, 1),
(53, 'E余额转动奖条件', 'zhuand2', '0.5', 8, '', '', '50000', 0, 0, 33, 1),
(54, 'E余额转动奖条件', 'zhuand3', '0.6', 8, '', '', '250000', 0, 0, 0, 1),
(55, 'E余额转动奖条件', 'zhuand4', '0.7', 8, '', '', '1000000', 0, 0, 0, 1),
(56, '区块奖条件', 'qukuai1', '1', 9, '', '', '1', 0, 0, 0, 1),
(57, '区块奖条件', 'qukuai2', '1.5', 9, '', '', '2', 0, 0, 33, 1),
(58, '区块奖条件', 'qukuai3', '2', 9, '', '', '3', 0, 0, 0, 1),
(59, '区块奖条件', 'qukuai4', '2.5', 9, '', '', '4', 0, 0, 0, 1),
(60, '区块奖条件', 'qukuai5', '3', 9, '', '', '5', 0, 0, 0, 1),
(61, 'VIP1加速放率', 'vip1', '8', 10, '', '', '1000000', 0, 0, 33, 1),
(62, 'VIP2加速放率', 'vip2', '2', 10, '', '', '3', 0, 0, 0, 1),
(63, '推荐一个人赠送P积分数', 'jifens', '50', 1, '0', '', '', 1407003397, 1407004692, 3, 1),
(64, '赠送P积分最大推荐人数', 'rens', '100000', 1, '0', '', '', 1407003397, 1407004692, 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_crowds`
--

CREATE TABLE IF NOT EXISTS `ysk_crowds` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `num` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '出售数量',
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-出售成功 1-买家确认  2-买家确认 3-取消交易',
  `dprice` decimal(10,4) DEFAULT NULL,
  `jindu` decimal(10,2) DEFAULT NULL,
  `open_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=930 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_crowds_detail`
--

CREATE TABLE IF NOT EXISTS `ysk_crowds_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `crowds_id` varchar(255) NOT NULL,
  `num` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '出售数量',
  `dprice` decimal(10,4) DEFAULT NULL,
  `tprice` decimal(10,4) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=933 ;

--
-- 转存表中的数据 `ysk_crowds_detail`
--

INSERT INTO `ysk_crowds_detail` (`id`, `uid`, `crowds_id`, `num`, `dprice`, `tprice`, `create_time`) VALUES
(930, 8569, '0', '1.0000', '0.0000', '0.0000', 2018),
(931, 8569, '后台增加', '1.0000', '0.0000', '0.0000', 2018),
(932, 8569, '后台减少', '1.0000', '0.0000', '0.0000', 2018);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_daojudets`
--

CREATE TABLE IF NOT EXISTS `ysk_daojudets` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '道具表',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `time` date NOT NULL COMMENT '开始时间',
  `end_time` date NOT NULL COMMENT '到期时间',
  `state` tinyint(1) NOT NULL COMMENT '1-使用中 2已过期 3未使用',
  `daoju_type` tinyint(1) NOT NULL COMMENT '1一键挑粪',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE COMMENT '唯一主键id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_date_sell_limit`
--

CREATE TABLE IF NOT EXISTS `ysk_date_sell_limit` (
  `uid` int(11) NOT NULL COMMENT '每天出售限制',
  `num` int(11) NOT NULL DEFAULT '0',
  `datestr` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_deal`
--

CREATE TABLE IF NOT EXISTS `ysk_deal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `num` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '出售数量',
  `sell_id` int(11) NOT NULL DEFAULT '0' COMMENT '出售人ID',
  `fee_num` decimal(11,2) DEFAULT NULL COMMENT '手续费',
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-出售成功 1-买家确认  2-买家确认 3-取消交易',
  `cid` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1,出售 2,购买',
  `tprice` decimal(10,2) DEFAULT NULL,
  `dprice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sell_id` (`sell_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=201 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_deals`
--

CREATE TABLE IF NOT EXISTS `ysk_deals` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `num` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '出售数量',
  `sell_id` int(11) NOT NULL DEFAULT '0' COMMENT '出售人ID',
  `buy_id` int(11) NOT NULL DEFAULT '0' COMMENT '购买者ID',
  `fee_num` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '手续费',
  `create_time` int(11) DEFAULT NULL,
  `buy_uname` varchar(255) DEFAULT NULL,
  `cid` tinyint(1) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1,出售 2,购买',
  `tprice` decimal(10,2) DEFAULT NULL,
  `dprice` decimal(10,2) DEFAULT NULL,
  `d_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sell_id` (`sell_id`) USING BTREE,
  KEY `buy_id` (`buy_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=98 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_earnsrecords`
--

CREATE TABLE IF NOT EXISTS `ysk_earnsrecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '喂养收入明细表',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `land_id` int(11) NOT NULL COMMENT '土地id',
  `add_nums` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '收入数量',
  `add_times` date DEFAULT NULL COMMENT '收钱时间',
  `farms_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1->鸡窝,2->果园，3->渔场',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE COMMENT '唯一id',
  KEY `landid` (`land_id`) USING BTREE COMMENT '土地id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_farmgoods`
--

CREATE TABLE IF NOT EXISTS `ysk_farmgoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '土地详情表',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `farm_landstype` varchar(20) NOT NULL COMMENT '1->普通地,2->高级地',
  `open_time` date DEFAULT NULL COMMENT '建窝时间',
  `lands_posi` int(11) NOT NULL COMMENT '鸡窝位置',
  `farms_type` tinyint(1) NOT NULL COMMENT '1->养鸡场,2->果园,3->渔场',
  `jiwoearns_all` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '对应鸡窝总收益',
  `chicken_type` tinyint(1) DEFAULT '1' COMMENT '1->小鸡,2->大鸡',
  `qingsao_time` date NOT NULL COMMENT '最后一次清扫时间',
  `chicken_bjmoney` decimal(11,2) NOT NULL DEFAULT '360.00' COMMENT '鸡窝本金',
  `chicken_profit` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '鸡窝收益',
  `nianhua_shouyi` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '果园年化收益',
  `yuchang_higst` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '渔场最高值临界点',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE COMMENT 'id主键',
  KEY `seach` (`uid`,`farm_landstype`,`lands_posi`,`farms_type`) USING BTREE COMMENT '搜索优化'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_feedtimes`
--

CREATE TABLE IF NOT EXISTS `ysk_feedtimes` (
  `id` int(11) NOT NULL COMMENT '渔场可喂养时间点',
  `feed_time` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_fengche`
--

CREATE TABLE IF NOT EXISTS `ysk_fengche` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `f_uid` int(11) NOT NULL COMMENT '用户UID',
  `f_time` date NOT NULL COMMENT '获得用时间',
  `f_end_time` date NOT NULL COMMENT '到期时间',
  `f_state` tinyint(1) NOT NULL COMMENT '状态 1使用中   2未使用  3已过期 ',
  `f_type` tinyint(1) NOT NULL COMMENT '1风车',
  PRIMARY KEY (`f_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_fruitdetail`
--

CREATE TABLE IF NOT EXISTS `ysk_fruitdetail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `trading_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '交易类型 0-数量在自己账户内变动 1-收入  2-支出',
  `num` decimal(10,2) NOT NULL COMMENT '交易数量',
  `to_id` int(11) DEFAULT NULL COMMENT '支出给对方ID',
  `trading_name` varchar(255) DEFAULT NULL,
  `content` text COMMENT '说明',
  `add_time` int(11) NOT NULL COMMENT '交易时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=63 ;

--
-- 转存表中的数据 `ysk_fruitdetail`
--

INSERT INTO `ysk_fruitdetail` (`id`, `uid`, `trading_type`, `num`, `to_id`, `trading_name`, `content`, `add_time`) VALUES
(62, 1718, 1, '2.00', 0, '平台播发', '平台播发金钱2', 1523534817);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_fruit_in`
--

CREATE TABLE IF NOT EXISTS `ysk_fruit_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '果子转入',
  `manage_id` int(11) NOT NULL COMMENT '管理员id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` decimal(15,0) NOT NULL COMMENT '转给用户的果子数量',
  `create_time` int(11) NOT NULL COMMENT '转果子时间',
  `ip` varchar(20) NOT NULL COMMENT '转果子时使用的电脑ip',
  `type` char(20) NOT NULL,
  `content` varchar(255) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `account` varchar(20) NOT NULL,
  `manage_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_gerenshangpu`
--

CREATE TABLE IF NOT EXISTS `ysk_gerenshangpu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `shop_name` varchar(255) NOT NULL COMMENT '店铺名称',
  `shop_logo` varchar(255) DEFAULT NULL COMMENT '店铺logo',
  `shop_type` int(2) NOT NULL COMMENT '商铺类型:1服饰2餐饮3酒店4旅游5科技6养生7美容8特产9生鲜0其它',
  `shop_beijing` varchar(255) DEFAULT NULL COMMENT '商铺背景',
  `shop_vpay` varchar(255) DEFAULT NULL COMMENT 'vpay二维码',
  `shop_zhifubao` varchar(255) DEFAULT NULL COMMENT '支付宝二维码',
  `shop_weixin` varchar(255) DEFAULT NULL COMMENT '微信二维码',
  `shop_dengji` varchar(255) DEFAULT NULL COMMENT '店铺等级:0没有店铺,1,一级2,二级,3,三级',
  `shop_shoucang` int(111) DEFAULT NULL COMMENT '收藏数',
  `shop_xiaoshou` int(122) DEFAULT NULL COMMENT '销售量',
  `userid` int(111) NOT NULL COMMENT '用户id',
  `kaihuhang` varchar(255) DEFAULT NULL COMMENT '开户行',
  `name` varchar(255) DEFAULT NULL COMMENT '开户姓名',
  `bank` varchar(255) DEFAULT NULL COMMENT '银行卡',
  `shop_phone` varchar(255) NOT NULL COMMENT '店铺手机号码',
  `shop_stort` int(5) NOT NULL DEFAULT '500' COMMENT '店铺排序',
  `shop_zhuangtai` int(1) NOT NULL DEFAULT '1' COMMENT '1启用2禁用',
  `shop_guanggao` varchar(255) DEFAULT NULL COMMENT '广告背景',
  `shop_address` varchar(255) NOT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `ysk_gerenshangpu`
--

INSERT INTO `ysk_gerenshangpu` (`id`, `shop_name`, `shop_logo`, `shop_type`, `shop_beijing`, `shop_vpay`, `shop_zhifubao`, `shop_weixin`, `shop_dengji`, `shop_shoucang`, `shop_xiaoshou`, `userid`, `kaihuhang`, `name`, `bank`, `shop_phone`, `shop_stort`, `shop_zhuangtai`, `shop_guanggao`, `shop_address`) VALUES
(25, '难道是你', '/Uploads/image/product/2018-04-23/5add5399eedbd.png', 4, '/Uploads/image/product/2018-04-23/5add5399f05e5.jpg', '/Uploads/image/product/2018-04-23/5add5399f384b.png', '/Uploads/image/product/2018-04-23/5add539a002d0.png', '/Uploads/image/product/2018-04-23/5add539a013a4.png', '', NULL, NULL, 1710, '地方', '纪念币撒', '360731199106230055', '15170788826', 500, 1, '/Uploads/image/product/2018-04-23/5add5399f2b85.jpg', '毛主席呢'),
(1, '后台商店', '/Uploads/image/product/5ad83a4b9c41c.jpg', 8, NULL, NULL, '/Uploads/image/product/5a9669c45b4f3.jpg', '/Uploads/image/product/5a9669bf09789.jpg', '', NULL, NULL, 0, NULL, NULL, NULL, '', 500, 1, NULL, '深圳北海'),
(21, '褚酒庄园', '/Uploads/image/product/2018-04-14/5ad1ac5944939.png', 2, '/Uploads/image/product/2018-04-14/5ad1ac5946b62.png', '/Uploads/image/product/2018-04-14/5ad1ac594a7ee.png', NULL, NULL, '', NULL, NULL, 1724, '分分分', '俄方饿阿肥', '4512542154251452', '15107436521', 500, 1, '/Uploads/image/product/2018-04-14/5ad1ac59497b4.png', '大画幅饿虎'),
(23, '保健品', '/Uploads/image/product/2018-04-14/5ad1ab807903d.png', 6, '/Uploads/image/product/2018-04-14/5ad1ab8082507.png', '/Uploads/image/product/2018-04-14/5ad1ab808a117.png', NULL, NULL, '', NULL, NULL, 1745, '俄方花蕊', '恶客咯额', '1254526325125489', '12542153698', 500, 1, '/Uploads/image/product/2018-04-14/5ad1ab8089185.png', '对方黑椒和恢复俄方'),
(26, 'f啥都放寒假', '/Uploads/image/product/2018-04-26/5ae1b71cbbcce.png', 7, '/Uploads/image/product/2018-04-26/5ae1b71cbdba7.png', '/Uploads/image/product/2018-04-26/5ae1b71cc422e.png', '/Uploads/image/product/2018-04-26/5ae1b71cc5f99.png', '/Uploads/image/product/2018-04-26/5ae1b71cc7c45.png', '', NULL, NULL, 1715, '刚好符合', '梵蒂冈', '2356521456542585', '15170788826', 500, 1, '/Uploads/image/product/2018-04-26/5ae1b71cbf8bf.png', '的方式感到反感第三方'),
(27, '信仰', '/Uploads/image/product/2018-06-15/5b23650634b76.gif', 1, '/Uploads/image/product/2018-06-15/5b2365063766f.gif', NULL, '/Uploads/image/product/2018-06-15/5b2365063fc05.gif', '/Uploads/image/product/2018-06-15/5b236506426a9.gif', NULL, NULL, NULL, 4125, '交通', '朱', '12123123645456123', '13478987503', 500, 1, '/Uploads/image/product/2018-06-15/5b2365063a620.gif', '河南'),
(28, '6666', '/Uploads/image/product/2018-06-15/5b23677071112.png', 1, '/Uploads/image/product/2018-06-15/5b2367707172e.png', NULL, '/Uploads/image/product/2018-06-15/5b236770728e3.png', '/Uploads/image/product/2018-06-15/5b23677072eed.png', NULL, NULL, NULL, 8539, '9999999', '36978456', '123456789', '15236766493', 500, 1, '/Uploads/image/product/2018-06-15/5b23677071d2c.png', '123456789'),
(29, '信仰超市', '/Uploads/image/product/2018-06-21/5b2b51a3a0a2a.png', 2, '/Uploads/image/product/2018-06-21/5b2b51a3a0c35.png', NULL, '/Uploads/image/product/2018-06-21/5b2b51a3a1252.png', '/Uploads/image/product/2018-06-21/5b2b51a3a1471.png', NULL, NULL, NULL, 8545, '交通', '小猪', '456516536', '13478987503', 500, 1, '/Uploads/image/product/2018-06-21/5b2b51a3a0e09.png', '郑州二七');

-- --------------------------------------------------------

--
-- 表的结构 `ysk_goods_discount`
--

CREATE TABLE IF NOT EXISTS `ysk_goods_discount` (
  `product_discount_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='数量折扣';

-- --------------------------------------------------------

--
-- 表的结构 `ysk_group`
--

CREATE TABLE IF NOT EXISTS `ysk_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级部门ID',
  `title` varchar(31) NOT NULL DEFAULT '' COMMENT '部门名称',
  `icon` varchar(31) NOT NULL DEFAULT '' COMMENT '图标',
  `menu_auth` text NOT NULL COMMENT '权限列表',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  `auth_id` int(11) DEFAULT NULL,
  `hylb` varchar(10) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门信息表' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `ysk_group`
--

INSERT INTO `ysk_group` (`id`, `pid`, `title`, `icon`, `menu_auth`, `create_time`, `update_time`, `sort`, `status`, `auth_id`, `hylb`) VALUES
(1, 0, '超级管理员', '', '', 1426881003, 1427552428, 0, 1, 1, '0'),
(2, 0, '财务查看', '', '1,7,8,322,323', 1498324367, 1527084992, 0, 1, 2, '5'),
(7, 0, '超级管理', '', '1,3,4,6,327,7,8,9,316,318,322,323', 1526152893, 1528963727, 0, 1, 0, ''),
(8, 0, '数据管理', '', '1,3,4,327,7,8,10,11,315,324,325,334,329,328', 1527085184, 1527140823, 0, 1, 0, '0'),
(9, 0, '数据管理1', '', '3,4,327,7,8', 1527140086, 1527140086, 0, -1, 0, '0'),
(10, 0, '测试', '', '1,3,4,327,7,8,9,316,318,322,323', 1529227955, 1530002816, 0, 1, NULL, '2,3,5');

-- --------------------------------------------------------

--
-- 表的结构 `ysk_growth`
--

CREATE TABLE IF NOT EXISTS `ysk_growth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `num` decimal(11,2) NOT NULL DEFAULT '0.00',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `hashiqi_lv` decimal(8,6) NOT NULL DEFAULT '0.000000',
  `zangao_lv` decimal(8,6) NOT NULL DEFAULT '0.000000',
  `dcr_lv` decimal(8,6) NOT NULL DEFAULT '0.000000',
  `des_lv` decimal(8,6) NOT NULL DEFAULT '0.000000' COMMENT '扣除',
  `base_lv` decimal(8,6) NOT NULL DEFAULT '0.000000' COMMENT '基础拆分',
  `total_lv` decimal(8,6) NOT NULL DEFAULT '0.000000' COMMENT '总拆分',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_harvdets`
--

CREATE TABLE IF NOT EXISTS `ysk_harvdets` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '增养记录表',
  `har_nums` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '增氧数量',
  `har_landid` int(11) NOT NULL COMMENT '增养地id',
  `uid` int(11) NOT NULL COMMENT '增养用户id',
  `har_time` date NOT NULL COMMENT '增氧时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_jiaoyiorder`
--

CREATE TABLE IF NOT EXISTS `ysk_jiaoyiorder` (
  `jy_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `jy_type` tinyint(3) NOT NULL COMMENT '类型 5喂养 6挑粪',
  `jy_fromuid` int(15) NOT NULL COMMENT '出售者',
  `jy_touid` int(15) NOT NULL COMMENT '收购者',
  `jy_mobile` varchar(255) NOT NULL COMMENT '收购者手机号码',
  `jy_addtime` varchar(20) NOT NULL COMMENT '添加时间',
  `jy_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '交易状态',
  `yj_jiangjin` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '买家是地主的奖金',
  `jy_fee` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '手续费',
  `jy_mun` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT 'P积分',
  `all_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1->取消,2->完成',
  PRIMARY KEY (`jy_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_kaidi`
--

CREATE TABLE IF NOT EXISTS `ysk_kaidi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '播种记录表id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `farm_id` tinyint(4) NOT NULL COMMENT '农田id',
  `num` int(11) NOT NULL COMMENT '播种数量',
  `farm_type` tinyint(4) NOT NULL COMMENT '土地类型：1.黄土地 2.红土地 3.黑土地',
  `sow_time` int(11) NOT NULL COMMENT '播种时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '播种状态  0隐藏 1显示',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=111 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_layerneeds`
--

CREATE TABLE IF NOT EXISTS `ysk_layerneeds` (
  `id` int(11) NOT NULL COMMENT '等级设置表',
  `direct_pers` int(11) NOT NULL DEFAULT '0' COMMENT '所需直推人数',
  `member_jifen` int(11) NOT NULL DEFAULT '0' COMMENT '所需要P积分',
  `member_grade` int(11) NOT NULL DEFAULT '1' COMMENT '对应用户等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ysk_layerneeds`
--

INSERT INTO `ysk_layerneeds` (`id`, `direct_pers`, `member_jifen`, `member_grade`) VALUES
(1, 0, 0, 1),
(2, 10, 10, 2),
(3, 20, 12, 3),
(4, 30, 16, 4),
(5, 40, 20, 5),
(6, 50, 30, 6),
(7, 60, 400, 7);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_level_list`
--

CREATE TABLE IF NOT EXISTS `ysk_level_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '升级等级',
  `proof` varchar(128) NOT NULL COMMENT '支付凭证',
  `money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '付款金额',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态0未处理 1已处理 2已取消',
  `time` varchar(12) NOT NULL COMMENT '申请时间',
  `datestr` varchar(16) NOT NULL COMMENT '申请日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_limit`
--

CREATE TABLE IF NOT EXISTS `ysk_limit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `limit_num` int(11) NOT NULL COMMENT '限制数量',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '按稻草人还是直推会员推荐',
  `level_name` varchar(20) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `ysk_limit`
--

INSERT INTO `ysk_limit` (`id`, `limit_num`, `type`, `level_name`, `content`) VALUES
(1, 50, 0, '普通用户', ''),
(2, 500, 1, '青铜农主', ''),
(3, 500, 2, '白金农主', ''),
(4, 500, 3, '水晶农主', ''),
(5, 1000, 4, '宝石农主', ''),
(6, 1500, 5, '钻石农主', ''),
(7, 2000, 6, '皇冠农主', '');

-- --------------------------------------------------------

--
-- 表的结构 `ysk_love_shop`
--

CREATE TABLE IF NOT EXISTS `ysk_love_shop` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '收藏店铺id',
  `user_id` int(5) NOT NULL COMMENT '用户id',
  `shop_id` int(5) NOT NULL COMMENT '店铺id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_love_shoping`
--

CREATE TABLE IF NOT EXISTS `ysk_love_shoping` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '收藏商品id',
  `user_id` int(5) NOT NULL COMMENT '用户id',
  `shop_id` int(5) NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_member`
--

CREATE TABLE IF NOT EXISTS `ysk_member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员表',
  `uname` varchar(11) DEFAULT NULL COMMENT '用户名',
  `fid` int(11) NOT NULL DEFAULT '0' COMMENT '推荐人id',
  `path_id` text NOT NULL COMMENT '团队路径',
  `phone` varchar(11) NOT NULL DEFAULT '0' COMMENT '电话号码',
  `cangkujiwo__jifen` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '仓库鸡窝P积分',
  `renqizhinums` int(10) NOT NULL DEFAULT '0' COMMENT '人气值',
  `xiaofei_jifen` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '消费P积分',
  `mobile` varchar(11) NOT NULL DEFAULT '0' COMMENT '电话号码',
  `fc` int(11) NOT NULL DEFAULT '0' COMMENT '累计获得风车数',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `last_login_ip` varchar(40) DEFAULT NULL COMMENT '上次登录ip',
  `last_ip_region` varchar(64) DEFAULT NULL COMMENT 'ip指向详细地址',
  `last_login_time` int(11) DEFAULT NULL,
  `session_id` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0->默认,1->冻结',
  `chicken_bili` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '鸡窝拆分率',
  `lenth_layer` int(11) NOT NULL DEFAULT '0' COMMENT '深度',
  `member_grade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '对应用户等级 0普通会员 1体验会员 2钻石会员 3联盟会员  ',
  `member_grade_shoudong` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1默认 2后台已改 3前台受方法影响',
  `api_pay` varchar(30) DEFAULT NULL COMMENT '支付宝账号',
  `wx_name` varchar(30) DEFAULT NULL COMMENT '微信',
  `add_ress` varchar(100) DEFAULT NULL COMMENT '收货地址',
  `farmlink_address` varchar(100) DEFAULT NULL COMMENT '农联币地址',
  `zhuanjia` tinyint(1) NOT NULL DEFAULT '0' COMMENT '专家',
  `guanjia` tinyint(1) NOT NULL DEFAULT '0' COMMENT '管家',
  `pwd` varchar(255) NOT NULL COMMENT '密码',
  `twopass` varchar(255) NOT NULL COMMENT '二级密码',
  `avatar` varchar(50) NOT NULL DEFAULT '1.jpg' COMMENT '头像',
  `create_time` int(11) NOT NULL COMMENT '产生时间',
  `member_directnums` int(11) NOT NULL DEFAULT '0' COMMENT '直推有效人数',
  `team_directnums` int(11) NOT NULL DEFAULT '0' COMMENT '团队有效人数',
  `direct_kaidi` float(11,1) NOT NULL DEFAULT '0.0' COMMENT '我的直推人第一次开地',
  `weiyang_time` date NOT NULL COMMENT '会员喂养时间',
  `weiyang_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '会员喂养收益',
  `tiaofen_mid` text NOT NULL COMMENT '挑我粪人员会员id',
  `buyu_earns` decimal(11,3) NOT NULL COMMENT '喂鱼收益',
  `buyu_id` text NOT NULL COMMENT '捕鱼id',
  `buyu_time` date NOT NULL COMMENT '捕鱼时间',
  `yangqiji` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '下级购买氧气机+0.1',
  `yangqiji_nums` int(1) NOT NULL DEFAULT '0' COMMENT '氧气机数量 最多5个',
  `music_isplay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1->播放,2->暂停',
  `yuchang_guanjia` tinyint(1) NOT NULL DEFAULT '0' COMMENT '渔场管家',
  `bankname` varchar(80) NOT NULL DEFAULT '0' COMMENT '开户行',
  `banknumber` varchar(20) NOT NULL DEFAULT '0' COMMENT '银行卡号',
  `chaifen_bili` float(8,4) NOT NULL DEFAULT '0.0000' COMMENT '鸡窝拆分比例',
  `count_time` date NOT NULL COMMENT '计算拆分/收益时间',
  `tiaofen_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '挑粪收益',
  `guoyuan_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '果园施肥收益',
  `yuchang_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '渔场喂鱼收益',
  `guoyuan_chaifen` float(11,3) NOT NULL DEFAULT '0.000' COMMENT '果园拆分',
  `yuchang_chaifen` float(11,3) NOT NULL DEFAULT '0.000' COMMENT '渔场拆分',
  `jiwo_chaifen` float(11,3) NOT NULL DEFAULT '0.000' COMMENT '鸡场拆分率',
  `guoyuan_nextsix` decimal(15,3) NOT NULL DEFAULT '0.000' COMMENT '下6级本金',
  `guoyuan_nextone` decimal(15,3) NOT NULL DEFAULT '0.000' COMMENT '下1级本金',
  `jiaoshuiid` text NOT NULL COMMENT '给我浇水的下级',
  `houtaijibie` tinyint(1) NOT NULL DEFAULT '1' COMMENT '后台设置级别',
  `judian_pic` varchar(40) NOT NULL COMMENT '聚点收款账号',
  `buy_moneys` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '购买总数量',
  `is_dailishang` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1->普通用户,2->代理商,3->大区负责人',
  `is_manager` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为大区负责人0否 1是',
  `is_p_verify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '个人认证 0未认证 1已认证 ',
  `is_e_verify` tinyint(1) NOT NULL COMMENT '企业认证 0未认证 1已认证 ',
  `prov` varchar(64) DEFAULT NULL COMMENT '代理省份',
  `city` varchar(64) DEFAULT NULL COMMENT '代理城市',
  `dl_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '代理服务费',
  `tg_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '推广金',
  `gl_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '管理服务费',
  `team_grade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户所属团队',
  `dailishang_logo` varchar(256) NOT NULL DEFAULT '1.jpg' COMMENT '商家logo',
  `dailishang_name` varchar(35) NOT NULL COMMENT '商家店铺名',
  PRIMARY KEY (`member_id`) USING BTREE,
  UNIQUE KEY `member_id` (`member_id`) USING BTREE COMMENT 'member_id',
  KEY `fuzhu` (`lenth_layer`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=29 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_member_jifens`
--

CREATE TABLE IF NOT EXISTS `ysk_member_jifens` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'P积分明细表',
  `chicken_jifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '鸡窝P积分',
  `fish_jifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '渔场P积分',
  `farm_jifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '农场P积分',
  `farmlink_jifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '农联P积分',
  `member_id` int(11) NOT NULL COMMENT '用户id',
  `chicken_earnjifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '鸡场总收益',
  `fish_earnjifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '渔场总收益',
  `farm_earnjifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '农场总收益',
  `xiaofei_jifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '消费P积分',
  `renqicount` float(11,3) NOT NULL DEFAULT '0.000' COMMENT '人气值',
  `yongjin` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '分销佣金',
  `daili_yongjin` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '代理佣金',
  `balance_nums` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT 'E余额/(区块链使用)',
  `yu_ku` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '只能用来提现',
  `yuchang_dongjie` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '渔场摸虾冻结P积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=29 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_menu`
--

CREATE TABLE IF NOT EXISTS `ysk_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `pid` int(11) NOT NULL COMMENT '父级id',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '爷爷ID、',
  `col` varchar(30) NOT NULL COMMENT '控制器',
  `act` varchar(30) NOT NULL COMMENT '方法',
  `patch` varchar(50) DEFAULT NULL COMMENT '全路径',
  `level` int(11) NOT NULL COMMENT '级别',
  `icon` varchar(50) DEFAULT NULL,
  `sort` char(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=341 ;

--
-- 转存表中的数据 `ysk_menu`
--

INSERT INTO `ysk_menu` (`id`, `name`, `pid`, `gid`, `col`, `act`, `patch`, `level`, `icon`, `sort`, `status`) VALUES
(4, '系统配置', 3, 1, 'Config', 'group4', '', 2, 'fa-wrench', '11', 1),
(6, '管理员管理', 3, 1, 'Manage', 'index', '', 2, 'fa fa-cog', '13', 1),
(3, '统用功能', 1, 1, '', '', '', 1, 'fa-folder-open-o', '1', 1),
(5, '角色管理', 3, 1, 'Group', 'index', '', 2, 'fa-sitemap', '12', 1),
(7, '会员管理', 1, 1, '', '', '', 1, 'fa-folder-open-o', '2', 1),
(8, '会员列表', 7, 1, 'User', 'index', NULL, 2, 'fa-user', '21', 1),
(9, '推荐结构', 7, 1, 'Tree', 'index', NULL, 2, 'fa-th-large', '22', 1),
(1, '系统', 0, 0, '', '', NULL, 0, 'fa-cog', '0', 1),
(10, '系统记录', 0, 0, '', '', NULL, 0, 'fa-tasks', '0', 0),
(11, '商品管理', 10, 10, '', '', NULL, 1, 'fa-folder-open-o', '3', 1),
(315, '商品列表', 11, 10, 'Good', 'index', NULL, 2, NULL, '31', 1),
(316, '反馈管理', 1, 1, '', '', NULL, 1, 'fa-folder-open-o', '3', 1),
(331, '游戏币转入', 319, 1, 'BuyNum', 'index', NULL, 2, 'fa-list', '43', 0),
(318, '反馈列表', 316, 1, 'Recyling', 'index', NULL, 2, 'fa-file-text', '32', 1),
(319, '平台充值管理', 1, 1, '', '', NULL, 1, 'fa-folder-open-o', '4', 0),
(320, '平台充值', 319, 1, 'FruitsManage', 'index', NULL, 2, 'fa-jpy', '41', 0),
(321, '充值流水', 319, 1, 'FruitsDetail', 'index', NULL, 2, 'fa-list', '42', 0),
(322, '公告管理', 1, 1, '', '', NULL, 1, 'fa-folder-open-o', '5', 1),
(323, '系统公告', 322, 1, 'News', 'index', NULL, 2, 'fa-twitter-square', '51', 1),
(324, '交易管理', 10, 10, '', '', '', 1, 'fa-folder-open-o', '6', 1),
(325, '定向交易记录', 324, 10, 'Traing', 'index', '', 2, 'fa-list', '61', 1),
(327, '数据库管理', 3, 1, 'Database', 'index', NULL, 2, 'fa fa-lock', '14', 1),
(328, '转盘记录', 324, 10, 'Traing', 'turntable', '', 2, 'fa-list', '67', 1),
(329, '施肥记录', 324, 10, 'Traing', 'growth', '', 2, 'fa-list', '66', 1),
(330, '果子转聚宝盆', 319, 1, 'SellNum', 'index', NULL, 2, 'fa-list', '45', 0),
(332, '激活码管理', 1, 1, '', '', NULL, 1, 'fa-folder-open-o', '7', 0),
(333, '激活码列表', 332, 1, 'ActivateNum', 'index', NULL, 2, 'fa-list', '71', 0),
(334, '自由交易记录', 324, 10, 'Traing', 'tradingfree', '', 2, 'fa-list', '62', 1),
(335, '轮播管理', 1, 1, '', '', '', 1, 'fa-folder-open-o', '6', 1),
(336, '系统轮播', 335, 1, 'Banner', 'index', '', 2, 'fa-twitter-square', '51', 1),
(337, '投诉列表', 316, 1, 'Complaint', 'index', NULL, 2, 'fa-file-text', '33', 1),
(338, '短信配置', 3, 1, 'Config', 'msgs', NULL, 2, 'fa fa-twitter-square', '88', 1),
(339, '后台充值记录', 7, 1, 'User', 'recharge', NULL, 2, 'fa-list', '99', 1),
(340, '众筹记录', 7, 1, 'Crowdsd', 'index', NULL, 2, 'fa-list', '68', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_moneyils`
--

CREATE TABLE IF NOT EXISTS `ysk_moneyils` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_id` int(10) NOT NULL COMMENT '付钱会员id',
  `get_id` int(10) NOT NULL COMMENT '拿钱id',
  `get_nums` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '拿钱数量',
  `get_level` int(2) NOT NULL DEFAULT '0' COMMENT '第几代拿钱',
  `get_types` int(2) NOT NULL DEFAULT '0' COMMENT '1->转账三级分销，2->E余额转P积分三级分销',
  `get_time` char(30) NOT NULL DEFAULT '0' COMMENT '拿钱时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1036 ;

--
-- 转存表中的数据 `ysk_moneyils`
--

INSERT INTO `ysk_moneyils` (`id`, `pay_id`, `get_id`, `get_nums`, `get_level`, `get_types`, `get_time`) VALUES
(53, 6000125, 6000028, '40.00', 1, 1, '1521624882'),
(54, 6000114, 6000110, '16.00', 1, 1, '1521777204'),
(55, 6000114, 6000110, '16.00', 1, 1, '1521783962'),
(56, 6000032, 6000016, '500.00', 1, 1, '1521789857'),
(33, 6000138, 6000104, '8.00', 1, 2, '1520679221'),
(34, 6000138, 6000005, '3.00', 2, 2, '1520679221'),
(35, 6000138, 6000004, '3.00', 3, 2, '1520679221'),
(36, 6000138, 6000001, '3.00', 4, 2, '1520679221'),
(37, 6000138, 6000104, '8.00', 1, 2, '1520679238'),
(38, 6000138, 6000005, '3.00', 2, 2, '1520679238'),
(39, 6000138, 6000004, '3.00', 3, 2, '1520679238'),
(40, 6000138, 6000001, '3.00', 4, 2, '1520679238'),
(41, 6000138, 6000104, '8.00', 1, 2, '1520679271'),
(42, 6000138, 6000005, '3.00', 2, 2, '1520679271'),
(43, 6000138, 6000004, '3.00', 3, 2, '1520679271'),
(44, 6000138, 6000001, '3.00', 4, 2, '1520679271'),
(45, 6000138, 6000104, '8.00', 1, 2, '1520679351'),
(46, 6000138, 6000104, '16.00', 1, 2, '1520680159'),
(47, 6000138, 6000104, '1.60', 1, 1, '1520680588'),
(48, 6000138, 6000104, '16.00', 1, 2, '1520680601'),
(49, 6000138, 6000104, '8.00', 1, 2, '1521027562'),
(50, 6000138, 6000104, '8.00', 1, 2, '1521027577'),
(51, 6000138, 6000104, '1.60', 1, 1, '1521027608'),
(52, 6000125, 6000028, '40.00', 1, 1, '1521624561'),
(57, 6000164, 6000163, '8.00', 1, 2, '1522218777'),
(58, 6000149, 6000148, '8.00', 1, 1, '1522635230'),
(59, 6000149, 6000148, '8.00', 1, 1, '1522635676'),
(60, 6000158, 6000148, '8.00', 1, 1, '1522635939'),
(61, 6000158, 6000148, '8.00', 1, 1, '1522635987'),
(62, 6000190, 6000148, '3.00', 3, 1, '1522661923'),
(63, 6000165, 6000163, '8.00', 1, 2, '1522725079'),
(64, 6000164, 6000163, '16.00', 1, 1, '1522727205'),
(65, 6000164, 6000163, '16.00', 1, 1, '1522727252'),
(66, 6000164, 6000163, '16.00', 1, 1, '1522727804'),
(67, 6000164, 6000163, '16.00', 1, 1, '1522727859'),
(68, 6000201, 6000163, '4.80', 2, 1, '1522727981'),
(69, 6000201, 6000163, '3.00', 2, 2, '1522728015'),
(70, 6000164, 6000163, '16.00', 1, 1, '1522728472'),
(71, 6000201, 6000163, '6.00', 2, 2, '1522728629'),
(72, 6000164, 6000163, '16.00', 1, 1, '1522745092'),
(73, 6000164, 6000163, '16.00', 1, 1, '1522745167'),
(74, 6000164, 6000163, '16.00', 1, 1, '1522745442'),
(75, 6000164, 6000163, '16.00', 1, 1, '1522760114'),
(76, 6000164, 6000163, '16.00', 1, 1, '1522764359'),
(77, 6000164, 6000163, '16.00', 1, 1, '1522764404'),
(78, 6000164, 6000163, '16.00', 1, 1, '1522764451'),
(79, 6000164, 6000163, '16.00', 1, 1, '1522764506'),
(80, 6000164, 6000163, '16.00', 1, 1, '1522764572'),
(81, 6000164, 6000163, '16.00', 1, 1, '1522764611'),
(82, 6000203, 6000202, '4160.00', 1, 2, '1522765147'),
(83, 6000208, 6000203, '1200.00', 3, 2, '1522767980'),
(84, 6000164, 6000163, '16.00', 1, 1, '1522798157'),
(85, 6000209, 6000165, '8.00', 1, 2, '1522802639'),
(86, 6000164, 6000163, '16.00', 1, 1, '1522815470'),
(87, 6000164, 6000163, '800.00', 1, 1, '1522817875'),
(88, 6000214, 6000163, '3.00', 2, 2, '1522818440'),
(89, 6000215, 6000163, '240.00', 2, 2, '1522818700'),
(90, 6000207, 6000203, '3.00', 3, 2, '1522822146'),
(91, 6000197, 6000148, '0.06', 2, 1, '1522839800'),
(92, 6000215, 6000163, '3.00', 2, 2, '1522891806'),
(93, 6000164, 6000163, '1600.00', 1, 2, '1522959750'),
(94, 6000198, 6000165, '8.00', 1, 2, '1523009432'),
(95, 6000200, 6000165, '8.00', 1, 2, '1523009951'),
(96, 6000200, 6000165, '320.00', 1, 2, '1523024676'),
(97, 6000200, 6000165, '8.00', 1, 2, '1523030629'),
(98, 6000199, 6000165, '8.00', 1, 2, '1523060320'),
(99, 6000197, 6000148, '30.00', 2, 1, '1523071387'),
(100, 6000197, 6000148, '3.00', 2, 1, '1523072806'),
(101, 6000158, 6000148, '4.00', 1, 1, '1523072856'),
(102, 6000199, 6000165, '4.80', 1, 1, '1523080029'),
(103, 6000200, 6000165, '8.00', 1, 2, '1523080605'),
(104, 6000210, 6000208, '80.00', 1, 1, '1523090260'),
(105, 6000210, 6000208, '80.00', 1, 1, '1523090261'),
(106, 6000210, 6000208, '80.00', 1, 1, '1523091013'),
(107, 6000210, 6000208, '80.00', 1, 1, '1523091035'),
(108, 6000210, 6000208, '80.00', 1, 1, '1523091101'),
(109, 6000210, 6000208, '80.00', 1, 1, '1523091474'),
(110, 6000210, 6000203, '30.00', 4, 1, '1523091495'),
(111, 6000210, 6000203, '30.00', 4, 1, '1523092504'),
(112, 6000210, 6000203, '30.00', 4, 1, '1523093986'),
(113, 6000210, 6000203, '30.00', 4, 1, '1523096440'),
(114, 6000210, 6000203, '30.00', 4, 1, '1523096641'),
(115, 6000200, 6000165, '8.00', 1, 2, '1523102777'),
(116, 6000200, 6000165, '3.20', 1, 1, '1523103873'),
(117, 6000199, 6000165, '0.15', 1, 1, '1523104036'),
(118, 6000225, 6000165, '1.00', 2, 1, '1523104111'),
(119, 6000167, 6000163, '704.00', 1, 2, '1523116623'),
(120, 6000227, 6000165, '4.80', 2, 1, '1523142634'),
(121, 6000198, 6000165, '8.00', 1, 2, '1523142868'),
(122, 6000226, 6000165, '4.80', 2, 1, '1523143673'),
(123, 6000200, 6000165, '8.00', 1, 2, '1523144390'),
(124, 6000225, 6000165, '4.80', 2, 1, '1523148709'),
(125, 6000199, 6000165, '8.00', 1, 2, '1523148777'),
(126, 6000198, 6000165, '1.20', 1, 1, '1523149856'),
(127, 6000200, 6000165, '8.00', 1, 2, '1523149911'),
(128, 6000208, 6000203, '300.00', 3, 1, '1523151612'),
(129, 6000207, 6000203, '90.00', 3, 2, '1523151980'),
(130, 6000206, 6000203, '6.00', 2, 2, '1523155711'),
(131, 6000204, 6000203, '16.00', 1, 2, '1523163938'),
(132, 6000204, 6000203, '16.00', 1, 2, '1523164061'),
(133, 6000207, 6000203, '3.00', 3, 2, '1523170267'),
(134, 6000223, 6000203, '3.00', 4, 2, '1523171748'),
(135, 6000224, 6000165, '3.00', 2, 2, '1523184365'),
(136, 6000206, 6000203, '15.00', 2, 2, '1523185934'),
(137, 6000199, 6000165, '8.00', 1, 2, '1523203489'),
(138, 6000237, 6000163, '16.00', 1, 2, '1523239938'),
(139, 6000213, 6000203, '3.00', 4, 2, '1523240011'),
(140, 6000219, 6000203, '8.00', 1, 2, '1523245529'),
(141, 6000208, 6000203, '150.00', 3, 2, '1523250004'),
(142, 6000207, 6000203, '60.00', 3, 2, '1523250138'),
(143, 6000248, 6000245, '30.00', 3, 1, '1523257214'),
(144, 6000207, 6000203, '60.00', 3, 2, '1523259418'),
(145, 6000206, 6000203, '27.00', 2, 2, '1523269820'),
(146, 6000204, 6000203, '80.00', 1, 2, '1523277659'),
(147, 6000206, 6000203, '30.00', 2, 2, '1523278178'),
(148, 6000207, 6000203, '30.00', 3, 2, '1523283310'),
(149, 6000208, 6000203, '150.00', 3, 2, '1523285514'),
(150, 6000257, 6000163, '640.00', 1, 2, '1523327207'),
(151, 1689, 1688, '3840.00', 1, 2, '1523376180'),
(152, 1691, 1688, '20.80', 1, 1, '1523421614'),
(153, 1697, 1688, '1600.00', 1, 1, '1523442339'),
(154, 1689, 1688, '16000.00', 1, 1, '1523446694'),
(155, 1690, 1688, '28800.00', 2, 2, '1523448593'),
(156, 1692, 1688, '8250.00', 2, 1, '1523448894'),
(157, 1689, 1688, '57600.00', 1, 2, '1523449923'),
(158, 1698, 1688, '171.00', 3, 1, '1523453285'),
(159, 1695, 1688, '450.00', 3, 2, '1523453448'),
(160, 1695, 1688, '360.00', 3, 2, '1523457004'),
(161, 1695, 1688, '18.00', 3, 2, '1523491415'),
(162, 1691, 1688, '0.08', 1, 1, '1523521899'),
(163, 1691, 1688, '0.08', 1, 1, '1523522578'),
(164, 1691, 1688, '0.08', 1, 1, '1523522610'),
(165, 1691, 1688, '0.08', 1, 1, '1523522641'),
(166, 1691, 1688, '0.08', 1, 1, '1523522710'),
(167, 1691, 1688, '0.08', 1, 1, '1523522797'),
(168, 1691, 1688, '0.08', 1, 1, '1523522823'),
(169, 1691, 1688, '0.08', 1, 1, '1523522855'),
(170, 1691, 1688, '0.08', 1, 1, '1523522977'),
(171, 1716, 1688, '0.08', 1, 1, '1523526916'),
(172, 1715, 1688, '0.08', 1, 1, '1523527009'),
(173, 1716, 1688, '0.08', 1, 1, '1523527146'),
(174, 1716, 1688, '0.03', 2, 1, '1523527493'),
(175, 1716, 1688, '0.03', 2, 1, '1523527493'),
(176, 1716, 1688, '0.03', 2, 1, '1523527790'),
(177, 1716, 1688, '8.00', 2, 1, '1523531684'),
(178, 1716, 1688, '8.00', 2, 1, '1523531693'),
(179, 1716, 1688, '8.00', 2, 1, '1523531783'),
(180, 1716, 1688, '8.00', 2, 1, '1523531835'),
(181, 1690, 1688, '800.00', 2, 1, '1523538796'),
(182, 1690, 1688, '800.00', 2, 1, '1523538827'),
(183, 1690, 1688, '500.00', 2, 1, '1523539042'),
(184, 1690, 1688, '500.00', 2, 1, '1523539052'),
(185, 1690, 1688, '500.00', 2, 1, '1523539107'),
(186, 1690, 1688, '500.00', 2, 1, '1523539108'),
(187, 1690, 1688, '500.00', 2, 1, '1523539178'),
(188, 1690, 1688, '500.00', 2, 1, '1523539219'),
(189, 1690, 1688, '500.00', 2, 1, '1523539241'),
(190, 1690, 1688, '500.00', 2, 1, '1523539297'),
(191, 1690, 1688, '500.00', 2, 1, '1523539310'),
(192, 1690, 1688, '500.00', 2, 1, '1523539361'),
(193, 1690, 1688, '500.00', 2, 1, '1523539442'),
(194, 1690, 1688, '500.00', 2, 1, '1523539481'),
(195, 1690, 1688, '500.00', 2, 1, '1523539506'),
(196, 1690, 1688, '500.00', 2, 1, '1523539580'),
(197, 1690, 1688, '500.00', 2, 1, '1523539834'),
(198, 1690, 1688, '500.00', 2, 1, '1523541045'),
(199, 1690, 1688, '50.00', 2, 1, '1523542071'),
(200, 1701, 1688, '48.00', 4, 2, '1523544820'),
(201, 1705, 1688, '48.00', 8, 2, '1523545289'),
(202, 1704, 1688, '48.00', 7, 2, '1523545416'),
(203, 1691, 1688, '16.00', 1, 1, '1523545522'),
(204, 1691, 1688, '16.00', 1, 1, '1523545569'),
(205, 1691, 1688, '16.00', 1, 1, '1523545627'),
(206, 1691, 1688, '16.00', 1, 1, '1523545705'),
(207, 1691, 1688, '16.00', 1, 1, '1523545753'),
(208, 1691, 1688, '16.00', 1, 1, '1523545794'),
(209, 1691, 1688, '16.00', 1, 1, '1523545831'),
(210, 1691, 1688, '16.00', 1, 1, '1523545864'),
(211, 1691, 1688, '16.00', 1, 1, '1523545897'),
(212, 1722, 1688, '48.00', 3, 2, '1523567644'),
(213, 1698, 1688, '48.00', 3, 2, '1523571884'),
(214, 1692, 1688, '192.00', 2, 2, '1523572027'),
(215, 1693, 1688, '48.00', 3, 2, '1523573337'),
(216, 1717, 1688, '48.00', 7, 2, '1523577942'),
(217, 1702, 1688, '48.00', 5, 2, '1523578652'),
(218, 1704, 1688, '96.00', 7, 2, '1523579536'),
(219, 1689, 1688, '76800.00', 1, 2, '1523595464'),
(220, 1707, 1688, '48.00', 4, 2, '1523595942'),
(221, 1690, 1689, '76800.00', 1, 2, '1523596046'),
(222, 1690, 1688, '80.00', 2, 1, '1523599807'),
(223, 1690, 1688, '1600.00', 2, 1, '1523600415'),
(224, 1690, 1688, '80.00', 2, 1, '1523600771'),
(225, 1689, 1688, '160.00', 1, 1, '1523600857'),
(226, 1712, 1688, '48.00', 9, 2, '1523602260'),
(227, 1690, 1688, '640.00', 2, 1, '1523604216'),
(228, 1689, 1688, '2880.00', 1, 2, '1523606322'),
(229, 1690, 1688, '1.60', 2, 1, '1523629793'),
(230, 1690, 1688, '1.60', 2, 1, '1523629821'),
(231, 1705, 1688, '1.60', 8, 1, '1523629877'),
(232, 1705, 1688, '1.60', 8, 1, '1523630029'),
(233, 1705, 1691, '1.60', 7, 1, '1523630094'),
(234, 1744, 1688, '160.00', 2, 1, '1523635052'),
(235, 1744, 1688, '160.00', 2, 2, '1523635379'),
(236, 1690, 1688, '640.00', 2, 1, '1523638681'),
(237, 1690, 1688, '2560.00', 2, 2, '1523639058'),
(238, 1692, 1688, '40.00', 2, 2, '1523639423'),
(239, 1738, 1688, '3.20', 7, 1, '1523639701'),
(240, 1737, 1688, '3.20', 7, 1, '1523639739'),
(241, 1697, 1688, '16.00', 1, 1, '1523639782'),
(242, 1697, 1688, '80.00', 1, 2, '1523640194'),
(243, 1733, 1688, '3.20', 7, 1, '1523640826'),
(244, 1728, 1688, '3.20', 7, 1, '1523640875'),
(245, 1735, 1688, '3.20', 8, 1, '1523640920'),
(246, 1731, 1688, '3.20', 10, 1, '1523640971'),
(247, 1730, 1688, '3.20', 10, 1, '1523641015'),
(248, 1740, 1688, '3.20', 7, 1, '1523641066'),
(249, 1724, 1688, '3.20', 9, 1, '1523641200'),
(250, 1723, 1688, '3.20', 9, 1, '1523641247'),
(251, 1726, 1688, '3.20', 9, 1, '1523641294'),
(252, 1730, 1688, '8.00', 10, 2, '1523659046'),
(253, 1734, 1688, '3.20', 7, 1, '1523660929'),
(254, 1703, 1688, '0.96', 6, 1, '1523661995'),
(255, 1703, 1688, '8.00', 6, 2, '1523662058'),
(256, 1724, 1688, '8.00', 9, 2, '1523665751'),
(257, 1731, 1688, '8.00', 10, 2, '1523667020'),
(258, 1742, 1688, '3.20', 7, 1, '1523668180'),
(259, 1743, 1688, '3.20', 7, 1, '1523668221'),
(260, 1700, 1688, '960.00', 3, 1, '1523668667'),
(261, 1700, 1688, '3840.00', 3, 2, '1523669537'),
(262, 1745, 1688, '3.20', 3, 1, '1523672467'),
(263, 1689, 1688, '16000.00', 1, 2, '1523672935'),
(264, 1702, 1688, '2000.00', 5, 1, '1523679204'),
(265, 1702, 1688, '8000.00', 5, 2, '1523679275'),
(266, 1726, 1688, '8.00', 9, 2, '1523681838'),
(267, 1709, 1688, '8.00', 7, 2, '1523688845'),
(268, 1735, 1688, '8.00', 8, 2, '1523698217'),
(269, 1694, 1688, '4.16', 3, 1, '1523703933'),
(270, 1692, 1688, '400.00', 2, 1, '1523704039'),
(271, 1692, 1688, '1200.00', 2, 1, '1523704209'),
(272, 1708, 1688, '8.00', 4, 2, '1523704861'),
(273, 1695, 1688, '8.00', 3, 2, '1523705446'),
(274, 1723, 1688, '8.00', 9, 2, '1523707879'),
(275, 1702, 1688, '1200.00', 5, 1, '1523711000'),
(276, 1753, 1688, '3.20', 4, 1, '1523713023'),
(277, 1754, 1688, '3.20', 4, 1, '1523713056'),
(278, 1757, 1688, '3.20', 9, 1, '1523713106'),
(279, 1755, 1688, '3.20', 9, 1, '1523713152'),
(280, 1748, 1688, '3.20', 9, 1, '1523713185'),
(281, 1740, 1688, '8.00', 7, 2, '1523719557'),
(282, 1736, 1688, '8.00', 2, 2, '1523723709'),
(283, 1762, 1688, '3.20', 5, 1, '1523746675'),
(284, 1694, 1688, '8.00', 3, 2, '1523747175'),
(285, 1695, 1688, '8.00', 3, 2, '1523747212'),
(286, 1756, 1688, '3.20', 10, 1, '1523749305'),
(287, 1717, 1688, '3.20', 7, 1, '1523749334'),
(288, 1702, 1688, '4888.00', 5, 2, '1523749469'),
(289, 1769, 1688, '3.20', 4, 1, '1523749620'),
(290, 1759, 1688, '3.20', 2, 1, '1523751493'),
(291, 1759, 1688, '8.00', 2, 2, '1523752740'),
(292, 1763, 1702, '3.20', 4, 1, '1523754155'),
(293, 1717, 1702, '16.00', 2, 2, '1523755650'),
(294, 1737, 1702, '8.00', 2, 2, '1523755831'),
(295, 1762, 1688, '8.00', 5, 2, '1523761332'),
(296, 1755, 1702, '8.00', 4, 2, '1523762655'),
(297, 1756, 1702, '8.00', 5, 2, '1523764817'),
(298, 1764, 1702, '3.20', 3, 1, '1523771308'),
(299, 1765, 1702, '3.20', 3, 1, '1523771343'),
(300, 1766, 1702, '3.20', 3, 1, '1523771380'),
(301, 1767, 1702, '3.20', 3, 1, '1523771426'),
(302, 1768, 1702, '3.20', 3, 1, '1523771458'),
(303, 1770, 1702, '3.20', 3, 1, '1523771571'),
(304, 1771, 1702, '3.20', 3, 1, '1523771611'),
(305, 1772, 1702, '3.20', 3, 1, '1523771714'),
(306, 1773, 1702, '3.20', 3, 1, '1523771751'),
(307, 1777, 1702, '3.20', 3, 1, '1523771797'),
(308, 1778, 1702, '3.20', 4, 1, '1523771859'),
(309, 1775, 1702, '3.20', 3, 1, '1523772112'),
(310, 1757, 1702, '8.00', 4, 2, '1523773537'),
(311, 1777, 1702, '8.00', 3, 2, '1523775233'),
(312, 1775, 1702, '8.00', 3, 2, '1523782668'),
(313, 1754, 1688, '8.00', 4, 2, '1523786160'),
(314, 1785, 1702, '3.20', 4, 1, '1523786314'),
(315, 1779, 1702, '3.20', 4, 1, '1523786344'),
(316, 1782, 1702, '3.20', 4, 1, '1523786385'),
(317, 1786, 1702, '3.20', 4, 1, '1523786428'),
(318, 1789, 1702, '3.20', 4, 1, '1523786473'),
(319, 1774, 1702, '3.20', 5, 1, '1523786563'),
(320, 1790, 1702, '3.20', 5, 1, '1523786596'),
(321, 1787, 1702, '3.20', 5, 1, '1523786627'),
(322, 1741, 1702, '3.20', 5, 1, '1523786738'),
(323, 1792, 1702, '3.20', 5, 1, '1523786771'),
(324, 1782, 1702, '8.00', 4, 2, '1523786858'),
(325, 1701, 1688, '3.20', 4, 1, '1523787701'),
(326, 1789, 1702, '8.00', 4, 2, '1523789734'),
(327, 1792, 1702, '8.00', 5, 2, '1523794516'),
(328, 1753, 1688, '8.00', 4, 2, '1523798031'),
(329, 1779, 1702, '8.00', 4, 2, '1523799280'),
(330, 1701, 1688, '8.00', 4, 2, '1523805141'),
(331, 1807, 1702, '3.20', 3, 1, '1523831887'),
(332, 1808, 1702, '3.20', 3, 1, '1523831920'),
(333, 1809, 1702, '3.20', 3, 1, '1523831961'),
(334, 1797, 1702, '3.20', 5, 1, '1523833085'),
(335, 1796, 1702, '3.20', 5, 1, '1523833114'),
(336, 1791, 1702, '3.20', 6, 1, '1523833153'),
(337, 1803, 1702, '3.20', 4, 1, '1523833185'),
(338, 1774, 1702, '8.00', 5, 2, '1523833294'),
(339, 1701, 1688, '8.00', 4, 1, '1523833620'),
(340, 1775, 1702, '1.14', 3, 1, '1523833645'),
(341, 1717, 1702, '1.89', 2, 1, '1523833856'),
(342, 1694, 1688, '8.00', 3, 2, '1523835508'),
(343, 1800, 1702, '2.57', 4, 1, '1523837179'),
(344, 1796, 1702, '8.00', 5, 2, '1523839191'),
(345, 1797, 1702, '8.00', 5, 2, '1523839350'),
(346, 1705, 1702, '2.40', 3, 1, '1523839908'),
(347, 1790, 1702, '8.00', 5, 2, '1523839965'),
(348, 1791, 1702, '8.00', 6, 2, '1523840174'),
(349, 1816, 1702, '3.20', 2, 1, '1523845666'),
(350, 1799, 1702, '3.20', 6, 1, '1523845710'),
(351, 1806, 1702, '3.20', 6, 1, '1523845746'),
(352, 1818, 1702, '3.20', 7, 1, '1523845803'),
(353, 1819, 1702, '3.20', 7, 1, '1523845861'),
(354, 1800, 1702, '3.20', 4, 1, '1523846062'),
(355, 1801, 1702, '3.20', 4, 1, '1523846093'),
(356, 1802, 1702, '3.20', 4, 1, '1523846136'),
(357, 1804, 1702, '3.20', 4, 1, '1523846167'),
(358, 1805, 1702, '3.20', 4, 1, '1523846213'),
(359, 1785, 1702, '8.00', 4, 2, '1523857125'),
(360, 1786, 1702, '8.00', 4, 2, '1523857872'),
(361, 1787, 1702, '8.00', 5, 2, '1523860775'),
(362, 1831, 1689, '4.16', 1, 1, '1523871420'),
(363, 1831, 1689, '8.00', 1, 2, '1523871494'),
(364, 1831, 1689, '8.00', 1, 2, '1523871512'),
(365, 1705, 1702, '16.00', 3, 2, '1523877627'),
(366, 1757, 1702, '8.00', 4, 1, '1523881188'),
(367, 1818, 1702, '8.00', 7, 2, '1523886300'),
(368, 1803, 1702, '8.00', 4, 2, '1523886360'),
(369, 1799, 1702, '8.00', 6, 2, '1523891696'),
(370, 1750, 1688, '16.00', 2, 1, '1523895352'),
(371, 1825, 1702, '3.20', 6, 1, '1523895670'),
(372, 1837, 1702, '3.20', 7, 1, '1523895710'),
(373, 1822, 1702, '3.20', 3, 1, '1523895898'),
(374, 1794, 1702, '3.20', 6, 1, '1523895934'),
(375, 1812, 1702, '3.20', 3, 1, '1523895974'),
(376, 1827, 1702, '3.20', 1, 1, '1523896143'),
(377, 1841, 1689, '4.16', 2, 1, '1523896721'),
(378, 1841, 1689, '16.00', 2, 2, '1523897196'),
(379, 1712, 1702, '0.61', 4, 1, '1523916232'),
(380, 1712, 1702, '0.32', 4, 1, '1523916449'),
(381, 1712, 1702, '8.00', 4, 2, '1523916538'),
(382, 1695, 1688, '8.00', 3, 2, '1523917874'),
(383, 1843, 1702, '3.20', 4, 1, '1523918325'),
(384, 1839, 1702, '3.20', 4, 1, '1523918371'),
(385, 1811, 1702, '3.20', 4, 1, '1523918413'),
(386, 1810, 1702, '3.20', 4, 1, '1523918466'),
(387, 1798, 1702, '3.20', 4, 1, '1523918580'),
(388, 1784, 1702, '3.20', 4, 1, '1523918645'),
(389, 1781, 1702, '3.20', 4, 1, '1523918698'),
(390, 1780, 1702, '3.20', 4, 1, '1523918746'),
(391, 1847, 1702, '3.20', 4, 1, '1523918815'),
(392, 1836, 1702, '3.20', 4, 1, '1523918880'),
(393, 1835, 1702, '3.20', 4, 1, '1523918926'),
(394, 1834, 1702, '3.20', 4, 1, '1523918981'),
(395, 1833, 1702, '3.20', 4, 1, '1523919031'),
(396, 1824, 1702, '3.20', 4, 1, '1523919076'),
(397, 1799, 1702, '8.80', 6, 1, '1523919168'),
(398, 1774, 1702, '16.80', 5, 1, '1523919236'),
(399, 1797, 1702, '0.96', 5, 1, '1523921225'),
(400, 1797, 1702, '8.00', 5, 2, '1523921326'),
(401, 1736, 1688, '8.00', 2, 2, '1523922196'),
(402, 1712, 1702, '8.00', 4, 1, '1523924465'),
(403, 1731, 1702, '0.18', 5, 1, '1523926298'),
(404, 1730, 1702, '1.15', 5, 1, '1523926456'),
(405, 1819, 1702, '8.00', 7, 2, '1523928882'),
(406, 1709, 1702, '2.56', 2, 1, '1523937238'),
(407, 1837, 1702, '8.00', 7, 2, '1523938152'),
(408, 1851, 1702, '3.20', 2, 1, '1523939411'),
(409, 1853, 1702, '3.20', 4, 1, '1523939461'),
(410, 1709, 1702, '0.48', 2, 1, '1523939684'),
(411, 1709, 1702, '2.08', 2, 1, '1523940937'),
(412, 1780, 1702, '8.00', 4, 2, '1523943209'),
(413, 1706, 1702, '0.64', 4, 1, '1523953896'),
(414, 1706, 1702, '8.00', 4, 2, '1523953941'),
(415, 1854, 1702, '3.20', 8, 1, '1523956040'),
(416, 1850, 1702, '3.20', 6, 1, '1523956076'),
(417, 1855, 1702, '3.20', 8, 1, '1523956109'),
(418, 1842, 1702, '3.20', 4, 1, '1523956151'),
(419, 1852, 1702, '3.20', 4, 1, '1523956185'),
(420, 1862, 1702, '3.20', 5, 1, '1523956225'),
(421, 1815, 1702, '3.20', 4, 1, '1523956258'),
(422, 1694, 1688, '3.20', 3, 1, '1523956305'),
(423, 1693, 1688, '2.08', 3, 1, '1523956366'),
(424, 1787, 1702, '8.80', 5, 1, '1523956507'),
(425, 1791, 1702, '8.00', 6, 1, '1523957543'),
(426, 1850, 1702, '8.00', 6, 2, '1523958593'),
(427, 1741, 1702, '8.00', 5, 2, '1523966772'),
(428, 1730, 1702, '0.96', 5, 1, '1523966840'),
(429, 1695, 1688, '0.24', 3, 1, '1523967817'),
(430, 1693, 1688, '0.13', 3, 1, '1523972519'),
(431, 1822, 1702, '2.56', 3, 1, '1523973998'),
(432, 1822, 1702, '2.56', 3, 1, '1523974297'),
(433, 1693, 1688, '8.00', 3, 2, '1523974404'),
(434, 1822, 1702, '2.56', 3, 1, '1523974525'),
(435, 1822, 1702, '2.56', 3, 1, '1523974641'),
(436, 1822, 1702, '2.56', 3, 1, '1523974732'),
(437, 2088, 1689, '3200.00', 2, 1, '1523976236'),
(438, 2088, 1689, '12800.00', 2, 2, '1523976328'),
(439, 1718, 1702, '8.00', 2, 2, '1523977119'),
(440, 1848, 1702, '1.60', 6, 1, '1523978520'),
(441, 1757, 1702, '1.60', 4, 1, '1523979331'),
(442, 2088, 1689, '160.00', 2, 2, '1523981780'),
(443, 1860, 1702, '3.20', 4, 1, '1523985143'),
(444, 1865, 1702, '3.20', 2, 1, '1523985217'),
(445, 1867, 1702, '3.20', 2, 1, '1523985256'),
(446, 1872, 1702, '3.20', 2, 1, '1523985297'),
(447, 1877, 1702, '3.20', 2, 1, '1523985341'),
(448, 1866, 1702, '3.20', 3, 1, '1523985382'),
(449, 1873, 1702, '3.20', 2, 1, '1523985417'),
(450, 1870, 1702, '3.20', 2, 1, '1523985451'),
(451, 1869, 1702, '3.20', 3, 1, '1523985503'),
(452, 1874, 1702, '3.20', 2, 1, '1523985537'),
(453, 1868, 1702, '3.20', 2, 1, '1523985578'),
(454, 1879, 1702, '3.20', 3, 1, '1523985652'),
(455, 1856, 1702, '3.20', 3, 1, '1523985690'),
(456, 1788, 1702, '3.20', 3, 1, '1523985740'),
(457, 2084, 1702, '3.20', 2, 1, '1523985784'),
(458, 1863, 1702, '3.20', 9, 1, '1523986163'),
(459, 1864, 1702, '3.20', 6, 1, '1523986206'),
(460, 1871, 1702, '3.20', 8, 1, '1523986243'),
(461, 2082, 1702, '3.20', 5, 1, '1523986288'),
(462, 1853, 1702, '8.00', 4, 2, '1523994143'),
(463, 1730, 1702, '0.24', 5, 1, '1524007123'),
(464, 1731, 1702, '0.38', 5, 1, '1524007203'),
(465, 1712, 1702, '0.34', 4, 1, '1524007313'),
(466, 1731, 1702, '0.27', 5, 1, '1524007418'),
(467, 1797, 1702, '0.03', 5, 1, '1524007675'),
(468, 1796, 1702, '0.21', 5, 1, '1524007760'),
(469, 1815, 1702, '8.00', 4, 2, '1524009795'),
(470, 1704, 1702, '8.00', 2, 2, '1524012443'),
(471, 1774, 1702, '0.80', 5, 1, '1524013920'),
(472, 1848, 1702, '3.20', 6, 1, '1524027092'),
(473, 1846, 1702, '3.20', 6, 1, '1524027120'),
(474, 1844, 1702, '3.20', 5, 1, '1524027155'),
(475, 1845, 1702, '3.20', 5, 1, '1524027190'),
(476, 1825, 1702, '3.20', 6, 1, '1524027219'),
(477, 2086, 1702, '3.20', 5, 1, '1524027317'),
(478, 2085, 1702, '3.20', 5, 1, '1524027353'),
(479, 2081, 1702, '3.20', 5, 1, '1524027384'),
(480, 2099, 1702, '3.20', 3, 1, '1524027443'),
(481, 2098, 1702, '3.20', 3, 1, '1524027518'),
(482, 2095, 1702, '3.20', 5, 1, '1524027586'),
(483, 1817, 1702, '3.20', 5, 1, '1524027637'),
(484, 2091, 1702, '3.20', 2, 1, '1524027694'),
(485, 2096, 1702, '3.20', 2, 1, '1524027751'),
(486, 2105, 1702, '3.20', 3, 1, '1524028375'),
(487, 2103, 1702, '3.20', 3, 1, '1524028435'),
(488, 1879, 1702, '3.20', 3, 1, '1524028481'),
(489, 1709, 1702, '2.56', 2, 1, '1524030885'),
(490, 2104, 1702, '3.20', 5, 1, '1524042397'),
(491, 2102, 1702, '3.20', 5, 1, '1524042470'),
(492, 2106, 1702, '3.20', 4, 1, '1524042877'),
(493, 2109, 1702, '3.20', 3, 1, '1524042906'),
(494, 2110, 1702, '3.20', 3, 1, '1524042940'),
(495, 2107, 1702, '3.20', 2, 1, '1524043023'),
(496, 2111, 1702, '3.20', 3, 1, '1524043925'),
(497, 2113, 1702, '3.20', 5, 1, '1524046155'),
(498, 1859, 1702, '3.20', 4, 1, '1524047630'),
(499, 1711, 1688, '8.00', 2, 2, '1524048097'),
(500, 1693, 1688, '1.60', 3, 1, '1524051927'),
(501, 1706, 1702, '4.00', 4, 1, '1524052077'),
(502, 1693, 1688, '0.48', 3, 1, '1524052476'),
(503, 1693, 1688, '8.00', 3, 2, '1524052518'),
(504, 1705, 1702, '28.00', 3, 1, '1524052923'),
(505, 1861, 1702, '3.20', 4, 1, '1524057048'),
(506, 1730, 1702, '0.21', 5, 1, '1524059173'),
(507, 1712, 1702, '0.18', 4, 1, '1524059266'),
(508, 1741, 1702, '0.13', 5, 1, '1524059353'),
(509, 1731, 1702, '0.13', 5, 1, '1524059485'),
(510, 1712, 1702, '0.11', 4, 1, '1524059618'),
(511, 1701, 1688, '16.00', 4, 2, '1524060089'),
(512, 1704, 1702, '1.60', 2, 1, '1524060227'),
(513, 1704, 1702, '0.48', 2, 1, '1524060893'),
(514, 1704, 1702, '8.00', 2, 2, '1524060944'),
(515, 1757, 1702, '8.00', 4, 2, '1524063141'),
(516, 1774, 1702, '0.96', 5, 1, '1524063417'),
(517, 1774, 1702, '8.00', 5, 2, '1524063682'),
(518, 1848, 1702, '2.56', 6, 1, '1524064328'),
(519, 2124, 1702, '3.20', 3, 1, '1524064934'),
(520, 2123, 1702, '3.20', 3, 1, '1524064965'),
(521, 2122, 1702, '3.20', 3, 1, '1524064994'),
(522, 2120, 1702, '3.20', 3, 1, '1524065029'),
(523, 2118, 1702, '3.20', 3, 1, '1524065094'),
(524, 2116, 1702, '3.20', 3, 1, '1524065150'),
(525, 1876, 1702, '3.20', 7, 1, '1524065397'),
(526, 2128, 1702, '3.20', 2, 1, '1524065478'),
(527, 2129, 1702, '3.20', 3, 1, '1524065511'),
(528, 2130, 1702, '3.20', 5, 1, '1524065558'),
(529, 2132, 1702, '3.20', 5, 1, '1524065602'),
(530, 2114, 1702, '3.20', 7, 1, '1524065759'),
(531, 2112, 1702, '3.20', 7, 1, '1524065792'),
(532, 2094, 1702, '3.20', 5, 1, '1524065873'),
(533, 2119, 1702, '3.20', 5, 1, '1524065907'),
(534, 2117, 1688, '3.20', 5, 1, '1524065955'),
(535, 2121, 1688, '3.20', 5, 1, '1524066046'),
(536, 2127, 1688, '3.20', 5, 1, '1524066086'),
(537, 2126, 1702, '3.20', 5, 1, '1524066114'),
(538, 2125, 1702, '3.20', 5, 1, '1524066145'),
(539, 1848, 1702, '3.20', 6, 1, '1524066449'),
(540, 1846, 1702, '3.20', 6, 1, '1524066482'),
(541, 1848, 1702, '2.56', 6, 1, '1524066581'),
(542, 1784, 1702, '8.00', 4, 2, '1524082647'),
(543, 1736, 1688, '8.00', 2, 2, '1524088614'),
(544, 1702, 1688, '320.00', 5, 1, '1524088620'),
(545, 1797, 1702, '0.19', 5, 1, '1524094111'),
(546, 2102, 1702, '1.60', 5, 1, '1524098133'),
(547, 2102, 1702, '8.00', 5, 2, '1524098471'),
(548, 2102, 1702, '8.00', 5, 2, '1524098729'),
(549, 2104, 1702, '0.64', 5, 1, '1524098829'),
(550, 1709, 1702, '2.56', 2, 1, '1524105432'),
(551, 2108, 1702, '3.20', 4, 1, '1524112133'),
(552, 2131, 1702, '3.20', 4, 1, '1524112160'),
(553, 2133, 1702, '3.20', 3, 1, '1524112203'),
(554, 1861, 1702, '3.20', 4, 1, '1524112238'),
(555, 1829, 1702, '3.20', 3, 1, '1524112284'),
(556, 2138, 1702, '3.20', 4, 1, '1524112313'),
(557, 2142, 1702, '3.20', 4, 1, '1524112346'),
(558, 2143, 1702, '3.20', 3, 1, '1524112388'),
(559, 2144, 1702, '3.20', 4, 1, '1524112421'),
(560, 1709, 1702, '2.56', 2, 1, '1524115410'),
(561, 1709, 1702, '2.56', 2, 1, '1524115551'),
(562, 2147, 1702, '3.20', 3, 1, '1524116970'),
(563, 2148, 1702, '3.20', 3, 1, '1524117006'),
(564, 2149, 1702, '3.20', 4, 1, '1524117052'),
(565, 2151, 1702, '3.20', 4, 1, '1524117086'),
(566, 2146, 1702, '3.20', 3, 1, '1524117124'),
(567, 2150, 1702, '3.20', 3, 1, '1524117155'),
(568, 2153, 1702, '3.20', 3, 1, '1524117192'),
(569, 1709, 1702, '2.56', 2, 1, '1524117212'),
(570, 2150, 1702, '3.20', 3, 1, '1524117229'),
(571, 1709, 1702, '2.56', 2, 1, '1524117323'),
(572, 2152, 1702, '3.20', 4, 1, '1524117337'),
(573, 2154, 1702, '3.20', 4, 1, '1524117375'),
(574, 2155, 1702, '3.20', 3, 1, '1524117405'),
(575, 1853, 1702, '2.56', 4, 1, '1524117410'),
(576, 2150, 1702, '8.00', 3, 1, '1524117512'),
(577, 1853, 1702, '2.56', 4, 1, '1524117531'),
(578, 2152, 1702, '8.00', 4, 1, '1524117579'),
(579, 1853, 1702, '2.56', 4, 1, '1524117630'),
(580, 1853, 1702, '2.56', 4, 1, '1524117711'),
(581, 1773, 1702, '2.56', 3, 1, '1524117769'),
(582, 1773, 1702, '2.56', 3, 1, '1524117834'),
(583, 1773, 1702, '2.56', 3, 1, '1524117969'),
(584, 2154, 1702, '8.00', 4, 1, '1524118059'),
(585, 2138, 1702, '8.00', 4, 2, '1524123409'),
(586, 1731, 1702, '0.22', 5, 1, '1524124126'),
(587, 1730, 1702, '0.19', 5, 1, '1524124218'),
(588, 1712, 1702, '0.18', 4, 1, '1524124752'),
(589, 1730, 1702, '0.14', 5, 1, '1524125465'),
(590, 1741, 1702, '0.11', 5, 1, '1524125561'),
(591, 1731, 1702, '0.10', 5, 1, '1524125681'),
(592, 2143, 1702, '2.56', 3, 1, '1524130122'),
(593, 2143, 1702, '2.56', 3, 1, '1524130897'),
(594, 2143, 1702, '1.44', 3, 1, '1524131652'),
(595, 2143, 1702, '0.70', 3, 1, '1524131795'),
(596, 1777, 1702, '5.12', 3, 1, '1524132065'),
(597, 1709, 1702, '1.60', 2, 1, '1524132196'),
(598, 2143, 1702, '0.74', 3, 1, '1524132282'),
(599, 1870, 1702, '2.56', 2, 1, '1524133335'),
(600, 2133, 1702, '2.56', 3, 1, '1524133383'),
(601, 1848, 1702, '8.00', 6, 2, '1524138307'),
(602, 1695, 1688, '8.00', 3, 1, '1524143645'),
(603, 1689, 1688, '80.00', 1, 2, '1524145670'),
(604, 1709, 1702, '16.00', 2, 1, '1524146025'),
(605, 1718, 1702, '8.00', 2, 1, '1524146463'),
(606, 1745, 1688, '8.00', 3, 1, '1524146631'),
(607, 2142, 1702, '8.00', 4, 2, '1524147125'),
(608, 1740, 1702, '16.00', 2, 1, '1524147608'),
(609, 2519, 1689, '4.16', 1, 1, '1524149767'),
(610, 2519, 1689, '16.00', 1, 2, '1524149822'),
(611, 2520, 1689, '4.16', 2, 1, '1524149916'),
(612, 2520, 1689, '16.00', 2, 2, '1524150007'),
(613, 2090, 1688, '4.16', 1, 1, '1524150053'),
(614, 2090, 1688, '16.00', 1, 2, '1524150658'),
(615, 2156, 1702, '3.20', 3, 1, '1524152278'),
(616, 2158, 1702, '3.20', 4, 1, '1524152342'),
(617, 2160, 1702, '3.20', 3, 1, '1524152387'),
(618, 2157, 1702, '3.20', 4, 1, '1524152440'),
(619, 2159, 1702, '3.20', 4, 1, '1524152485'),
(620, 2161, 1702, '3.20', 4, 1, '1524152557'),
(621, 2164, 1702, '3.20', 5, 1, '1524152598'),
(622, 2168, 1702, '3.20', 5, 1, '1524152632'),
(623, 2169, 1702, '3.20', 3, 1, '1524152666'),
(624, 2170, 1702, '3.20', 3, 1, '1524152705'),
(625, 2171, 1702, '3.20', 3, 1, '1524152739'),
(626, 2176, 1702, '3.20', 3, 1, '1524152775'),
(627, 2175, 1702, '3.20', 4, 1, '1524152811'),
(628, 2177, 1702, '3.20', 4, 1, '1524152865'),
(629, 2179, 1702, '3.20', 4, 1, '1524152904'),
(630, 2181, 1702, '3.20', 4, 1, '1524152949'),
(631, 2184, 1702, '3.20', 4, 1, '1524152988'),
(632, 2185, 1702, '3.20', 4, 1, '1524153038'),
(633, 2186, 1702, '3.20', 4, 1, '1524153124'),
(634, 2188, 1702, '3.20', 4, 1, '1524153159'),
(635, 2189, 1702, '3.20', 4, 1, '1524153192'),
(636, 2190, 1702, '3.20', 4, 1, '1524153226'),
(637, 2193, 1702, '3.20', 3, 1, '1524153355'),
(638, 2210, 1702, '3.20', 4, 1, '1524153536'),
(639, 2211, 1702, '3.20', 3, 1, '1524153635'),
(640, 2209, 1702, '3.20', 5, 1, '1524153693'),
(641, 2208, 1702, '3.20', 5, 1, '1524153729'),
(642, 2207, 1702, '3.20', 5, 1, '1524153765'),
(643, 2206, 1702, '3.20', 5, 1, '1524153816'),
(644, 2205, 1702, '3.20', 5, 1, '1524153850'),
(645, 2204, 1702, '3.20', 5, 1, '1524153892'),
(646, 2203, 1702, '3.20', 5, 1, '1524153967'),
(647, 2202, 1702, '3.20', 5, 1, '1524153998'),
(648, 2201, 1702, '3.20', 5, 1, '1524154038'),
(649, 2200, 1702, '3.20', 5, 1, '1524154075'),
(650, 2198, 1702, '3.20', 5, 1, '1524154111'),
(651, 2197, 1702, '3.20', 5, 1, '1524154209'),
(652, 2196, 1702, '3.20', 5, 1, '1524154247'),
(653, 2195, 1702, '3.20', 5, 1, '1524154349'),
(654, 2192, 1702, '3.20', 5, 1, '1524154475'),
(655, 2191, 1702, '3.20', 5, 1, '1524154513'),
(656, 2168, 1702, '3.20', 5, 1, '1524154560'),
(657, 2517, 1702, '3.20', 3, 1, '1524154677'),
(658, 1875, 1702, '3.20', 8, 1, '1524154711'),
(659, 2214, 1702, '3.20', 8, 1, '1524154800'),
(660, 2515, 1702, '3.20', 4, 1, '1524154846'),
(661, 2215, 1702, '3.20', 5, 1, '1524154890'),
(662, 2141, 1702, '3.20', 3, 1, '1524154941'),
(663, 2167, 1702, '3.20', 7, 1, '1524155530'),
(664, 2215, 1702, '8.00', 5, 2, '1524176850'),
(665, 1794, 1702, '8.00', 6, 2, '1524177020'),
(666, 1775, 1702, '1.60', 3, 1, '1524177041'),
(667, 1775, 1702, '2.56', 3, 1, '1524177375'),
(668, 1775, 1702, '8.00', 3, 2, '1524177429'),
(669, 1702, 1688, '160.00', 5, 1, '1524177833'),
(670, 2161, 1702, '2.56', 4, 1, '1524182846'),
(671, 1709, 1702, '2.56', 2, 1, '1524183220'),
(672, 1709, 1702, '2.56', 2, 1, '1524187216'),
(673, 1709, 1702, '2.56', 2, 1, '1524187407'),
(674, 2161, 1702, '2.56', 4, 1, '1524192070'),
(675, 2161, 1702, '2.56', 4, 1, '1524192225'),
(676, 2161, 1702, '2.56', 4, 1, '1524192380'),
(677, 2161, 1702, '2.56', 4, 1, '1524192542'),
(678, 2161, 1702, '2.56', 4, 1, '1524192621'),
(679, 2161, 1702, '2.56', 4, 1, '1524192896'),
(680, 2161, 1702, '2.56', 4, 1, '1524192984'),
(681, 2161, 1702, '2.56', 4, 1, '1524193057'),
(682, 2161, 1702, '2.56', 4, 1, '1524193132'),
(683, 2161, 1702, '2.56', 4, 1, '1524193198'),
(684, 2161, 1702, '2.56', 4, 1, '1524193347'),
(685, 2161, 1702, '2.56', 4, 1, '1524193423'),
(686, 2161, 1702, '2.56', 4, 1, '1524193535'),
(687, 2161, 1702, '2.56', 4, 1, '1524193618'),
(688, 2161, 1702, '2.56', 4, 1, '1524196061'),
(689, 1693, 1688, '2.56', 3, 1, '1524197046'),
(690, 1693, 1688, '2.56', 3, 1, '1524197361'),
(691, 2161, 1702, '2.56', 4, 1, '1524197419'),
(692, 1800, 1702, '2.56', 4, 1, '1524197605'),
(693, 1703, 1702, '2.56', 1, 1, '1524197949'),
(694, 1717, 1702, '2.56', 2, 1, '1524198052'),
(695, 1693, 1688, '2.56', 3, 1, '1524198130'),
(696, 1706, 1702, '2.56', 4, 1, '1524198495'),
(697, 1693, 1688, '2.56', 3, 1, '1524198667'),
(698, 1800, 1702, '2.56', 4, 1, '1524198857'),
(699, 1693, 1688, '16.00', 3, 2, '1524199061'),
(700, 1693, 1688, '32.00', 3, 2, '1524199083'),
(701, 1693, 1688, '4.00', 3, 1, '1524199187'),
(702, 1747, 1688, '35.20', 2, 1, '1524200681'),
(703, 1729, 1688, '24.96', 1, 1, '1524201005'),
(704, 1747, 1688, '16.00', 2, 2, '1524201026'),
(705, 1729, 1688, '96.00', 1, 2, '1524201411'),
(706, 1693, 1688, '2.56', 3, 1, '1524201420'),
(707, 2161, 1702, '5.12', 4, 1, '1524201884'),
(708, 1703, 1702, '2.56', 1, 1, '1524201896'),
(709, 1717, 1702, '2.56', 2, 1, '1524201975'),
(710, 2524, 1702, '4.80', 3, 1, '1524204236'),
(711, 2161, 1702, '2.56', 4, 1, '1524205196'),
(712, 2524, 1702, '16.00', 3, 2, '1524206191'),
(713, 2088, 1689, '3200.00', 2, 1, '1524207964'),
(714, 2097, 1689, '1600.00', 1, 1, '1524208111'),
(715, 2097, 1689, '6400.00', 1, 2, '1524208219'),
(716, 1730, 1702, '0.11', 5, 1, '1524213236'),
(717, 1706, 1702, '2.56', 4, 1, '1524217837'),
(718, 1709, 1702, '2.56', 2, 1, '1524218471'),
(719, 1706, 1702, '2.56', 4, 1, '1524218664'),
(720, 1709, 1702, '2.56', 2, 1, '1524218870'),
(721, 1709, 1702, '2.56', 2, 1, '1524218934'),
(722, 1709, 1702, '2.56', 2, 1, '1524219078'),
(723, 1709, 1702, '2.56', 2, 1, '1524219175'),
(724, 1709, 1702, '2.56', 2, 1, '1524219227'),
(725, 1709, 1702, '2.56', 2, 1, '1524219308'),
(726, 1709, 1702, '2.56', 2, 1, '1524219425'),
(727, 1709, 1702, '2.56', 2, 1, '1524219475'),
(728, 1709, 1702, '2.56', 2, 1, '1524219519'),
(729, 1709, 1702, '2.56', 2, 1, '1524219589'),
(730, 1709, 1702, '2.56', 2, 1, '1524219652'),
(731, 1709, 1702, '2.56', 2, 1, '1524219705'),
(732, 1709, 1702, '2.56', 2, 1, '1524220073'),
(733, 1709, 1702, '2.56', 2, 1, '1524220569'),
(734, 2102, 1702, '1.47', 5, 1, '1524225209'),
(735, 1693, 1688, '24.00', 3, 2, '1524230931'),
(736, 2530, 1689, '4.16', 3, 1, '1524233725'),
(737, 2530, 1689, '16.00', 3, 2, '1524235632'),
(738, 1690, 1689, '960.00', 1, 1, '1524240389'),
(739, 1690, 1689, '4800.00', 1, 2, '1524240467'),
(740, 1690, 1689, '1280.00', 1, 1, '1524240560'),
(741, 1690, 1689, '4800.00', 1, 2, '1524240645'),
(742, 1690, 1689, '320.00', 1, 1, '1524240703'),
(743, 1690, 1689, '1600.00', 1, 2, '1524240741'),
(744, 1736, 1688, '8.00', 2, 2, '1524265832'),
(745, 1709, 1702, '2.56', 2, 1, '1524274700'),
(746, 1773, 1702, '1.60', 3, 1, '1524284427'),
(747, 1773, 1702, '0.80', 3, 1, '1524284514'),
(748, 1773, 1702, '8.00', 3, 2, '1524284532'),
(749, 1765, 1702, '3.20', 3, 1, '1524284903'),
(750, 1765, 1702, '0.96', 3, 1, '1524284945'),
(751, 1765, 1702, '16.00', 3, 2, '1524284977'),
(752, 1766, 1702, '4.16', 3, 1, '1524285183'),
(753, 1766, 1702, '16.00', 3, 2, '1524285200'),
(754, 1771, 1702, '4.16', 3, 1, '1524285380'),
(755, 1771, 1702, '16.00', 3, 2, '1524285422'),
(756, 1709, 1702, '0.35', 2, 1, '1524286034'),
(757, 1709, 1702, '168.00', 2, 2, '1524286071'),
(758, 1709, 1702, '0.01', 2, 1, '1524286509'),
(759, 1709, 1702, '0.00', 2, 1, '1524286537'),
(760, 1709, 1702, '0.01', 2, 1, '1524286593'),
(761, 1709, 1702, '0.01', 2, 1, '1524286869'),
(762, 1709, 1702, '0.01', 2, 1, '1524286938'),
(763, 1709, 1702, '0.01', 2, 1, '1524286990'),
(764, 1709, 1702, '0.01', 2, 1, '1524287036'),
(765, 1709, 1702, '0.01', 2, 1, '1524287085'),
(766, 1709, 1702, '0.01', 2, 1, '1524287133'),
(767, 1709, 1702, '0.01', 2, 1, '1524287278'),
(768, 2161, 1702, '216.00', 4, 2, '1524288190'),
(769, 1777, 1702, '24.00', 3, 2, '1524292617'),
(770, 1709, 1702, '0.01', 2, 1, '1524298621'),
(771, 1730, 1702, '8.00', 5, 2, '1524299327'),
(772, 1712, 1702, '32.00', 4, 2, '1524299375'),
(773, 3036, 1702, '4.00', 1, 1, '1524309693'),
(774, 3036, 1702, '16.00', 1, 2, '1524309765'),
(775, 3037, 1702, '4.00', 1, 1, '1524311452'),
(776, 3035, 1702, '4.00', 1, 1, '1524311492'),
(777, 3038, 1702, '4.00', 1, 1, '1524311672'),
(778, 3036, 1702, '4.00', 1, 1, '1524311701'),
(779, 3037, 1702, '16.00', 1, 2, '1524311764'),
(780, 3038, 1702, '16.00', 1, 2, '1524311877'),
(781, 3035, 1702, '16.00', 1, 2, '1524311972'),
(782, 1705, 1702, '3.20', 3, 1, '1524315647'),
(783, 1705, 1702, '0.96', 3, 1, '1524315760'),
(784, 1717, 1702, '1.92', 2, 1, '1524315843'),
(785, 1705, 1702, '8.80', 3, 1, '1524315852'),
(786, 1717, 1702, '3.31', 2, 1, '1524315936'),
(787, 1717, 1702, '2.40', 2, 1, '1524316013'),
(788, 1705, 1702, '2.56', 3, 1, '1524316054'),
(789, 1717, 1702, '7.12', 2, 1, '1524316087'),
(790, 1705, 1702, '2.56', 3, 1, '1524316145'),
(791, 1705, 1702, '2.56', 3, 1, '1524316233'),
(792, 1691, 1688, '160.00', 1, 1, '1524316369'),
(793, 1712, 1702, '0.14', 4, 1, '1524316371'),
(794, 1691, 1688, '32.00', 1, 1, '1524316449'),
(795, 1705, 1702, '2.56', 3, 1, '1524316632'),
(796, 3034, 1689, '160.00', 1, 1, '1524316747'),
(797, 1705, 1702, '2.56', 3, 1, '1524316878'),
(798, 3034, 1689, '1.60', 1, 1, '1524316909'),
(799, 3039, 1689, '160.00', 2, 1, '1524317070'),
(800, 1712, 1702, '0.05', 4, 1, '1524317579'),
(801, 1703, 1702, '2.56', 1, 1, '1524317749'),
(802, 1703, 1702, '2.56', 1, 1, '1524317811'),
(803, 1703, 1702, '2.56', 1, 1, '1524317872'),
(804, 1703, 1702, '2.56', 1, 1, '1524317921'),
(805, 1703, 1702, '2.56', 1, 1, '1524317990'),
(806, 1703, 1702, '2.56', 1, 1, '1524318041'),
(807, 1791, 1702, '32.00', 6, 2, '1524323021'),
(808, 1848, 1702, '8.00', 6, 2, '1524323534'),
(809, 1846, 1702, '8.00', 6, 2, '1524323610'),
(810, 2517, 1702, '0.08', 3, 1, '1524324319'),
(811, 1799, 1702, '40.00', 6, 2, '1524326325'),
(812, 1773, 1702, '1.92', 3, 1, '1524326629'),
(813, 1709, 1702, '1.58', 2, 1, '1524326807'),
(814, 3034, 1689, '8.00', 1, 2, '1524328261'),
(815, 3034, 1689, '32.00', 1, 1, '1524329523'),
(816, 1692, 1688, '1600.00', 2, 1, '1524340733'),
(817, 1692, 1688, '6488.00', 2, 2, '1524340837'),
(818, 1731, 1702, '0.21', 5, 1, '1524349256'),
(819, 1730, 1702, '0.21', 5, 1, '1524349335'),
(820, 1712, 1702, '0.21', 4, 1, '1524349652'),
(821, 1730, 1702, '0.16', 5, 1, '1524349797'),
(822, 1731, 1702, '0.13', 5, 1, '1524349873'),
(823, 1741, 1702, '0.11', 5, 1, '1524349966'),
(824, 1712, 1702, '0.11', 4, 1, '1524350044'),
(825, 1731, 1702, '0.10', 5, 1, '1524350163'),
(826, 1741, 1702, '0.08', 5, 1, '1524350248'),
(827, 1730, 1702, '0.06', 5, 1, '1524350313'),
(828, 1712, 1702, '0.06', 4, 1, '1524350398'),
(829, 1741, 1702, '0.05', 5, 1, '1524350455'),
(830, 2141, 1702, '8.00', 3, 2, '1524350492'),
(831, 2091, 1702, '8.00', 2, 2, '1524354725'),
(832, 1742, 1702, '8.00', 2, 2, '1524355590'),
(833, 2517, 1702, '8.00', 3, 2, '1524355910'),
(834, 1879, 1702, '24.00', 3, 2, '1524356647'),
(835, 1767, 1702, '8.00', 3, 1, '1524357596'),
(836, 1745, 1692, '8.00', 1, 2, '1524359799'),
(837, 1740, 1702, '64.00', 2, 2, '1524360756'),
(838, 1791, 1702, '0.96', 6, 1, '1524362042'),
(839, 1818, 1702, '2.56', 7, 1, '1524362712'),
(840, 1706, 1702, '0.03', 4, 1, '1524363745'),
(841, 1773, 1702, '32.00', 3, 1, '1524363894'),
(842, 1706, 1702, '0.03', 4, 1, '1524363903'),
(843, 1773, 1702, '128.00', 3, 2, '1524364009'),
(844, 1703, 1702, '32.00', 1, 2, '1524364664'),
(845, 1791, 1702, '2.56', 6, 1, '1524364699'),
(846, 1693, 1692, '8.00', 1, 2, '1524364736'),
(847, 1693, 1692, '2.70', 1, 1, '1524364914'),
(848, 1693, 1692, '8.00', 1, 2, '1524364957'),
(849, 2094, 1702, '0.11', 5, 1, '1524364974'),
(850, 1791, 1702, '16.00', 6, 2, '1524365253'),
(851, 1822, 1702, '64.00', 3, 2, '1524366489'),
(852, 1824, 1702, '8.00', 4, 2, '1524368115'),
(853, 1811, 1702, '8.00', 4, 2, '1524371127'),
(854, 1718, 1702, '32.00', 2, 2, '1524371465'),
(855, 1701, 1692, '8.00', 2, 2, '1524378041'),
(856, 1705, 1702, '0.69', 3, 1, '1524378306'),
(857, 1705, 1702, '8.00', 3, 2, '1524378355'),
(858, 1842, 1702, '8.00', 4, 2, '1524378519'),
(859, 1852, 1702, '8.00', 4, 2, '1524378761'),
(860, 1842, 1702, '0.96', 4, 1, '1524379558'),
(861, 1842, 1702, '8.00', 4, 2, '1524379636'),
(862, 1819, 1702, '2.56', 7, 1, '1524381802'),
(863, 2143, 1702, '40.00', 3, 2, '1524382407'),
(864, 1819, 1702, '2.56', 7, 1, '1524382570'),
(865, 1853, 1702, '8.00', 4, 2, '1524382584'),
(866, 1819, 1702, '24.00', 7, 2, '1524382699'),
(867, 2192, 1702, '0.88', 5, 1, '1524382822'),
(868, 1818, 1702, '8.00', 7, 2, '1524383203'),
(869, 1796, 1702, '0.21', 5, 1, '1524383577'),
(870, 1777, 1702, '0.03', 3, 1, '1524386230'),
(871, 1709, 1702, '0.19', 2, 1, '1524387229'),
(872, 1709, 1702, '0.18', 2, 1, '1524387289'),
(873, 1709, 1702, '0.18', 2, 1, '1524387337'),
(874, 1709, 1702, '0.01', 2, 1, '1524387396'),
(875, 1709, 1702, '0.01', 2, 1, '1524387440'),
(876, 1709, 1702, '0.01', 2, 1, '1524387485'),
(877, 1709, 1702, '0.01', 2, 1, '1524387625'),
(878, 1709, 1702, '0.01', 2, 1, '1524387671'),
(879, 1709, 1702, '0.01', 2, 1, '1524387724'),
(880, 1709, 1702, '0.01', 2, 1, '1524387771'),
(881, 1709, 1702, '0.01', 2, 1, '1524387826'),
(882, 1709, 1702, '0.01', 2, 1, '1524387873'),
(883, 1709, 1702, '0.01', 2, 1, '1524387990'),
(884, 1709, 1702, '0.01', 2, 1, '1524388077'),
(885, 1709, 1702, '0.01', 2, 1, '1524388125'),
(886, 1709, 1702, '0.01', 2, 1, '1524388322'),
(887, 1709, 1702, '0.01', 2, 1, '1524388373'),
(888, 1709, 1702, '8.00', 2, 2, '1524389126'),
(889, 1877, 1702, '8.00', 2, 2, '1524391385'),
(890, 2150, 1702, '56.00', 3, 2, '1524391397'),
(891, 2152, 1702, '40.00', 4, 2, '1524391479'),
(892, 2154, 1702, '40.00', 4, 2, '1524391533'),
(893, 2158, 1702, '8.00', 4, 2, '1524391596'),
(894, 1757, 1702, '32.00', 4, 2, '1524393030'),
(895, 1774, 1702, '0.96', 5, 1, '1524393269'),
(896, 1848, 1702, '32.00', 6, 2, '1524393589'),
(897, 1855, 1702, '2.56', 8, 1, '1524398290'),
(898, 1855, 1702, '16.00', 8, 2, '1524399565'),
(899, 1774, 1702, '64.00', 5, 2, '1524411583'),
(900, 1709, 1702, '16.00', 2, 2, '1524413048'),
(901, 1773, 1702, '0.05', 3, 1, '1524413249'),
(902, 1773, 1702, '0.05', 3, 1, '1524413320'),
(903, 1773, 1702, '0.05', 3, 1, '1524413383'),
(904, 1773, 1702, '0.01', 3, 1, '1524413592'),
(905, 1773, 1702, '0.01', 3, 1, '1524413706'),
(906, 1773, 1702, '0.01', 3, 1, '1524413771'),
(907, 1818, 1702, '8.00', 7, 2, '1524425487'),
(908, 1712, 1702, '0.02', 4, 1, '1524434207'),
(909, 1712, 1702, '0.04', 4, 1, '1524434279'),
(910, 1730, 1702, '0.18', 5, 1, '1524434360'),
(911, 1731, 1702, '0.14', 5, 1, '1524434457'),
(912, 1712, 1702, '0.12', 4, 1, '1524434752'),
(913, 2094, 1702, '0.03', 5, 1, '1524434798'),
(914, 1730, 1702, '0.11', 5, 1, '1524434830'),
(915, 1731, 1702, '0.09', 5, 1, '1524434947'),
(916, 2094, 1702, '0.02', 5, 1, '1524434996'),
(917, 2094, 1702, '0.05', 5, 1, '1524435144'),
(918, 1703, 1702, '16.00', 1, 2, '1524435290'),
(919, 1693, 1692, '8.00', 1, 2, '1524435396'),
(920, 1693, 1692, '2.56', 1, 1, '1524437581'),
(921, 1693, 1692, '2.56', 1, 1, '1524437681'),
(922, 1693, 1692, '24.00', 1, 2, '1524437820'),
(923, 2192, 1702, '0.54', 5, 1, '1524438806'),
(924, 1736, 1688, '8.00', 2, 2, '1524439613'),
(925, 1745, 1692, '16.00', 1, 2, '1524443645'),
(926, 1797, 1702, '0.24', 5, 1, '1524445709'),
(927, 2125, 1702, '8.00', 5, 2, '1524450504'),
(928, 2192, 1702, '0.02', 5, 1, '1524450596'),
(929, 1777, 1702, '16.00', 3, 1, '1524450910'),
(930, 1748, 1702, '8.00', 4, 2, '1524451257'),
(931, 1701, 1692, '8.00', 2, 2, '1524451484'),
(932, 1705, 1702, '0.64', 3, 1, '1524451605'),
(933, 1705, 1702, '8.00', 3, 2, '1524451655'),
(934, 1740, 1702, '2.56', 2, 1, '1524451881'),
(935, 1740, 1702, '2.56', 2, 1, '1524451960'),
(936, 2147, 1702, '2.56', 3, 1, '1524454186'),
(937, 2192, 1702, '0.01', 5, 1, '1524457579'),
(938, 2192, 1702, '0.02', 5, 1, '1524457683'),
(939, 2192, 1702, '0.02', 5, 1, '1524457755'),
(940, 2192, 1702, '0.02', 5, 1, '1524457816'),
(941, 2192, 1702, '0.02', 5, 1, '1524457871'),
(942, 2192, 1702, '0.02', 5, 1, '1524457926'),
(943, 2192, 1702, '0.02', 5, 1, '1524457976'),
(944, 1740, 1702, '2.56', 2, 1, '1524458858'),
(945, 1717, 1702, '17.60', 2, 1, '1524461853'),
(946, 1717, 1702, '72.00', 2, 2, '1524461928'),
(947, 2192, 1702, '0.02', 5, 1, '1524462383'),
(948, 2192, 1702, '0.02', 5, 1, '1524462441'),
(949, 2192, 1702, '0.02', 5, 1, '1524462500'),
(950, 2192, 1702, '0.02', 5, 1, '1524462658'),
(951, 2192, 1702, '0.02', 5, 1, '1524462750'),
(952, 2192, 1702, '0.01', 5, 1, '1524462989'),
(953, 1773, 1702, '0.01', 3, 1, '1524476804'),
(954, 1773, 1702, '0.01', 3, 1, '1524477003'),
(955, 1773, 1702, '0.01', 3, 1, '1524477049'),
(956, 1773, 1702, '0.01', 3, 1, '1524477145'),
(957, 1773, 1702, '0.01', 3, 1, '1524477200'),
(958, 1773, 1702, '0.01', 3, 1, '1524477257'),
(959, 1773, 1702, '0.01', 3, 1, '1524477332'),
(960, 1773, 1702, '0.01', 3, 1, '1524477386'),
(961, 1773, 1702, '0.01', 3, 1, '1524477432'),
(962, 1773, 1702, '0.01', 3, 1, '1524477483'),
(963, 1773, 1702, '0.01', 3, 1, '1524477528'),
(964, 1773, 1702, '0.01', 3, 1, '1524477575'),
(965, 1773, 1702, '0.01', 3, 1, '1524477680'),
(966, 3056, 1689, '1600.00', 1, 1, '1524479818'),
(967, 3056, 1689, '6400.00', 1, 2, '1524480206'),
(968, 1781, 1702, '8.00', 4, 2, '1524480673'),
(969, 3053, 1689, '32.00', 1, 2, '1524483591'),
(970, 3053, 1689, '800.00', 1, 2, '1524483755'),
(971, 3053, 1689, '520.00', 1, 2, '1524483906'),
(972, 3044, 1692, '8.00', 1, 1, '1524485329'),
(973, 3045, 1692, '800.00', 1, 1, '1524485439'),
(974, 3046, 1692, '800.00', 1, 1, '1524485544'),
(975, 3047, 1692, '800.00', 1, 1, '1524485594'),
(976, 3044, 1692, '800.00', 1, 1, '1524485634'),
(977, 1740, 1702, '2.56', 2, 1, '1524487547'),
(978, 3042, 1689, '48.00', 2, 1, '1524490358'),
(979, 3040, 1689, '16.00', 1, 1, '1524490681'),
(980, 3040, 1689, '8.00', 1, 2, '1524491318'),
(981, 3040, 1689, '8.00', 1, 2, '1524494887'),
(982, 1705, 1702, '0.08', 3, 1, '1524494892'),
(983, 1705, 1702, '0.16', 3, 1, '1524495107'),
(984, 1705, 1702, '0.32', 3, 1, '1524495398'),
(985, 1717, 1702, '0.54', 2, 1, '1524495521'),
(986, 1717, 1702, '0.27', 2, 1, '1524495588'),
(987, 1717, 1702, '0.18', 2, 1, '1524495638'),
(988, 1717, 1702, '0.04', 2, 1, '1524495698'),
(989, 1702, 1692, '294.40', 3, 1, '1524496033'),
(990, 1721, 1702, '48.00', 5, 1, '1524496344'),
(991, 1718, 1702, '16.00', 2, 1, '1524497533'),
(992, 1706, 1702, '0.18', 4, 1, '1524497706'),
(993, 2095, 1702, '8.00', 5, 1, '1524498155'),
(994, 3053, 1689, '400.00', 1, 2, '1524498665'),
(995, 1740, 1702, '32.00', 2, 1, '1524498693'),
(996, 1853, 1702, '8.00', 4, 1, '1524498758'),
(997, 1799, 1702, '32.00', 6, 1, '1524499123'),
(998, 1693, 1692, '48.00', 1, 1, '1524499319'),
(999, 1712, 1702, '0.04', 4, 1, '1524499333'),
(1000, 3042, 1689, '56.00', 2, 2, '1524499386'),
(1001, 1705, 1702, '0.40', 3, 1, '1524499624'),
(1002, 1705, 1702, '3.74', 3, 1, '1524499764'),
(1003, 1705, 1702, '0.05', 3, 1, '1524500026'),
(1004, 1740, 1702, '32.00', 2, 1, '1524500072'),
(1005, 1705, 1702, '0.05', 3, 1, '1524500155'),
(1006, 2192, 1702, '0.01', 5, 1, '1524500292'),
(1007, 2192, 1702, '0.25', 5, 1, '1524500512'),
(1008, 2192, 1702, '0.06', 5, 1, '1524500608'),
(1009, 2192, 1702, '8.00', 5, 2, '1524500663'),
(1010, 2161, 1702, '0.01', 4, 1, '1524500894'),
(1011, 1705, 1702, '32.00', 3, 1, '1524501019'),
(1012, 2161, 1702, '0.01', 4, 1, '1524501065'),
(1013, 1730, 1702, '8.00', 5, 1, '1524501114'),
(1014, 2161, 1702, '0.01', 4, 1, '1524501141'),
(1015, 2161, 1702, '0.01', 4, 1, '1524501208'),
(1016, 2161, 1702, '0.01', 4, 1, '1524501270'),
(1017, 2161, 1702, '0.01', 4, 1, '1524501335'),
(1018, 1730, 1702, '0.04', 5, 1, '1524501366'),
(1019, 2161, 1702, '0.01', 4, 1, '1524501396'),
(1020, 2161, 1702, '0.01', 4, 1, '1524501507'),
(1021, 2161, 1702, '0.01', 4, 1, '1524501568'),
(1022, 2161, 1702, '0.01', 4, 1, '1524501642'),
(1023, 2161, 1702, '0.01', 4, 1, '1524501713'),
(1024, 2161, 1702, '0.01', 4, 1, '1524501771'),
(1025, 3053, 1689, '16.00', 1, 2, '1524509790'),
(1026, 3053, 1689, '8.00', 1, 2, '1524509809'),
(1027, 3060, 1689, '80.00', 1, 1, '1524533990'),
(1028, 1843, 1702, '8.00', 4, 2, '1524534428'),
(1029, 3060, 1689, '320.00', 1, 2, '1524534478'),
(1030, 1777, 1702, '0.96', 3, 1, '1524535283'),
(1031, 1729, 1688, '8.00', 1, 2, '1524537998'),
(1032, 1811, 1702, '8.00', 4, 1, '1524540826'),
(1033, 2147, 1702, '4.80', 3, 1, '1524541322'),
(1034, 1822, 1702, '0.98', 3, 1, '1524544269'),
(1035, 3034, 1689, '8.00', 1, 2, '1524547511');

-- --------------------------------------------------------

--
-- 表的结构 `ysk_news`
--

CREATE TABLE IF NOT EXISTS `ysk_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标题',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '文章图片',
  `sort` smallint(6) NOT NULL DEFAULT '0',
  `desc` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_out` tinyint(4) NOT NULL DEFAULT '0',
  `content` text NOT NULL COMMENT '内容',
  `from` varchar(255) NOT NULL DEFAULT '' COMMENT '文章来源',
  `visit` smallint(6) NOT NULL DEFAULT '0',
  `lang` tinyint(4) NOT NULL DEFAULT '0',
  `tuijian` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统公告' AUTO_INCREMENT=100 ;

--
-- 转存表中的数据 `ysk_news`
--

INSERT INTO `ysk_news` (`id`, `title`, `image`, `sort`, `desc`, `create_time`, `is_out`, `content`, `from`, `visit`, `lang`, `tuijian`) VALUES
(86, '数字资产', '', 0, '', 1529563762, 0, '尊敬用户：由世界可可基金与美国硅谷区块链技术研发团队及新加坡ccpay共同打造的全球跨境支付平台即将启航远行，它将为全球个人及企业实现零费用跨境支付，打造了货币流通产生价值的全新金融理念，实现了无风险的金融自 由流通的目标！', '', 0, 0, 0),
(89, 'E余额转出调整公告', '', 0, '', 1529477754, 0, '于2018年5月24日起在注册送E余额期间， E余额转出调整为100或100的倍数', '', 0, 0, 0),
(91, '关于买卖公告', '', 0, '', 1529477333, 0, '全球cctoken资产用户:大家好！自美国、新加坡、马来西亚、中国社区五月十三日启动以来，陆续有台湾、香港、老挝等社区开始进入，为了保证前期平台平稳良性发展，机构决定暂不开放挂卖功能，等平台可粉数据上来后将开放此功能，另外如果有可可用户在后台创建买入（卖出）订单，又不 履行职责的恶意捣乱行为，一经对方投诉，仍不自行取消订单的，将锁定其账号！其余事宜敬请关注后续公告。', '', 0, 0, 0),
(95, '推广公告', '', 0, '', 1529563754, 0, '1为了让更多的用户可以体 验可可钱包 带来的便利，特推 出在免 费注册送388P积分的基础上每分享一位可可钱包的用户，增加赠送100P积分的活动，上至个人账号达到3000P积分封顶，活动有效期自今日起三个月内有效。&amp;nbsp;', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_notice`
--

CREATE TABLE IF NOT EXISTS `ysk_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_tittle` varchar(80) NOT NULL COMMENT '公告标题',
  `notice_content` varchar(600) NOT NULL COMMENT '公告详情',
  `notice_addtime` varchar(20) NOT NULL COMMENT '公告添加时间',
  `notice_read` text NOT NULL COMMENT '看过公告会员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `ysk_notice`
--

INSERT INTO `ysk_notice` (`id`, `notice_tittle`, `notice_content`, `notice_addtime`, `notice_read`) VALUES
(4, '4', '商品价格绝不允许高于市场价!', '1509373088', ''),
(5, '3', '消费产品由商家赠送LacpayP积分宝!', '1509373088', ''),
(6, '2', '现金支付者免费赠送Lacpay资产钱包!', '1509373088', ''),
(7, '1', '本商城所有商品接受Lacpay支付!', '1509373088', '614013096,');

-- --------------------------------------------------------

--
-- 表的结构 `ysk_nzbill`
--

CREATE TABLE IF NOT EXISTS `ysk_nzbill` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '明细id',
  `bill_uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `bill_num` decimal(10,1) NOT NULL DEFAULT '0.0' COMMENT '财富币',
  `bill_reason` char(20) NOT NULL COMMENT '生成的原因',
  `bill_time` int(11) NOT NULL DEFAULT '0' COMMENT '生成时间',
  `bill_name` varchar(50) DEFAULT NULL,
  `bill_type` char(1) NOT NULL COMMENT '0-扣除 1-获得',
  `bill_username` varchar(20) DEFAULT NULL,
  `bill_account` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bill_id`) USING BTREE,
  KEY `bill_userid` (`bill_uid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='转盘抽奖' AUTO_INCREMENT=295 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_nzletter`
--

CREATE TABLE IF NOT EXISTS `ysk_nzletter` (
  `letter_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '站内信id',
  `send_id` int(11) DEFAULT NULL COMMENT '发件人id',
  `recipient_id` int(11) DEFAULT NULL COMMENT '收件人id',
  `title` char(50) DEFAULT NULL COMMENT '信件标题',
  `content` text COMMENT '信件内容',
  `time` int(11) DEFAULT NULL COMMENT '时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '0未读，1已读',
  `img` varchar(225) NOT NULL,
  `reply` text NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `account` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`letter_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_nzusfarm`
--

CREATE TABLE IF NOT EXISTS `ysk_nzusfarm` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '农田id',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `f_id` int(10) unsigned NOT NULL COMMENT '用户自己的农田ID号 1-15',
  `farm_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '农田类型id 1普通矿车 2银矿车 3-金矿车',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '显示图片 0地 1树 2果子3死亡',
  `seeds` decimal(13,2) NOT NULL COMMENT '本金',
  `fruits` decimal(13,2) NOT NULL COMMENT '果子数量',
  `income` decimal(13,2) NOT NULL DEFAULT '0.00' COMMENT '收益累计 本金的10配枯死',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `f_id` (`f_id`) USING BTREE,
  KEY `farm_type` (`farm_type`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=2149 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_opesfarms`
--

CREATE TABLE IF NOT EXISTS `ysk_opesfarms` (
  `id` varchar(11) NOT NULL COMMENT '系统土地操作表',
  `farm_type` tinyint(1) NOT NULL COMMENT '1->鸡窝 2->果园 3->渔场',
  `from_uid` varchar(0) NOT NULL COMMENT '被操作id',
  `ope_uid` varchar(0) NOT NULL COMMENT '操作id',
  `ope_nums` decimal(11,3) NOT NULL COMMENT '操作数量',
  `ope_types` int(2) NOT NULL COMMENT '具体操作',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_opetypes`
--

CREATE TABLE IF NOT EXISTS `ysk_opetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '自己id',
  `fid` int(11) NOT NULL COMMENT '触发人id',
  `ope_nums` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '动作触发数量',
  `ope_date` date NOT NULL COMMENT '操作时间',
  `ope_type` int(2) NOT NULL COMMENT '操作类型:1开窝 2清扫 3收货 4清窝 5喂养 6挑粪 7获得风车 8获得管家 9获得专家 10购买一键挑粪 11冻结P积分',
  `ope_farm` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1鸡窝 2果园 3渔场',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_order`
--

CREATE TABLE IF NOT EXISTS `ysk_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购买商品订单id',
  `order_no` varchar(225) NOT NULL COMMENT '订单号',
  `uid` int(11) NOT NULL COMMENT '购买者id',
  `total_yf` decimal(11,1) DEFAULT NULL COMMENT '总运费',
  `buy_price` decimal(11,2) DEFAULT NULL COMMENT '购买总价',
  `time` int(11) NOT NULL COMMENT '下单时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '订单状态 0未支付 1已支付 2已发货  3交易完成(已收货)',
  `buy_name` varchar(50) NOT NULL COMMENT '收货人',
  `buy_phone` char(12) NOT NULL COMMENT '收货人手机号码',
  `buy_address` varchar(255) NOT NULL COMMENT '收货地址',
  `pay_time` int(11) DEFAULT NULL COMMENT '付款时间',
  `pay_type` varchar(20) DEFAULT '' COMMENT '支付方式 1CBDC 2微信 3支付宝 4网银',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '0-删除 1-显示 只用于客户端',
  `pay_money` decimal(11,2) DEFAULT NULL COMMENT '实际支付金额',
  `kd_name` varchar(64) DEFAULT NULL COMMENT '快递公司',
  `kd_no` varchar(30) DEFAULT NULL COMMENT '快递订单号',
  `remark` varchar(225) DEFAULT NULL COMMENT '备注',
  `trade_no` varchar(50) DEFAULT NULL COMMENT '交易订单号',
  `kd_type` varchar(66) DEFAULT NULL COMMENT '快递类型',
  `xiaofei_jifen` decimal(11,0) DEFAULT '0' COMMENT '消费P积分P积分总共可使用',
  `jifen_yu` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '渔场P积分',
  `jifen_ji` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '总共可赠送鸡场P积分',
  `jifen_guoyuan` decimal(11,0) DEFAULT '0' COMMENT '果园P积分',
  `sanji_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '订单所有可三级分销的钱',
  `is_duobao` tinyint(1) DEFAULT '1' COMMENT '1->普通订单,2->夺宝订单',
  `seluid` int(11) DEFAULT '0' COMMENT '竞标选中uid',
  `order_proof` varchar(164) DEFAULT NULL COMMENT '收款凭证',
  `order_sellerid` int(11) NOT NULL DEFAULT '0' COMMENT '商家UID',
  `order_relation` varchar(255) DEFAULT NULL COMMENT '关联订单',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='购买商品表' AUTO_INCREMENT=434 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_order_detail`
--

CREATE TABLE IF NOT EXISTS `ysk_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `com_id` int(11) NOT NULL COMMENT '商品ID',
  `com_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '商品名称',
  `com_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '购买产品价格',
  `com_num` int(11) NOT NULL COMMENT '产品数量',
  `com_img` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `com_cs` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品参数',
  `is_comment` tinyint(1) DEFAULT '0' COMMENT '是否已评论 0-未评论 1-已评论',
  `com_shoptype` int(15) DEFAULT NULL COMMENT '商品所属',
  `size` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品尺寸',
  `color` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品颜色',
  `xiaofei_jifen` decimal(50,0) NOT NULL DEFAULT '0' COMMENT '可使用消费P积分',
  `jifen_nums` decimal(11,0) DEFAULT '0' COMMENT '赠送数量(渔场鸡场果园)',
  `jifen_types` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '1-鸡场P积分,2-果园P积分,3-渔场P积分',
  `buy_num` int(11) NOT NULL DEFAULT '0' COMMENT '购买次数',
  `sanji_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品可参与三级分销的钱',
  `shangjia` int(11) NOT NULL COMMENT '商家id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `jiesuan_price` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '结算价',
  `express_order` decimal(20,0) DEFAULT NULL COMMENT '发货订单号',
  `express_name` varchar(80) CHARACTER SET utf8 DEFAULT NULL COMMENT '快递公司名称',
  `goods_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1->未付款,2->以付款,3->以发货,4-以签收',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=323 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_platforms`
--

CREATE TABLE IF NOT EXISTS `ysk_platforms` (
  `id` int(11) NOT NULL COMMENT '平台每天所有P积分总和',
  `count_time` date NOT NULL COMMENT '计算时间',
  `platform_nums` decimal(20,2) NOT NULL COMMENT '平台每天所有P积分总和(鸡场)',
  `chaifenbili_all` float(11,5) NOT NULL DEFAULT '0.00000' COMMENT '平台基础拆分率（鸡场）',
  `platform_yuchangnums` decimal(20,5) NOT NULL DEFAULT '0.00000' COMMENT '渔场建窝总P积分',
  `yuchangchaifenbili_all` float(11,5) NOT NULL DEFAULT '0.00000' COMMENT '渔场基础拆分率',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ysk_platforms`
--

INSERT INTO `ysk_platforms` (`id`, `count_time`, `platform_nums`, `chaifenbili_all`, `platform_yuchangnums`, `yuchangchaifenbili_all`) VALUES
(1, '2017-11-04', '8467578.24', 0.00044, '575120.00000', 0.00000);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_product_cate`
--

CREATE TABLE IF NOT EXISTS `ysk_product_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `tag` varchar(120) DEFAULT NULL COMMENT '标签',
  `pic` varchar(124) NOT NULL COMMENT '分类图片',
  `is_tui` tinyint(2) DEFAULT '0' COMMENT '是否推荐(0否 1是)',
  `is_hot` tinyint(2) DEFAULT '0' COMMENT '是否热门(0 否 1是)',
  `sort` tinyint(5) DEFAULT '0' COMMENT '商品排序',
  `pic1` varchar(255) DEFAULT NULL COMMENT '轮播图1',
  `pic2` varchar(255) DEFAULT NULL COMMENT '轮播图2',
  `pic3` varchar(255) DEFAULT NULL COMMENT '轮播图3',
  `pic4` varchar(255) DEFAULT NULL COMMENT '轮播图4',
  `pic5` varchar(255) DEFAULT NULL COMMENT '轮播图5',
  `ctime` varchar(11) DEFAULT NULL COMMENT '添加时间',
  `is_activity` tinyint(2) DEFAULT '0' COMMENT '是否活动0否1是',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态',
  `is_duobao` tinyint(1) NOT NULL DEFAULT '1' COMMENT '2一元夺宝分类',
  `type` int(2) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=41 ;

--
-- 转存表中的数据 `ysk_product_cate`
--

INSERT INTO `ysk_product_cate` (`id`, `pid`, `name`, `tag`, `pic`, `is_tui`, `is_hot`, `sort`, `pic1`, `pic2`, `pic3`, `pic4`, `pic5`, `ctime`, `is_activity`, `status`, `is_duobao`, `type`) VALUES
(5, 0, '服饰', 'test', '/Uploads/image/touxiang/2017-12-27/5a43124b316c1.png', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '1508125176', 0, NULL, 1, 1),
(8, 0, '餐饮', 'test', '/Uploads/image/touxiang/2017-12-27/5a43126bd052b.png', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '1508125567', 0, NULL, 1, 2),
(15, 0, '酒店', 'test', '/Uploads/image/touxiang/2017-12-27/5a43128769fdb.png', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '1508513711', 0, NULL, 1, 3),
(16, 0, '旅游', 'test', '/Uploads/image/touxiang/2017-12-27/5a4312a06ba97.png', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '1508513760', 0, NULL, 1, 4),
(22, 0, '科技', 'test', '/Uploads/image/touxiang/2017-12-27/5a4312b7ba490.png', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '1508515392', 0, NULL, 1, 5),
(23, 0, '养生', 'test', '/Uploads/image/touxiang/2017-12-27/5a4312d6381f6.png', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '1508515569', 0, NULL, 1, 6),
(24, 0, '美容', 'test', '/Uploads/image/touxiang/2017-12-27/5a4312e50c2f0.png', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '1508515811', 0, NULL, 1, 7),
(25, 0, '特产', 'test', '/Uploads/image/touxiang/2017-12-27/5a4312f3c526a.png', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '1508516000', 0, NULL, 1, 8),
(35, 0, '生鲜', NULL, '/Uploads/image/touxiang/2017-12-27/5a43131342991.png', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '1510280398', 0, NULL, 1, 9),
(36, 0, '其它', NULL, '/Uploads/image/touxiang/2017-12-27/5a431328ed687.png', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '1510280422', 0, NULL, 1, 10);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_product_detail`
--

CREATE TABLE IF NOT EXISTS `ysk_product_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `type_id` int(11) DEFAULT NULL COMMENT '类型ID',
  `name` varchar(120) NOT NULL COMMENT '商品名',
  `s_desc` text COMMENT '商品描述',
  `price` decimal(8,0) NOT NULL COMMENT '现价',
  `old_price` decimal(8,2) DEFAULT NULL COMMENT '原价',
  `buy_num` int(11) DEFAULT '0' COMMENT '付款人数',
  `pic` varchar(160) NOT NULL COMMENT '商品封面图',
  `pic1` varchar(160) DEFAULT NULL COMMENT '轮播图1',
  `pic2` varchar(160) DEFAULT NULL COMMENT '轮播图2',
  `pic3` varchar(160) DEFAULT NULL COMMENT '轮播图3',
  `pic4` varchar(160) DEFAULT NULL COMMENT '轮播图4',
  `pic5` varchar(160) DEFAULT NULL COMMENT '轮播图5',
  `freight` decimal(8,2) DEFAULT '0.00' COMMENT '运费',
  `address` varchar(50) DEFAULT NULL COMMENT '发货地址',
  `ctime` int(11) DEFAULT NULL COMMENT '添加时间',
  `is_sort` tinyint(5) DEFAULT '0' COMMENT '排序',
  `is_hot` tinyint(2) DEFAULT '1' COMMENT '是否热门',
  `color_cate` varchar(250) DEFAULT NULL COMMENT '颜色',
  `csize` varchar(250) DEFAULT NULL COMMENT '尺码',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `praise_num` int(11) DEFAULT '0' COMMENT '点赞人数',
  `content` text COMMENT '商品详情',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否启用0否1是',
  `jifen_nums` decimal(11,0) NOT NULL DEFAULT '0' COMMENT 'P积分数量',
  `jifen_type` varchar(25) DEFAULT NULL COMMENT 'P积分类型1:鸡场P积分 2:果园P积分 3:渔场P积分',
  `xiaofei_bili` int(9) DEFAULT '10' COMMENT '消费P积分使用比例',
  `is_duobao` tinyint(1) DEFAULT '1' COMMENT '1->普通商品,2->一元夺宝',
  `kaijiang_nums` int(11) DEFAULT '0' COMMENT '达到多少数量开奖',
  `sanji_use` int(8) DEFAULT '1' COMMENT '三级使用比例',
  `shangjia` int(11) NOT NULL DEFAULT '0' COMMENT '上传用户id默认为0',
  `seluid` int(11) DEFAULT NULL COMMENT '竞标选中uid',
  `count_price` decimal(11,2) DEFAULT '0.00' COMMENT '结算价格',
  `producs_pingjia` text COMMENT '商品评价',
  `gr_hot` int(1) NOT NULL DEFAULT '0' COMMENT '个人店铺-1-火热0-普通',
  `gr_new` int(1) NOT NULL DEFAULT '0' COMMENT '个人店铺-1-最新0-普通',
  `gr_tuijian` int(1) NOT NULL DEFAULT '0' COMMENT '个人店铺-1-推荐0-普通',
  `is_new` int(1) NOT NULL DEFAULT '1' COMMENT '是否最新',
  `is_tuijian` int(1) NOT NULL DEFAULT '1' COMMENT '是否推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=182 ;

--
-- 转存表中的数据 `ysk_product_detail`
--

INSERT INTO `ysk_product_detail` (`id`, `type_id`, `name`, `s_desc`, `price`, `old_price`, `buy_num`, `pic`, `pic1`, `pic2`, `pic3`, `pic4`, `pic5`, `freight`, `address`, `ctime`, `is_sort`, `is_hot`, `color_cate`, `csize`, `stock`, `praise_num`, `content`, `status`, `jifen_nums`, `jifen_type`, `xiaofei_bili`, `is_duobao`, `kaijiang_nums`, `sanji_use`, `shangjia`, `seluid`, `count_price`, `producs_pingjia`, `gr_hot`, `gr_new`, `gr_tuijian`, `is_new`, `is_tuijian`) VALUES
(73, 25, '鼎鑫胸部养护套装', NULL, '400', NULL, 0, '/Uploads/image/product/5ad07e4c9d96c.png', '/Uploads/image/product/5ad07e54cdc84.png', '/Uploads/image/product/5ad07e6112c97.png', '/Uploads/image/product/5ad07e6b2c137.png', '/Uploads/image/product/2018-02-23/5a8f94e6f3776.jpeg', '', NULL, NULL, 1519359207, 15, 1, NULL, NULL, 200, 0, '&lt;p&gt;&lt;img alt=&quot;产品介绍&quot; src=&quot;http://www.weixinfxsc.com/upload/test/20170602/1496382236863006.jpg&quot; style=&quot;-webkit-tap-highlight-color:rgba(255, 255, 255, 0); border:none; height:470px; list-style:none; margin:0px; outline:none; padding:0px; width:594.25px; word-break:break-all !important; word-wrap:break-word !important&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;鼎鑫胸部养护套装&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　疏通乳腺管，软坚散结，提升胸部结缔组织的弹性，收紧下垂肌肤，消除乳腺疾病，平衡内分泌，是胸部丰满均匀，坚实，紧挺，柔韧，保持健美形体，拥有完美曲线。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第一步：沙棘肽胸部活焕霜：取本品适量，根据使用方法说明书在保养部位进行按摩操作。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第二步：沙棘肽胸部精粹油：取本品1支，涂抹在保养部位进行按摩推拿，直至吸收。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第三步：沙棘肽胸部焕养液：取本品1支，涂抹至保养部位，用手指轻拍，直至完全吸收。&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 14, 0, '458.00', NULL, 2, 1, 2, 0, 1),
(145, 25, '鼎鑫鑫润营养片', NULL, '456', NULL, 0, '/Uploads/image/product/2018-04-14/5ad18c9419db2.png', '/Uploads/image/product/2018-04-14/5ad18c941b2d5.png', '/Uploads/image/product/2018-04-14/5ad18c941c6c1.png', '', '', '', NULL, NULL, 1523682452, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9889e0b74e.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫鑫润营养片&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要原料】：沙棘，山楂，决明子，白果，葛根，茯苓，佛手，甘草&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【相关知识】：&lt;/p&gt;\r\n\r\n&lt;p&gt;　　山楂主要成分是黄酮类物质，对心血管系统有明显的药理作用。目前，从山楂中分离的黄酮成分有30余种，主要有台罕见的黄酮苷类、黄酮醇及其苷类、双氧黄酮苷类、聚合黄酮类。另一类重要的成分是三萜类物质，强心、增加冠脉血流、预防心血管疾病，具有扩张血管、强心、增加冠脉血流量、改善心脏活力、兴奋中枢神经系统、降低血压和胆固醇、软化血管及利尿和镇静作用；防治动脉硬化，防衰老的作用。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　虫草酸&amp;mdash;&amp;mdash;能缓慢而持久地增加冠状动脉流量、对动脉血管有明显抑制胶原性血小板聚集的作用。改善血液循环、提高血液供氧能力、防止血栓、对冠心病有稳定的治疗和康复作用。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　灵芝多肽&amp;mdash;&amp;mdash;可抑制胆固醇台成过程中的酶，由此抑制胆固醇的生物合成。能程度不等的降低血清胆固醇、甘油三脂和B-脂蛋白。同时，还具有降低全血粘度和血浆粘度的作用。&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;　　【注意事项】：本品不可代替药物&lt;/strong&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 1, 1, 0, 1, 1),
(146, 25, '鼎鑫沙棘果片', NULL, '298', NULL, 0, '/Uploads/image/product/2018-04-14/5ad18d1432975.png', '/Uploads/image/product/2018-04-14/5ad18d14341e5.png', '/Uploads/image/product/2018-04-14/5ad18d14366ec.png', '/Uploads/image/product/2018-04-14/5ad18d14389ab.png', '/Uploads/image/product/2018-04-14/5ad18d143aa1f.png', '', NULL, NULL, 1523682580, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad987e4eec6c.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad987f2914aa.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad987ff9aeec.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9880c4add8.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫沙棘果片&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要原料】：沙棘&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【相关知识】：&lt;/p&gt;\r\n\r\n&lt;p&gt;　　沙棘中富含维生素C，维生素E，类胡萝卜素、多种氨基酸、有机酸、有酸、亚油酸、黄酮类化合物、磷脂类化合物、酚类化合物、甾醇类化合物、微量元素、蛋白质等人体必需的营养保健成份。沙棘籽中不饱和脂肪酸高达80%，十八种氨基酸中人体必需的八种全优，而且含量都很高，含有十二种人体必需的微量元素，其中钙、铁、锌、钾、硒的含量都较高。除此外，还含有苦木素、香豆素、白花青素、白果素、儿茶素、甜菜碱、5&amp;mdash;羟色氨等剧抗肿瘤、抗溃疡、抗炎、抗动脉硬化，抗辐射、抗衰老等方面作用的生物活性成份。沙棘神奇的抗炎、抗衰老等作用是由于沙集中多种生物活性物质的合理组配同人体的需要相适应。190多种生物活性成份居于沙棘之中，这在自然界是个奇迹。这与沙棘生长的自然环境所造就的顽强生命力及沙棘植物古老的生长历史分不开。沙棘真正是&amp;mdash;&amp;mdash;神奇的生命之果。&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;　　【注意事项】：本品不可代替药物&lt;/strong&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 1, 1, 0, 1, 1),
(147, 25, '鼎鑫沙棘油（果油）软胶囊', NULL, '399', NULL, 0, '/Uploads/image/product/2018-04-14/5ad18d486631a.png', '/Uploads/image/product/2018-04-14/5ad18d4867d75.png', '', '', '', '', NULL, NULL, 1523682632, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9877d3c35b.png&quot; style=&quot;height:333px; width:273px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫沙棘油（果油）软胶囊&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要原料】：沙棘&lt;/p&gt;\r\n\r\n&lt;p&gt;　&lt;strong&gt;　【注意事项】：本品不可代替药物&lt;/strong&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 0, 1, 0, 1, 1),
(148, 25, '鼎鑫沙棘植物盖片', NULL, '298', NULL, 0, '/Uploads/image/product/2018-04-14/5ad18dc78032b.png', '/Uploads/image/product/2018-04-14/5ad18dc781ff9.png', '/Uploads/image/product/2018-04-14/5ad18dc783fa9.png', '/Uploads/image/product/2018-04-14/5ad18dc785800.png', '', '', NULL, NULL, 1523682759, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9870eafbf4.png&quot; style=&quot;height:380px; width:411px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad98718d8fdc.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad987231ffa7.png&quot; style=&quot;height:275px; width:458px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫沙棘植物盖片&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要原料】：沙棘&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【注意事项】：本品不可代替药物&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 1, 0, 2, 1, 1),
(149, 25, '鼎鑫沙棘紫参片', NULL, '399', NULL, 0, '/Uploads/image/product/2018-04-14/5ad18e09cef4a.png', '/Uploads/image/product/2018-04-14/5ad18e09d0e5a.png', '', '', '', '', NULL, NULL, 1523682825, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9868fb7eac.png&quot; style=&quot;height:482px; width:585px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫沙棘紫参片&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要原料】：沙棘、紫苏籽、枸杞、人参、大枣、决明子&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【注意事项】：本品不可代替药物&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 0, 1, 1, 1, 1),
(150, 25, '鼎鑫沙棘虫草片', NULL, '399', NULL, 0, '/Uploads/image/product/2018-04-14/5ad18e56ae01b.png', '/Uploads/image/product/2018-04-14/5ad18e56afdbb.png', '', '', '', '', NULL, NULL, 1523682902, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9864247661.png&quot; style=&quot;height:395px; width:452px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫沙棘虫草片&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要原料】：沙棘、冬虫夏草&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【相关知识】：&lt;/p&gt;\r\n\r\n&lt;p&gt;　　冬虫夏草有&amp;ldquo;百药之王&amp;rdquo;的美称。被历代医家称为&amp;ldquo;治诸虚百损至为上品&amp;rdquo;。它性平味甘，温平无毒，具有补肺肾、治咳嗽、益虚损、养精气之功能。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　冬虫夏草的功能：&lt;/p&gt;\r\n\r\n&lt;p&gt;　　1.抗菌；2.免疫调节；3.抗炎；4.滋肾；5.提高肾上腺皮质醇含量；6.抗心律失常；7.抗疲劳；8.祛痰平喘；9.镇静催眠。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【注意事项】：本品不可代替药物&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 1, 1, 1, 1, 1),
(98, 25, '鼎鑫沙棘凝胶', NULL, '298', NULL, 0, '/Uploads/image/product/5ad07ee1a4807.png', '/Uploads/image/product/5ad07eed25d81.png', '/Uploads/image/product/5ad07ef53bfe5.png', '', '', '', NULL, NULL, 1519352900, 16, 1, NULL, NULL, 300, 0, '&lt;p&gt;&lt;img alt=&quot;产品介绍&quot; src=&quot;http://www.weixinfxsc.com/upload/test/20170602/1496381826280867.jpg&quot; style=&quot;-webkit-tap-highlight-color:rgba(255, 255, 255, 0); border:none; height:564px; list-style:none; margin:0px; outline:none; padding:0px; width:594.25px; word-break:break-all !important; word-wrap:break-word !important&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　鼎鑫沙棘凝胶&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　采用了优质原料&amp;mdash;&amp;mdash;由先进的&amp;ldquo;冷冻稳定法&amp;rdquo;从天然野生沙棘果中提炼而成，其纯净度高，能舒缓皮肤不适，保持皮肤健康，防止皮肤粗糙，增强皮肤弹性，对皮肤没有刺激性。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　沙棘凝胶中的有效成分能扩张毛细血管，促进微循环，强化细胞活力。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　沙棘凝胶内含的OPC，维生素C，维生素E，胡萝卜素等自由基的清除剂，能有效延缓皮肤细胞变老。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　沙棘凝胶内的氨基酸、维生素、矿物质、酵素、有机酸及水是皮肤必须的营养素，具有天生的收敛作用，能使皮肤坚实细致，预防皮肤松弛，有效锁住水分，抑制产生黑色素。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　缓解皮肤干性，使皱纹明显减少，皮肤变白皙。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　由杀菌功能，若有外阴瘙痒的症状，也可以用沙棘凝胶外涂。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　祛斑淡斑，在有斑的部位多做按摩，促进皮肤吸收，增强微循环，1日3次。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　保湿美白：刺激血液循环，帮助肌肤捕捉氧气，激活细胞活性，锁住水分，抑制斑点产生，美白皮肤。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　控油祛痘：平衡肌肤成分，达到水油平衡，含有的杀菌成分能抑制微生物生长，减少痘痘的再生。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　晒后修护：镇静肌肤，消除晒后不适，其修护成分能帮助皮肤提高抵御外界侵害。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　对各种皮肤病具有很好的改善及康复作用。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　适用人群广泛，大人小孩都可使用。&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 14, 0, '472.00', NULL, 2, 1, 2, 1, 1),
(99, 25, '鼎鑫沙棘油（果油）软胶囊', NULL, '399', NULL, 0, '/Uploads/image/product/5ad07c98a5d37.png', '/Uploads/image/product/5ad07ca171a81.png', '', '', '', '', NULL, NULL, 1519726589, 11, 1, NULL, NULL, 666, 0, '&lt;div&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div&gt;\r\n&lt;div&gt;\r\n&lt;p&gt;&lt;img alt=&quot;产品介绍&quot; src=&quot;http://www.weixinfxsc.com/upload/test/20170602/1496374116727380.jpg&quot; style=&quot;-webkit-tap-highlight-color:rgba(255, 255, 255, 0); border:none; height:445px; list-style:none; margin:0px; outline:none; padding:0px; width:594.25px; word-break:break-all !important; word-wrap:break-word !important&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　鼎鑫沙棘油（果油）软胶囊&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要原料】：沙棘&lt;/p&gt;\r\n\r\n&lt;p&gt;　&lt;strong&gt;　【注意事项】：本品不可代替药物&lt;/strong&gt;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 14, 0, '304.00', NULL, 2, 1, 2, 1, 1),
(97, 25, '鼎鑫沙棘逆颜水凝蚕丝面膜', NULL, '399', NULL, 0, '/Uploads/image/product/5ad07f4bd8065.png', '/Uploads/image/product/5ad07f52c1239.png', '/Uploads/image/product/5ad07f6294cbb.png', '', '', '', NULL, NULL, 1519269011, 17, 1, NULL, NULL, 400, 0, '&lt;div&gt;\r\n&lt;div&gt;\r\n&lt;p&gt;&lt;img alt=&quot;产品介绍&quot; src=&quot;http://www.weixinfxsc.com/upload/test/20170602/1496382489862250.jpg&quot; style=&quot;-webkit-tap-highlight-color:rgba(255, 255, 255, 0); border:none; height:486px; list-style:none; margin:0px; outline:none; padding:0px; width:594.25px; word-break:break-all !important; word-wrap:break-word !important&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;鼎鑫沙棘逆颜水凝蚕丝面膜&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　本品使用100%真蚕丝做贴膜，并且同时蕴含当今全球最具影响力的四大肌肤改善成分：&lt;/p&gt;\r\n\r\n&lt;p&gt;　　1、沙棘萃取精华&amp;ldquo;OPCs（逆生长基础因子）：肌肤逆生长的基质&amp;rdquo;。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　2、&amp;ldquo;NMF&amp;amp;HA（天然保湿因子）：肌肤逆生长的天然水源&amp;rdquo;。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　3、&amp;ldquo;SACA（强力抗氧化细胞活化促进因子）： 肌肤逆生长的工程师&amp;rdquo;。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　4、&amp;ldquo;EGF（美丽因子）：肌肤逆生长的&amp;ldquo;真命&amp;rdquo;美容天使&amp;rdquo;。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要功效】：清透亮颜，滋养肌肤，改善肌肤光泽，娇细柔嫩，保持肌肤活力，使肌肤光滑细腻。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【使用方法】：洁肤后，先将法国海洋之谜羽丝缕面膜兰色无纺布揭掉，将中间层的面膜直接敷在面部并轻按压，再将有孔珍珠膜揭掉，20分钟左右取下即可，并把残留精华液轻按摩至吸收；每天使用效果更佳。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【注意事项】：每个人的肤质各不相同，建议使用前先进行局部的皮肤测试。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 14, 0, '544.00', NULL, 2, 1, 2, 1, 1),
(96, 25, '鼎鑫沙棘果油（精油）', NULL, '399', NULL, 0, '/Uploads/image/product/5a8bad158056f.jpg', '/Uploads/image/product/5ad0775e3aff1.png', '', '', '', '', NULL, NULL, 1519103413, 0, 0, NULL, NULL, 998, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad98bd10382c.png&quot; style=&quot;height:360px; width:230px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫沙棘果油（精油）&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要原料】：沙棘&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【使用方法】：早晚空腹1到2毫升，含服。 也可外用，涂抹于作用部位，轻轻按摩至吸收。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【注意事项】：本品不可代替药物&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 0, 0, '0.00', NULL, 2, 2, 2, 1, 0),
(115, 25, '鼎鑫天然沙棘手工精油皂', NULL, '298', NULL, 0, '/Uploads/image/product/5a979a182e658.jpg', '/Uploads/image/product/5ad077ed62da7.png', '', '', '', '', NULL, NULL, 1519884843, 3, 1, NULL, NULL, 99, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad98f66c0aa9.png&quot; style=&quot;height:278px; width:286px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫天然沙棘手工精油皂&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　本品由沙棘油、沙棘OPC、椰子油、甜杏仁油、甘油等多种食用级的特种营养植物油原料，及天然沙棘精油、玫瑰精油、柠檬精油等制成的含有天然植物芳香烃的天然植物精油皂。天然沙棘手工精油皂不添加任何防腐剂，表面活性剂等化学成分，是一种非常安全而有效的皮肤清洁及美容产品，低温制作，甘油不会流失，除了细腻的清洁效果，还能呵护滋润皮肤，不会对皮肤造成负担，还能具有精油的养护效果，比市面上常用的洗面奶效果好，而且安全。天然沙棘手工精油皂能提供非常高的保湿效能，同时也能够更深层清洁肌肤，给予肌肤最健康自然的呵护。并富有轻柔、清新的植物香氛，使人如沐大自然的海洋。天然沙棘手工精油皂适用所有肤质，尤其是干燥或任何敏感红肿和发炎皮肤。主要成分沙棘OPC具有强壮和收缩微血管的效果， 对老化皮肤有极佳的回春作用。抚平情绪，沮丧、哀伤、妒忌和憎恶的时候，提振心情，舒缓神经紧张和压力，能使女人对自我产生积极、正面的感受。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　天然沙棘手工精油皂含丰富的维生素C，特别有益于美白、收敛、平衡油脂、治疗青春痘等油性皮肤症状。其味道清新甜美，对于季节转化，肌肤极容易出现的问题，洗洗都能轻松解决，让您恢复亮白娇嫩肌肤，充满自信。&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 0, 0, '0.00', NULL, 0, 0, 0, 1, 0),
(117, 25, '鼎鑫洛神营养片', NULL, '499', NULL, 0, '/Uploads/image/product/5ad07c2b90ee5.png', '/Uploads/image/product/5ad07c3214998.png', '/Uploads/image/product/5ad07c37b6d22.png', '', '', '', NULL, NULL, 1519980205, 10, 1, NULL, NULL, 100, 0, '&lt;p&gt;&lt;img alt=&quot;产品介绍&quot; src=&quot;http://www.weixinfxsc.com/upload/test/20170602/1496375303963782.jpg&quot; style=&quot;-webkit-tap-highlight-color:rgba(255, 255, 255, 0); border:none; height:445px; list-style:none; margin:0px; outline:none; padding:0px; width:594.25px; word-break:break-all !important; word-wrap:break-word !important&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;鼎鑫洛神营养片&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要原料】：白芷、菊花、甘草、枸杞、桃仁、决明子、向日葵花粉、茯苓、黄精、牡蛎&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【相关知识】：&lt;/p&gt;\r\n\r\n&lt;p&gt;　　白芷&amp;mdash;&amp;mdash;祛风解表、散寒止痛、除湿通窍、消肿排脓。可改善人体微循环，促进皮肤新陈代谢，消除色素在组织中过度堆积。《神农本草经》指出白芷：&amp;ldquo;长肌肤。润泽颜色，可作面脂。&amp;rdquo;无论是&amp;ldquo;干金面脂方&amp;rdquo;，或是慈禧太后的驻颜宫廷秘方&amp;ldquo;玉容散&amp;rdquo;，白芷都是制作面脂的主要原料。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　菊花&amp;mdash;一菊花能增强谷胱甘脑过氧化降低，具有清除自由基的能力，专家研究则发现，菊花提取物对生物膜的超氧阴离子自由基损伤具有明显保护作用，主要是通过直接进入细胞障的甘油酯后而起保护作用。这一新的发现使菊花有望开发成为新的功能性食品，尤其在抗衰老食品中发挥其作用。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　女人衰老的机理无外乎阴阳失衡，气血失和，气机升降出入失常，脏腑功能失调。肥胖、便秘、色斑、口臭、体臭、高血脂等疾病时有发生，如果加上心理负担，则机体衰老就会加速。女人要学会关爱自己，遁畅身体，从而通畅心理，定期的排出体内毒素，调整机体状态无疑会为今天的美丽和明日的健康打下坚实的基础。&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;　　【注意事项】：本品不可代替药物&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 14, 0, '0.00', NULL, 1, 1, 1, 1, 1),
(141, 25, '鼎鑫沙棘【OPC】片', NULL, '399', NULL, 0, '/Uploads/image/product/2018-04-14/5ad18b22c4250.png', '/Uploads/image/product/2018-04-14/5ad18b22c59d0.png', '/Uploads/image/product/2018-04-14/5ad18b22c7254.png', '', '', '', NULL, NULL, 1523682082, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad98a08dde72.png&quot; style=&quot;height:255px; width:250px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad989ddeb147.png&quot; style=&quot;height:435px; width:197px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫沙棘【OPC】片&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要原料】：沙棘原花青素（OPC）&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【相关知识】：&lt;/p&gt;\r\n\r\n&lt;p&gt;　　沙棘原花青素能促进细胞新陈代谢，抑制组胺产生，减轻炎症，愈合胃肠溃疡，具有较强的消炎促进新生的功能；深入脾胃，滋补肾脏，促进肠胃消化食物，吸收养分，滋阴补阳。通过肾及内分泌系统的调控作用，改善新陈代谢，生发五脏元气，推动全身血脉正常运行。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　其次，沙棘原花青素清除自由基、消除血液垃圾，清除五脏和血液中残留的甘油三酯、胆固醇、自由基、血毒、药毒等多种人体垃圾，祛除淤血，改善身体的血瘀状态。同时，原花青素还改善毛细血管状态，增强动脉、静脉、毛细血管的弹性，增强流向心脑的血液循环，元气旺盛，血液动力足，身体血瘀不再有。&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;　　【注意事项】：本品不可代替药物&lt;/strong&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 1, 0, 0, 1, 1),
(119, 25, '鼎鑫沙棘虫草片', NULL, '399', NULL, 0, '/Uploads/image/product/5a9937f666cb0.jpg', '/Uploads/image/product/5ad0850bc7077.png', '', '', '', '', NULL, NULL, 1519990780, 32, 1, NULL, NULL, 191, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad98b85f320e.png&quot; style=&quot;height:394px; width:440px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫沙棘虫草片&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要原料】：沙棘、冬虫夏草&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【相关知识】：&lt;/p&gt;\r\n\r\n&lt;p&gt;　　冬虫夏草有&amp;ldquo;百药之王&amp;rdquo;的美称。被历代医家称为&amp;ldquo;治诸虚百损至为上品&amp;rdquo;。它性平味甘，温平无毒，具有补肺肾、治咳嗽、益虚损、养精气之功能。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　冬虫夏草的功能：&lt;/p&gt;\r\n\r\n&lt;p&gt;　　1.抗菌；2.免疫调节；3.抗炎；4.滋肾；5.提高肾上腺皮质醇含量；6.抗心律失常；7.抗疲劳；8.祛痰平喘；9.镇静催眠。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【注意事项】：本品不可代替药&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 0, 0, '0.00', NULL, 0, 0, 0, 0, 1),
(124, 25, '褚酒庄园坛装酒4.5L（弥勒坛）', NULL, '6999', NULL, 0, '/Uploads/image/product/2018-04-13/5ad0107a2380d.jpg', '/Uploads/image/product/2018-04-13/5ad013cf246ee.png', '/Uploads/image/product/2018-04-13/5ad013cf263d2.png', '/Uploads/image/product/2018-04-13/5ad04fd856188.png', '', '', NULL, NULL, 1523694090, 0, 1, NULL, NULL, 100000, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95da331554.jpg&quot; style=&quot;height:890px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95dacd8a0b.jpg&quot; style=&quot;height:975px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95db77c44b.jpg&quot; style=&quot;height:1087px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95dbfba361.jpg&quot; style=&quot;height:1029px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95dcca1ece.jpg&quot; style=&quot;height:1034px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95dd5916e2.jpg&quot; style=&quot;height:854px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95de30542e.jpg&quot; style=&quot;height:888px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95df2156cc.jpg&quot; style=&quot;height:498px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95e00af8c0.jpg&quot; style=&quot;height:487px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95e09f2fac.jpg&quot; style=&quot;height:867px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95e13dd4df.jpg&quot; style=&quot;height:512px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95e20afffc.jpg&quot; style=&quot;height:632px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95e2b4040b.jpg&quot; style=&quot;height:508px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95e3650c1d.jpg&quot; style=&quot;height:599px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95e3fbf36c.jpg&quot; style=&quot;height:594px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95e4b8ec9e.jpg&quot; style=&quot;height:599px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95e56c5ca4.jpg&quot; style=&quot;height:594px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95e616386c.jpg&quot; style=&quot;height:650px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95e6a94f00.jpg&quot; style=&quot;height:607px; width:732px&quot; /&gt;&lt;/p&gt;\r\n', NULL, '1', '', NULL, 1, NULL, NULL, 1724, 0, '0.00', NULL, 1, 2, 2, 1, 1),
(125, 25, '【褚韵52°】500ml', NULL, '1588', NULL, 0, '/Uploads/image/product/2018-04-13/5ad0560a48fe8.png', '/Uploads/image/product/2018-04-13/5ad0277a4759f.png', '/Uploads/image/product/2018-04-13/5ad0560a4ba47.png', '/Uploads/image/product/2018-04-13/5ad0560a4e201.png', '', '', NULL, NULL, 1523694665, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95bf7c6289.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95c100773d.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95c27cbe48.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95c3507169.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95c4125ea9.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95c534f5e0.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95c6231e20.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95c6bc8b37.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95cb433580.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95cc1bb864.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95cc9957d1.jpg&quot; style=&quot;height:898px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95cd6b18a2.jpg&quot; style=&quot;height:846px; width:732px&quot; /&gt;&lt;/p&gt;\r\n', NULL, '1', '', NULL, 1, NULL, NULL, 1724, 0, '0.00', NULL, 1, 0, 0, 1, 1),
(126, 25, '褚酒庄园系列产品代理权', NULL, '5000', NULL, 0, '/Uploads/image/product/2018-04-13/5ad02ae1805aa.png', '/Uploads/image/product/2018-04-13/5ad02ae1825ab.png', '/Uploads/image/product/2018-04-13/5ad02ae18444d.png', '', '', '', NULL, NULL, 1523694727, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad95b487d72c.png&quot; style=&quot;height:736px; width:538px&quot; /&gt;&lt;/p&gt;\r\n', NULL, '1', '', NULL, 1, NULL, NULL, 1724, 0, '0.00', NULL, 1, 0, 0, 1, 1),
(127, 25, '褚酒庄园坛装酒1.5L（褚坛）', NULL, '3999', NULL, 0, '/Uploads/image/product/2018-04-13/5ad02beab2727.png', '/Uploads/image/product/2018-04-13/5ad02beab46f3.png', '/Uploads/image/product/2018-04-13/5ad02beab5e2e.png', '/Uploads/image/product/2018-04-13/5ad05105caee9.png', '', '', NULL, NULL, 1523697334, 0, 1, NULL, NULL, 873, 0, '\r\n&lt;div&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2018/03/25/FlR_HLRbNCUeV-zSPZomWTZsGR4x.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2018/03/25/FpjSbTA80bkHWROWoalMAoSayMDY.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2018/03/25/FnGx6FIPMWZsNJxpQ4OyWYwifZy2.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2018/03/25/FqyoTkZmobgKnwZYl3OZbhDR8xVr.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;/div&gt;\r\n\r\n&lt;div&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2018/03/25/Fr9JIdiiC7hkA5-AOx8K23cdZs7V.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2018/03/25/FuLS-wfQ9plnSKfhAu_vkn7TAW2_.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2018/03/25/FlBhpPsTSX_mAeIEh0E9cmBUll5r.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2018/03/25/FuJ1d9xs_9TERJpIUQqkU77DxISy.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;/div&gt;\r\n\r\n&lt;div&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2018/03/25/Fn4pxq73Q6FK430fqukZhPxxde_W.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2018/03/25/Fs7xCy8rbCSIHhx0AvyN7QI0nNJm.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2018/03/25/FpUr2awA-QSCiqJhQToWHOEtmVLv.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2018/03/25/Fsdi5Id8RzhrJhsn99KNcC1jmuXe.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;/div&gt;\r\n\r\n&lt;div&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2018/03/25/FsQo8y7UMygy3ZP_6bpmTMtodWDr.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2018/03/25/FsxRvqGaHLfx5c9yNXlSxGlc-Ta9.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2018/03/25/FunvBSVIBd0_FUayzGF50uTx9I6d.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2018/03/25/FnpQuxcqzY6XYs7Z2ZKNwZb-6jEe.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;/div&gt;\r\n\r\n&lt;div&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2018/03/25/Fhs7MSF2uPoPo39fW4sTJYHy5hSW.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;/div&gt;\r\n\r\n\r\n', NULL, '1', '', NULL, 1, NULL, NULL, 1724, 0, '0.00', NULL, 1, 2, 1, 0, 1);
INSERT INTO `ysk_product_detail` (`id`, `type_id`, `name`, `s_desc`, `price`, `old_price`, `buy_num`, `pic`, `pic1`, `pic2`, `pic3`, `pic4`, `pic5`, `freight`, `address`, `ctime`, `is_sort`, `is_hot`, `color_cate`, `csize`, `stock`, `praise_num`, `content`, `status`, `jifen_nums`, `jifen_type`, `xiaofei_bili`, `is_duobao`, `kaijiang_nums`, `sanji_use`, `shangjia`, `seluid`, `count_price`, `producs_pingjia`, `gr_hot`, `gr_new`, `gr_tuijian`, `is_new`, `is_tuijian`) VALUES
(128, 25, '【褚源52°】500ml', NULL, '868', NULL, 0, '/Uploads/image/product/2018-04-13/5ad049a4bb2ed.png', '/Uploads/image/product/2018-04-13/5ad049a4bcd6e.png', '/Uploads/image/product/2018-04-13/5ad055eadd516.png', '/Uploads/image/product/2018-04-13/5ad055eadf820.png', '', '', NULL, NULL, 1523695512, 0, 1, NULL, NULL, 888, 0, '&lt;div&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FiOunfIE32vLIsCcu8CSPa6pCNuw.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FhB2cOEWjEoKzYnqX_t0HclUyQbP.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FjddrJcQZwtpKmMVqCpKKcKUNS-a.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FlDNPpIMavG5No32KBxSs5yrAiYC.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;/div&gt;\r\n\r\n&lt;div&gt;\r\n&lt;div&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/Fl0gkhIRl_E2EHXJ2hl--5un-HzS.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FqPiVluVDisuZlM-PHnzxfLIOjpO.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FhZ_yZKDKr6XsXr-SOK6rGw0yDO-.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FiGhmAj3pSftqTj2fHzIBnfO_bJI.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;/div&gt;\r\n\r\n&lt;div&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FhozRasudsJopYatllpOVnpx-wxV.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/Fjh4r1nQvTrj0Kndv5Ztnrz2bD6Z.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FpVlxW__HCYFSoLYfkksqO_8CiK4.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FksJrE0nXcaF8MdtuE1QsOOSiS8b.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;/div&gt;\r\n\r\n&lt;div&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/Fh5tQkDHqsMNiUA5ZCAI1QkCWEdE.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n', NULL, '1', '', NULL, 1, NULL, NULL, 1724, 0, '0.00', NULL, 1, 2, 0, 1, 1),
(129, 25, '【褚马】500ml 整箱装（六瓶）', NULL, '748', NULL, 0, '/Uploads/image/product/2018-04-13/5ad04a87597a7.png', '/Uploads/image/product/2018-04-13/5ad04a875bc8d.png', '/Uploads/image/product/2018-04-13/5ad054cbe5c7f.png', '/Uploads/image/product/2018-04-13/5ad054cbe7b02.png', '', '', NULL, NULL, 1523695722, 0, 1, NULL, NULL, 888, 0, '&lt;div&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FpJf1k2AHf0J3oxrDxvVcO0dHWYJ.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/Flbo5vd7vE29fs3qra8-04APpTGr.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FiUhcvXKIAmn_2CC9f_SF7eIqfJk.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FtptcfvkJViFGAGmdiDkt_ICSF0O.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;/div&gt;\r\n\r\n&lt;div&gt;\r\n&lt;div&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/Ft1-U0kxkgoNf9A9J1H2U0prH5Ly.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FqlEcD_6TQXgwscHLkeRqwnUrc_T.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FsbYwUo8gD6YUPh8WtBlSwLHilDN.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FtaMcp1LzVXGiWnOfhEGibeWNQql.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;/div&gt;\r\n\r\n&lt;div&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FofozXqpj591gk722cDrGSd-m1t0.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FpTvEWWLUc6hPQCdr845gxFBN8-n.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/Fssz8MfTEtikfcw4BQSednGf6DOf.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FucP1wV_4-urzjj6m2ZiKywGdEPT.jpg?imageView2/2/w/730/h/0/q/75/format/webp&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n', NULL, '1', '', NULL, 1, NULL, NULL, 1724, 0, '0.00', NULL, 1, 0, 0, 1, 1),
(130, 25, '【褚韵52°】500ml 礼品装（一对）', NULL, '529', NULL, 0, '/Uploads/image/product/2018-04-13/5ad04bcc1db27.png', '/Uploads/image/product/2018-04-13/5ad04bcc2012a.png', '/Uploads/image/product/2018-04-13/5ad04d03aef05.png', '/Uploads/image/product/2018-04-13/5ad04d03b147f.png', '', '', NULL, NULL, 1523695930, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9689e91d4d.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad968b243501.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad968bbbd77c.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad968c57d317.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad968cd8aebd.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad968d7d979a.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad968e12d20c.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad968eb67bb4.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad968f53b34d.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9690189298.jpg&quot; style=&quot;height:898px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9690b14189.jpg&quot; style=&quot;height:846px; width:732px&quot; /&gt;&lt;/p&gt;\r\n', NULL, '1', '', NULL, 1, NULL, NULL, 1724, 0, '0.00', NULL, 2, 1, 0, 1, 1),
(169, 25, '褚酒庄园系列产品代理权', NULL, '5000', NULL, 0, '/Uploads/image/product/5ad40fa58ae29.png', '/Uploads/image/product/5ad4060722ef6.png', '', '', '', '', NULL, NULL, 1523844645, 0, 0, NULL, NULL, 88, 0, '&lt;p&gt;&lt;span style=&quot;background-color:rgb(248, 248, 248); font-size:16px&quot;&gt;详情咨询微信：15687722658&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad992c283c49.png&quot; style=&quot;height:701px; width:520px&quot; /&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 0, NULL, '0.00', NULL, 0, 0, 0, 1, 0),
(168, 25, '【褚马】500ml 礼品装（一对）', NULL, '248', NULL, 0, '/Uploads/image/product/5ad411c43dd20.png', '/Uploads/image/product/5ad4086a160a4.png', '/Uploads/image/product/5ad40871c4dbb.png', '/Uploads/image/product/5ad40879afca3.png', '/Uploads/image/product/5ad4088000ae7.png', '', NULL, NULL, 1523844280, 23, 0, NULL, NULL, 997, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad993920a825.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9939b6ae9a.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad993ab93c2b.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad993b478898.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad993becd7cb.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad993c9a808e.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad993d3624e5.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad993dd44e5f.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad993e883d74.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad993f71afa7.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9940938e0b.jpg&quot; /&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 0, NULL, '0.00', NULL, 0, 0, 0, 1, 1),
(131, 25, '【褚源52°】500ml 礼品装（一对）', NULL, '289', NULL, 0, '/Uploads/image/product/2018-04-13/5ad04c672e543.png', '/Uploads/image/product/2018-04-13/5ad04c6744422.png', '/Uploads/image/product/2018-04-13/5ad05213c2730.png', '/Uploads/image/product/2018-04-13/5ad05213c4fc3.png', '/Uploads/image/product/2018-04-13/5ad04c6748f70.png', '', NULL, NULL, 1523696409, 0, 1, NULL, NULL, 867, 0, '&lt;div&gt;\r\n&lt;div&gt;\r\n&lt;div&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FiOunfIE32vLIsCcu8CSPa6pCNuw.jpg?imageView2/2/w/730/h/0/q/75/format/jpg&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FhB2cOEWjEoKzYnqX_t0HclUyQbP.jpg?imageView2/2/w/730/h/0/q/75/format/jpg&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FjddrJcQZwtpKmMVqCpKKcKUNS-a.jpg?imageView2/2/w/730/h/0/q/75/format/jpg&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FlDNPpIMavG5No32KBxSs5yrAiYC.jpg?imageView2/2/w/730/h/0/q/75/format/jpg&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div&gt;\r\n&lt;div&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/Fl0gkhIRl_E2EHXJ2hl--5un-HzS.jpg?imageView2/2/w/730/h/0/q/75/format/jpg&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FqPiVluVDisuZlM-PHnzxfLIOjpO.jpg?imageView2/2/w/730/h/0/q/75/format/jpg&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FhZ_yZKDKr6XsXr-SOK6rGw0yDO-.jpg?imageView2/2/w/730/h/0/q/75/format/jpg&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FiGhmAj3pSftqTj2fHzIBnfO_bJI.jpg?imageView2/2/w/730/h/0/q/75/format/jpg&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;/div&gt;\r\n\r\n&lt;div&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FhozRasudsJopYatllpOVnpx-wxV.jpg?imageView2/2/w/730/h/0/q/75/format/jpg&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/Fjh4r1nQvTrj0Kndv5Ztnrz2bD6Z.jpg?imageView2/2/w/730/h/0/q/75/format/jpg&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FpVlxW__HCYFSoLYfkksqO_8CiK4.jpg?imageView2/2/w/730/h/0/q/75/format/jpg&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/FksJrE0nXcaF8MdtuE1QsOOSiS8b.jpg?imageView2/2/w/730/h/0/q/75/format/jpg&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;/div&gt;\r\n\r\n&lt;div&gt;&lt;img class=&quot;js-lazy&quot; src=&quot;https://img.yzcdn.cn/upload_files/2017/12/08/Fh5tQkDHqsMNiUA5ZCAI1QkCWEdE.jpg?imageView2/2/w/730/h/0/q/75/format/jpg&quot; style=&quot;-webkit-tap-highlight-color:transparent; border:0px; display:inline-block; font-family:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; font-weight:inherit; height:auto; line-height:inherit; margin:0px; max-height:100%; max-width:100%; padding:0px; vertical-align:middle; width:auto&quot; /&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n', NULL, '1', '', NULL, 1, NULL, NULL, 1724, 0, '0.00', NULL, 2, 0, 1, 1, 1),
(132, 25, '【褚马】500ml ', NULL, '529', NULL, 0, '/Uploads/image/product/5ad071c328506.png', '/Uploads/image/product/5ad071cc8709f.png', '/Uploads/image/product/5ad071da6f242.png', '', '', '', NULL, NULL, 1523600958, 3, 1, NULL, NULL, 992, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad996b1db9dc.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad996bd587ca.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad996c6d15a7.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad996d486910.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad996e30a02a.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad996f0204d5.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad996fb79b55.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9970b2823f.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad99717cb009.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad99725446c8.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9973520353.jpg&quot; /&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 0, NULL, '0.00', NULL, 0, 0, 0, 0, 1),
(174, 16, '电饭锅', '&lt;p&gt;的方法大概发广告防守打法&lt;/p&gt;', '5756', '0.00', 0, '/Uploads/image/product/2018-04-23/5add4076db4df.JPG', '/Uploads/image/product/2018-04-23/5add4076dc8a9.JPG', NULL, NULL, NULL, NULL, '0.00', NULL, 1524449398, 0, 1, '', '', 53, 0, NULL, 0, '66', NULL, 10, 1, 0, 1, 1710, NULL, '0.00', NULL, 1, 2, 2, 1, 1),
(133, 25, '鼎鑫沙棘【OPC】片', NULL, '399', NULL, 0, '/Uploads/image/product/5ad08434b0dd3.png', '/Uploads/image/product/5ad481dd69020.png', '', '', '', '', NULL, NULL, 1523601040, 2, 1, NULL, NULL, 4519, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad98b15a86b7.png&quot; style=&quot;height:255px; width:250px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad98b44ab216.png&quot; style=&quot;height:435px; width:197px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫沙棘【OPC】片&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要原料】：沙棘原花青素（OPC）&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【相关知识】：&lt;/p&gt;\r\n\r\n&lt;p&gt;　　沙棘原花青素能促进细胞新陈代谢，抑制组胺产生，减轻炎症，愈合胃肠溃疡，具有较强的消炎促进新生的功能；深入脾胃，滋补肾脏，促进肠胃消化食物，吸收养分，滋阴补阳。通过肾及内分泌系统的调控作用，改善新陈代谢，生发五脏元气，推动全身血脉正常运行。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　其次，沙棘原花青素清除自由基、消除血液垃圾，清除五脏和血液中残留的甘油三酯、胆固醇、自由基、血毒、药毒等多种人体垃圾，祛除淤血，改善身体的血瘀状态。同时，原花青素还改善毛细血管状态，增强动脉、静脉、毛细血管的弹性，增强流向心脑的血液循环，元气旺盛，血液动力足，身体血瘀不再有。&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;　　【注意事项】：本品不可代替药物&lt;/strong&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 0, NULL, '0.00', NULL, 0, 0, 0, 1, 1),
(134, 25, '【褚马】500ml 礼品装（一对）', NULL, '248', NULL, 0, '/Uploads/image/product/2018-04-13/5ad04f51caa05.png', '/Uploads/image/product/2018-04-13/5ad04f51cc5ca.png', '/Uploads/image/product/2018-04-13/5ad04f51ce8a7.png', '/Uploads/image/product/2018-04-13/5ad04f51cffc1.png', '/Uploads/image/product/2018-04-13/5ad04f51d21f8.png', '', NULL, NULL, 1523696374, 0, 1, NULL, NULL, 871, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9678343fbb.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9679844d5d.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad967a417961.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad967b4eb180.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad967bf39c6c.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad967cb12672.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad967f4e43f8.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9680708adf.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9680f7358a.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad96819c4c64.jpg&quot; style=&quot;height:1016px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9682541514.jpg&quot; style=&quot;height:705px; width:732px&quot; /&gt;&lt;/p&gt;\r\n', NULL, '1', '', NULL, 1, NULL, NULL, 1724, NULL, '0.00', NULL, 0, 1, 1, 1, 1),
(167, 25, '褚酒庄园坛装酒4.5L（弥勒坛）', NULL, '6999', NULL, 0, '/Uploads/image/product/5ad4121c4830f.png', '/Uploads/image/product/5ad4370b7ee77.png', '/Uploads/image/product/5ad408e30da77.png', '/Uploads/image/product/5ad408e958b73.png', '', '', NULL, NULL, 1523843705, 22, 0, NULL, NULL, 997, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad99487984af.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9949332345.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9949d2768b.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad994a8b2ec6.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad994b589a35.jpg&quot; style=&quot;height:1034px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad994c24b6c7.jpg&quot; style=&quot;height:854px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad994cd53bcd.jpg&quot; style=&quot;height:854px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad994d5ae7ca.jpg&quot; style=&quot;height:498px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad994de71068.jpg&quot; style=&quot;height:487px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad994e80a432.jpg&quot; style=&quot;height:867px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad994f1e9e83.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad99500964d2.jpg&quot; style=&quot;height:632px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9950b4e0c8.jpg&quot; style=&quot;height:508px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad99515170c9.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9952469618.jpg&quot; style=&quot;height:594px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9952fd904d.jpg&quot; style=&quot;height:650px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad995383a4d3.jpg&quot; style=&quot;height:607px; width:732px&quot; /&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 0, NULL, '0.00', NULL, 0, 0, 0, 1, 0),
(135, 25, '鼎鑫沙棘籽油螺旋藻维生素E软胶囊', NULL, '450', NULL, 0, '/Uploads/image/product/5ad4004de44d4.png', '/Uploads/image/product/5ad4393a33d48.png', '', '', '', '', NULL, NULL, 1523605971, 56, 1, NULL, NULL, 40, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad98aad0152b.png&quot; style=&quot;height:178px; width:257px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫宜能胶囊&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要原料】：杜仲、绞股蓝、沙棘、人参&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【相关知识】：&lt;/p&gt;\r\n\r\n&lt;p&gt;　　绞股蓝民间有句俚语&amp;ldquo;北有长白参，南有绞股蓝&amp;rdquo;自明太祖朱元璋第五子朱橚的《救荒本草》至今被称长生不老草-绞股蓝之美誉。具有降血压、降血脂、降血糖、护心保肝，调脂减肥、增强机体免疫力的的功效。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　沙棘早在200多年前，成吉思汗便发现了沙棘的药用价值，御医用沙棘为蒙古贵族调制出了强身治病的蒙药。成吉思汗长年征战在外，平日就靠沙棘强身健体、抵御疾病。成吉思汗年过六旬仍能弯弓射雕，便与长期服用沙棘有关。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　人参为五加科植物人参的干燥根及根茎。味甘、微苦，性平。归脾、肺、心经。人参是我国特产珍贵药材之一，古代医药学书籍中始见于《神农本草经》&amp;ldquo;补五脏，安精神，定魂魄，止惊悸&amp;hellip;&amp;hellip;&amp;rdquo;，列为上品。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　人参最早见于&amp;lt;春秋运斗枢&amp;gt;的记载。南北朝时，已把人参和治病联系起来，形成传说的简单情节。《梁书》（卷五十一）记载，陈留孝子阮孝绪，因母病到钟山采参，鹿引获此草，服之遂愈。《太平御览》（卷九百九十一）亦载：&amp;ldquo;隋文帝时，上党有人宅后每夜有人呼声，求之不得。去宅一里，但一人参枝首，掘之入地五尺，得人参一，如人体状，去之，后呼声遂绝。&amp;rdquo;至唐时，发展为&amp;ldquo;草妖&amp;rdquo;、&amp;ldquo;地精&amp;rdquo;的说法；有的还把人参说成能医治&amp;ldquo;鲁钝&amp;rdquo;和可以益寿的&amp;ldquo;褐衣老翁&amp;rdquo;。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　&lt;strong&gt;【注意事项】：本品不可代替药物&lt;/strong&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 0, NULL, '0.00', NULL, 0, 0, 0, 0, 1),
(136, 25, '褚酒庄园坛装酒1.5L（褚坛）', NULL, '3999', NULL, 0, '/Uploads/image/product/5ad3fe019ccc6.png', '/Uploads/image/product/5ad43737c66e9.png', '/Uploads/image/product/5ad4812979e42.png', '/Uploads/image/product/5ad0874ce1dfb.png', '', '', NULL, NULL, 1523606672, 1, 1, NULL, NULL, 939, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad991c88fe19.jpg&quot; style=&quot;height:890px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad991d2ac13b.jpg&quot; style=&quot;height:975px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad991e041a4b.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad99208affcb.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad99212e0bb5.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9921be8b06.jpg&quot; style=&quot;height:854px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad99224f33f8.jpg&quot; style=&quot;height:888px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9922d232de.jpg&quot; style=&quot;height:498px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9923862967.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad99241f09dc.jpg&quot; style=&quot;height:867px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9924a5e6a5.jpg&quot; style=&quot;height:512px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad99255df875.jpg&quot; style=&quot;height:632px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9925fe11ac.jpg&quot; style=&quot;height:508px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad992679eff5.jpg&quot; style=&quot;height:599px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad99270bf01a.jpg&quot; style=&quot;height:594px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad992787f9ac.jpg&quot; style=&quot;height:650px; width:732px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad99280b6b2c.jpg&quot; style=&quot;height:607px; width:732px&quot; /&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 0, NULL, '0.00', NULL, 0, 0, 0, 0, 1),
(138, 25, '【褚韵52°】500ml 礼品装', NULL, '529', NULL, 0, '/Uploads/image/product/5ad07fd4a668e.png', '/Uploads/image/product/5ad07fdd6eec0.png', '/Uploads/image/product/5ad08020bf358.png', '/Uploads/image/product/5ad08027056aa.png', '', '', NULL, NULL, 1523607242, 4, 1, NULL, NULL, 14520, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad995c13f19a.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad995cf3dba8.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad995da81a85.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad995e5bca8b.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad995f3159eb.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad995fd59217.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad99611b2682.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9961cd17f4.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad996276acef.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9962f30e7f.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9963b653b0.jpg&quot; /&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 0, NULL, '0.00', NULL, 0, 0, 0, 1, 1),
(142, 25, '鼎鑫天阔营养片', NULL, '456', NULL, 0, '/Uploads/image/product/2018-04-14/5ad18b8ab8574.png', '/Uploads/image/product/2018-04-14/5ad18b8ab9a1d.png', '', '', '', '', NULL, NULL, 1523682186, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9894154a6d.png&quot; style=&quot;height:217px; width:300px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫天阔营养片&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要原料】：黄精、茯苓、葛根、田三七、吴茱萸、肉苁蓉、牛夕、蔬菜、沙棘籽提取物&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【相关知识】：&lt;/p&gt;\r\n\r\n&lt;p&gt;　　田三七&amp;mdash;一具有活血化癣、消肿定痛功效，素有&amp;ldquo;金不换&amp;rdquo;、&amp;ldquo;南国神草&amp;rdquo;之美誉。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　昊茱萸&amp;mdash;&amp;mdash;味辛温，主逼中下气，止痛，咳逆寒热、除湿血痹。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　牛夕&amp;mdash;&amp;mdash;能消淤血、松弛尿道平滑肌，解除尿路梗阻。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　肉苁蓉&amp;mdash;&amp;mdash;补肾阳，益精血。用于阳癀、腰膝冷痛、筋骨酸软无力。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　蔬菜、沙棘籽提取物&amp;mdash;&amp;mdash;富台蛋白质、碳水化台物、维生素C、油脂、钙等多种元素，能滋补肾脏，扶阳固本，补肝及命门。&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;　　【注意事项】：本品不可代替药物&lt;/strong&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 0, 1, 1, 1, 1),
(143, 25, '鼎鑫沙棘油', NULL, '2000', NULL, 0, '/Uploads/image/product/2018-04-14/5ad18bda89570.png', '/Uploads/image/product/2018-04-14/5ad18bda8ab26.png', '/Uploads/image/product/2018-04-14/5ad18bda8bfdf.png', '', '', '', NULL, NULL, 1523682266, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad98913a50bd.png&quot; style=&quot;height:196px; width:320px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫沙棘油&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要原料】：沙棘&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;　　【注意事项】：本品不可代替药物&lt;/strong&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 1, 0, 1, 1, 1),
(144, 25, '鼎鑫洛神营养片', NULL, '499', NULL, 0, '/Uploads/image/product/2018-04-14/5ad18c3778c46.png', '/Uploads/image/product/2018-04-14/5ad18c377a2d3.png', '', '', '', '', NULL, NULL, 1523682359, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad988ce32677.png&quot; style=&quot;height:221px; width:318px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫洛神营养片&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要原料】：白芷、菊花、甘草、枸杞、桃仁、决明子、向日葵花粉、茯苓、黄精、牡蛎&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【相关知识】：&lt;/p&gt;\r\n\r\n&lt;p&gt;　　白芷&amp;mdash;&amp;mdash;祛风解表、散寒止痛、除湿通窍、消肿排脓。可改善人体微循环，促进皮肤新陈代谢，消除色素在组织中过度堆积。《神农本草经》指出白芷：&amp;ldquo;长肌肤。润泽颜色，可作面脂。&amp;rdquo;无论是&amp;ldquo;干金面脂方&amp;rdquo;，或是慈禧太后的驻颜宫廷秘方&amp;ldquo;玉容散&amp;rdquo;，白芷都是制作面脂的主要原料。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　菊花&amp;mdash;一菊花能增强谷胱甘脑过氧化降低，具有清除自由基的能力，专家研究则发现，菊花提取物对生物膜的超氧阴离子自由基损伤具有明显保护作用，主要是通过直接进入细胞障的甘油酯后而起保护作用。这一新的发现使菊花有望开发成为新的功能性食品，尤其在抗衰老食品中发挥其作用。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　女人衰老的机理无外乎阴阳失衡，气血失和，气机升降出入失常，脏腑功能失调。肥胖、便秘、色斑、口臭、体臭、高血脂等疾病时有发生，如果加上心理负担，则机体衰老就会加速。女人要学会关爱自己，遁畅身体，从而通畅心理，定期的排出体内毒素，调整机体状态无疑会为今天的美丽和明日的健康打下坚实的基础。&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;　　【注意事项】：本品不可代替药物&lt;/strong&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 0, 0, 1, 1, 1);
INSERT INTO `ysk_product_detail` (`id`, `type_id`, `name`, `s_desc`, `price`, `old_price`, `buy_num`, `pic`, `pic1`, `pic2`, `pic3`, `pic4`, `pic5`, `freight`, `address`, `ctime`, `is_sort`, `is_hot`, `color_cate`, `csize`, `stock`, `praise_num`, `content`, `status`, `jifen_nums`, `jifen_type`, `xiaofei_bili`, `is_duobao`, `kaijiang_nums`, `sanji_use`, `shangjia`, `seluid`, `count_price`, `producs_pingjia`, `gr_hot`, `gr_new`, `gr_tuijian`, `is_new`, `is_tuijian`) VALUES
(139, 25, '鼎鑫沙棘籽油螺旋藻维生素E软胶囊', NULL, '450', NULL, 0, '/Uploads/image/product/2018-04-14/5ad17bcf1d3dd.png', '/Uploads/image/product/2018-04-14/5ad17bcf1f153.png', '', '', '', '', NULL, NULL, 1523678159, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad98a4e8ae3c.png&quot; style=&quot;height:319px; width:437px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫沙棘籽油螺旋藻维生素E软胶囊&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要原料】：螺旋藻粉、沙棘籽油、维生素E&lt;/p&gt;\r\n\r\n&lt;p&gt;　　&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;【相关知识】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　&lt;strong&gt;螺旋藻的营养价值&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　1.螺旋藻含丰富的蛋白质，植物性蛋白质高达60-70%。蛋白质是维持生命的基本元素。蛋白质是由20种氨基酸组成的生物大分子，其中有8种在人和动物体内不能自身合成，必须通过食物供给才能维持人和动物的正常发育和健康。而这8种氨基酸在螺旋藻中含量丰富，远远高于其他食品。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　2.螺旋藻含丰富的&amp;beta;-胡萝卜素。&amp;beta;-胡萝卜素是维生素的前体，进入人体后被酶分解为维生素A，维生素A是促进幼年动物生长的重要元素，有预防眼结膜、泪腺、鼻腔、消化道、汗腺及皮脂腺变质、干燥及角质化的功能，能促进上皮细胞的再生，加速伤口的愈合。促进骨骼和牙釉的形成，因此，长期服用螺旋藻可保护眼睛，使粗糙的皮肤变得细腻，使口腔、肠胃溃疡快速愈合。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　3.螺旋藻含丰富的维生素B1、B2、B5、B6、B11、B12、C、E， 而且各具特殊的生理功能， 缺乏其中的任何一种都可能导致疾病。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　4.螺旋藻中含很高的&amp;gamma;-亚麻酸，有促进钙吸收、提高免疫力、防止代谢紊乱和防止衰老的功能。&amp;gamma;-亚麻酸是前列腺素的前体，在加氧酶的作用下变为前列腺素，前列腺素对生殖、心血管、呼吸、消化及神经系统均有作用。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　5.螺旋藻中多糖，有抗辐射的功能，并通过增强机体免疫力。另外螺旋藻多糖能提高血浆中的SOD的活性，减少脂质过氧化物的生成，有抗衰老的作用。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　6.螺旋藻含多种人体必需的微量元素，钙、镁、钠、钾、磷、碘、铁、铜、锌等。缺铁会导致贫血，缺锌会导致发育不良，硒能激活DNA修复酶，刺激免疫球蛋白及抗体的产生，捕获自由基，降低或抵抗体内某些金属的毒性。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　7.螺旋藻中所含的叶绿素A，有其独特的造血净血功能。&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;　　【注意事项】：本品不可代替药物&lt;/strong&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 1, 1, 0, 1, 1),
(151, 25, '鼎鑫沙棘果油（精油）', NULL, '399', NULL, 0, '/Uploads/image/product/2018-04-14/5ad18eb7a5be0.png', '/Uploads/image/product/2018-04-14/5ad18eb7a7562.png', '', '', '', '', NULL, NULL, 1523682999, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad985e375817.png&quot; style=&quot;height:358px; width:224px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫沙棘果油（精油）&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要原料】：沙棘&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【使用方法】：早晚空腹1到2毫升，含服。 也可外用，涂抹于作用部位，轻轻按摩至吸收。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【注意事项】：本品不可代替药物&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 1, 0, 0, 1, 1),
(152, 25, '鼎鑫 沙棘籽油(精油)', NULL, '399', NULL, 0, '/Uploads/image/product/5ad9859130def.png', '/Uploads/image/product/5ad985971c240.png', '', '', '', '', NULL, NULL, 1523683071, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9848d1822c.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫沙棘籽油（精油）&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要原料】：沙棘&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【使用方法】：早晚空腹1到2毫升，含服。 也可外用，涂抹于作用部位，轻轻按摩至吸收&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【注意事项】：本品不可代替药物&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 2, 0, 1, 1, 1),
(153, 25, '沙棘能靓油', NULL, '298', NULL, 0, '/Uploads/image/product/2018-04-14/5ad18f4cb28a7.png', '/Uploads/image/product/2018-04-14/5ad18f4cb4083.png', '', '', '', '', NULL, NULL, 1523683148, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;沙棘能靓油主要由沙棘油、鸸鹋油、薄荷脑、芦荟以及多种蔬菜水果 的渗透因子组成。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;沙棘油通过先进的纳米雾化技术与鸸鹋、芦荟等植物精华完美结合，以鸸鹋油为渗透载体，在15-30秒钟内将沙棘、芦荟等营养精华快速导入人体组织细胞，提供细胞能量，激发细胞活力。清除自由基、抗氧化、抗过敏和提高细胞免疫力。疏通经络、运行气血、营养周身和促进细胞的修复与再生。大量的不饱和脂肪酸和亚麻酸，可以有效缓解红肿、有效减轻肌肉关节疼痛、舒缓疲劳，亦是疏经活络与消痈散瘀不可多得的养生上品！&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:16px&quot;&gt;&amp;nbsp;使用方法&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;1、热敷（用热毛巾清洁患处，或冲热水澡）&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;2、抹痛点（疼痛部位或病灶所在部位）&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;3、沿着骨缝抹&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;4、顺经络找出路（腋下、尾骨、手指头、脚底）&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;5、少量多次（每次连续抹3-5遍效果最佳）&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;6、保温保湿（包上保鲜膜并盖上毛巾或棉被）&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;7、坚持：当症状缓解后，要继续坚持抹1-3个月&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;8、禁忌：忌劳累，忌酒、生冷和辛辣，孕妇禁用，容易造成流产&lt;/span&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 0, 0, 0, 1, 1),
(154, 25, '鼎鑫沙棘逆颜原液', NULL, '998', NULL, 0, '/Uploads/image/product/2018-04-14/5ad18f89d94e9.png', '/Uploads/image/product/2018-04-14/5ad18f89daa7e.png', '', '', '', '', NULL, NULL, 1523683209, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad984146984e.png&quot; style=&quot;height:337px; width:183px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫沙棘逆颜原液&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　沙棘逆颜原液是一款祛除抑制皱纹、紧致毛孔、祛除眼袋黑眼圈、深层美白、深层补水、淡化色斑、修复痘印和坚挺乳房的天然特种细胞修复原液，能使松弛老化的肌肤快速回转为水嫩、丝滑、紧致、亮白的肌肤，重焕青春容颜。本品采用以沙棘萃取原液为基础的多种植物精华，采用国际最新的高科技手段进行有机融合，能促进真皮层中胶原蛋白，弹力纤维增生，修复受损细胞，祛除表皮层坏死细胞，深层提高肌肤的含水量，增加皮肤厚度以及减少细纹。有效舒缓并抑制抬头纹、眼角纹、假性细纹及脸部肌肉的收缩与活动，帮助肌肉放松，使肌肤弹性组织恢复至青春常态。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　1、消除皱纹：皱纹的产生主要是由于皮肤中的胶原蛋白流失，真皮中的弹力纤维网断裂。沙棘逆颜原液，可直接渗透到皮肤真皮层，促进真皮层中胶原蛋白、弹力纤维增生，修复断裂受损的纤维组织，达到祛除及抑制皱纹的效果。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　2、补水、美白：皮肤暗淡、无光是由于皮肤新陈代谢缓慢，老化角质无力自然脱落，使皮肤变得晦暗粗糙。沙棘逆颜原液，能有效帮助皮肤细胞的新陈代谢，加速细胞生长，提高肌肤含水量，有效防止皮肤水分蒸发，增强皮肤的锁水能力，让肌肤更白皙水嫩，细腻柔滑，倒逆生长。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　3、淡化色斑、修复痘印：沙棘逆颜原液中的有效成分，可以预防酪胺酸酶的活性，抑制黑色素的生成，帮助色素排出，能使面部黑斑迅速淡化及有效抑制黑斑产生，并且可以修复受损组织，解除痘印烦恼。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　4、驱除黑眼圈、眼袋：沙棘逆颜原液，可促进血液循环畅通，淡化因疲劳而形成的黑眼圈、眼袋。同时增加眼部周边肌肤的紧密度，使眼睛看上去更加光彩、迷人&lt;/p&gt;\r\n\r\n&lt;p&gt;　　5、挺拔乳房：乳房主要是由结缔组织构成，而胶原蛋白是结缔组织的主要成分，补充沙棘逆颜原液，激发结缔组织胶原蛋白与弹力蛋白的再生，长期使用能使松弛的乳房组织紧实、提升起下垂的乳房，使乳房挺拔、丰满、富有弹性。&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 0, 1, 0, 1, 1),
(155, 25, '鼎鑫沙棘逆颜水凝蚕丝面膜', NULL, '399', NULL, 0, '/Uploads/image/product/2018-04-14/5ad18fd59c196.png', '/Uploads/image/product/2018-04-14/5ad18fd59e0b2.png', '', '', '', '', NULL, NULL, 1523683285, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad983d042f77.png&quot; style=&quot;height:414px; width:313px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫沙棘逆颜水凝蚕丝面膜&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　本品使用100%真蚕丝做贴膜，并且同时蕴含当今全球最具影响力的四大肌肤改善成分：&lt;/p&gt;\r\n\r\n&lt;p&gt;　　1、沙棘萃取精华&amp;ldquo;OPCs（逆生长基础因子）：肌肤逆生长的基质&amp;rdquo;。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　2、&amp;ldquo;NMF&amp;amp;HA（天然保湿因子）：肌肤逆生长的天然水源&amp;rdquo;。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　3、&amp;ldquo;SACA（强力抗氧化细胞活化促进因子）： 肌肤逆生长的工程师&amp;rdquo;。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　4、&amp;ldquo;EGF（美丽因子）：肌肤逆生长的&amp;ldquo;真命&amp;rdquo;美容天使&amp;rdquo;。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【主要功效】：清透亮颜，滋养肌肤，改善肌肤光泽，娇细柔嫩，保持肌肤活力，使肌肤光滑细腻。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【使用方法】：洁肤后，先将法国海洋之谜羽丝缕面膜兰色无纺布揭掉，将中间层的面膜直接敷在面部并轻按压，再将有孔珍珠膜揭掉，20分钟左右取下即可，并把残留精华液轻按摩至吸收；每天使用效果更佳。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　【注意事项】：每个人的肤质各不相同，建议使用前先进行局部的皮肤测试。&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 0, 0, 1, 1, 1),
(156, 25, '鼎鑫天然沙棘手工精油皂', NULL, '298', NULL, 0, '/Uploads/image/product/2018-04-14/5ad19032a12f3.png', '/Uploads/image/product/2018-04-14/5ad19032a2a75.png', '', '', '', '', NULL, NULL, 1523683378, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad983a05cf85.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫天然沙棘手工精油皂&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　本品由沙棘油、沙棘OPC、椰子油、甜杏仁油、甘油等多种食用级的特种营养植物油原料，及天然沙棘精油、玫瑰精油、柠檬精油等制成的含有天然植物芳香烃的天然植物精油皂。天然沙棘手工精油皂不添加任何防腐剂，表面活性剂等化学成分，是一种非常安全而有效的皮肤清洁及美容产品，低温制作，甘油不会流失，除了细腻的清洁效果，还能呵护滋润皮肤，不会对皮肤造成负担，还能具有精油的养护效果，比市面上常用的洗面奶效果好，而且安全。天然沙棘手工精油皂能提供非常高的保湿效能，同时也能够更深层清洁肌肤，给予肌肤最健康自然的呵护。并富有轻柔、清新的植物香氛，使人如沐大自然的海洋。天然沙棘手工精油皂适用所有肤质，尤其是干燥或任何敏感红肿和发炎皮肤。主要成分沙棘OPC具有强壮和收缩微血管的效果， 对老化皮肤有极佳的回春作用。抚平情绪，沮丧、哀伤、妒忌和憎恶的时候，提振心情，舒缓神经紧张和压力，能使女人对自我产生积极、正面的感受。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　天然沙棘手工精油皂含丰富的维生素C，特别有益于美白、收敛、平衡油脂、治疗青春痘等油性皮肤症状。其味道清新甜美，对于季节转化，肌肤极容易出现的问题，洗洗都能轻松解决，让您恢复亮白娇嫩肌肤，充满自信。&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 1, 0, 0, 1, 1),
(157, 25, '鼎鑫私密养护套装', NULL, '4000', NULL, 0, '/Uploads/image/product/2018-04-14/5ad190745f1fe.png', '/Uploads/image/product/2018-04-14/5ad1907460da0.png', '', '', '', '', NULL, NULL, 1523683444, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9835b6bd7a.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫私密养护套装&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　养血调经，强健卵巢功能，改善生殖系统，平衡荷尔蒙分泌，让月经通畅，迅速缓解痛经，宫寒，手脚冰凉等症状，祛除色斑，令气色佳，美颜驻颜，增强生殖系统功能。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第一步：沙棘肽私部活焕霜：取本品适量，根据使用方法说明书在保养部位进行按摩操作。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第二步：沙棘肽私部精粹油：取本品1支，涂抹在保养部位进行按摩推拿，直至吸收。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第三步：沙棘肽私部焕养液：取本品1支，涂抹至保养部位，用手指轻拍，直至完全吸收&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 1, 0, 1, 1, 1),
(158, 25, '鼎鑫胸部养护套装', NULL, '4000', NULL, 0, '/Uploads/image/product/2018-04-14/5ad190bb585b6.png', '/Uploads/image/product/2018-04-14/5ad190bb5a0b3.png', '', '', '', '', NULL, NULL, 1523683515, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad982fb1b158.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫胸部养护套装&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　疏通乳腺管，软坚散结，提升胸部结缔组织的弹性，收紧下垂肌肤，消除乳腺疾病，平衡内分泌，是胸部丰满均匀，坚实，紧挺，柔韧，保持健美形体，拥有完美曲线。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第一步：沙棘肽胸部活焕霜：取本品适量，根据使用方法说明书在保养部位进行按摩操作。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第二步：沙棘肽胸部精粹油：取本品1支，涂抹在保养部位进行按摩推拿，直至吸收。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第三步：沙棘肽胸部焕养液：取本品1支，涂抹至保养部位，用手指轻拍，直至完全吸收&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 0, 0, 0, 1, 1),
(159, 25, '鼎鑫头部舒养套', NULL, '4000', NULL, 0, '/Uploads/image/product/2018-04-14/5ad190f2ab5eb.png', '/Uploads/image/product/2018-04-14/5ad190f2ad58e.png', '', '', '', '', NULL, NULL, 1523683570, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad982ad19912.png&quot; style=&quot;height:304px; width:522px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫头部舒养套&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　有益于大脑皮层的功能调节、可以益智健脑、增强记忆、缓解疲劳、改善睡眠、防止脱发、消除紧张、焦虑、延缓衰老、使大脑重新获得充沛的精力。预防并有效调理神经性头痛、后头痛、颈痛症、眶上神经痛、三叉神经痛、高血压等。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第一步：沙棘背部活焕霜：取本品适量，根据使用方法说明书在保养部位进行按摩操作。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第二步：沙棘肽背部精粹油：取本品1支，涂抹在保养部位进行按摩推拿，直至吸收。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第三步：沙棘肽背部焕养液：取本品1支，涂抹至保养部位，用手指轻拍，直至完全吸收。&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 0, 0, 0, 1, 1),
(160, 25, '鼎鑫主脊养护套', NULL, '4000', NULL, 0, '/Uploads/image/product/2018-04-14/5ad1914bb2021.png', '/Uploads/image/product/2018-04-14/5ad1914bb3c35.png', '', '', '', '', NULL, NULL, 1523683659, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad98136d2e8d.png&quot; style=&quot;height:299px; width:444px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;鼎鑫主脊养护套&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　疏通颈腰部经络，行气活血，通络止痛，改善颈腰部酸胀、肩膀酸痛、颈腰椎僵硬不适的症状，减轻颈腰椎疼痛，缓解肌肉紧张，加快颈腰部血液循环及代谢。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第一步：沙棘背部活焕霜：取本品适量，根据使用方法说明书在保养部位进行按摩操作。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第二步：沙棘肽背部精粹油：取本品1支，涂抹在保养部位进行按摩推拿，直至吸收。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第三步：沙棘肽背部焕养液：取本品1支，涂抹至保养部位，用手指轻拍，直至完全吸收&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 0, 2, 0, 1, 1),
(161, 25, '鼎鑫十二正经舒养套', NULL, '4000', NULL, 0, '/Uploads/image/product/2018-04-14/5ad1918cf18ae.png', '/Uploads/image/product/2018-04-14/5ad1918cf3506.png', '', '', '', '', NULL, NULL, 1523683725, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad981a9dce06.png&quot; style=&quot;height:264px; width:456px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫十二正经舒养套&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　活血化瘀，疏通经络，祛风除湿，散寒止痛，改善肌肉，关节，韧带，因经络不通所导致的疼痛，胂胀，物理变异等症状。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第一步：沙棘肽经络活焕霜：取本品适量，根据使用方法说明书在保养部位进行按摩操作。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第二步：沙棘肽经络精粹油：取本品1支，涂抹在保养部位进行按摩推拿，直至吸收。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第三步：沙棘肽经络焕养液：取本品1支，涂抹至保养部位，用手指轻拍，直至完全吸收&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 0, 0, 0, 1, 1),
(162, 25, '鼎鑫淋系净通套', NULL, '4000', NULL, 0, '/Uploads/image/product/2018-04-14/5ad191dc77eda.png', '/Uploads/image/product/2018-04-14/5ad191dc79cee.png', '', '', '', '', NULL, NULL, 1523683804, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9820619409.png&quot; style=&quot;height:278px; width:462px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;鼎鑫淋系净通套&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　改善淋巴循环系统，促进淋巴液的流动，加速淋巴系统排毒，提高身体免疫功能。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第一步：沙棘肽淋系活焕霜：取本品适量，根据使用方法说明书在保养部位进行按摩操作。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第二步：沙棘肽淋系精粹油：取本品1支，涂抹在保养部位进行按摩推拿，直至吸收。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　第三步：沙棘肽淋系焕养液：取本品1支，涂抹至保养部位，用手指轻拍，直至完全吸&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 0, 0, 0, 1, 1),
(163, 25, '鼎鑫沙棘凝胶', NULL, '298', NULL, 0, '/Uploads/image/product/2018-04-14/5ad19214ae915.png', '/Uploads/image/product/2018-04-14/5ad19214afede.png', '', '', '', '', NULL, NULL, 1523683860, 0, 1, NULL, NULL, 888, 0, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad97ed2f3def.png&quot; style=&quot;height:563px; width:589px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;font color=&quot;#ff0000&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/font&gt;鼎鑫沙棘凝胶&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;　　【产品介绍】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;　　采用了优质原料&amp;mdash;&amp;mdash;由先进的&amp;ldquo;冷冻稳定法&amp;rdquo;从天然野生沙棘果中提炼而成，其纯净度高，能舒缓皮肤不适，保持皮肤健康，防止皮肤粗糙，增强皮肤弹性，对皮肤没有刺激性。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　沙棘凝胶中的有效成分能扩张毛细血管，促进微循环，强化细胞活力。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　沙棘凝胶内含的OPC，维生素C，维生素E，胡萝卜素等自由基的清除剂，能有效延缓皮肤细胞变老。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　沙棘凝胶内的氨基酸、维生素、矿物质、酵素、有机酸及水是皮肤必须的营养素，具有天生的收敛作用，能使皮肤坚实细致，预防皮肤松弛，有效锁住水分，抑制产生黑色素。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　缓解皮肤干性，使皱纹明显减少，皮肤变白皙。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　由杀菌功能，若有外阴瘙痒的症状，也可以用沙棘凝胶外涂。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　祛斑淡斑，在有斑的部位多做按摩，促进皮肤吸收，增强微循环，1日3次。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　保湿美白：刺激血液循环，帮助肌肤捕捉氧气，激活细胞活性，锁住水分，抑制斑点产生，美白皮肤。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　控油祛痘：平衡肌肤成分，达到水油平衡，含有的杀菌成分能抑制微生物生长，减少痘痘的再生。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　晒后修护：镇静肌肤，消除晒后不适，其修护成分能帮助皮肤提高抵御外界侵害。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　对各种皮肤病具有很好的改善及康复作用。&lt;/p&gt;\r\n\r\n&lt;p&gt;　　适用人群广泛，大人小孩都可使用。&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 1, 0, 0, 1, 1),
(164, 25, '国士健能量仪', NULL, '5000', NULL, 0, '/Uploads/image/product/2018-04-14/5ad19289253a3.png', '/Uploads/image/product/2018-04-14/5ad1928926b51.png', '', '', '', '', NULL, NULL, 1523684226, 0, 1, NULL, NULL, 882, 0, '&lt;p&gt;&lt;span style=&quot;color:rgb(85, 85, 85); font-size:18px&quot;&gt;国士健&amp;middot;能量仪 能利用物理能量来调理人类亚健康，具有八种能量的综合效应。将静磁、动磁、纳米远红外、音乐脉冲、特效养生音乐、针灸按摩、低频生物电、中频生物电于一体，产生的高能立体生物场，经过科学的叠加技术产生出8大物理能量，弥补了单纯的几种能量不足的缺陷，效果更强、更快、更持久、调理范围更广泛。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(85, 85, 85); font-size:18px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9604492e7d.jpg&quot; style=&quot;height:459px; width:466px&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:18px&quot;&gt;4大世界首创国家专利&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;1.世界首创的集八大物理能量于一身，可同时调理多种疾病，穿透力达9&amp;mdash;12CM。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;2.世界首创的动静结合的复合不均匀磁场，更有效的调整人体各种生理机能。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;3.世界首创的近似磁单极技术，磁疗效果更佳。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;4.世界首创的音乐调理与多种物理疗法有机结合，提高调理效果。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad9609bd2876.png&quot; style=&quot;height:584px; width:587px&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:18px&quot;&gt;8大能量场&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:18px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad960bd77865.png&quot; style=&quot;height:596px; width:590px&quot; /&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:18px&quot;&gt;1.不均匀永（静）磁场：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;①辅助镇静；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;②辅助止痛；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;③辅助消炎；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;④辅助消肿；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;⑤辅助止泻；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;⑥降血脂、调节血压.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:18px&quot;&gt;2.不均匀单向脉冲磁场：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;改善血液循环，调节血管的收缩功能；②提高肌肉韧带的张力，促进神经和肌肉的恢复等治疗作用；③应用近似磁单极技术的脉冲磁场比永磁场作用更强；④1hz、30hz、100hz。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:18px&quot;&gt;3.远红外线：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;①刺激了大分子的活性；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;②促进和改善血液循环；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;③增强新陈代谢；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;④提高免疫系统；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;⑤辅助消炎消肿；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;⑥辅助镇静镇痛；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;⑦激活大分子团的水，使其变成小分子团的水或单分子水。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:18px&quot;&gt;4.特效养生音乐：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;①对细胞产生细微的按摩；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;②调整新陈代谢，增强抗病能力；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;③协调各神经中枢的功能活动；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;④使大脑的功能处于最佳状态；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;⑤改善组织细胞的各种功能活动和代谢活动；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;⑥明显降低疼痛。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:18px&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:18px&quot;&gt;5.音乐脉冲电流：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;①辅助镇静、辅助镇痛；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;②兴奋神经肌肉组织；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;③改善局部的血液循环；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;④辅助消炎、辅助消肿；催眠；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;⑤比单一频率的脉冲电流调节作用更好。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:18px&quot;&gt;6.针灸按摩：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;①疏通经络，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;活血化瘀，达到辅助作用；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;②恢复人体组织器官的功能；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;③促进组织液的交换；④增强体质，预防疾病。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:18px&quot;&gt;7.低频生物电：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;清理、中和体内的酸性垃圾，代谢成盐和水排出体外。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:18px&quot;&gt;8.中频生物电：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;激活细胞，通经活络，排风排寒排湿。&lt;/span&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 0, 0, 0, 1, 1),
(165, 25, '负离子空气净化器K07', NULL, '5000', NULL, 0, '/Uploads/image/product/2018-04-14/5ad192d292844.png', '/Uploads/image/product/2018-04-14/5ad192d29391c.png', '/Uploads/image/product/2018-04-14/5ad192d294929.png', '', '', '', NULL, NULL, 1523684211, 0, 1, NULL, NULL, 880, 0, '&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:18px&quot;&gt;产品参数&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:18px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad961a208a92.png&quot; style=&quot;height:495px; width:585px&quot; /&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:18px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad961ac821c1.png&quot; style=&quot;height:462px; width:584px&quot; /&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 0, 1, 0, 1, 1),
(166, 25, '负离子空气净化器GK-K02', NULL, '5000', NULL, 0, '/Uploads/image/product/2018-04-14/5ad19319a0743.png', '/Uploads/image/product/2018-04-14/5ad19319a1ea9.png', '', '', '', '', NULL, NULL, 1524195965, 0, 1, NULL, NULL, 876, 0, '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57)&quot;&gt;一、主机超静音设置。&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57)&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad97d660b349.png&quot; style=&quot;height:584px; width:587px&quot; /&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:16px&quot;&gt;二、主机三层贴心保护。&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:16px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad97d9383e90.png&quot; style=&quot;height:571px; width:557px&quot; /&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;1、高温熔断保护。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;2、电控保护。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;3、防倾倒开关保护。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:16px&quot;&gt;三、六层过滤、加倍净化、空气清新&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:16px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad97db4074dd.png&quot; style=&quot;height:577px; width:581px&quot; /&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;1、冷触媒过滤网&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;2、蜂窝活性炭过滤网&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;3、抗菌棉过滤网&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;4、HEPA高效过滤网&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;5、紫外线杀菌&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;6、负离子净化&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(253, 41, 57); font-size:16px&quot;&gt;四、智能调节、多层过滤&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:18px&quot;&gt;&lt;strong&gt;产品参数&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:18px&quot;&gt;&lt;strong&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad97dd5d0d81.png&quot; style=&quot;height:498px; width:592px&quot; /&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:18px&quot;&gt;&lt;strong&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-04-20/5ad97de4022f8.png&quot; style=&quot;height:393px; width:591px&quot; /&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 1745, NULL, '0.00', NULL, 0, 1, 0, 1, 1),
(175, 24, '富商大贾', '&lt;p&gt;使对方的说法都是广告&lt;img src=&quot;/Uploads/image/product/2018-04-26/5ae1b7316c799.png&quot; style=&quot;font-size: 4.2vmin; max-width: 100%;&quot;&gt;&lt;/p&gt;', '4545', '0.00', 0, '/Uploads/image/product/2018-04-26/5ae1b74383649.png', '/Uploads/image/product/2018-04-26/5ae1b743852a0.png', NULL, NULL, NULL, NULL, '0.00', NULL, 1524741955, 0, 1, '', '', 0, 0, NULL, 0, '5445', NULL, 10, 1, 0, 1, 1715, NULL, '0.00', NULL, 1, 2, 1, 1, 1),
(176, 5, '测试', '&lt;p&gt;我是来测试的&lt;/p&gt;', '100', '120.00', 0, '/Uploads/image/product/2018-06-15/5b2367956706a.jpg', NULL, NULL, NULL, NULL, NULL, '0.00', NULL, 1529046933, 0, 1, '', '', 996, 0, NULL, 0, '10', NULL, 10, 1, 0, 1, 4125, NULL, '0.00', NULL, 1, 1, 1, 1, 1),
(177, 5, '这就是我的商城', '&lt;p&gt;这个真的好收悉啊&lt;/p&gt;', '999', '66.00', 0, '/Uploads/image/product/2018-06-15/5b2368ea0b9fe.jpg', '/Uploads/image/product/2018-06-15/5b2368ea0be79.jpg', '/Uploads/image/product/2018-06-15/5b2368ea0c262.jpg', '/Uploads/image/product/2018-06-15/5b2368ea0c647.jpg', '/Uploads/image/product/2018-06-15/5b2368ea0ca29.jpg', NULL, '0.00', NULL, 1529047274, 0, 1, '', '', 888, 0, NULL, 0, '100', NULL, 10, 1, 0, 1, 8539, NULL, '0.00', NULL, 1, 1, 1, 1, 1),
(180, 5, '测试的', '&lt;p&gt;大家都是来测试的&lt;/p&gt;', '140', '150.00', 0, '/Uploads/image/product/2018-06-15/5b2399e68e4fe.jpg', NULL, NULL, NULL, NULL, NULL, '0.00', NULL, 1529059814, 0, 1, '', '', 100, 0, NULL, 0, '0', NULL, 10, 1, 0, 1, 4125, NULL, '0.00', NULL, 1, 1, 1, 1, 1),
(181, 25, '我是阿里', NULL, '200', NULL, 0, '/Uploads/image/product/2018-06-21/5b2b51cc8a269.jpg', '/Uploads/image/product/5b31a1503551e.png', '/Uploads/image/product/5b31a07712dd2.jpg', '', '', '', NULL, NULL, 1529565644, 0, 1, NULL, NULL, 997, 0, '&lt;p&gt;22222222&lt;/p&gt;\r\n', NULL, '0', '', NULL, 1, NULL, NULL, 8545, NULL, '0.00', NULL, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_proxy`
--

CREATE TABLE IF NOT EXISTS `ysk_proxy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `province` int(11) NOT NULL COMMENT '省份',
  `city` int(11) NOT NULL COMMENT '城市',
  `time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_qingsaonums`
--

CREATE TABLE IF NOT EXISTS `ysk_qingsaonums` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '受益期间内清扫次数',
  `farm_types` tinyint(1) NOT NULL COMMENT '农场类型',
  `day_nums` int(11) NOT NULL DEFAULT '0' COMMENT '收益天数',
  `land_id` int(11) NOT NULL COMMENT '操作土地对应id',
  `qingsao_date` date NOT NULL COMMENT '到期时间',
  `qingsao_uid` int(11) NOT NULL COMMENT '会员id',
  `qingsao_times` date NOT NULL COMMENT '清扫时间',
  `is_select` date NOT NULL COMMENT '1未查询过,2->已经查询过',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `land_id` (`land_id`) USING BTREE,
  KEY `qingsao_uid` (`qingsao_uid`) USING BTREE,
  KEY `farm_types` (`farm_types`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_qingsaorecord`
--

CREATE TABLE IF NOT EXISTS `ysk_qingsaorecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '清扫记录详情表',
  `uid` int(11) NOT NULL COMMENT '清扫会员id',
  `qingsao_time` date NOT NULL COMMENT '清扫时间',
  `qingsao_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '清扫哪个农场的',
  `qingsao_id` int(11) NOT NULL COMMENT '清扫地对应的id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `qingsao_id` (`qingsao_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_sanjione`
--

CREATE TABLE IF NOT EXISTS `ysk_sanjione` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '三级分销',
  `first` float(8,2) NOT NULL COMMENT '一级比例',
  `second` float(8,2) NOT NULL COMMENT '二级比例',
  `third` float(8,2) NOT NULL COMMENT '三级比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ysk_sanjione`
--

INSERT INTO `ysk_sanjione` (`id`, `first`, `second`, `third`) VALUES
(1, 0.30, 0.20, 0.10);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_sanjithree`
--

CREATE TABLE IF NOT EXISTS `ysk_sanjithree` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '三级分销',
  `first` float(8,2) NOT NULL COMMENT '一级比例',
  `second` float(8,2) NOT NULL COMMENT '二级比例',
  `third` float(8,2) NOT NULL COMMENT '三级比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ysk_sanjithree`
--

INSERT INTO `ysk_sanjithree` (`id`, `first`, `second`, `third`) VALUES
(1, 0.30, 0.20, 0.10);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_sanjitwo`
--

CREATE TABLE IF NOT EXISTS `ysk_sanjitwo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '三级分销',
  `first` float(8,2) NOT NULL COMMENT '一级比例',
  `second` float(8,2) NOT NULL COMMENT '二级比例',
  `third` float(8,2) NOT NULL COMMENT '三级比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ysk_sanjitwo`
--

INSERT INTO `ysk_sanjitwo` (`id`, `first`, `second`, `third`) VALUES
(1, 0.30, 0.20, 0.12);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_seed_to_fruit`
--

CREATE TABLE IF NOT EXISTS `ysk_seed_to_fruit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` int(11) NOT NULL COMMENT '总种子数量',
  `fee` decimal(14,2) NOT NULL COMMENT '手续费',
  `create_time` int(11) NOT NULL,
  `fruit` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '扣除手续费后的数量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_shifeijl`
--

CREATE TABLE IF NOT EXISTS `ysk_shifeijl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '施肥表id ',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `shifei_num` decimal(13,2) NOT NULL COMMENT '施肥数量',
  `farm_id` int(11) NOT NULL COMMENT '农田id',
  `tudi_type` tinyint(4) NOT NULL COMMENT '土地类型:1黄土地，2红土地，3黑土地',
  `shifei_time` int(11) NOT NULL COMMENT '施肥时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=458 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_shop_banner`
--

CREATE TABLE IF NOT EXISTS `ysk_shop_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '轮播图ID',
  `name` varchar(126) DEFAULT NULL COMMENT '轮播图名称',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `ctime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `s_sort` tinyint(5) DEFAULT '0' COMMENT '排序',
  `s_desc` varchar(120) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ysk_shop_banner`
--

INSERT INTO `ysk_shop_banner` (`id`, `name`, `pic`, `url`, `ctime`, `s_sort`, `s_desc`) VALUES
(1, '夏装新时尚', '/Themes/Shop/Public/images/banner.jpg', '#', '1506350099', 0, '描述'),
(2, '夏装新时尚', '/Themes/Shop/Public/images/banner.jpg', '#', '1506350099', 0, '描述'),
(3, '夏装新时尚', '/Themes/Shop/Public/images/banner.jpg', '#', '1506350099', 0, '描述'),
(4, '夏装新时尚', '/Themes/Shop/Public/images/banner.jpg', '#', '1506350099', 0, '描述'),
(5, '夏装新时尚', '/Themes/Shop/Public/images/banner.jpg', '#', '1506350099', 0, '描述');

-- --------------------------------------------------------

--
-- 表的结构 `ysk_shouge`
--

CREATE TABLE IF NOT EXISTS `ysk_shouge` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收割表id主键',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `farm_id` int(11) NOT NULL COMMENT '农田id',
  `farm_type` tinyint(4) NOT NULL COMMENT '农田类型：1黄土地 2.红土地 3黑土地',
  `shouge_num` decimal(13,2) NOT NULL COMMENT '收割数量',
  `shouge_time` int(11) NOT NULL COMMENT '收割时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=688 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_sow`
--

CREATE TABLE IF NOT EXISTS `ysk_sow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '播种记录表id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `farm_id` tinyint(4) NOT NULL COMMENT '农田id',
  `sow_num` int(11) NOT NULL COMMENT '播种数量',
  `farm_type` tinyint(4) NOT NULL COMMENT '土地类型：1.黄土地 2.红土地 3.黑土地',
  `sow_type` varchar(15) NOT NULL COMMENT '播种类型',
  `sow_time` int(11) NOT NULL COMMENT '播种时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '播种状态  0隐藏 1显示',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=560 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_steal_detail`
--

CREATE TABLE IF NOT EXISTS `ysk_steal_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '种子奖励表id  ',
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `num` char(20) NOT NULL COMMENT '推荐人id',
  `fid` int(11) NOT NULL COMMENT '种子数量',
  `create_time` int(11) NOT NULL COMMENT '奖励时间',
  `type_name` varchar(20) NOT NULL COMMENT '状态',
  `username` varchar(20) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `datestr` varchar(20) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0-取偷 1-被偷',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=928 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_store`
--

CREATE TABLE IF NOT EXISTS `ysk_store` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `cangku_num` decimal(13,5) NOT NULL DEFAULT '0.00000' COMMENT '钱包E余额',
  `fengmi_num` decimal(13,5) NOT NULL DEFAULT '0.00000' COMMENT 'P积分',
  `plant_num` decimal(13,4) NOT NULL DEFAULT '0.0000' COMMENT '播种总数',
  `huafei_total` decimal(13,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '施肥累计',
  `vip_grade` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 `ysk_store`
--

INSERT INTO `ysk_store` (`uid`, `cangku_num`, `fengmi_num`, `plant_num`, `huafei_total`, `vip_grade`) VALUES
(8569, '0.59955', '149.40045', '0.0000', '0.00', 0),
(8580, '0.44864', '49.55136', '0.0000', '0.00', 0),
(8581, '0.29954', '49.70046', '0.0000', '0.00', 0),
(8582, '0.00000', '50.00000', '0.0000', '0.00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_tcp_config`
--

CREATE TABLE IF NOT EXISTS `ysk_tcp_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '挑粪/采蜜/扑鱼设置表',
  `farm_type` tinyint(1) NOT NULL COMMENT '1->鸡窝挑粪设置,2->渔场扑鱼设置,3->果园好友',
  `dai_dets` int(2) NOT NULL COMMENT '对应第几代',
  `earns_bili` float(10,2) NOT NULL COMMENT '可拿收益比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ysk_tcp_config`
--

INSERT INTO `ysk_tcp_config` (`id`, `farm_type`, `dai_dets`, `earns_bili`) VALUES
(1, 1, 1, 0.07),
(2, 1, 2, 0.05),
(3, 1, 3, 0.03),
(4, 3, 3, 0.05),
(5, 3, 4, 0.03);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_tool`
--

CREATE TABLE IF NOT EXISTS `ysk_tool` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `t_name` varchar(20) NOT NULL DEFAULT '',
  `t_num` int(11) NOT NULL DEFAULT '0' COMMENT '价格',
  `t_type` tinyint(1) NOT NULL DEFAULT '0',
  `t_month` tinyint(4) NOT NULL DEFAULT '0',
  `t_fieldname` varchar(20) DEFAULT NULL,
  `t_value` tinyint(4) NOT NULL DEFAULT '1',
  `t_img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `ysk_tool`
--

INSERT INTO `ysk_tool` (`id`, `t_name`, `t_num`, `t_type`, `t_month`, `t_fieldname`, `t_value`, `t_img`) VALUES
(1, '狗粮', 16, 1, 1, NULL, 0, '/Public/home/wap/images/ck2.jpg'),
(2, '一键采蜜', 12, 1, 1, NULL, 0, '/Public/home/wap/images/ck3.jpg'),
(3, '农夫', 128, 2, 0, 'nongfu_num', 1, '/Public/home/wap/images/ck10.jpg'),
(4, '鸟', 108, 2, 0, 'niao_num', 1, '/Public/home/wap/images/ck4.jpg'),
(5, '小鸡', 88, 2, 0, 'ji_num', 1, '/Public/home/wap/images/ck8.jpg'),
(6, '猫', 98, 2, 0, 'mao_num', 1, '/Public/home/wap/images/ck9.jpg'),
(7, '泰迪', 68, 2, 0, 'zangao_num', 1, '/Public/home/wap/images/ck6.jpg'),
(8, '哈士奇', 98, 2, 0, 'zangao_num', 2, '/Public/home/wap/images/ck5.jpg'),
(9, '藏獒', 128, 2, 0, 'zangao_num', 3, '/Public/home/wap/images/ck7.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `ysk_trading`
--

CREATE TABLE IF NOT EXISTS `ysk_trading` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '出售数量',
  `sell_id` int(11) NOT NULL DEFAULT '0' COMMENT '出售人ID',
  `sell_account` varchar(50) NOT NULL,
  `sell_username` varchar(20) DEFAULT NULL,
  `buy_id` int(11) NOT NULL DEFAULT '0' COMMENT '购买者ID',
  `buy_account` varchar(50) NOT NULL COMMENT '购买者账号',
  `buy_username` varchar(20) DEFAULT NULL COMMENT '购买者姓名',
  `fee_num` decimal(11,2) NOT NULL COMMENT '手续费',
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-出售成功 1-买家确认  2-买家确认 3-取消交易',
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sell_id` (`sell_id`) USING BTREE,
  KEY `buy_id` (`buy_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=51 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_trading_free`
--

CREATE TABLE IF NOT EXISTS `ysk_trading_free` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '出售数量',
  `sell_id` int(11) NOT NULL DEFAULT '0' COMMENT '出售人ID',
  `sell_account` varchar(50) NOT NULL,
  `sell_username` varchar(20) DEFAULT NULL,
  `buy_id` int(11) NOT NULL DEFAULT '0' COMMENT '购买者ID',
  `buy_account` varchar(50) DEFAULT NULL COMMENT '购买者账号',
  `buy_username` varchar(20) DEFAULT NULL COMMENT '购买者姓名',
  `fee_num` decimal(11,2) NOT NULL COMMENT '手续费',
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-出售成功 1-买家确认  2-买家确认 3-取消交易',
  `img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sell_id` (`sell_id`) USING BTREE,
  KEY `buy_id` (`buy_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=118 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_tranmoney`
--

CREATE TABLE IF NOT EXISTS `ysk_tranmoney` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_id` int(10) DEFAULT NULL COMMENT '支付的会员',
  `get_id` int(10) DEFAULT NULL COMMENT '收到转账用户id',
  `get_nums` decimal(10,2) DEFAULT '0.00' COMMENT '转账总金额',
  `get_time` char(30) DEFAULT '0' COMMENT '转账时间',
  `get_type` tinyint(1) DEFAULT '0' COMMENT '0->转账,1->P积分相关【转出80%与转入20%（只记录转入数）】、【E余额对换P积分（正数）或P积分释放E余额（负数）（判断2个UID相等）】,2->P积分释放到E余额（记录E余额）,3->【E余额交易】挂求购,4->购买，5->【E余额交易】出售，6->取消，7->购买众筹， 8->买入（增加E余额），9->卖出（减E余额），10->取消（卖家返回E余额），11->后台操作-E余额，12->后台操作-P积分，13->E余额兑换P积分（记录E余额），22->转入的人弹出领取红包 23 推荐赠送 24 购物送P积分',
  `now_nums` decimal(11,2) DEFAULT '0.00' COMMENT '兑换之后当前E余额 ',
  `now_nums_get` decimal(11,2) DEFAULT '0.00' COMMENT '兑换之后当前E余额 ',
  `is_release` tinyint(1) DEFAULT '0' COMMENT '0->未释放转账,1->1以释放转账',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=73612 ;

--
-- 转存表中的数据 `ysk_tranmoney`
--

INSERT INTO `ysk_tranmoney` (`id`, `pay_id`, `get_id`, `get_nums`, `get_time`, `get_type`, `now_nums`, `now_nums_get`, `is_release`) VALUES
(73595, 8569, 8569, '50.00', '1532097427', 23, '50.00', '50.00', 1),
(73596, 8580, 8580, '0.15', '1532097441', 2, '0.15', '0.15', 1),
(73597, 8580, 8580, '-0.15', '1532097441', 1, '49.85', '49.85', 1),
(73598, 8580, 8580, '0.15', '1532249365', 2, '0.30', '0.30', 1),
(73599, 8580, 8580, '-0.15', '1532249365', 1, '49.70', '49.70', 1),
(73600, 8569, 8569, '0.15', '1532252183', 2, '0.15', '0.15', 1),
(73601, 8569, 8569, '-0.15', '1532252183', 1, '49.85', '49.85', 1),
(73602, 8569, 8569, '50.00', '1532252307', 23, '99.85', '99.85', 1),
(73603, 8581, 8581, '0.15', '1532252342', 2, '0.15', '0.15', 1),
(73604, 8581, 8581, '-0.15', '1532252342', 1, '49.85', '49.85', 1),
(73605, 8580, 8580, '0.15', '1532302987', 2, '0.45', '0.45', 1),
(73606, 8580, 8580, '-0.15', '1532302987', 1, '49.55', '49.55', 1),
(73607, 8581, 8581, '0.15', '1532310190', 2, '0.30', '0.30', 1),
(73608, 8581, 8581, '-0.15', '1532310190', 1, '49.70', '49.70', 1),
(73609, 8569, 8569, '50.00', '1532316074', 23, '149.85', '149.85', 1),
(73610, 8569, 8569, '0.45', '1532316185', 2, '0.60', '0.60', 1),
(73611, 8569, 8569, '-0.45', '1532316185', 1, '149.40', '149.40', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_trans`
--

CREATE TABLE IF NOT EXISTS `ysk_trans` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '挂单中心',
  `payout_id` int(10) DEFAULT '0' COMMENT '转出E余额会员id',
  `payin_id` int(10) DEFAULT '0' COMMENT '转入会员id',
  `pay_nums` decimal(11,2) DEFAULT '0.00' COMMENT '转出数量',
  `pay_state` tinyint(1) DEFAULT '0' COMMENT '订单状态:0->默认上架,1->有人买入,2->已打款,3->确认到款(已完成)',
  `pay_time` char(30) DEFAULT NULL COMMENT '订单生成时间',
  `pay_no` char(30) DEFAULT NULL COMMENT '订单编号',
  `card_id` int(10) DEFAULT NULL COMMENT '会员银行卡id',
  `trade_notes` text COMMENT '订单备注',
  `trans_type` tinyint(1) DEFAULT '0' COMMENT '0->买入,1->卖出',
  `trans_img` varchar(100) DEFAULT NULL COMMENT '打款凭证',
  `get_moneytime` char(50) DEFAULT NULL COMMENT '收到款时间',
  `fee_nums` decimal(11,2) DEFAULT '0.00' COMMENT '手续费',
  `out_card` int(10) DEFAULT NULL COMMENT '买入会员银行卡id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=161 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_trans_quxiao`
--

CREATE TABLE IF NOT EXISTS `ysk_trans_quxiao` (
  `id` int(10) NOT NULL COMMENT '挂单中心',
  `payout_id` int(10) DEFAULT '0' COMMENT '转出E余额会员id',
  `payin_id` int(10) DEFAULT '0' COMMENT '转入会员id',
  `pay_nums` decimal(11,2) DEFAULT '0.00' COMMENT '转出数量',
  `pay_state` tinyint(1) DEFAULT '0' COMMENT '订单状态:0->默认上架,1->有人买入,2->已打款,3->确认到款(已完成),4->取消',
  `pay_time` char(30) DEFAULT NULL COMMENT '订单生成时间',
  `pay_no` char(30) DEFAULT NULL COMMENT '订单编号',
  `card_id` int(10) DEFAULT NULL COMMENT '会员银行卡id',
  `trade_notes` text COMMENT '订单备注',
  `trans_type` tinyint(1) DEFAULT '0' COMMENT '0->买入,1->卖出,',
  `trans_img` varchar(100) DEFAULT NULL COMMENT '打款凭证',
  `get_moneytime` char(50) DEFAULT NULL COMMENT '收到款时间',
  `fee_nums` decimal(11,2) DEFAULT '0.00' COMMENT '手续费',
  `out_card` int(10) DEFAULT NULL COMMENT '买入会员银行卡id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ysk_trans_quxiao`
--

INSERT INTO `ysk_trans_quxiao` (`id`, `payout_id`, `payin_id`, `pay_nums`, `pay_state`, `pay_time`, `pay_no`, `card_id`, `trade_notes`, `trans_type`, `trans_img`, `get_moneytime`, `fee_nums`, `out_card`) VALUES
(132, 0, 8574, '500.00', 0, '1530495303', 'PAY2018070255505751', NULL, '', 1, NULL, NULL, '0.00', 339),
(127, 0, 8573, '500.00', 0, '1530240894', 'PAY2018062910197499', NULL, '', 1, NULL, NULL, '0.00', 335),
(126, 8573, 8545, '500.00', 1, '1530007597', 'PAY2018062610050974', 2, '', 1, NULL, NULL, '100.00', 328),
(143, 0, 8569, '500.00', 0, '1530612770', 'PAY2018070350555148', NULL, '', 1, NULL, NULL, '0.00', 338),
(131, 0, 8569, '500.00', 0, '1530341088', 'PAY2018063048514999', NULL, '', 1, NULL, NULL, '0.00', 338),
(136, 0, 8579, '500.00', 0, '1530513859', 'PAY2018070251535757', NULL, '', 1, NULL, NULL, '0.00', 340),
(150, 0, 8579, '500.00', 0, '1530688235', 'PAY2018070498519749', NULL, '', 1, NULL, NULL, '0.00', 347),
(151, 0, 8579, '500.00', 0, '1530688559', 'PAY2018070410249531', NULL, '', 1, NULL, NULL, '0.00', 347);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_tuandui`
--

CREATE TABLE IF NOT EXISTS `ysk_tuandui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id_2` (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_turntable_lv`
--

CREATE TABLE IF NOT EXISTS `ysk_turntable_lv` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '转盘抽奖概率',
  `one` int(11) unsigned NOT NULL DEFAULT '0',
  `two` int(11) unsigned NOT NULL DEFAULT '0',
  `three` int(11) unsigned NOT NULL DEFAULT '0',
  `four` int(11) unsigned NOT NULL DEFAULT '0',
  `five` int(11) unsigned NOT NULL DEFAULT '0',
  `six` int(11) unsigned NOT NULL DEFAULT '0',
  `seven` int(11) unsigned NOT NULL DEFAULT '0',
  `eight` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED AUTO_INCREMENT=6000002 ;

--
-- 转存表中的数据 `ysk_turntable_lv`
--

INSERT INTO `ysk_turntable_lv` (`id`, `one`, `two`, `three`, `four`, `five`, `six`, `seven`, `eight`) VALUES
(6000001, 0, 0, 1, 1, 1, 1, 30, 70);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_ubanks`
--

CREATE TABLE IF NOT EXISTS `ysk_ubanks` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '会员绑定银行卡',
  `card_id` int(2) NOT NULL COMMENT '银行卡id',
  `user_id` int(10) NOT NULL COMMENT '会员id',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-》默认,1->默认银行卡',
  `add_time` char(30) NOT NULL COMMENT '添加时间',
  `hold_name` char(50) NOT NULL COMMENT '持卡人姓名',
  `card_number` char(19) NOT NULL COMMENT '银行卡号',
  `open_card` char(100) NOT NULL COMMENT '开户支行',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=351 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_ucoins`
--

CREATE TABLE IF NOT EXISTS `ysk_ucoins` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '每个人账户对应币',
  `cid` int(10) NOT NULL COMMENT '币对应id',
  `c_nums` decimal(11,4) NOT NULL DEFAULT '0.0000' COMMENT '对应币数量',
  `c_uid` int(10) NOT NULL COMMENT '对应的会员id',
  `djie_nums` decimal(11,4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `ysk_ucoins`
--

INSERT INTO `ysk_ucoins` (`id`, `cid`, `c_nums`, `c_uid`, `djie_nums`) VALUES
(29, 1, '12.0000', 8569, '0.0000');

-- --------------------------------------------------------

--
-- 表的结构 `ysk_uesources`
--

CREATE TABLE IF NOT EXISTS `ysk_uesources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' 用户资源表(拆分比例,风车拥有数量)',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `chaifen_bili` float(8,4) NOT NULL DEFAULT '0.0000' COMMENT '拆分比例',
  `jiwo_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '鸡窝收益',
  `count_time` date NOT NULL COMMENT '计算拆分/收益时间',
  `earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '记录收益',
  `tiaofen_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '挑粪收益',
  `guoyuan_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '果园施肥收益',
  `yuchang_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '渔场喂鱼收益',
  `buyu_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '捕鱼收益',
  `guoyuan_chaifen` float(11,3) NOT NULL DEFAULT '0.000' COMMENT '果园拆分',
  `yuchang_chaifen` float(11,3) NOT NULL DEFAULT '0.000' COMMENT '渔场拆分',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE COMMENT '表id',
  KEY `uid` (`uid`) USING BTREE COMMENT '用户id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_upgoods`
--

CREATE TABLE IF NOT EXISTS `ysk_upgoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商户产品表',
  `uid` int(11) NOT NULL COMMENT '商户id',
  `goods_id` int(11) NOT NULL COMMENT '产品id',
  `uptime` int(20) NOT NULL COMMENT '产品上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=276 ;

--
-- 转存表中的数据 `ysk_upgoods`
--

INSERT INTO `ysk_upgoods` (`id`, `uid`, `goods_id`, `uptime`) VALUES
(161, 1, 120, 1523524539),
(162, 1, 1, 1523524892),
(163, 1, 121, 1523527487),
(164, 1, 122, 1523527893),
(165, 1, 123, 1523528164),
(166, 1, 124, 1523585146),
(167, 1, 1, 1523585999),
(168, 1, 1, 1523590787),
(169, 1, 1, 1523590805),
(170, 1, 125, 1523591034),
(171, 1, 1, 1523591062),
(172, 1, 1, 1523591084),
(173, 1, 1, 1523591691),
(174, 1, 1, 1523591706),
(175, 1, 126, 1523591905),
(176, 1, 127, 1523592170),
(177, 1, 1, 1523592183),
(178, 1, 128, 1523599780),
(179, 1, 129, 1523600007),
(180, 1, 130, 1523600332),
(181, 1, 131, 1523600487),
(182, 1, 1, 1523600643),
(183, 1, 1, 1523600994),
(184, 1, 1, 1523601000),
(185, 1, 134, 1523601233),
(186, 1, 1, 1523601368),
(187, 1, 1, 1523601669),
(188, 1, 1, 1523601939),
(189, 1, 1, 1523602635),
(190, 1, 1, 1523602922),
(191, 1, 1, 1523602954),
(192, 1, 1, 1523603192),
(193, 1, 1, 1523603229),
(194, 1, 1, 1523603236),
(195, 1, 1, 1523603247),
(196, 1, 1, 1523603254),
(197, 1, 1, 1523603264),
(198, 1, 1, 1523603272),
(199, 1, 1, 1523603281),
(200, 1, 1, 1523603288),
(201, 1, 1, 1523603297),
(202, 1, 139, 1523678159),
(203, 1, 140, 1523681996),
(204, 1, 141, 1523682082),
(205, 1, 142, 1523682186),
(206, 1, 143, 1523682266),
(207, 1, 144, 1523682359),
(208, 1, 145, 1523682452),
(209, 1, 146, 1523682580),
(210, 1, 147, 1523682632),
(211, 1, 148, 1523682759),
(212, 1, 149, 1523682825),
(213, 1, 150, 1523682902),
(214, 1, 151, 1523682999),
(215, 1, 152, 1523683071),
(216, 1, 153, 1523683148),
(217, 1, 154, 1523683209),
(218, 1, 155, 1523683285),
(219, 1, 156, 1523683378),
(220, 1, 157, 1523683444),
(221, 1, 158, 1523683515),
(222, 1, 159, 1523683570),
(223, 1, 160, 1523683659),
(224, 1, 161, 1523683725),
(225, 1, 162, 1523683804),
(226, 1, 163, 1523683860),
(227, 1, 164, 1523683977),
(228, 1, 165, 1523684050),
(229, 1, 166, 1523684121),
(230, 1, 1, 1523684189),
(231, 1, 1, 1523684211),
(232, 1, 1, 1523684226),
(233, 1, 1, 1523690932),
(234, 1, 1, 1523690943),
(235, 1, 1, 1523690951),
(236, 1, 1, 1523690960),
(237, 1, 1, 1523690978),
(238, 1, 1, 1523690994),
(239, 1, 1, 1523691012),
(240, 1, 1, 1523691022),
(241, 1, 1, 1523691032),
(242, 1, 1, 1523691569),
(243, 1, 1, 1523691731),
(244, 1, 1, 1523692218),
(245, 1, 1, 1523694090),
(246, 1, 1, 1523694440),
(247, 1, 1, 1523694539),
(248, 1, 1, 1523694665),
(249, 1, 1, 1523694727),
(250, 1, 1, 1523695077),
(251, 1, 1, 1523695326),
(252, 1, 1, 1523695512),
(253, 1, 1, 1523695722),
(254, 1, 1, 1523695930),
(255, 1, 1, 1523696092),
(256, 1, 1, 1523696221),
(257, 1, 1, 1523696271),
(258, 1, 1, 1523696343),
(259, 1, 1, 1523696374),
(260, 1, 1, 1523696409),
(261, 1, 1, 1523697334),
(262, 1, 1, 1524195965),
(263, 0, 171, 1524204208),
(264, 0, 172, 1524204245),
(265, 24, 1, 1524204574),
(266, 24, 173, 1524205395),
(267, 24, 1, 1524205408),
(268, 25, 174, 1524449398),
(269, 26, 175, 1524741955),
(270, 27, 176, 1529046933),
(271, 28, 177, 1529047274),
(272, 27, 178, 1529059391),
(273, 27, 179, 1529059631),
(274, 27, 180, 1529059814),
(275, 29, 181, 1529565644);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_upload`
--

CREATE TABLE IF NOT EXISTS `ysk_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'UID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `url` varchar(255) DEFAULT NULL COMMENT '文件链接',
  `ext` char(4) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) DEFAULT NULL COMMENT '文件md5',
  `sha1` char(40) DEFAULT NULL COMMENT '文件sha1编码',
  `location` varchar(15) NOT NULL DEFAULT '' COMMENT '文件存储位置',
  `download` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_user`
--

CREATE TABLE IF NOT EXISTS `ysk_user` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL COMMENT '上级ID',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '上上级ID',
  `ggid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上上上级ID',
  `account` char(20) NOT NULL DEFAULT '0' COMMENT '用户账号',
  `mobile` char(20) NOT NULL COMMENT '用户手机号',
  `username` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `safety_pwd` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '安全密码',
  `safety_salt` char(5) CHARACTER SET latin1 NOT NULL,
  `login_pwd` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `login_salt` char(3) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-女 1-男',
  `reg_date` int(11) NOT NULL COMMENT '注册时间',
  `reg_ip` varchar(20) NOT NULL COMMENT '注册IP',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户锁定  1 不锁  0拉黑  -1 删除',
  `activate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否激活 1-已激活 0-未激活',
  `session_id` varchar(225) DEFAULT NULL,
  `wx_no` varchar(20) DEFAULT '0' COMMENT '微信',
  `alipay` varchar(20) DEFAULT NULL,
  `note` text,
  `deep` int(11) NOT NULL DEFAULT '0',
  `path` text,
  `user_credit` int(11) NOT NULL DEFAULT '5' COMMENT '用户星级',
  `use_grade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户等级',
  `img_head` varchar(100) NOT NULL DEFAULT 'toux-icon.png' COMMENT '用户头像',
  `bank_uname` varchar(20) DEFAULT NULL COMMENT '开户名',
  `releas_rate` float(10,4) NOT NULL DEFAULT '0.0000' COMMENT '增加的释放率',
  `releas_time` char(40) NOT NULL DEFAULT '1' COMMENT '释放时间',
  `is_reward` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0->默认未领取奖金,1->已经领取P积分释放',
  `today_releas` float(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '今日释放率',
  `is_dailishang` tinyint(1) NOT NULL DEFAULT '0' COMMENT '2->商家',
  `wallet_add` text COMMENT '个人钱包地址',
  `vip_grade` tinyint(1) DEFAULT '0',
  `yinbi` tinyint(1) DEFAULT '0',
  `quanxian` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  UNIQUE KEY `account` (`account`) USING BTREE,
  KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=8583 ;

--
-- 转存表中的数据 `ysk_user`
--

INSERT INTO `ysk_user` (`userid`, `pid`, `gid`, `ggid`, `account`, `mobile`, `username`, `email`, `safety_pwd`, `safety_salt`, `login_pwd`, `login_salt`, `sex`, `reg_date`, `reg_ip`, `status`, `activate`, `session_id`, `wx_no`, `alipay`, `note`, `deep`, `path`, `user_credit`, `use_grade`, `img_head`, `bank_uname`, `releas_rate`, `releas_time`, `is_reward`, `today_releas`, `is_dailishang`, `wallet_add`, `vip_grade`, `yinbi`, `quanxian`) VALUES
(8569, 0, 0, 0, '13007516318', '13007516318', 'cbdc官网', '', '204ff5d34d43a4d74a8b397b26b855ae', 'a88', '204ff5d34d43a4d74a8b397b26b855ae', 'a88', 0, 1530068736, '1.192.80.97', 1, 1, '5und3phk7le7q3so1366gf94n5', '0', NULL, NULL, 15, '', 5, 1, '3b296597b0a036ddbde1bf191c4ca433.png', 'erwtr', 0.0000, '1532316185', 1, 0.0000, 0, '4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx', 0, 0, ''),
(8580, 8569, 0, 0, '13266864166', '13266864166', '通天塔', '', 'b3d071e7cfa41451c86bc347044acd66', '553', '81fa590038acee8eae389145e10f94e7', '504', 0, 1532097427, '120.229.88.189', 1, 1, 'g64oiv52mv71hvv6i777bu6lk0', '0', NULL, NULL, 16, '-8569-', 5, 0, 'toux-icon.png', NULL, 0.0000, '1532302987', 1, 0.0000, 0, 'iRPxRQAv3mh2NhwZkwwX6udi3Yda0OSd0d', 0, 0, NULL),
(8581, 8569, 0, 0, '18005151538', '17376745043', '黄先生', '', '72a993f366279cf7b0cad36d9fc2c04f', 'b9b', '72a993f366279cf7b0cad36d9fc2c04f', 'b9b', 0, 1532252307, '113.115.62.47', 1, 1, 'urgkae3ujjkdg7k37p890av1d6', '0', NULL, NULL, 16, '-8569-', 5, 0, 'toux-icon.png', NULL, 0.0000, '1532310190', 1, 0.0000, 0, 'wPclOyyu2eYA3wmcNzPWZQVPk3yYCOD2zh', 0, 0, ''),
(8582, 8569, 0, 0, '15527374885', '15527374885', '刘123', '', 'b5782fc12d207e6f1a48bd492c837ad2', 'ac6', '4e4324f6db122749e7f1c5c34d51900d', 'ac6', 0, 1532316074, '113.91.148.111', 1, 1, 'g0413oc7c8v61tgcrgvsh8d476', '0', NULL, NULL, 16, '-8569-', 5, 0, 'toux-icon.png', NULL, 0.0000, '1', 0, 0.0000, 0, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_user_action`
--

CREATE TABLE IF NOT EXISTS `ysk_user_action` (
  `ua_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(40) NOT NULL COMMENT 'frontend,backend',
  `user_id` int(11) NOT NULL,
  `uname` varchar(40) NOT NULL COMMENT '用户名',
  `add_time` varchar(40) NOT NULL COMMENT '加入时间',
  `info` varchar(255) NOT NULL COMMENT '行为描述',
  PRIMARY KEY (`ua_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户行为' AUTO_INCREMENT=239 ;

--
-- 转存表中的数据 `ysk_user_action`
--

INSERT INTO `ysk_user_action` (`ua_id`, `type`, `user_id`, `uname`, `add_time`, `info`) VALUES
(207, '后台系统用户', 1, 'admin', '2018-06-17 18:09:56', '登录了后台系统'),
(208, '后台系统用户', 1, 'admin', '2018-06-17 21:18:20', '登录了后台系统'),
(209, '后台系统用户', 1, 'admin', '2018-06-19 09:51:33', '登录了后台系统'),
(210, '后台系统用户', 1, 'admin', '2018-06-19 10:56:10', '登录了后台系统'),
(211, '后台系统用户', 1, 'admin', '2018-06-19 16:52:35', '登录了后台系统'),
(212, '后台系统用户', 1, 'admin', '2018-06-19 16:52:38', '登录了后台系统'),
(213, '后台系统用户', 1, 'admin', '2018-06-20 16:04:45', '登录了后台系统'),
(214, '后台系统用户', 1, 'admin', '2018-06-20 16:56:41', '登录了后台系统'),
(215, '后台系统用户', 1, 'admin', '2018-06-20 17:46:56', '登录了后台系统'),
(216, '后台系统用户', 1, 'admin', '2018-06-20 18:17:50', '登录了后台系统'),
(217, '后台系统用户', 1, 'admin', '2018-06-20 19:05:45', '登录了后台系统'),
(218, '后台系统用户', 1, 'admin', '2018-06-21 15:16:20', '登录了后台系统'),
(219, '后台系统用户', 1, 'admin', '2018-06-21 16:21:08', '登录了后台系统'),
(220, '后台系统用户', 1, 'admin', '2018-06-22 18:53:48', '登录了后台系统'),
(221, '后台系统用户', 1, 'admin', '2018-06-22 18:53:56', '登录了后台系统'),
(222, '后台系统用户', 1, 'admin', '2018-06-22 19:01:46', '登录了后台系统'),
(223, '后台系统用户', 1, 'admin', '2018-06-22 19:37:44', '登录了后台系统'),
(224, '后台系统用户', 1, 'admin', '2018-06-23 14:46:44', '登录了后台系统'),
(225, '后台系统用户', 1, 'admin', '2018-06-25 09:59:30', '登录了后台系统'),
(226, '后台系统用户', 1, 'admin', '2018-06-26 10:07:24', '登录了后台系统'),
(227, '后台系统用户', 1, 'admin', '2018-06-26 18:03:01', '登录了后台系统'),
(228, '后台系统用户', 1, 'admin', '2018-06-26 18:58:17', '登录了后台系统'),
(229, '后台系统用户', 1, 'admin', '2018-07-06 14:44:26', '登录了后台系统'),
(230, '后台系统用户', 1, 'admin', '2018-07-12 16:01:48', '登录了后台系统'),
(231, '后台系统用户', 1, 'admin', '2018-07-12 17:36:19', '登录了后台系统'),
(232, '后台系统用户', 1, 'admin', '2018-07-19 22:37:19', '登录了后台系统'),
(233, '后台系统用户', 1, 'admin', '2018-07-19 23:12:24', '登录了后台系统'),
(234, '后台系统用户', 1, 'admin', '2018-07-20 21:58:10', '登录了后台系统'),
(235, '后台系统用户', 1, 'admin', '2018-07-20 22:50:49', '登录了后台系统'),
(236, '后台系统用户', 1, 'admin', '2018-07-21 09:28:18', '登录了后台系统'),
(237, '后台系统用户', 1, 'admin', '2018-07-22 16:56:53', '登录了后台系统'),
(238, '后台系统用户', 1, 'admin', '2018-07-27 14:53:36', '登录了后台系统');

-- --------------------------------------------------------

--
-- 表的结构 `ysk_user_caimi`
--

CREATE TABLE IF NOT EXISTS `ysk_user_caimi` (
  `uid` int(11) unsigned NOT NULL COMMENT '采蜜表',
  `num` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `datestr` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_user_copy`
--

CREATE TABLE IF NOT EXISTS `ysk_user_copy` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL COMMENT '上级ID',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '上上级ID',
  `ggid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上上上级ID',
  `account` char(20) NOT NULL DEFAULT '0' COMMENT '用户账号',
  `mobile` char(20) NOT NULL COMMENT '用户手机号',
  `username` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `safety_pwd` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '安全密码',
  `safety_salt` char(5) CHARACTER SET latin1 NOT NULL,
  `login_pwd` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `login_salt` char(3) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-女 1-男',
  `reg_date` int(11) NOT NULL COMMENT '注册时间',
  `reg_ip` varchar(20) NOT NULL COMMENT '注册IP',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户锁定  1 不锁  0拉黑  -1 删除',
  `activate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否激活 1-已激活 0-未激活',
  `session_id` varchar(225) DEFAULT NULL,
  `wx_no` varchar(20) DEFAULT '0' COMMENT '微信',
  `alipay` varchar(20) DEFAULT NULL,
  `note` text,
  `deep` int(11) NOT NULL DEFAULT '0',
  `path` text,
  `user_credit` int(11) NOT NULL DEFAULT '5' COMMENT '用户星级',
  `use_grade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户等级',
  `img_head` varchar(100) NOT NULL DEFAULT 'toux-icon.png' COMMENT '用户头像',
  `bank_uname` varchar(20) NOT NULL COMMENT '开户名',
  `releas_rate` float(10,4) NOT NULL DEFAULT '0.0000' COMMENT '增加的释放率',
  `releas_time` char(40) NOT NULL DEFAULT '1' COMMENT '释放时间',
  `is_reward` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0->默认未领取奖金,1->已经领取P积分释放',
  `today_releas` float(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '今日释放率',
  `is_dailishang` tinyint(1) NOT NULL DEFAULT '0' COMMENT '2->商家',
  `wallet_add` text NOT NULL COMMENT '个人钱包地址',
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  UNIQUE KEY `account` (`account`) USING BTREE,
  KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4064 ;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_user_dogeat`
--

CREATE TABLE IF NOT EXISTS `ysk_user_dogeat` (
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` int(11) NOT NULL COMMENT '总种子数量',
  `create_time` int(11) NOT NULL,
  `datestr` varchar(11) NOT NULL DEFAULT '0.00' COMMENT '扣除手续费后的数量',
  PRIMARY KEY (`uid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_user_huafei`
--

CREATE TABLE IF NOT EXISTS `ysk_user_huafei` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户每天产生的化肥',
  `huafei_num` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当天产生的肥料',
  `datestr` char(20) CHARACTER SET utf16 NOT NULL DEFAULT '',
  `uid_str` varchar(255) NOT NULL DEFAULT '',
  `pid_caimi` int(11) NOT NULL DEFAULT '0' COMMENT '一级采蜜',
  `gid_caimi` int(11) NOT NULL DEFAULT '0' COMMENT '二级采蜜',
  `ggid_caimi` int(11) NOT NULL DEFAULT '0' COMMENT '三级采蜜',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_user_level`
--

CREATE TABLE IF NOT EXISTS `ysk_user_level` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户ID   用户等级表',
  `nongfu_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '农夫',
  `zangao_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '藏獒数量 1-小狗 2-中狗 3-大狗',
  `mao_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '猫',
  `land_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '种树数量',
  `sell_num` int(11) NOT NULL DEFAULT '0' COMMENT '出售次数',
  `buy_num` int(11) NOT NULL DEFAULT '0' COMMENT '出售数量',
  `children_num` int(11) NOT NULL DEFAULT '0' COMMENT '用户直推人数',
  `ji_num` int(11) NOT NULL DEFAULT '0' COMMENT '鸡',
  `niao_num` int(11) NOT NULL DEFAULT '0' COMMENT '鸟',
  `user_level` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_user_seed`
--

CREATE TABLE IF NOT EXISTS `ysk_user_seed` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户种子',
  `zhongzi_num` decimal(11,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 `ysk_user_seed`
--

INSERT INTO `ysk_user_seed` (`uid`, `zhongzi_num`) VALUES
(1, '0.00');

-- --------------------------------------------------------

--
-- 表的结构 `ysk_user_tool_month`
--

CREATE TABLE IF NOT EXISTS `ysk_user_tool_month` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户种子',
  `oneclick` int(11) NOT NULL DEFAULT '0',
  `buy_oneclick_time` int(11) NOT NULL DEFAULT '0',
  `end_oneclick_time` int(11) NOT NULL,
  `dogfood` int(11) NOT NULL COMMENT '狗粮',
  `buy_dogfood_time` int(11) NOT NULL DEFAULT '0',
  `end_dogfood_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- 表的结构 `ysk_verify_list`
--

CREATE TABLE IF NOT EXISTS `ysk_verify_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '认证列表',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `account` varchar(64) NOT NULL COMMENT '账号',
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '认证类型 1个人 2企业',
  `realname` varchar(64) NOT NULL COMMENT '真实姓名',
  `idcard` varchar(64) NOT NULL COMMENT '身份证号',
  `phone` varchar(15) NOT NULL COMMENT '手机号码',
  `up_idcard` varchar(128) DEFAULT NULL COMMENT '身份证正面',
  `down_idcard` varchar(128) DEFAULT NULL COMMENT '身份证反面',
  `hand_idcard` varchar(128) DEFAULT NULL COMMENT '手持身份证',
  `licence` varchar(128) DEFAULT NULL COMMENT '营业执照',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0未审核 1已通过审核 2未通过审核',
  `time` varchar(12) NOT NULL COMMENT '申请时间',
  `datestr` varchar(12) NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=57 ;

--
-- 转存表中的数据 `ysk_verify_list`
--

INSERT INTO `ysk_verify_list` (`id`, `uid`, `account`, `username`, `type`, `realname`, `idcard`, `phone`, `up_idcard`, `down_idcard`, `hand_idcard`, `licence`, `status`, `time`, `datestr`) VALUES
(43, 3060, '13728686350', '多多', 1, '牛玉淑', '430528198107135889', '13728686350', '/Uploads/image/shop/2018-04-24/5ade9bc779eae.jpg', '/Uploads/image/shop/2018-04-24/5ade9bc784afc.jpg', NULL, NULL, 0, '1524538311', '20180424'),
(42, 1710, '15170788825', '定时', 2, '速度更', '360731199106230088', '15170788829', NULL, NULL, '/Uploads/image/shop/2018-04-21/5adb33764df1d.png', '/Uploads/image/shop/2018-04-21/5adb33764efb6.png', 1, '1524314998', '20180421'),
(36, 1710, '15170788825', '定时', 1, '是大法官', '360731199106230055', '15170788824', '/Uploads/image/shop/2018-04-21/5adb2d5810d0f.png', '/Uploads/image/shop/2018-04-21/5adb2d58121ff.jpg', NULL, NULL, 2, '1524313432', '20180421'),
(41, 1710, '15170788825', '定时', 1, '东方红', '360731199106230077', '15170788828', '/Uploads/image/shop/2018-04-21/5adb335cca048.JPG', '/Uploads/image/shop/2018-04-21/5adb335ccb11c.png', NULL, NULL, 1, '1524314972', '20180421'),
(38, 1710, '15170788825', '定时', 2, '法国', '360731199106230088', '15170788829', NULL, NULL, '/Uploads/image/shop/2018-04-21/5adb2d9d10a7c.JPG', '/Uploads/image/shop/2018-04-21/5adb2d9d11f20.jpg', 2, '1524313501', '20180421'),
(39, 1710, '15170788825', '定时', 1, '速度更', '360731199106230055', '15170788824', '/Uploads/image/shop/2018-04-21/5adb2e865df94.png', '/Uploads/image/shop/2018-04-21/5adb2e865ecb0.png', NULL, NULL, 2, '1524313734', '20180421'),
(44, 1715, '13243824326', 'Heres', 2, 'gsadhg', '360731199106230055', '15170788825', '/Uploads/image/shop/2018-04-26/5ae1b696253b7.png', '/Uploads/image/shop/2018-04-26/5ae1b6962b7fd.png', '/Uploads/image/shop/2018-04-26/5ae1b6962d52b.png', '/Uploads/image/shop/2018-04-26/5ae1b6962f3a0.png', 1, '1524741782', '20180426'),
(45, 5163, '13574158038', 'lzc8899', 1, '廖仲常', '430124196511058399', '13574158038', '/Uploads/image/shop/2018-05-29/5b0cdaa40b606.jpg', '/Uploads/image/shop/2018-05-29/5b0cdaa40da75.jpg', NULL, NULL, 0, '1527569060', '20180529'),
(46, 5878, '13684898397', '陈钢山', 1, '陈钢山', '360313196409170011', '13684898397', '/Uploads/image/shop/2018-05-29/5b0cf44d0c038.jpg', '/Uploads/image/shop/2018-05-29/5b0cf44d19aeb.jpg', NULL, NULL, 0, '1527575629', '20180529'),
(47, 5747, '18871487589', '拼博', 1, '商银', '420117198710176340', '18871487589', '/Uploads/image/shop/2018-05-29/5b0d1671b9472.jpg', '/Uploads/image/shop/2018-05-29/5b0d1671ba92a.jpg', NULL, NULL, 0, '1527584369', '20180529'),
(48, 4184, '13517375551', '刘芳华', 1, '刘芳华', '432322195503150879', '13517375551', '/Uploads/image/shop/2018-05-29/5b0d4a2413773.jpg', '/Uploads/image/shop/2018-05-29/5b0d4a2418434.jpg', NULL, NULL, 0, '1527597604', '20180529'),
(49, 5874, '15854096590', '秀林', 1, '孔秀林', '372901196510280654', '15854096590', '/Uploads/image/shop/2018-05-30/5b0d8ec297f16.jpg', '/Uploads/image/shop/2018-05-30/5b0d8ec29912e.jpg', NULL, NULL, 0, '1527615170', '20180530'),
(50, 5892, '18173121063', '王朝公益基金', 2, '周顺华', '432625196111269424', '18173121063', NULL, NULL, '/Uploads/image/shop/2018-05-30/5b0d959326955.jpg', '/Uploads/image/shop/2018-05-30/5b0d959327d8d.jpg', 0, '1527616915', '20180530'),
(51, 4125, '13977209588', 'ycj999', 1, '朱', '412722199402133513', '13478987503', '/Uploads/image/shop/2018-06-15/5b234e7d928d5.jpg', '/Uploads/image/shop/2018-06-15/5b234e7d92dc9.jpg', NULL, NULL, 1, '1529040509', '20180615'),
(52, 8537, '18300693527', '董雄飞', 2, 'dongxongfei', '411282199507142811', '18300693527', NULL, NULL, '/Uploads/image/shop/2018-06-15/5b235db3011ba.jpg', '/Uploads/image/shop/2018-06-15/5b235db3015e2.jpg', 0, '1529044403', '20180615'),
(53, 4125, '13977209588', 'ycj999', 1, '朱', '412722199402133513', '13478987503', '/Uploads/image/shop/2018-06-15/5b2360358042d.jpg', '/Uploads/image/shop/2018-06-15/5b236035806d4.jpg', NULL, NULL, 1, '1529045045', '20180615'),
(54, 8539, '15824876380', '魔女', 1, '0111', '411522199601196322', '17596528302', '/Uploads/image/shop/2018-06-15/5b23625b0dab2.jpg', '/Uploads/image/shop/2018-06-15/5b23625b0dc32.jpg', NULL, NULL, 1, '1529045595', '20180615'),
(55, 8553, '17791517166', '张杰', 1, '张杰', '688888888888888888', '17791517166', '/Uploads/image/shop/2018-06-18/5b27bc87c8afb.jpg', '/Uploads/image/shop/2018-06-18/5b27bc87c92a1.jpg', NULL, NULL, 1, '1529330823', '20180618'),
(56, 8545, '13478987503', '小猪', 1, 'xiaozhu', '412722199502133513', '13478987503', '/Uploads/image/shop/2018-06-21/5b2b04b991e71.jpg', '/Uploads/image/shop/2018-06-21/5b2b04b9920c2.jpg', NULL, NULL, 1, '1529545913', '20180621');

-- --------------------------------------------------------

--
-- 表的结构 `ysk_wbao_detail`
--

CREATE TABLE IF NOT EXISTS `ysk_wbao_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '每个人账户对应币',
  `num` decimal(11,4) NOT NULL DEFAULT '0.0000' COMMENT '对应币数量',
  `dprice` decimal(10,4) DEFAULT NULL COMMENT '对应的会员id',
  `tprice` decimal(10,4) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `crowds_id` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1转出，2转入,3释放',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=56598 ;

--
-- 转存表中的数据 `ysk_wbao_detail`
--

INSERT INTO `ysk_wbao_detail` (`id`, `num`, `dprice`, `tprice`, `create_time`, `uid`, `crowds_id`, `type`) VALUES
(56584, '0.0000', '0.0000', '0.0000', 1532097441, 8580, 0, 3),
(56585, '0.0000', '0.0000', '0.0000', 1532097441, 8580, 0, 4),
(56586, '0.0000', '0.0000', '0.0000', 1532249365, 8580, 0, 3),
(56587, '0.0000', '0.0000', '0.0000', 1532249365, 8580, 0, 4),
(56588, '0.0000', '0.0000', '0.0000', 1532252183, 8569, 0, 3),
(56589, '0.0000', '0.0000', '0.0000', 1532252183, 8569, 0, 4),
(56590, '0.0000', '0.0000', '0.0000', 1532252342, 8581, 0, 3),
(56591, '0.0000', '0.0000', '0.0000', 1532252342, 8581, 0, 4),
(56592, '0.0000', '0.0000', '0.0000', 1532302987, 8580, 0, 3),
(56593, '0.0000', '0.0000', '0.0000', 1532302987, 8580, 0, 4),
(56594, '0.0000', '0.0000', '0.0000', 1532310190, 8581, 0, 3),
(56595, '0.0000', '0.0000', '0.0000', 1532310190, 8581, 0, 4),
(56596, '0.0000', '0.0000', '0.0000', 1532316185, 8569, 0, 3),
(56597, '0.0000', '0.0000', '0.0000', 1532316185, 8569, 0, 4);

-- --------------------------------------------------------

--
-- 表的结构 `ysk_wentype`
--

CREATE TABLE IF NOT EXISTS `ysk_wentype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `title` varchar(255) NOT NULL COMMENT '类型名称',
  `addtime` varchar(222) NOT NULL COMMENT '增加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `ysk_wentype`
--

INSERT INTO `ysk_wentype` (`id`, `title`, `addtime`) VALUES
(3, '帮助中心', '1515470302'),
(4, '商城介绍', '1515470316'),
(5, '介绍', '1515470332'),
(6, '联系客服', '1515850423');

-- --------------------------------------------------------

--
-- 表的结构 `ysk_wenzhang`
--

CREATE TABLE IF NOT EXISTS `ysk_wenzhang` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) NOT NULL COMMENT '栏目',
  `content` text NOT NULL COMMENT '内容',
  `addtime` varchar(233) NOT NULL COMMENT '上传时间',
  `type` varchar(255) NOT NULL COMMENT '类型',
  `tid` int(22) NOT NULL COMMENT '类型id',
  `linkone` varchar(222) DEFAULT NULL COMMENT '视频连接',
  `linktwo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `ysk_wenzhang`
--

INSERT INTO `ysk_wenzhang` (`id`, `title`, `content`, `addtime`, `type`, `tid`, `linkone`, `linktwo`) VALUES
(4, '介绍', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c298596437.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c29a988376.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c29ba53e13.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c29cf97db9.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c29db5ddad.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c29e86fa24.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c29f55f22b.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a061f5f8.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a131a4cf.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a2657711.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a3328797.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a3f2799c.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a4ac3451.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a5613335.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a62d490b.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a7235fa6.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a7d53f6a.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a89b24df.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a94c10e3.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;CBDC是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;CBDC是一个全面开放的网络支付平台，跟支付宝和微信一样，不同的是，CBDC是基于区块链技术开发的，能顺利实现点对点跨境转账，而且没有任何手续费。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;CBDC数字资产总量是多少？&lt;/strong&gt;&lt;/span&gt;\r\n\r\n&lt;p&gt;CBDC数字资产总量3.65亿&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;如何查询CBDC数字资产开源代码？&lt;/strong&gt;&lt;/span&gt;\r\n\r\n&lt;p&gt;查询CBDC数字资产开源代码的方法&lt;br /&gt;\r\n第一步，打开百度搜索&amp;ldquo;比特币钱包&amp;rdquo;&lt;br /&gt;\r\n第二步，点击&amp;ldquo;比特币钱包官网下载&amp;rdquo;&lt;br /&gt;\r\n第三步，找到&amp;quot;bitcoin&amp;quot;，点击&amp;ldquo;源代码&amp;rdquo;,这时候我们将跳转到一个国际查询开源代码的网站，&amp;ldquo;github.com&amp;quot;，并显示出来了比特币的开源代码&lt;br /&gt;\r\n第四步，点击左上角的&amp;ldquo;黑白猫&amp;rdquo;图像，回到首页&lt;br /&gt;\r\n第五步，在右上角的灰色框输入&amp;ldquo;CBDC&amp;quot;按回车键&lt;br /&gt;\r\n第六步，把搜索内容拉到最下面，我们就可以看到CBDC的开源代码了，这里还可以直接下载CBDC的PC冷钱包。&lt;br /&gt;\r\nPS：我们也可以直接访问&amp;ldquo;github.com&amp;quot;查找开源代码。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234)&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;CBDC运营模式是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;\r\n\r\n&lt;p&gt;大家都知道，想打造一个全球的跨境支付平台！首要条件是要有大量的粉丝！没有人认可你的东西，就一文不值，跟当初的支付宝一样，几年前，放几百块在里面都怕不见了，到了现在，在支付宝里面十万，百万的人，大有人在吧！&lt;/p&gt;\r\n\r\n&lt;p&gt;既然作为全球支付软件，首先要考虑汇率的问题，CBDC采取区链块技术支持实时人民币，美元，欧元，英镑，日元&amp;hellip;&amp;hellip;等多币种实时兑换功能，秒到，且无损！&lt;/p&gt;\r\n\r\n&lt;p&gt;如何实现汇率之间恒定的问题，那我们需要一个媒介！就是数字资产，现阶段对接的是瑞波币的价格！实现各币种之间的兑换！&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;CBDC是虚拟货币吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;显而易见，像我们的比特币，采取的是物理挖矿的方式进行挖矿，你的币根本没有挖矿功能，肯定是假的数字资产！&lt;/p&gt;\r\n\r\n&lt;p&gt;我们的CBDC数字资产总量恒定3.65亿，是一个开源的虚拟货币，CBDCLabs预挖1000万作为种子资产，用于市场推广和团队激励，剩余3.55亿CBDC数字资产用流通算力挖矿，通过用户参与流通挖矿的方式，让所有用户持有CBDC数字资产，最终达到完全去中心化。或许有人会问，国家现在都关停虚拟币交易平台了！个人的理解是这是个好事，有监管，才可以更好的发展！国家鼓励互联网金融的百花齐放，但是前提是所有脱离是实体经济的互联网金融只是理想中的空中楼阁，是一定要取缔的！&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;CBDC核心价值观是？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;CBDC核心价值观：流通产生价值&lt;br /&gt;\r\n流通：A转账给B的过程为流通&lt;br /&gt;\r\n增值：人与人第一次流通，系统赠送相应的P积分，这个也可以说是我们的数字资产，人的价值进行挖矿！&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;每天红包封顶吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;每天红包任你点，上不封顶。&lt;br /&gt;\r\nCBDC无国界支付&lt;br /&gt;\r\n投多少送600%米：&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投1米6米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投10米60米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投100米600米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投1000米6000米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投10000米60000米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投20000米送120000&lt;br /&gt;\r\n1米起投，上不封顶&lt;br /&gt;\r\n按P积分2&amp;permil;每天分红&lt;br /&gt;\r\n今天投米，明天分米&lt;br /&gt;\r\n每天可以提现，点对点交易！ 动态2&amp;permil;～2%～10%推广越多，释放越快&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;CBDC几个特性是？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;一：符合六大标准&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1去中心化&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2去中央账户&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3点对点交易&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4有序的进出&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5投资自由&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;6风险自控&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;二：有效规避5大风险&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1政策风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2金流风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3推广风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4网络风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5人脉风险&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;三：符合数字货币的5大属性&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1开源代码&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2恒量发行&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3独立钱包&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4大盘交易&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5商业运用&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;CBDC的八大优势？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;1.拆分(原始发行1000万)&lt;br /&gt;\r\n2.互助(买进卖出点对点匹配打款)&lt;br /&gt;\r\n3.分红(每天最底2&amp;permil;释放)&lt;br /&gt;\r\n4.复利(放大倍增)&lt;br /&gt;\r\n5.虚拟币(区块链挖矿机制)&lt;br /&gt;\r\n6.数字资产(低进高出炒币)&lt;br /&gt;\r\n7.资产证券化(最高释放完再复投)&lt;br /&gt;\r\n8.消费返利（落地商家扫码支付）&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;为什么说CBDC有拆分优势？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;CBDC类似拆分盘，发行原始股1000万，经过市场的繁荣也进行稳定&amp;ldquo;拆分&amp;rdquo;，但CBDC又跟拆分盘不同，基本上所有拆分盘都要半年、一年甚至一年半才能回本，而CBDC投资当天就可以回本80%，最重要的一点是，CBDC对所有的做付出做动态的人很公平，能力越强，分享越多越快，拆得越快。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;为什么说CBDC有互助盘的高利息和良好体验，却没有互助盘的高风险？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;CBDC的静态利息可以达到每天1.2%，比国3等互助盘的利息还要高，CBDC也没有排单币、激活码的成本。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;为什么说CBDC有全返优势？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;CBDC不但全返而且返还的速度更快更多，不到3个月就可以回本，回本后还可以继续返还，永不出局。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;CBDC有投资门槛吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;CBDC就不存在在投资门槛的问题，有钱你可以投10块100块，甚至10万都可以投，钱少些你就投资10块钱，一包烟钱，一单停车费都可以当作一份投资。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;静态怎么赚钱？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;每天1％100天回本，不复投的情况下，你可以选择对冲，或者平台挂卖，对冲，赠送80%P积分，平台挂卖不赠送P积分，但是你的P积分只增不减，所以说，100天到本金收回，接下来的都是赚的，一年撬动3.65倍增值，复投就的话那就更加有魅力了！&lt;/p&gt;\r\n\r\n&lt;p&gt;拥有1万P积分=日薪20左右月薪600左右 年薪7200&lt;br /&gt;\r\n拥有5万P积分=日薪100左右 月薪3000左右 年薪3.6万&lt;br /&gt;\r\n拥有10万P积分=日薪200左右 月薪6000左右 年薪7.2万&lt;br /&gt;\r\n拥有50万P积分=日薪1000左右 月薪3万左右 年薪36万&lt;br /&gt;\r\n拥有100万P积分=日薪2000左右 月薪6万左右 年薪72万&lt;br /&gt;\r\n拥有500万P积分=日薪1万左右 月薪30万左右 年薪360万&lt;br /&gt;\r\n拥有1000万P积分=日薪2万左右月薪60万左右 年薪720万&lt;br /&gt;\r\n拥有5000万P积分=日薪10万左右 月薪300万左右 年薪3600万&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;动态怎么赚钱？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;动态，直推人数越多越好，你的第一层越多，意味着你15代以内更多，以你为下，后面进来的市场都会加速你的流通，不设任何奖励制度，重点就是加速你的释放速度，市场流通足够快的情况下，最快可以一天释放1%-10%-100%，把原来的100天回本缩短到最快，可能就是几天，CBDC就是这么玩&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;CBDC更独特的地方是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;没有资金流，我们的资金自己说了算，相当于自己当老板，没有三级分销，其实他就是一个虚拟货币，我们推广市场，只是作为一个虚拟货币的推广着，不伤人脉，不用担心关网跑路，当你市场有人进入时候再一次加速你的释放速度，专业点来说，我们投资相当于买了一台矿机，推广相当于增加我们的算力。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;CBDC有投资风险吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;市场上所有项目基本上都有政策风险，只要是多层次分销、拉人头的、开公司的运营的，这些都是ZF的重点关注对象， CBDC在各地都有运营中心，在柬埔寨有，香港有，越南有，韩国有，日本有。CBDC没有直推奖，没有对碰奖，没有领导奖，没有管理奖，没有三级分销，没有多层次分销，更不需要拉人头所以不存在人脉风险，只需要流通就能产生价值，就能赚钱，关键是收益还不低，合情合理合法。&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '2018-06-15 10:14:40', '介绍', 5, 'http://player.youku.com/embed/XMzE0NTM4MDIwMA==', 'http://player.youku.com/embed/XMzE3MjkxOTAzNg=='),
(5, '问题', '&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; CBDC是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;CBDC是一个全面开放的网络支付平台，跟支付宝和微信一样，不同的是，CBDC是基于区块链技术开发的，能顺利实现点对点跨境转账，而且没有任何手续费。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; CBDC数字资产总量是多少？&lt;/strong&gt;&lt;/span&gt;\r\n\r\n&lt;p&gt;CBDC数字资产总量3.65亿&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 如何查询CBDC数字资产开源代码？&lt;/strong&gt;&lt;/span&gt;\r\n\r\n&lt;p&gt;查询CBDC数字资产开源代码的方法&lt;br /&gt;\r\n第一步，打开百度搜索&amp;ldquo;比特币钱包&amp;rdquo;&lt;br /&gt;\r\n第二步，点击&amp;ldquo;比特币钱包官网下载&amp;rdquo;&lt;br /&gt;\r\n第三步，找到&amp;quot;bitcoin&amp;quot;，点击&amp;ldquo;源代码&amp;rdquo;,这时候我们将跳转到一个国际查询开源代码的网站，&amp;ldquo;github.com&amp;quot;，并显示出来了比特币的开源代码&lt;br /&gt;\r\n第四步，点击左上角的&amp;ldquo;黑白猫&amp;rdquo;图像，回到首页&lt;br /&gt;\r\n第五步，在右上角的灰色框输入&amp;ldquo;CBDC&amp;quot;按回车键&lt;br /&gt;\r\n第六步，把搜索内容拉到最下面，我们就可以看到CBDC的开源代码了，这里还可以直接下载CBDC的PC冷钱包。&lt;br /&gt;\r\nPS：我们也可以直接访问&amp;ldquo;github.com&amp;quot;查找开源代码。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; CBDC运营模式是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;\r\n\r\n&lt;p&gt;大家都知道，想打造一个全球的跨境支付平台！首要条件是要有大量的粉丝！没有人认可你的东西，就一文不值，跟当初的支付宝一样，几年前，放几百块在里面都怕不见了，到了现在，在支付宝里面十万，百万的人，大有人在吧！&lt;/p&gt;\r\n\r\n&lt;p&gt;既然作为全球支付软件，首先要考虑汇率的问题，CBDC采取区链块技术支持实时人民币，美元，欧元，英镑，日元&amp;hellip;&amp;hellip;等多币种实时兑换功能，秒到，且无损！&lt;/p&gt;\r\n\r\n&lt;p&gt;如何实现汇率之间恒定的问题，那我们需要一个媒介！就是数字资产，现阶段对接的是瑞波币的价格！实现各币种之间的兑换！&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; CBDC是虚拟货币吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;显而易见，像我们的比特币，采取的是物理挖矿的方式进行挖矿，你的币根本没有挖矿功能，肯定是假的数字资产！&lt;/p&gt;\r\n\r\n&lt;p&gt;我们的CBDC数字资产总量恒定3.65亿，是一个开源的虚拟货币，CBDCLabs预挖1000万作为种子资产，用于市场推广和团队激励，剩余3.55亿CBDC数字资产用流通算力挖矿，通过用户参与流通挖矿的方式，让所有用户持有CBDC数字资产，最终达到完全去中心化。或许有人会问，国家现在都关停虚拟币交易平台了！个人的理解是这是个好事，有监管，才可以更好的发展！国家鼓励互联网金融的百花齐放，但是前提是所有脱离是实体经济的互联网金融只是理想中的空中楼阁，是一定要取缔的！&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; CBDC核心价值观是？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;CBDC核心价值观：流通产生价值&lt;br /&gt;\r\n流通：A转账给B的过程为流通&lt;br /&gt;\r\n增值：人与人第一次流通，系统赠送相应的P积分，这个也可以说是我们的数字资产，人的价值进行挖矿！&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 每天红包封顶吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;每天红包任你点，上不封顶。&lt;br /&gt;\r\nCBDC无国界支付&lt;br /&gt;\r\n投多少送600%米：&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投1米6米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投10米60米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投100米600米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投1000米6000米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投10000米60000米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投20000米送120000&lt;br /&gt;\r\n1米起投，上不封顶&lt;br /&gt;\r\n按P积分2&amp;permil;每天分红&lt;br /&gt;\r\n今天投米，明天分米&lt;br /&gt;\r\n每天可以提现，点对点交易！ 动态2&amp;permil;～2%～10%推广越多，释放越快&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; CBDC几个特性是？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;一：符合六大标准&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1去中心化&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2去中央账户&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3点对点交易&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4有序的进出&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5投资自由&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;6风险自控&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;二：有效规避5大风险&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1政策风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2金流风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3推广风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4网络风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5人脉风险&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;三：符合数字货币的5大属性&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1开源代码&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2恒量发行&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3独立钱包&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4大盘交易&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5商业运用&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; CBDC的八大优势？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;1.拆分(原始发行1000万)&lt;br /&gt;\r\n2.互助(买进卖出点对点匹配打款)&lt;br /&gt;\r\n3.分红(每天最底2&amp;permil;释放)&lt;br /&gt;\r\n4.复利(放大倍增)&lt;br /&gt;\r\n5.虚拟币(区块链挖矿机制)&lt;br /&gt;\r\n6.数字资产(低进高出炒币)&lt;br /&gt;\r\n7.资产证券化(最高释放完再复投)&lt;br /&gt;\r\n8.消费返利（落地商家扫码支付）&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 为什么说CBDC有拆分优势？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;CBDC类似拆分盘，发行原始股1000万，经过市场的繁荣也进行稳定&amp;ldquo;拆分&amp;rdquo;，但CBDC又跟拆分盘不同，基本上所有拆分盘都要半年、一年甚至一年半才能回本，而CBDC投资当天就可以回本80%，最重要的一点是，CBDC对所有的做付出做动态的人很公平，能力越强，分享越多越快，拆得越快。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 为什么说CBDC有互助盘的高利息和良好体验，却没有互助盘的高风险？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;CBDC的静态利息可以达到每天1.2%，比国3等互助盘的利息还要高，CBDC也没有排单币、激活码的成本。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 为什么说CBDC有全返优势？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;CBDC不但全返而且返还的速度更快更多，不到3个月就可以回本，回本后还可以继续返还，永不出局。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; CBDC有投资门槛吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;CBDC就不存在在投资门槛的问题，有钱你可以投10块100块，甚至10万都可以投，钱少些你就投资10块钱，一包烟钱，一单停车费都可以当作一份投资。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 静态怎么赚钱？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;每天1％100天回本，不复投的情况下，你可以选择对冲，或者平台挂卖，对冲，赠送80%P积分，平台挂卖不赠送P积分，但是你的P积分只增不减，所以说，100天到本金收回，接下来的都是赚的，一年撬动3.65倍增值，复投就的话那就更加有魅力了！&lt;/p&gt;\r\n\r\n&lt;p&gt;拥有1万P积分=日薪20左右月薪600左右 年薪7200&lt;br /&gt;\r\n拥有5万P积分=日薪100左右 月薪3000左右 年薪3.6万&lt;br /&gt;\r\n拥有10万P积分=日薪200左右 月薪6000左右 年薪7.2万&lt;br /&gt;\r\n拥有50万P积分=日薪1000左右 月薪3万左右 年薪36万&lt;br /&gt;\r\n拥有100万P积分=日薪2000左右 月薪6万左右 年薪72万&lt;br /&gt;\r\n拥有500万P积分=日薪1万左右 月薪30万左右 年薪360万&lt;br /&gt;\r\n拥有1000万P积分=日薪2万左右月薪60万左右 年薪720万&lt;br /&gt;\r\n拥有5000万P积分=日薪10万左右 月薪300万左右 年薪3600万&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 动态怎么赚钱？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;动态，直推人数越多越好，你的第一层越多，意味着你15代以内更多，以你为下，后面进来的市场都会加速你的流通，不设任何奖励制度，重点就是加速你的释放速度，市场流通足够快的情况下，最快可以一天释放1%-10%-100%，把原来的100天回本缩短到最快，可能就是几天，CBDC就是这么玩&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; CBDC更独特的地方是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;没有资金流，我们的资金自己说了算，相当于自己当老板，没有三级分销，其实他就是一个虚拟货币，我们推广市场，只是作为一个虚拟货币的推广着，不伤人脉，不用担心关网跑路，当你市场有人进入时候再一次加速你的释放速度，专业点来说，我们投资相当于买了一台矿机，推广相当于增加我们的算力。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; CBDC有投资风险吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;市场上所有项目基本上都有政策风险，只要是多层次分销、拉人头的、开公司的运营的，这些都是ZF的重点关注对象， CBDC在各地都有运营中心，在柬埔寨有，香港有，越南有，韩国有，日本有。CBDC没有直推奖，没有对碰奖，没有领导奖，没有管理奖，没有三级分销，没有多层次分销，更不需要拉人头所以不存在人脉风险，只需要流通就能产生价值，就能赚钱，关键是收益还不低，合情合理合法。&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '2018-04-20 18:20:15', '帮助中心', 3, '', ''),
(6, '商城介绍', '&lt;p&gt;&amp;nbsp; 马克.米诺先生创办CBDC的精髓，就是流通产生价值，商城落地是加速实践CBDC全球支付的应用，让入驻商家和消费者通过CBDC数字资产更紧密联系，加速互动，加速流通，加速增值财富，倍增财富。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp; 商城所有的商品均接受CBDCE余额支付，是一个可以全部接受数字资产流通、购物的综合性商城，为倡导实现人类金融自由理念并付之行动的马克.米诺先生致敬。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp; 商城所有商品都禁止高于市场价，每个商家的进驻会经过严格的审核，确保产品是正品，一经发现假冒伪劣的现象，将取消商家的入驻资格并协助消费者追回合法权益。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;h3&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;消费者在CBDC商城的消费将得到的两项主要消费红利&lt;/span&gt;：&lt;/strong&gt;&lt;/span&gt;&lt;/h3&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;&lt;strong&gt;A&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt; &lt;/span&gt;&lt;/span&gt;如果您是拥有CBDC电子钱包的消费者，您选好商品支付时用您的CBDCE余额可直接扫商家的CBDC收款二维码支付，支付成功后你CBDC钱包里的的P积分会增加你消费额的80%，然后按每天2&amp;permil;返回到E余额账户里，几乎等于免费购买了产品，感受到无痛消费带来的轻松惬意。&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&amp;nbsp;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;B&lt;/span&gt;&lt;/span&gt; &lt;/strong&gt;如果您是现金付款购买的消费者，商家会赠送给您一个CBDC电子钱包，商家会让利一部分充值到您的电子钱包E余额里，兑换成P积分后，按P积分总数的2&amp;permil;以每天红包形式返回到E余额账户里，以消费多少返还多少为执行原则。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp; &amp;nbsp;总之，所有消费者在CBDC商城，可以做到&amp;ldquo;花本来该花的钱，赚意想不到的财富！&amp;rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;h3&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#B22222&quot;&gt;入驻商家在CBDC商城的财富之路&lt;/span&gt;：&lt;/strong&gt;&lt;/span&gt;&lt;/h3&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:20px&quot;&gt;&amp;nbsp;A&lt;/span&gt;&lt;/strong&gt; &lt;/span&gt;全球的CBDC粉丝借助公司的平台，快速地产生庞大而有实力的消费群体，粉丝们使用CBDCE余额购买是无痛消费，只要喜欢就尽情买买买，购买力强大。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;&lt;strong&gt;B&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt; 当非CBDCE余额购买时，商家收到的是现金，赠送给客户一个CBDC电子钱包， 商家只要让利20%转入到客户的电子钱包E余额中，通过平台的杠杆作用，让客户达到消费多少返还多少，客户花出去的钱还能在不太长的时间里返回来，加上因为是商家让利赠送的，客户当然也乐意接受。&lt;/p&gt;\r\n\r\n&lt;p&gt;因此，商家既可以赚到八折价里的利润，同时多了一个CBDC客户，客户在CBDC钱包里获益了就有参与推广的可能性，从而形成商家CBDC事业的良性循环，一段时间积累下来，就会有不断的持续的市场被动收入，最终达成财务自由目标！&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:20px&quot;&gt;C &lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;商家也可以推荐其他商家入驻CBDC商城，你可以获得商城的广告费，重要的是你推荐的商家如果是你的CBDC事业伙伴，他延伸的CBDC客户在消费、流通都会加速您的奖金释放，这应该是长期的可观的财富。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;&lt;strong&gt;D&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt; CBDC全球支付的应用，让入驻商家和消费者通过CBDC钱包有了更紧密联系，入驻商家与商家有更广泛的合作，每一个在CBDC商城的参与者都将得到双赢或多赢的结果，前进的步伐不可阻挡！&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&amp;nbsp;&lt;strong&gt;&lt;span style=&quot;font-size:18px&quot;&gt;趋势大于优势！&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;h6&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&amp;nbsp;CBDC商城 ，为您生活添色彩！&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/h6&gt;\r\n', '2018-02-02 22:11:54', '商城介绍', 4, '', ''),
(13, '联系客服', '&lt;h1 style=&quot;text-align:justify&quot;&gt;温馨提示&lt;/h1&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;您要充值的信息要准确填写CBDC账号；注册时的昵称；手机号码和充值金额。&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;有必要时请及时联系客服专员。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-22/5a6563438f695.jpeg&quot; style=&quot;height:164px; width:162px&quot; /&gt;&lt;/p&gt;\r\n', '2018-01-22 12:14:20', '联系客服', 6, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ysk_wetrans`
--

CREATE TABLE IF NOT EXISTS `ysk_wetrans` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_id` int(10) NOT NULL COMMENT '支付的会员',
  `get_id` int(10) NOT NULL COMMENT '收到转账用户id',
  `get_nums` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '转账总金额',
  `get_time` char(30) NOT NULL DEFAULT '0' COMMENT '转账时间',
  `get_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '转账币种',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=46 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
