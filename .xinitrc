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
		#xautolock -time 5 -locker lock -killtime 40 -killer suspend -notify 10 -notifier "notify-send 'Locking' 'In 10 seconds'" -corners 0-00 & 
		
		# Set wallpaper
		feh --bg-fill ~/Pictures/wallpaper.jpg & 
		
		#Lauching apps
		sxhkd &					# Simple X hotkey daemon
		yandex-disk &				# Sync to yd
		yandex-disk-indicator &			# And system tray for it
		redshift-gtk &				# Redshift system tray
		unclutter &				# Remove mouse when idle
		xrdb ~/.Xresources &			# Load Xresources
		xsetroot -cursor_name left_ptr &	# Change X shaped default cursor
		dunst &					# Notifications
		setxkbmap -layout us,ru &		# Keyboard layouts
		xcompmgr -c &				# Transparency
		updatecheck &				# Check Pacman updates
		setxkbmap -option caps:escape &		# Map capslock as esc
		numlockx & 				# Enable numlock
		exec bspwm 
		setxkbmap -option caps:escape 		# Map capslock as esc

	;;
	gnome )
		export XDG_SESSION_TYPE=x11
		export GDK_BACKEND=x11
		exec gnome-session
	;;
esac


