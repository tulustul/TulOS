set -e

sudo pacman -Syu - < packages --noconfirm

cd ~
rm -Rf package-query
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ..

cd TulOS
yaourt -S - < package-aur --noconfirm

sudo pip install virtualenvwrapper

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

cp -R home/. ~/

touch ~/.tulrc
