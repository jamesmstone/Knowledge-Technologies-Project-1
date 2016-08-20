# Misspelled Location Names - Knowledge Technologies
Semester 2, 2016

James Stone 761353

[![Build Status](https://travis-ci.com/jamesmstone/Knowledge-Technologies-Project-1.svg?token=p8yLcFuVj6kMWC4pZF7s&branch=master)](https://travis-ci.com/jamesmstone/Knowledge-Technologies-Project-1)

## Report
A [PDF](https://github.com/jamesmstone/Knowledge-Technologies-Project-1/releases/latest) report, describing the process can be downloaded from the [Releases](https://github.com/jamesmstone/Knowledge-Technologies-Project-1/releases/latest) tab of the Github [repo](https://github.com/jamesmstone/Knowledge-Technologies-Project-1). Or from the LMS.

## Usage
I choose to write a Perl script:  `neighbourhoodReplace.pl`

### Dependencies
- [Perl](https://www.perl.org/get.html)
- [String Approx Perl Module](http://search.cpan.org/~jhi/String-Approx/Approx.pm)

### Running
`perl neighbourhoodReplace.pl {document.txt} {correctSpelling.txt} {threshold} {output.txt}`

where:
```
{document.txt}        is the file you which to perform the corrections on.
{correctSpelling.txt} is a file with words (line delimited) spelled correctly
{threshold}           is a positive integer indicating how close a neighbor to replace
{output.txt}          is the outputted file with the corrected spellings.
```
## Docker
Alternatively, if you have [docker](https://www.docker.com/) installed, you can run the program by executing `docker build -t neighbourhoodreplace . && docker run -v "$(pwd)":/usr/src/myapp -w /usr/src/myapp neighbourhoodreplace  {document.txt} {correctSpelling.txt} {threshold} {output.txt}`
where the parameters are the same as above.
