#!/bin/bash

build_pdf(){
  docker pull blang/latex;
  docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$(pwd)/report":/data blang/latex xelatex -interaction=nonstopmode report.tex || true; test -e report/report.pdf && echo "pdf generated"; #  change fail condition to not having a pdf generated
  cat report/report.log;
}

build_tweets_ouput(){
  ./neighbourhoodSearch.sh ./tweets/stone1_tweets_small.txt ./geonames/US-loc-names.txt 2  > output.txt;
  cat output.txt;
}

build_pdf &
build_tweets_ouput &
wait $(jobs -p);
