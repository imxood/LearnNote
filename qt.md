## qt环境配置:
    sudo vim /usr/lib/x86_64-linux-gnu/qt-default/qtchooser/default.conf:
        /home/maxu/programs/Qt/5.9.1/gcc_64/bin
        /home/maxu/programs/Qt/5.9.1/gcc_64
    vim ~/.bashrc:
        QTDIR=/home/maxu/programs/Qt/5.9.3/gcc_64
        PATH=$QTDIR/bin:$PATH
        LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH
        export QTDIR PATH LD_LIBRARY_PATH

    sudo add-apt-repository ppa:beineri/opt-qt593-xenial
    sudo apt-get update
    sudo apt-get install -y qt59-meta-full qt59creator

## qt环境变量
    export QTDIR=$HOME/programs/Qt/5.11.1/gcc_64
    export PATH=$QTDIR/bin:$PATH
    export MANPATH=$QTDIR/man:$MANPATH
    export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH

## 中文无法输入:
    sudo apt-get install fcitx-libs-qt fcitx-libs-qt5
    cp /usr/lib/x86_64-linux-gnu/qt5/plugins/platforminputcontexts/libfcitxplatforminputcontextplugin.so \
        /home/peak/programs/Qt5.9.1/Tools/QtCreator/lib/Qt/plugins/platforminputcontexts
    chmod +x /home/peak/programs/Qt5.9.1/Tools/QtCreator/lib/Qt/plugins/platforminputcontexts/libfcitxplatforminputcontextplugin.so

qt creator 5.9 中文输入:
    git clone http://github.com/fcitx/fcitx-qt5.git

    cp /usr/lib/x86_64-linux-gnu/qt5/plugins/platforminputcontexts/libfcitxplatforminputcontextplugin.so /home/peak/programs/Qt/5.9.3/gcc_64/plugins/platforminputcontexts/
    chmod +x /home/peak/programs/Qt/5.9.3/gcc_64/plugins/platforminputcontexts/libfcitxplatforminputcontextplugin.so


PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.6.3


QT5源码编译:
    https://wiki.qt.io/Building_Qt_5_from_Git/zh


## deepin-screenshot编译
    sudo apt install debhelper pkg-config libudev-dev  qtmultimedia5-dev libqt5x11extras5-dev libxext-dev qttools5-dev-tools  x11proto-xext-dev libxcb-util0-dev libstartup-notification0-dev libmtdev-dev qtbase5-private-dev libegl1-mesa-dev libudev-dev libfontconfig1-dev libfreetype6-dev libglib2.0-dev libxrender-dev libgsettings-qt-dev librsvg2-dev  libqt5svg5-dev

    cp /usr/include/x86_64-linux-gnu/qt5/QGSettings ./5.6/gcc_64/include/ -r

    https://github.com/linuxdeepin/dtkcore
    https://github.com/linuxdeepin/dde-qt-dbus-factory.git
    https://github.com/linuxdeepin/dtkwidget
    https://github.com/linuxdeepin/deepin-screenshot

    https://github.com/linuxdeepin/dtkwm

    mkdir build && cd build && qmake .. && make -j4
