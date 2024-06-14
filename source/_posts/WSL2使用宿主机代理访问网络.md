---
title: WSL2使用宿主机代理访问网络
categories: 技术文
tags:
  - WSL
  - 教程
  - 代理
abbrlink: e41dabd5
date: 2024-06-14 10:33:41
---

系统版本：Windows 11 22H2
※ 该方法在更低版本的Windows系统上未经测试，可能无法生效。

# 背景
WSL2默认是无法访问宿主机的代理的，如果需要使用代理访问网络，需要进行一些配置。

# 问题
之前通过在WSL2中设置代理的方法，如下：
```bash
export http_proxy=http://${宿主机IP}:${端口}
export https_proxy=http://${宿主机IP}:${端口}
export all_proxy=http://${宿主机IP}:${端口}
```

然而这种方法不一定有效，这时可以尝试以下方法。

# 方法

在 C:\Users\<your_user>\.wslconfig 中添加以下内容(如果不存在可以手动创建)：

```ini
[wsl2]
networkingMode = mirrored
autoProxy = true
```

配置说明：

- `networkingMode = mirrored`：启用镜像网络模式。
- `autoProxy = true`：强制 WSL 使用 Windows 的 HTTP 代理信息。

然后重启WSL2即可。

重启命令：
```powershell
wsl --shutdown
wsl
```

※ 参考：[WSL2 高级设置配置](https://learn.microsoft.com/zh-cn/windows/wsl/wsl-config)

# 结束
这样，在WSL2中就可以使用宿主机的代理访问网络了。


