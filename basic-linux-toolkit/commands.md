# system reconnaissance: know your battlefield
1. the full system checkup: top
2. disk space detective: df -h
3. finding disk space hogs: du -h --max-depth=1 /path | sort -hr
4. check running services: systemctl list-units --type=service --state=running
5. process investigation: ps aux | grep [service_name]
6. check open ports: ss -tulpn
7. check system load history: sar -q
8. memory usage detail: free -h
9. real-time resource monitoring: htop
10. quick system summary: neofetch


# docker domination:container commands that save lives
1. list all containers: dokcer ps -a
2. container resource usage: docker stats
3. clean up docker system: docker system prune -af
4. inspect container details: docker inspect [container_id]
5. follow container logs: docker logs -f [conatiner_id]
6. execute command inside container: docker exec -ti [container_id] bash
7. check docker networks: docker network ls
8. copy files between host and container: docker cp [container_id]:/path/to/file ./local/path
9. quick temporary container: docker run --rm -it [image] [command]
10. build with no cache: docker build --no-cache -t [image_name] .


# kubernetes kung fu: orchestrating with confidence
1. check all resources: kubectl get all --all-namespaces
2. pod details: kubectl describe po [pod_name]
3. follow pod logs: kubectl logs -f [pod_name] -c [container_name]
4. execute command in pod: kubectl exec -ti [pod_name] -- [command]
5. port forwarding: kubectl port-forward [pod_name] 8080:80
6. watch resource changes: kubectl get pods -w
7. check pod resource usage: kubectl top pods
8. edit resources on the fly: kubectl edit deployment [deployment_name]
9. apply configuration changes: kubectl apply -f [file_or_directory]
10. drain node for maintenance: kubectl drain [node_name] --ignore-daemonsets

# networking ninjas: diagnose and fix connectivity issues
1. test connectivity with ping: ping -c 4 [hostname]
2. trace network path: traceroute [hostname]
3. DNS lookup: dig [domain] +short
4. port scanning: nmap -p 1-10000 [hostname]
5. check listening ports: lsof -i -P -n | grep LISTEN
6. http request inspection: curl -v [url]
7. continuous network monitoring: mtr [hostname]
8. tcp connection analysis: tcpdump -i eth0 host [hostname] and port [port]
9. ssl certficate verification: openssl s_client -connect [hostname]:443 -servername [hostname]
10. bandwidth testing: iperf3 -c [server] -p [port]

# monitoring magic: catching problems before users do
1. simple http service check: watch -n 5 "curl -s -o /dev/null -w '%{http_code}' [url]"
2. continuous resource monitoring: dstat -cdnmgy --top-cpu --top-mem
3. log file monitoring: tail -f /var/log/syslog | grep ERROR
4. disk I/O monitoring: iostat -xz 5
5. check running processes: ps aux --sort=-%cpu | head -10
6. network connection states: netstat -tunapl
7. check failed systemd services: systemctl --failed
8. historical performance data: journalctl -u [service] --since "1 hour ago"
9. check system load average: uptime
10. monitor file system events: inotifywait -m -r /path/to/directory


# shell scripting sorcery: automation for the win
1. find and replace in multiple files: find . -type f -name "*.conf" -exec sed -i 's/old_value/new_value/g' {} \;
2. batch file renaming: for f in *.txt; do mv "$f" "${f%.txt}.md"; done
3. run command on multiple servers: for server in server1 server2 server3;do ssh $server "uptime"; done
4. monitor until success: until curl -s http://myapp.health | grep -q 'ok'; do sleep 5; echo "service is up!"
5. parallel command execution: ls *.log | parallel gzip {}
6. create self-destructing messages: echo "this will self-destruct in 60 seconds" | at now + 1 minute
7. automatic error handling: #!/bin/sh set -e set -o pipefail
8. loop with timeout: timeout 300s bash -c "while ! mysqladmin ping -h db.example.com --silent; do sleep 1; done"
9. capture both output and errors: result=$(command 2>&1)
10. conditional command execution: grep -q "ERROR" /var/log/app.log && slack-alert "errors found in application log"

# cloud companion: aws,azure, and gcp essentials
1. aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId, State.Name, InstanceType, PrivateIpAddress, PrivateIpAddress, PublicIpAddress, Tags[?key='Name'].Value|[0]]" --output table
2. aws ce get-cost-and-usage --time-period Start=2024-01-01,End=2024-02-01 --granularity MON
.....



# Git guru: version control mastery
1. find recent branches: git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:short) %(refname:short)'
2. search commit history: git log --grep="fix authentication" --oneline
3. view file history: git log -p -- filename
4. find merge conflicts before they happend: git merge-tree $(git merge-base HEAD feature-branch) HEAD feature-branch
5. clean untracked files: git clean -fdx
6. track code ownership: git blame -L 10,20 filename
7. quick commit fixup: git commit --fixup=HEAD~3
8. compare branches: git log --graph --oneline --decorate branch1..bracnh2
9. find lost commits: git reflog
10. stash selected changes: git stash push -p

# security sentinel: protecting your kingdom
1. check for open ports: sudo nmap -sS -0 127.0.0.1
2. find files with SUID Bit: find / -type f -perm -4000 2>/dev/null
3. check for failed login attempts: grep "Failed password" /var/log/auth.log | awk '{print $11}' | sort | uniq -c | sort -nr
4. monitor real-time network connections: watch -n 1 "netstat -tuna | grep ESTABLISHED"
5. check file integrity: find /etc -type f -exec md5sum {} \; > /tmp/checksum.txt
6. ssl certificate expiry check: echo | openssl s_client -servername example.com -connect example.com:443 2>/dev/null | openssl x509 -noout -enddate
7. find writable directories: find / -type d -writable -not -path "/proc/*" 2>/dev/null
8. check user account security: aws -F: '($2 == "") {print $1}' /etc/shadow
9. monitor suspicious processes: ps aux | grep -v "^$(whoami)\|^root\|^system"
10. apply security updates: apt update && apt upgrade -y

# performance prowess: making things blazing fask
1. find cpu-intensive processes: ps -eo pcpu,pid,user,args | sort -r | head -10
2. find emeory leaks: watch -n 5 "ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head"
3. identify disk i/o bottlenecks: iostat -xz 1
4. check network throughput: iftop -i eth0
5. profile application performance: perf record -g -p [pid]
6. finf file access patterns: iotop -o
7. analyze system load averages: sar -q | awk '$4 > 1.0'
8. clean cache to test performance: s -c "sync; echo 3 > /proc/sys/vm/drop_caches"
9. find slow database queries: mysql -e "SHOW FULL PROCESSLIST" | grep -v Sleep
10. ab -n 1000 -c 50 http://localhost/api/endpoint