FROM        perl:latest
MAINTAINER  James Stone

RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm String::Approx

CMD perl neighbourhoodReplace.pl
