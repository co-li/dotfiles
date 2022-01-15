#!/bin/bash

xrandr --output DP-3 --auto --output eDP-1 --auto --right-of DP-3
herbstclient detect_monitors
herbstclient list_monitors
