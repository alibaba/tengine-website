# Tengine & Nginx Benchmark


## Background

We've implemented the support of SO_REUSEPORT [1] in Tengine. To see the performance improvement,
we did a very simple benchmark with four Linux boxes. Three boxes were employed as clients, and the other
one as a web server with Tengine listening on port 81 and Nginx listening on port 82. All the hardware
specifications of the boxes were the same.

We ran three test cases with concurrency from 100 to 1000. The test cases were:

*   Tengine with SO_REUSEPORT enabled (reuse_port on).
*   Nginx with accept lock (accept_mutex on).
*   Nginx without accept lock (accept_mutex off).

    The benchmark software we used was ApacheBench. Here's a command line example:

```
ab -r -n 10000000 -c 100 http://ip:81/empty.gif
```

## Hardware & Software

```
CPU: Intel(R)Xeon(R)E5-2650v2@2.60GHz 32core
Memory: 128GB
NIC: Intel Corporation 82599EB 10-Gigabit SFI/SFP+ Network Connection

Kernel: Linux-3.17.2.x86_64
Tengine-2.1.0
Nginx-1.6.2
ApacheBench-2.3
```


## System configuration

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

## Web server configuration

Nginx configuration file:

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

Tengine configuration file:

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

As you can see, the configuration files of Tengine and Nginx are generally the same except the 'reuse_port',
'worker_cpu_affinity', and 'accept_mutex' directives. Also note that
it is more convenient to set CPU affinity in Tengine as it supports 'worker_cpu_affinity auto'.

## Conclusion

[![status](images/reuseport.png)](images/reuseport.png)

1.  Tengine had a performance improvement of 200% compared to Nginx with accept lock, which is the
default setting.
2.  Tengine had a performance improvement of 60% compared to Nginx without accept lock.

[1] The SO_REUSEPORT socket option: [https://lwn.net/Articles/542629/](https://lwn.net/Articles/542629/)
