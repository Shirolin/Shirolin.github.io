---
title: Laravel中Redis的配置及使用
abbrlink: '29318e15'
date: 2024-12-27 00:33:23
categories: 技术文
tags:
  - laravel
  - redis
  - cache
  - session
  - queue
  - 教程
  - 开发
---

# 背景

Laravel的缓存系统提供了多种驱动，其中Redis是最常用的一种。
Session、缓存、队列等都可以使用Redis来存储。

# 在Laravel中配置Redis

安装Redis扩展

```shell
composer require predis/predis
```

在`.env`文件中配置Redis

```shell
REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379
```

在`config/database.php`文件中配置Redis

```php
    'redis' => [
        'client' => 'predis',
        'default' => [
            'host' => env('REDIS_HOST', '127.0.0.1'),
            'password' => env('REDIS_PASSWORD', null),
            'port' => env('REDIS_PORT', 6379),
            'database' => 0,
        ],
    ],
```

在`.env`文件中，将`CACHE_DRIVER`、`SESSION_DRIVER`和`QUEUE_CONNECTION`的值设置为`redis`

```shell
CACHE_DRIVER=redis
SESSION_DRIVER=redis
QUEUE_CONNECTION=redis
```

# 使用Redis

这样配置好之后，在Laravel中使用Cache、Session、Queue等功能时，就会自动使用Redis作为存储。

如果需要直接使用Redis，可以通过`Redis`门面来操作Redis。

```php
use Illuminate\Support\Facades\Redis;

// 设置值
Redis::set('name', 'Taylor');

// 获取值
$name = Redis::get('name');
```

# 结束

这样就完成了Laravel中Redis的配置及使用。
