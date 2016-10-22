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

rm ~/.config/i3/config
rm ~/.config/i3blocks/config
rm ~/.config/termite/config
rm ~/.config/rofi/config

ln ./home/.config/i3/config ~/.config/i3/config
ln ./home/.config/i3blocks/config ~/.config/i3blocks/config
ln ./home/.config/termite/config ~/.config/termite/config
ln ./home/.config/rofi/config ~/.config/rofi/config

touch ~/.tulrc
