alias pro="cd ~/projects"
alias res="cd ~/projects/research-project"

alias gpp="g++ -std=c++11"
alias minc="g /Applications/Minecraft.app/Contents/MacOS/launcher"

alias cat=bat
alias trash-rm='echo "This is not the command you are looking for."; false'
alias tra-p='trash-put'
alias tra-ls='trash-list'
alias tra-res='trash-restore'
alias tra-emp='trash-empty'
alias git=hub

# TODO $1に変えたら?
function makec(){
  cp -i $d/useful/ccc.c $PWD/$*.c;
  vim $PWD/$*.c;
}
# TODO CPP用の設定ファイルに切り出したら?
# TODO $1に変えたら?
function gp(){
  f_name=$*
  # cpp拡張子を取り除いている
  output_file="${f_name%.*}.out"
  out="$PWD/out"
  if [ ! -d $out ]; then
    mkdir out
  fi
  gpp -o $PWD/out/$output_file "${f_name}"
  ./out/$output_file
}

function cpcp(){
  cp ~/dotfiles/library/.clang-format $PWD
}

function mkc(){
  cur=$PWD/.clang-format
  par="$(dirname "$PWD")/.clang-format"
  if [ ! -f $cur ]; then
    if [ ! -f $par ]; then
      $(cpcp)
    fi
  fi
  cp -i ~/dotfiles/.vim/vim-templates/cpp/base-main.cpp $PWD/$*.cpp;
  vim $PWD/$*.cpp;
}

function makepmemo(){
  dir_name=$(basename $PWD)
  cp -i ~/dotfiles/utils/paper_memo_template.md $PWD/$dir_name.md;
  vim $PWD/$dir_name.md;
}

function makepdf() {
  uplatex $1
  dvi_file="${1%.*}.dvi"
  dvipdfmx "${dvi_file}"
}

alias pdf=dvipdfmx
