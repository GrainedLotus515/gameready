#!/usr/bin/env bash
# shellcheck disable=SC2140,SC2086

# COLOR VARIABLES
RED="\e[31m"
BLUE="\e[34m"
GREEN="\e[32m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"

# PRINT CHECKING OS
echo -e "${YELLOW}Checking OS...${ENDCOLOR}"

# PRINT OS NAME
echo -e "${BLUE}Detected OS:${ENDCOLOR} `grep "^ID=" /etc/os-release | gawk -F '=' '{print $2}'`"

# FOR ARCH AND MANJARO
if [[ `grep "^ID=" /etc/os-release | gawk -F '=' '{print $2}'` = arch ]] || [[ `grep "^ID=" /etc/os-release | gawk -F '=' '{print $2}'` = manjaro ]];
then
    # RUN GAMEREADY-ARCH.SH
    echo -e "\n\n${RED}<-- Running gameready-arch.sh -->${ENDCOLOR}"
    bash <(curl -s https://raw.githubusercontent.com/GrainedLotus515/gameready/main/gameready-arch.sh)
    exit 0
    
    # FOR DEBIAN AND UBUNTU
elif [[ `grep "^ID=" /etc/os-release | gawk -F '=' '{print $2}'` = debian ]] || [[ `grep "^ID=" /etc/os-release | gawk -F '=' '{print $2}'` = ubuntu ]];
then
    # RUN GAMEREADY-UBUNTU.SH
    echo -e "\n\n${RED}<-- Running gameready-ubuntu.sh -->${ENDCOLOR}"
    bash <(curl -s https://raw.githubusercontent.com/GrainedLotus515/gameready/main/gameready-ubuntu.sh)
    exit 0
    
else
    zenity --error --width 300 --title="Unsupported OS" --text="Your OS is not supported by GameReady. Please use Ubuntu, Debian, or Arch based distros."
    exit 1
fi
