#   Dynamic Module Loading Support (**DSO**)

## Description

*   You can choose which functionalities to include by selecting a set of modules. A module will be compiled as a Dynamic Shared Object (**DSO**) that exists from the main tengine binary. So you don't have to recompile tengine when you want to add or enable a functionality to it.

*   If you want to enable a standard module, you can enable it via configure's option while compiling tengine, for instance, --with-http_example_module or --with-http_example_module=shared. Run _./configure --help_ for more details.

*   The maximum of dynamically loaded modules is limited to 128.

*   For now, only HTTP modules can be dynamically loaded.

*   This feature is tested only on Linux/FreeBSD/MacOS.

## Example

```
worker_processes  1;

dso {
     load ngx_http_lua_module.so;
     load ngx_http_memcached_module.so;
}

events {
   worker_connections  1024;
}
```
    

## Directives


**Syntax**: _path path_

**Default**: _NGX_PREFIX/modules_

**Context**: _dso_

This directive specifies the default path (prefix) of DSO modules.

Example:

```
path /home/dso/module;
```

Sets the default path to _/home/dso/module_.

**Syntax**: _load [module_name] [module_path]_

**Default**: _none_

**Context**: _dso_

The **load** directive loads the shared object file and enables the module. _module_name_ is the name of the DSO module, and _module_path_ is the path of the DSO module.

The order in which the module is searched is as follows:

*   the absolute path.
*   relative path to the prefix specified by the 'path' directive.
*   relative path to the default path (NGX_PREFIX/modules or path which is specified by the '--dso-path' configure option).

Example:

```
load ngx_http_empty_gif_module  ngx_http_empty_gif_module.so;
load ngx_http_test_module;
load ngx_http_test2_module.so;
```

It will load the ngx_http_empty_gif_module from ngx_http_empty_gif_module.so, ngx_http_test_module and ngx_http_test2_module from ngx_http_test_module.so and ngx_http_test2_module.so.

**Syntax**: _module_stub module_name_

**Default**: _none_

**Context**: _dso_

This directive can insert a module into nginx's module array in order (see conf/module_stubs for more details). Note it will change the module runtime order. This directive does not need to be used in most cases. Don't use it or edit the _conf/module_stubs_ file unless you know what you are doing.

Example:

```
module_stub ngx_core_module;
module_stub ngx_errlog_module;
module_stub ngx_conf_module;
module_stub ngx_events_module;
module_stub ngx_event_core_module;
module_stub ngx_epoll_module;
module_stub ngx_openssl_module;
module_stub ngx_http_module;
module_stub ngx_http_core_module;
.......................
module_stub ngx_http_addition_filter_module;
module_stub ngx_http_my_filter_module;
```

It will place ngx_http_my_filter_module before ngx_http_addition_filter_module.

**Syntax**: _include file_name_

**Default**: _none_

**Context**: _dso_

Specifies a file which contains the module stubs (via the **module_stub** directive).

Example:

```
include module_stubs;
```

It will load conf/module_stubs and define the loading order of the modules (via the **module_stub** directive).

## How to compile a module

If you want to enable a standard module after you compiled and installed tengine, you can take these steps as following.

*   enable the standard module you wanted in shared mode, for example:
    $ ./configure --with-http_sub_module=shared
*   compile it:
    $ make
*   install the shared object (*.so):
    $ make dso_install

It will copy the *.so files to the destination, or you can copy the files you want (in objs/modules) manually to the modules directory.

You can use the **dso_tool** located in the directory of nginx binary to compile a third party module.

Example:

```
./dso_tool --add-module=/home/dso/lua-nginx-module
```

It will compile the ngx_lua module into a shared object, and install it to the default module path. You can specify the destination directory you want install to by the **--dst** option.
