级联删除和更新

CREATE TABLE `roottb` (

  `id` INT(11) UNSIGNED AUTO_INCREMENT NOT NULL,

  `data` VARCHAR(100) NOT NULL DEFAULT '',

  PRIMARY KEY (`id`)

) TYPE=InnoDB;



CREATE TABLE `subtb` (

  `id` INT(11) UNSIGNED AUTO_INCREMENT NOT NULL,

  `rootid` INT(11) UNSIGNED NOT NULL DEFAULT '0',

  `data` VARCHAR(100) NOT NULL DEFAULT '',

  PRIMARY KEY (`id`),

  INDEX (`rootid`),

  FOREIGN KEY (`rootid`) REFERENCES roottb(`id`) ON DELETE CASCADE

) TYPE=InnoDB;



注意：
1、必须使用InnoDB引擎；
2、外键必须建立索引（INDEX）；
3、外键绑定关系这里使用了“ ON DELETE CASCADE”，意思是如果外键对应数据被删除，将关联数据完全删除





---------------------------------------------------------------------------------------------------------------
user表：
create table user
(
userid integer not null auto_increment primary key,
username varchar(12) not null
)
type=innodb;

password表：
create table password
(
userid integer not null,
password varchar(12) not null,
index (userid),
foreign key (userid) references user (userid)
on delete cascade
on update cascade
)
type=innodb;

1、MySQL支持外键约束，并提供与其它DB相同的功能，但表类型必须为 InnoDB
2、建外键的表的那个列要加上index.


CREATE TABLE `dianjiliang` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AId` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `AId` (`AId`),
  CONSTRAINT `dianjiliang_ibfk_1` FOREIGN KEY (`AId`) REFERENCES `article` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=gb2312 COMMENT='点击量表';

CREATE TABLE `critique` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AId` int(11) DEFAULT NULL,
  `content` text,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `AId` (`AId`),
  CONSTRAINT `critique_ibfk_1` FOREIGN KEY (`AId`) REFERENCES `article` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=gb2312 COMMENT='评论表'






mysql> SHOW VARIABLES LIKE 'character_set_%';
+--------------------------+----------------------------+
| Variable_name | Value |
+--------------------------+----------------------------+
| character_set_client | latin1 |
| character_set_connection | latin1 |
| character_set_database | latin1 |
| character_set_results | latin1 |
| character_set_server | latin1 |
| character_set_system | utf8 |
| character_sets_dir | /usr/share/mysql/charsets/ |
+--------------------------+----------------------------+
7 rows in set (0.00 sec)

mysql> SHOW VARIABLES LIKE 'collation_%';
+----------------------+-------------------+
| Variable_name | Value |
+----------------------+-------------------+
| collation_connection | latin1_swedish_ci |
| collation_database | latin1_swedish_ci |
| collation_server | latin1_swedish_ci |
+----------------------+-------------------+
3 rows in set (0.00 sec)
默认就是瑞典latin1,一下是换成我们自己的编码，如utf8:
外部访问数据乱码的问题就出在这个connection连接层上,解决方法是在发送查询前执行一下下面这句：

1. SET NAMES 'utf8';

它相当于下面的三句指令：
SET character_set_client = utf8;
SET character_set_results = utf8;
SET character_set_connection = utf8;

一般只有在访问之前执行这个代码就解决问题了，下面是创建数据库和数据表的，设置为我们自己的编码格式。
2. 创建数据库
mysql> create database NAME character set utf8;

3. 创建表
CREATE TABLE `type` (
`id` int(10) unsigned NOT NULL auto_increment,
`flag_deleted` enum('Y','N') character set utf8 NOT NULL default 'N',
`flag_type` int(5) NOT NULL default '0',
`type_name` varchar(50) character set utf8 NOT NULL default '',
PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;

4. 修改数据库成utf8的.
mysql> alter database name character set utf8;

5. 修改表默认用utf8.
mysql> alter table type character set utf8;

6. 修改字段用utf8
mysql> alter table type modify type_name varchar(50) CHARACTER SET utf8;

===================================================================

?

最近开始使用MySql，以前都是用Oracle，嫌太贵了，呵呵
编码算是MySql最难弄的问题了，研究了一下，总结点结果，部分来自其他人的经验，如有不妥之处，请踊跃叽歪啊。。。

设置步骤：

一、编辑MySql的配置文件
MySql的配置文件Windows下一般在系统目录下或者在MySql的安装目录下名字叫my.ini，可以搜索，Linux下一般是 /etc/mysql/my.cnf

--在 [mysqld] 标签下加上三行
default-character-set = utf8
character_set_server = utf8
lower_case_table_names = 1 //表名不区分大小写（此与编码无关）

--在 [mysql] 标签下加上一行
default-character-set = utf8

--在 [mysql.server]标签下加上一行
default-character-set = utf8

--在 [mysqld_safe]标签下加上一行
default-character-set = utf8

--在 [client]标签下加上一行
default-character-set = utf8


二、重新启动MySql服务
Windows可在服务管理器中操作，也可使用命令行：
net stop mysql 回车
net start mysql 回车
服务名可能不一定为mysql，请按自己的设置

Linux下面可是用 service mysql restart

如果出现启动失败，请检查配置文件有没有设置错误

?

?

三、查看设置结果
登录MySql命令行客户端：打开命令行
mysql –uroot –p 回车
输入密码
进入mysql后 执行 ：show variables like "%char%";
显示结果应该类似如下：

| character_set_client | utf8 |
| character_set_connection | utf8 |
| character_set_database | utf8 |
| character_set_results | utf8 |
| character_set_server | utf8 |
| character_set_system | utf8 |
| character_sets_dir | /usr/share/mysql/charsets/ |

如果仍有编码不是utf8的，请检查配置文件，也可使用mysql命令设置：
set character_set_client = utf8;
set character_set_server = utf8;
set character_set_connection = utf8;
set character_set_database = utf8;
set character_set_results = utf8;
set collation_connection = utf8_general_ci;
set collation_database = utf8_general_ci;
set collation_server = utf8_general_ci;
以上命令有部分只对当前登录有效，所以不是很管用。

四、建库导入数据
导入sql脚本文件前，先确保该脚本文件及内容格式为UTF-8编码格式，
同以上方法登入mysql命令行，use 库名 进入相应数据库
set names utf8;
source sql脚本文件名;

五、程序连接字符串（此项与mysql设置无关，为程序开发使用）
对于较老的jdbc版本的驱动，连接字符创可使用一下相似格式：
jdbc:mysql://127.0.1:3306/test?useUnicode=true&characterEncoding=utf-8

六、附录
如果无法更改数据库配置文件，可以采取一下方法(不保证全部有效)：
1、建数据库时设置数据库编码为utf-8
例如 create database `test` default character set utf8;


2、导入数据库sql的时候，请确保sql文件为utf-8编码
进入mysql命令行后 输入 set names utf8;
再进入数据库 use test;
在导入sql脚本 source test.sql;


3、连接字符串类似如下：(开发相关，非数据库设置)
jdbc:mysql://127.0.1:3306/test?useUnicode=true&characterEncoding=utf-8

来自:http://blog.sina.com.cn/s/blog_7122661501018v70.html



1,设置密码
第一次使用:mysqladmin -u root password 新密码(eg:mysqladmin -u root password然后提示输入密码)
修改密码:mysqladmin -u root -p 旧密码 password 新密码(eg:mysqladmin -u root -p123 password然后提示输入密码,这里要注意原密码123与-p没有间隔，否则出错)

1,update mysql.user set password = password('mx123') where user='root';
flush privileges;
两条命令设置root密码。
如果忘记密码，在mysql的配置文件my.ini里，找到mysqld项（在最后），（换一行）添加skip-grand-tables，保存之后，用root登录mysql（不要密码），update password。（记得删掉my.ini刚增加的那行）

2,CREATE DATABASE dbname DEFAULT CHARACTER SET UTF8;创建utf8库	CREATE TABLE tbname CHARACTER SET UTF8;创建utf8表

3,eval怎么使用?

if($_POST['submit'])  验证出错：Notice: Undefined index: submit in C:\wamp\www\web\root\index.php on line 3
解决empry？？？


4,中文乱码？1,查看字符集：show variables like 'char%';2,修改my.ini:在找到[mysql],添加：default-character-set=utf8(我的mysql版本是:5.6.17)

在MySQL Qurey   Brower中直接导入*.sql脚本，是不能一次执行多条sql命令的，在mysql中执行sql文件的命令：

mysql> source   d:/myprogram/DATABASE/db.sql;


mysql常用命令：

一) 连接MYSQL：

    格式： mysql -h主机地址 -u用户名 －p用户密码

1、例1：连接到本机上的MYSQL

    首先在打开DOS窗口，然后进入mysql安装目录下的bin目录下，例如： D:/mysql/bin，再键入命令mysql -uroot -p，回车后提示你输密码，如果刚安装好MYSQL，超级用户root是没有密码的，故直接回车即可进入到MYSQL中了，MYSQL的提示符是：mysql>

2、例2：连接到远程主机上的MYSQL (远程：IP地址)

    假设远程主机的IP为：10.0.0.1，用户名为root,密码为123。则键入以下命令：

   mysql -h10.0.0.1 -uroot -p123

   （注：u与root可以不用加空格，其它也一样）

3、退出MYSQL命令

    exit （回车）

(二) 修改密码：

    格式：mysqladmin -u用户名 -p旧密码 password 新密码

1、例1：给root加个密码123。首先在DOS下进入目录C:/mysql/bin，然后键入以下命令：

    mysqladmin -uroot -password 123

    注：因为开始时root没有密码，所以-p旧密码一项就可以省略了。

2、例2：再将root的密码改为456

    mysqladmin -uroot -pab12 password 456

(三) 增加新用户：（注意：和上面不同，下面的因为是MYSQL环境中的命令，所以后面都带一个分号作为命令结束符）

    格式：grant SELECT on 数据库.* to 用户名@登录主机 identified by "密码"

    允许本地 IP 访问 localhost, 127.0.0.1:
    create user 'test'@'localhost' identified by '123456';

    允许外网 IP 访问:
    create user 'test'@'%' identified by '123456';

    首先用以root用户连入MYSQL，然后键入以下命令:
    grant all privileges on tank.* to 'tank'@'%' identified by 'tank123' with grant option;

    如果你不想test2有密码，可以再打一个命令将密码消掉。
    grant SELECT,insert,update,DELETE on *.* to test2@localhost identified by "";

(四) 删除用户
    drop user tank;

(五) 显示命令

1、显示数据库列表：

    show DATABASEs;     刚开始时才两个数据库：mysql和test。mysql库很重要它里面有MYSQL的系统信息，我们改密码和新增用户，实际上就是用这个库进行操作。

2、显示库中的数据表：

    USE mysql； //打开库    show TABLEs;

3、显示数据表的结构：

    describe 表名;

4、建库：

    CREATE DATABASE 库名;

5、建表：

    USE 库名；     CREATE TABLE 表名 (字段设定列表)；

6、删库和删表:

    DROP DATABASE 库名;     DROP TABLE 表名；

7、将表中记录清空：

    DELETE from 表名;

8、显示表中的记录：

    SELECT * from 表名;
	
9、添加，修改，删除表的列: ALTER TABLE

    修改表名：ALTER TABLE t_name RENAME to bbb;
    添加列：ALTER TABLE 表名 ADD COLUMN 列名 varchar(30);
    删除列：ALTER TABLE 表名 DROP COLUMN 列名;
    修改列名MySQL： ALTER TABLE bbb CHANGE nnnnn hh int;
    修改列名SQLServer：EXEC sp_RENAME't_student.name','nn','COLUMN';
    修改列名Oracle：LTER TABLE bbb RENAME COLUMN nnnnn to hh int;
    修改列属性：ALTER TABLE t_book MODIFY name varchar(22); 

	
导出sql脚本

mysqldump -u 用户名 -p 数据库名 > 存放位置

mysqldump -u root -p test > c:/a.sql

导入sql脚本

mysql -u 用户名 -p 数据库名 < 存放位置

mysqljump -u root -p test < c:/a.sql

注意,test数据库必须已经存在

MySQL导出导入命令的用例

1.导出整个数据库

mysqldump -u 用户名 -p 数据库名 > 导出的文件名

mysqldump -u wcnc -p smgp_apps_wcnc > wcnc.sql

2.导出一个表

mysqldump -u 用户名 -p 数据库名表名> 导出的文件名

mysqldump -u wcnc -p smgp_apps_wcnc USErs> wcnc_USErs.sql

3.导出一个数据库结构

mysqldump -u wcnc -p -d --add-DROP-TABLE smgp_apps_wcnc >d:wcnc_db.sql

-d 没有数据 --add-DROP-TABLE 在每个CREATE语句之前增加一个DROP TABLE

4.导入数据库

常用source 命令

进入mysql数据库控制台,

如mysql -u root -p

mysql>USE 数据库

然后使用source命令,后面参数为脚本文件(如这里用到的.sql)

mysql>source d:wcnc_db.sql



php重定向页面
方法一：header("Location: viewNote.php");
方法二：echo "<scrīpt>window.location ="$PHP_SELF";</scrīpt>";
方法三：echo "<META HTTP-EQUIV="Refresh" CONTENT="5; URL=index.php">";//5表示5s之后跳转
注意：方法一中，<?php header("Location: viewNote.php"); ?> 前面不能输出任何内容包括空格



1，安装mysql服务：mysqld --install
  卸载mysql服务：mysqld --remove

2，数据文件一般存放在安装路径下的data目录-->显示数据目录命令：show variables like '%datadir%';

3，乱码，可能原因之一  alter table table_name convert to character set utf8;---可能是table或database编码的问题

4，mysql root没有远程访问的权限，需要增加权限，增加权限的步骤如下：
进入mysql数据库：
grant all privileges on *.* to 'root'@'%' identified by 'root' with grant option;
flush privileges;

5，Packet for query is too large (1550606 > 1048576). You can change this value on the server by setting the max_allowed_packet variable.’

在my.ini文件(在安装目录下,可能没有该文件,有my-default.ini,则copy一份重命名为my.ini)中添加max_allowed_packet=4M

6,启动与关闭
./mysqld_safe &
./mysqladmin -uroot -pr123456 shutdown -h120.24.179.51 -P13306





安装mysql
    $ sudo apt install mysql-server
    设置密码弹框: peak

修改mysql的默认编码, sudo vim /etc/mysql/my.cnf, 添加:
    [client]
    default-character-set=utf8

    [mysql]
    default-character-set=utf8

    [mysqld]
    character_set_server=utf8
    init_connect='SET NAMES utf8'

因为使用了ssh远程, 所以无法直接使用mysql的root用户远程访问,需要先关掉安全验证(不用密码就可登录):
    sudo vim /etc/mysql/my.cnf

    在[mysqld]下面添加一行:
    skip-grant-tables

    sudo systemctl restart mysql.service

mysql的root远程权限:
    mysql -u robot, 进入mysql终端:
    先修改root可远程访问:
    use mysql;
    update user set host ='%' where user = 'robot';
    退出,并删除/etc/mysql/my.cnf中的"skip-grant-tables", 重启mysql服务
    
初始化环境:
    mysql -u robot -p, 输入密码后进入mysql终端:
    先创建数据库:
    create database robot character set utf8;
    创建一个peak用户:
    grant all privileges on robot.* to 'peak'@'%' identified by 'peak' with grant option;



sssmx12345678
mysqlmx12345678