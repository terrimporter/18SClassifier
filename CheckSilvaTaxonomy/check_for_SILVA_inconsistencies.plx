#!/usr/bin/perl

#July 27, 2018 by Teresita M. Porter
#Script to check a new SILVA FASTA file for taxonomic inconsistencies, i.e., species with differing taxonomic lineages
#USAGE perl check_for_SILVA_inconsistencies.plx SILVA_132_SSUParc_tax_silva.fasta.gz

use strict;
use warnings;

#var
my $i=0;
my $line;
my $lineage;
my $species;
my $path;
my $value;
my $newval;
my $outfile = "SILVA_inconsistencies.txt";
my $count;

#array
my @fasta;
my @line;
my @lineage;
my @value;

#hashe of hashes
my %species; #key=species, #value = path, #innervalue = 1

@fasta = `zcat $ARGV[0]`;

while($fasta[$i]) {
	$line = $fasta[$i];
	chomp $line;

	#process headers only
	if ($line =~ /^>/) { 
		@line = split(/ /,$line);
		shift @line; #remove the accession
		$lineage = join (" ",@line);
		@lineage = split(/;/,$lineage);
		$species = pop(@lineage); #grab species field
		$path = join(";",@lineage); #join the rest of the path

		#add to hash
		if (exists $species{$species}{$path}) {
			$i++;
			next;
		}
		else {
			$species{$species}{$path} = 1;
		}
	}
	else {
		$i++;
		next;
	}
	$i++;
}
$i=0;

#work through the hash to find species with more than one path

open (OUT, ">>", $outfile) || die "Error, can't open outfile: $!\n";

foreach $species (keys %species) {

	$count = scalar keys (%{$species{$species}});

	if ($count > 1) {
		foreach $path (keys %{$species{$species}}) {
			print OUT "$path\t$species\n";
		}
	}
	else {
		next;
	}
	print OUT "//\n";
}
close OUT;
