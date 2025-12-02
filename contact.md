---
layout: default
title: Contact Me
---

<section id="contact">
  <h1 class="pageTitle">Contact Me</h1>

  <div class="contactContent">
    <p class="intro">
      Looking for expert bioinformatics analysis or want to collaborate? Drop me a message below or feel free to <a href="mailto:mennaarafat.info@gmail.com">email me directly</a>. — I’d love to hear from you!
    </p>
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
