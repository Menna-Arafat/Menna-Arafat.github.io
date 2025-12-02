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
<strong>3. Integrative Transcriptomic Profiling of Plasma Extracellular Vesicles Reveals miRNA Signatures for Breast Cancer Subtype Classification</strong>
</h4>

<div class="expandable">
Designed computational framework that integrated multiple extracellular vesicle miRNA datasets to identify subtype-relevant signatures in breast cancer. My work included curating and harmonizing data across studies and removing high-missingness features.
To identify signals that are reproducible across datasets, I conducted an integrative meta-analysis of gene expression to highlight consistently differentially expressed genes.
For subtype classification, I implemented MINT sPLS-DA to integrate datasets, select stable discriminative features, and assess model performance through cross-validated error metrics and ROC curve analysis.
I then constructed a network of experimentally supported miRNA–target interactions, prioritizing targets regulated by coordinated miRNA changes, and performed pathway enrichment analysis to delineate the molecular processes associated with each breast cancer subtype.<br> 
<strong>Resources:</strong>
<a href="https://github.com/Menna-Arafat/BC_EVs_miRNA" target="_blank"><strong>Source Code</strong></a></div>


<h4 style="margin-bottom: 0; font-size: 1.3rem;">
  <strong>4. CrosstalkX: Mutual Information–Based Pathway Interaction Inference</strong>
</h4>

<div class="expandable">
Developed CrosstalkX, an R package that uses mutual information to detect nonlinear interactions among signaling pathways and prioritize core regulatory components. The method identifies pathway–pathway and pathway–TF interactions using biologically informed constraints and permutation testing for robust inference. It allows to quantify pathway–pathway and pathway–TF dependencies in complex omics data.<br>
<strong>Resources:</strong>
<a href="https://github.com/Menna-Arafat/CrosstalkX" target="_blank"><strong>Source Code</strong></a></div>


<h4 style="margin-bottom: 0; font-size: 1.3rem;">
  <strong>5. A Multi-Omics and Mutual Information Framework to Decode Therapeutic Vulnerabilities in TNBC</strong>
</h4>

<div class="expandable">
Developed an integrated analytic framework to identify therapeutic vulnerabilities in triple-negative breast cancer by combining multi-omics factor analysis with mutual information–based pathway crosstalk modeling.
Six omics layers from TCGA were assembled and analyzed using MOFA to extract latent factors that capture major sources of tumor variation. From these factors, Prioritized high-weight features that were also differentially expressed, inferred transcription factor activity with decoupleR, and applied centrality measures to identify influential genes and active TFs with potential regulatory roles. The crosstalk module quantified mutual information between pathways to reveal coordinated signaling patterns associated with aggressive tumor behavior.
To translate these findings into therapeutic hypotheses, I linked central genes and pathway states to candidate compounds using CMAP and the Drug Repurposing Hub, and assessed potential combinations through network-based synergy prediction. Target essentiality was evaluated using DepMap data, and survival analyses were incorporated to assess clinical relevance. Finally, I applied Macau to relate pathway activity to drug sensitivity profiles, enabling the identification of drug–target associations tailored to TNBC-specific molecular states.<br>
<strong>Resources:</strong>
<a href="https://github.com/Menna-Arafat/TNBC_project" target="_blank"><strong>Source Code</strong></a></div>


<h4 style="margin-bottom: 0; font-size: 1.3rem;">
  <strong>6. Enhanced Bone Regeneration in Rat Gingival Mesenchymal Stem Cells: A Comparative Study of Inductive Media, Polycaprolactone Nano Scaffold, and Low-Level Laser Therapy</strong>
</h4>

<div class="expandable">
Developed an analytic strategy to dissect the molecular and cellular programs driving bone regeneration in rat gingival mesenchymal stem cells across multiple intervention settings. Using MEFISTO, I integrated time-resolved protein expression data to extract latent factors that captured coordinated molecular changes across the three measured time points. Inferred transcription factor activity with decoupleR and examined pathway crosstalk to identify regulatory axes shaping differentiation dynamics.
To connect these molecular shifts to cellular composition, I applied CIBERSORT deconvolution using a dental cell atlas, linking protein-level changes to specific cell populations involved in regeneration. This framework revealed time-aligned regulatory programs, key TF–pathway interactions, and the cell-type contributions that together explain enhanced regenerative responses under different treatment conditions.<br>
<strong>Resources:</strong>
<a href="https://github.com/Menna-Arafat/GMSC_project" target="_blank"><strong>Source Code</strong></a></div>


<h4 style="margin-bottom: 0; font-size: 1.3rem;">
  <strong>7. Proteomic Profiling of Pancreatic Cancer Patients: Time Series Study Before and After Whipple Surgery</strong>
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

  /* ===== Automatic Expandable Summaries ===== */
  const limit = 25;

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


  /* ===== Expandable Figures (RELIABLE VERSION) ===== */
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





