# ngx_http_log_module

Logging via syslog and pipe is supported in tengine. To use it, you should enable the syslog module first:

./configure --with-syslog

The syslog module can talk directly to syslogd or syslog-ng.

og sampling is also possible in tengine to reduce the count of log records.

## Directives

Syntax: **access_log** log_target [format [ratio=ratio] [buffer=size]] | off

Default: access_log logs/access.log combined ratio=1

Context: http, server, location


Basically, you can use it as same as nginx's 'access_log', and you can write down 'ratio' and 'buffer' after 'format' in any order.
Moreover, there are several enhancements: 

1.  [log_target](#log_target)
2.  [ratio](#ratio)

## log_target

It's compatible with the log_file parameter, while three new log media types are supported:

```
file:/path/to/file
syslog:facility[:[loglevel][:[target_ip:[target_port] | target_udgram_addr][:ident]]]
"pipe:/path/to/exec [param1 param2 ...]"
```

*   'file'
Disk file, which is the same as the nginx's.
*   'syslog'

    Support logging via syslog (UDP).

```
facility := auth | authpriv | cron | daemon | ftp | kern | lpr | mail | mark
          | news | security | syslog | user | uucp | local0 | local1 | local2
          | local3 | local4 | local5 | local6 | local7
loglevel := crit | err | error | emerg | panic | alert | warn | warning
          | info | notice | debug

        The default loglevel is 'info'.

    target_ip[:target_port]:

        The IP address and port of destination server. The default port is 514.
    And UDP is the only supported protocol.

    target_udgram_addr:

        Specify the address of unix_dgram. The default address is "/dev/log".
    UNIX DGRAM is the only supported protocol.

    ident:

        Specify the mark for your application.
```

Here are a few examples:

```
syslog:user:info:127.0.0.1:514:ident
```

Log to 127.0.0.1:514, with facility 'user', level 'info' and ident 'ident'.

    The output is something like this:

```
May  4 15:44:15 local ident[26490]: XXXXXXXX
```

```
syslog:auth:err:10.232.4.28::ident
```

Log to 10.232.4.28:514, with facility 'auth', level 'err' and ident 'ident'.

```
syslog:user:info:/dev/log:ident
```

Log to local Unix dgram(/dev/log), with facility 'user', level 'info' and ident 'ident'.

```
syslog:user::/dev/log:ident
```

Log to local Unix dgram(/dev/log), with facility 'user', default level 'info' and ident 'ident'.

```
syslog:user:info::ident
```

Log to default local Unix dgram(/dev/log), with facility 'user', level 'info' and ident 'ident'.

```
syslog:cron:debug:/dev/log
```

Log to local Unix dgram(/dev/log), with facility 'cron', level 'debug' and default ident 'NGINX'.

    The output is something like this:

```
May  4 15:44:15 local NGINX[26490]: XXXXXXXX
```


```
syslog:user::127.0.0.1

```

Log to 127.0.0.1:514, with facility 'user', default level 'info' and default ident 'NGINX'.

```
syslog:user:debug
```

Log to default local Unix dgram(/dev/log), with facility 'user', level 'debug' and default ident 'NGINX'.

```
syslog:user
```

Log to default local Unix dgram(/dev/log), with facility 'user', default level 'info' and default ident 'NGINX'.

*   'pipe'

Since there may be space characters, the pipe name should be wrapped by quotes.

    The privilege of the pipe is the same the worker process (default user and group are 'nobody').

## ratio

Specify a sampling ratio.

For example, ratio=0.0001, which means tengine will log only once in every 10000 records.

This parameter must be explicitly specified, e.g. ratio=1, if you want to use the 'buffer' parameter.

Syntax: **error_log** log_target [debug | info | notice | warn | error | crit]

Default: error_log logs/error.log

Context: core, http, server, location

Syslog and pipe are also supported, which is similar to 'access_log'.

Syntax: **syslog_retry_interval** seconds

Default: syslog_retry_interval 1800

Context: core

The retry interval in case tengine fails to connect to the remote syslog server. 

Syntax: **log_escape ** on | off | ascii

Default: log_escape on

Context: core, http, server, location

*   'on': escape the special characters (exclude the [reserved or unreserved characters](http://en.wikipedia.org/wiki/Percent-encoding#Types_of_URI_characters)) in your access log.
*   'off': don't escape the special characters.
*   'acsii': only escape the invisible characters in the ACSII table.
