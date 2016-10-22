sudo pacman -S git --noconfirm
cd ~
rm -Rf TulOS
git clone https://github.com/tulustul/TulOS.git

cd TulOS
sh ./configure.sh
