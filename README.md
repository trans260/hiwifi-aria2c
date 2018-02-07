"# hiwifi-aria2c" 



1、首先SSH登陆极路由，更新软件包
root@Hiwifi:/etc/aria2c# opkg update

Downloading https://upgrade.hiwifi.com/upgrade_file/mtmips-HC5761A/1.3.5.18462s/packages/Packages.gz.
Inflating https://upgrade.hiwifi.com/upgrade_file/mtmips-HC5761A/1.3.5.18462s/packages/Packages.gz.
Updated list of available packages in /var/opkg-lists/barrier_breaker.


root@Hiwifi:/etc/aria2c# opkg list | grep aria
aria2 - 1.18.8-20150826 - aria2 is a lightweight multi-protocol & multi-source command-line download
hwf-aria2 - 0.0.2-20150723 - hwf-aria2 is a set of lua lib for aria2


2、执行安装aria2
root@Hiwifi:/etc/aria2c# opkg install aria2

拷贝配置文件cp /etc/aria2c/aria2c.conf.demo /etc/aria2c/aria2c.conf

*配置文件aria2c.conf 已上传，配置中可自行修改下载文件存放的目录

3、添加启动脚本aria2c.sh到/etc/init.d/目录
*aria2c.sh 启动脚本已上传

4、chmod +x /etc/init.d/aria2c.sh


5、将内容  /etc/init.d/aria2c.sh start  加到/etc/rc.local文件



6、启动aria2  
root@Hiwifi:/etc/aria2c# /etc/init.d/aria2c.sh start

7、查看是否启动：
root@Hiwifi:/etc/aria2c# ps  | grep aria
22194 root      7252 S    /usr/bin/aria2c --conf-path=/etc/aria2c/aria2c.conf -D
25658 root      1524 S    grep aria


8、打开网站http://aria2c.com/   添加RPC地址：http://token:xxxxxx@192.168.199.1:6800/jsonrpc   就可以添加下载任务了

9、后续就是再做一个内容穿透，可以用极路由的frpc工具或极智通做内网穿透。我用frpc做了穿透，得到一个域名比如  slxe3e.frp.lu8.win 那就需要修该aria2c.com上的接口地址为http://token:xxxxxx@slxe3e.frp.lu8.win/jsonrpc 


