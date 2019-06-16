# some dotfiles

These files can give you a simple, text-oriented programming environment featuring:

* <a href="https://i3wm.org/">i3 window manager</a> (if on Arch)
* <a href="http://fishshell.com/">fish shell</a>
* xterm, or the terminal of your choice. xterm is actually highly customizable! The
    default colors and font can be easily overridden. See <a
    href="https://github.com/fearofcode/shared/blob/master/.Xresources">the
    .Xresources</a> file to see how this is done.
* vim with quite a few plugins, although I have given up trying to use it as an IDE

Here is a sample session showing some terminal sessions, Chrome, and <a
href="https://plugins.jetbrains.com/plugin/11938-one-dark-theme">IntelliJ with a One
Dark theme</a> installed:

<img src="https://raw.githubusercontent.com/fearofcode/shared/master/2019-06-16-151919_5120x1440_scrot.png" alt="Simple i3 session using these dotfiles.">

Notice the border around the active and inactive windows. Little features like this are
intended to make this a lightweight, distraction-free environment that is still functional
and usable.

The lack of wallpaper, transparency, elaborate bar widgets showing things that are
unlikely to be at an abnormal level or change significantly anytime soon such as free disk
space, and other standard Unix desktop customization tropes is intentional.

To get something that looks like this, run the appropriate script:

- `arch_base_setup.sh` on Arch, which will give you <a href="https://github.com/Airblader/i3">i3-gaps</a>
    rather than vanilla i3
- `new_mac_machine_setup.sh` (doesn't give you i3)

## Todo

- I had previously tried to maintain setup for both Arch and Ubuntu but it was painful.
- The scripts are not idempotent right now and assume a mostly empty machine. 
- The one dark vim theme doesn't match the rest of the system in console mode.
