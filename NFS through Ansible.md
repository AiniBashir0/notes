# Ansible server 

### server-list (IP of nfs-server)
- ansible all -i all-yaml/server-list -m yum -a "name=nfs-utils state=latest"
- ansible all -i all-yaml/server-list -m firewalld -a "port=2049/tcp permanent=true state=enables immediate=true"
- ansible all -i all-yaml/server-list -m firewalld -a "port=2049/udp permanent=true state=enables immediate=true"
- ansible all -i all-yaml/server-list -m firewalld -a "service=mountd permanent=true state=enables immediate=true"
- ansible all -i all-yaml/server-list -m firewalld -a "service=rpc-bind permanent=true state=enables immediate=true"
- ansible all -i all-yaml/server-list -m selinux -a "policy=targeted state=permissive"
- ansible all -i all-yaml/server-list -m file -a "path=/nfs-share state=touch"
- ansible all -i all-yaml/server-list -m lineinfile -a "path=/etc/exports line='/nfs-share 192.168.2.106(rw,sync,no_root_squash)'"
- ansible all -i all-yaml/server-list -m shell -a "exportfs -a"

### showmount -e (IP of nfs-server)
### Add IP of nfs-client in server-list-- vim all-yaml/server-list
- - ansible all -i all-yaml/server-list -m file -a "path=/nfs-client state=touch"
- ansible all -i all-yaml/server-list -m mount -a "path=/nfs-client src=192.168.2.101:/nfs-share state=mounted fstype=nfs"
- df -h /nfs-client
