!/bin/sh
# This is legacy code
# Latex Install, the prescript way!
echo "Installing wget"
sudo apt-get update
sudo apt-get install -y wget

echo "*******************************************"
echo "Installing Latex 2018 "
echo "*******************************************"

echo "==>Creating tmp dir"
cd /vagrant/
mkdir .tmp
cd .tmp

echo "Download tl unix ..."
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

tar --strip-components=1 -xzf install-tl-unx.tar.gz -C .

echo "Download latex profile ..."
wget https://raw.githubusercontent.com/Prescrypto/heroku-buildpack-tex/master/conf/texlive.profile

echo "Installing..."
sudo ./install-tl --profile=/vagrant/texlive.profile


echo "*******************************************"
echo " Update path "
echo "*******************************************"
echo 'PATH="/usr/local/texlive/2018/bin/x86_64-linux:$PATH"' >> ~/.profile
source ~/.profile

echo "LaTeX Installed"


echo "==>Remove tmp dir"
echo "==>TODO REMOVE tmp dir"

echo "*******************************************"
echo "Install texlive packages "
echo "*******************************************"
cd /vagrant/
sudo env PATH="$PATH" tlmgr install $(cat texlive.packages)

echo "Installed Latex with Packages!!"