---
title: Laravel开发必备：laravel-ide-helper
abbrlink: ad2e0fa7
date: 2024-12-26 17:18:42
categories: 技术文
tags:
  - laravel
  - ide
  - 教程
  - 开发
---

# 背景

在使用 Laravel 开发的过程中，我们经常会遇到 IDE 无法智能提示 Laravel 框架的方法和属性，
这时候我们就需要使用 Laravel-ide-helper 这个工具来帮助我们解决这个问题。

# 安装
由于 Laravel-ide-helper 是一个 Composer 包，所以我们可以很方便的通过 Composer 安装它。

```bash
# 直接安装
composer require --dev barryvdh/laravel-ide-helper

# 仅在开发系统中安装提示包 加上 --dev
composer require barryvdh/laravel-ide-helper --dev
```

※ laravel-ide-helper对composer版本和Laravel 5.5版本有要求，如果安装失败，请根据提示修改composer和Laravel版本，或者安装指定版本的laravel-ide-helper。

# 配置

如果你使用的是 Laravel 5.5 以上的版本，那么你可以跳过这一步。

在 Laravel 5.5 以下的版本中，我们需要手动添加 ServiceProvider 到 `config/app.php` 文件中。

```php
'providers' => [
    // ...
    Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider::class,
    // ...
];
```

如果你想要只在非生产环境中使用 Laravel-ide-helper，那么你可以在 `app/Providers/AppServiceProvider.php` 中添加如下代码：

```php
public function register()
{
    if ($this->app->environment() !== 'production') {
        $this->app->register(\Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider::class);
    }
}
```

导出配置文件

```bash
php artisan vendor:publish --provider="Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider" --tag=config
```

会在config目录下生成一个ide-helper.php文件。

修改ide-helper.php配置文件让 Laravel-ide-helper 能够为链式操作生成注释：

```php
# ide-helper.php
# 修改前
'include_fluent' => false,
# 修改后
'include_fluent' => true,
```

# 使用

安装完成后，主要下面有四种方式来使用 Laravel-ide-helper：

```bash
# 生成 ide-helper 文件
# 如果已存在bootstrap/compiled.php文件，需要先运行php artisan clear-compiled 来删除
php artisan ide-helper:generate

# 生成模型注释(会提示是直接写入模型还是生成到文件，建议直接写入模型)
php artisan ide-helper:models

# 生成 PhpStorm meta 文件(如果使用其他 IDE，可以不用执行)
php artisan ide-helper:meta
```

# 结语

Laravel-ide-helper 是一个非常好用的工具，它可以帮助我们解决 IDE 无法智能提示 Laravel 框架的方法和属性的问题，
让我们的开发效率更高，如果你还没有使用过 Laravel-ide-helper，那么我强烈建议你尝试一下。

