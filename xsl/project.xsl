<?xml version="1.0" ?>
<!--
  ronin.rubyforge.org.

  Copyright (c) 2006-2009 Hal Brodigan (postmodern.mod3 at gmail.com)

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-->

<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Project templates -->
  <xsl:template match="project-author">
    <xsl:value-of select="$project-author" />
  </xsl:template>

  <xsl:template match="project-email">
    <a>
      <xsl:attribute name="href">mailto:<xsl:value-of select="$project-email" /></xsl:attribute>
      <xsl:value-of select="$project-email" />
    </a>
  </xsl:template>

  <xsl:template match="project-name">
    <xsl:value-of select="$project-name" />
  </xsl:template>

  <xsl:template match="project-title">
    <xsl:value-of select="$project-title" />
  </xsl:template>

  <xsl:template match="project-desc">
    <xsl:value-of select="$project-desc" />
  </xsl:template>

  <xsl:template match="project-page">
    <a>
      <xsl:attribute name="href">http://rubyforge.org/projects/<xsl:value-of select="$project-name" /></xsl:attribute>
      <xsl:apply-templates />
    </a>
  </xsl:template>

  <xsl:template match="project-home">
    <a>
      <xsl:attribute name="href">http://<xsl:value-of select="$project-name" />.rubyforge.org/</xsl:attribute>
      <xsl:apply-templates />
    </a>
  </xsl:template>

  <xsl:template match="project-link">
    <a>
      <xsl:attribute name="href">http://<xsl:value-of select="$project-name" />.rubyforge.org/<xsl:value-of select="@href" /></xsl:attribute>
      <xsl:apply-templates />
    </a>
  </xsl:template>

  <xsl:template match="project-download">
    <a>
      <xsl:choose>
        <xsl:when test="@release">
          <xsl:attribute name="href">http://rubyforge.org/frs/?group_id=<xsl:value-of select="$project-groupid" />&amp;release_id=<xsl:value-of select="@release" /></xsl:attribute>
        </xsl:when>

        <xsl:otherwise>
          <xsl:attribute name="href">http://rubyforge.org/frs/?group_id=<xsl:value-of select="$project-groupid" /></xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>

      <xsl:apply-templates />
    </a>
  </xsl:template>

  <xsl:template match="project-docs">
    <a>
      <xsl:attribute name="href"><xsl:value-of select="$project-docs" /></xsl:attribute>
      <xsl:apply-templates />
    </a>
  </xsl:template>

  <xsl:template match="project-svn">
    <a>
      <xsl:choose>
        <xsl:when test="@href">
          <xsl:attribute name="href"><xsl:value-of select="$project-svn" />/<xsl:value-of select="@href" /></xsl:attribute>
        </xsl:when>

        <xsl:otherwise>
          <xsl:attribute name="href"><xsl:value-of select="$project-svn" />/</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>

      <xsl:apply-templates />
    </a>
  </xsl:template>

  <xsl:template name="rubyforge-link">
    <xsl:param name="atid" />
    <a>
      <xsl:attribute name="href">http://rubyforge.org/tracker/?atid=<xsl:value-of select="$atid" />&amp;group_id=<xsl:value-of select="$project-groupid" />&amp;func=browse</xsl:attribute>

      <xsl:apply-templates />
    </a>
  </xsl:template>

  <xsl:template match="project-bugs">
    <xsl:call-template name="rubyforge-link">
      <xsl:with-param name="atid" select="$project-bugs" />
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="project-support">
    <xsl:call-template name="rubyforge-link">
      <xsl:with-param name="atid" select="$project-support" />
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="project-patches">
    <xsl:call-template name="rubyforge-link">
      <xsl:with-param name="atid" select="$project-patches" />
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="project-features">
    <xsl:call-template name="rubyforge-link">
      <xsl:with-param name="atid" select="$project-features" />
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>
