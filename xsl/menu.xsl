<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Menu templates -->
  <xsl:template match="menu">
    <ul class="menu">
      <li class="menu_top" />
      <li class="menu_middle">
        <ul class="menu_contents">
          <xsl:apply-templates select="item" />
        </ul>
      </li>
      <li class="menu_bottom" />
    </ul>
  </xsl:template>

  <xsl:template match="menu/item">
    <li class="menu_item">
      <xsl:apply-templates />
    </li>
  </xsl:template>

</xsl:stylesheet>
