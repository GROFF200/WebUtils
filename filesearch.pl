#!/usr/bin/perl
use strict;
use warnings;
use File::Find;

# Prompt the user to enter the search text
print "Enter text to search for: ";
chomp(my $search_text = <STDIN>);

# Check if the user provided search text
if (!$search_text) {
    die "No search text provided. Exiting.\n";
}

# Directory to search
my $directory = '.';

# Array to hold matching files
my @matching_files;

# Subroutine to process each file
sub wanted {
    # Only process files
    return unless -f $_;
    
    # Open the file for reading
    open my $fh, '<', $_ or return;
    
    # Read file content
    while (my $line = <$fh>) {
        if ($line =~ /\Q$search_text\E/i) {
            push @matching_files, $File::Find::name;
            last;
        }
    }
    close $fh;
}

# Search the directory
find(\&wanted, $directory);

# Print the results
if (@matching_files) {
    print "Files containing '$search_text':\n";
    print "$_\n" for @matching_files;
} else {
    print "No files found containing '$search_text'.\n";
}

