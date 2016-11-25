## Command line options

#### the '-m' option

Show all compiled-in modules then exit. Tengine supports DSO modules since 1.4.0. The tag 'static' means static module. The tag 'shared' means dynamic shared module which is also attached with major and minor version of this modules. e.g:

```
$ nginx -m 

Tengine version: Tengine/1.4.1 (nginx/1.2.3)

loaded modules:

    ngx_core_module (static)

    ngx_errlog_module (static)

    ngx_conf_module (static)

    ngx_events_module (static)

    ngx_event_core_module (static)

    ngx_epoll_module (static)

    ngx_http_module (static)

    ngx_http_core_module (static)

    ngx_http_log_module (static)

    ngx_http_upstream_module (static)

    ngx_http_static_module (static)

    ngx_http_index_module (static)

    ngx_http_rewrite_module (static)

    ngx_http_proxy_module (static)

    ngx_http_memcached_module (shared, 1.1)

    ngx_http_write_filter_module (static)

    ngx_http_header_filter_module (static)

    ngx_http_chunked_filter_module (static)

    ngx_http_range_header_filter_module (static)

    ngx_http_gzip_filter_module (static)

    ngx_http_postpone_filter_module (static)

    ngx_http_headers_filter_module (static)

    ngx_http_copy_filter_module (static)

    ngx_http_range_body_filter_module (static)

    ngx_http_not_modified_filter_module (static)

```

#### the '-l' option

Show all supported directives then exit. e.g:

```
$ nginx -l 

Tengine version: Tengine/1.4.1 (nginx/1.2.3)

all available directives:

ngx_core_module:

daemon

master_process

timer_resolution

pid

lock_file

worker_processes

debug_points

user

worker_priority

worker_cpu_affinity

worker_rlimit_nofile

worker_rlimit_core

worker_rlimit_sigpending

working_directory

env

ngx_dso_module:

dso

ngx_http_memcached_module (shared):

dso

memcached_pass

memcached_bind

memcached_connect_timeout

memcached_send_timeout

memcached_buffer_size

memcached_read_timeout

memcached_next_upstream

[snip]
```

#### the '-d' option

Dump the contents of the configuration file, including the contents of 'include'd files. e.g:

```
$ nginx -d 

# contents of file "/home/shudu/nginx/sandbox/conf/nginx.conf":

user  shudu;

worker_processes  1;

worker_rlimit_core 1000M;

error_log  logs/error.log  debug;

#pid        logs/nginx.pid;

events {

worker_connections  1024;

}

http {

include       mime.types;

default_type  application/octet-stream;

access_log  logs/access.log combined;

[snip]

```
