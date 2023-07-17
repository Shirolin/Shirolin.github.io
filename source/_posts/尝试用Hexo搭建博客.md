---
title: 尝试用Hexo搭建博客
abbrlink: 52028
---
第一篇博客，用来记录Hexo的搭建过程。

## 1. 安装Hexo
安装Hexo的过程很简单，按照官方教程一步一步来就可以了。

```
npm install -g hexo-cli
```

## 2. 初始化项目

```
hexo init <project-name>
cd <project-name>
npm install
```

## 3. 部署到GitHub Pages

### 3.1 创建仓库

在GitHub上创建一个仓库，仓库名为`<username>.github.io`，其中`<username>`为你的GitHub用户名。

### 3.2 配置ssh密钥

※ 若已配置过ssh密钥，可跳过此步骤。

在本地生成ssh密钥：

```
ssh-keygen -t rsa -C "用户名@example.com"
```

将生成的公钥`~/.ssh/id_rsa.pub`添加到GitHub的SSH Keys中：

https://github.com/settings/keys

### 3.3 配置项目

修改Hexo项目根目录下的`_config.yml`文件，将`deploy`部分修改为：

```
deploy:
  type: git
  repo: git@github.com:<username>/<username>.github.io.git
  branch: gh-pages
```

### 3.4 部署

```
hexo clean && hexo g && hexo d
```

## 4. 配置GitHub Pages

上一步部署成功后，代码已经上传到GitHub上了，但是还不能通过`<username>.github.io`访问，还需要进行一些配置。

此时仓库会出现新的分支`gh-pages`，此分支中的内容会被GitHub Pages服务自动部署。

在GitHub上进入仓库的`Settings`页面，找到`GitHub Pages`部分，将`Source`修改为`gh-pages branch`，点击`Save`按钮。 

一段时间后即可部署完成，此时即可通过`<username>.github.io`访问博客了。

※ 部署的进度可以在仓库的`Actions`页面查看。

## 结束

至此，一个简单的Hexo博客就搭建完成了，接下来就可以开始安装主题、修改配置以及写博客了。