# imports
library(plyr)
library(ggplot2)
library(TreeWAS)

# set working directory to where TreeWAS sample code is 
setwd("Documents/UCSF_year2/research/treeWas-exploration/")

###################### explore data ############################

phenotypes = read.table("example_data/phenotype_file.txt", header = T)  # load in phenotype data 
nrow(phenotypes) # number of individuals 
ncol(phenotypes) # number of disease codes used in analysis 

zero_phen = ldply(phenotypes, function(c) sum(c==0)) # people without disease 
sum(zero_phen$V1) # number of people without disease 

one_phen = ldply(phenotypes, function(c) sum(c==1)) # people with disease 
sum(one_phen$V1) # number w/ disease 
summary(one_phen) # summary stats of number of people w/ each disease 

one_phen[which.max(one_phen$V1),] # disease with the most cases, answer=G560, carpal tunnel syndrome

prop_with_disease = sum(one_phen$V1) / (sum(zero_phen$V1) + sum(one_phen$V1)) 
prop_with_disease  # very small number of disease cases 

ggplot(one_phen, aes(x=.id, y=V1)) + 
  geom_bar(stat="identity", colour="purple", fill="purple") + 
  xlab("ICD code") + ylab("number of individuals") + 
  theme(axis.text.x=element_blank(), axis.ticks.x=element_blank())

###################### run treewas ############################

# takes a bit (with only 1 core) 
# sample output already generated in example_data/
system(./scripts/grs_tree_analysis.R # genetic risk score tree 
       --sample_file=example_data/sample_file_grs.txt # sample genetic risk scores 
       --tree_file=example_data/tree_example_ICD10_Chap_VI.txt # ICD tree (from biobank)
       --pheno_file=example_data/phenotype_file.txt # sample p
       --outprefix=example_data/test_grs.res 
       --num.cores=2) 

# completed data 
sample_results = read.csv("example_data/test_grs.res_TreeWAS_results.txt", sep = "\t")


