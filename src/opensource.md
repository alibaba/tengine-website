## Tengine, goes to open source

We're glad to announce that [Tengine](http://tengine.taobao.org), our hacked-up version of Nginx at Taobao now becomes an open source project. 

[Taobao](http://www.taobao.com) is the largest e-commerce website in Asia and ranked #12 on Alexa’s top global sites list. Our website serves billions of pageviews per day. For busy website as us, Nginx is obviously the best choice. Thanks to Nginx's high performance, small footprint and flexibility, we have done more with less. 

We first learned the Nginx internals by using it as a traditional web server and developing dozens of modules. Then from June of this year we started hacking the Nginx core to expand its capabilities. As some of the features we have developed may also benefit other Nginx users and websites, so why not open source them? We do not want to be just open source software users, but also open source contributors. That's why the Tengine open source project came out.

Tengine is based on the latest stable version of Nginx (Nginx-1.0.10). Here are a few features and bug fixes you may be interested in Tengine:

*   Logging enhancement. It supports syslog (local and remote) and pipe logging. You can also do log sampling, i.e. not all requests have to be written.
*   Protects the server when the system load and memory use goes high.
*   Combines multiple CSS or JavasScript requests into one request to reduce the downloading time.
*   Sets the worker process number and CPU affinities automatically. Setting Nginx's worker_cpu_affinity is not a pain any more.
*   Enhanced limit_req module with whitelist support and more limit_req directives in one location.
*   More operations engineer friendly server information, so host can be located easily when error happens.
*   More command lines support. You can list all modules compiled in and the directives supported, even the content of configuration file itself.
*   Set expiration for files according to specific content type.
*   Error pages can be set back to 'default'.
*   ...

Basically, Tengine can be considered as a better or superset of Nginx. You can download the tar ball here:

[http://tengine.taobao.org/download/tengine.tar.gz](http://tengine.taobao.org/download/tengine.tar.gz)

We want to say thank you to the Nginx team, especially to Igor. Thank you very much for your great work! We would love to donate the patches against the Nginx-1.1 branch later if you think the patches are okay.

Frankly, I'm not sure whether the features in Tengine right now can impress you guys or not. It's the first step we moving towards open source after all. We have built a team working on Tengine and have quite a long to-do list. I promise you more enhancements are coming out.
