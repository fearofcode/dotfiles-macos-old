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

<img src="https://raw.githubusercontent.com/fearofcode/shared/master/2019-06-23-035157_5120x1440_scrot.png" alt="Simple i3 session using these dotfiles.">

The intent is to have something modern but simple. It's intended to be attractive but not
distracting.

The lack of wallpaper, transparency, elaborate bar widgets showing metrics that are
unlikely to be at an abnormal level or change significantly anytime soon, such as free disk
space, and other standard Unix desktop customization tropes is intentional. Of course I
approve of adding things that are actually useful: if I used Arch on a machine that used
wifi, I would definitely add a widget for wifi connection status, for instance.

To get something that looks like this, run the appropriate script:

- `arch_base_setup.sh` on Arch, which will give you <a href="https://github.com/Airblader/i3">i3-gaps</a>
    rather than vanilla i3. Note that this will install other things you may not want,
    like NVIDIA drivers if NVIDIA hardware is installed. Look over the script before
    running it.
- `new_mac_machine_setup.sh` (doesn't give you i3)

## Todo

- I had previously tried to maintain setup for both Arch and Ubuntu but it was painful.
- The scripts are not idempotent right now and assume a mostly empty machine. 
