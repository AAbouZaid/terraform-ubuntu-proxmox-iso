#

# The nickname of this ISO, VirtualBox image, and Vagrant box.
: ${NICKNAME:="terraform"}

# Arguments given to the download router.
: ${VERSION:="14.04.5"}
: ${DISTRO:="server"}
: ${RELEASE:="latest"}

# Architecture being built (i386 or amd64).
: ${ARCH:="amd64"}

# Hardcoded host information.
: ${HOST:="tfnode"}
: ${DOMAIN:="terraform.io"}
: ${ROOT_PASSWORD:=`openssl rand -base64 24`}
: ${USERNAME:="terraform"}
: ${PASSWORD:=`openssl rand -base64 24`}

# Misc.
: ${NIC_NAME:="eth1"}
: ${HTTP_PROXY:=""}
: ${POWER_OFF:="true"}

# Salt provision.
: ${SALT_VERSION:="latest"}
: ${SALT_MASTER:="saltmaster"}
: ${SALT_ENV:="dev"}

# Building info.
: ${PARENT_DIR:="work"}
: ${MOUNT_DIR:="$PARENT_DIR/mount"}
: ${WORKING_DIR:="$PARENT_DIR/ubuntu-$VERSION-$DISTRO-$ARCH"}
: ${SRC_ISO:="$PARENT_DIR/ubuntu-$VERSION-$DISTRO-$ARCH.iso"}
: ${DST_ISO:="$PARENT_DIR/$NICKNAME-ubuntu-$VERSION-$DISTRO-$ARCH.iso"}
