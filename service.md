---
layout: default
title: What We Offer!
---

<section id="Service">
  <h1 class="pageTitle">What We Offer!</h1>

  <div class="ServiceContent">
    <p class="intro">
     Looking for expert bioinformatics analysis? Take a look at our services! <br>
	Or feel free to <a href="mailto:mennaarafat.info@gmail.com">email me directly</a>.
    </p>
	<h2>Main Services:</h2>
	<ul>
		  <li>NGS & Single-Cell Analysis.</li>
  		<li>Proteomics & Metabolomics Analysis.</li>
      <li>Genomics & Epigenomics Analysis.</li>
      <li>Network & Systems Biology.</li>
      <li>Multi-Omics Integration.</li>
      <li>Machine Learning & AI.</li>
      <li>Stats & Vis & Reporting.</li>
  </ul>
  </div>

  <form action="https://formspree.io/f/your-form-id" method="POST" class="contact-form">
    <div class="form-left">
      <label for="name">Name</label>
      <input type="text" id="name" name="name" class="full-width" required><br>
      <label for="email">Email Address</label>
      <input type="email" id="email" name="_replyto" class="full-width" required><br>
    </div>
    <div class="form-right">
      <label for="message">Message</label>
      <textarea name="message" id="message" cols="30" rows="7" class="full-width" required></textarea><br>
    </div>
    <input type="submit" value="Send" class="button">
  </form>
</section>

<style>
  .contact-form {
    display: flex;
    flex-wrap: wrap;
    gap: 2rem;
    margin-top: 1.5rem;
  }

  .form-left,
  .form-right {
    flex: 1;
    min-width: 280px;
  }

  .button {
    margin-top: 1.5rem;
  }
</style>
