<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="header">
    <xsl:apply-templates select="title" />
    <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=UTF-8" />
    <xsl:apply-templates select="head" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />

    <xsl:text disable-output-escaping="yes">&lt;link rel="alternative" title="RSS" type="application/rss+xml" href="http://rubyforge.org/export/rss_sfnews.php?group_id=</xsl:text>
    <xsl:value-of select="$project-groupid" />
    <xsl:text disable-output-escaping="yes">" /&gt;</xsl:text>

    <xsl:apply-templates select="//rss" />
    <xsl:apply-templates select="//stylesheet" />
    <xsl:apply-templates select="//javascript" />

    <xsl:call-template name="analytics" />
  </xsl:template>

</xsl:stylesheet>
