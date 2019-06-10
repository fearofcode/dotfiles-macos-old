# some dotfiles

These files can give you a simple, text-oriented programming environment featuring:

* <a href="https://i3wm.org/">i3 window manager</a> (if on Arch or Ubuntu)
* <a href="http://fishshell.com/">fish shell</a>
* <a href="https://github.com/jwilm/alacritty">Alacritty terminal</a>
* vim with a bunch of plugins added that give you autocomplete for Rust, Go and Python
* Other stuff I use at work and at home, like PostgreSQL (see scripts for details)

Here is a sample session showing a web browser, a copy of <a
href="https://github.com/fearofcode/arete">arete</a>, a shell, vim, and a copy of <a
href="https://github.com/fearofcode/pyrepl">pyrepl</a> running:

<img src="https://raw.githubusercontent.com/fearofcode/shared/master/dotfiles.png" alt="Simple i3 terminal session using these dotfiles.">

Notice the border around the active and inactive windows. Little features like this are
intended to make this a lightweight, distraction-free environment that is still functional
and usable.

The lack of wallpaper, transparency, elaborate bar widgets showing things that are
unlikely to be at an abnormal level or change significantly anytime soon such as free disk
space, and other standard <a href="https://www.reddit.com/r/unixporn/">Unix desktop
customization tropes</a> is very much intentional.

To get something that looks like this, run the appropriate script:

- `new_linux_machine_setup_arch.sh` on Arch, which will give you <a href="https://github.com/Airblader/i3">i3-gaps</a>
    rather than vanilla i3
- `new_linux_machine_setup_ubuntu.sh` on Ubuntu. The result will mostly resemble the
    screenshot but will just have vanilla i3.
- `new_mac_machine_setup.sh` (doesn't give you i3)
