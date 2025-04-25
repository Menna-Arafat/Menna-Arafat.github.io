---
layout: post
title: "Multi-omics Integration (MOFA) - Part 1"
date: "2025-04-26"
---
Multi-omics integration aims to combine multiple layers of molecular data—such as transcriptomics, proteomics, epigenomics, and metabolomics—from the same set of biological samples. One powerful approach for integrating multi-omics data is matrix factorization, a family of dimensionality reduction techniques designed to uncover hidden structures or patterns shared across different data types.

### So, what is Matrix Factorization?

Matrix factorization is a technique used to decompose a large, complex matrix into simpler, smaller matrices that are easier to analyze and interpret. The basic idea is to break down the data into underlying factors that explain the patterns or relationships observed in the original matrix.

Imagine you have a large matrix where columns represent samples (e.g., tumor or normal), and rows represent gene expression levels across samples. The matrix is essentially a snapshot of how genes behave across various conditions. However, this matrix is high-dimensional, making it difficult to directly interpret how different samples (tumor vs. normal) relate to each other based on the raw data.

Matrix factorization aims to reduce this high-dimensional data into a lower-dimensional space. This lower-dimensional space represents key factors that capture the major axes of variation in the data. Each latent factor can be thought of as a vector (or axis) in this reduced space.

The second matrix produced through matrix factorization is the **activity matrix**, which represents how much each sample contains of each factor, i.e., it reflects the activity of the factors.

When you multiply the latent factor matrix by the activity matrix, you get an approximation of the original matrix but with far fewer parameters. This allows you to uncover hidden patterns in the data.