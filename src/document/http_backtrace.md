# ngx_http_backtrace_module

The backtrace module is not enabled by default. You should compile it explicitly:

```
./configure --with-backtrace_module.
```

It can be used to dump backtrace of nginx in case a worker process exits abnormally, e.g. when some signal is received (SIGABR, SIGBUS, SIGFPE, SIGILL, SIGIOT, SIGSEGV). It's quite handy for debugging purpose.

This module requires the backtrace(3) function in glibc. You can't enable it on systems lack of this function (FreeBSD, Darwin).

## Directives

Syntax: **backtrace_log** log_path

Default: backtrace_log error.log

Context: main

Specify the log file name of backtrace.

```
backtrace_log /path/to/backtrace.log
```

Syntax: **backtrace_max_stack_size** size

Default: backtrace_max_stack_size 30

Context: main

Specify the maximum stack depth for backtrace

