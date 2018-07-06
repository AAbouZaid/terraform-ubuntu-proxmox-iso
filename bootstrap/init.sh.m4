#!/bin/bash

chsh -s /bin/bash

# Access internet.
if [[ -n "__HTTP_PROXY__" ]]; then
cat << EOF >> /etc/environment
export http_proxy=__HTTP_PROXY__
export https_proxy=__HTTP_PROXY__
export HTTP_PROXY=__HTTP_PROXY__
export HTTPS_PROXY=__HTTP_PROXY__
EOF
fi

export http_proxy=__HTTP_PROXY__
export https_proxy=$http_proxy
export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$http_proxy

# Install SaltStack.
curl -L https://bootstrap.saltstack.com | bash /dev/stdin -d -X -P stable __SALT_VERSION__

# Configure SaltStack.
cp /etc/hostname /etc/salt/minion_id
echo "master: __SALT_MASTER__" >> /etc/salt/minion
echo "environment: __SALT_ENV__" >> /etc/salt/minion
echo "pillarenv: __SALT_ENV__" >> /etc/salt/minion

service salt-minion restart

# Grub.
# use old naming like eth0, eth1 ... etc.
echo 'GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"' >> /etc/default/grub
/usr/sbin/update-grub
sed -i 's/__NIC_NAME__/eth0/g' /etc/network/interfaces

# Update system.
apt-get update
apt-get dist-upgrade -y

# Don't stop the setup even something didn't go well.
exit 0
