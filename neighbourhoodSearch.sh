#!/bin/bash

help(){
  echo "argument format:"
  echo "neighbourhoodSearch {document.txt} {correctSpelling.txt} {threshold} {output.txt}"
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

pv $2 \
| sed -r 's/[^[:space:]]*[0-9][^[:space:]]* ?//g' `# remove words with numbers from http://stackoverflow.com/a/39113175/1432051` \
| tr -d '[:punct:]' `# remove punctuation` \
| tr '-' ' ' \
| tr '/' ' ' \
| tr ' ' ' ' \
| awk '{print tolower($0)}' \
| `# remove word numbers` awk '!/hundred/' | awk '!/thousand/' \
| awk '!a[$0]++' `# remove duplicates` \
| cut -c 1-20  `# only keep first 20 characters` \
| awk 'length > 4' `# only keep lines longer than 4` \
| xargs -i -0 -I % -d "\n" -n1 -P1 sh -c "echo \"%\" 1>&2 && agrep -w -n -$3 -i '\"%\"' $1  |  sed 's/$/ Location: % /' " \
| sort -u
}
neighbourhoodSearch $@
