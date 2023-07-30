---
title: Linux安装nvm与node.js
abbrlink: ed80609d
date: 2023-07-30 15:45:26
tags:
---
记录一下安装nvm的过程。
平台：CentOS7 | Ubuntu 20.04

## 1. 安装nvm
curl方式：
```
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
```

wget方式：

```
wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
```

git clone方式：

```
git clone git://github.com/creationix/nvm.git ~/nvm
```


## 2. 配置环境变量
默认安装在`~/.nvm`目录下，并已经配置好环境变量，如果没有配置，需要手动配置环境变量。

根据自己的shell类型，修改对应的配置文件，添加如下内容：

bash：
```
vi ~/.bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

```

zsh：
```
vi ~/.zshrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
```

## 3. 验证
```
nvm --version
```

## 4. 安装node.js
```
nvm install node # 安装最新版本

nvm install 12.18.3 # 安装指定版本

nvm install node --lts # 安装最新LTS版本
```

## 5. 切换node版本
```
nvm use node # 切换到最新版本

nvm use 12.18.3 # 切换到指定版本
```

## 6. 查看已安装的node版本
```
nvm ls
```

## 7. 卸载node
```
nvm uninstall 12.18.3
```

## 8. 查看可用的node版本
```
nvm ls-remote
```

## 9. 查看当前node版本
```
node -v
```

## 10. 查看当前npm版本
```
npm -v
```

## 11. 查看当前nvm版本
```
nvm --version
```

## 结束
以上。

