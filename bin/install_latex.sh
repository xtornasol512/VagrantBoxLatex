!/bin/sh
# Script refactor from a production environ to open source 

if [ `which pdflatex` ]; then
        echo "==>Latex is installed!! Well Done!"
else
    echo "Installing wget"
    sudo apt-get update
    sudo apt-get install -y wget

    mkdir -p $TEXLIVE_HOME/.texlive

    echo "*******************************************"
    echo "Installing Latex 2018 "
    echo "*******************************************"

    echo "==>Creating tmp dir"
    cd /vagrant/.tmp

    echo "Download tl unix ..."
    wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

    tar --strip-components=1 -xzf install-tl-unx.tar.gz -C .

    echo "Installing..."
    sudo ./install-tl --profile=/vagrant/texlive.profile

    sudo rm -rf /vagrant/.tmp
    echo "*******************************************"
    echo " Update path "
    echo "*******************************************"
    echo 'PATH="$TEXLIVE_HOME/.texlive/bin/x86_64-linux:$PATH"' >> ~/.profile
    source ~/.profile

    echo "LaTeX Installed"
fi
