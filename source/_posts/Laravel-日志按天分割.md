---
title: Laravel 日志按天分割
abbrlink: 58b1f99
date: 2024-12-27 19:10:28
categories: 技术文
tags:
  - laravel
  - 日志
  - 教程
  - 开发
---

# 背景

在使用 Laravel 开发的过程中，我们经常会遇到日志文件过大的问题，这时候我们就需要对日志文件进行按天分割。

# 配置

## Laravel 5.6 以上版本
Laravel 5.6 以上版本的日志配置文件在 `config/logging.php` 中，我们可以在这个文件中配置日志的存储方式。

```php
'channels' => [
    'stack' => [
        'driver' => 'stack',
        'channels' => ['daily'],
    ],

    'daily' => [
        'driver' => 'daily',
        'path' => storage_path('logs/laravel.log'),
        'level' => 'debug',
        'days' => 7,
    ],
],
```

在这个配置文件中，我们可以看到 `daily` 频道的配置，其中 `path` 是日志文件的存储路径，`days` 是日志文件的保留天数。

我们可以根据自己的需求修改这个配置，比如将 `days` 修改为 30，这样日志文件就会保留 30 天。

.env 文件中添加 `LOG_CHANNEL` 配置项，比如：

```shell
LOG_CHANNEL=daily
```

## Laravel 5.6 以下版本
Laravel 5.6 以下版本的日志配置文件在 `config/app.php` 中，我们可以在这个文件中配置日志的存储方式。


```php
// 原本的配置，可读取 .env 文件中的配置
'log' => env('APP_LOG', 'single'),
// 新增的配置，用于配置日志文件保留天数
'log_max_files' => env('APP_LOG_MAX_FILES', 30),
```

然后在 `.env` 文件中添加 `APP_LOG` 和 `APP_LOG_MAX_FILES` 配置项，比如：

```shell
APP_LOG=daily
APP_LOG_MAX_FILES=30
```

这样配置之后，Laravel 就会按天分割日志文件，并且保留 30 天的日志文件。

# 总结

通过以上配置，我们可以很方便的对 Laravel 的日志文件进行按天分割，这样可以避免日志文件过大的问题。


