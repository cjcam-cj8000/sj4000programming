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
	<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/html/chunk.xsl"/>
	<xsl:param name="generate.consistent.ids" select="1"/>
	<xsl:param name="autolink.index.see" select="0"/>
	<xsl:param name="use.id.as.filename" select="1"/>
	<xsl:param name="make.valid.html" select="1"/>
	<xsl:param name="custom.css.source">html-chunked.css.xml</xsl:param>
	<xsl:param name="header.rule" select="0"/>
	<xsl:param name="footer.rule" select="0"/>
	<xsl:param name="chunker.output.doctype-public">-//W3C//DTD HTML 4.01 Transitional//EN</xsl:param>
	<xsl:param name="chunker.output.doctype-system">http://www.w3.org/TR/html4/loose.dtd</xsl:param>
	<xsl:param name="chunker.output.indent">yes</xsl:param>
	<xsl:template name="user.head.content">
		<meta name="viewport" content="initial-scale=1"/>
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
