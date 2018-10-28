#!/bin/bash
# vps server ubuntu配置

## 安装常用软件
    sudo apt install -y vim python2.7 python-pip git
    sudo -H pip2 install --upgrade pip

## 添加用户, 分配权限
    sudo useradd -m imxood
    sudo usermod -a -G sudo,adm,ssh imxood

## 为新用户设置密码
    sudo passwd imxood

## 使用新用户操作
    sudo su imxood

## 创建develop文件夹
    mkdir ~/develop -p
    ~/develop

## 安装进程管理工具
    sudo apt install -y supervisor
    配置文件是: /etc/supervisor/supervisord.conf

## 安装shadowsocks server
~~~
sudo -H pip2 install shadowsocks && sudo mkdir -p /etc/shadowsocks && sudo vim /etc/shadowsocks/config.json
~~~
添加如下内容:
~~~
{
    "server":"xxx",
    "server_port":8388,
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"xxx",
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open": false
}
~~~

### 添加自启动配置文件:
sudo vim /etc/supervisor/conf.d/shadowsocks.conf

### 添加如下内容:
~~~
[program:ssserver]
command=/usr/local/bin/ssserver -c /etc/shadowsocks/config.json
~~~


## kcptun server, 加速shadowsocks服务

linux版:
wget https://github.com/xtaci/kcptun/releases/download/v20181002/kcptun-linux-amd64-20181002.tar.gz
sudo tar -xvf kcptun-linux-amd64-20181002.tar.gz -C /usr/bin/
sudo vim /etc/kcptun-config.json
~~~
{
    "listen": ":10001",
    "target": "127.0.0.1:10000",
    "key": "xxx",
    "crypt": "aes",
    "mode": "fast2",
    "mtu": 1350,
    "sndwnd": 1024,
    "rcvwnd": 1024,
    "datashard": 10,
    "parityshard": 3,
    "dscp": 0,
    "nocomp": false,
    "quiet": false,
    "pprof": false
}
~~~

windows版:
https://github.com/shadowsocks/kcptun/releases/download/v20170718/kcptun-windows-amd64-20170718.tar.gz

### 添加自启动配置文件:
sudo vim /etc/supervisor/conf.d/kcptun.conf
~~~
[program:kcptun]
command=/usr/bin/server_linux_amd64 -c /etc/kcptun-config.json
redirect_stderr=true
stdout_logfile=/tmp/kcptun.log
~~~


## ssh配置

vim /etc/ssh/sshd_config
~~~
Port 22

ClientAliveInterval 60
ClientAliveCountMax 3
~~~



## tank云盘(一个小工具, 似乎没哈用)
    sudo apt install -y mysql-server mysql-client golang 注意提示mysql的root密码
    外网访问:
    sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
    注释: bind-address = 127.0.0.1
    mysql -uroot -p 进入mysql
    
    创建数据库:
    create database tank character set utf8;

    创建用户,分配权限:
    grant all on tank.* to myusername@'%' identified by 'mypassword' with grant option;
    flush privileges;

    sudo service mysql restart

    wget https://tank.eyeblue.cn/api/alien/download/d15ef4e6-226d-433a-4892-7c44e22b4520/tank-1.0.5.linux-amd64.tar.gz
    tar -xvf tank-1.0.5.linux-amd64.tar.gz
    cd tank-1.0.5

    vim conf/tank.json
    修改端口及连接信息

    添加自启动配置:
    sudo vim /etc/supervisor/conf.d/tank.conf
    添加内容:
    [program:CloudDisk]
    command=/home/imxood/develop/tank-1.0.5/tank

    sudo supervisorctl reload

## 安装ftp服务
    需求：创建一个ftp用户，用户名：testUser，密码：testUser，连接端口：30000，该用户只能访问/home/test/testDir 下的内容

    1)如果没有安装vsftpd，需先安装vsftpd

    apt-get install vsftpd

    

    2）创建用户

    useradd test -m

    为该用户添加密码

    passwd testUser 回车

    输入密码：testUser


    3）修改配置文件

    (1) vi /etc/vsftpd.conf 

    修改或添加如下行：

    anonymous_enable=NO

    local_enable=YES

    write_enable=YES

    chroot_local_user=NO

    chroot_list_file=/etc/vsftpd.chroot_list

    
    (2) vi vsftpd.chroot_list

    在单独一行添加:test

    （3）如果没有vsftpd_user_config，则创建该目录

    mkdir vsftpd_user_config

    cd vsftpd_user_config

    vi test

    添加 local_root=/home/test/ftp

    

    4）重启vsftpd

    service vsftpd restart

    

    假设是在ip为192.168.10.1上创建的ftp用户

    在浏览器下访问ftp的格式为：ftp://192.168.10.1