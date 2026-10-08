# brca-rnaseq
R code for simulated BRCA RNA-seq differential expression analysis with DESeq2, volcano plot and heatmap
# BRCA RNA-seq DESeq2 Differential Expression Analysis

This repository stores R code for simulated breast cancer RNA-seq differential expression analysis.

## Project workflow
1. Simulate gene count matrix for tumor and normal samples
2. Use DESeq2 to perform differential expression analysis
3. Identify differentially expressed genes (DEG)
4. Visualization: Volcano plot + Heatmap

## Required R packages
- DESeq2
- dplyr
- ggplot2
- pheatmap
- EnhancedVolcano

## Run instructions
Run this script in RStudio.
It will generate simulated RNA-seq count data, run DE analysis and produce volcano plot and heatmap.

## DEG threshold
- Adjusted p-value (padj) < 0.05
- |log2FoldChange| > 1
