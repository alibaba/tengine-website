# Tengine & Nginx性能测试

## 背景

我们在Tengine中实现了SO_REUSEPORT [1]的支持。为了查看其效果，我们进行了一个简单的测试。我们在同一个局域网中部署了一共四台同等配置的服务器，其中一台同时部署Tengine和Nginx，分别监听不同的端口，另外三台部署ab，三个ab同时压测，从总并发100逐步递增到1000，分别压测Tengine和Nginx，访问空gif图片。

三种压测场景：

1.  Tengine打开SO_REUSEPORT，reuse_port on。2.  Nginx默认配置。3.  Nginx优化配置，关闭mutex锁，accept_mutex off。

    ab压测命令：

```
  ab -r -n 10000000 -c 100 http://ip:81/empty.gif
```

## 测试环境
``
```
  Intel(R)Xeon(R)E5-2650v2@2.60GHz 32core
  Intel Corporation 82599EB 10-Gigabit SFI/SFP+ Network Connection
  Red Hat Enterprise Linux Server release 5.7 (Tikanga)
  linux-3.17.2.x86_64
  128GB Memroy
```

## 软件

```
  Nginx/1.6.2
  Tengine/2.1.0 ([http://tengine.taobao.org](http://tengine.taobao.org))
  ApacheBench/2.3
```

## 系统配置

```
  net.ipv4.tcp_mem = 3097431 4129911 6194862
  net.ipv4.tcp_rmem = 4096 87380 6291456
  net.ipv4.tcp_wmem = 4096 65536 4194304
  net.ipv4.tcp_max_tw_buckets = 262144
  net.ipv4.tcp_tw_recycle = 0
  net.ipv4.tcp_tw_reuse  = 1
  net.ipv4.tcp_syncookies  = 1
  net.ipv4.tcp_fin_timeout = 15
  net.ipv4.ip_local_port_range = 1024 65535
  net.ipv4.tcp_max_syn_backlog = 65535
  net.core.somaxconn  = 65535
  net.core.netdev_max_backlog  = 200000
```

```
  Limit                 Soft Limit          Hard Limit            Units
  Max open  files         65535               65535               files
```

## 服务器配置

Nginx/1.6.2 配置文件：

```
  worker_processes auto;
  worker_cpu_affinity
  00000000000000000000000000000001
  00000000000000000000000000000010
  00000000000000000000000000000100
  00000000000000000000000000001000
  00000000000000000000000000010000
  00000000000000000000000000100000
  00000000000000000000000001000000
  00000000000000000000000010000000
  00000000000000000000000100000000
  00000000000000000000001000000000
  00000000000000000000010000000000
  00000000000000000000100000000000
  00000000000000000001000000000000
  00000000000000000010000000000000
  00000000000000000100000000000000
  00000000000000001000000000000000
  00000000000000010000000000000000
  00000000000000100000000000000000
  00000000000001000000000000000000
  00000000000010000000000000000000
  00000000000100000000000000000000
  00000000001000000000000000000000
  00000000010000000000000000000000
  00000000100000000000000000000000
  00000001000000000000000000000000
  00000010000000000000000000000000
  00000100000000000000000000000000
  00001000000000000000000000000000
  00010000000000000000000000000000
  00100000000000000000000000000000
  01000000000000000000000000000000
  10000000000000000000000000000000
  ;
  worker_rlimit_nofile 65535;

  events {
    worker_connections 65535;
    accept_mutex off;
  }

  http {
    include mime.types;
    default_type application/octet-stream;
    access_log logs/access.log;
    keepalive_timeout 0;
    server {
      listen 82 backlog=65535;
      server_name localhost;
      location = /empty.gif {
        empty_gif;
      }
    }
  }
```


Tengine/2.1.0配置文件：

```
  worker_processes auto;
  worker_cpu_affinity auto;
  worker_rlimit_nofile 65535;

  events {
    worker_connections 65535;
    reuse_port on;
  }

  http {
    include mime.types;
    default_type application/octet-stream;
    access_log logs/access.log;
    keepalive_timeout 0;
    server {
      listen 81 backlog=65535;
      server_name localhost;
      location = /empty.gif {
        empty_gif;
      }
    }
  }
```

Tengine和Nginx只有reuse_port和accept_mutex两处配置不同。

      Tengine的worker_cpu_affinity等同于Nginx的相应配置。

## 测试结果

[![status](images/reuseport.png)](images/reuseport.png)

1.  Tengine相比Nginx默认配置，提升200%的处理能力。
2.  Tengine相比Nginx优化配置，提升60%的处理能力。

[1] SO_REUSEPORT套接字属性：[https://lwn.net/Articles/542629/](https://lwn.net/Articles/542629/)
