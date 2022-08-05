FROM openstax/ubuntu-20.04:latest

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
# Scripts to run Xvfb
#==============================
COPY ./entry_point.sh \
    /opt/bin/   

USER ceuser

RUN mkdir -p ~/.vnc \
  && x11vnc -storepasswd secret ~/.vnc/passwd \
  && sudo chown ceuser:ceuser ~/.vnc \
  && sudo chown ceuser:ceuser /opt/bin/entry_point.sh

EXPOSE 5900

ENTRYPOINT ["/opt/bin/entry_point.sh"]
