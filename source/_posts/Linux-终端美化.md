---
title: Linux 终端美化
abbrlink: b0c9ad69
date: 2023-07-27 13:26:33
tags:
---
用来记录一些终端美化的方法。
平台：CentOS 7.6|Ubuntu 20.04

## 1. 安装Oh My Zsh
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## 2. 安装相关插件
```
# 语法高亮插件:zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# 命令提示插件:zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions


# 主题插件:powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# 修改zsh配置
sed -i 's/^plugins=(git)$/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc
sed -i 's/^ZSH_THEME="robbyrussell"$/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
```

## 3.修改默认shell
ubuntu
```
chsh -s /bin/zsh
```
centos
```
chsh -s /usr/local/bin/zsh
```

## 4.重新进入终端后进行主题的初始配置
>                     Does this look like a diamond (rotated square)?
>                       reference: https://graphemica.com/%E2%97%86
> 
>                                      --->    <---
> 
> (y)  Yes.
> 
> (n)  No.
> 
> (q)  Quit and do nothing.
> 
> Choice [ynq]:
> 
一步一步根据自己的喜好选择即可。

## 5.结束
至此，终端美化完成。

效果如下：
![效果](ubuntu终端.webp)