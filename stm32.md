# STM32学习笔记

1. 使用STM32CubeMX生成项目时,在Makefile中配置:
    1. BINPATH
    2. 删除三行:Src/stm32f1xx_it.c、stm32f1xx_hal_msp.c、Src/main.c、Src/stm32f1xx_hal_msp.c

2. 使用cortex-debug插件调试

3. 在STM32CubeMX的Makefile项目中添加FreeRTOS
    添加源文件到C_SOURCES
    添加头文件到C_INCLUDES



## 使用openocd的stlink调试器:
openocd -f /usr/local/share/openocd/scripts/interface/stlink.cfg -f /usr/local/share/openocd/scripts/target/stm32f7x.cfg

## vscoe, 配置stm32 debug

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "stm32 debug",
            "type": "cppdbg",
            "request": "launch",
            "targetArchitecture": "arm",
            "program": "${workspaceFolder}/build/f767demo.elf",
            "args": [],
            "stopAtEntry": false,
            "cwd": "${workspaceFolder}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "gdb",
            "miDebuggerPath": "${env:HOME}/programs/gcc-arm-none-eabi-7-2017-q4-major/bin/arm-none-eabi-gdb",
            "setupCommands": [
                {
                    "description": "Enable pretty-printing for gdb",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                },
                { "text": "file ${workspaceFolder}/build/f767demo.elf"},
                { "text": "set remotetimeout 30" },
                { "text": "target remote localhost:3333" },
                // { "text": "monitor reset" },
                { "text": "monitor halt" },
                { "text": "monitor reset init" },
                { "text": "load" },
                { "text": "info target" }
            ]
        }
    ]
}
```
