# Profile file. Runs on login. Environmental variables are set here.

# Add ~/.local/bin to PATH
export PATH="${PATH}:${HOME}/.local/bin:${HOME}/.local/shortcuts"

# Default programs:
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="brave"
export FILE="ranger"
export READER="zathura"

# Start X on tty1 
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && startx

# Switch escape and caps if tty and no passwd required:
sudo -n loadkeys ~/.local/share/larbs/ttymaps.kmap 2>/dev/null
