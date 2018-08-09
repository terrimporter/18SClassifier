# Introduction

This repository contains trained reference sets that can be used with the Ribosomal Database Project classifier (Wang et al., 2007) to taxonomically assign Eukaryote 18S rDNA sequences.  The latest releases can be downloaded from https://github.com/terrimporter/18SClassifier/releases

# Releases

## 18S v3.0

18Sv3.0 was created from the SILVA 132 SSU Ref Nr99 (Preusse et al., 2007) with the following modifications.  A total of 3,633 / 140,478 (2.6%) unique species and their associated sequences were excluded from the classifier.  All possible Eukaryote sequences were retained.  Bacterial and archael outgroup sequences were subsampled by clustering at 90% sequence similarity with vsearch 2.4.2 (Rognes et al., 2016). Species with more than one unique taxonomic lineage were identified using the check_for_SILVA_inconsistencies.plx script in the CheckSilvaTaxonomy directory.  The final set here is comprised of 51,697 sequences representing 53,594 taxa (at all ranks).

Reccomended MINIMUM cutoffs according to query length:

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

## 18S v2.0

18Sv2.0 was created to classify Eukaryotes for Jesse Hoage's Master's thesis.  18S rDNA sequences were mined from GenBank July 24, 2017.  Comprised of 91,283 sequences representing 27,881 taxa (at all ranks).

## 18S v1.0

18Sv1.0 was created to specifically classify diatoms (Bacillariophyta).  18S rDNA sequences were mined from GenBank August 25, 2016.  Comprised of 1,658 sequences representing 272 taxa (at all ranks).

# References

Pruesse E, Quast C, Knittel K, Fuchs BM, Ludwig WG, Peplies J, Glöckner FO (2007) SILVA: a comprehensive online resource for quality checked and aligned ribosomal RNA sequence data compatible with ARB. Nucl. Acids Res. 35:7188-7196 

Rognes, T., Flouri, T., Nichols, B., Quince, C., & Mahé, F. (2016). VSEARCH: a versatile open source tool for metagenomics. PeerJ, 4, e2584. doi:10.7717/peerj.2584

Wang, Q., Garrity, G. M., Tiedje, J. M., & Cole, J. R. (2007). Naive Bayesian Classifier for Rapid Assignment of rRNA Sequences into the New Bacterial Taxonomy. Applied and Environmental Microbiology, 73(16), 5261–5267. Available from https://sourceforge.net/projects/rdp-classifier/

# Acknowledgements

I would like to acknowledge funding from the Government of Canada through the Genomics Research and Development Initiative, EcoBiomics project.
