d="/Users/$(whoami)/Desktop/"
alias rgr='rg --hidden'
alias r=reset
alias c=clear
alias chb='chsh -s /bin/bash'
alias chz='chsh -s /bin/zsh'
alias cra='create-react-app'
alias desk='cd $d'
alias ee=exit
alias vim=nvim
alias vi=nvim
alias bashrc='vim ~/.bashrc'
alias vimrc='vi ~/dotfiles/.vim/init.vim'
alias zshrc='vim ~/dotfiles/.zsh/.zshrc'
alias aliases='vim ~/dotfiles/.zsh/.aliases.zsh'
alias dot='cd ~/dotfiles'
alias g=open -a
alias ll='ls -alF'
alias la='ls -a'
alias l='ls -F'
alias sl=ls
alias rg='rg --hidden'
alias rm='echo "This is not the command you are looking for."; false'
alias Crun="cargo run"
alias Cnew="cargo new"
alias py="python3"

function mkfile() {
  mkdir -p -- "$1" && touch -- "$1"/"$2"
  vim $1/$2
}

function Cgn() {
  Cnew "$1" && touch -- "$1"/".gitignore"
  echo "/target" >> $1/.gitignore
}

function gtop(){
  cd $(git rev-parse --show-toplevel)
}

function gpusoc(){
  git push origin $(git symbolic-ref --short HEAD)
}

function gpusocf(){
  git push -f origin $(git symbolic-ref --short HEAD)
}

function gd(){
  current_dir=$PWD
  gtop
  git diff
  cd $current_dir
}

function gcm() {
  git commit -m "$*"
}

function gcma() {
  git commit --amend -m "$*"
}

function gitadd() {
  gtop
  [ -e $PWD/Session.vim ] && echo "This is not the command you are looking for."
  false $PWD/Session.vim
  git add .
  cd -
}

alias gbr="git branch --sort=-committerdate --format='%(authordate:short) %(color:red)%(objectname:short) %(color:yellow)%(refname:short)%(color:reset) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias gl="git log --graph --pretty=format:'%C(yellow)%h%Creset %s %Cgreen(%an)%Creset %Cred%d%Creset'"
alias gpul="git pull"
alias gpuso="git push origin"
alias gs="tig status"
alias gch="git checkout"
alias gchm="git checkout master"
alias gchb="git checkout -b"
alias ga=gitadd

alias cd1='cd ..'
alias cd2='cd ../..'
alias cd3='cd ../../..'
alias dok="docker"
alias cp="cp -i"
alias mv="mv -i"
alias cpf="yes | cp"
