---
title: Laravel data_get()方法遇到下标名带.符号的处理
categories: 技术文
tags:
  - Laravel
  - PHP
  - 编程
abbrlink: 71bcdd7f
date: 2024-06-14 14:04:32
---

## data_get()辅助函数介绍

Laravel提供了一个非常方便的辅助函数`data_get()`，用于获取数组或对象的值。

它能够处理数组和对象的多维数据，支持使用`.`符号来访问多维数据的下标。

例如，我们有一个数组：

```php
$data = ['products' => ['desk' => ['price' => 100], 'chair' => ['price' => 50]];
```

我们可以使用`data_get()`函数来获取`$data['products']['desk']['price']`的值：

```php
$price = data_get($data, 'products.desk.price');

// 结果为 100
```

当然，`data_get()`函数还支持默认值，如果指定的下标不存在，可以返回默认值：

```php
$price = data_get($data, 'products.window.price', 0);

// 结果为 0
```

还可以使用`*`通配符来获取数组中的所有值：

```php
$prices = data_get($data, 'products.*.price');

// 结果为 [100, 50]
```

以上为`data_get()`函数的基本用法。

## 下标名带`.`符号的问题

但是，当下标名带`.`符号时，`data_get()`函数会出现问题。

例如，我们有一个数组：

```php
$data = ['products' => ['desk' => ['price' => 100], 'chair' => ['price' => 50], 'window.glass' => ['price' => 200]];
```

我们想要获取`$data['products']['window.glass']['price']`的值：

```php
$price = data_get($data, 'products.window.glass.price');

// 结果为 null
```

这是因为`data_get()`函数会将`.`符号解释为多维数据的分隔符，而不是普通的字符。

## 解决方法

为了解决这个问题，我们可以使用数组形式的下标来访问多维数据。

例如，我们可以使用`data_get()`函数来获取`$data['products']['window.glass']['price']`的值：

```php
$price = data_get($data, ['products', 'window.glass', 'price']);

// 结果为 200
```

这样，我们就可以正确地获取包含`.`符号的下标的值了。

## 总结

`data_get()`函数是一个非常方便的辅助函数，用于获取数组或对象的值。

但是，当下标名带`.`符号时，`data_get()`函数会出现问题。且官方介绍文档中并没有提到这个问题。

为了解决这个问题，我们可以使用数组形式的下标来访问多维数据。