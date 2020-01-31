# Introduction

This repository contains trained reference sets that can be used with the Ribosomal Database Project classifier (Wang et al., 2007) to taxonomically assign Eukaryote 18S rDNA sequences.  The latest releases can be downloaded from https://github.com/terrimporter/18SClassifier/releases

# Releases

### 18S v4.0

Created from the SILVA 138 SSU Ref Nr99 (Preusse et al., 2007), the most recent curated dataset, with modifications described below.

We checked for the presence of species with more than one unique taxonomic lineage using the check_for_SILVA_inconsistencies4.plx script in the CheckSilva138Taxonomy directory.  We found that 2,495 / 98,776 (2.5%) *unique* species were annotated with more than one taxonomic lineage due to the way SILVA curates taxonomic lineages using an automated phylogeny-based method (combined with manual curation for certain groups).  This affects 335,983 / 510,984 (66%) of all the sequneces in the SILVA fasta file.  

This version of the 18S classifier has been trained to make assignments to the **genus** rank only.  This was done for 3 reasons:  

1) SILVA only curates their phylogeny-based taxonomy to the genus rank (even though species labels are  present in their fasta file),  
2) based on the results of our leave-one-sequence-out testing of our 18S v3 classifier (see below) it was not possible to obtain 95% accuracy at the species rank for any fragment length anyways, and,  
3) the naive Bayesian classifier is *not* a phylogeny-based taxonomic assignment method and it *requires* that all taxa at the assignment rank have a single unique lineage, a requirement that is not met for species in the SILVA dataset.

Species names were stripped from the SILVA fasta file, and any sequence that did not have a genus level taxonomic assignment was discarded.  It is likely that uncultured environmental sequences that are curated and named above the family rank (Yilmaz et al., 2013) are removed at this step.  After that filtering, all possible Eukaryote sequences were retained.  There were 2,841 eukaryote genera in the SILVA taxonomy file and 2,837 unique eukaryote genera in our reference set.  Bacterial and archael outgroup sequences were subsampled by clustering at 90% sequence similarity with VSEARCH 2.14.1 (Rognes et al., 2016). The final set reference set here is comprised of 42,301 sequences representing 7,504 taxa (at all ranks).  

Taxonomic assignment results should be filtered according to their bootstrap support values to reduce false positive assignments.  Cutoffs are based on leave-one-sequence-out testing of non-singleton genera. Here we recommend MINIMUM bootstrap cutoffs according to query length and assignment rank.  Assuming your query sequences are represented in the reference set, using the cutoffs presented in the first table below should ensure 99% accuracy.  If you wish to cast a wider net, you can use the second table below for 95% accuracy.

Bootstrap support cutoffs, 99% accuracy:

Rank | Full | 400 bp | 300 bp | 200 bp | 100 bp
--- |:---:|:---:|:---:|:---:|:---:
Domain | 0 | 0 | 0 | 0 | 0
Kingdom | 0 | 0 | 50 | 60 | 70
Phylum | 0 | 0 | NA | NA | NA
Class | 0 | - | NA | NA | NA
Order | NA | NA | NA | NA | NA
Family | NA | NA | NA | NA | NA
Genus | NA | NA | NA | NA | NA . 

NA = No cutoff available will result in 99% correct assignments

Bootstrap support cutoffs, 95% accuracy:

Rank | Full | 400 bp | 300 bp | 200 bp | 100 bp
--- |:---:|:---:|:---:|:---:|:---:
Domain | 0 | 0 | 0 | 0 | 0
Kingdom | 0 | 0 | 0 | 0 | 0
Phylum | 0 | 0 | 20 | 30 | 50
Class | 0 | 0 | 60 | 70 | 90
Order | 0 | - | NA | NA | NA
Family | - | - | NA | NA | NA
Genus | - | - | NA | NA | NA  

NA = No cutoff available will result in 95% correct assignments

### 18S v3.2

A few invasive species of interest were added even though they were not present in the original SILVA 132 SSU Ref Nr99 dataset.  The sequences were obtained from GenBank, taxonomy was edited to match that used by SILVA.

### 18S v3.1

Fixes punctuation errors in the header that breaks the classifier.

### 18S v3.0

Created from the SILVA 132 SSU Ref Nr99 (Preusse et al., 2007) with the following modifications.  Species with more than one unique taxonomic lineage were identified using the check_for_SILVA_inconsistencies.plx script in the CheckSilva132Taxonomy directory.  As a result, a total of 3,633 / 140,478 (2.6%) unique species and their associated sequences were excluded from the classifier.  After that filtering, all possible Eukaryote sequences were retained.  Bacterial and archael outgroup sequences were subsampled by clustering at 90% sequence similarity with vsearch 2.4.2 (Rognes et al., 2016). The final set here is comprised of 51,697 sequences representing 53,594 taxa (at all ranks).  

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

Yilmaz, P., Parfrey, L.W., Yarza, P., Gerken, J., Pruesse, E., Quast, C., et al. (2014) The SILVA and “All-species Living Tree Project (LTP)” taxonomic frameworks. Nucleic Acids Research, 42: D643–D648. doi:10.1093/nar/gkt1209

# Acknowledgements

We acknowledge support from the Canadian federal Genomics Research & Development Initiative (GRDI), Metagenomics-Based Ecosystem Biomonitoring (Ecobiomics) project.

Last updated: January 30, 2020
