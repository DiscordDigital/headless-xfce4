# Download base image ubuntu 20.04
FROM alpine:3.13.5

# Setting default argument for password
ARG VNC_PASS=#0298Xj3N1

# Assigning arg to env
ENV VNC_PASS $VNC_PASS

# LABEL about the custom image
LABEL maintainer="support@discord.digital"
LABEL version="0.1"
LABEL description="Create a container that you can VNC into."

# Add scripts to appropriate folders
ADD init.sh /opt/scripts/init.sh
ADD start.sh /opt/scripts/start.sh

# Update APK repositories
RUN apk update

# Install required packages
RUN apk add bash x11vnc x11vnc-doc dbus-x11 xvfb xterm xorg-server xf86-video-dummy xdpyinfo xdpyinfo-doc ttf-dejavu xfce4 xfce4-terminal

# Initialize container
RUN bash /opt/scripts/init.sh

# Remove init script
RUN rm /opt/scripts/init.sh

# Setting password for vnc connection
RUN mkdir -p ~/.vnc/
RUN x11vnc -storepasswd $VNC_PASS ~/.vnc/passwd

# Default execution option
ENTRYPOINT ["bash","/opt/scripts/start.sh"]
