### python默认使用ascii编码,处理文件时可能报错:
    os.environ                          环境变量

    os.getenv("PATH", "")               获取环境变量
    os.environ['PATH']

    from shutil import copyfile
    from os import getcwd, makedirs
    from os.path import abspath, basename, expanduser, isdir, isfile, join, relpath

    expanduser('~')

    os.path.join('a/b', 'c')            拼凑路径: a/b/c
    os.path.dirname('a/b/c')            获取目录名称: a/b
    os.path.abspath('a/b/c')            获取绝对路径: 以当前路径与a/b/c拼凑
    os.path.relpath(path，start)        获取相对start的路径

    os.stat('/tmp')                     查看文件权限，掩码，用户组,时间等信息
    os.symlink                          创键链接文件
    os.getpid                           获取进程id

    platform.architecture()             ('64bit', '')
    sys.platform                        获取系统名称:linux
    sys.path
    sys.stderr.write

    subprocess.Popen

    socket.gethostname

### 修改pip源,设置清华源
    linux下，修改 ~/.pip/pip.conf (没有就创建一个)， 修改 index-url至tuna，内容如下:
        [global]
        index-url = https://pypi.tuna.tsinghua.edu.cn/simple
    
    windows下，直接在user目录中创建一个pip目录，如：C:\Users\xx\pip，新建文件pip.ini，内容如下:
        [global]
        index-url = https://pypi.tuna.tsinghua.edu.cn/simple
 
 
### 安装OfflineDoc
    https://github.com/ichuan/OfflineDoc


### pyqt5 环境配置:
    sudo apt-get install qt4-designer(命令:designer-qt4)

### python升级3.6:
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:jonathonf/python-3.6
    sudo apt-get update
    sudo apt-get install python3.6

### 安装pyenv
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
    vim ~/.bashrc:
        export PATH="/home/maxu/.pyenv/bin:$PATH"
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"

    常用命令:
        pyenv install --list
        pyenv versions
        pyenv version

    ~/.pyenv/cache

    PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.6.3


# conda

### 设置conda源:
    https://mirrors.tuna.tsinghua.edu.cn/help/anaconda/

    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
    conda config --set show_channel_urls yes

### 启用conda的参数自动补全：
    conda install argcomplete
    eval "$(register-python-argcomplete conda)"

### 常用命令：
    conda config --show

    conda install anaconda-client

    anaconda -h

    conda --version
    conda info --envs

    source activate snowflakes
    activate snowflakes

    conda update conda

    conda create --name python=3.5 snowflakes biopython
    conda create --name flowers --clone snowflakes

    conda remove --name flowers --all
    conda remove --name bunnies iopro

    conda search --full-name python

    conda list

    conda install --name bunnies beautifulsoup4

### 安装pyside2
    apt-get install python-pyside2  # for Python 2.7.x
    apt-get install python3-pyside2  # for Python 3.5.x

### 编译python3.6
    wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tar.xz
    tar -xvf Python-3.6.3.tar.xz && cd Python-3.6.3

### 安装pip:
    sudo apt-get install python-pip

### Python:'ascii’ codec can’t encode characters in position,,,,,,,UnicodeDecodeError: 'ascii' codec can't decode byte 0x
    解决方法:
        在python的Lib\site-packages文件夹下,比如我的是:/usr/lib/python2.7/,编辑sitecustomize.py(若不存在就新建)，添加内容：
        # encoding=utf8
        import sys

        reload(sys)
        sys.setdefaultencoding('utf-8')

### python串口模拟:
    


### setup.py 构建包的卸载
    python setup.py install --record files.txt
    cat files.txt | xargs rm -rf


### python web server
    nohup python -m SimpleHTTPServer 8000 &



### 可执行文件当前所在目录
bin_dir = os.path.split(os.path.realpath(__file__))[0]

### 解决UnicodeEncodeError: 'ascii' codec can't encode characters in position 0-3: ordinal not in range(128)
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

在Lib\site-packages文件夹, 比如在/usr/lib/python2.7目录下:
编辑sitecustomize.py(若不存在则新建),添加内容
# encoding=utf8  
import sys  
reload(sys)  
sys.setdefaultencoding('utf8')


添加私有模块至PYTHONPATH:
PYTHONPATH=$PYTHONPATH:/home/imxood/develop/sources/platformio-core/build/lib.linux-x86_64-2.7
就OK了:
>>> import platformio

查看模块路径:
>>> import platformio
>>> platformio.__file__
'/home/imxood/develop/sources/platformio-core/build/lib.linux-x86_64-2.7/platformio/__init__.pyc'


pip --version 报错:
    ImportError: No module named packaging.version
    解决:
        wget https://bootstrap.pypa.io/get-pip.py  
        sudo python get-pip.py 


"env": {"PYTHONIOENCODING": "GBK"}

## flask gzip
    sudo pip2 install flask flask-compress

    使用:
    from flask import Flask
    from flask.ext.compress import Compress

    app = Flask(__name__)
    Compress(app)


## 常用路径
    显示模块路径
    python -c 'import enum; print(enum.__file__)'

    显示用户包目录
    python -m site --user-site

    用户基础目录
    python -m site --user-base
