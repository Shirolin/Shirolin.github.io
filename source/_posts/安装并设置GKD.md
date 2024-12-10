---
title: 安装并设置GKD
tags:
  - Android
  - 跳过广告
  - 教程
abbrlink: b2ff1374
date: 2024-12-10 09:37:52
---
## 背景

GKD是一款Android设备的跳过广告工具，可以帮助用户跳过一些应用的广告。

可跳过的广告包括开屏广告、插屏广告、悬浮广告、信息流广告等。

GKD项目地址：https://github.com/gkd-kit/gkd

## 安装

### 1. 下载GKD并安装

首先，从GKD的GitHub仓库下载GKD的apk安装包。

下载地址：[GKD Releases](https://github.com/gkd-kit/gkd/releases)

选择最新版本的apk文件下载，然后安装。

这里以v1.9.3版本为例。

### 2. 设置GKD

安装完成后，打开GKD，按如下步骤设置：

在GDK主页：授权GKD的无障碍服务权限，这里分为两种情况：
1. 如果是已root的设备，点击高级授权的“ROOT授权”按钮。

2. 如果是未root的设备，则可以通过普通授权的“手动授权”按钮，然后在无障碍服务中找到GKD并开启。
   ※ 未root的设备也能通过高级授权的"Shizuku授权"按钮进行授权，但需要安装Shizuku Manager。   

![alt text](gkd-pic1.png)

### 3. 订阅规则

GKD只是一个工具，需要订阅规则才能跳过广告。

GKD本身不提供规则，需要用户自行添加。

GitHub上维护订阅规则仓库的检索页面：[GKD Rules](https://github.com/topics/gkd-subscription)。

选择一个规则仓库，找到订阅链接。

这里以AIsouler_gkd这个规则仓库为例。

其订阅链接为：`https://registry.npmmirror.com/@aisouler/gkd_subscription/latest/files/dist/AIsouler_gkd.json5`

在GKD的“订阅”页面，点击“+”按钮，输入订阅链接，然后点击“确定”。

![alt text](订阅.webp)

### 4. 启用/禁用/更新规则

在GKD的“订阅”页面，找到刚才添加的规则，点击开关即可启用/禁用规则。

在规则列表下拉刷新，可以更新规则。

## 使用

设置完成后，GKD会按照规则自动跳过广告。

如果有需要，可以在GKD的“日志”页面查看跳过的广告信息。

也可以在GKD的“设置”页面调整一些参数，比如是否显示通知、是否显示悬浮窗等。

还可以针对某个应用单独设置规则，比如禁用规则、启用规则等。

很多跳过功能是默认关闭的，可以在单个应用的设置中开启。

更多功能可以自己尝试。

![alt text](应用规则.webp)

## 结束

至此，GKD的安装和设置完成。