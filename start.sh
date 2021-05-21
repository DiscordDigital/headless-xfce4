startx &
dbus-launch
sleep 5
x11vnc -usepw -display :0 -forever
