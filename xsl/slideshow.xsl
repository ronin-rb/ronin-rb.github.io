<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="header.xsl" />
  <xsl:import href="common.xsl" />
  <xsl:import href="project.xsl" />
  <xsl:import href="google_analytics.xsl" />

  <xsl:output method="xml" version="1.0" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.1//EN" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" indent="yes" />

  <!-- Document template -->
  <xsl:template match="/slideshow">
    <html>
      <head>
        <link rel="stylesheet" type="text/css" media="screen" href="/css/slideshow.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="/css/ohloh.css" />
        <xsl:text disable-output-escaping="yes">&lt;script type="text/javascript" src="/scripts/jquery-1.2.6.min.js"&gt;&lt;/script&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;script type="text/javascript" src="/scripts/slideshow.js"&gt;&lt;/script&gt;</xsl:text>

        <xsl:call-template name="header" />
      </head>

      <body>
        <div id="slideshow">
          <img id="logo" src="/images/logo.png">
            <xsl:attribute name="alt"><xsl:value-of select="$project-title" /> logo</xsl:attribute>
          </img>

          <ol id="slides">
            <xsl:comment>Table of Contents</xsl:comment>
          </ol>

          <div id="content">
            <noscript>
              <div class="warning">
                <p>
                  You need JavaScript enabled to view this Slide Show.
                </p>
              </div>
            </noscript>

            <xsl:apply-templates select="slide-set/slide" />
          </div>

          <div id="slideshow_notes">
            <xsl:comment>Slideshow Notes</xsl:comment>
          </div>

          <div id="slideshow_controls">
            <img id="show_slides" src="/images/slideshow/show_slides.png" alt="Show Slides" />

            <img id="prev_slide" src="/images/slideshow/prev_slide.png" alt="Back" />
            <img id="next_slide" src="/images/slideshow/next_slide.png" alt="Next" />

            <img id="show_notes" src="/images/slideshow/show_notes.png" alt="Show Slide Notes" />
          </div>
        </div>
      </body>
    </html>
  </xsl:template>

  <!-- Slide template -->
  <xsl:template match="/slideshow/slide-set/slide">
    <div class="slide">
      <xsl:apply-templates />
    </div>
  </xsl:template>

  <xsl:template match="/slideshow/slide-set/slide/title">
    <h2 class="title"><xsl:value-of select="." /></h2>
  </xsl:template>

  <xsl:template match="slideshow/slide-set/slide//a">
    <a target="_new">
      <xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute>
      <xsl:value-of select="." />
    </a>
  </xsl:template>

  <xsl:template match="slideshow/slide-set/slide//skip">
    <a>
      <xsl:attribute name="href">javascript:showSlide(<xsl:value-of select="@to" />);</xsl:attribute>
      <xsl:value-of select="." />
    </a>
  </xsl:template>

  <xsl:template match="/slideshow/slide-set/slide/notes">
    <div class="notes">
      <xsl:apply-templates />
    </div>
  </xsl:template>

</xsl:stylesheet>
