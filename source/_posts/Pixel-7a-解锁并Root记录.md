---
title: Pixel 7a 解锁并Root记录
tags:
  - 技术文
  - Pixel
  - 教程
abbrlink: f9eadd70
date: 2024-04-09 17:28:32
---

入手了Pixel 7a，第一件事情就是解锁并Root，这样才能更好的发挥手机的性能。
本文记录了解锁并Root的过程。

## 1. 解锁

### 1.1 开启OEM解锁

在手机设置中找到“关于手机”-“版本号”，连续点击7次，即可开启开发者选项。

在“开发者选项”中找到“OEM解锁”，开启。

### 1.2 解锁Bootloader

1. 在电脑上安装ADB工具，[下载地址](https://developer.android.com/studio/releases/platform-tools)。
2. 连接手机到电脑，打开CMD，输入以下命令：
```shell
adb devices
```
确认手机已经连接成功。
3. 输入以下命令：
```shell
adb reboot bootloader
```

手机会进入fastboot模式，此时输入以下命令(注意，这里与旧版命令不同)：
```shell
fastboot flashing unlock
```

手机会显示提示，按音量键确认，即可解锁Bootloader。

## 2. Root

### 2.1 下载镜像文件

打开镜像文件下载地址：
https://developers.google.com/android/images

找到对应的Pixel 7a的最新镜像文件，下载解压(注意：要下载全量镜像，不要下载OTA镜像)。

### 2.2 解压出镜像文件中的init_boot.img

解压出镜像文件中的init_boot.img，这个文件是我们接下来需要用到的。

注意：新版Pixel手机root用到的是init_boot.img，不再是旧版用到的boot.img。

### 2.3 安装Magisk，对init_boot.img进行patch

打开https://github.com/topjohnwu/Magisk/releases，下载最新的Magisk Manager APK。

打开Magisk Manager，选择“安装”-“选择并修补一个文件”，选择刚才解压出来的init_boot.img。

这样patch后的新文件会保存在download文件夹中。把这个文件拷贝到电脑中，替换掉原来的init_boot.img。

### 2.4 重新刷入patch后的init_boot.img

将手机连接到电脑，重启手机进入fastboot模式。

输入以下命令：
```shell
fastboot flash init_boot_a (drag patched_init_boot.img)
fastboot flash init_boot_b (drag patched_init_boot.img)
```

### 2.5 重启手机

重启手机，打开Magisk Manager，即可看到已经root成功。

## 3. 结束

至此，Pixel 7a解锁并Root完成。









