# i3-utils-bin

Binary utilities for a minimalistic [i3](https://github.com/i3/i3) setup.

---

**This repository is part of the [i3-utils](https://github.com/cytopia/i3-utils).** (See also [i3-utils-systemd](https://github.com/cytopia/i3-utils-systemd))

---

## Tools

#### System tools

| Tool | Description |
|------|-------------|
| [system-hibernate](bin/system-hibernate) | Wrapper script to hibternate as user. (systemd or dbus) |
| [system-reboot](bin/system-reboot)       | Wrapper script to reboot as user. (systemd or dbus)     |
| [system-shutdown](bin/system-shutdown)   | Wrapper script to shutdown as user. (systemd or dbus)   |
| [system-suspend](bin/system-suspend)     | Wrapper script to suspend as user. (systemd or dbus)    |

#### Hardware tools

| Tool | Description |
|------|-------------|
| [xf86-audio](bin/xf86-audio)             | Increase, decrease and mute currently selected (active) audio device. Supports notifications. |
| [xf86-backlight](bin/xf86-backlight)     | Adjust your screens backlight. Supports notifications. |

#### X tools

| Tool | Description |
|------|-------------|
| [xcolorpick](bin/xcolorpick) | Zenity based RGB color picker for any pixel on your screen. |
| [xkiller](bin/xkiller)       | Wrapper for `xkill`. Xkill itself cannot be terminated when started from a hotkey. That is where `xkiller` comes into play. It can be terminated simply starting it again. (via hotkey, dunst, rofi or via the command line). |
| [xlock](bin/xlock)           | Wrapper for `i3lock` with blurred screenshot and optional custom overlay which will also suspend any notifications during lock and can be run in the background without locking the script itself, so that you can run another script afterwards (such as [system-suspend](bin/system-suspend)). |
| [xscreenshot](bin/xscreenshot) | Wrapper for `scrot`. |


## Integration

#### Requirements

* [amixer](https://linux.die.net/man/1/amixer)
* [convert](https://linux.die.net/man/1/convert)
* [grabc](http://www.muquit.com/muquit/software/grabc/grabc.html)
* [i3lock](https://github.com/i3/i3lock)
* [notify-send](https://man.cx/notify-send)
* [scrot](https://man.cx/scrot)
* [systemd](https://github.com/systemd/systemd) or [ibus](https://github.com/ibus/ibus)
* [xbacklight](https://linux.die.net/man/1/xbacklight)
* [xkill](https://linux.die.net/man/1/xkill)
* [zenity](https://github.com/GNOME/zenity)

#### Install

This will add binaries to `/usr/local/bin/`.

```bash
$ sudo make install
```

#### Uninstall

This will remove binaries from `/usr/local/bin/`.

```bash
$ sudo make uninstall
```

#### Example usage for i3

```bash
###
### System
###

set $mode_system System (l) lock, (e) logout, (s) suspend, (h) hibernate, (r) reboot, (p) poweroff
mode "$mode_system" {
	bindsym l exec --no-startup-id system-lock, mode "default"
	bindsym e exec --no-startup-id i3-msg exit, mode "default"
	bindsym s exec --no-startup-id "system-lock -b; system-suspend",   mode "default"
	bindsym h exec --no-startup-id "system-lock -b; system-hibernate", mode "default"
	bindsym r exec --no-startup-id system-reboot,    mode "default"
	bindsym p exec --no-startup-id system-shutdown,  mode "default"

	# Back to normal: Enter or Escape
	bindsym Return mode "default"
	bindsym Escape mode "default"
}


###
### Hardware
###

# Sreen Backlight brightness
bindsym XF86MonBrightnessUp   exec xf86-backlight -c up
bindsym XF86MonBrightnessDown exec xf86-backlight -c down

# Audio Volume
bindsym XF86AudioRaiseVolume  exec xf86-audio -D pulse -c up
bindsym XF86AudioLowerVolume  exec xf86-audio -D pulse -c down
bindsym XF86AudioMute         exec xf86-audio -D pulse -c toggle


###
### X Tools
###

# Screenshot (with multi monitors)
bindsym Print exec "xscreenshot -m multi"

# Screenshot (select rectangle)
bindsym $mod+Sys_Req exec "xscreenshot -m selection"

# Screenshot (active window)
bindsym $mod+Shift+Sys_Req exec "xscreenshot -m window"
```
