sudo sed -i 's/Exec=brave %U/Exec=brave --password-store=basic %U/' /usr/share/applications/brave-browser.desktop

# Или же можно запускать так
# brave --password-store=basic

# Альтернативный вариант: установить KWallet
# sudo pacman -S kwallet kwalletmanager
# systemctl --user enable --now kwalletd6

# Или же Gnome
# sudo pacman -S gnome-keyring libgnome-keyring
# brave --password-store=gnome
#
