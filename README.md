# [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
Run `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` to install
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) color scheme.

    Run `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k` to install

- [fzf](https://github.com/junegunn/fzf)

    Run `sudo pacman -S fzf` to install

- [Anaconda](https://www.anaconda.com/)

# [Neovim](https://github.com/neovim/neovim)
Run `sudo pacman -S neovim` to install. Then run `:PlugInstall` inside neovim to install plugins
- Coc-extensions. Run `:CocInstall *extension*` to install.
    + coc-vimtex
    + coc-python
    + coc-clangd

# [Alacritty](https://github.com/alacritty/alacritty) terminal emulator
Run `sudo pacman -S alacritty` to install

# [Ranger](https://github.com/ranger/ranger)
Run `sudo pacman -S ranger` to install
