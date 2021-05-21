if [ ! -e /etc/X11/xorg.conf.d ]; then
   mkdir -p /etc/X11/xorg.conf.d
fi

cat <<HERE > /etc/X11/xorg.conf.d/10-headless.conf
Section "Monitor"
        Identifier "dummy_monitor"
        HorizSync 28.0-80.0
        VertRefresh 48.0-75.0
        DisplaySize  250 174
EndSection

Section "Device"
        Identifier "dummy_card"
        VideoRam 256000
        Driver "dummy"
EndSection

Section "Screen"
        Identifier "dummy_screen"
        Device "dummy_card"
        Monitor "dummy_monitor"
        SubSection "Display"
           depth 24
           Modes "1280x1024"
        EndSubSection
EndSection
HERE

echo exec startxfce4>~/.xinitrc

