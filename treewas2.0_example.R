library(devtools)
install_github("christacaggiano/TreeWASDir")
library(TreeWASDir)
library(TreeWASStruct)

# load data 
HES.data <- load.HES.lk.data()
pars <- load.pars()
t = pars$tree
data <- HES.data$d
res <- HES.data$res

HES.data$d[1]

snp <- "rs58542926"
SNP.IDX <- which(res$SNP %in% snp)

## Calculate the evidence that the SNP is
## associated with at least one term in the
## ontology
lBF <- calc.lBF(
  pars       = pars,
  data.sub   = data[SNP.IDX,,]
)


cat("The Tree BF is ",round(lBF,2), "\n")

## Calculate the risk profile across the
## ontology
pp <- marginal.posterior.profile(
  pars       = pars,
  data.sub   = data[SNP.IDX,,]
)


## visualise the results. Return a plotly
treePlot <- drawTree(
  tree           = pars$tree,
  pp             = pp,
  tree_title     = res[SNP.IDX,"SNP"],
  trim_tree_pp   = 0.25
)

treePlot


