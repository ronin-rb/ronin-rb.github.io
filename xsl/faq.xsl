<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="faq">
    <ol class="faq">
      <xsl:apply-templates select="item" />
    </ol>
  </xsl:template>

  <xsl:template match="faq/item">
    <li class="faq">
      <xsl:apply-templates />
    </li>
  </xsl:template>

  <xsl:template match="faq/item/question">
    <a class="question">
      <xsl:value-of select="." />
    </a>
  </xsl:template>

  <xsl:template match="faq/item/answer">
    <div class="answer">
      <xsl:apply-templates />
    </div>
  </xsl:template>
</xsl:stylesheet>
