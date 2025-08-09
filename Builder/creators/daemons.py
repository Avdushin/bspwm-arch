import os


class Daemons:
    @staticmethod
    def enable_all_daemons():
        Daemons.__enable_network_daemon()
        Daemons.__enable_bluetooth_daemon()
        Daemons.__enable_pipewire()

    @staticmethod
    def __enable_network_daemon():
        os.system("sudo systemctl enable NetworkManager")
    
    @staticmethod
    def __enable_bluetooth_daemon():
        os.system("sudo systemctl enable bluetooth.service")
        os.system("sudo systemctl start bluetooth.service")

    @staticmethod
    def __enable_pipewire():
        os.system("systemctl --user enable --now pipewire pipewire-pulse wireplumber")
        os.system("sudo systemctl enable --now bluetooth")
