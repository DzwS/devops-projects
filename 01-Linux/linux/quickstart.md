uname -a
uptime
top / htop

df -h 
du -h --max-depth=1 && du -h --max-depth=1 | sort -k1h
free -h

ls -al
find . -name "foo"
grep -r "bar" .

ip a
ss -tuln
curl -I URL

apt update && apt upgrade
yum update

chmod +x file
chown user:group file

tar -xzvf file.tar.gz
scp file user@host:/path