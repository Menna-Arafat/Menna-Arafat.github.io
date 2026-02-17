---
layout: default
title: Research
---

<link rel="stylesheet" href="/styles.css">


<div class="research-header">
<h1>RESEARCH PROJECTS</h1>
</div>

<div class="content-container">
<h4 style="margin-bottom: 0; font-size: 1.3rem;">
  <a href="https://link.springer.com/article/10.1007/s00726-025-03448-3" target="_blank">
    1. Metabolomic Analysis of Gut Metabolites in Colorectal Cancer Patients (CRC)
  </a>
</h4>

<div class="expandable">
Applied End-to-end metabolomic analysis to identify coordinated metabolic changes linked to colorectal cancer. My work covered the full pipeline, including data preprocessing, PQN normalization, differential metabolite analysis to uncover metabolite shifts. I then applied weighted network analysis (WGCNA) to define modules of co-expressed metabolites associated with disease status, and used PCA and PLS-DA to prioritize discriminative features underlying group separation.
Despite the limitations of metabolite coverage, this integrated approach allowed us to pinpoint CRC-related modules, identify high-influence hub metabolites, and characterize network patterns that suggest promising biomarker candidates and mechanistic pathways.<br>      
<strong>Resources:</strong>
<a href="https://link.springer.com/article/10.1007/s00726-025-03448-3" target="_blank"><strong>Paper Link</strong></a> |
<a href="https://bits-and-bites.netlify.app/" target="_blank"><strong>Source Code</strong></a> </div>  


<h4 style="margin-bottom: 0; font-size: 1.3rem;">
  <a href="https://www.mdpi.com/2073-4409/14/14/1115" target="_blank">
    2. Integrative Multi-Omics Profiling of Rhabdomyosarcoma Subtypes Reveals Distinct Molecular Pathways and Biomarker Signatures
  </a>
</h4>

<div class="expandable">
Conducted the systems-level analysis that mapped subtype-specific molecular features in rhabdomyosarcoma. I applied weighted network analysis (WGCNA) to define co-expressed protein modules and used eigengene-based Wilcoxon testing to identify modules that significantly distinguish between clinical subtypes.
I then constructed protein–protein interaction networks that integrated hub and differentially expressed proteins, and performed centrality analysis to highlight key regulatory drivers within these networks.
This framework helped disentangle the high heterogeneity across subtypes, map the main altered pathways, and propose biologically plausible biomarkers grounded in network rather than single-gene signals.<br>   
<strong>Resources:</strong>
<a href="https://www.mdpi.com/2073-4409/14/14/1115" target="_blank"><strong>Paper Link</strong></a> |
<a href="https://github.com/Menna-Arafat/Rhabdomyosarcome_project" target="_blank"><strong>Source Code</strong></a> </div>


<h4 style="margin-bottom: 0; font-size: 1.3rem;">
  <strong>3. CrosstalkX: Mutual Information–Based Pathway Interaction Inference</strong>
</h4>

<div class="expandable">
Developed the CrosstalkX R package, which provides a computational framework to infer transcription factor–pathway and pathway–pathway interactions from gene expression data by integrating enrichment-derived gene sets, mutual information–based association measures, and background gene interaction networks. Statistical significance is assessed using permutation-based null models to identify biologically meaningful pathway crosstalk. In addition, CrosstalkX prioritizes genes of interest using differential-expression neighborhood enrichment, retaining genes whose network neighborhoods are significantly enriched for DE genes.<br>
<strong>Resources:</strong>
<a href="https://github.com/Menna-Arafat/CrosstalkX" target="_blank"><strong>Source Code</strong></a> |
<a href="https://menna-arafat.github.io/CrosstalkX" target="_blank"><strong>Vignette</strong></a></div>

<h4 style="margin-bottom: 0; font-size: 1.3rem;">
<strong>4. Integrated Multi-Study Single-Cell Profiling of Bone Marrow and Peripheral Blood in Aplastic Anemia</strong>
</h4>

<div class="expandable">
Single-cell RNA-seq datasets for aplastic anemia (GSE214207, GSE181989, GSE145668, and GSE145531) were retrieved from GEO. Studies in which all samples had received therapeutic intervention were excluded, and treated samples within eligible studies were removed based on metadata. Remaining samples were stratified by tissue of origin (bone marrow vs PBMC) and analyzed separately. Raw expression matrices were processed in R using Seurat with standard quality control (filtering by detected genes, UMI counts, mitochondrial fraction, and low-detection genes), followed by Seurat log-normalization and scaling. Batch effects across studies were corrected using Harmony on PCA embeddings, and the top 50 Harmony components were used for UMAP visualization and graph-based clustering. Cell types were annotated with Azimuth using tissue-matched reference atlases. Hematopoietic progenitors and lymphoid populations (T/NK) were then subsetted and reprocessed for subclustering; marker detection was performed with scran’s findMarkers, lineage identities were assigned using canonical marker enrichment with Fisher’s exact test and multiple-testing correction, and differential expression for identified clusters was assessed with edgeR while controlling for batch effects in the design model. Disease-associated shifts in cell population frequencies were quantified using MiloR differential abundance testing across neighborhood graphs. Cell–cell communication was inferred with CellChat and functionally prioritized using NicheNet ligand–target modeling. In bone marrow, differentiation trajectories were reconstructed with Monocle3 pseudotime (rooted by progenitor markers), and dynamic genes along pseudotime were identified using generalized additive models with FDR control followed by functional enrichment of significant programs. All analyses were performed in R version 4.3.<br> 
<strong>Resources:</strong>
<a href="https://github.com/Menna-Arafat/SC_Aplastic_Anemia" target="_blank"><strong>Source Code</strong>[will be available]</a></div>


<h4 style="margin-bottom: 0; font-size: 1.3rem;">
<strong>5. Integrative Transcriptomic Profiling of Plasma Extracellular Vesicles Reveals miRNA Signatures for Breast Cancer Subtype Classification</strong>
</h4>

<div class="expandable">
Designed computational framework that integrated multiple extracellular vesicle miRNA datasets to identify subtype-relevant signatures in breast cancer. My work included curating and harmonizing data across studies and removing high-missingness features.
To identify signals that are reproducible across datasets, I conducted an integrative meta-analysis of gene expression to highlight consistently differentially expressed genes.
For subtype classification, I implemented MINT sPLS-DA to integrate datasets, select stable discriminative features, and assess model performance through cross-validated error metrics and ROC curve analysis.
I then constructed a network of experimentally supported miRNA–target interactions, prioritizing targets regulated by coordinated miRNA changes, and performed pathway enrichment analysis to delineate the molecular processes associated with each breast cancer subtype.<br> 
<strong>Resources:</strong>
<a href="https://github.com/Menna-Arafat/BC_EVs_miRNA" target="_blank"><strong>Source Code</strong></a></div>


<h4 style="margin-bottom: 0; font-size: 1.3rem;">
  <strong>6. A Multi-Omics and Mutual Information Framework to Decode Therapeutic Vulnerabilities in TNBC</strong>
</h4>

<div class="expandable">
Developed an integrated analytic framework to identify therapeutic vulnerabilities in triple-negative breast cancer by combining multi-omics factor analysis with mutual information–based pathway crosstalk modeling.
Six omics layers from TCGA were assembled and analyzed using MOFA to extract latent factors that capture major sources of tumor variation. From these factors, Prioritized high-weight features that were also differentially expressed, inferred transcription factor activity with decoupleR, and applied centrality measures to identify influential genes and active TFs with potential regulatory roles. The crosstalk module quantified mutual information between pathways to reveal coordinated signaling patterns associated with aggressive tumor behavior.
To translate these findings into therapeutic hypotheses, I linked central genes and pathway states to candidate compounds using CMAP and the Drug Repurposing Hub, and assessed potential combinations through network-based synergy prediction. Target essentiality was evaluated using DepMap data, and survival analyses were incorporated to assess clinical relevance. Finally, I applied Macau to relate pathway activity to drug sensitivity profiles, enabling the identification of drug–target associations tailored to TNBC-specific molecular states.<br>
<strong>Resources:</strong>
<a href="https://github.com/Menna-Arafat/TNBC_project" target="_blank"><strong>Source Code</strong></a></div>


<h4 style="margin-bottom: 0; font-size: 1.3rem;">
  <strong>7. Enhanced Bone Regeneration in Rat Gingival Mesenchymal Stem Cells: A Comparative Study of Inductive Media, Polycaprolactone Nano Scaffold, and Low-Level Laser Therapy</strong>
</h4>

<div class="expandable">
Developed an analytic strategy to dissect the molecular and cellular programs driving bone regeneration in rat gingival mesenchymal stem cells across multiple intervention settings. Using MEFISTO, I integrated time-resolved protein expression data to extract latent factors that captured coordinated molecular changes across the three measured time points. Inferred transcription factor activity with decoupleR and examined pathway crosstalk to identify regulatory axes shaping differentiation dynamics.
To connect these molecular shifts to cellular composition, I applied CIBERSORT deconvolution using a dental cell atlas, linking protein-level changes to specific cell populations involved in regeneration. This framework revealed time-aligned regulatory programs, key TF–pathway interactions, and the cell-type contributions that together explain enhanced regenerative responses under different treatment conditions.<br>
<strong>Resources:</strong>
<a href="https://github.com/Menna-Arafat/GMSC_project" target="_blank"><strong>Source Code</strong></a></div>


<h4 style="margin-bottom: 0; font-size: 1.3rem;">
  <strong>8. Proteomic Profiling of Pancreatic Cancer Patients: Time Series Study Before and After Whipple Surgery</strong>
</h4>

<div class="expandable">
Analyzed longitudinal proteomic profiles from pancreatic cancer patients undergoing Whipple surgery to characterize temporal protein dynamics linked to stable long-term glycemic control. Using WGCNA, I identified co-expression modules and correlated their eigengenes with the recorded time points to isolate modules reflecting post-surgical recovery. For the recovery-associated module, I modeled protein trajectories with generalized additive model (GAM) incorporating patient-specific intercepts to capture individual variation. I then identified hub proteins based on high intramodular connectivity, integrated them into STRING-derived protein–protein interaction networks, applied Louvain clustering, and conducted pathway enrichment analysis. This framework highlighted temporally regulated proteomic modules whose coordinated activity reflects the molecular adaptation after surgery. Mapping these dynamics
reveals stress responses, repair mechanisms, and processes correlated with long-term glycemic stability
rather than short-term post-surgical responses.<br>
<strong>Resources:</strong>
<a href="https://github.com/Menna-Arafat/Whiple_surgery_project" target="_blank"><strong>Source Code</strong></a></div>
</div>




<script>
document.addEventListener("DOMContentLoaded", function () {

  /*  Automatic Expandable Summaries  */
  const limit = 20;

  document.querySelectorAll(".expandable").forEach(function (para) {
    const full = para.innerHTML.trim();
    const words = full.split(/\s+/);

    if (words.length <= limit) return;

    const preview = words.slice(0, limit).join(" ");
    const hidden = words.slice(limit).join(" ");

    para.innerHTML = `
      ${preview}<span class="ellipsis">...</span>
      <span class="hidden-text" style="display:none;"> ${hidden}</span>
      <span class="toggle-link">Show more</span>
    `;

    const toggle = para.querySelector(".toggle-link");
    const more = para.querySelector(".hidden-text");
    const dots = para.querySelector(".ellipsis");

    toggle.addEventListener("click", function () {
      const expanded = more.style.display === "inline";
      more.style.display = expanded ? "none" : "inline";
      dots.style.display = expanded ? "inline" : "none";
      toggle.textContent = expanded ? "Show more" : "Show less";
    });
  });


  /*  Expandable Figures  */
  document.querySelectorAll(".figure-toggle").forEach(function (btn) {
    btn.addEventListener("click", function () {

      const figs = btn.parentElement.querySelector(".figures");
      const isHidden = figs.style.display === "none" || figs.style.display === "";

      figs.style.display = isHidden ? "block" : "none";
      btn.textContent = isHidden ? "Hide Figures" : "Show Figures";
    });
  });

});
</script>








