#!/bin/bash

help(){
  echo "argument format:"
  echo "neighbourhoodReplace.pl {document.txt} {correctSpelling.txt} {threshold} {output.txt}"
  echo "where:"
  echo "{document.txt}        is the file you which to perform the corrections on."
  echo "{correctSpelling.txt} is a file with words (line delimited) spelled correctly"
  echo "{threshold}           is a positive integer indicating how close a neighbour to replace"
}
neighbourhoodSearch(){
  if [ ! -f $1 ] || [ ! -f $2 ]; then
    echo "Missing arguments" && help
    exit;
  fi

  #cat $2 | tr '\n' '\0' | xargs -0 -n1  echo
  #cat $2 | tr '\n' '\0' | xargs -0 -n1  echo
  #<$2 xargs -I % echo %
  #xargs -i -0 -a "$2" -d "\n" -n$3 -P4 echo '"{}"' && agrep -w -1 -i '"{}"' $1
  # attempt regex     (^[0-9]).*
  # attempt two regex (^ *([0-9]|\.)*\w+ )
  # sed 's/^ *[0-9]\w\+ //g' $2 `# remove initial numbers` \
  sed 's/^\(\( \|\.\)*\([0-9]\|[0-9]\+\.\)\w\+ \+\)\+//g' $2 `# remove initial numbers` \
  | tr -d '[:punct:]' `# remove punctuation` \
  | tr '[:upper:]' '[:lower:]' `# make all lowercase` \
  | awk '!a[$0]++' `# remove duplicates` \
  > tempfile.txt;

  #| xargs -i -0 -d "\n" -n$3 -P4 agrep -w -1 -i '"{}"' $1
  agrep -w -1 -i -f tempfile.txt $1;
  less tempfile.txt;
  #rm tempfile.txt;


  # doesnt work  | cut -c 1-30 `# take only first 30 characters` \
}
neighbourhoodSearch $@
