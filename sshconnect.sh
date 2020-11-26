 #!/bin/sh
 # I made this script to rapidly connect to an ssh server.  
 # It is indeed very convenient (at least to me , I use it almost every day) 
 # but not very wise or safe, in term of security , since longi and password must be stored
 # as variable inside the script. use it wisely
 
# SHH connections informations  password, login , server (ip), port
sshmdp=enteryourpasswordhere!;
sshlogin=yourlogin;
sshserver=192.168.1.1; #the server ip / hostname
sshport=22 #your ssh port


# some colors
red="\e[0;91m"
blue="\e[0;94m"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
red_bg="\e[0;101m${expand_bg}"
reset="\e[0m"
green_bg="\e[0;102m${expand_bg}"
green="\e[0;92m"
white="\e[0;97m"
bold="\e[1m"
uline="\e[4m"

if ! command -v sshpass &> /dev/null
then
    echo -ne "sshpass is not installed\n"
    echo "install it ! (ie: sudo apt install sshpass)"
    exit
fi


echo -e "${blue_bg}       connecting to $sshserver       ${reset}"
echo -e "${red_bg}!  !  !   ATTENTION !! WARNING !  !  ! ${reset}\n"
echo -e "${white}${bold}Remember that the password and login are stored inside this script.${reset}"
echo -e "So....Yep! it's not very secure (but pretty convenient though :)"
echo -e "${green}Press any key when ready ! ${reset}" 
read -p "" -n1 -s
sshpass -f <(printf '%s\n' $sshmdp) ssh $(echo $sshlogin)@$(echo $sshserver) -p $(echo $sshport)
