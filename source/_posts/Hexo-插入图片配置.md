---
title: Hexo 插入图片配置
abbrlink: 48adea7c
date: 2024-04-01 16:55:32
tags:
---

Hexo使用Markdown语法编写文章时，
默认插入图片的方式较为麻烦，
需要将图片放在`source`目录下，然后使用绝对路径引用图片。
本文将介绍如何使用插件并配置Hexo插入图片的路径，使得插入图片更加方便。

## 1. 安装插件hexo-renderer-marked
插件hexo-renderer-marked解决了Hexo中Markdown图片路径引用的问题，安装方法如下：

```bash
npm install hexo-renderer-marked --save
```

## 2. 配置Hexo插入图片路径
在Hexo的配置文件`_config.yml`中添加以下配置：

```yaml
post_asset_folder: true
marked:
  prependRoot: true
  postAsset: true
```

这样配置后，使用命令`hexo new "文章标题"`创建新文章时，Hexo会自动在文章目录下创建一个与文章同名的文件夹，用于存放文章中的图片。

## 3. 插入图片示例
### 3.1 创建文章
使用以下命令创建新文章：

```bash
hexo new "测试文章"
```

### 3.2 放入图片
将图片 test.png 放入目录`source/_posts/测试文章`文件夹中。

### 3.3 插入图片
在文章中插入图片时，使用相对路径即可，示例如下：

```markdown
![测试图片](test.png)
```

### 3.4 重新生成静态文件
在配置完成后，需要重新生成静态文件，使用以下命令：

```bash
hexo clean && hexo g
```

### 4. 完成
以上就是在Hexo中插入图片的配置方法，希望对你有所帮助！
