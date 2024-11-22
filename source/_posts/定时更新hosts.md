---
title: 定时更新hosts
categories: 技术文
tags:
  - windows
  - openwrt
  - linux
  - 教程
  - 网络
abbrlink: d9e2c7a1
date: 2024-11-22 16:29:11
---

# 背景

在使用网络时，经常会遇到一些网站无法访问的情况，这时可以尝试修改hosts文件来解决。

hosts文件是一个没有扩展名的文本文件，用于映射主机名和IP地址。通过修改hosts文件，可以实现域名解析，从而更顺畅地访问对应网站。

然而，由于网络环境的变化，hosts文件需要定时更新，以保证访问的准确性。

# 解决

这里提供了一种简单的方法，可以通过定时任务来更新hosts文件。
有不同平台的hosts文件，这里分别介绍Windows、Linux、OpenWrt平台的hosts文件更新方法。

# hosts来源

hosts文件的来源有很多，这里提供一个GitHub上维护的hosts文件地址，可以二选一订阅使用：

```powershell
# GITHUB
https://raw.githubusercontent.com/Clov614/SteamHostSync/main/Hosts

# 国内镜像
https://raw.sevencdn.com/Clov614/SteamHostSync/main/Hosts
```

## Windows（通过switchhosts工具更新hosts文件）

步骤如下：

- 下载SwitchHosts。地址：[SwitchHosts](https://switchhosts.vercel.app/zh)
- 安装SwitchHosts。
- 打开SwitchHosts工具，点击“添加hosts”按钮，选择“远程”选项，输入名称和URL(上述hosts文件地址)，设置“自动刷新”时间，最后点击“确定”。
- 在列表中选择刚才添加的hosts文件，点击右键选中“刷新”即可。
- 可以设置开机自启动SwitchHosts，保证定时更新。

## Linux & OpenWrt（通过定时任务更新hosts文件）

步骤如下：

- 创建一个shell脚本文件，内容如下：

```bash
#!/bin/bash

# hosts文件地址
HOSTS_URL="https://raw.githubusercontent.com/Clov614/SteamHostSync/main/Hosts"

# hosts文件保存路径
HOSTS_PATH="/etc/hosts"

# 查找并删除已有的自定义hosts文件内容，并追加新的hosts文件内容
sed -i "/#github Start/d" $HOSTS_PATH && curl $HOSTS_URL >> $HOSTS_PATH

```

- 保存为`updateHosts.sh`文件，赋予执行权限：

```bash
chmod +x updateHosts.sh
```

- 编辑定时任务，执行`crontab -e`，添加如下内容：

```bash
# 每天凌晨3点更新hosts文件
0 3 * * * /path/to/updateHosts.sh
```

- 保存退出即可。

※ 需要注意权限问题，确保脚本和hosts文件有读写权限。

# 结束

以上就是定时更新hosts文件的方法，希服对你有所帮助。




