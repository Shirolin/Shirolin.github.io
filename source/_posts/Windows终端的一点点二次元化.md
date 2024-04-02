---
title: Windows终端的一点点二次元化
abbrlink: 5bc9bf5
date: 2024-04-01 17:49:28
categories: 技术文
tags: 
- Windows
- 美化
---

在此前的文章中，我们已经进行了Windows Terminal终端的美化、易用化改造，
现在我们来实现一点点二次元化改造。

前情提要：
- [Windows Terminal终端的美化](/posts/a8a8e99/)

## 1. 增加背景图片
在Windows Terminal中增加背景图片，可以让终端更加个性化。

- 在Windows Terminal标题栏中点击下拉菜单，选择“设置”
   - 在“设置”界面中找到“配置文件”下的默认值项，点击默认值界面中的“外观”
   - 点击“背景图像”下的“背景图片路径”，选择一张图片即可(可以是动图)
   - 可以调整“拉伸”、“对齐模式”和“不透明度”，建议调整到合适的位置和透明度，尽量不影响终端的使用

效果如下：
![效果](终端背景.gif)

## 2. 启动时显示表情
在Windows Terminal启动时显示表情，可以让终端更加有趣。

### 2.1 创建一个专门用来显示表情的脚本
在Windows Terminal中显示表情，需要借助于PowerShell脚本，我们可以创建一个专门用来显示表情的脚本。
新建一个`showEmoji.ps1`文件，内容如下：

```powershell
$isRandom = 1 # 随机开关 1:打开 0:关闭
# 显示星期
$week = get-date -format "yyyy-MM-dd HH:mm dddd"
Write-Output $week
# 显示字符画
if ($isRandom) {
    # 随机显示
    $imgNum = Get-Random -Minimum 1 -Maximum 7
} else {
    # 按照星期显示
    $imgNum = (Get-Date).DayOfWeek
}
switch ($imgNum) {
    { $_ -eq 1 } {
        # 周一
        Write-Output "吾輩はやれば出来る子💪である。 "
        Write-Output "        ∩∩"
        Write-Output "      （´･ω･）"
        Write-Output "     ＿|  ⊃／(＿＿＿"
        Write-Output "   ／   └-(＿＿＿_／"
        Write-Output "   ￣￣￣￣￣￣￣"
        Write-Output "  やる気はまだない😴"
        Write-Output ""
        Write-Output "     ⊂⌒／ヽ-、＿_"
        Write-Output "  ／⊂_/＿＿＿＿ ／"
        Write-Output "  ￣￣￣￣￣￣￣"
    }
    { $_ -eq 2 } {
        # 周二
        Write-Output "💡なるほと、バッグ🐞の解決方法分かる"
        Write-Output "〃∩ ∧＿∧ "
        Write-Output "⊂⌒(  ･ω･) "
        Write-Output "  ＼_っ⌒/⌒c "
        Write-Output "      ⌒ ⌒"
    }
    { $_ -eq 3 } {
        # 周三
        Write-Output "少し休んで🍵お茶しましょう"
        Write-Output "         （⌒)"
        Write-Output "    ∧__∧ （~)"
        Write-Output "  （｡･ω･｡)( )"
        Write-Output "  {￣￣￣￣}"
        Write-Output "  {~￣お_＿} ぬるい"
        Write-Output "  {~￣茶_＿}"
        Write-Output "  {＿＿＿＿}"
        Write-Output "     ┗━━┛"
    }
    { $_ -eq 4 } {
        # 周四
        Write-Output "まぁ、座れや"
        Write-Output "           ∧,,_∧"
        Write-Output "        ⊂ ( ･ω･ )つ-"
        Write-Output "      ／／/     /::/"
        Write-Output "      |::|/⊂ヽノ|::|」"
        Write-Output "   ／￣￣旦￣￣￣／|"
        Write-Output " ／＿＿＿＿＿＿／  |"
        Write-Output " |-------------| ／"
    }
    { $_ -eq 5 } {
        # 周五
        Write-Output "土曜日未だ来たかい?"
        Write-Output "                        ∧∧  ∩"
        Write-Output "                      ( ﾟ∀ﾟ)/  ｷﾀ━━━━━━(ﾟ∀ﾟ)━━━━━━!!!!"
        Write-Output "                     ⊂     ﾉ"
        Write-Output "                      (つ ﾉ"
        Write-Output "    o                  (ノ"
        Write-Output "      ＼            ☆"
        Write-Output "                      |           o"
        Write-Output "                (⌒ ⌒ヽ      /         ☆"
        Write-Output "    ＼    （´⌒    ⌒    ⌒ヾ      ／"
        Write-Output "       （'⌒  ;  ⌒      ::⌒    ）"
        Write-Output "      （´          ）          :::  ）  ／"
        Write-Output "☆─  （´⌒;:        ::⌒`）  :;    ）"
        
    }
    Default {
        Write-Output "🎶魔法使い希落凛🧙、行きます🎶"
        Write-Output "  ∧＿∧ "
        Write-Output "（｡･ω･｡)つ━☆・*。"
        Write-Output "⊂     ノ       ・゜+."
        Write-Output " しーＪ      °。+ *´¨)"
        Write-Output "                  .· ´¸.·*´¨) ¸.·*¨)"
        Write-Output "                    (¸.·´ (¸.·'* ☆"
    }
}
```

把`showEmoji.ps1`文件放到一个固定的位置，例如$PROFILE所在目录下。
打开PowerShell，输入`$PROFILE`，可以看到PowerShell的配置文件所在的路径。

### 2.2 设置Windows Terminal启动时运行脚本
编辑$PROFILE配置文件，添加如下内容：

```powershell
$EMOJI_FILE_NAME = "showEmoji.ps1"
$PROFILE_PATH = Split-Path $PROFILE
$EMOJI_FILE_PATH = $PROFILE_PATH + "\" + $EMOJI_FILE_NAME
if (Test-Path $EMOJI_FILE_PATH)  {
    . $EMOJI_FILE_PATH
}

```

效果如下：
![效果](emoji.webp)
