# Profile file. Runs on login.

export PATH="${PATH}:${HOME}/.local/bin:${HOME}/.local/shortcuts"

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"
export FILE="ranger"
export READER="zathura"

# Start X on tty1 
#[ "$(tty)" = "/dev/tty1" ] && ~/.local/bin/start

# Switch escape and caps if tty and no passwd required:
sudo -n loadkeys ~/.local/share/ttymaps.kmap 2>/dev/null
