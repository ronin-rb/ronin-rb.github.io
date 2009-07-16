<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="header.xsl" />
  <xsl:import href="banner.xsl" />
  <xsl:import href="footer.xsl" />

  <xsl:import href="common.xsl" />
  <xsl:import href="faq.xsl" />
  <xsl:import href="project.xsl" />
  <xsl:import href="menu.xsl" />
  <xsl:import href="google_analytics.xsl" />

  <xsl:output method="xml" version="1.0" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.1//EN" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" indent="yes" />

  <!-- Document template -->
  <xsl:template match="/rubyforge">
    <html>
      <head>
        <link rel="stylesheet" type="text/css" media="screen" href="/css/page.css" />

        <xsl:text disable-output-escaping="yes">&lt;!--[if IE]&gt;</xsl:text>
        <link rel="stylesheet" type="text/css" media="screen" href="/css/ie/page.css"/>
        <xsl:text disable-output-escaping="yes">&lt;![endif]--&gt;</xsl:text>

        <xsl:call-template name="header" />
      </head>

      <body>
        <xsl:call-template name="banner" />

        <xsl:apply-templates select="page" />

        <xsl:call-template name="footer" />
      </body>
    </html>
  </xsl:template>

  <!-- Header shortcut templates -->
  <xsl:template match="/rubyforge/title">
    <title><xsl:value-of select="$project-title" /> - <xsl:value-of select="." /></title>
  </xsl:template>

  <!-- Page template -->
  <xsl:template match="/rubyforge/page">
    <div id="page">
      <xsl:apply-templates />
    </div>
  </xsl:template>

  <!-- Content template -->
  <xsl:template match="/rubyforge/page/content">
    <div id="content">
      <xsl:apply-templates />
    </div>
  </xsl:template>

</xsl:stylesheet>
