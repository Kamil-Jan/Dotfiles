# Powerlevel10k theme
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
ZSH_THEME="powerlevel10k/powerlevel10k"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Path settings
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/home/kamil/.oh-my-zsh"

# Plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# General
export EDITOR=/usr/bin/nvim
source $ZSH/oh-my-zsh.sh

# Key bindings
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode

# Fzf
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --depth 10 --ignore .git -f -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# zsh-autosuggestions
bindkey '^ ' autosuggest-accept

# Anaconda
__conda_setup="$('/home/kamil/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kamil/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kamil/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kamil/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

