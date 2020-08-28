# Default shell

Zsh is my default shell. To select it run `chsh -s $(which zsh)`

# [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - color scheme.

Run `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k` to install

# [Fzf](https://github.com/junegunn/fzf) - fuzzy finder

It's an interactive Unix filter for command-line that can be used with any list; files, command history, processes, hostnames, bookmarks, git commits, etc.
Run `sudo pacman -S fzf` to install

# [Anaconda](https://www.anaconda.com/) - package management

Anaconda is a free and open-source distribution of the Python and R programming languages for scientific computing (data science, machine learning applications, large-scale data processing, predictive analytics, etc.), that aims to simplify package management and deployment

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

