---
layout: article
title: Services
services_page: true
show_date: false
show_subscribe: false
license: false
---

<div class="consulting">
  <section class="consulting-hero" aria-labelledby="services-intro">
    <div>
      <h2 id="services-intro">Rigorous analysis for complex data.</h2>
      <p class="consulting-lead">I help researchers and clinical teams move from a well-defined question to a reproducible analysis and a clear scientific conclusion.</p>
      <div class="consulting-actions"><a class="consulting-button" href="#project-enquiry">Contact me <span aria-hidden="true">↘</span></a><a class="consulting-text-link" href="#services">View services <span aria-hidden="true">↓</span></a></div>
    </div>
  </section>

  <section class="consulting-section" id="services" aria-labelledby="expertise-heading">
    <h2 class="consulting-visually-hidden" id="expertise-heading">Services</h2>
    <div class="consulting-services">
      <article class="consulting-service"><span class="consulting-number">01</span><div><p class="consulting-category">Transcriptomics</p><h3>Bulk &amp; single-cell analysis</h3><p>Find meaningful expression patterns, characterize cell populations, and connect results to biological processes.</p></div><ul><li>Quality control and preprocessing</li><li>Cell annotation and differential expression</li><li>Pathway analysis and biological interpretation</li><li>WGCNA and Network analysis</li></ul></article>
      <article class="consulting-service"><span class="consulting-number">02</span><div><p class="consulting-category">Systems biology</p><h3>Multi-omics integration</h3><p>Connect molecular layers to identify coordinated patterns and prioritize testable biological hypotheses.</p></div><ul><li>Genomic, transcriptomic, proteomic, metabolomic, and epigenomic data</li><li>Cross-dataset harmonization</li><li>Pathway and network interpretation</li></ul></article>
      <article class="consulting-service"><span class="consulting-number">03</span><div><p class="consulting-category">Biomedical statistics</p><h3>Study design &amp; statistical analysis</h3><p>Choose methods that match the study design and communicate findings with appropriate estimates and uncertainty.</p></div><ul><li>Analysis planning, regression, and hypothesis testing</li><li>Survival analysis and model diagnostics</li><li>Meta-analysis and network meta-analysis</li></ul></article>
      <article class="consulting-service"><span class="consulting-number">04</span><div><p class="consulting-category">Computational modeling</p><h3>Machine learning &amp; biomarker analysis</h3><p>Develop interpretable models and evaluate candidate biomarkers with careful validation and transparent limitations.</p></div><ul><li>Feature exploration and representation learning</li><li>Classifier development and evaluation</li><li>Biomarker prioritization and visualization</li></ul></article>
    </div>
  </section>

  <section class="consulting-contact" id="project-enquiry" aria-labelledby="enquiry-heading">
    <div class="consulting-contact__intro"><p class="consulting-eyebrow">Contact</p><h2 id="enquiry-heading">Have a project in mind?</h2><p>Send a brief note about your research question, data, and timeline.</p></div>
    <address class="consulting-contact__links">
      <a href="mailto:{{ site.author.email }}?subject=Research%20project%20enquiry"><span>Email</span><strong>{{ site.author.email }}</strong><b aria-hidden="true">↗</b></a>
      <a href="https://wa.me/201094107444"><span>WhatsApp</span><strong>+20 109 410 7444</strong><b aria-hidden="true">↗</b></a>
    </address>
  </section>
</div>

<style>
  .consulting { --svc-ink: #0b3533; --svc-ink-soft: #315e5b; --svc-muted: #627471; --svc-line: #d5dfdb; --svc-paper: #eff5f2; --svc-accent: #c17a2b; }
  .consulting-hero { position: relative; display: block; max-width: none; padding: clamp(1rem, 3vw, 2.5rem) 0 clamp(2.5rem, 5vw, 4rem); border-bottom: 0; overflow: hidden; }
  .consulting-hero::after { content: none; }
  .consulting-hero > div { position: relative; z-index: 1; max-width: 56rem; }
  .consulting-hero h2 { max-width: 54rem; padding-bottom: 0; border-bottom: 0; font-size: clamp(3.2rem, 7.1vw, 6.25rem); letter-spacing: -.052em; }
  .consulting .consulting-lead { max-width: 39rem; font-size: 1.18rem; }
  .consulting-section { padding: clamp(1.5rem, 3vw, 2.5rem) 0 clamp(3.5rem, 7vw, 6rem); }
  .consulting-services { border-top: 2px solid var(--svc-ink); }
  .consulting-service { grid-template-columns: 3rem minmax(14rem, .8fr) minmax(18rem, 1.2fr); padding: 2.5rem 0; transition: padding .2s ease, background .2s ease; }
  .consulting-service:hover { padding-left: 1rem; padding-right: 1rem; background: var(--svc-paper); }
  .consulting-service h3 { font-family: "Iowan Old Style", Baskerville, Georgia, serif; font-size: clamp(1.45rem, 2.3vw, 2rem); font-weight: 500; letter-spacing: -.025em; }
  .consulting-service div > p:last-child { max-width: 31rem; }
  .consulting-contact { position: relative; display: grid; grid-template-columns: minmax(0, 1.05fr) minmax(18rem, .95fr); gap: 2rem; overflow: hidden; }
  .consulting-contact::before { content: ""; position: absolute; left: -4rem; bottom: -7rem; width: 15rem; height: 15rem; border: 1px solid rgba(255,255,255,.18); border-radius: 50%; }
  .consulting-contact__intro, .consulting-contact__links { position: relative; z-index: 1; }
  .consulting-contact__intro > p:not(.consulting-eyebrow) { color: #c9d9d5; }
  .consulting-contact__links { border-left: 1px solid rgba(255,255,255,.2); }
  .consulting-contact__links a { padding: 1.5rem 0; }
  .consulting-contact__links a:hover strong, .consulting-contact__links a:hover b { color: #fff; }
  .consulting-contact__links b { transition: transform .18s ease; }
  .consulting-contact__links a:hover b { transform: translate(3px,-3px); }
  .consulting-visually-hidden { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip: rect(0, 0, 0, 0); white-space: nowrap; border: 0; }
  @media (max-width: 820px) { .consulting-hero::after { opacity: .45; } .consulting-service { grid-template-columns: 2.5rem 1fr; } .consulting-service ul { grid-column: 2; } .consulting-contact { grid-template-columns: 1fr; } .consulting-contact__links { border-left: 0; border-top: 1px solid rgba(255,255,255,.2); } }
  @media (max-width: 560px) { .consulting-hero::after { right: -3.5rem; top: 1.5rem; } .consulting-hero h2 { font-size: 3rem; } .consulting-service { grid-template-columns: 1fr; } .consulting-service ul { grid-column: 1; } .consulting-service:hover { padding-left: 0; padding-right: 0; background: transparent; } }
</style>
