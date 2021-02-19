local_secret=~/.secret.zsh
[ -e $local_secret ] && source $local_secret

export PATH=~/.local/bin:"$PATH"
