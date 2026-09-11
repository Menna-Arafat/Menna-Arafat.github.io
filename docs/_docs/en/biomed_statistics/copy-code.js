(function () {
  "use strict";

  function fallbackCopy(text) {
    const textarea = document.createElement("textarea");
    textarea.value = text;
    textarea.setAttribute("readonly", "");
    Object.assign(textarea.style, { position: "fixed", opacity: "0", pointerEvents: "none" });
    document.body.appendChild(textarea);
    textarea.select();
    textarea.setSelectionRange(0, textarea.value.length);
    let ok = false;
    try { ok = document.execCommand("copy"); } catch (e) {}
    textarea.remove();
    return ok;
  }

  async function copyText(text) {
    if (navigator.clipboard && window.isSecureContext) {
      try { await navigator.clipboard.writeText(text); return true; } catch (e) {}
    }
    return fallbackCopy(text);
  }

  function getWrapper(pre) {
    const parent = pre.parentElement;
    if (parent && parent.classList.contains("sourceCode")) {
      parent.classList.add("code-block-wrapper");
      return parent;
    }
    if (parent && parent.classList.contains("code-block-wrapper")) return parent;

    const wrapper = document.createElement("div");
    wrapper.className = "code-block-wrapper";
    pre.parentNode.insertBefore(wrapper, pre);
    wrapper.appendChild(pre);
    return wrapper;
  }

  function addCopyButton(pre) {
    const wrapper = getWrapper(pre);
    if (wrapper.querySelector(":scope > .copy-code-button")) return;

  const button = document.createElement("button");
button.type = "button";
button.className = "copy-code-button";
button.innerHTML = "⧉";
button.title = "Copy code";
button.setAttribute("aria-label", "Copy code");

button.addEventListener("click", async () => {
  const code = pre.querySelector("code");
  const success = await copyText(code ? code.innerText : pre.innerText);
  button.innerHTML = success ? "✓" : "!";
  button.classList.toggle("copied", success);
  setTimeout(() => { button.innerHTML = "⧉"; button.classList.remove("copied"); }, 1400);
});

    wrapper.appendChild(button);
  }

  function initialize() {
    /* Copy only source-code blocks, not every output block. */
    document.querySelectorAll("pre.sourceCode, div.sourceCode > pre").forEach(addCopyButton);
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initialize);
  } else {
    initialize();
  }
})();
