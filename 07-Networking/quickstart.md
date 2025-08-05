# 理论知识
常见的网络协议
网站浏览： DNS, IP, TCP, HTTP/HTTPS
邮件相关：SMTP(sending), POP3/IMAP(receiving)
文件传输：FTP/SFTP
网络管理：DHCP, SNMP
安全：SSH, SSL/TLS
网络诊断：ICMP, ARP
路由：OSPF(internal), BGP(between networks)


# 常用命令
ping / traceroute - 基础连通性测试
作用： 检查网络延迟和路由路径
ping example.com
traceroute example.com

netstat / ss - 网络连接与端口监听
作用：查看当前网路连接和监听端口
netstat -tunlp
ss -tunlp

tcpdump - 抓包分析
作用： 捕获网络数据包，排查协议问题
tcpdump -i eth0 port 80 -w capture.pcap

iftop / nethogs - 实时流量监控
作用： 按进程或IP查看网络带宽占用
场景：服务器流量激增，定位异常连接
iftop -i eth0  #按IP统计流量
nethogs eth0   #按进程统计流量