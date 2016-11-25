## Introduction
Tengine is a web server originated by [Taobao](http://en.wikipedia.org/wiki/Taobao), the largest e-commerce website in Asia. It is based on the [Nginx](http://nginx.org) HTTP server and has many advanced features. Tengine has proven to be very stable and efficient on some of the top 100 websites in the world, including [taobao.com](http://www.taobao.com) and [tmall.com](http://www.tmall.com/). 

    Tengine has been an open source project since December 2011. It is being actively developed by the Tengine team, whose core members are from [Taobao](http://en.wikipedia.org/wiki/Taobao), [Sogou](http://en.wikipedia.org/wiki/Sogou) and other Internet companies. Tengine is a community effort and everyone is encouraged to [get involved](source.html).</div>

[![](images/download.png)](download/tengine-2.1.2.tar.gz)

## Features

*   All features of Nginx-1.6.2 are inherited, i.e., it is compatible with Nginx.
*   [Dynamic module loading support (DSO)](document/dso.html). You don't have to recompile Tengine when adding new modules to it.
*   SO_REUSEPORT support, so the connection setup speed could be [three times faster than Nginx](document/benchmark.html).
*   support for both [HTTP v2 protocol](http://nginx.org/en/docs/http/ngx_http_v2_module.html) and [SPDY v3 protocol](http://nginx.org/en/docs/http/ngx_http_spdy_module.html), be able to use them [together](document/http_core.html).
*   Sends [unbuffered upload](document/http_core.html) directly to HTTP and FastCGI backend servers, which saves disk I/Os.
*   More load balancing methods, e.g., [consistent hashing](document/http_upstream_consistent_hash.html), [session persistence](document/http_upstream_session_sticky.html), [upstream health check](document/http_upstream_check.html), and [resolving upstream domain names on the fly](document/http_upstream_dynamic.html).
*   [Input body filter](http://blog.zhuzhaoyuan.com/2012/01/a-mechanism-to-help-write-web-application-firewalls-for-nginx/) support. It's quite handy to write Web Application Firewalls using this mechanism.
*   [Dynamic scripting language (Lua)](http://wiki.nginx.org/HttpLuaModule) support, which is very efficient and makes it easy to extend core functionalities.
*   [Logging enhancements](document/http_log.html). Syslog (local and remote), pipe logging and log sampling are supported.
*   Support [collecting the running status of Tengine](document/http_reqstat.html) according to specific key (domain, url, etc).
*   [Limits retries for upstream servers](document/ngx_limit_upstream_tries.html) (proxy, memcached, fastcgi, scgi, uwsgi).
*   Includes a mechanism to support [standalone processes](document/proc.html).
*   [Protects the server](document/http_sysguard.html) in case system load or memory use goes too high.
*   [Multiple CSS or JavaScript requests can be combined](document/http_concat.html) into one request to reduce download time.
*   [Removes unnecessary white spaces and comments](document/http_trim_filter.html) to reduce the size of a page.
*   The number of worker processes and CPU affinities can be set automatically.
*   [The limit_req module](document/http_limit_req.html) is enhanced with whitelist support and more conditions are allowed in a single location.
*   [Enhanced diagnostic information](document/http_footer_filter.html) makes it easier to troubleshoot errors.
*   [More user-friendly command lines](document/commandline.html), e.g., showing all compiled-in modules and supported directives.
*   Expiration times can be specified for certain MIME types.
*   Error pages can be reset to 'default'.
*   ...


## News

*   [12/31/2015] [Tengine-2.1.2](download/tengine-2.1.2.tar.gz) stable version released ([changes](changelog.html#2_1_2)).
*   [08/12/2015] [Tengine-2.1.1](download/tengine-2.1.1.tar.gz) stable version released ([changes](changelog.html#2_1_1)).
*   [12/19/2014] [Tengine-2.1.0](download/tengine-2.1.0.tar.gz) development version released ([changes](changelog.html#2_1_0)).
*   [05/30/2014] [Tengine-2.0.3](download/tengine-2.0.3.tar.gz) development version released ([changes](changelog.html#2_0_3)).
*   [03/28/2014] [Tengine-2.0.2](download/tengine-2.0.2.tar.gz) development version released ([changes](changelog.html#2_0_2)).
*   [03/06/2014] [Tengine-2.0.1](download/tengine-2.0.1.tar.gz) development version released ([changes](changelog.html#2_0_1)).
*   [01/08/2014] [Tengine-2.0.0](download/tengine-2.0.0.tar.gz) development version released ([changes](changelog.html#2_0_0)).
*   [11/22/2013] [Tengine-1.5.2](download/tengine-1.5.2.tar.gz) stable version released ([changes](changelog.html#1_5_2)).
*   [08/29/2013] [Tengine-1.5.1](download/tengine-1.5.1.tar.gz) stable version released ([changes](changelog.html#1_5_1)).
*   [08/04/2013] We presented [Nginx Hacking at Alibaba](download/tengine@alibaba.pdf) at [COSCUP 2013](http://coscup.org/2013/en/program/#day2_am).
*   [07/31/2013] [Tengine-1.5.0](download/tengine-1.5.0.tar.gz) stable version released ([changes](changelog.html#1_5_0)).
*   [05/14/2013] [Tengine-1.4.6](download/tengine-1.4.6.tar.gz) development version released ([changes](changelog.html#1_4_6)).
*   [05/01/2013] [Tengine-1.4.5](download/tengine-1.4.5.tar.gz) development version released ([changes](changelog.html#1_4_5)).
*   [03/21/2013] [Tengine-1.4.4](download/tengine-1.4.4.tar.gz) development version released ([changes](changelog.html#1_4_4)).
*   [01/21/2013] [Tengine-1.4.3](download/tengine-1.4.3.tar.gz) development version released ([changes](changelog.html#1_4_3)).
*   [11/22/2012] [Tengine-1.4.2](download/tengine-1.4.2.tar.gz) development version released ([changes](changelog.html#1_4_2)).
*   [10/10/2012] [Tengine-1.4.1](download/tengine-1.4.1.tar.gz) development version released ([changes](changelog.html#1_4_1)).
*   [09/05/2012] [Tengine-1.4.0](download/tengine-1.4.0.tar.gz) development version released ([changes](changelog.html#1_4_0)).
*   [07/10/2012] We started the [Nginx Chinese Documentation Translation Project](nginx_docs/cn/).
*   [06/28/2012] Our [Chinese translation of Nginx's documentation](http://nginx.org/cn/) was accepted by the Nginx team.
*   [06/09/2012] We presented [Nginx Use Cases and Development at Taobao](download/taobao_nginx_2012_06.pdf) at ECOC Conference.
*   [05/25/2012] [Tengine-1.3.0](download/tengine-1.3.0.tar.gz) stable version released ([changes](changelog.html#1_3_0)).
*   [05/09/2012] [Tengine-1.2.5](download/tengine-1.2.5.tar.gz) stable version released ([changes](changelog.html#1_2_5)).
*   [03/30/2012] [Tengine-1.2.4](download/tengine-1.2.4.tar.gz) stable version released ([changes](changelog.html#1_2_4)).
*   [03/08/2012] We are writing [an open book on Nginx development](book/index.html).
*   [02/27/2012] [Tengine-1.2.3](download/tengine-1.2.3.tar.gz) stable version released ([changes](changelog.html#1_2_3)).
*   [01/11/2012] [Tengine-1.2.2](download/tengine-1.2.2.tar.gz) stable version released ([changes](changelog.html#1_2_2)).
*   [12/07/2011] We gave a talk on [Hacking Nginx](http://velocity.oreilly.com.cn/2011/index.php?func=session&name=%E6%89%93%E9%80%A0%E5%AE%89%E5%85%A8%E3%80%81%E6%98%93%E8%BF%90%E7%BB%B4%E7%9A%84%E9%AB%98%E6%80%A7%E8%83%BDWeb%E5%B9%B3%E5%8F%B0%EF%BC%9A%E6%B7%98%E5%AE%9D%E7%BD%91Nginx%E5%AE%9A%E5%88%B6%E5%BC%80%E5%8F%91%E5%AE%9E%E6%88%98) at Velocity China 2011.
*   [12/06/2011] [Tengine-1.2.1](download/tengine-1.2.1.tar.gz) stable version released ([changes](changelog.html#1_2_1)).
*   [12/02/2011] [Tengine goes open source.](opensource.html)


## Mailing list

*   Chinese: [http://code.taobao.org/mailman/listinfo/tengine-cn](http://code.taobao.org/mailman/listinfo/tengine-cn)
*   English: [http://code.taobao.org/mailman/listinfo/tengine](http://code.taobao.org/mailman/listinfo/tengine)
