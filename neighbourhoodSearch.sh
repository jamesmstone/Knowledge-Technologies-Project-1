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
  #sed 's/^\(\( \|\.\)*\([0-9]\|[0-9]\+\.\)\w\+ \+\)\+//g' $2 `# remove initial numbers` \
  sed -r 's/[^[:space:]]*[0-9][^[:space:]]* ?//g' $2 `# remove words with numbers from http://stackoverflow.com/a/39113175/1432051` \
  | awk '!a[$0]++' `# remove duplicates` \
  | xargs -i -0 -d "\n" -n1 -P4 agrep -w -n -$3 -i '"{}"' $1 2>/dev/null \
  | sort -u

  #| tr -d '[:punct:]' `# remove punctuation` \
  # | tr '[:upper:]' '[:lower:]' `# make all lowercase` \
  #| awk '!a[$0]++' `# remove duplicates` \
  #| xargs -i -0 -d "\n" -n$3 -P4 agrep -w -1 -i '"{}"' $1
  # agrep -w -1 -i -f tempfile.txt $1;

  #| tr -d '[:blank:]' `# remove whitespace` \
  #| sed '/^$/d' `# trim` \

  # doesnt work  | cut -c 1-30 `# take only first 30 characters` \
}
neighbourhoodSearch $@
