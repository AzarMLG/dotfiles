#!/bin/sh
session=${1:-dwm}
gpu=${2:-nvidia}

case $gpu in
    nvidia )
        xrandr --setprovideroutputsource modesetting NVIDIA-0 
        xrandr --auto 
        xrandr --dpi 96
    ;;
    intel )
        echo "running on iGPU"
    ;;
esac 

#Fix for Java
export AWT_TOOLKIT=MToolkit

case $session in
    dwm )
        chbg &                                  # Set random background & lockscreen images

        sxhkd -c ~/.config/sxhkd/dwmsxhkdrc &   # Simple X hotkey daemon
        xsetroot -cursor_name left_ptr &        # Change X shaped default cursor
        setxkbmap -layout us,ru &               # Keyboard layouts

        xrdb ~/.Xresources &                    # Load Xresources
        xcompmgr -c &                           # Transparency

        dunst &                                 # Notifications
        yandex-disk &                           # Yandex disk daemon
        yandex-disk-indicator &                 # And system tray for it
        redshift &                              # Redshift 
        cbatticon &                             # Battery indicator
        nm-applet &                             # Network indicator 
        status &                                # dwm status bar
        unclutter &                             # Remove mouse when idle

        x0vncserver -rfbauth ~/.vnc/passwd &    # VNC server

        remaps &                                # Remap some keys
        numlockx &                              # Enable numlock keypad just in case
        
        exec dwm
    ;;
esac
