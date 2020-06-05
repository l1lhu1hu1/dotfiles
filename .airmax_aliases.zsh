IMP="$d/important"
alias gpp="g++ -std=c++11"
alias res="cd $d/research/research_project"
alias summary="cd $d/research/research_project/summary"
alias book="cd $d/research/research_project/summary/book"
alias paper="cd $d/research/research_project/summary/paper"
alias sim="open -a Simulator"
alias pro='cd $d/projects'

# TODO $1に変えたら?
function makec(){
  cp -i $d/useful/ccc.c $PWD/$*.c;
  vim $PWD/$*.c;
}

#1TODO $1に変えたら?
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

function makepmemo(){
  dir_name=$(basename $PWD)
  cp -i $IMP/for_papers/paper_memo_template.md $PWD/$dir_name.md;
  vim $PWD/$dir_name.md;
}

function makebmemo(){
  dir_name=$*
  cp -i $IMP/for_papers/book_memo_template.md $PWD/$dir_name.md;
  vim $PWD/$dir_name.md;
}

function cpcp(){
  cp ~/dotfiles/.clang-format $PWD
}

function mkc(){
  cur=$PWD/.clang-format
  par="$(dirname "$PWD")/.clang-format"
  if [ ! -f $cur ]; then
    if [ ! -f $par ]; then
      $(cpcp)
    fi
  fi
  cp -i ~/dotfiles/vim-templates/cpp/base-main.cpp $PWD/$*.cpp;
  vim $PWD/$*.cpp;
}
