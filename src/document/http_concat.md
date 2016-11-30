# ngx_http_concat_module

The module is inspired by Apache's
[`modconcat`](http://code.google.com/p/modconcat). It follows the same
pattern for enabling the concatenation. It uses two `?`, like this: 

```
http://example.com/??style1.css,style2.css,foo/style3.css
```

If a **third** `?` is present it's treated as **version string**. Like
this:

```
http://example.com/??style1.css,style2.css,foo/style3.css?v=102234
```

## Examples

```
location /static/css/ {
    concat on;
    concat_max_files 20;
}

location /static/js/ {
    concat on;
    concat_max_files 30;
}
```

## Directives

**concat** `on` | `off`

**default:** `concat off`

**context:** `http, server, location`

It enables the concatenation in a given context.

**concat_types** `MIME types`

**default:** `concat_types: text/css application/x-javascript`

**context:** `http, server, location`

Defines the [MIME types](http://en.wikipedia.org/wiki/MIME_type) which
can be concatenated in a given context.

    
**concat_unique** `on` | `off`

**default:** `concat_unique on`

**context:** `http, server, location`

Defines if only files of a given MIME type can concatenated or if
several MIME types can be concatenated. For example if set to `off`
then in a given context you can concatenate Javascript and CSS files.

Note that the default value is `on`, meaning that only files with same
MIME type are concatenated in a given context. So if you have CSS and
JS you cannot do something like this:

```
http://example.com/static/??foo.css,bar/foobaz.js
```

In order to do that you **must** set `concat_unique off`. This applies
to any other type of files that you decide to concatenate by adding
the respective MIME type via `concat_types`,

**concat_max_files** `number`p

**default:** `concat_max_files 10`

**context:** `http, server, location`

Defines the **maximum** number of files that can be concatenated in a
given context. Note that a given URI cannot be bigger than the page
size of your platform. On Linux you can get the page size issuing:

```
getconf PAGESIZE
```

Usually is 4k. So if you try to concatenate a lot of files together in
a given context you might hit this barrier. To overcome that OS
defined limitation you must use
the [`large_client_header_buffers`](http://wiki.nginx.org/NginxHttpCoreModule#large_client_header_buffers)
directive. Set it to the value you need.
