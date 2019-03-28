source ~/.aliases.sh
source ~/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle jump
antigen bundle subnixr/minimal


antigen apply

export EDITOR=vim
export BROWSER=firefox
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
