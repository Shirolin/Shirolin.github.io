---
title: Laravel 日志增加SQL查询记录
categories: 技术文
tags:
  - laravel
  - 日志
  - 教程
  - 开发
abbrlink: 61e38c3c
date: 2024-12-27 20:19:28
---

# 背景

Laravel 默认的日志记录只会记录日志信息，不会记录 SQL 查询记录，
只有在报错的时候才会记录 SQL 查询记录，这对于开发和调试来说是不够的。

这里我们可以通过 Laravel 的事件系统来监听 SQL 查询事件，然后将 SQL 查询记录到日志中。

# 方法

## 创建监听服务提供者

创建app\Providers\DataBaseQueryServiceProvider.php

内容如下：

```php
<?php

namespace App\Providers;

use Carbon\Carbon;
use DateTime;
use Illuminate\Database\Events\TransactionBeginning;
use Illuminate\Database\Events\TransactionCommitted;
use Illuminate\Database\Events\TransactionRolledBack;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\ServiceProvider;

class DataBaseQueryServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->listenDB();

        Event::listen(TransactionBeginning::class, function (TransactionBeginning $event): void {
            Log::debug('START TRANSACTION');
        });

        Event::listen(TransactionCommitted::class, function (TransactionCommitted $event): void {
            Log::debug('COMMIT');
        });

        Event::listen(TransactionRolledBack::class, function (TransactionRolledBack $event): void {
            Log::debug('ROLLBACK');
        });
    }

    private function listenDB()
    {
        DB::listen(function ($query): void {
            $sql = $query->sql;

            foreach ($query->bindings as $binding) {
                if (is_string($binding)) {
                    $binding = "'{$binding}'";
                } elseif (is_bool($binding)) {
                    $binding = $binding ? '1' : '0';
                } elseif (is_int($binding)) {
                    $binding = (string) $binding;
                } elseif ($binding === null) {
                    $binding = 'NULL';
                } elseif ($binding instanceof Carbon) {
                    $binding = "'{$binding->toDateTimeString()}'";
                } elseif ($binding instanceof DateTime) {
                    $binding = "'{$binding->format('Y-m-d H:i:s')}'";
                }

                $sql = preg_replace('/\\?/', $binding, $sql, 1);
            }

            $tracesText = (env('APP_ENV') == 'local') ? $this->getTrace() : '';

            Log::debug('SQL', ['time' => "{$query->time} ms", 'sql' => $sql, 'Executed at' => $tracesText]);
        });
    }

    /**
     * 获取调用栈
     *
     * @return string
     * @author Shirolin
     * @since  2023-05-29
     */
    private function getTrace()
    {
        $traces = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS, 30);
        $tracesText = '';
        $num = 0;
        foreach ($traces as $trace) {
            // 过滤文件名中包含'DataBaseQueryServiceProvider'的文件
            if (isset($trace['file']) && strpos($trace['file'], 'DataBaseQueryServiceProvider') !== false) {
                continue;
            }
            // 过滤文件名中包含'Illuminate'的文件
            if (isset($trace['file']) && strpos($trace['file'], 'Illuminate') !== false) {
                continue;
            }

            if (isset($trace['file']) && isset($trace['line'])) {
                $tracesText .= "\n[{$num}]" . $trace['file'] . ':' . $trace['line'];
            }
            $num++;
        }

        return $tracesText;
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}

```

## 注册服务提供者

在config/app.php中注册服务提供者

```php
'providers' => [
    // ...
    App\Providers\DataBaseQueryServiceProvider::class,
    // ...
];
```

# 结束

这样配置好之后，在Laravel中执行SQL查询时，就会自动记录到日志中。



