IMP="$d/important"
alias gpp=g++
alias res="cd $d/research/research_project"
alias summary="cd $d/research/research_project/summary"
alias book="cd $d/research/research_project/summary/book"
alias paper="cd $d/research/research_project/summary/paper"
alias sim="open -a Simulator"
alias pro='cd $d/projects'

function makec(){
  cp -i $d/useful/ccc.c $PWD/$*.c;
  vim $PWD/$*.c;
}

function gp(){
  f_name=$*
  output_file="${f_name}.out"
  out="$PWD/out"
  if [ ! -d $out ]; then
    mkdir out
  fi
  g++ -o $PWD/out/$output_file "${f_name}.cpp"
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
