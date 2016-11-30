# ngx_http_headers_module

This is the enhanced version of nginx's http_headers module. A new 'expires_by_types' directive is brought in to allow setting the expiration times according to different MIME types.

## Examples

```
expires_by_types       24h text/html;
expires_by_types       modified +24h text/xml;
expires_by_types       @15h30m text/xml;
expires_by_types       0 text/xml;
expires_by_types       -1 text/xml;
expires_by_types       epoch text/xml;
```

## Directives

Syntax: expires_by_types [[modified] time | @time-of-day | epoch | max | off] content-type1 [content-type2] ...

Default: none

Context: http, server, location

Specify an expiration time according to some MIME types.<p/>
The format of an expiration time is the same as nginx's 'expires'. You can add one or more MIME types after the time parameter. 

Note if there are both 'expires' and 'expires_by_types' directives being set:

*   If they are in the same block level, the exactly matched MIME type and its expiration time of 'expires_by_type' will be preferred. Otherwise, the expiration time of 'expires' will be honored.*   If 'expires' and 'expires_by_types' are not set, the expiration setting will be inherited from the parent level.
*   If 'expires off' is specified in the current level, all of the 'expires' and 'expires_by_types' settings will be turned off.
*   If 'expires off' is specified in the parent level but not the current block, the setting of 'expires_by_types' in the current level will be honored.

For example:

```
location /url {
    expires                10s;
    expires_by_types       24s text/html;
}
```

The expiration time of the 'text/html' MIME type is 24 seconds for the '/url' location. It's 10 seconds for the rest.

```
expires                    10s;
expires_by_types           24s text/html;

location /url {
    expires_by_types       20s text/rss;
}
```

The expiration time of the 'text/rss' MIME type is 20 seconds for the '/url' location; The expiration time is 24 seconds for the 'text/html' MIME type and 10 seconds for the rest. Because the the setting in the parent level is overriden by the 'expires_by_types' in the '/url' location, while other 'expires' settings are inherited from the parent level.

```
expires                    10s;
expires_by_types           24s text/html;

location /url {
    expires off;
    expires_by_types       20s text/rss;
}
```

The expiration time is not specified in the '/url' location. See Rule 3 above.

```
expires off;
expires_by_types           24s text/html;

location /url {
    expires_by_types       20s text/rss;
}
```

The expiration time for the 'text/html' MIME type is 20 seconds in the '/url' location. See Rule 4 above.
