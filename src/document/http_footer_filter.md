# ngx_http_footer_filter_module

This module appends a string to the end of the response body. The string can contain variables.

```
location / {
    root html;
    footer_types "text/plain" "text/css" "application/x-javascript";
    footer "$host_comment";
}
```

## Directives

Syntax: **footer** format

Default: none

Context: http, server, location

Set a string to append to the end of the response body. <p/>
    The parameter can contain variables. For example:

```
location / {
    footer "&lt;!-- $hostname, $year/$month/$day $hour:$minute:$second, $request --&gt;";
    index index.html;
}
```


Syntax: **footer_types** type1 [type2] [type3]

Default: footer_types text/html

Context: http, server, location

Specify the MIME types the footer will append on.
