# imports
library(plyr)
library(ggplot2)
library(TreeWAS)

./scripts/grs_tree_analysis.R 
  \ --sample_file=example_data/sample_file_grs.txt 
  \ --tree_file=example_data/tree_example_ICD10_Chap_VI.txt 
  \ --pheno_file=example_data/phenotype_file.txt
  \ --outprefix=test_grs.res 
  \ --num.cores=1



setwd("Documents/UCSF_year2/research/TreeWAS/")
phenotypes = read.table("example_data/phenotype_file.txt", header = T)
sample_results = read.csv("test_grs.res_TreeWAS_results.txt", sep = "\t")

zero_phen = ldply(phenotypes, function(c) sum(c==0))
one_phen = ldply(phenotypes, function(c) sum(c==1))

summary(one_phen)


ggplot(one_phen, aes(x=.id, y=V1)) + 
  geom_bar(stat="identity", colour="purple", fill="purple") + 
  xlab("ICD code") + ylab("number of individuals") + 
  theme(axis.text.x=element_blank(), axis.ticks.x=element_blank())
