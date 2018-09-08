set -e

function install_aur_package {
    if ! (pacman -Q $1 >/dev/null) then
        yay $1 --noconfirm
    fi
}

sudo pacman -Syu - < packages --noconfirm

if ! (pacman -Q package-query >/dev/null) then
    cd ~
    rm -Rf package-query
    git clone https://aur.archlinux.org/package-query.git
    cd package-query
    makepkg -si --noconfirm
    cd ..
    rm -Rf package-query
fi

if ! (pacman -Q yay >/dev/null) then
    cd ~
    rm -Rf yay
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -Rf yay
fi

install_aur_package i3blocks
install_aur_package flameshot

sudo pip install virtualenvwrapper

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

cp -R ~/TulOS/home/. ~/

touch ~/.tulrc

cd ~

git clone https://github.com/powerline/fonts.git
./fonts/install.sh
rm -Rf fonts

# vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


rm -Rf ~/TulOS
