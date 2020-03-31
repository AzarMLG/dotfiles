#!/bin/sh
session=${1:-bspwm}
gpu=${2:-nvidia}

case $gpu in
    nvidia )
        #Enable NVIDIA GPU 
        xrandr --setprovideroutputsource modesetting NVIDIA-0 
        xrandr --auto 
        xrandr --dpi 96
    ;;
    intel )
        echo "running on iGPU"
    ;;
esac 

case $session in
    bspwm )
        #Fix for Java
        export AWT_TOOLKIT=MToolkit

        #Session lock
        xautolock -time 10 -locker lock -killtime 40 -killer suspend -notify 10 -notifier "notify-send 'Locking' 'In 10 seconds'" -corners 0-00 & 

        # Set wallpaper
        feh --bg-fill ~/wall.jpg & 

        #Launching apps
        sxhkd &                                 # Simple X hotkey daemon
        dunst &                                 # Notifications
        
        xsetroot -cursor_name left_ptr &        # Change X shaped default cursor
        setxkbmap -layout us,ru &               # Keyboard layouts

        yandex-disk &                           # Yandex disk daemon
        yandex-disk-indicator &                 # And system tray for it

        redshift-gtk &                          # Redshift system tray
        unclutter &                             # Remove mouse when idle

        xrdb ~/.Xresources &                    # Load Xresources
        xcompmgr -c &                           # Transparency

        updatecheck &                           # Pacman & AUR notification updates

        /usr/lib/kdeconnectd &                  # KDE Connect daemon

        ~/.local/bin/keyremap &                 # Remap capslock to esc & disable numlock         
        numlockx &                              # Enable numlock keypad just in case

        exec bspwm 
    ;;
    dwm )
        #Session lock
        xautolock -time 10 -locker lock -killtime 40 -killer suspend -notify 10 -notifier "notify-send 'Locking' 'In 10 seconds'" -corners 0-00 & 

        setbg ~/Pictures/wallpapers &           # Set wallpaper
     
        dunst &                                 # Notifications
        sxhkd -c ~/.config/sxhkd/dwmsxhkdrc &   # Simple X hotkey daemon
        xsetroot -cursor_name left_ptr &        # Change X shaped default cursor
        setxkbmap -layout us,ru &               # Keyboard layouts

        yandex-disk &                           # Yandex disk daemon
        yandex-disk-indicator &                 # And system tray for it

        redshift-gtk &                          # Redshift system tray
        unclutter &                             # Remove mouse when idle

        cbatticon &                             # Battery indicator
        nm-applet &                             # Network indicator 
        status &                                # dwm status bar

        xrdb ~/.Xresources &                    # Load Xresources
        xcompmgr -c &                           # Transparency

        updatecheck &                           # Pacman & AUR notification updates
        /usr/lib/kdeconnectd &                  # KDE Connect daemon
        #play-with-mpv &                        # Play youtube videos in mpv browser extension
        telegram-desktop &                      

        remaps & 
        numlockx &                              # Enable numlock keypad just in case
        
        exec dwm
    ;;
    gnome )
        export XDG_SESSION_TYPE=x11
        export GDK_BACKEND=x11
        exec gnome-session
    ;;
esac
