# some dotfiles

These files can give you a simple, text-oriented programming environment featuring:

* <a href="https://i3wm.org/">i3 window manager</a> (if on Arch)
* <a href="http://fishshell.com/">fish shell</a>
* xterm, or the terminal of your choice. xterm is actually highly customizable! The
    default colors and font can be easily overridden. See <a
    href="https://github.com/fearofcode/shared/blob/master/.Xresources">the
    .Xresources</a> file to see how this is done.
* vim with a bunch of plugins added that give you autocomplete for Rust, Go and Python
* Other stuff I use at work and at home, like PostgreSQL (see scripts for details)

Here is a sample session showing a web browser, a copy of <a
href="https://github.com/fearofcode/arete">arete</a>, a shell, vim, and a copy of <a
href="https://github.com/fearofcode/pyrepl">pyrepl</a> running:

<img src="https://raw.githubusercontent.com/fearofcode/shared/master/2019-06-16-151656_5120x1440_scrot.png" alt="Simple i3 session using these dotfiles.">

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
