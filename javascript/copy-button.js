"use strict";

function initCopyButtons() {
  // Make sure browser supports clipboard functionality
  if (!window.navigator?.clipboard) {
    return;
  }

  const codeBlocks = document.querySelectorAll(".highlighter-rouge > .highlight");

  codeBlocks.forEach((elem) => {
    const code = elem.querySelector(".highlight > code");
    if (!code) {
      return;
    }

    let timeout;
    const button = document.createElement("button");
    button.type = "button";
    button.textContent = "Copy to clipboard";
    button.className = "copy-button";
    button.addEventListener("click", async () => {
      try {
        await window.navigator.clipboard.writeText(code.textContent.trim());
        button.classList.add("copied");

        if (timeout) {
          clearTimeout(timeout);
        }
        timeout = setTimeout(() => {
          button.classList.remove("copied");
        }, 1500);
      } catch (error) {
        console.error("Failed to copy to clipboard:", error);
      }
    });

    elem.insertBefore(button, elem.querySelector(":scope > .highlight"));
  });
}

ready(initCopyButtons);
