export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="cloud"
plugins=(git)

alias la="ls -la"
alias ..="cd .."
alias ...="cd ../../"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH=$PATH:./node_modules/.bin
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=/usr/bin/python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh

source /usr/local/bin/virtualenvwrapper_lazy.sh
eval "$(pyenv init -)"
pyenv virtualenvwrapper

source $ZSH/oh-my-zsh.sh
