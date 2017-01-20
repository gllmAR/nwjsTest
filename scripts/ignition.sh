#!/bin/bash
mission=$(cat /home/artificiel/.config/mission.conf)

xset s off -dpms
unclutter -grab &
sudo systemctl daemon-reload
sudo systemctl start x0vncserver
sudo systemctl start $mission
exec i3
