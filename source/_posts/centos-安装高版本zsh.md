---
title: centos 安装高版本zsh
date: 2023-07-27 11:30:46
tags:
---
Centos自带的yum源中，zsh已长期停留在5.0版本，而目前最新版本已经到了5.9，所以需要手动安装高版本的zsh。

## 1. 下载zsh源码
```
wget https://sourceforge.net/projects/zsh/files/zsh/5.9/zsh-5.9.tar.xz
```

## 2. 解压源码
```
tar -xvf zsh-5.9.tar.xz
```

## 3. 编译安装
```
# 安装编译工具
sudo yum install make automake gcc gcc-c++ kernel-devel
sudo yum install gcc perl-ExtUtils-MakeMaker ncurses-devel -y

# 进入源码目录
cd zsh-5.9

# 执行配置 （默认安装在/usr/local/bin/zsh）
./configure

# 编译和安装
sudo make && sudo make install

# 添加信息到/etc/shells
sudo echo "/usr/local/bin/zsh" >> /etc/shells
```

## 验证
```
# 修改默认shell
chsh -s /usr/local/bin/zsh

# 查看版本
zsh --version
```