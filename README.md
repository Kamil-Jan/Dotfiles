# Default shell

Zsh is my default shell. To select it run `chsh -s $(which zsh)`

# [i3-gaps](https://github.com/Airblader/i3) - windows manager

Run `sudo pacman -S i3-gaps` to install. For dmenu (dynamic menu) run `sudo pacman -S dmenu`

For wallpapers you need to install feh. Run `sudo pacman -S feh`

For changing screen brightness light is needed. Run `sudo pacman -S light lightdm`. Add user to the video group `usermod -a -G video <user>`. To allow users in the video group to change the brightness, a udev rule such as the following can be used:

```
/etc/udev/rules.d/backlight.rules
-------------------
ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="<kernel>", RUN+="/bin/chgrp video /sys/class/backlight/%k/brightness"
ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="<kernel>", RUN+="/bin/chmod g+w /sys/class/backlight/%k/brightness"
```

To find out kernel run `ls /sys/class/backlight/`.

# [Polybar](https://github.com/polybar/polybar) - status bar

Run `sudo pacman -S polybar` to install. Change permissions of launch.sh. Run `chmod +x ~/.config/polybar/launch.sh`

# [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - zsh color scheme.

Run `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k` to install

# [Fzf](https://github.com/junegunn/fzf) - fuzzy finder

It's an interactive Unix filter for command-line that can be used with any list; files, command history, processes, hostnames, bookmarks, git commits, etc.
Run `sudo pacman -S fzf` to install

# [Neovim](https://github.com/neovim/neovim) - text editor

Run `sudo pacman -S neovim` to install. Then run `:PlugInstall` inside neovim to install plugins
- Coc-extensions. Run `:CocInstall *extension*` to install.
    + coc-vimtex
    + coc-python
    + coc-clangd

# [Alacritty](https://github.com/alacritty/alacritty) - terminal emulator
Run `sudo pacman -S alacritty` to install

# [Ranger](https://github.com/ranger/ranger) - file manager

Run `sudo pacman -S ranger` to install

# [Anaconda](https://www.anaconda.com/) - package management

Anaconda is a free and open-source distribution of the Python and R programming languages for scientific computing (data science, machine learning applications, large-scale data processing, predictive analytics, etc.), that aims to simplify package management and deployment

