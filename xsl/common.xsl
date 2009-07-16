<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- HTML shortcut templates -->
  <xsl:template match="head/description">
    <meta>
      <xsl:attribute name="name">Description</xsl:attribute>
      <xsl:attribute name="content"><xsl:value-of select="." /></xsl:attribute>
    </meta>
  </xsl:template>

  <xsl:template match="head/keywords">
    <meta>
      <xsl:attribute name="name">Keywords</xsl:attribute>
      <xsl:attribute name="content"><xsl:value-of select="." /></xsl:attribute>
    </meta>
  </xsl:template>

  <xsl:template match="javascript">
    <script type="text/javascript">
      <xsl:attribute name="src"><xsl:value-of select="@src" /></xsl:attribute>
    </script><xsl:text disable-output-escaping="yes">&lt;/script&gt;</xsl:text>
  </xsl:template>

  <xsl:template match="rss">
    <link>
      <xsl:attribute name="rel">alternate</xsl:attribute>
      <xsl:attribute name="title">RSS</xsl:attribute>
      <xsl:attribute name="type">application/rss+xml</xsl:attribute>
      <xsl:attribute name="href"><xsl:value-of select="@src" /></xsl:attribute>
    </link>
  </xsl:template>

  <xsl:template match="stylesheet">
    <link>
      <xsl:attribute name="rel">stylesheet</xsl:attribute>
      <xsl:attribute name="type">text/css</xsl:attribute>
      <xsl:attribute name="media">screen</xsl:attribute>
      <xsl:attribute name="href"><xsl:value-of select="@src" /></xsl:attribute>
    </link>
  </xsl:template>

  <xsl:template match="image">
    <img>
      <xsl:attribute name="src"><xsl:value-of select="@src" /></xsl:attribute>
      <xsl:if test=".">
        <xsl:attribute name="alt"><xsl:value-of select="." /></xsl:attribute>
      </xsl:if>
    </img>
  </xsl:template>

  <xsl:template match="email">
    <a>
      <xsl:attribute name="href">mailto:<xsl:value-of select="." /></xsl:attribute>
      <xsl:value-of select="." />
    </a>
  </xsl:template>

  <xsl:template match="code">
    <xsl:if test="@file">
      <p><xsl:value-of select="@file" />:</p>
    </xsl:if>

    <pre>
      <xsl:attribute name="class">code</xsl:attribute>
      <xsl:apply-templates />
    </pre>
  </xsl:template>

  <xsl:template match="shell">
    <pre>
      <xsl:attribute name="class">shell</xsl:attribute>
      <xsl:apply-templates />
    </pre>
  </xsl:template>

  <xsl:template match="quote">
    <blockquote class="quote">
      <xsl:apply-templates />
    </blockquote>
  </xsl:template>

  <xsl:template match="quote/from">
    <blockquote class="quote-from">
      <p>-- <xsl:value-of select="." /></p>
    </blockquote>
  </xsl:template>

  <xsl:template match="footnote">
    <div>
      <xsl:attribute name="class">footnote</xsl:attribute>
      <xsl:apply-templates />
    </div>
  </xsl:template>

  <xsl:template match="note">
    <div>
      <xsl:attribute name="class">note</xsl:attribute>
      <xsl:apply-templates />
    </div>
  </xsl:template>

  <xsl:template match="warning">
    <div>
      <xsl:attribute name="class">warning</xsl:attribute>
      <xsl:apply-templates />
    </div>
  </xsl:template>

  <xsl:template match="list">
    <ul>
      <xsl:apply-templates select="item" />
    </ul>
  </xsl:template>

  <xsl:template match="list/item">
    <li>
      <xsl:apply-templates />
    </li>
  </xsl:template>

  <xsl:template match="instructions">
    <ol>
      <xsl:apply-templates select="item" />
    </ol>
  </xsl:template>

  <xsl:template match="instructions/item">
    <li>
      <xsl:apply-templates />
    </li>
  </xsl:template>

  <xsl:template match="label">
    <a>
      <xsl:attribute name="href">#<xsl:value-of select="@name" /></xsl:attribute>
      <xsl:attribute name="id"><xsl:value-of select="@name" /></xsl:attribute>
      <xsl:apply-templates />
    </a>
  </xsl:template>

  <xsl:template match="jump">
    <a>
      <xsl:attribute name="href">#<xsl:value-of select="@name" /></xsl:attribute>
      <xsl:apply-templates />
    </a>
  </xsl:template>

  <xsl:template match="section">
    <h1>
      <xsl:choose>
        <xsl:when test="@label">
          <a class="section">
            <xsl:attribute name="href">#<xsl:value-of select="@label" /></xsl:attribute>
            <xsl:attribute name="id"><xsl:value-of select="@label" /></xsl:attribute>
            <xsl:value-of select="@title" />
          </a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@title" />
        </xsl:otherwise>
      </xsl:choose>
    </h1>

    <div class="section_content">
      <xsl:apply-templates />
    </div>
  </xsl:template>

  <xsl:template match="subsection">
    <h2>
      <xsl:choose>
        <xsl:when test="@label">
          <a class="section">
            <xsl:attribute name="href">#<xsl:value-of select="@label" /></xsl:attribute>
            <xsl:attribute name="id"><xsl:value-of select="@label" /></xsl:attribute>
            <xsl:value-of select="@title" />
          </a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@title" />
        </xsl:otherwise>
      </xsl:choose>
    </h2>

    <div>
      <xsl:apply-templates />
    </div>
  </xsl:template>

  <!-- Normal HTML templates -->
  <xsl:template match="p">
    <p>
      <xsl:apply-templates />
    </p>
  </xsl:template>

  <xsl:template match="br">
    <br />
  </xsl:template>

  <xsl:template match="a">
    <a>
      <xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute>
      <xsl:value-of select="." />
    </a>
  </xsl:template>

  <xsl:template match="b">
    <strong>
      <xsl:apply-templates />
    </strong>
  </xsl:template>

  <xsl:template match="u">
    <span class="underlined">
      <xsl:apply-templates />
    </span>
  </xsl:template>

  <xsl:template match="i">
    <i>
      <xsl:apply-templates />
    </i>
  </xsl:template>

  <xsl:template match="kbd">
    <kbd>
      <xsl:apply-templates />
    </kbd>
  </xsl:template>

  <xsl:template match="noscript">
    <noscript>
      <xsl:value-of select="@src" />
    </noscript>
  </xsl:template>

  <!-- HTML entity templates -->
  <xsl:template match="copyright">
    &#169;
  </xsl:template>

  <xsl:template match="r">
    &#174;
  </xsl:template>

  <xsl:template match="tm">
    &#8482;
  </xsl:template>

</xsl:stylesheet>
