---
title: 隐藏docker命令debug提示信息
categories: 技术文
tags:
  - docker
  - 疑难杂症
  - 教程
abbrlink: 7a97a78f
date: 2024-08-06 11:25:07
---

## 背景

在使用docker命令时，有时候会遇到一些debug提示信息，比如：

```bash
What's next?
  Try Docker Debug for seamless, persistent debugging tools in any container or image → docker debug 05d214e2c470
  Learn more at https://docs.docker.com/go/debug-cli
```

这些提示信息可能会干扰我们的操作，如果不需要这些提示信息，可以通过设置环境变量来隐藏。

## 隐藏提示信息

```bash
export DOCKER_CLI_HINTS=false
```

可在脚本中添加该命令，或者将其添加到`~/.bashrc`或`~/.bash_profile`中，使其永久生效。

## 结束

以上就是隐藏docker命令debug提示信息的方法，希望对你有所帮助。