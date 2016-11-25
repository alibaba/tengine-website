## 简介

    Tengine是由淘宝网发起的Web服务器项目。它在[Nginx](http://nginx.org/)的基础上，针对大访问量网站的需求，添加了很多高级功能和特性。Tengine的性能和稳定性已经在大型的网站如[淘宝网](http://www.taobao.com/)，[天猫商城](http://www.tmall.com)等得到了很好的检验。它的最终目标是打造一个高效、稳定、安全、易用的Web平台。
    从2011年12月开始，Tengine成为一个开源项目，Tengine团队在积极地开发和维护着它。Tengine团队的核心成员来自于[淘宝](http://www.taobao.com/)、[搜狗](http://www.sogou.com/)等互联网企业。Tengine是社区合作的成果，我们欢迎大家[参与其中](source_cn.html)，贡献自己的力量。</div>

[![](images/download.png)](download/tengine-2.1.2.tar.gz)


## 特性

*   继承Nginx-1.6.2的所有特性，兼容Nginx的配置；
*   [动态模块加载（DSO）](document_cn/dso_cn.html)支持。加入一个模块不再需要重新编译整个Tengine；
*   [支持SO_REUSEPORT选项](document_cn/core_cn.html)，建连性能提升为[官方nginx的三倍；](http://tengine.taobao.org/document_cn/benchmark_cn.html)
*   同时支持[HTTP v2协议](http://nginx.org/en/docs/http/ngx_http_v2_module.html)和[SPDY v3协议](http://nginx.org/en/docs/http/ngx_http_spdy_module.html)，[可同时使用两种协议](document_cn/http_core_cn.html)；
*   [流式上传](document_cn/http_core_cn.html)到HTTP后端服务器或FastCGI服务器，大量减少机器的I/O压力；
*   更加强大的负载均衡能力，包括[一致性hash模块](document_cn/http_upstream_consistent_hash_cn.html)、[会话保持模块](document_cn/http_upstream_session_sticky_cn.html)，[还可以对后端的服务器进行主动健康检查](document_cn/http_upstream_check_cn.html)，根据服务器状态自动上线下线，以及[动态解析upstream中出现的域名](document_cn/http_upstream_dynamic_cn.html)；
*   [输入过滤器机制](http://blog.zhuzhaoyuan.com/2012/01/a-mechanism-to-help-write-web-application-firewalls-for-nginx/)支持。通过使用这种机制Web应用防火墙的编写更为方便；
*   支持设置proxy、memcached、fastcgi、scgi、uwsgi[在后端失败时的重试次数](document_cn/ngx_limit_upstream_tries_cn.html)
*   [动态脚本语言Lua](http://wiki.nginx.org/HttpLuaModule)支持。扩展功能非常高效简单；
*   [支持管道（pipe）和syslog（本地和远端）形式的日志以及日志抽样](document_cn/http_log_cn.html)；
*   支持按指定关键字(域名，url等)[收集Tengine运行状态](document_cn/http_reqstat_cn.html)；
*   [组合多个CSS、JavaScript文件的访问请求变成一个请求](document_cn/http_concat_cn.html)；
*   [自动去除空白字符和注释](document_cn/http_trim_filter_cn.html)从而减小页面的体积
*   自动根据CPU数目设置进程个数和绑定CPU亲缘性；
*   [监控系统的负载和资源占用从而对系统进行保护](document_cn/http_sysguard_cn.html)；
*   [显示对运维人员更友好的出错信息，便于定位出错机器；](document_cn/http_footer_filter_cn.html)
*   [更强大的防攻击（访问速度限制）模块](document_cn/http_limit_req_cn.html)；
*   [更方便的命令行参数，如列出编译的模块列表、支持的指令等](document_cn/commandline_cn.html)；
*   可以根据访问文件类型设置过期时间；
*   ……
  </div>
  <div class="clear"></div>
  <div class="one_col">

## 动态

    <ul>

*   [2015-12-31] [Tengine-2.1.2](download/tengine-2.1.2.tar.gz) 稳定版正式发布 ([变更列表](changelog_cn.html#2_1_2))
*   [2015-08-12] [Tengine-2.1.1](download/tengine-2.1.1.tar.gz) 稳定版正式发布 ([变更列表](changelog_cn.html#2_1_1))
*   [2014-12-19] [Tengine-2.1.0](download/tengine-2.1.0.tar.gz) 开发版正式发布 ([变更列表](changelog_cn.html#2_1_0))
*   [2014-05-30] [Tengine-2.0.3](download/tengine-2.0.3.tar.gz) 开发版正式发布（[变更列表](changelog_cn.html#2_0_3)）
*   [2014-03-28] [Tengine-2.0.2](download/tengine-2.0.2.tar.gz) 开发版正式发布（[变更列表](changelog_cn.html#2_0_2)）
*   [2014-03-06] [Tengine-2.0.1](download/tengine-2.0.1.tar.gz) 开发版正式发布（[变更列表](changelog_cn.html#2_0_1)）
*   [2014-01-08] [Tengine-2.0.0](download/tengine-2.0.0.tar.gz) 开发版正式发布（[变更列表](changelog_cn.html#2_0_0)）
*   [2013-11-22] [Tengine-1.5.2](download/tengine-1.5.2.tar.gz) 稳定版正式发布（[变更列表](changelog_cn.html#1_5_2)）
*   [2013-08-29] [Tengine-1.5.1](download/tengine-1.5.1.tar.gz) 稳定版正式发布（[变更列表](changelog_cn.html#1_5_1)）
*   [2013-08-04] 我们受邀在台湾[开源人年会](http://coscup.org/2013/zh-cn/program/#day2_am)上做了[《Nginx深度开发与定制》](download/tengine@alibaba.pdf)的技术分享
*   [2013-07-31] [Tengine-1.5.0](download/tengine-1.5.0.tar.gz) 稳定版正式发布（[变更列表](changelog_cn.html#1_5_0)）
*   [2013-05-14] [Tengine-1.4.6](download/tengine-1.4.6.tar.gz) 开发版正式发布（[变更列表](changelog_cn.html#1_4_6)）
*   [2013-05-01] [Tengine-1.4.5](download/tengine-1.4.5.tar.gz) 开发版正式发布（[变更列表](changelog_cn.html#1_4_5)）
*   [2013-03-21] [Tengine-1.4.4](download/tengine-1.4.4.tar.gz) 开发版正式发布（[变更列表](changelog_cn.html#1_4_4)）
*   [2013-01-21] [Tengine-1.4.3](download/tengine-1.4.3.tar.gz) 开发版正式发布（[变更列表](changelog_cn.html#1_4_3)）
*   [2012-11-22] [Tengine-1.4.2](download/tengine-1.4.2.tar.gz) 开发版正式发布（[变更列表](changelog_cn.html#1_4_2)）
*   [2012-10-10] [Tengine-1.4.1](download/tengine-1.4.1.tar.gz) 开发版正式发布（[变更列表](changelog_cn.html#1_4_1)）
*   [2012-09-05] [Tengine-1.4.0](download/tengine-1.4.0.tar.gz) 开发版正式发布（[变更列表](changelog_cn.html#1_4_0)）
*   [2012-07-10] [Nginx文档中文翻译项目](nginx_docs/cn/)开始
*   [2012-06-28] 我们翻译的[Nginx中文文档](http://nginx.org/cn/)正式被Nginx官方接受
*   [2012-06-09] 我们在华东运维技术大会做了[《淘宝网Nginx应用、定制与开发实战》](download/taobao_nginx_2012_06.pdf)的技术分享
*   [2012-05-25] [Tengine-1.3.0](download/tengine-1.3.0.tar.gz) 稳定版正式发布（[变更列表](changelog_cn.html#1_3_0)）
*   [2012-05-09] [Tengine-1.2.5](download/tengine-1.2.5.tar.gz) 稳定版正式发布（[变更列表](changelog_cn.html#1_2_5)）
*   [2012-03-30] [Tengine-1.2.4](download/tengine-1.2.4.tar.gz) 稳定版正式发布（[变更列表](changelog_cn.html#1_2_4)）
*   [2012-03-08] Tengine开发团队开始编写开放书籍[《Nginx开发从入门到精通》](book/index.html)
*   [2012-02-27] [Tengine-1.2.3](download/tengine-1.2.3.tar.gz) 稳定版正式发布（[变更列表](changelog_cn.html#1_2_3)）
*   [2012-01-11] [Tengine-1.2.2](download/tengine-1.2.2.tar.gz) 稳定版正式发布（[变更列表](changelog_cn.html#1_2_2)）
*   [2011-12-07] Tengine开发团队在Velocity大会上介绍了[《淘宝网Nginx定制实战》](http://velocity.oreilly.com.cn/2011/index.php?func=session&name=%E6%89%93%E9%80%A0%E5%AE%89%E5%85%A8%E3%80%81%E6%98%93%E8%BF%90%E7%BB%B4%E7%9A%84%E9%AB%98%E6%80%A7%E8%83%BDWeb%E5%B9%B3%E5%8F%B0%EF%BC%9A%E6%B7%98%E5%AE%9D%E7%BD%91Nginx%E5%AE%9A%E5%88%B6%E5%BC%80%E5%8F%91%E5%AE%9E%E6%88%98)的一些经验
*   [2011-12-06] [Tengine-1.2.1](download/tengine-1.2.1.tar.gz) 版本正式发布（[变更列表](changelog_cn.html#1_2_1)）
*   [2011-12-02] [Tengine宣布开源](opensource_cn.html)


## 邮件列表

*   中文：[http://code.taobao.org/mailman/listinfo/tengine-cn](http://code.taobao.org/mailman/listinfo/tengine-cn)
*   英文：[http://code.taobao.org/mailman/listinfo/tengine](http://code.taobao.org/mailman/listinfo/tengine)
