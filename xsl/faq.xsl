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
