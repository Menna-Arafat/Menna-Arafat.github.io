---
layout: page
title: "Research & Publications"
permalink: /Research/
---


## Metabolomic Analysis of Gut Metabolites in Colorectal Cancer Patients (CRC)

🧬 Project Highlights

In this study, I conducted an in-depth metabolomic profiling of colorectal cancer (CRC) using a robust pipeline involving Probabilistic Quotient Normalization (PQN), differential expression, and Weighted Gene Co-expression Network Analysis (WGCNA) to detect metabolite modules linked to colorectal cancer. Statistical testing and dimensionality reduction were performed using MetaboAnalystR, and the results were visualized in R. 

🔍 Key Findings

 We identified key differentially expressed metabolites that distinguish colorectal cancer (CRC) patients from controls. Notably, 4-(Methylsulfanyl)-2-oxobutanoic acid was upregulated, reflecting alterations in sulfur-containing amino acid metabolism. Elevated levels of L-Argininosuccinic acid pointed to urea cycle dysregulation, and increased Pyridoxal indicated perturbations in vitamin B6-dependent pathways. Additionally, increased levels of 2-(1H-indol-3-yl)acetaldehyde highlighted changes in tryptophan catabolism, and elevated Aspartic Acid supported enhanced nucleotide biosynthesis. Together, these metabolites provide insight into the metabolic shifts in CRC and offer potential as disease biomarkers.

**[Additional Figures](https://menna-arafat.github.io/Research/figures_crc.html)** 

***

## Deciphering TNBC Molecular Landscape: Bridging Multi-omics and Network Medicine for Drug repurposing and Combination Therapy

🧬 Project Highlights

In this project, I applied a comprehensive multi-omics framework for drug target prioritization in triple-negative breast cancer (TNBC), integrating CNV, SNV, methylome, mRNA, and ncRNA data from TCGA using MOFA and interaction networks to identify enriched pathways associated with disease-specific latent factors. A mutual information-based pathway crosstalk analysis revealed core interacting pathways in TNBC, which were subsequently mapped to potential drug combinations through CMAP-based connectivity analysis and network-driven drug synergy prediction. Finally, survival and gene essentiality analyses using the Depmap database validated the prognostic relevance and functional dependency of the targeted pathways, resulting in a shortlist of drug combinations with promising therapeutic potential for TNBC.

🔍 Key Findings

1. Combining PLK1 inhibitors with PARP inhibitors could benefit PARPi-resistant BRCA1-deficient TNBC by overcoming resistance mechanisms like ABC transporter overexpression and secondary HDR restoration.

2. A dual PARP1 and PI3K inhibitor could be a potential drug combination as it previously showed strong antiproliferative effects in both BRCA-deficient and proficient tumor cells.

3. Dual PARP1 and HDAC inhibitors, with strong inhibitory activity in BRCA1/2-proficient cells, also could inhibit tumor migration and angiogenesis, making them promising candidates for preclinical studies.

4. A dual VEGF receptor (VEGFR-2) and HDAC inhibitor could effectively overcome Pazopanib resistance, and exhibit significant antiproliferative effects.

**[Additional Figures](https://menna-arafat.github.io/Research/figures_tnbc.html)** 

***

## Enhanced Bone Regeneration in Rat Gingival Mesenchymal Stem Cells: A Comparative Study of Inductive Media, Polycaprolactone Nano Scaffold, and Low-Level Laser Therapy

🧬 Project Highlights

 In summary, I employed a comprehensive methodology to analyze data from different experimental phases. Temporal changes in protein expression were modeled using the MEFISTO pipeline, an extension of MOFA2, which identified key proteins linked to time progression across three timepoints. Pathway crosstalk analysis was conducted to explore interactions between significantly enriched pathways. Additionally, transcription factors involved in the pathways were inferred using gprofiler. Finally, for single sample deconvolution analysis, CIBERSORT was employed to estimate the proportion of cell subtypes in each sample based on a predefined signature matrix from Dental Cell Type Atlas in Mouse, published by Jan Krivanek et al. (2020).

🔍 Key Findings

 Our analysis revealed Latent factor one, associated with gingival mesenchymal cell differentiation, involves key proteins like ACTG1, ACTB, ACTA2, VIM, TPM2, TPM3, ACTN4, ACTN1, TUBA1B, and TUBA1A, which regulate actin and microtubule dynamics, focal adhesion, and cell motility. Additional proteins such as FLNA, PKM, LDHA, MSN, and CLTC contribute to cell shape, energy metabolism, and vesicle trafficking. HSPA8, HSP90AB1, and YWHZ support protein folding and stress response, while GAPDH, CALR, S100A6, LMNA, and TUBB5 regulate glycolysis, calcium signaling, and structural integrity. Together, these proteins are pivotal in cytoskeletal organization, cellular signaling, and metabolic processes during differentiation.

**[Additional Figures](https://menna-arafat.github.io/Research/figures_gmsc.html)**

***

## Proteomic and Metabolomic Profiling of alveolar and embryonal Rhabdomyosarcoma patients: an Integrative Study

🧬 Project Highlights

In brief, I utilized Weighted Gene Co-expression Network Analysis (WGCNA) to explore the molecular landscape of rhabdomyosarcoma (RMS) across metabolomics and proteomics data. Co-expressed modules were identified through hierarchical clustering, and the Wilcoxon test assessed the significance of each module's eigengene, revealing key modules that differentiated RMS cases from controls and identified subtype-specific profiles. Protein-protein interaction networks were constructed for WGCNA hub proteins and differentially expressed proteins to explore key drivers and interactions, uncovering central molecular players in RMS subtypes.

🔍 Key Findings

Network analysis and centrality measures of the PPI networks for both rhabdomyosarcoma subtypes revealed distinct molecular architectures. In alveolar rhabdomyosarcoma (ARMS), the hub proteins—INPPSB, PIP5K1B, PIP5K1A, PIP5K1C, CALM3, FLNA, and PLCB3—are primarily involved in phosphoinositide metabolism, calcium signaling, and cytoskeletal dynamics, processes critical for the enhanced proliferation, motility, and survival characteristic of ARMS. Notably, the PIP5K1 kinase family and CALM3 (calmodulin) are key regulators of signal transduction pathways frequently exploited in aggressive tumors. In contrast, the embryonal RMS (ERMS) network displays a distinct hub profile, dominated by complement cascade components (e.g., C3, C4A, C5, CFB, C1QA), SERPINC1, and ACTG1, highlighting roles in immune modulation, coagulation, and cytoskeletal remodeling. These findings point to a divergent molecular etiology between ARMS and ERMS, with ERMS potentially leveraging immune evasion via complement regulation, while ARMS progression appears more reliant on intracellular signaling and membrane trafficking, underscoring subtype-specific therapeutic vulnerabilities.

**[Additional Figures](https://menna-arafat.github.io/Research/figures_rhabdo.html)**

***

## Proteomic Profiling of Pancreatic Cancer Patients: A Time Series Study Before and After Whipple Surgery

🧬 Project Highlights

This study investigates proteomic changes in pancreatic cancer patients before and after Whipple surgery using time-series analysis. Weighted Gene Co-expression Network Analysis (WGCNA) identified key protein modules, with the blue module showing significant correlation with the 7-day post-operative time point. Statistical validation was performed using a generalized additive model (GAM), and hub proteins were defined based on high intramodular connectivity. To explore Functional enrichment and pathway crosstalk, I integrated statistical co-expression networks with knowledge-based protein–protein interaction networks from the STRING database, followed by Louvain clustering and enrichment analysis using the ClusterProfiler package. The clustering revealed crosstalk between functional modules, uncovering distinct pathway interactions and identifying potential therapeutic targets or biomarkers specific to the recovery phase following Whipple surgery.

🔍 Key Findings

In the recovery phase following Whipple surgery, proteomic network analysis identified key hub proteins enriched in the blue module, including APOE, APOC1, FCN2, MASP2, and C1QC. These proteins are central to pathways involved in immune response, complement activation, lipid metabolism, and vascular integrity. The integrated PPI and transcription factor network revealed distinct clusters of functionally connected modules, with key molecular processes encompassing complement cascade activation, lipid homeostasis, and coagulation. These pathways reflect the body’s coordinated response to surgical trauma and may serve as potential biomarkers or therapeutic targets to monitor and support postoperative recovery.

**[Additional Figures](https://menna-arafat.github.io/Research/figures_pancreas.html)**

***
