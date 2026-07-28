# Applying the main xrandr suited changes (scaling at x1.15)

xrandr --output eDP-1 --mode 1366x768 --panning 1574x886 --scale 1.15226939x1.15364583

# This is where it get odd/complicated, sometimes the screen resolution is not applied correctly or not applied at all... 
# Note that "xrandr --fb" can be used alone to change the screen resolution on a normal situation... 
# Here we will be taking advantage of xrandr's "--fb" feature to make the config appliance stable and works every-time.

# The odd thing here is while re-applying the new resolution 1574x886 with "--fb" nothing happen, but 
# if we use use an unsupported resolution like 1574x884 (vs 1574x886) then xrandr force the resolution 
# to "reset itself" to the configured resolution (1574x886)... 

# In short just re-apply the setting with "--fb" and an unsupported resolution to force a reset.
# ("--fb" can be used alone here without re-applying everything)

#xrandr --fb 1574x884 
xrandr --fb 1574x884 --output eDP-1 --mode 1366x768 --panning 1574x886 --scale 1.15226939x1.15364583
