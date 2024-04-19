---
title: R4S 软路由 刷机记录(卡刷)
categories: 技术文
tags:
  - 教程
  - 软路由
  - 刷机
abbrlink: 3e472caf
date: 2024-04-19 09:57:27
---

设备：友善(NanoPi) R4S 4G内存版
设备存储：TF卡 64G
电脑系统：Windows 11
待刷入固件：2024.04.08-openwrt-friendlyarm_nanopi-r4s-squashfs-sysupgrade.img (OpenWrt R24.03.20-D 骷髅头大佬编译版)

目标：
将系统刷入TF卡，然后插入R4S，开机即可使用。

友善R4S是一款性价比很高的软路由，支持OpenWrt系统，本文记录了刷机的过程。

<font color="red">请注意！刷机有风险，操作需谨慎，刷机有可能导致设备变砖，刷机前请做好备份。本文仅供参考，请自行承担风险。</font>

物品清单：

- 友善R4S 1台
- 电脑1台
- TF卡1张
- TF卡读卡器1个

## 事前准备

### 写盘工具下载[电脑端]

写盘工具下载页面：[Rufus](https://rufus.ie/zh/)

### 下载软路由系统固件[电脑端]

固件下载页面：[OpenWrt R24.03.20-D](https://github.com/DHDAXCW/OpenWrt_RockChip/releases/tag/2024.04.08-rockchip)

找到想刷入R4S对应的固件，下载到电脑中。(注意区分Docker版和非Docker版)

Dock版固件文件名示例：
> 2024.04.08-docker-openwrt-friendlyarm_nanopi-r4s-squashfs-sysupgrade.img.gz

非Docker版固件文件名示例：
> 2024.04.08-openwrt-friendlyarm_nanopi-r4s-squashfs-sysupgrade.img.gz

下载完成后无需解压，保留.gz格式即可。

※ 其它固件版本请自行查找。

## 刷机

### 插入TF卡[电脑端]

将TF卡插入读卡器，插入电脑。

如果弹出格式化提示，请选择取消(注意：不要格式化！)。

### 使用Rufus写入固件[电脑端]

打开Rufus。

如果已经插入TF卡，Rufus会自动识别，不用进行任何修改。

点击“选择”，选择刚才下载好的固件文件。

点击“开始”，等待写入完成。(注意：写入过程中不要拔出TF卡，有弹出警告时点击“确定”)

等到写入完成，状态栏下的进度条会提示“准备就绪”，点击“关闭”。

弹出TF卡即可。

### 刷入系统[软路由端]

R4S断电，将TF卡插入R4S的TF卡槽。

接通电源，开机。

等待启动完成。（第一次启动可能需要等待较长时间）

启动完成后，可以通过网线连接R4S的LAN口，访问。

如果能访问到OpenWrt的管理界面，说明刷机成功。

不同固件版本的OpenWrt管理界面地址可能不同，可以查看固件的说明文档。
例如本文用的固件管理界面地址为：192.168.11.1 
默认账号密码为：root/password

## 总结

以上就是R4S软路由的刷机过程，刷机过程中如果遇到问题，可以查看固件的说明文档，或者在相关论坛、群组提问。