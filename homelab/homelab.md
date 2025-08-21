sudo pacman -S qemu libvirt virt-manager bridge-utils
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER
# 启动 libvirt 服务
sudo systemctl start libvirtd


sudo systemctl enable libvirtd


sudo systemctl status libvirtd