use String::Approx 'asubstitute';
use strict;
use warnings;

my ($document, $correctSpelling, $threshold, $output) = @ARGV;


if (not (defined $document and defined $correctSpelling and defined $threshold and defined $output)) {
  die "Error: Missing arguments:

  Example:
  `perl neighbourhoodReplace.pl {document.txt} {correctSpelling.txt} {threshold} {output.txt}`

  where:
  {document.txt}        is the file you which to perform the corrections on.
  {correctSpelling.txt} is a file with words (line delimited) spelled correctly
  {threshold}           is a positive integer indicating how close a neighbor to replace
  {output.txt}          is the outputted file with the corrected spellings.
  ";
}

# Load correct spelling file
open(my $spellingFile, '<', $correctSpelling) or die "Failed opening: $correctSpelling: $!\n";
chomp(my @spellingLines = <$spellingFile>);
close $spellingFile;


# Load original file as $text
open(my $documentFile, '<', $document) or die "Failed opening: $document: $!\n";
my $text = do { local($/); <$documentFile> };
close($documentFile);


my $file = $document;
open my $info, $file or die "Could not open $file: $!";

while( my $line = <$info>)  {
  print $line;
  last if $. == 2;
}


# for each line in correct spelling file
#   do the substitution using the correct threshold
print $text

# save modified text to output file

open(my $outputFile, '>', $output);
print $outputFile $text;
close $outputFile;
