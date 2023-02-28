# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# myalias
alias vi='nvim'
alias vim='nvim'
alias tnew='tmux new -s'
alias gitl='git log --all --graph --decorate'
alias tf='terraform'
alias zshrc='vim ~/.zshrc'
alias zshrcs='source ~/.zshrc'
alias vimrc='vim ~/.config/nvim/init.vim'
alias vimrcs='source ~/.config/nvim/init.vim'
alias tmuxrc='vim ~/.tmux.conf'
alias tmuxrcs='source ~/.tmux.conf'
alias g++='g++ -std=c++17 -Wall'

# yuhangmiao:password
alias postgres='psql postgres'

export TERM=xterm-256color

ZSH_THEME=""
ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

# brew install pure
autoload -U promptinit; promptinit
prompt pure

# open vscode from terminal
function code {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

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
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions', defer:2
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'softmoth/zsh-vim-mode'

if ! zplug check; then
  zplug install
fi

zplug load

# fzf config, must "brew install fzf" first
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#export GOPATH=$HOME/go
export PATH=/usr/local/texlive/2021/bin/universal-darwin:$PATH
#export PATH="$GOPATH/bin:$PATH"

# java version
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_301)

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
