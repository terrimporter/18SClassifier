# Introduction

This repository contains trained reference sets that can be used with the Ribosomal Database Project classifier (Wang et al., 2007) to taxonomically assign Eukaryote 18S rDNA sequences.  The latest releases can be downloaded from https://github.com/terrimporter/18SClassifier/releases

This classifier is suitable for coarsely classifying 18S sequences to order or class rank depending on the length of your query sequences.  Uncultivated environmental sequences are not well-represented in this set and a phylogeny-based taxonomic assignment method based on the SILVA 138 SSU Ref Nr99 would be recommended for flagging these taxa.  For more precise taxonomic assignments for a defined slice of target taxa, a taxon-specific classifier, preferrably with a curated taxonomy to the species rank is recommended.  A diatom-specific SSU classifier based on the R-syst::diatom database is available at https://github.com/terrimporter/SSUdiatomClassifier.

## How to cite

If you use this 18S reference set in a publication, please link to this page in your methods section, and cite SILVA: 

Pruesse E, Quast C, Knittel K, Fuchs BM, Ludwig WG, Peplies J, Glöckner FO (2007) SILVA: a comprehensive online resource for quality checked and aligned ribosomal RNA sequence data compatible with ARB. Nucl. Acids Res. 35:7188-7196 

If you use this reference set with the RDP classifier please also cite:

Wang et al. (2007) Naïve Bayesian classifier for rapid assignment of rRNA sequences into the new bacterial taxonomy. Applied and Environmental Microbiology, 73: 5261.

## How to use

Decompress the tar.gz file:

$ tar -xvzf FileName.tar.gz

Use with the RDP classifier:

java -Xmx8g -jar /path/to/rdp_classifier_2.12/dist/classifier.jar classify -t /path/to/mydata_trained/rRNAClassifier.properties -o ClassifiedQueryFilename QueryFilename

# Releases

### 18S v4.0

Created from the SILVA 138 SSU Ref Nr99 (Preusse et al., 2007), the most recent curated dataset, with modifications described below.

We checked for the presence of species with more than one unique taxonomic lineage using the check_for_SILVA_inconsistencies.plx script in the CheckSilva138Taxonomy directory.  We found that 2,495 / 98,776 (2.5%) *unique* species were annotated with more than one taxonomic lineage due to the way SILVA curates taxonomic lineages using an automated phylogeny-based method (combined with manual curation for certain groups).  This affects 335,983 / 510,984 (66%) of all the sequneces in the SILVA fasta file.  

As a result, this version of the 18S classifier has been trained to make assignments to the **genus** rank only.  This was done for 3 reasons:  

1) SILVA curates their phylogeny-based taxonomy to the genus rank (even though species labels are  present in the fasta file);  
2) Based on the results of our leave-one-sequence-out testing of our 18S v3 classifier (below) it was not possible to obtain 95% accurate taxonomic assignments to the species rank for any fragment length anyways; and,  
3) The naive Bayesian classifier is *not* a phylogeny-based taxonomic assignment method and it *requires* that all taxa at the assignment rank (ex. species) have a single unique lineage, a requirement that is not met for most sequences in the SILVA dataset.

Species names were stripped from the SILVA fasta file, and any sequence that did not have a genus level taxonomic assignment remaining was discarded.  At this step we noticed that several common species, though present in the SILVA fasta file, were missing from the SILVA taxonomy file such as cattle and maize.  As a result, sequences for these taxa have been removed from our reference set as well.  It is likely that uncultured environmental sequences that are curated by SILVA and named above the family rank (Yilmaz et al., 2013) are lacking genus names in the SILVA taxonomy file and are removed at this step as well.  *For some genera, certain intermediate ranks (family, order, class, etc.) may also be missing due to the way SILVA has taxonomically annotated these sequences.  These genera can still be classified with the RDP classifier, but downstream analyses will need to be aware that these intermediate ranks may be missing.

```linux
# Bos taurus is present in the SILVA fasta file
zcat SILVA_138_SSURef_NR99_tax_silva.fasta.gz| grep "Bos taurus"
pisthokonta;Holozoa;Choanozoa;Metazoa;Animalia;BCP clade;Bilateria;Deuterostomia;Chordata;Vertebrata;Gnathostomata;Euteleostomi;Tetrapoda;Mammalia;Bos taurus (cattle)
>AAFC05032335.570.2014 Eukaryota;Amorphea;Obazoa;Opisthokonta;Holozoa;Choanozoa;Metazoa;Animalia;BCP clade;Bilateria;Deuterostomia;Chordata;Vertebrata;Gnathostomata;Euteleostomi;Actinopterygii;Neopterygii;Teleostei;Bos taurus (cattle)
>AAFC05032349.519.1904 Eukaryota;Amorphea;Obazoa;Opisthokonta;Holozoa;Choanozoa;Metazoa;Animalia;BCP clade;Bilateria;Deuterostomia;Chordata;Vertebrata;Gnathostomata;Euteleostomi;Actinopterygii;Neopterygii;Teleostei;Bos taurus (cattle)

# The genus Bos is not present in the SILVA taxonomy file, partial matches shown
grep Bos tax_slv_ssu_138.txt
Bacteria;Proteobacteria;Alphaproteobacteria;Rhizobiales;Beijerinckiaceae;Bosea;	26042	genus		132
Bacteria;Proteobacteria;Alphaproteobacteria;Rhodobacterales;Rhodobacteraceae;Boseongicola;	11447	genus		123

# Zea mays is present in the SILVA fasta file, fist 5 matches shown
zcat SILVA_138_SSURef_NR99_tax_silva.fasta.gz| grep "Zea mays"
>BT070196.1.1443 Eukaryota;Archaeplastida;Chloroplastida;Charophyta;Phragmoplastophyta;Streptophyta;Embryophyta;Tracheophyta;Spermatophyta;Magnoliophyta;Zea mays
>AC186791.8808.10609 Eukaryota;Archaeplastida;Chloroplastida;Charophyta;Phragmoplastophyta;Streptophyta;Embryophyta;Tracheophyta;Spermatophyta;Magnoliophyta;Zea mays
>AC185461.114179.116131 Bacteria;Proteobacteria;Alphaproteobacteria;Rickettsiales;Mitochondria;Zea mays
>AC186791.33201.35001 Eukaryota;Archaeplastida;Chloroplastida;Charophyta;Phragmoplastophyta;Streptophyta;Embryophyta;Tracheophyta;Spermatophyta;Magnoliophyta;Zea mays
>AC185531.85946.87746 Eukaryota;Archaeplastida;Chloroplastida;Charophyta;Phragmoplastophyta;Streptophyta;Embryophyta;Tracheophyta;Spermatophyta;Magnoliophyta;Zea mays

# The genus Zea is not present in the SILVA taxonomy file, partial match shown
grep Zea tax_slv_ssu_138.txt
Bacteria;Bacteroidota;Bacteroidia;Flavobacteriales;Flavobacteriaceae;Zeaxanthinibacter;	44301	genus		138
```

All remaining Eukaryote sequences were retained.  **There were 2,841 eukaryote genera in the SILVA taxonomy file and 2,837 unique eukaryote genera in our reference set.**  Bacterial and archael outgroup sequences were subsampled by clustering at 90% sequence similarity with VSEARCH 2.14.1 (Rognes et al., 2016). The final reference set here is comprised of 42,301 sequences representing 7,504 taxa (at all ranks).  

**Taxonomic assignment results should be filtered according to their bootstrap support values to reduce false positive assignments.**  Cutoffs are based on leave-one-sequence-out testing of non-singleton genera. Here we recommend MINIMUM bootstrap cutoffs according to query length and assignment rank.  Assuming your query sequences are represented in the reference set, using the cutoffs presented in the first table below should ensure 99% accuracy.  If you wish to cast a wider net, you can use the second table below for 95% accuracy.

#### Bootstrap support cutoffs, 99% accuracy:

Rank | 500bp+ | 400 bp | 300 bp | 200 bp | 100 bp
--- |:---:|:---:|:---:|:---:|:---:
Domain | 0 | 0 | 0 | 0 | 0
Kingdom | 0 | 30 | 50 | 60 | 70
Phylum | 0 | NA | NA | NA | NA
Class | 30 | NA | NA | NA | NA
Order | 90 | NA | NA | NA | NA
Family | NA | NA | NA | NA | NA
Genus | NA | NA | NA | NA | NA . 

NA = No cutoff available will result in 99% correct assignments

#### Bootstrap support cutoffs, 95% accuracy:

Rank | 500bp+ | 400 bp | 300 bp | 200 bp | 100 bp
--- |:---:|:---:|:---:|:---:|:---:
Domain | 0 | 0 | 0 | 0 | 0
Kingdom | 0 | 0 | 0 | 0 | 0
Phylum | 0 | 0 | 20 | 30 | 50
Class | 0 | 50 | 60 | 70 | 90
Order | 0 | 90 | NA | NA | NA
Family | 50 | NA | NA | NA | NA
Genus | 95 | NA | NA | NA | NA  

NA = No cutoff available will result in 95% correct assignments

#### Bootstrap support cutoffs, 90% accuracy:

Rank | 500bp+ | 400 bp | 300 bp | 200 bp | 100 bp
--- |:---:|:---:|:---:|:---:|:---:
Domain | 0 | 0 | 0 | 0 | 0
Kingdom | 0 | 0 | 0 | 0 | 0
Phylum | 0 | 0 | 0 | 0 | 10
Class | 0 | 0 | 0 | 0 | 30
Order | 0 | 30 | 40 | 50 | 60
Family | 0 | 60 | 70 | 80 | 95
Genus | 70 | 95 | 95 | NA | NA  

NA = No cutoff available will result in 90% correct assignments

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

Assuming that your query sequences are present in the reference set, using these cutoffs should result in ~99% correct assignments:

Rank | Full | 600 bp | 400 bp | 200 bp | 100 bp | 50 bp
--- |:---:|:---:|:---:|:---:|:---:|:---:
Superkingdom | 0 | 0 | 0 | 0 | 0 | 95
Kingdom | 0 | 0 | 0 | 0 | 30 | NA
Phylum | 0 | 0 | 0 | 0 | 70 | NA
Class | 40 | 50 | 50 | 70 | 95 | NA
Order | NA | 95 | NA | NA | NA | NA
Family | NA | NA | NA | NA | NA | NA
Genus | NA | NA | NA | NA | NA | NA

NA = No cutoff available will result in 99% correct assignments

Assuming that your query sequences are present in the reference set, using these cutoffs should result in ~ 95% correct assignments:

Rank | Full | 600 bp | 400 bp | 200 bp | 100 bp | 50 bp
--- |:---:|:---:|:---:|:---:|:---:|:---:
Superkingdom | 0 | 0 | 0 | 0 | 0 | 0
Kingdom | 0 | 0 | 0 | 0 | 0 | 40
Phylum | 0 | 0 | 0 | 0 | 0 | NA
Class | 0 | 0 | 0 | 0 | 40 | NA
Order | 0 | 0 | 0 | 50 | 90 | NA
Family | 90 | 90 | 90 | NA | NA | NA
Genus | NA | NA | NA | NA | NA | NA

NA = No cutoff available will result in 95% correct assignments

### 18S v1.0

Created to specifically classify diatoms (Bacillariophyta).  18S rDNA sequences were mined from GenBank August 25, 2016.  Comprised of 1,658 sequences representing 272 taxa (at all ranks).

# References

Pruesse E, Quast C, Knittel K, Fuchs BM, Ludwig WG, Peplies J, Glöckner FO (2007) SILVA: a comprehensive online resource for quality checked and aligned ribosomal RNA sequence data compatible with ARB. Nucl. Acids Res. 35:7188-7196 

Rognes, T., Flouri, T., Nichols, B., Quince, C., & Mahé, F. (2016). VSEARCH: a versatile open source tool for metagenomics. PeerJ, 4, e2584. doi:10.7717/peerj.2584

Wang, Q., Garrity, G. M., Tiedje, J. M., & Cole, J. R. (2007). Naive Bayesian Classifier for Rapid Assignment of rRNA Sequences into the New Bacterial Taxonomy. Applied and Environmental Microbiology, 73(16), 5261–5267. Available from https://sourceforge.net/projects/rdp-classifier/

Yilmaz, P., Parfrey, L.W., Yarza, P., Gerken, J., Pruesse, E., Quast, C., et al. (2014) The SILVA and “All-species Living Tree Project (LTP)” taxonomic frameworks. Nucleic Acids Research, 42: D643–D648. doi:10.1093/nar/gkt1209

# Acknowledgements

We acknowledge support from the Canadian federal Genomics Research & Development Initiative (GRDI), Metagenomics-Based Ecosystem Biomonitoring (Ecobiomics) project.

Last updated: August 17, 2020
