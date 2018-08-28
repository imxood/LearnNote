  account   Manage PIO Account
  boards    Embedded Board Explorer
  ci        Continuous Integration
  debug     PIO Unified Debugger
  device    Monitor device or list existing
  home      PIO Home
  init      Initialize PlatformIO project or update existing
  lib       Library Manager
  platform  Platform Manager
  remote    PIO Remote
  run       Process project environments
  settings  Manage PlatformIO settings
  test      Local Unit Testing
  update    Update installed platforms, packages and libraries
  upgrade   Upgrade PlatformIO to the latest version


搜索stm32f767板:
pio boards stm32f767
pio platform search stm32

创键
pio init --ide vscode --board genericSTM32F103RC -O framework=stm32cube
nucleo_f767zi

Useful commands:
`platformio run` - process/build project from the current directory
`platformio run --target upload` or `platformio run -t upload` - upload firmware to embedded board
`platformio run --target clean` - clean project (remove compiled files)
`platformio run --help` - additional information


$ pio init --help

Usage: pio init [OPTIONS]

Options:
  -d, --project-dir DIRECTORY
  -b, --board ID
  --ide [atom|clion|codeblocks|eclipse|emacs|netbeans|qtcreator|sublimetext|vim|visualstudio|vscode]
  -O, --project-option TEXT
  --env-prefix TEXT
  -s, --silent
  -h, --help
