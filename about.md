---
layout: article
titles:
  # @start locale config
  en      : &EN       About
  en-GB   : *EN
  en-US   : *EN
  en-CA   : *EN
  en-AU   : *EN
  zh-Hans : &ZH_HANS  关于
  zh      : *ZH_HANS
  zh-CN   : *ZH_HANS
  zh-SG   : *ZH_HANS
  zh-Hant : &ZH_HANT  關於
  zh-TW   : *ZH_HANT
  zh-HK   : *ZH_HANT
  ko      : &KO       소개
  ko-KR   : *KO
  fr      : &FR       À propos
  fr-BE   : *FR
  fr-CA   : *FR
  fr-CH   : *FR
  fr-FR   : *FR
  fr-LU   : *FR
  # @end locale config
key: page-about
---

{%- assign about_photo = '/files/myphoto_clean.png' -%}
{%- assign about_photo_stamp = site.time | date: '%s' -%}
{%- for static_file in site.static_files -%}
  {%- if static_file.path == about_photo -%}
    {%- assign about_photo_stamp = static_file.modified_time | date: '%s' -%}
  {%- endif -%}
{%- endfor -%}

<div class="about-profile" markdown="1">
<div class="about-profile__media">
  <div class="about-profile__photo-frame">
    <img class="about-profile__photo" src="{{ about_photo | relative_url }}?v={{ about_photo_stamp }}" alt="Menna Arafat">
  </div>
</div>

<div class="about-profile__copy" markdown="1">
Menna Arafat is a physician and computational biologist working at the
intersection of multi-omics, machine learning, and reprogrammable medicine. My
work focuses on building computational frameworks that integrate omics data to
understand how disease states emerge and evolve.

I work across bulk and single-cell data integration, statistical modeling, and
representation learning to characterize disease trajectories and identify
interventional points for reprogrammable therapeutic strategies.
</div>

<div class="about-profile__links">
  <h2>More Information</h2>
  <ul>
    <li>
      <a href="{{ '/files/Menna_Arafat_CV.pdf' | relative_url }}">
        <i class="far fa-file-alt"></i>
        <span>CV</span>
      </a>
    </li>
    <li>
      <a href="{{ '/files/Menna_Arafat_SOP.pdf' | relative_url }}">
        <i class="far fa-edit"></i>
        <span>Statement of Purpose</span>
      </a>
    </li>
    <li>
      <a href="https://github.com/{{ site.author.github }}">
        <i class="fas fa-code-branch"></i>
        <span>GitHub</span>
      </a>
    </li>
    <li>
      <a href="https://www.linkedin.com/in/{{ site.author.linkedin }}">
        <i class="fas fa-user-tie"></i>
        <span>LinkedIn</span>
      </a>
    </li>
  </ul>
</div>
</div>
