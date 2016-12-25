<?xml version="1.0" encoding="us-ascii"?>
<!--
	A Programmer's Guide to SJCAM SJ4000 WiFi
	Copyright (C) 2016 Nutchanon Wetchasit
	
	This guide is free document: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation.
	
	This guide is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
	
	You should have received a copy of the GNU General Public License
	along with this guide. If not, see <http://www.gnu.org/licenses/gpl.html>
	
	Additionally, permission to redistribute and/or modify this guide
	is also provided under the terms of the GNU Free Documentation License
	as published by the Free Software Foundation; with no Invariant Sections,
	with no Front-Cover Texts, and with no Back-Cover Texts. A copy of this
	license could be obtained from <http://www.gnu.org/licenses/fdl.html>
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/fo/docbook.xsl"/>
	<xsl:param name="paper.type">A4</xsl:param>
	<xsl:param name="header.column.widths">1 4 1</xsl:param>
	<xsl:param name="body.start.indent">0pc</xsl:param>
	<xsl:param name="shade.verbatim" select="1"/>
	<xsl:param name="hyphenate.verbatim" select="1"/>
	<xsl:attribute-set name="monospace.verbatim.properties" use-attribute-sets="verbatim.properties monospace.properties">
		<xsl:attribute name="wrap-option">wrap</xsl:attribute>
		<xsl:attribute name="hyphenation-character">&#x00BB;</xsl:attribute>
	</xsl:attribute-set>
	<xsl:param name="ulink.footnotes" select="1"/>
	<xsl:param name="generate.consistent.ids" select="1"/>
	<xsl:param name="autolink.index.see" select="0"/>
	<xsl:param name="fop1.extensions" select="1"/>
	<xsl:template match="phrase[@lang = 'ja' or @lang = 'zh']">
		<fo:inline xmlns:fo="http://www.w3.org/1999/XSL/Format" font-family="AR PL UMing CN,SimSun,serif">
			<xsl:call-template name="anchor"/>
			<xsl:call-template name="inline.charseq"/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="phrase[@lang = 'ko']">
		<fo:inline xmlns:fo="http://www.w3.org/1999/XSL/Format" font-family="Baekmuk Batang,UnBatang,Batang,serif">
			<xsl:call-template name="anchor"/>
			<xsl:call-template name="inline.charseq"/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="phrase[@lang = 'he']">
		<fo:inline xmlns:fo="http://www.w3.org/1999/XSL/Format" font-family="FreeSerif,Times New Roman,serif">
			<xsl:call-template name="anchor"/>
			<xsl:call-template name="inline.charseq"/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="phrase[@lang = 'ru']">
		<fo:inline xmlns:fo="http://www.w3.org/1999/XSL/Format" font-family="Nimbus Roman No9 L,Times New Roman,FreeSerif,serif">
			<xsl:call-template name="anchor"/>
			<xsl:call-template name="inline.charseq"/>
		</fo:inline>
	</xsl:template>
	<xsl:param name="local.l10n.xml" select="document('')"/>
	<l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
		<l:l10n language="en">
			<l:context name="xref">
				<l:template name="section" text="&#8220;%t&#8221; section"/>
			</l:context>
		</l:l10n>
	</l:i18n>
</xsl:stylesheet>
