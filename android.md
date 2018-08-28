# 配安卓环境
    
### 安卓环境下载: http://sdk.android-studio.org/index.php

### android studio
    https://dl.google.com/dl/android/studio/ide-zips/3.0.0.18/android-studio-ide-171.4408382-linux.zip
    7z x android-studio-ide-171.4408382-linux.zip -o/usr/local
    export STUDIO_HOME=/usr/local/android-studio
    export PATH=$STUDIO_HOME/bin:$PATH

### sdk
    http://sdk.android-studio.org/
    tar -zxvf android-sdk-linux.tar.gz
    sudo mv android-sdk-linux /usr/local
    export SDK_HOME=/usr/local/android-sdk-linux  
    export PATH=$SDK_HOME/tools:$SDK_HOME/platform-tools:$PATH

### gradle:
    https://services.gradle.org/distributions/gradle-2.14.1-all.zip
    unzip gradle-2.14.1-all.zip
    mv gradle-2.14.1-all /usr/local
    export GRADLE_HOME=/usr/local/gradle-2.14.1
    export PATH=$GRADLE_HOME/bin:$PATH


### 安卓真机调试:
    获取设备ID(2717:ff48):
        lsusb
    cd /etc/udev/rules.d
    新建文件:
        sudo gedit android.rules:
        SUBSYSTEM=="usb", ATTRS{idVendor}=="2717", SYSFS{idProduct}=="400e", MODE:="0666"

        //SYSFS{idProduct}?

    sudo chmod a+rx android.rules
    重启usb和adb服务:
        service udev restart
        adb kill-server
        adb start-server
        adb devices

### adb常用命令:
    adb devices, 获取设备列表及设备状态
    adb get-state, 获取设备的状态
    adb install apkFile, 安装apk到手机

    adb kill-server, adb start-server, 结束 adb 服务，启动 adb 服务
    adb logcat, 打印 Android 的系统日志
    adb uninstall packageName, 下载apk

### 安装 ionic:

    常用命令:

    编译时报错:
        Checking the license for package Android SDK Platform 26 in /usr/local/android-sdk-linux/licenses
        。。。
        Before building your project, you need to accept the license agreements and complete the installation of the missing components using the Android Studio SDK Manager.
    解决方法:
        cd /usr/local/android-sdk-linux/bin
        ./sdkmanager --licenses
        证书都确定就好了

### cordova基本使用:
    cordova create myapp com.peak.maxu.myapp MyApp
    cordova platform add android
    cordova requirements
    cordova platform ls
    cordova plugin ls

    cordova build android
    install_result=$(adb install /home/peak/pr;ograms/myapp/platforms/android/build/outputs/apk/android-debug.apk)
    adb uninstall com.peak.maxu.myapp

    cordova run android

    Refused to connect to 'http://www.tuling123.com/openapi/api' because it violates the following Content Security Policy directive: "default-src 'self' data: gap: https://ssl.gstatic.com 'unsafe-eval'". Note that 'connect-src' was not explicitly set, so 'default-src' is used as a fallback.
    添加:<meta http-equiv="Content-Security-Policy" content="script-src * 'unsafe-eval'; connect-src * 'unsafe-eval'; object-src 'self'; style-src * 'unsafe-inline'; img-src *" />

    adb shell
    adb uninstall com.peak.robot.android_ui

    adb remount
    adb push ./out/hello.ko  /system/lib/modules
    insmod /system/lib/modules/hello.ko

    源码中的M模块最终的生成目录:
        /system/vendor/modules

    cat /proc/bus/input/devices

    adb push时, Read-only file system:
    mount -o rw,remount /system
    adb push system/usr/idc/usbtouch.idc /system/usr/idc/

    adb shell:
        wm size 获取显示屏幕尺寸
        wm size 1920x1080 设置显示屏幕尺寸
        wm density 获取屏幕密度
        wm density 240 设置屏幕密度
    

    config.xml配置文件中:
    <allow-navigation href="http://*/*" /> 允许内部导航
    <allow-intent href="http://*/*" /> 允许导航到外部域

## 安卓cordova项目

1. cordova create robot_android_ui com.peak.ui 小凌监控
2. cordova platform add android@7.1    添加安卓平台, 后面的@7.1是手动指定的版本,可不加
3. 在config.xml中添加:
    <allow-navigation href="http://*/*" />
    <allow-navigation href="https://*/*" />
    <!-- 全屏显示 -->
    <preference name="Fullscreen" value="true" />
4. 修改config.xml中默认的content:
    <content src="http://192.168.10.175:8000" />
5. 编译运行:
    cordova run android

### Android串口通信:
    http://blog.csdn.net/warweeszip/article/details/72956218
