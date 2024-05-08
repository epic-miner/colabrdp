#!/bin/bash

# User Configuration
username="user"
password="root"

# Function to prompt for CRP value
getCRP() {
    read -p "Enter CRP (Chrome Remote Desktop) value: " CRP
    if [ -z "$CRP" ]; then
        echo "CRP value cannot be empty. Please enter a valid value."
        getCRP
    fi
}

# Create User and Set it up
echo "Creating User and Setting it up"
useradd -m $username
adduser $username sudo
echo "$username:$password" | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
echo "User created and configured having username '$username' and password '$password'"

# Chrome Remote Desktop Configuration
getCRP

Pin=123456
Autostart=true

installCRD() {
    echo "Installing Chrome Remote Desktop"
    wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
    dpkg --install chrome-remote-desktop_current_amd64.deb
    apt install --assume-yes --fix-broken
}

installDesktopEnvironment() {
    echo "Installing Desktop Environment"
    export DEBIAN_FRONTEND=noninteractive
    apt install --assume-yes xfce4 desktop-base xfce4-terminal
    bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'
    apt remove --assume-yes gnome-terminal
    apt install --assume-yes xscreensaver
    systemctl disable lightdm.service
}

installGoogleChrome() {
    echo "Installing Google Chrome"
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    dpkg --install google-chrome-stable_current_amd64.deb
    apt install --assume-yes --fix-broken
}

finish() {
    echo "Finalizing"
    if [ $Autostart = true ]; then
        mkdir -p /home/$username/.config/autostart
        link="https://youtu.be/d9ui27vVePY?si=TfVDVQOd0VHjUt_b"
        colab_autostart="[Desktop Entry]
Type=Application
Name=Colab
Exec=sh -c \"sensible-browser $link\"
Icon=
Comment=Open a predefined notebook at session signin.
X-GNOME-Autostart-enabled=true"
        echo "$colab_autostart" > /home/$username/.config/autostart/colab.desktop
        chmod +x /home/$username/.config/autostart/colab.desktop
        chown $username:$username /home/$username/.config
    fi

    adduser $username chrome-remote-desktop
    command="$CRP --pin=$Pin"
    su - $username -c "$command"
    service chrome-remote-desktop start

    echo "Finished Succesfully"
}

# Main
apt update
installCRD
installDesktopEnvironment
installGoogleChrome
finish
