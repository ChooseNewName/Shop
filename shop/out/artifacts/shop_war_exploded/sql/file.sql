
create database shopdata;

use shopdata;

#用户信息表

create table userInfo
(
    userId int primary key  auto_increment,			-- 用户Id
    userName varchar(20) not null,					-- 用户名
    password varchar(16) not null,					-- 密码
    phoneNumber varchar(11)  not null,				-- 电话号码
    email varchar(30) not null						-- 邮箱
);

insert into userInfo(userName,password,phoneNumber,email) values
("薇恩","123456","13168666759","1203664512@qq.com");

select * from userInfo;

select * from userInfo where userName='薇恩';

select * from userInfo where userName='1' or email='1' or phoneNumber='13168666759' and password='123456'; 

select * from userInfo where userName='13168666759'  or email='13168666759'  or phoneNumber='13168666759'  and password=123456;

drop table userInfo;
-- -------------分隔线---------------
-- 商品类型表
create table productType
(
    id Integer primary key auto_increment,				-- 类型id
    `type` varchar(20) not null							-- 类型
);

insert into productType(type) values 
("电脑"),("手机"),("家电"),("家具"),
("服饰"),("零食"),("运动"),("美妆");

select * from productType;

select * from productType where `type` like '%%';
 
drop table productType;
-- -------------分隔线---------------
-- 商品信息表
create table productInfo
(
    pId Integer primary key auto_increment,					-- 商品id
    pName varchar(50) not null,								-- 商品名称
    pDetails varchar(200) not null,							-- 介绍
    price decimal check(price>=0),							-- 价格
    pPicture varchar(300) not null,							-- 图片路径
    pState boolean default true,							-- 商品状态
    pType Integer references productType(id)  				-- 商品类型
);

insert into productInfo(pName,PDetails,price,pPicture,pType) values
('Lenovo/联想 拯救者 Y7000','i7酷睿六核游戏本轻薄便携吃鸡高配游戏笔记本电脑15.6英 高色域版GTX1060 6G独显',7599.00,'/image/电脑/Lenovo联想拯救Y7000.jpg',1),
('Dell/戴尔 G7 ',' i7独显7588-1865游匣8代六核i7标压GTX1060 6G独显学生吃鸡游戏笔记本电脑15.6英寸高端游戏本',7699.00,'/image/电脑/Dell戴尔G7.jpg',1),
('机械师F117 S6C 八代',' i7 GTX1060 6G独显轻薄游戏本MACHENIKE 144Hz电竞屏16G傲腾技术学生吃鸡笔记本电脑分期',7399.00,'/image/电脑/机械师F117 S6C 八代.jpg',1),
('Asus/华硕V241',' 超薄24英寸电脑一体机家用办公台式游戏一体机电脑全套网吧教学会议整机四核高配i5主机IPS屏',3399,'/image/电脑/Asus华硕V241.jpg',1),
('Apple/苹果 ','21.5 英寸 iMac Retina 4K 显示屏 3.0GHz 处理器 1TB 存储容量',10200.00,'/image/电脑/Apple苹果.jpg',1),
('iMac Pro ','2017新款27寸5K苹果/Apple iMac Pro一体机台式电脑MQ2Y2CH/A定制',33580.00,'/image/电脑/iMacPro.jpg',1),
('vivo NEX 旗舰版','咨询购机享壕礼/中移动vivo NEX 旗舰版官方全新正品',4488.00,'/image/手机/vivo NEX 旗舰版.jpg',2),
('iPhone 8','3期免息【当天发/保修2年】Apple/苹果 iPhone 8 全网通4G手机 官方旗舰店',4458.00,'/image/手机/iPhone8.jpg',2),
('Huawei/华为 nova 3 ','【64GB版赠PC壳享3期免息】Huawei/华为 nova 3 全面屏正品 千玺代言手机',2799.00,'/image/手机/vivo NEX 旗舰版.jpg',2),
('懒人小户型布沙发','!现顾家木布艺沙发客厅整装北欧现代家具懒人小户型布沙发2033',5699,'/image/家具/懒人小户型布沙发.jpg',4),
('简约布沙发','全友家私沙发小户型客厅三人位皮布沙发整装组合简约布沙发102272',3488,'/image/家具/简约布沙发.jpg',4),
('Haier/海尔 BCD-572WDENU1冰箱','双门双开门对开门变频无霜家用',3499.00,'/image/家电/Haier海尔BCD-572WDENU1冰箱.jpg',3),
('小米电视','4A 55英寸 4k超高清智能网络电视机 50 60',2299.00,'/image/家电/小米电视.jpg',3),
('好利来冰山熔岩巧克力','纯可可脂甜品糕点点心网红零食\送金属勺',58.00,'/image/零食/好利来冰山熔岩巧克力.jpg',6),
('零食大礼包组合','整箱超大混装多口味女生小孩吃的休闲食品散装一箱',99.00,'/image/零食/零食大礼包组合.jpg',6),
('乔丹运动鞋','2018夏季新款跑鞋轻便减震休闲男鞋透气网面跑步鞋',299.00,'/image/运动/乔丹运动鞋.jpg',7),
('JILL STUART','绮幻珠宝彩妆限定组 樱花缤纷礼盒腮红口红彩妆套装',580.00,'/image/美妆/JILL STUART.jpg',8),
('Kuegou 男士开衫卫衣','男秋季韩版修身外套 休闲棒球服7010',168.00,'/image/服饰/Kuegou男士开衫卫衣.jpg',5);

select * from productInfo;


select pId,pName,PDetails,price,pPicture from productInfo where pType=2;

-- 搜索查询语句
select pName,PDetails,`type` from productInfo p join productType pt on p.pType=pt.id where  pState=1 and pName like '%苹果%' or pDetails like '%苹果%' or `type` like '%苹果%';

drop table productInfo;

-- -------------分隔线---------------
-- 购物车项表
create table cartItem
(
	cartId int primary key auto_increment,			-- 购物车id
    pId int references productInfo(pId),			-- 商品id
    pNumber int check(pNumber>=0),					-- 商品数量
    pcount decimal check(pcount>=0),				-- 商品总数
	userId int references userInfo(id)				-- 用户id
);

select * from cartItem;



drop table cartItem;

-- -------------分隔线---------------
-- 地址信息表
create table addressInfo
(
	aId int primary key auto_increment,				-- 地址id 
    userId int references userInfo(userId),			-- 用户id
    consignee varchar(20) not null,					-- 收货人
    address varchar(100) not null,					-- 收货地址
    phoneNumber varchar(11) not null				-- 收货电话号码
);

select * from addressInfo;

drop table addressInfo;
-- -------------分隔线---------------
-- 订单信息表
create table orderInfo
(
	oId int primary key auto_increment,				-- 订单id
    userId int references userInfo(userId),			-- 用户id
    cartId int references cart(cartId),				-- 购物车id
    oCount decimal check(oCount>=0),					-- 订单商品的总额
    oNumber varchar(20) not null,					-- 订单编号
    aId int references addressInfo(aId)				-- 收货地址id
);

select * from orderInfo;

drop table orderInfo;

-- -------------分隔线---------------


show databases 

drop database shopdata;

SELECT User, Host, Password FROM mysql.user;
