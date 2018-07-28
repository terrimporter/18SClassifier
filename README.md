# Introduction

This repository contains trained reference sets that can be used with the Ribosomal Database Project classifier (Wang et al., 2007) to taxonomically assign Eukaryote 18S rDNA sequences.  The latest releases can be downloaded from https://github.com/terrimporter/18SClassifier/releases

# Releases

## July 27, 2018

18Sv3.0 was created from the SILVA 132 SSU Ref Nr99 with the following modifications.  All possible Eukaryote sequences were retained.  Bacterial and archael outgroup sequences were subsampled by clustering at 90% sequence similarity with vsearch 2.4.2 (Rognes et al., 2016). Species with more than one unique taxonomic lineage were identified using the check_for_SILVA_inconsistencies.plx script in the CheckSilvaTaxonomy directory.  A total of 3,633 / 140,478 (2.6%) unique species and their associated sequences were excluded from the classifier.

## July 12, 2018

18Sv2.0 was created to classify Eukaryotes for Jesse Hoage's Master's thesis.  18S rDNA sequences were mined from GenBank July 24, 2017.

18Sv1.0 was created to specifically classify diatoms (Bacillariophyta).  18S rDNA sequences were mined from GenBank August 25, 2016.

# References

Rognes, T., Flouri, T., Nichols, B., Quince, C., & Mahé, F. (2016). VSEARCH: a versatile open source tool for metagenomics. PeerJ, 4, e2584. doi:10.7717/peerj.2584

Wang, Q., Garrity, G. M., Tiedje, J. M., & Cole, J. R. (2007). Naive Bayesian Classifier for Rapid Assignment of rRNA Sequences into the New Bacterial Taxonomy. Applied and Environmental Microbiology, 73(16), 5261–5267. Available from https://sourceforge.net/projects/rdp-classifier/

# Acknowledgements

I would like to acknowledge funding from the Government of Canada through the Genomics Research and Development Initiative, EcoBiomics project.
