#!/bin/sh
#Fix for Java
export AWT_TOOLKIT=MToolkit
                                        # Load Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

sxhkd -c ~/.config/sxhkd/sxhkdrc &      # Simple X hotkey daemon
xsetroot -cursor_name left_ptr &        # Change X shaped default cursor
setxkbmap -layout us,ru &               # Keyboard layouts

dunst &                                 # Notifications
status &                                # dwm status bar
unclutter &                             # Remove mouse when idle

remaps &                                # Remap some keys
numlockx &                              # Enable numlock keypad just in case

exec dwm
