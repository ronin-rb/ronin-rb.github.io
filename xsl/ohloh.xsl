<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="ohloh">
    <div class="ohloh">
      <xsl:apply-templates />
    </div>
  </xsl:template>

  <xsl:template match="ohloh/graph">
    <img>
      <xsl:attribute name="src"><xsl:value-of select="@src" /></xsl:attribute>
      <xsl:if test=".">
        <xsl:attribute name="alt"><xsl:value-of select="." /></xsl:attribute>
      </xsl:if>
    </img>
  </xsl:template>

  <xsl:template match="ohloh/legend">
    <div class="legend">
      <xsl:apply-templates />
    </div>
  </xsl:template>

  <xsl:template match="ohloh/legend/key">
    <span class="key">
      <span>
        <xsl:attribute name="class">swatch</xsl:attribute>
        <xsl:attribute name="style">background-color: <xsl:value-of select="@color" /></xsl:attribute>
        <xsl:comment><xsl:value-of select="." /></xsl:comment>
      </span>

      <xsl:apply-templates />
    </span>
  </xsl:template>
</xsl:stylesheet>
