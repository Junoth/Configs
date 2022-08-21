# if oh-my-zsh not installed, install at first
if [[ ! -d $HOME/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

alias vi='nvim'
alias vim='nvim'
alias tnew='tmux new -s'
alias gitl='git log --all --graph --decorate'
alias tf='terraform'

source $ZSH/oh-my-zsh.sh

# install zplug, plugin manager for zsh, https://github.com/zplug/zplug
# curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
# zplug configruation
if [[ ! -d "${ZPLUG_HOME}" ]]; then
  if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    # If we can't get zplug, it'll be a very sobering shell experience. To at
    # least complete the sourcing of this file, we'll define an always-false
    # returning zplug function.
    if [[ $? != 0 ]]; then
      function zplug() {
        return 1
      }
    fi
  fi
  export ZPLUG_HOME=~/.zplug
fi
if [[ -d "${ZPLUG_HOME}" ]]; then
  source "${ZPLUG_HOME}/init.zsh"
fi
zplug 'plugins/git', from:oh-my-zsh, if:'which git'
zplug "plugins/vi-mode", from:oh-my-zsh
zplug 'zsh-users/zsh-completions', defer:2
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'softmoth/zsh-vim-mode'
zplug 'zsh-users/zsh-autosuggestions'

if ! zplug check; then
  zplug install
fi

zplug load

# fzf config, must "sudo pacman -S fzf" first
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# install npm and run 'npm install --global pure-prompt' at first
# pure theme
autoload -U promptinit; promptinit
prompt pure
