# script by Aurorus

read -p 'Do you want create new user? [Y/N] ' createuser
if [ $createuser = "Y" ] || [ $createuser = "y" ]
then
    read -p "What is your username: " username
    read -sp "What is your user password: " password
    useradd -m $username
    echo ${username}:${password} | chpasswd
    mkdir -p "/home/$username/Pictures"
    mkdir -p "/home/$username/Videos"
    mkdir -p "/home/$username/Templates"
    mkdir -p "/home/$username/Public"
    mkdir -p "/home/$username/Music"
    mkdir -p "/home/$username/Downloads"
    mkdir -p "/home/$username/Documents"
fi 
echo ''
read -p 'Do you want install packages? [Y/N] ' packages
if [ $packages = "Y" ] || [ $packages = "y" ]
then
	pacman -Syu
	pacman -S xorg sddm plasma konsole dolphin
	systemctl enable sddm
    systemctl enable NetworkManager
    systemctl start NetworkManager
	systemctl start sddm
fi
echo ''
if [ $createuser = "Y" ] || [ $createuser = "y" ]
then
    read -p 'Do you want install kde plasma 5.21 wallpaper? [Y/N] ' installtheme
    if [ $installtheme = "Y" ] || [ $installtheme = "y" ]
    then
        cd "/home/${username}/Pictures"
        wget https://i.redd.it/l9qp8k1saca61.png -O "kde-plasma-5-21-wallpaper.png"
    fi
fi 
echo 'Thank you for using my arch kde plasma installer :)'