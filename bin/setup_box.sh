#!/bin/bash
echo "*******************************************"
echo "Install texlive packages "
echo "*******************************************"
cd /vagrant/
sudo env PATH="$PATH" tlmgr install $(cat texlive.packages)

echo "Installed Latex with Packages!!"