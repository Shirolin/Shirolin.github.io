---
title: Pixel 7a 开启VoLTE支持
categories: 技术文
tags:
  - 教程
  - Pixel
  - 手机
abbrlink: 92c869fb
date: 2024-04-19 15:14:47
---

VoLTE（Voice over LTE）是指通过4G网络实现的高清语音通话技术。

由于国内2G/3G网络逐渐退网停止服务，4G网络逐渐成为主流，VoLTE技术也逐渐普及。
如果不开启VoLTE，可能会导致通话质量不佳，甚至无法打电话、收发短信等问题。

而由于Google和国内运营商两方面的原因，
未在国内大陆地区上市的Pixel系列手机无法针对三大运营商的网络直接开启VoLTE功能。

因此，需要通过一些手段来开启VoLTE功能。
本文以Pixel 7a为例，介绍如何开启VoLTE功能，
有Root和免Root两种方法，下面分别介绍。

## 设备信息
设备：Pixel 7a
设备系统：Android 14

## 免Root方法

### 打开手机开发者选项

打开手机设置，找到“关于本机”，连续点击“Build号(系统版本号)”7次，即可打开开发者选项。

### 下载Shizuku和Pixel IMS并安装

[Shizuku](https://shizuku.rikka.app/) 是一款开源的Root权限管理工具，可以在不Root的情况下模拟Root权限。

[Pixel IMS](https://play.google.com/store/apps/details?id=dev.bluehouse.enablevolte) 是一款可以开启VoLTE功能的应用。

下载地址：
- [Shizuku](https://github.com/RikkaApps/Shizuku/releases)
- [Pixel IMS](https://github.com/kyujin-cho/pixel-volte-patch/releases)

### 运行Shizuku并设置

打开Shizuku，找到“通过无线调试启动”，点击“配对”。
※ 这里不清楚步骤的话，可以点击“分步骤指南”来查看。

![Shizuku配对](Shizuku配对.webp)

按照提示操作会跳转到开发者选项，找到“无线调试”，点击“启用”。
弹出的对话框中点击“允许”。

![wifi调试](wifi调试.webp)

启用后点击左边“无线调试”几个字，会进入“无线调试”页面，找到“使用配对码配对设备”，点击。会出现一个配对码，先不要关闭该界面。

这时候顶部会弹出Shizuku的一个下拉通知，点击“输入配对码”，输入刚才的配对码，点击“确定”。即可完成配对。

![无线配对](无线配对.webp)

※ 如果配对失败，可以尝试重新配对，如果一直失败，可以分屏运行Shizuku和无线调试窗口，这样可以方便输入配对码，提高成功率。

配对成功后，
返回Shizuku界面，点击“启动”按钮。
看到“Service started”即表示Shizuku启动成功。

### 在Pixel IMS中开启VoLTE

打开Pixel IMS，会收到来自Shizuku提示，询问是否允许Pixel IMS使用Shizuku的权限，点击“始终允许”。
等到右下角出现SIM卡配置按钮，即表示Shizuku权限已经生效。

点击SIM卡配置按钮，
打开如下开关：

- 启用VoLTE
- 启用VoWiFi
- 启用增强4G(LTE+)
- 允许添加接入点APN
- 显示VoWiFi选项
- 隐藏增强4G(LTE+)图标
- 在SIM信息中显示IMS状态

![Sim配置](Sim配置.webp)

回到Pixel IMS主界面，
看到“支持VoLTE”的状态变为“是”，即表示系统已出现VoLTE开关。

![Pixel-IMS](Pixel-IMS.webp)

### 打开SIM卡设置中的VoLTE开关

打开手机设置，找到“网络和互联网”-“SIM卡”-选择一张SIM卡，进入SIM卡设置界面，
找到VoLTE开关，打开即可。

![Sim卡设置](Sim卡设置.webp)

### 免Root方法总结

至此，VoLTE功能已经开启，可以在设置中查看VoLTE的状态。
通过这种方法开启VoLTE功能，不需要Root，也不需要刷机，操作简单，适合大多数用户。
但是在手机进行OTA更新后就会失效，需要重新再操作开启一遍。

## Root方法

### 安装Magisk模块：Pixel Enabler China For VoTEL

Pixel Enabler China For VoTEL 是一款Magisk模块，可以开启Pixel系列手机的VoLTE功能。

下载地址：[Pixel Enabler China For VoTEL](https://github.com/CHN-MuXin/MagiskModuleEnableChinaForVoTELtoPIxel)

下载模块文件(一个zip包)后，打开Magisk，点击右下角“模块”，点击“从本地安装”，选择下载的模块文件，安装后重启手机。

![手动安装模块](手动安装模块.webp)

### 打开SIM卡设置中的VoLTE开关

打开手机设置，找到“网络和互联网”-“SIM卡”-选择一张SIM卡，进入SIM卡设置界面，
找到VoLTE开关，打开即可。

![Sim卡设置](Sim卡设置.webp)

