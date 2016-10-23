set -e

sudo pacman -Syu - < packages --noconfirm

cd ~
rm -Rf package-query
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si --noconfirm
rm -Rf package-query

cd ~
rm -Rf yaourt
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si --noconfirm
cd ..
rm -Rf yaourt

cd TulOS
yaourt i3blocks
yaourt ttf-inconsolata-g
yaourt ttf-font-awesome
yaourt xnviewmp

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

# vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
