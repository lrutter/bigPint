% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotPCPApp.R
\name{plotPCPApp}
\alias{plotPCPApp}
\title{Plot interactive parallel coordinate plots}
\usage{
plotPCPApp(data = data, dataSE = NULL, pointColor = "orange")
}
\arguments{
\item{data}{DATA FRAME | Read counts for parallel coordinate lines}

\item{dataSE}{SUMMARIZEDEXPERIMENT | Summarized experiment format that
can be used in lieu of data; default NULL}

\item{pointColor}{CHARACTER STRING | Color of overlaid points on scatterplot 
matrix; default "orange"}
}
\value{
A Shiny application that shows a parallel coordinate plot and allows 
users to draw rectangular areas across samples and remove genes that are not 
inside these areas. The user can download a file that contains the gene IDs 
that remain.
}
\description{
Plot interactive parallel coordinate plots.
}
\examples{
# The first example uses data and dataMetrics objects as
# input. The last example creates the same plot now using the
# SummarizedExperiment (i.e. dataSE) object input.

# Example: Create interactive parallel coordinate plot for genes that have
# FDR < 0.01 and logFC < -4. Standardize genes to have an average of zero
# and a standard deviation of one.

data(soybean_ir_sub)
data(soybean_ir_sub_metrics)

# Create standardized version of data
library(matrixStats)
soybean_ir_sub_st = as.data.frame(t(apply(as.matrix(soybean_ir_sub[,-1]), 1,
    scale)))
soybean_ir_sub_st$ID = as.character(soybean_ir_sub$ID)
soybean_ir_sub_st = soybean_ir_sub_st[,c(length(soybean_ir_sub_st),
    1:length(soybean_ir_sub_st)-1)]
colnames(soybean_ir_sub_st) = colnames(soybean_ir_sub)
nID = which(is.nan(soybean_ir_sub_st[,2]))
soybean_ir_sub_st[nID,2:length(soybean_ir_sub_st)] = 0

library(dplyr, warn.conflicts = FALSE)
plotGenes = filter(soybean_ir_sub_metrics[["N_P"]], FDR < 0.01,
    logFC < -4) \%>\% select(ID)
pcpDat = filter(soybean_ir_sub_st, ID \%in\% plotGenes[,1])

app <- plotPCPApp(data = pcpDat, pointColor = "purple")
if (interactive()) {
    shiny::runApp(app, display.mode = "normal")
}

# Below is the same example, only now using the
# SummarizedExperiment (i.e. dataSE) object as input.

# Example: Create interactive parallel coordinate plot for genes that have
# FDR < 0.01 and logFC < -4. Standardize genes to have an average of zero
# and a standard deviation of one.

\dontrun{
data(se_soybean_ir_sub)

# Create standardized version of data
library(matrixStats)
se_soybean_ir_sub_st = se_soybean_ir_sub
assay(se_soybean_ir_sub_st) <-as.data.frame(t(apply(as.matrix(as.data.frame(
    assay(se_soybean_ir_sub))), 1, scale)))
nID <- which(is.nan(as.data.frame(assay(se_soybean_ir_sub_st))[,1]))
assay(se_soybean_ir_sub_st)[nID,] <- 0

# To subset our SummarizedExperiment data by a list of genes, we can
# invoke the convertSESubsetGenes() method.

library(dplyr, warn.conflicts = FALSE)
geneList <- as.data.frame(rowData(se_soybean_ir_sub_st)) \%>\%
    filter(N_P.FDR <= 0.01) \%>\% filter(N_P.logFC < -4)
geneList <- geneList[,1]
pcpDat <- convertSESubsetGenes(se_soybean_ir_sub_st, geneList)

app <- plotPCPApp(dataSE = pcpDat, pointColor = "purple")
if (interactive()) {
    shiny::runApp(app, display.mode = "normal")
}
}

}
