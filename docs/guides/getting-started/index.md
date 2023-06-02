---
layout: page
title: Docs - Getting Started
---

# Getting Started

## Install Ronin

To install Ronin, including all of it's libraries *and* external dependencies,
simply download and then run the automated [ronin-install.sh] installer script
in the terminal:

[ronin-install.sh]: https://raw.githubusercontent.com/ronin-rb/scripts/main/ronin-install.sh

### GNU/Linux

```shell
wget https://raw.githubusercontent.com/ronin-rb/scripts/main/ronin-install.sh && bash ronin-install.sh
```

### macOS

```shell
curl -o ronin-install.sh https://raw.githubusercontent.com/ronin-rb/scripts/main/ronin-install.sh && bash ronin-install.sh
```

<article class="message is-dark">
  <div class="message-header">Note:</div>
  <div class="message-body" markdown="1">
If you do not feel comfortable using an automated installer script,
then proceed to the [manual install instructions][manual-install],
which explains how to manually step-by-step install Ronin on a variety of
platforms.

[manual-install]: /install/#manual-instructions
  </div>
</article>

## Post-Install

Provided that no errors occurred, you should see this output once the
[ronin-install.sh] script has completed:

```
Congratulations! You can now run ronin:

	$ ronin help

```

<div class="level">
  <div class="level-left">
  </div>

  <div class="level-item">
    <a class="button" href="../index.html#guides">
      &#x2303; Guides
    </a>
  </div>

  <div class="level-right">
    <a class="button" href="../using-the-ronin-cli/">
      Using the Ronin CLI &raquo;
    </a>
  </div>
</div>
