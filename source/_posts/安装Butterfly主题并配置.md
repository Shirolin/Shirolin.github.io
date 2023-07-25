---
title: 安装Butterfly主题并配置
abbrlink: 4f89be81
date: 2023-07-25 16:15:45
tags:
---
Hexo有非常丰富的主题可供选择：[官方主题页](https://hexo.io/themes/)。
这边选择了一个个人比较喜欢的主题：[Butterfly](https://github.com/jerryc127/hexo-theme-butterfly)。

## 1. 安装主题
安装主题主要有两种方式：npm安装和git安装。
由于实践下来npm的安装方式配置文件会出现一些问题，所以这边选择git安装。

### 1.1 下载主题
在Hexo项目根目录下执行：
```
git clone -b master https://github.com/jerryc127/hexo-theme-butterfly.git themes/butterfly
```

### 1.2 安装依赖
该主题需要安装pug 以及 stylus 的渲染器，
在Hexo项目根目录下执行：
```
npm install hexo-renderer-pug hexo-renderer-stylus --save
```

### 1.2 应用主题
修改Hexo项目根目录下的`_config.yml`文件，将`theme`修改为：
```
theme: butterfly
```

## 2. 配置主题
主题的配置文件在`themes/butterfly/_config.yml`中。(此文件请勿删除)

由于git拉取代码的升级方式会覆盖该配置文件，为了不影响升级，可以将配置项复制到Hexo项目根目录下的`_config.butterfly.yml`中。

Hexo会自动合并根目录下的`_config.butterfly.yml`和主题目录下的`_config.yml`，所以可以只在根目录下的`_config.butterfly.yml`中修改配置项即可。(同一配置项，根目录下的优先级高于主题目录下的)

### 2.1 具体配置项
具体配置项请参考：[Butterfly 安裝文檔(三) 主題配置-1](https://butterfly.js.org/posts/4aa8abbe/)


## 结束

至此，Hexo的主题安装和配置就完成了。




