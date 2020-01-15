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
my $total;
my $counter=0;
my $prop;

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
	$counter++;
}

$total = scalar keys %species;
$prop = $counter/$total*100;
print "There are a total of $counter species ($prop) with more than one path\n";
print "There are a total of $total species in the SILVA file\n";
close OUT;
