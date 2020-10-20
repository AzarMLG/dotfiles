HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

autoload -U colors && colors
PS1="%B%{$fg[yellow]%}[%{$fg[red]%}%n%{$fg[yellow]%}@%{$fg[green]%}%M %{$fg[magenta]%}%~%{$fg[yellow]%}]%{$reset_color%}$%b "

setopt autocd extendedglob nomatch
unsetopt beep notify

# Autocomplete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Include hidden files in autocomplete:
_comp_options+=(globdots)

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[1 q' ;}

# ALIASES
# Basic stuff
alias ls='ls --color=auto --group-directories-first'
alias df="df -h"
alias grep="grep --colour=auto"
alias diff="diff --color=auto"
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -v"
alias du="du -h"
alias dd="dd status=progress"
alias free="free -h"

alias sudo="sudo "                                               # Pass aliases to sudo

alias bat="cat /sys/class/power_supply/BAT?/capacity"            # Battery capacity 
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"    # Update GRUB configuration

# Uncomment if Arch based
alias purge="sudo pacman -Rns"                                   # Remove packages
alias update="yay -Syu"                                          # Update packages
alias inst="yay -Sy"                                             # Install packages
alias autoremove="yay -Yc"                                       # Remove orphan packages
                                                                 # List packages by size
alias pkgsize="LC_ALL=C pacman -Qi | awk '/^Name/{name=\$3} /^Installed Size/{print \$4\$5, name}' | sort -h"

# Uncomment if Debian based
#alias purge="sudo apt purge"                                     # Remove packages
#alias update="sudo apt update && sudo apt update"                # Update packages
#alias inst="sudo apt install"                                    # Install packages
#alias autoremove="sudo apt autoremove"                           # Remove orphan packages

alias poweroff="systemctl poweroff"                              # Poweroff
alias reboot="systemctl reboot"                                  # Reboot
alias suspend="systemctl suspend"                                # Suspend 
alias hibernate="systemctl hibernate"                            # Hibernate

alias bc="bc -ql"                                                # Run bc without welcome msg
alias rnm="sudo systemctl restart NetworkManager"                # Restart Network Manager
alias caps="remaps"                                              # Map capslock as esc

alias google=googler                                             # Google search CLI
alias corona="curl -s https://corona-stats.online"               # Coronavius stats
                                                                 # Corona in Belarus
alias coronab='curl -s https://corona-stats.online/belarus | grep -e Country -e Belarus -e ═ -e ─ -e World --color=no' 
alias weather="curl wttr.in"                                     # Show weather forecast

# DEPRICATED ALIASES
#alias more=less
#alias ls="lsd --group-dirs=first"
#alias df=pydf
#alias startx="startx ~/.xinitrc"
#alias gpuon="sudo tee /proc/acpi/bbswitch <<<ON"                 # Turn on nvidia GPU
#alias gpuoff="sudo tee /proc/acpi/bbswitch <<<OFF"               # Turn off nvidia GPU
#alias gpulist="lspci -k | grep -A 2 -E '(VGA|3D)'"               # List GPUs
#alias gcstart="gcloud compute instances start gc-debian"         # Start gcloud instance
#alias gcstop="gcloud compute instances stop gc-debian"           # Stop gcloud instance
#alias gclist="gcloud compute instances list"                     # List gcloud instances
#alias zc="'$EDITOR' ~/.zshrc"                                    # zsh config
#alias xc="'$EDITOR' ~/.xinitrc"                                  # xrun config
#alias sc="'$EDITOR' ~/.config/sxhkd/dwmsxhkdrc"                  # sxhkd config
#alias pc="'$EDITOR' ~/.config/polybar/config"                    # polybar config
#alias bsc="'$EDITOR' ~/.config/bspwm/bspwmrc"                    # bspwm config


# This is a function to automatically change the directory to
# the last visited one after ranger quits.
# To undo the effect of this function, you can type "cd -" to return to the
# original directory.
function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}
# This binds Ctrl-O to ranger-cd:
bindkey -s '^o' 'ranger-cd\n'

# Tetris блэт
autoload -Uz tetriscurses

# Load zsh-syntax-highlighting; should be last.
# If Arch based:
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# If Debian Based:
#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null