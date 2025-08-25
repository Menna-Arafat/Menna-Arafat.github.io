---
layout: default
title: "Research & Publications"
---

**[Metabolomic Analysis of Gut Metabolites in Colorectal Cancer Patients (CRC)](https://link.springer.com/article/10.1007/s00726-025-03448-3)**  
Performed in-depth metabolomic profiling of colorectal cancer (CRC) through a robust workflow.
Data was normalized using Probabilistic Quotient Normalization (PQN) to account for sample dilution effects, followed by differential expression analysis. To uncover systems-level organization, I applied Weighted Gene Co-expression Network Analysis (WGCNA), identifying metabolite modules associated with CRC phenotypes. Module eigengene differentiation was applied to identify modules that significantly distinguish CRC from healthy controls, and Intra-modular connectivity analysis was performed to characterize central drivers within these networks. Dimensionality reduction approaches (PCA, PLS-DA) were further employed to refine discriminative features. This integrative approach highlighted top metabolites distinguishing CRC patients from controls and revealed network-level metabolic dysregulation with potential biomarker and therapeutic implications.


**[Source Code](https://bits-and-bites.netlify.app/)** 
***

**[Integrative Multi-Omics Profiling of Rhabdomyosarcoma Subtypes Reveals Distinct Molecular Pathways and Biomarker Signatures](https://www.mdpi.com/2073-4409/14/14/1115)**  
Applied Weighted Gene Co-expression Network Analysis (WGCNA) across metabolomics and proteomics data to delineate patterns of co-expressed genes in rhabdomyosarcoma (RMS). Co-expressed modules were identified through hierarchical clustering, and the Wilcoxon test assessed module eigengene differentiation, revealing RMS subtype-specific molecular profiles. 
To pinpoint central molecular drivers, protein–protein interaction networks were constructed by integrating WGCNA hub proteins with differentially expressed proteins, and centrality measures were applied to identify key regulators within each RMS subtype.

**[Source Code](https://github.com/Menna-Arafat/Rhabdomyosarcome_project)**
***

**CrosstalkX: A Mutual Information-Based Framework for Pathway Interaction Inference**  
Developed CrosstalkX, an R package for mutual information–based pathway interaction analysis, enabling the detection of nonlinear dependencies between pathway gene sets. The tool identifies highly interacting signaling pathways and prioritizes core pathways with high interaction degrees, revealing key functional Interplay that potentially coordinate critical biological processes.

**[Vignette](https://github.com/Menna-Arafat/CrosstalkX)**
***

**A Multi-Omics and Mutual Information Framework to Decode Pathway Crosstalk and Therapeutic Vulnerabilities in TNBC**  
Designed and executed a systematic computational framework for drug target prioritization and repurposing in triple-negative breast cancer (TNBC). This involved retrieving, curating, and harmonizing multi-omics data (CNV, SNV, methylome, mRNA, and ncRNA) from TCGA, followed by integrative analysis using MOFA. Through this framework, I identified disease-associated pathways linked to latent factors and introduced mutual information–based pathway crosstalk analysis to uncover core interacting pathways. These pathways were systematically mapped to candidate drugs using CMAP connectivity analysis, network-driven synergy prediction, and mutated subnetwork enrichment. Finally, I validated the prioritized targets with survival analysis and gene essentiality data from DepMap, yielding a refined set of therapeutic combinations closely tied to molecular profile states in TNBC.

**[Source Code](https://github.com/Menna-Arafat/TNBC_project)**
***

**Enhanced Bone Regeneration in Rat Gingival Mesenchymal Stem Cells: A Comparative Study of Inductive Media, Polycaprolactone Nano Scaffold, and Low-Level Laser Therapy**  
Temporal data were systematically analyzed across experimental phases to characterize molecular dynamics underlying enhanced bone regeneration in rat gingival mesenchymal stem cells. Protein expression patterns were modeled using the MEFISTO pipeline, an extension of MOFA2 designed for time-resolved multi-omics integration, highlighting coordinated molecular programs linked to regenerative processes.
Active transcription factors were inferred using the decoupleR framework, providing insight into key regulatory drivers of protein expression changes. To further elucidate the biological mechanisms, pathway crosstalk analysis was conducted to reveal potential regulatory interactions between active TFs and core enriched pathways. In addition, cellular heterogeneity was explored through single-sample deconvolution with CIBERSORT, using a signature matrix from Dental Cell Type Atlas in Mouse Jan (Krivanek et al., 2020), thereby mapping temporal protein signatures to specific cell-type contributions within the regenerative microenvironment.

**[Source Code](https://github.com/Menna-Arafat/GMSC_project)**
***

**Integrative Analysis of Extracellular Vesicle miRNAs Reveals Molecular Signatures and Regulatory Networks in Breast Cancer Subtypes**  
Conducted a comprehensive analysis of publicly available breast cancer miRNA datasets (GSE197020, GSE141326, GSE241784, and GSE241785), including data preprocessing, batch correction, and differential expression analysis. Applied the MINT-sPLS-DA algorithm from mixOmics for multivariate integration to identify robust, discriminative miRNA signatures for disease and subtype classification. Constructed miRNA–target interaction networks, retaining predicted targets regulated by at least three differentially expressed miRNAs, and performed functional enrichment analysis to uncover key pathways and regulatory mechanisms, providing insights into molecular alterations and potential biomarkers specific to breast cancer subtypes.

**[Source Code](https://github.com/Menna-Arafat/BC_EVs_miRNA)**
***

**Proteomic Profiling of Pancreatic Cancer Patients: Time Series Study Before and After Whipple Surgery**  
Led a network-based analysis to characterize temporal protein dynamics and functional organization. Implemented Weighted Gene Co-expression Network Analysis (WGCNA) to identify co-expressed protein modules, correlating module eigengenes with sample metadata to detect modules associated with temporal progression. Modules showing significant changes, including the blue module at 7 days post-operation, were analyzed using generalized additive models, and hub proteins with high intramodular connectivity (datKME > 0.85) were identified as central drivers. Functional interpretation was achieved by integrating the blue module with protein–protein interaction networks from STRING, followed by enrichment analysis using clusterProfiler and modularity clustering with the Louvain algorithm in iGraph, revealing pathway modules with crosstalk and coordinated biological activity.

**[Source Code](https://github.com/Menna-Arafat/Whiple_surgery_project)**
***




