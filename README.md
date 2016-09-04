# Misspelled Location Names - Knowledge Technologies
Semester 2, 2016

James Stone 761353

[![Build Status](https://travis-ci.org/jamesmstone/Knowledge-Technologies-Project-1.svg?branch=master)](https://travis-ci.org/jamesmstone/Knowledge-Technologies-Project-1)

## Report
A [PDF](https://github.com/jamesmstone/Knowledge-Technologies-Project-1/releases/latest) report, describing the process can be downloaded from the [Releases](https://github.com/jamesmstone/Knowledge-Technologies-Project-1/releases/latest) tab of the Github [repo](https://github.com/jamesmstone/Knowledge-Technologies-Project-1). Or from the LMS.

## Usage
I choose to write a Bash script: `neighbourhoodSearch.sh`

### Dependencies
- [agrep](https://en.wikipedia.org/wiki/agrep)
- [sed](https://en.wikipedia.org/wiki/Sed)
- [awk](https://en.wikipedia.org/wiki/Awk)
- [tr](https://en.wikipedia.org/wiki/Tr_(Unix))
- [xargs](https://en.wikipedia.org/wiki/xargs)
- [sort](https://en.wikipedia.org/wiki/Sort_(Unix))
- [pv](http://linux.die.net/man/1/pv)

### Running
`./neighbourhoodReplace.sh {document.txt} {correctSpelling.txt} {threshold}`

where:
```
{document.txt}        is the file you which to perform the corrections on.
{correctSpelling.txt} is a file with words (line delimited) spelled correctly
{threshold}           is a positive integer indicating how close a neighbour to replace
```

The result is then outputted to `stdout`
