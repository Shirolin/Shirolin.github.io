# Shirolin.github.io 🌐

Shirolin 的个人技术博客与知识库源码仓库。基于 **Hexo** 静态博客框架与 **Butterfly** 主题构建，自动部署至 GitHub Pages。

## 🛠️ 技术栈

- **框架**: Hexo 8.x
- **主题**: Butterfly 5.x
- **格式化与代码检查**: Prettier, ESLint, TypeScript
- **部署目标**: GitHub Pages (`https://shirolin.github.io`)

## 🚀 常用命令

### 本地开发

```bash
# 安装依赖
npm install

# 启动本地实时预览服务 (默认端口: http://localhost:4000)
npm run server
```

### 构建与部署

```bash
# 清理缓存并生成静态文件
npm run clean
npm run generate

# 完整构建 (执行格式检查、ESLint、类型检查并生成静态站点)
npm run build

# 部署至 GitHub Pages
npm run deploy
```

## 📂 目录结构简析

- `source/`: 博客文章 Markdown 源文件与页面资源
- `themes/`: Butterfly 主题扩展与自定义配置
- `_config.yml`: Hexo 基础站点配置
- `_config.butterfly.yml`: Butterfly 主题定制配置文件
