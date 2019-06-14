
DROP DATABASE work0915;
CREATE DATABASE work0915;
USE work0915;

/* 1. 删除 */
-- 1) 删除数据表
DROP TABLE t_users;
DROP TABLE t_realName;
DROP TABLE t_sale;
/* 2. 创建 */
-- 1) 创建数据表
/* 用户表 */
CREATE TABLE t_users(
       u_id INT PRIMARY KEY AUTO_INCREMENT COMMENT'用户ID',
       u_userName VARCHAR(20) NOT NULL UNIQUE COMMENT '用户名',
       u_password VARCHAR(20) NOT NULL COMMENT '密码',
       u_realName VARCHAR(20) NOT NULL COMMENT'真实姓名'
);

/* 商品表 */
CREATE TABLE t_product(
       p_id INT PRIMARY KEY AUTO_INCREMENT COMMENT'商品ID',
       p_productName VARCHAR(16) NOT NULL COMMENT '商品名称',
       p_quantity INT NOT NULL COMMENT '库存量'
);

/* 销售记录表 */
CREATE TABLE t_sale(
	s_id INT PRIMARY KEY AUTO_INCREMENT COMMENT'',
	s_price DOUBLE NOT NULL COMMENT'销售单价',
	s_quantity INT NOT NULL COMMENT'数量',
	s_totalPrice DOUBLE NOT NULL COMMENT'总价',
	s_saleDate DATETIME NOT NULL COMMENT'销售日期',
	s_userId INT NOT NULL COMMENT'销售员ID',
	s_productId INT NOT NULL COMMENT'商品ID'
);
/* 3. 添加测试数据 */
INSERT INTO t_users VALUES(1001, 'tang', 'qqqqqq','唐方敏');
INSERT INTO t_users VALUES(1002, 'fan', '123456','唐雨敏');
INSERT INTO t_users VALUES(1003, 'ming', '111111','唐若敏');

INSERT INTO t_product VALUES(101, '咖啡', 111);
INSERT INTO t_product VALUES(102, '纯净水', 222);
INSERT INTO t_product VALUES(103, '纯牛奶', 333);
INSERT INTO t_product VALUES(104, '绿茶', 444);
INSERT INTO t_product VALUES(105, '冰红茶', 555);
INSERT INTO t_product VALUES(106, '可口可乐', 666);
INSERT INTO t_product VALUES(107, '红牛', 777);



INSERT INTO t_sale VALUES
(1,30.00,20,600.00,'2012-07-16 20:10:20',1001,101);
INSERT INTO t_sale VALUES
(2,10.00,100,1000.00,'2012-07-7 20:10:20',1002,102);
INSERT INTO t_sale VALUES
(3,25.00,50,1250.00,'2012-08-06 20:10:20',1003,103);
INSERT INTO t_sale VALUES
(4,25.00,100,2500.00,'2012-08-07 20:10:20',1004,101);
INSERT INTO t_sale VALUES
(5,27.00,400,10800.00,'2012-07-29 20:10:20',1005,101);
INSERT INTO t_sale VALUES
(6,27.00,500,13500.00,'2012-07-31 20:10:20',1005,101);
INSERT INTO t_sale VALUES
(7,28.00,1000,28000.00,'2012-08-09 20:10:20',1006,101);

/* 5. 查询语句 */
/*
   select * from t_account;
   select * from t_transactionRecord order by t_transactionDate desc;

*/











