#!/usr/bin/env bash


echo "Installing PyCharm..."
wget 'https://download.jetbrains.com/python/pycharm-community-2019.2.1.tar.gz'
tar xvfz pycharm-community-2019.2.1.tar.gz -C /opt/
/opt/pycharm-community-2019.2.1/bin/pycharm.sh


touch ~/.local/share/applications/jetbrains-pycharm-ce.desktop
echo "[Desktop Entry]
Version=1.0
Type=Application
Name=PyCharm Community Edition
Icon=/opt/pycharm-community-2019.2.1/bin/pycharm.svg
Exec=\"/opt/pycharm-community-2019.2.1/bin/pycharm.sh\" %f
Comment=Python IDE for Professional Developers
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-pycharm-ce
" > ~/.local/share/applications/jetbrains-pycharm-ce.desktop
