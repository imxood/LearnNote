### 前端环境
    sudo apt-get remove nodejs --purge
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
    sudo apte-get update
    sudo apt-get install -y nodejs
    node -v
    npm -v



    sudo apt install -y nodejs npm

    sudo ln -s /usr/bin/nodejs /usr/bin/node

    sudo npm install -g cnpm --registry=https://registry.npm.taobao.org

    # 升级npm
    sudo npm install -g n

    sudo n stable

    sudo npm install -g yarn
    yarn config set registry 'https://registry.npm.taobao.org'

    # 前端的一个构建工具
    sudo yarn global add grunt-cli

    ISSUE: You need to have Ruby and Sass installed and in your PATH for this task to work.
    SOLVED: yarn add --save node-sass grunt-sass


### 使用npm安装cordova，执行cordova create报错
    npm ERR! not a package.........@cordova-app-hello-world\index.js
    卸载cordova，使用yarm重新安装即可:
        sudo npm uninstall -g cordova 
        sudo npm install -g yarn
        sudo yarn config set registry https://registry.npm.taobao.org
        sudo yarn global add cordova

### package.json
    版本约定：比如1.2.2，“大版本.次要版本.小版本”
    ~1.2.2，表示1.2.x的最新版本
    ^1.2.2，表示安装1.x.x的最新版本
    latest：安装最新版本

### jquery
    prop attr的区别：
        在这里，我们可以将attribute理解为“特性”，property理解为为“属性”从而来区分俩者的差异。
        举个例子，option当做一个对象：
        var option = {
            selected:false，
            disabled:false，
            attributes:[],
            ...
        }
        attributes是自定义的键值对，property是对象自身的属性:selected、disabled、attributes...

###　报错:sh: 1: tsc: not found
    需要安装typescript，执行:sudo npm install -g typescript

### chrome插件开发
    [an example](https://developer.chrome.com/extensions/getstarted/ "略略")

### div层调整zindex属性无效原因分析及解决方法
这种情况发生的条件有三个:

1、父标签 position属性为relative

2、问题标签无position属性（不包括static)

3、问题标签含有浮动(float)属性

eg:z-index层级不起作用，浮动会让z-index失效


子元素浮动,父div没有自适应
clear:both 不管用?
给父元素添加: overflow:hidden

一个div内的多个同级div，同级的div在同一行，怎么保证它们高度一致?
margin-bottom


1,在当前窗口中跳转:
	window.location.href('url') 存在兼容问题,火狐不支持,可以使用 window.location='url';
	
	history.back();返回
	
2,学会使用data*属性,这是属于html5的标签属性，传递参数时可以在路径中加上?key1=value1&key2=value2的形式

3,onbar事件
	使用taglib prefix ="c"，循环
	
4,使用锚点:
	<a name="anchor1"/>.........<a target="#anchor1"/>	
	
	
软件 Artisteer firework ps 美图秀秀

textContent与innerHTNL的区别:textContent返回元素及其后代的文本内容,而innerHTML则返回HTML

ie和火狐遍历子节点chileNodes的区别:ie没有空格,火狐带空格

ul中的li居中:li的默认display为block,设置li为inline


对于浮动元素的高度为0,可以通过设置:如下:
	ul:after {
	  content: "";
	  display: table;
	  clear: both;
	}
<<<<<<< HEAD
=======


动画滚动:
$msg_container.animate({ scrollTop: $msg_container.prop("scrollHeight") });
<<<<<<< HEAD:note/web.md


/**
* 禁用右键菜单
*/
document.oncontextmenu = function(){
    event.returnValue = false;
};

/**
* 禁用选中功能
*/
document.onselectstart = function(){
    event.returnValue = false;
};

/**
* 禁用复制功能
*/
document.oncopy = function(){
    event.returnValue = false;
};

/**
* 禁用鼠标的左右键
*/
document.onmousedown = function(){
    if(event.which==1){//鼠标左键
        return false;
    }
    
    if(event.which==3){//鼠标右键
        return false;
    }
};

/**
* 获取键盘上的输入值
*/
document.onkeydown = function(){
    console.info(event.which);
    if(event.which==13){
        console.info("回车键");
    }
};
=======
>>>>>>> 41240ef5b4e9b62eebeb679e7c8e149ab2844880
>>>>>>> 345d95c93da6a224ef76835ca2d665929581c166:note/前端的那些事.md
