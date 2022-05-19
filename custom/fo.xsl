<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:d="http://docbook.org/ns/docbook"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:doc="http://nwalsh.com/xsl/documentation/1.0"
	exclude-result-prefixes="doc"
	version="1.0">
	<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/fo/profile-docbook.xsl"/>
	<xsl:include href="titlepages.xsl"/>
	<xsl:include href="custom.xsl"/>
	<xsl:param name="body.font.family">SourceHanSerifCN-Regular</xsl:param>
	<xsl:param name="body.font.master">12</xsl:param>
	<xsl:param name="monospace.font.family">SourceHanSansCN-Regular</xsl:param>
	<xsl:param name="title.font.family">SourceHanSansCN-Regular</xsl:param>
	<xsl:param name="hyphenate">false</xsl:param>
	<xsl:param name="paper.type" select="'A4'"/>
	<xsl:param name="draft.mode" select="'no'"/>
	<xsl:param name="fop1.extensions" select="1"/>
	<xsl:param name="keep.relative.image.uris" select="1"/>

	<!--The following 2 lines determine there's no indent of either titles or bodies processed by FOP-->
	<xsl:param name="body.start.indent">0pt</xsl:param>
	<xsl:param name="title.margin.left">0pt</xsl:param>

	<!--xsl:template match="processing-instruction('hard-pagebreak')">
		<fo:block break-after='page'/>
	</xsl:template-->

	<xsl:attribute-set name="para.in.list">
		<xsl:attribute name="space-before.optimum">0.3em</xsl:attribute>
		<xsl:attribute name="space-before.minimum">0.2em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">0.3em</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="frstparainblock">
		<xsl:attribute name="text-indent">0em</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="para.properties" use-attribute-sets="normal.para.spacing">
		<xsl:attribute name="text-indent">2em</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="list.item.spacing">
		<xsl:attribute name="space-before.optimum">0.3em</xsl:attribute>
		<xsl:attribute name="space-before.minimum">0.2em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">0.3em</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:template match="d:phrase[@role='largefont']">
		<fo:inline xsl:use-attribute-sets="largefont">
			<xsl:call-template name="anchor"/>
			<xsl:call-template name="inline.charseq"/>
		</fo:inline>
	</xsl:template-->
	<xsl:template match="d:listitem/d:para">
		<fo:inline xsl:use-attribute-sets="para.in.list">
			<xsl:call-template name="inline.charseq"/>
		</fo:inline>
		<fo:block xsl:use-attribute-sets="para.in.list">
			<xsl:call-template name="anchor"/>
		</fo:block>
	</xsl:template>
	<!--xsl:template match="d:listitem/d:para[1]">
		<fo:inline xsl:use-attribute-sets="frstparainblock">
			<xsl:call-template name="inline.charseq"/>
		</fo:inline>
		<fo:block xsl:use-attribute-sets="frstparainblock">
			<xsl:call-template name="anchor"/>
		</fo:block>
	</xsl:template-->
</xsl:stylesheet>
