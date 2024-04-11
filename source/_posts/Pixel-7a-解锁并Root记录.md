---
title: Pixel 7a 解锁并Root记录
categories: 技术文
tags:
  - 教程
  - Pixel
  - 手机
  - Root
abbrlink: f9eadd70
date: 2024-04-09 17:28:32
---

设备：Pixel 7a
设备系统：Android 14
电脑系统：Windows 11
Magisk：27.002

入手了Pixel 7a，第一件事情就是解锁并Root，这样才能更好的发挥手机的性能。
本文记录了解锁并Root的过程。

物品清单：

- 手机1台
- 电脑1台
- USB数据线1根

## 1. 事前准备(已安装过的可以跳过)
无论是解锁还是Root，都需要在电脑上安装驱动，以及ADB工具。

### 1.1 安装驱动[电脑端]
驱动下载页面：[Google USB Driver](https://developer.android.com/studio/run/win-usb)

在页面中找到“Download the Google USB Driver ZIP file (ZIP)”，点击即可下载。

下载完成后解压，找到“android_winusb.inf”文件，右键点击安装。

### 1.2 下载ADB工具[电脑端]
ADB工具下载页面：[ADB工具下载](https://developer.android.com/studio/releases/platform-tools)

下载完成后解压，将解压后的文件夹放到一个方便的位置。

之后需要在命令窗口执行的adb.exe命令和fastboot.exe命令，都在这个文件夹中。

※ 打开命令窗口方法：在文件夹空白处按住Shift键，同时右键点击鼠标，选择“在此处打开Powershell窗口”即可。

※ 如果要在命令窗口中直接执行adb命令，需要将这个文件夹的路径添加到系统环境变量中。

## 2. 解锁

### 2.1 开启OEM解锁及USB调试[手机端]

在手机设置中找到“关于手机”-“版本号”，连续点击7次，即可开启开发者选项。

在“开发者选项”中找到“OEM解锁”，开启。

※ 如果OEM开关无法开启，说明该手机不支持解锁Bootloader，无法继续解锁和Root。

在“开发者选项”中找到“USB调试”，开启。

将手机连接到电脑，会弹出提示：“是否允许USB调试”，选择“允许”(可以把“一律允许”打勾)。

### 2.2 解锁Bootloader[电脑端]

1. 确认手机连接状况，打开命令窗口，输入以下命令：
```shell
adb devices
```

    如果显示设备号，代表手机已经连接成功。
    如果没有显示设备号，可能是电脑的驱动没有安装好，或者USB数据线/口，或者手机端没打开USB调试。

2. 输入以下命令来重启手机进入bootloader模式：
```shell
adb reboot bootloader
```

3. 输入以下命令来解锁Bootloader：
```shell
fastboot flashing unlock
```

    ※ 注意：该命令与旧版不同，旧版命令为：fastboot oem unlock。
    
    执行后，手机会显示解锁提示，按音量键切换选项，选择“unlock”，按电源键确认。
    
    手机会自动重启，这时候手机的Bootloader已经解锁成功，启动时会有已解锁的英文界面提示。

    解锁后手机数据会被清空，所以解锁前要提前备份好手机数据。

    ※ 解锁后需要重新开启USB调试，以便后续Root。

## 3. Root

### 3.1 下载镜像文件[电脑端]

打开镜像文件下载地址：
https://developers.google.com/android/images

找到对应的Pixel 7a的最新镜像文件，下载解压(注意：要下载全量镜像，不要下载OTA镜像)。

### 3.2 刷入最新系统镜像[电脑端]

※ 该步骤为了确保手机当前系统版本和你下载的镜像版本一致，以免刷入后出现问题变砖。

保持手机与电脑连接，打开命令窗口，输入以下命令进入bootloader模式：
```shell
adb reboot bootloader
```

在解压出来的镜像文件夹中找到flash-all.bat文件，双击运行。

这个脚本文件会自动刷入解压出来的系统镜像，刷入完成后手机会自动重启。

※ 注意：刷入镜像后手机数据会被清空，所以刷入前要提前备份好手机数据。

※ 刷入镜像后需要重新开启USB调试，以便后续Root。

### 3.3 解压出镜像文件中的init_boot.img[电脑端]

解压出镜像文件中的init_boot.img，这个文件是我们接下来需要用到的。

注意：新版Pixel手机root用到的是init_boot.img，不再是旧版用到的boot.img。

### 3.4 安装Magisk Manager，对init_boot.img进行patch[手机端]

打开 https://github.com/topjohnwu/Magisk/releases ，
下载最新的Magisk Manager APK。

打开Magisk Manager，选择“安装”-“选择并修补一个文件”，选择刚才解压出来的init_boot.img。

这样patch后的会生成一个新文件，保存在download文件夹中。
新文件命名一般类似：magisk_patched-25200_sZBNk.img。

将其传到电脑中待会儿用。

### 3.4 刷入patch后的init_boot.img[电脑端]

保持手机与电脑连接，打开命令窗口，输入以下命令进入bootloader模式：
```shell
adb reboot bootloader
```

输入以下命令刷入patch后的init_boot.img：
```shell
fastboot flash init_boot magisk_patched-25200_sZBNk.img # 改成你的文件名
```

刷入完成后，重启手机。

### 3.5 验证Root[手机端]

重启手机，打开Magisk Manager，即可看到已经root成功。

## 4. 结束

至此，Pixel 7a解锁并Root完成。









