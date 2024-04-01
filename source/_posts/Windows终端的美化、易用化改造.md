---
title: Windows终端的美化、易用化改造
abbrlink: a8a8e99
date: 2024-04-01 13:39:13
tags:
---
用来记录Windows平台Terminal终端的美化、易用化改造过程。
目标：以安装Oh My Posh(v3)和主题来美化，加入posh-git来增强终端补全、历史记录等功能，最终实现一个美观、易用的终端。
平台：Windows 10|11

## 1. 安装Windows Terminal
微软商店搜索Windows Terminal，安装即可。

## 2. 使用管理员权限启动Windows Terminal并允许执行脚本
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## 3. 升级PowerShell Core
```powershell
winget install Microsoft.PowerShell
```

## 4. 安装Oh My Posh
```powershell
winget install JanDeDobbeleer.OhMyPosh -s winget
```

## 5. 安装posh-git
```powershell
Install-Module posh-git -Scope CurrentUser -Force
```

## 6. 配置PowerShell
```powershell
# 判断是否存在配置文件，不存在则创建
if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }

# 打开配置文件
notepad $PROFILE
```

在配置文件中添加以下内容：
```powershell
# 导入posh-git
Import-Module posh-git

# 初始化 oh-my-posh 并指定主题，本文使用mojada这个主题，更多主题样式可以使用命令Get-PoshThemes查看
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/mojada.omp.json" | Invoke-Expression

# 设置窗口标题
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete


# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# PSReadLine 是一个内置的模块，可以通过上下键和tab键来快速输入历史记录
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
```

## 7. 手动加载配置
```powershell
. $PROFILE
```

## 8. 安装字体
加载完配置后，如果看到一些图标乱码，
说明系统缺少字体支持，
因为主题需要特定的字体(Nerd Fonts 家族字体)支持，所以需要安装字体。

下面以安装中文友好的【Sarasa Term SC Nerd 字体】为例：
※ 字体介绍：https://github.com/laishulu/Sarasa-Term-SC-Nerd

### 8.1 下载字体包
[下载地址(v1.1.0)](
https://github.com/laishulu/Sarasa-Term-SC-Nerd/releases/download/v1.1.0/sarasa-term-sc-nerd.ttf.7z)

### 8.2 解压字体包并安装
解压后，右键字体文件，选择安装即可。

### 8.3 设置Windows Terminal字体
有2种方式设置字体，任选其一即可：

1. 在Windows Terminal的设置界面中设置：
   - 在Windows Terminal标题栏中点击下拉菜单，选择“设置”
   - 在“设置”界面中找到“配置文件”下的默认值项，点击默认值界面中的“外观”
   - 在“外观”界面中找到“字体”，选择“终端更纱黑体-简 Nerd”
   - 点击右下角的“保存”按钮保存设置


2. 在Windows Terminal的配置文件中设置：
    - 在Windows Terminal标题栏中点击下拉菜单，选择“设置”
    - 点击“打开JSON文件”，打开配置文件
    - 在配置文件中找到“profiles”下的“defaults”项，添加“face”属性，值为“终端更纱黑体-简 Nerd”
      ```json
      {
          "profiles": {
              "defaults": {
                  "face": "终端更纱黑体-简 Nerd"
              }
          }
      }
      ```
    - 保存配置文件

## 9. Windows Terminal的其他设置（可选）
在Windows Terminal的设置界面中，可以设置主题、背景、透明度等
以下是一些个人推荐的设置：

同样是可以在配置文件中设置，也可以在设置界面中设置，这里以配置文件为例：
```json
{
    ......
    // 选中复制
    "copyOnSelect": true,
    ......
    "profiles": 
    {
        "defaults": 
        {
            // 颜色主题
            "colorScheme": "One Half Dark",
            // 光标形状
            "cursorShape": "bar",
            // 字体
            "font": 
            {
                "face": "终端更纱黑体-简 Nerd"
            },
            // 标签图标(我用了github的头像)
            "icon": "图片url",
            // 不透明度(0~100，缺省值100，低于100则有毛玻璃效果，越低越透明)
            "opacity": 80,
            // 标签标题
            "tabTitle": "Shirolin's terminal",
            // 使用亚克力效果
            "useAcrylic": true
        },
        ......
    },
    ......
}
```

## 10. 完成
至此，Windows Terminal的美化、易用化改造完成。
