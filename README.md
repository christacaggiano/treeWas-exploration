# Zaitlen Lab Exploration into TreeWas
#### UCSF
#### October 2018

---

## Slides

* [slides from my 10/4/18 journal club](https://docs.google.com/presentation/d/1O21jx2Y-61TtRDSDuciMbnjrW_xX8ee7mUO63cmKAkY/edit?usp=sharing)

## TreeWas papers
This code draws from the methods described in the following papers:

* **TreeWas**: ["Bayesian analysis of genetic association across tree-structured routine healthcare data in the UK Biobank"](https://www-ncbi-nlm-nih-gov.ucsf.idm.oclc.org/pmc/articles/PMC5580804/) (Nat Gen, 2017)
* what I'm calling **TreeWas2**: "[Systematic classification of shared components of genetic risk for common human diseases"](https://www.biorxiv.org/content/early/2018/07/23/374207) (biorxiv, 2018)

## Data

* Repository uses [UKBiobank](https://www.ukbiobank.ac.uk/) genotype and phenotype data. Phenotype data codes are [20002](http://biobank.ctsu.ox.ac.uk/crystal/field.cgi?id=20002) (self-reported illness, non-cancer) and [41142](http://biobank.ctsu.ox.ac.uk/crystal/field.cgi?id=41142) and [41078](http://biobank.ctsu.ox.ac.uk/crystal/field.cgi?id=41078) (hospital episode statistics) Paths to local Zaitlenlab data:
  -
* Disease classification comes from [ICD10 codes](https://www.icd10data.com/)
* Phenotype matrix of all diseases here: `/ye/zaitlenlabstore/christacaggiano/treeWas-exploration/UKBIOBANK_DATA/`
* Genotypes can be selected using this script for SNP(s) of interest: `/ye/zaitlenlabstore/christacaggiano/treeWas-exploration/UKBIOBANK_DATA/scripts/generate_genotypes.sh`
  - Parameters for this script: SNPs of interest (one on each line, ex: `/ye/zaitlenlabstore/christacaggiano/treeWas-exploration/UKBIOBANK_DATA/snps.txt`) and an output prefix.

  ```bash
  qsub generate_genotypes <file of SNPs of interest> <output prefix>

  # ex: qsub generate_genotypes snps.txt output_snps
  ```
  * afterward, filter to people of interest using `scripts/select_people.py`

  ```bash

     qsub select_people.sh <ids> <output>

     # ex: qsub select_people.sh ../british_ancestry_ids.txt ../icd10_phenotype_british.txt

  ```



* Age, sex, site of collection - `british_covariates.txt`
* Filtered matrix of just British Isles ancestry - `icd10_phenotype_british.txt`
* Filtered matrix of people who passed PLINK QC - `icd10_passed_qc.txt`

## TreeWAS Scripts

* Original [treeWAS code](https://github.com/mcveanlab/TreeWAS) `/ye/zaitlenlabstore/christacaggiano/treeWas-exploration/TreeWAS`
* Install treewas with R -

  ```R
  library(devtools)
  install_github("mcveanlab/TreeWAS/TreeWAS")
  ```

* Example TreeWAS code - `/ye/zaitlenlabstore/christacaggiano/treeWas-exploration/treewas_example.R`
* TreeWas2.0 code - `/ye/zaitlenlabstore/christacaggiano/treeWas-exploration/TreeWas2.0`

  ```R
  library(devtools)
  install_github("christacaggiano/TreeWASDir")
  ```
* TreeWAS 2.0 Sample code-
* `/ye/zaitlenlabstore/christacaggiano/treeWas-exploration/treewas2.0_example.R`
* To save dynamic Plotly tree, click on export in Rstudio image window, and save as html.
