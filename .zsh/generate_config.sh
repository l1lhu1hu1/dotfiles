local_path=~/dotfiles/.zsh/.$(scutil --get ComputerName)_path.zsh
local_alias=~/dotfiles/.zsh/.$(scutil --get ComputerName)_aliases.zsh

touch $local_path
touch $local_alias

echo created $local_path
echo created $local_alias

