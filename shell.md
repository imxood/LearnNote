echo $file|cut -d'.' -f1    获取文件名(不含后缀)


# sed [-nefr] [动作]
    选项与参数：
    -n ：使用安静(silent)模式。在一般 sed 的用法中，所有来自 STDIN 的数据一般都会被列出到终端上。但如果加上 -n 参数后，则只有经过sed 特殊处理的那一行(或者动作)才会被列出来。
    -e ：直接在命令列模式上进行 sed 的动作编辑；
    -f ：直接将 sed 的动作写在一个文件内， -f filename 则可以运行 filename 内的 sed 动作；
    -r ：sed 的动作支持的是延伸型正规表示法的语法。(默认是基础正规表示法语法)
    -i ：直接修改读取的文件内容，而不是输出到终端。

    动作说明： [n1[,n2]]function
    n1, n2 ：不见得会存在，一般代表『选择进行动作的行数』，举例来说，如果我的动作是需要在 10 到 20 行之间进行的，则『 10,20[动作行为] 』

    function：
    a ：新增， a 的后面可以接字串，而这些字串会在新的一行出现(目前的下一行)～
    c ：取代， c 的后面可以接字串，这些字串可以取代 n1,n2 之间的行！
    d ：删除，因为是删除啊，所以 d 后面通常不接任何咚咚；
    i ：插入， i 的后面可以接字串，而这些字串会在新的一行出现(目前的上一行)；
    p ：列印，亦即将某个选择的数据印出。通常 p 会与参数 sed -n 一起运行～
    s ：取代，可以直接进行取代的工作哩！通常这个 s 的动作可以搭配正规表示法！例如 1,20s/old/new/g 就是啦！

### sed example
    删除第2行
    cat robot.ini | sed '2d'

    删除第2~5行
    cat robot.ini | sed '2,5d'

    删除第2行到最后
    cat robot.ini | sed '2,$d'

    替换文本"${user}"为当前用户
    cat robot.ini | sed 's/${user}/'`whoami`'/g'




ps awx -o "%p %P"|grep -w 21145| awk '{ print $1  }'|xargs kill -9
杀死进程及所有子进程

$0 	当前脚本的文件名
$n 	传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是$1，第二个参数是$2。
$# 	传递给脚本或函数的参数个数。
$* 	传递给脚本或函数的所有参数。
$@ 	传递给脚本或函数的所有参数。被双引号(" ")包含时，与 $* 稍有不同，下面将会讲到。
$? 	上个命令的退出状态，或函数的返回值。
$$ 	当前Shell进程ID。对于 Shell 脚本，就是这些脚本所在的进程ID。

FUNCNAME与BASH_SOURCE：

function test_func()
{
    echo "Current $FUNCNAME, \$FUNCNAME => (${FUNCNAME[@]})"
    another_func
    echo "Current $FUNCNAME, \$FUNCNAME => (${FUNCNAME[@]})"
}
function another_func()
{
    echo "Current $FUNCNAME, \$FUNCNAME => (${FUNCNAME[@]})"
}

echo "Out of function, \$FUNCNAME => (${FUNCNAME[@]})"
test_func
echo "Out of function, \$FUNCNAME => (${FUNCNAME[@]})"

执行结果是:
1 Out of function, $FUNCNAME => ()
2 Current test_func, $FUNCNAME => (test_func main)
3 Current another_func, $FUNCNAME => (another_func test_func main)
4 Current test_func, $FUNCNAME => (test_func main)
5 Out of function, $FUNCNAME => ()

${}的一些特异功能
file=/dir1/dir2/dir3/my.file.txt
可以用${ }分别替换获得不同的值：
${file#*/} 拿掉第一个 / 及其左边的字符串：dir1/dir2/dir3/my.file.txt
${file##*/} 拿掉最后一个 / 及其左边的字符串：my.file.txt
${file#*.} 拿掉第一个 . 及其左边的字符串：file.txt
${file##*.} 拿掉最后一个 . 及其左边的字符串：txt
${file%/*} 拿掉最后一个 / 及其右边的字符串：/dir1/dir2/dir3
${file%%/*} 拿掉第一个 / 及其右边的字符串：(空值)
${file%.*} 拿掉最后一个 . 及其右边的字符串：/dir1/dir2/dir3/my.file
${file%%.*} 拿掉第一个 . 及其右边的字符串：/dir1/dir2/dir3/my
记忆的方法：
# 去掉左边(键盘上 # 在 $ 的左边)
% 去掉右边(在键盘上 % 在 $ 的右边)
单一符号是最小匹配，两个符号是最大匹配。
${file:0:5} 提取最左边的 5 个字节：/dir1
${file:5:5} 提取第 5 个字节右边的连续 5 个字节：/dir2
也可以对变量值里的字符串作替换：
${file/dir/path} 将第一个 dir 替换为 path：/path1/dir2/dir3/my.file.txt
${file//dir/path} 将全部 dir 替换为 path：/path1/path2/path3/my.file.txt
利用${ }还可针对不同的变量状态赋值(未设定、空值、非空值)： 
${file-my.file.txt} 若 $file 未设定，则使用 my.file.txt 作传回值。(空值及非空值时不作处理) 
${file:-my.file.txt} 若 $file 未设定或为空值，则使用 my.file.txt 作传回值。(非空值时不作处理)
${file+my.file.txt} 若 $file 设为空值或非空值，均使用 my.file.txt 作传回值。(未设定时不作处理)
${file:+my.file.txt} 若 $file 为非空值，则使用 my.file.txt 作传回值。(未设定及空值时不作处理)
${file=my.file.txt} 若 $file 未设定，则使用 my.file.txt 作传回值，同时将 $file 赋值为 my.file.txt。 (空值及非空值时不作处理)
${file:=my.file.txt} 若 $file 未设定或为空值，则使用 my.file.txt 作传回值，同时将 $file 赋值为 my.file.txt。 (非空值时不作处理)
${file?my.file.txt} ：若 $file 未设定，则将 my.file.txt 输出至 STDERR。(空值及非空值时不作处理)
${file:?my.file.txt} ：若 $file 未设定或为空值，则将 my.file.txt 输出至 STDERR。(非空值时不作处理)
以上的理解在于，一定要分清楚 unset 与 null 及 non-null 这三种赋值状态。
一般而言，与 null 有关，若不带 : 的话，null 不受影响，若带 : 则连 null 也受影响。
${#var} 可计算出变量值的长度：
${#file} 可得到 27，/dir1/dir2/dir3/my.file.txt 刚好是 27 个字节。

bash数组(array)处理方法

一般而言，A="a b c def"只是将 $A 替换为一个单一的字符串，但是改为 A=(a b c def)，则是将 $A 定义为数组。
bash的数组替换方法可参考如下方法：
${A[@]} 或 ${A[*]} 得到 a b c def(全部数组)
${A[0]} 得到 a (第一个元素)，${A[1]} 第二个...
${#A[@]} 或 ${#A[*]} 得到 4 (数组数量)
${#A[0]} 得到 1 (第一个元素 a 的长度)，${#A[3]} 得到 3 (第四个元素 def 的长度)
A[3]=xyz 将第四个元素重新定义为 xyz

$(( ))的用途

用来作整数运算。在 bash 中，$(( ))的整数运算符号大致有这些：
+ - * / 加、减、乘、除
% 余数运算
& | ^ ! AND、OR、XOR、NOT运算
举例：
$ a=5; b=7; c=2
$ echo $((a+b*c))
19
$ echo $(((a+b)/c))
6
$ echo $(((a*b)%c))
1
在$(( ))中的变量名称也可以在其前面加 $ 符号：$(($a+$b*$c))也可以得到 19 的结果。
此外，$(( ))还可以作不同进制(如二进制、八进位、十六进制)运算，只是输出结果皆为十进制而已。
echo $((16#2a)) 结果为 42 (16进位转十进制)
举一个实用的例子：
当前的 umask 是 022，新建文件的权限为：
$ umask 022
$ echo "obase=8; $(( 8#666 & (8#777 ^ 8#$(umask)) ))" | bc
644
事实上，单纯用(( ))也可以重定义变量值，或作testing：
a=5; ((a++)) 将 $a 重定义为 6
a=5; ((a–)) a=4
a=5; b=7; ((a < b)) 会得到 0 (true) 的返回值
常见的用于(( ))的测试符号有以下这些：
< 小于
> 大于
<= 小于或等于
>= 大于或等于
== 等于
!= 不等于

引用
() 命令组，创建子SHELL执行
{} 命令组，不创建子SHELL
' ' 保护所有的元字符不被解析，想打印'，必须放在双引号内，或者使用/转义
" " 只允许变量和命令替换，保护其余的元字符不被解析

数学表达式扩展
$[ exp ]
$(( exp ))

函数定义
function f()
{
cmd;cmd;
}

字符串测试
[ str1 = str2 ]    str1与str2相同或==
[ str1 != str2 ]   st1与str2不相同
[ str ]            str非空
[ -z str ]         str的长度为0
[ -n str ]    str的长度非0
[ -l str ]     str的长度
[ str1 -a str2 ]   and 
       -o     or
!     not
复合条件测试
[[ p1 && p2 ]]     p1与p2均为真
[[ p1 || p2 ]]
[[ !p2 ]]

整数测试
[ num1 -eq num2 ]
[ numb1 -ne num2 ]
gt ge lt le 

文件属性测试
[ file1 nt file2 ]  文件1比文件2新
[ file1 ot file2 ]
[ file1 ef file2 ]
[-d file]           file为目录
-b  -c  -p -L -S    块文件,字符文件，管道，链接，socket
-e  -f              文件存在，常规文件
-G      文件存在且拥有有效GID
-O                  文件存在且拥有有效UID
-g       设置GID
-k                  设置stick位
-r -w -x            文件可读，可写，可执行的
-s                  文件大小非0
-t        文件fd在终端打开
-u                  setUID位设置

测试表达可以与let的运算扩展及(( ))中的C型运算扩展是等价的，后者也许更容易理解，C-like。

if [ $(lsb_release -sc) == "xenial" ]; then
	ros_version="kinetic"
else
	ros_version="indigo"
fi

条件控制
if command; then
    command
fi

 

if test expression
then
command
fi

 

if [ string/numeric expression ] then
command
fi

 

if [[ string expression ]] then
command
fi

 

if (( numeric expression ))


if command
then
command(s)
else
command(s)
fi

if command
then
command(s)
elif command
then
commands(s)
elif command
then
command(s)
else
command(s)
fi

 

空命令  ：

 

分支跳转
case variable in 
value1)
command(s)
;;
value2)
command(s)
;;
*)
command(s)
;;
esac

 

循环
for variable in word_list
do
command(s)
done

while condition
do
command(s)
done

until command
do
     command(s)
done

 

构建菜单的select
select program in 'ls -F' pwd date
 do
 $program
 done

 

中断循环
break [n]     从第n层循环中跳出
continue [n]  继续第n层循环

 

捕获信号
信号列表
1) SIGHUP 9) SIGKILL 17) SIGCHLD 25) SIGXFSZ
2) SIGINT 10) SIGUSR1 18) SIGCONT 26) SIGVTALRM
3) SIGQUIT 11) SIGSEGV 19) SIGSTOP 27) SIGPROF
4) SIGILL 12) SIGUSR2 20) SIGTSTP 28) SIGWINCH
5) SIGTRAP 13) SIGPIPE 21) SIGTTIN 29) SIGIO
6) SIGABRT 14) SIGALRM 22) SIGTTOU 30) SIGPWR
7) SIGBUS 15) SIGTERM 23) SIGURG
8) SIGFPE 16) SIGSTKFLT 24) SIGXCPU
trap 'command; command' signal-number-list
trap 'command; command' signal-name-list  处理信号，当收到singal-list中的信号后，执行 ''中的命令
trap singal   重置信号处理函数
trap          列出已经设置信号处理


调试脚本
bash -x   script    显示命令执行过程，及结果
bash -v   script    显示脚本中的各行
bash -n   script    解释但不执行



### Linux里的2>&1究竟是什么
    几个基本符号及其含义
    /dev/null 表示空设备文件
    0 表示stdin标准输入
    1 表示stdout标准输出
    2 表示stderr标准错误
    
    http://blog.csdn.net/ggxiaobai/article/details/53507530


### 脚本所在路径
$(cd `dirname "$0"`;pwd)

sudo sed -i 's+${user}+'${user}'+g;s+${application_dir}+'${application_dir}'+g' \
    /etc/supervisor/supervisord.conf \
    /etc/supervisor/conf.d/robot.ini \
    /etc/systemd/system/supervisor.service