---
title: 使用acme.sh创建并部署SSL证书
categories: 技术文
tags:
  - 运维
  - 网站
  - 证书
  - 教程
abbrlink: 8d64cd0b
date: 2024-07-10 14:22:23
---

## 背景

在部署网站时，通常需要使用SSL证书来保证网站的安全性。

而获取SSL证书的方式有很多，比如通过Let's Encrypt免费获取。

Let's Encrypt提供了很多客户端工具，其中acme.sh是一个非常好用的工具。

acme.sh是一个纯Shell编写的ACME协议客户端，可以用来申请、更新、部署SSL证书。

## 安装acme.sh

```bash
curl https://get.acme.sh | sh -s email=my@example.com
```

或者

```bash
wget -O -  https://get.acme.sh | sh -s email=my@example.com
```

或者

```bash
git clone --depth 1 https://github.com/acmesh-official/acme.sh.git
cd acme.sh
./acme.sh --install -m my@example.com
```

安装过程执行了以下操作：

- 下载acme.sh脚本
- 安装acme.sh到`~/.acme.sh`目录
- 创建alias命令`acme.sh`，指向`~/.acme.sh/acme.sh`
- 创建cron job，用于自动更新证书

## 生成证书

### 选择CA服务器
证书CA服务器一般有两种: Let's Encrypt 或 ZeroSSL。

现版本的acme.sh默认使用ZeroSSL。可根据需求选择CA服务器。

- 使用ZeroSSL
ZeroSSL申请证书之前需要先注册账号，可以通过以下命令注册：

```bash
acme.sh --register-account -m my@example.com
```

- 使用Let's Encrypt
如果需要使用Let's Encrypt，可以通过以下命令把CA设置为Let's Encrypt：

```bash
acme.sh --set-default-ca --server letsencrypt
```

### 申请证书

可根据不同方式申请证书。

#### http 方式(无法申请泛域名证书)
使用HTTP验证方式自动验证域名所有权。
主要有4种方式：webroot、standalone、tls、apache/nginx。

- webroot方式
使用webroot方式，需要指定网站根目录。
acme会自动在网站根目录下创建验证文件，完成验证后删除。

```bash
acme.sh --issue -d example.com -webroot /path/to/webroot
```

- standalone方式(需修改域名解析)
如果服务器没有部署网站，可以使用standalone方式。
这种方式需要将申请证书的域名的A记录指向这台服务器IP。
并且这台服务器需要安装socat。

```bash
# 默认80端口，这里可以指定端口8080
acme.sh --issue -d example.com --standalone --httpport 8080
```

- tls方式(需修改域名解析)
这种方式也需要将申请证书的域名的A记录指向这台服务器IP。
并且这台服务器需要安装socat。

```bash
# 默认443端口，这里可以指定端口8443
acme.sh --issue -d example.com --alpn --tlsport 8443
```

- apache/nginx方式
如果服务器已经部署了apache/nginx，可以使用apache/nginx方式。
acme会自动配置验证文件到apache/nginx的配置文件中。

```bash
# apache方式
acme.sh --issue -d example.com --apache

# nginx方式
acme.sh --issue -d example.com --nginx
```

#### dns 方式(支持泛域名证书)
使用DNS验证方式自动验证域名所有权。
主要有很多DNS服务商的API，可以通过API自动添加TXT记录。
这种方式可以申请泛域名证书。为最佳选择。

根据不同DNS服务商，需要做不同的配置。
各DNS服务商的API请参考：[这里](https://github.com/Neilpang/acme.sh/tree/master/dnsapi)。

※ 这里以腾讯云为例。文档详见[这里](https://github.com/acmesh-official/acme.sh/wiki/dnsapi#2-dnspodcn-option)。

```bash
# 配置腾讯DNSPOD API
export DP_Id="dp_id";
export DP_Key="dp_key";
```

然后执行以下命令：

```bash
./acme.sh --issue --dns dns_dp -d example.com -d cdn.example.com
```

## 证书安装
生成的证书都在~/.acme.sh/目录底下。
可以手动copy文件到对应的目录，也可以使用acme.sh提供的安装命令。

以下是安装到Apache和Nginx的命令。

- 安装证书到Apache
```bash
acme.sh --install-cert -d example.com \
        --cert-file      /path/to/certfile/in/apache/cert.pem  \
        --key-file       /path/to/keyfile/in/apache/key.pem  \
        --fullchain-file /path/to/fullchain/certfile/apache/fullchain.pem \
        --reloadcmd     "service apache2 force-reload"
```

- 安装证书到Nginx
```bash
acme.sh --install-cert -d example.com \
        --key-file       /path/to/keyfile/in/nginx/key.pem  \
        --fullchain-file /path/to/fullchain/nginx/cert.pem \
        --reloadcmd     "service nginx force-reload"
```

--install-cert命令具有多个参数，用于指定不同的目标文件。

此外，你还可以通过指定--reloadcmd参数来设置一个重启服务的命令。(该命令会被记住)
当证书更新完成后，系统会自动调用reloadcmd命令，以确保服务器生效。

需要注意的是，--reloadcmd参数应该是一个适用于重启服务的命令。
你可以根据实际情况进行修改。
如果你正在使用Docker容器化部署，
可以使用类似docker exec webserver nginx -s reload的命令来重启服务。
这样，你就能顺利更新证书并使服务器生效了。

## 证书更新

acme.sh会自动创建一个cron job，用于自动更新证书。

- 查看cron job

```bash
crontab  -l

56 * * * * "/root/.acme.sh"/acme.sh --cron --home "/root/.acme.sh" > /dev/null
```

## 查看已安装的证书

```bash
acme.sh --info -d example.com
```

会显示证书的信息，包括证书的过期时间等。

```ini
DOMAIN_CONF=/root/.acme.sh/example.com/example.com.conf
Le_Domain=example.com
Le_Alt=no
Le_Webroot=dns_ali
Le_PreHook=
Le_PostHook=
Le_RenewHook=
Le_API=https://acme-v02.api.letsencrypt.org/directory
Le_Keylength=
Le_OrderFinalize=https://acme-v02.api.letsencrypt.org/acme/finalize/23xxxx150/781xxxx4310
Le_LinkOrder=https://acme-v02.api.letsencrypt.org/acme/order/233xxx150/781xxxx4310
Le_LinkCert=https://acme-v02.api.letsencrypt.org/acme/cert/04cbd28xxxxxx349ecaea8d07
Le_CertCreateTime=1649358725
Le_CertCreateTimeStr=Thu Apr  7 19:12:05 UTC 2022
Le_NextRenewTimeStr=Mon Jun  6 19:12:05 UTC 2022
Le_NextRenewTime=1654456325
Le_RealCertPath=
Le_RealCACertPath=
Le_RealKeyPath=/etc/acme/example.com/privkey.pem
Le_ReloadCmd=service nginx force-reload
Le_RealFullChainPath=/etc/acme/example.com/chain.pem
```

## 更新acme.sh

升级 acme.sh 到最新版：
```bash
acme.sh --upgrade
```

开启自动升级：
```bash
acme.sh --upgrade --auto-upgrade
```

关闭自动升级：
```bash
acme.sh --upgrade --auto-upgrade 0
```

## 结束

至此，你已经成功使用acme.sh创建并部署SSL证书。

