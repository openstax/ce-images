FROM openstax/python3-chrome-base:latest
LABEL authors=OpenStaxCE

USER root

#==============================
# Scripts to run Xvfb
#==============================
COPY entry_point.sh \
    /opt/bin/

#==============
# Xvfb
#==============
RUN apt-get update -qqy \
  && apt-get -qqy install \
    xvfb \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

#=====
# VNC
#=====
RUN apt-get update -qqy \
  && apt-get -qqy install \
  x11vnc \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

#=========
# fluxbox
# A fast, lightweight and responsive window manager
#=========
RUN apt-get update -qqy \
  && apt-get -qqy install \
    fluxbox \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

#============================
# Some configuration options
#============================
ENV SCREEN_WIDTH 1360
ENV SCREEN_HEIGHT 1020
ENV SCREEN_DEPTH 24
ENV DISPLAY :99.0

#==============================
# Generating the VNC password as ceuser
# So the service can be started with ceuser
#==============================

USER ceuser

RUN mkdir -p ~/.vnc \
  && x11vnc -storepasswd secret ~/.vnc/passwd \
  && chown ceuser:ceuser ~/.vnc

EXPOSE 5900

ENTRYPOINT ["/opt/bin/entry_point.sh"]
