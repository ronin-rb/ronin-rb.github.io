<?xml version="1.0"?>
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
