## About headless-xfce4
This docker image deploys an xfce4 desktop in a container with Alpine Linux.\
It can be used to do basic desktop stuff, however due to the nature of VNC it performs poorly on video playback.

You can install this for example on a VPS in a datacenter, and build an SSH tunnel to access a desktop on a remote machine.
# headless-xfce4
1. Clone repository on a system with docker
2. Change directory to cloned folder
3. Edit Dockerfile and change password for the VNC
4. (Optional) Change screen resolution by editing init.sh and replacing "1280x1024" with your prefered screen resolution
5. Build image with:\
`docker build -t headless-xfce4:latest .`
6. Run image with:\
`docker run --name xfce4-vnc -d -p 5900:5900 headless-xfce4:latest .`
7. Use a VNC client to connect to your docker host
8. (Optional) Make container always start using:\
`docker update --restart unless-stopped xfce4-vnc`
9. (Optional) Install themes and missing icons by opening a terminal in your VNC session and running:\
`apk add gnome-shell`

![VNC client connected to a headless-xfce4 image running on docker](https://cdn.discord.digital/xfce4-docker)
