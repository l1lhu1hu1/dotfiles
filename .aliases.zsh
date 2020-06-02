d="/Users/$(whoami)/Desktop/"
alias rgr='rg --hidden'
alias r=reset
alias chb='chsh -s /bin/bash'
alias chz='chsh -s /bin/zsh'
alias cra='create-react-app'
alias desk='cd $d'
alias ee=exit
alias vim=nvim
alias vi=nvim
alias bashrc='vim ~/.bashrc'
alias vimrc='vi ~/dotfiles/init.vim'
alias zshrc='vim ~/dotfiles/.zshrc'
alias vimcom='vim ~/dotfiles/.mycommand.vim'
alias aliases='vim ~/dotfiles/.aliases'
alias dot='cd ~/dotfiles'
alias g=open -a
alias ps=procs
alias cat=bat
alias ll='ls -alF'
alias la='ls -a'
alias l='ls -F'
alias sl=ls
alias rm=rmtrash

fucntion mkfile() {
  mkdir -p -- "$1" && touch -- "$1"/"$2"
  vim $1/$2
}

function input_pixela_date() {
  retval=$1
  return "$retval"
}

function input_pixela_count() {
  retval=$1
  return "$retval"
}

function register_to_pixela() {
  echo $1
  echo $2
  pi pixel post -u guanghuihui -g activity -d $1 -q $2
}

alias pixi='pi pixel increment -u guanghuihui -g activity'
alias pix="register_to_pixela $(date +%Y%m%d) $(input_pixela_count)"
alias pixy="register_to_pixela $(date -v '-1d' +%Y%m%d) $(input_pixela_count)"
alias pixinput="register_to_pixela $(input_pixela_date) $(input_pixela_count)"

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

function gitadd(){
  gtop
  [ -e $PWD/Session.vim ] && rm $PWD/Session.vim
  git add .
  cd -
}

alias git=hub
alias gcm="git commit -m"
alias gbr="git branch --sort=-committerdate --format='%(authordate:short) %(color:red)%(objectname:short) %(color:yellow)%(refname:short)%(color:reset) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias gl="git log --graph --pretty=format:'%C(yellow)%h%Creset %s %Cgreen(%an)%Creset %Cred%d%Creset'"
alias gre="git rebase"
alias gpul="git pull"
alias gpus="git push"
alias gpuso="git push origin"
alias gpusom="git push origin master"
alias gstat="tig status"
alias gstas="git stash --all"
alias gch="git checkout"
alias gchm="git checkout master"
alias gchb="git checkout -b"
alias ga=gitadd
alias gdif="git diff"

alias cd1='cd ..'
alias cd2='cd ../..'
alias cd3='cd ../../..'
alias dok="docker"
alias cp="cp -i"
alias mv="mv -i"
alias cpf="yes | cp"
