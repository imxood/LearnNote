## 根据网络端口查看当前进程
    netstat -ano | findstr "8080"

## windows 10 挂载esp分区到Z盘(U盘似乎不能挂载)
    # diskpart 
    # list disk
    # sel disk 0
    # list vol
    # select vol 0
    # assign letter=z


## 添加右键菜单 注册表脚本
    Windows Registry Editor Version 5.00
    [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\*\shell]
    [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\*\shell\bash]
    [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\*\shell\bash\command]
    @="D:\\programs\\MinGW\\msys\\1.0\\bin\\bash.exe \"%V\""

## 删除右键菜单 注册表脚本
    [Version]
    Signature="$Windows NT$"
    [DefaultInstall]
    DELREG=Edit with Custom Menu
    [Edit with SciTE]
    hkcr,"*\\shell\\Edit with SciTE"


## 工具msys2
https://blog.csdn.net/qiuzhiqian1990/article/details/56671839



## 解决无法禁用输入法ctrl space快捷键的问题

1. regedit, 打开注册表->找到"计算机\HKEY_USERS\.DEFAULT\Control Panel\Input Method\Hot Keys\00000010"->修改key modifiers 和 vitrual key

2. tip:如果禁用[输入法/非输入法切换] ,就把key modifiers 和 vitrual key 的第一位都修改成00

3. tip:如果有将要修改的目标热键,比如我希望把[输入法/非输入法切换] 改成ctrl+"~",就把key modifiers的第一位修改成02,vitrual key的第一位修改成C0.

4. 说明:①Key Modifiers(修改键)：第一位是Ctrl，Alt，Shift三个，Ctrl为02，Alt为01，Shift为04，要组合键的话直接相加；第二位是用左侧还是右侧，左侧80，右侧40，组合起来就是8+4=12=c0。②Virtual Key(虚拟键)：设置组合键以外的热键，把第一位设置为对应的二进制数据即可。例如想设置A为热键，其二进制数据为41，则把Virtual Key改成41 00 00 00,更多键值Virtual-Key Codes.