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
