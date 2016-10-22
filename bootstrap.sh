pacman -S git --noconfirm
cd ~
rm -R TulOS
git clone https://github.com/tulustul/TulOS.git

cd TulOS
sh ./configure.sh
