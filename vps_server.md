#!/bin/bash
# vps server ubuntu配置

### 安装常用软件
    sudo apt install -y vim python2.7 python-pip git
    sudo -H pip2 install --upgrade pip

### 添加用户, 分配权限
    sudo useradd -m imxood
    sudo usermod -a -G sudo,adm,ssh imxood

### 为新用户设置密码
    sudo passwd imxood

### 使用新用户操作
    sudo su imxood

### 创建develop文件夹
    mkdir ~/develop -p
    ~/develop

### 安装进程管理工具
    sudo apt install -y supervisor
    配置文件是: /etc/supervisor/supervisord.conf

### 安装shadowsocks server
    sudo -H pip2 install shadowsocks && sudo mkdir -p /etc/shadowsocks && sudo vim /etc/shadowsocks/config.json

    添加如下内容:
    {
        "server":"::",
        "server_port":8388,
        "local_address": "127.0.0.1",
        "local_port":1080,
        "password":"mypassword",
        "timeout":300,
        "method":"aes-256-cfb",
        "fast_open": false
    }

    添加自启动配置文件:
    sudo vim /etc/supervisor/conf.d/shadowsocks.conf

    添加如下内容:
    [program:ssserver]
    command=/usr/local/bin/ssserver -c /etc/shadowsocks/config.json

### tank云盘
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

    ssh root@104.194.91.4