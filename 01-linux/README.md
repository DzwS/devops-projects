# 什么是linux



# fundation
1. uname -a  ## show system information
2. uptime ## show system uptime
3. hostname ## show hostname
4. whoami ## shwo current user
5. ls -lah ## list directory contents with permissions
6. pwd ## show current directory
7. cd /path ## change directory
8. mkdir -p /path ##create a directory(with parent if needed)
9. rm -rf /path ##remove directory recursivel
10. cp -r source target ##copy file/directories recusively
11. mv oldname newname ##move/rename file 
12. ps aux ## show running processes
13. top ## show real-time systemperformance
14. kill -9 PID ## kill a process forcefully
15. pkill -f process_name ## kill process by name
16. df -h ## show disk space usage
17. du -sh /path ## shwo directory size
18. netstat -tulnp ## shwo listening ports
19. ss -tulnp ## show listening ports (alternative)
20. who ## show logged-in users
21. adduser username ## create a new user
22. passwd username ## change user password
23. usermod -aG group user ## add user to a group
24. grep "text" file.txt ## search for a string in a file 
25. find /path -name "*.log" ## find files matching pattern
26. chmod 755 file.sh ##change file permissions
27. chown user:group file ##change file owner
28. tar -czf archive.tar.gz directory/
29. tar -xzf archive.tar.gz
30. cat file.txt
31. tail -f /var/log/syslog
32. echo "text" >> file.txt
33. history
34. clear
35. alias ll='ls -lah'
36. df -Th
37. wc -l file.txt
38. cut -d":" -f1 /etc/passwd
39. awk '{print $1}' file.txt
40. sed -i 's/old/new/g' file.txt
41. crontab -e
42. cron -l
43. rsync -av source/ target/
44. scp user@host:/path/to/file .
45. ssh user@host
46. exit
47. uptime
48. free -m
49. top
50. vmstat
51. git init



# best practice
