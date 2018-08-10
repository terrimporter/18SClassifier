# Introduction

This repository contains trained reference sets that can be used with the Ribosomal Database Project classifier (Wang et al., 2007) to taxonomically assign Eukaryote 18S rDNA sequences.  The latest releases can be downloaded from https://github.com/terrimporter/18SClassifier/releases

# Releases

### 18S v3.0

Created from the SILVA 132 SSU Ref Nr99 (Preusse et al., 2007), the most recent curated dataset, with the following modifications.  Species with more than one unique taxonomic lineage were identified using the check_for_SILVA_inconsistencies.plx script in the CheckSilvaTaxonomy directory.  As a result, a total of 3,633 / 140,478 (2.6%) unique species and their associated sequences were excluded from the classifier.  After that filtering, all possible Eukaryote sequences were retained.  Bacterial and archael outgroup sequences were subsampled by clustering at 90% sequence similarity with vsearch 2.4.2 (Rognes et al., 2016). The final set here is comprised of 51,697 sequences representing 53,594 taxa (at all ranks).  

Taxonomic assignment results can be filtered according to their bootstrap support values to reduce false positive assignments.  Cutoffs are based on leave one out testing of non-singleton species. Here we recommend MINIMUM bootstrap cutoffs according to query length and taxonomic rank.  Depending on your project needs, for taxonomic assignments that minimize the risk of false positives (incorrect taxonomic assignments with high support), you may wish to use the cutoffs that result in 99% correct assignments during leave one out testing.  If you want to cast a wider net, you may wish to use the cutoffs that result in 95% correct assignments during leave one out testing.

Assuming that your query sequences are present in the reference set, using these cutoffs should result in ~99% correct assignments:

Rank | Full | 600 bp | 400 bp | 200 bp | 100 bp | 50 bp
--- |:---:|:---:|:---:|:---:|:---:|:---:
Superkingdom | 0 | 0 | 0 | 0 | 0 | 0
Kingdom | 0 | 0 | 0 | 0 | 30 | NA
Phylum | 0 | 0 | 0 | 30 | 95 | NA
Class | 0 | 20 | 40 | 60 | NA | NA
Order | NA | NA | NA | NA | NA | NA
Family | NA | NA | NA | NA | NA | NA
Genus | NA | NA | NA | NA | NA | NA
Species | NA | NA | NA | NA | NA | NA

NA = No cutoff available will result in 99% correct assignments

Assuming that your query sequences are present in the reference set, using these cutoffs should result in ~ 95% correct assignments:

Rank | Full | 600 bp | 400 bp | 200 bp | 100 bp | 50 bp
--- |:---:|:---:|:---:|:---:|:---:|:---:
Superkingdom | 0 | 0 | 0 | 0 | 0 | 0
Kingdom | 0 | 0 | 0 | 0 | 0 | 70
Phylum | 0 | 0 | 0 | 0 | 10 | NA
Class | 0 | 0 | 0 | 0 | 40 | NA
Order | 0 | 30 | 40 | 60 | NA | NA
Family | 50 | 50 | 60 | 80 | NA | NA
Genus | 90 | 80 | 80 | 90 | NA | NA
Species | NA | NA | NA | NA | NA | NA

NA = No cutoff available will result in 95% correct assignments

### 18S v2.0

Created to classify Eukaryotes for Jesse Hoage's Master's thesis.  18S rDNA sequences were mined from GenBank July 24, 2017.  Comprised of 91,283 sequences representing 27,881 taxa (at all ranks).

### 18S v1.0

Created to specifically classify diatoms (Bacillariophyta).  18S rDNA sequences were mined from GenBank August 25, 2016.  Comprised of 1,658 sequences representing 272 taxa (at all ranks).

# References

Pruesse E, Quast C, Knittel K, Fuchs BM, Ludwig WG, Peplies J, Glöckner FO (2007) SILVA: a comprehensive online resource for quality checked and aligned ribosomal RNA sequence data compatible with ARB. Nucl. Acids Res. 35:7188-7196 

Rognes, T., Flouri, T., Nichols, B., Quince, C., & Mahé, F. (2016). VSEARCH: a versatile open source tool for metagenomics. PeerJ, 4, e2584. doi:10.7717/peerj.2584

Wang, Q., Garrity, G. M., Tiedje, J. M., & Cole, J. R. (2007). Naive Bayesian Classifier for Rapid Assignment of rRNA Sequences into the New Bacterial Taxonomy. Applied and Environmental Microbiology, 73(16), 5261–5267. Available from https://sourceforge.net/projects/rdp-classifier/

# Acknowledgements

I would like to acknowledge funding from the Government of Canada through the Genomics Research and Development Initiative, EcoBiomics project.
