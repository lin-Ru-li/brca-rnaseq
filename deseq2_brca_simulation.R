# BRCA RNA-seq DESeq2 simulation
library(DESeq2)
library(dplyr)
library(ggplot2)
library(pheatmap)
library(EnhancedVolcano)

# 1. 模拟count矩阵
set.seed(123)
n_genes <- 1000
n_sample <- 6
count_data <- matrix(rnbinom(n_genes*n_sample, mu=100, size=2), nrow=n_genes)
rownames(count_data) <- paste0("gene_",1:n_genes)
colnames(count_data) <- c(paste0("tumor_",1:3), paste0("normal_",1:3))

# 人为设置一部分差异基因
count_data[1:80,1:3] <- count_data[1:80,1:3] * 2.5

# 分组信息
coldata <- data.frame(
  group = factor(c("tumor","tumor","tumor","normal","normal","normal"))
)
rownames(coldata) <- colnames(count_data)

# 2. DESeq2分析
dds <- DESeqDataSetFromMatrix(countData = count_data, colData = coldata, design = ~ group)
dds <- DESeq(dds)
res <- results(dds, contrast=c("group","tumor","normal"))

# 3. 火山图
EnhancedVolcano(res,
                lab = rownames(res),
                x = "log2FoldChange",
                y = "padj",
                pCutoff = 0.05,
                FCcutoff = 1,
                title = "Volcano Plot: Tumor vs Normal")

# 4. 热图：取top50差异基因
de_genes <- rownames(subset(res, padj<0.05 & abs(log2FoldChange)>1))
vsd <- vst(dds)
pheatmap(assay(vsd)[de_genes[1:50],], scale="row", annotation_col = coldata)
