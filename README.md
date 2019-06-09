# some dotfiles

These files can give you a simple, text-oriented programming environment featuring:

* <a href="https://i3wm.org/">i3 window manager</a> (if on Arch or Ubuntu)
* <a href="http://fishshell.com/">fish shell</a>
* <a href="https://github.com/jwilm/alacritty">Alacritty terminal</a>
* vim with a bunch of plugins added that give you autocomplete for Rust, Go and Python
* Other stuff I use at work and at home, like PostgreSQL (see scripts for details)

Here is a simple multi-monitor session showing the terminal, an editor, and a web browser on two monitors:

<img src="https://raw.githubusercontent.com/fearofcode/shared/master/dotfiles_2019_06_08.png" alt="Simple i3 terminal session using these dotfiles.">

To get something that looks like this, run the appropriate script:

- `new_linux_machine_setup_ubuntu.sh` on Ubuntu
- `new_linux_machine_setup_arch` on Arch, which will give you <a href="https://github.com/Airblader/i3">i3-gaps</a>
    rather than vanilla i3
- `new_mac_machine_setup.sh` (doesn't give you i3)
