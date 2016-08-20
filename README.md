# Misspelled Location Names - Knowledge Technologies
Semester 2, 2016
James Stone 761353

[![Build Status](https://travis-ci.com/jamesmstone/Knowledge-Technologies-Project-1.svg?token=p8yLcFuVj6kMWC4pZF7s&branch=master)](https://travis-ci.com/jamesmstone/Knowledge-Technologies-Project-1)

## Report
A [PDF](https://github.com/jamesmstone/Knowledge-Technologies-Project-1/releases/latest) report, describing the process can be downloaded from the [Releases](https://github.com/jamesmstone/Knowledge-Technologies-Project-1/releases/latest) tab of the Github [repo](https://github.com/jamesmstone/Knowledge-Technologies-Project-1). Or from the LMS.

## Usage
I choose to write a Perl script:  `neighbourhoodReplace.pl`

If you have Perl ([download](https://www.perl.org/get.html)) installed it can be run using:

`perl neighbourhoodReplace.pl {document.txt} {correctSpelling.txt} {threshold} {output.txt}`

where:
```
{document.txt}        is the file you which to perform the corrections on.
{correctSpelling.txt} is a file with words (line delimited) spelled correctly
{threshold}           is a positive integer indicating how close a neighbor to replace
{output.txt}          is the outputted file with the corrected spellings.
```
