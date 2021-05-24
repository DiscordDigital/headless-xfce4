## About headless-xfce4
This docker image deploys an xfce4 desktop in a container with Alpine Linux.\
It can be used to do basic desktop stuff, however due to the nature of VNC it performs poorly on video playback.

You can install this for example on a VPS in a datacenter, and build an SSH tunnel to access a desktop on a remote machine.\
I recommend to not port forward VNC, rather use a VPN tunnel to access it.
# headless-xfce4
1. Clone repository on a system with docker
2. Change directory to cloned folder
3. Edit Dockerfile and change password for the VNC
4. Build image with:\
`docker build -t headless-xfce4:latest .`
5. Run image with:\
`docker run --name xfce4-vnc -d -p 5900:5900 headless-xfce4:latest .`
6. Use a VNC client to connect to your docker host
7. (Optional) Change resolution in the xfce4 display settings
8. (Optional) Make container always start using:\
`docker update --restart unless-stopped xfce4-vnc`
9. (Optional) Install themes and missing icons by opening a terminal in your VNC session and running:\
`apk add gnome-shell`
10. (Optional) Change your VNC password by running this inside your VNC session: (You'll be prompted for a new password)\
`x11vnc -storepasswd ~/.vnc/passwd`

![VNC client connected to a headless-xfce4 image running on docker](https://cdn.discord.digital/xfce4-docker)
