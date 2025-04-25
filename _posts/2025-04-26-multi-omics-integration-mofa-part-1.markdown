---
layout: post
title: "Multi-omics Integration MOFA Part 1"
date:   2025-04-26
---

<p class="intro"><span class="dropcap"></span>Multi-omics integration aims to combine multiple layers of molecular data—such as transcriptomics, proteomics, epigenomics, and metabolomics—from the same set of biological samples. One powerful approach for integrating multi-omics data is matrix factorization, a family of dimensionality reduction techniques designed to uncover hidden structures or patterns shared across different data types.</p>

### So, what is Matrix Factorization?

Matrix factorization is a technique used to decompose a large, complex matrix into simpler, smaller matrices that are easier to analyze and interpret. The basic idea is to break down the data into underlying factors that explain the patterns or relationships observed in the original matrix.

Imagine you have a large matrix where columns represent samples (e.g., tumor or normal), and rows represent gene expression levels across samples. The matrix is essentially a snapshot of how genes behave across various conditions. However, this matrix is high-dimensional, making it difficult to directly interpret how different samples (tumor vs. normal) relate to each other based on the raw data.

Matrix factorization aims to reduce this high-dimensional data into a lower-dimensional space. This lower-dimensional space represents key factors that capture the major axes of variation in the data. Each latent factor can be thought of as a vector (or axis) in this reduced space.

The second matrix produced through matrix factorization is the **activity matrix**, which represents how much each sample contains of each factor, i.e., it reflects the activity of the factors.

When you multiply the latent factor matrix by the activity matrix, you get an approximation of the original matrix but with far fewer parameters. This allows you to uncover hidden patterns in the data.

In the previous example, we have an expression matrix (**A**), which is decomposed into:

- **Weight matrix (W)**: Latent factors, representing the major axes of variation in the data.
- **Activity matrix (H)**: Representing the activity or strength of each factor in each sample.

For instance:
- **Tumor samples** might have a high activity score (represented as red) for a latent factor that represents genes involved in cell proliferation or immune evasion, reflecting the tumor’s biological processes.
- **Normal samples**, on the other hand, might have a low activity score (represented as blue) for this same factor, reflecting that these biological processes are less active in normal tissue.

For the **weight matrix (W)**, the higher the weight, the more important a gene is in contributing to the factor. In this way, the latent factors discovered through matrix factorization act like "axes" or "vectors" that define the main directions in the data where tumor and normal samples vary. In a more technical way, these factors are linear combinations of the original gene expression features, meaning they reflect weighted combinations of genes that are most strongly associated with the biological differences between tumor and normal tissues.

By projecting the samples onto these latent factors, you can gain a clearer understanding of how tumor and normal samples differ based on these underlying, biologically meaningful axes. Essentially, matrix factorization reveals hidden structures in the data, allowing you to focus on the key factors driving variation. This can be used for further interpretation or downstream analysis, such as identifying biomarkers or therapeutic targets.
