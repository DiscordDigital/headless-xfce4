if [ ! -e /etc/X11/xorg.conf.d ]; then
   mkdir -p /etc/X11/xorg.conf.d
fi

cat <<HERE > /etc/X11/xorg.conf.d/10-headless.conf
Section "Device"
	Identifier "dummy_videocard"
	Option "NoDDC" "true"
	Option "IgnoreEDID" "true"
	Driver "dummy"
	VideoRam 524288
EndSection

Section "Monitor"
	Identifier "dummy_monitor"
	Modeline "3840x2160_20.00" 218.15 3840 4016 4416 4992 2160 2161 2164 2185
	Modeline "3440x1440_20.00" 124.95 3440 3520 3864 4288 1440 1441 1444 1457
	Modeline "2560x1440" 42.12 2560 2592 2752 2784 1440 1475 1478 1513
	Modeline "1920x1440" 69.47 1920 1960 2152 2384 1440 1441 1444 1457
	Modeline "1920x1200" 26.28 1920 1952 2048 2080 1200 1229 1231 1261
	Modeline "1920x1080" 23.53 1920 1952 2040 2072 1080 1106 1108 1135
	HorizSync   5.0 - 1000.0
	VertRefresh 5.0 - 1000.0
EndSection

Section "Screen"
	Identifier "dummy_screen"
	Device "dummy_videocard"
	Monitor "dummy_monitor"
	DefaultDepth 24
	SubSection "Display"
		Depth 24
		Modes "3840x2160_20.00" "3440x1440_20.00" "2650x1440" "1920x1440" "1920x1200" "1920x1080"
		Virtual 3440 1440
	EndSubSection
EndSection
HERE

echo exec startxfce4>~/.xinitrc

