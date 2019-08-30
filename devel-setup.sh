#!/usr/bin/env bash

echo "Updating..."
yum -y update
echo "Installing epel..."
yum -y install epel-release
echo "Installing Xfce..."
yum -y group install "Xfce"
echo "Installing X Window System..."
yum -y group install "X Window System"
systemctl set-default graphical.target
echo "Installing other...."
yum -y install firefox gedit filezilla zip unzip nano htop ncdu \
gcc gcc-c++ zlib zlib-devel libffi-devel openssl-devel bzip2-devel \
thunderbird wget dig mlocate bind-utils rdesktop freerdp tigervnc-server \
git xclip screen

echo "Installing Chrome..."
touch /etc/yum.repos.d/google-chrome.repo
echo "[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub" > /etc/yum.repos.d/google-chrome.repo
yum -y install google-chrome-stable


echo "Installing Atom..."
rpm --import https://packagecloud.io/AtomEditor/atom/gpgkey
touch /etc/yum.repos.d/atom.repo
echo "[Atom]
name=Atom Editor
baseurl=https://packagecloud.io/AtomEditor/atom/el/7/x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=1
gpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey" > /etc/yum.repos.d/atom.repo
yum -y install atom


echo "Installing VScode..."
rpm --import https://packages.microsoft.com/keys/microsoft.asc
touch /etc/yum.repos.d/vscode.repo
echo "[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo
yum -y install code


echo "Installing Python..."
cd /usr/src
wget https://www.python.org/ftp/python/3.7.1/Python-3.7.1.tgz
tar xzf Python-3.7.1.tgz
cd Python-3.7.1
./configure --enable-optimizations
make altinstall


echo "Installing Open Office..."
cd /usr/src
wget https://sourceforge.net/projects/openofficeorg.mirror/files/4.1.5/binaries/en-US/Apache_OpenOffice_4.1.5_Linux_x86_install-rpm_en-US.tar.gz
tar xzf Apache_OpenOffice_4.1.5_Linux_x86_install-rpm_en-US.tar.gz
cd en-US/RPMS/
rpm -Uvh *.rpm
cd desktop-integration/
rpm -Uvh openoffice4.1-redhat-menus-*.noarch.rpm
