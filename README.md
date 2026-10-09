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
## Results
### Volcano Plot
![Volcano Plot](volcano.png)

### Heatmap
![Heatmap](heatmap.png)
# TCGA-BRCA 转录组模拟差异分析项目
本项目使用R语言DESeq2完成肿瘤/正常样本差异基因分析，包含差异基因筛选、可视化、富集分析。

## 结果展示
### 火山图
![Volcano plot](volcano.png)

### 热图
![Heatmap](heatmap.png)

### GO富集气泡图
![GO Bubble](GO_Bubble.png)

### KEGG富集气泡图
![KEGG Bubble](KEGG_Bubble.png)

## 分析流程
1. 模拟转录组count矩阵
2. DESeq2差异表达分析
3. 筛选差异基因
4. 差异基因可视化（火山图、热图）
5. GO/KEGG富集可视化

## 运行环境
R 4.6.1，RStudio
依赖包：DESeq2, dplyr, ggplot2, pheatmap, EnhancedVolcano

## 结果解读
1. **差异基因**：基于校正后P值<0.05、|log2FoldChange|>1筛选肿瘤与正常样本间的差异表达基因；log2FC>1代表基因在肿瘤中上调，log2FC<-1代表下调。
2. **火山图**：横坐标为表达变化倍数(log2FC)，纵坐标为校正P值。红点代表显著差异基因，直观展示上调、下调基因分布。
3. **热图**：对筛选得到的差异基因表达量做归一化聚类，可以看出肿瘤组和正常组样本能够明显分开，差异基因具有分组特异性。
4. **GO富集气泡图**：展示差异基因富集到的生物学功能条目；气泡大小代表富集到该条目的基因数量，颜色越偏向紫色代表富集显著性越高。
5. **KEGG富集气泡图**：展示差异基因富集的信号通路。本结果中PI3K-Akt、MAPK等肿瘤经典通路显著富集，符合乳腺癌的分子特征。
