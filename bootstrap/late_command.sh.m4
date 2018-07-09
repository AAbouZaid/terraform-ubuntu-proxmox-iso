set -e

cp /cdrom/sudoers /cdrom/auto_resize_vda.sh /target/etc/
chmod 440 /target/etc/sudoers
chown 0:0 /target/etc/sudoers
chmod 755 /target/etc/auto_resize_vda.sh
