#!/bin/bash
#
# IMPORTANT: Change this file only in directory standalone!

export GEOMETRY="$SCREEN_WIDTH""x""$SCREEN_HEIGHT""x""$SCREEN_DEPTH"

if [ ! -z $VNC_NO_PASSWORD ]; then
    echo "starting VNC server without password authentication"
    X11VNC_OPTS=
else
    X11VNC_OPTS=-usepw
fi

rm -f /tmp/.X*lock

for i in $(seq 1 10)
do
  xdpyinfo -display $DISPLAY >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    break
  fi
  echo Waiting xvfb...
  sleep 0.5
done

fluxbox -display $DISPLAY &

x11vnc $X11VNC_OPTS -forever -shared -rfbport 5900 -display $DISPLAY &
NODE_PID=$!

if [ -z "$@" ]; then
  wait $NODE_PID
else
  exec "$@"
fi
