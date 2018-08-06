#!/bin/sh

export DISPLAY=:0
Xvfb :0 -screen 0 $DECONZ_VNC_SCREEN &
x11vnc -passwd $DECONZ_VNC_PASSWORD -display :0 -rfbport $DECONZ_VNC_PORT -forever &

/usr/bin/deCONZ \
    --auto-connect=1 \
    --dbg-info=$DEBUG_INFO \
    --dbg-aps=$DEBUG_APS \
    --dbg-zcl=$DEBUG_ZCL \
    --dbg-zdp=$DEBUG_ZDP \
    --dbg-otau=$DEBUG_OTAU \
    --http-port=$DECONZ_WEB_PORT \
    --ws-port=$DECONZ_WS_PORT
