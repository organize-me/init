#!/bin/sh

# 1. Set applicable fields (TZ, DOMAIN, etc...)
# 2. Move to ~/bin/env.sh
# 3. Append .profile to include this script '. bin/env.sh'


# --== Install Root ==-- #
export ORGANIZE_ME_HOME=~/organize-me

# --== Timezone ==- #
export TZ=America/Los_Angeles

# --== Domain ==-- #
export DOMAIN=vanderelst.house
export PUBLIC_IP=$(wget -qO- https://ipecho.net/plain)

# --== Terraform ==-- #
export TF_VAR_install_root=$ORGANIZE_ME_HOME
export TF_VAR_domain=$DOMAIN
export TF_VAR_public_ip=$PUBLIC_IP
export TF_VAR_timezone=$TZ

