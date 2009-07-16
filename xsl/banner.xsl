<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="banner">
    <div id="banner">
      <img id="logo" src="/images/logo.png">
        <xsl:attribute name="alt"><xsl:value-of select="$project-title" /> logo</xsl:attribute>
      </img>

      <img id="banner_flowers" src="/images/hexagons_flowers.png" alt="hexagons with flowers" />
    </div>
  </xsl:template>

</xsl:stylesheet>
