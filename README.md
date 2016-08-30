# Misspelled Location Names - Knowledge Technologies
Semester 2, 2016

James Stone 761353

[![Build Status](https://travis-ci.com/jamesmstone/Knowledge-Technologies-Project-1.svg?token=p8yLcFuVj6kMWC4pZF7s&branch=master)](https://travis-ci.com/jamesmstone/Knowledge-Technologies-Project-1)

## Report
A [PDF](https://github.com/jamesmstone/Knowledge-Technologies-Project-1/releases/latest) report, describing the process can be downloaded from the [Releases](https://github.com/jamesmstone/Knowledge-Technologies-Project-1/releases/latest) tab of the Github [repo](https://github.com/jamesmstone/Knowledge-Technologies-Project-1). Or from the LMS.

## Usage
I choose to write a Bash script:  `neighbourhoodSearch.sh`

### Dependencies
- [agrep]
- [sed]
- [awk]
- [tr]
- [xargs]
- [sort]

### Running
`./neighbourhoodReplace.sh {document.txt} {correctSpelling.txt} {threshold}`

where:
```
{document.txt}        is the file you which to perform the corrections on.
{correctSpelling.txt} is a file with words (line delimited) spelled correctly
{threshold}           is a positive integer indicating how close a neighbour to replace
```

The result is then outputted to `stdout`
