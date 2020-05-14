IMP="$d/important"
alias imp="cd $IMP"
alias gpp=g++
alias atc="cd $d/codes/at_coder"
alias cod="cd $d/codes/coding_memo"
alias res="cd $d/research/research_project"
alias summary="cd $d/research/research_project/summary"
alias book="cd $d/research/research_project/summary/book"
alias paper="cd $d/research/research_project/summary/paper"
alias vimemo="vi $IMP/vimemo.md"
alias sim="open -a Simulator"
alias class='cd $d/class'
alias pro='cd $d/projects'

function makec(){
  cp -i $d/useful/ccc.c $PWD/$*.c;
  vim $PWD/$*.c;
}

function gp(){
  f_name=$*
  output_file="${f_name}.out"
  g++ -o $output_file "${f_name}.cpp"
  ./$output_file
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

function makecpp(){
  cp -i $d/useful/ccc.cpp $PWD/$*.cpp;
  vim $PWD/$*.cpp;
}