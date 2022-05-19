<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:d="http://docbook.org/ns/docbook"
xmlns:fo="http://www.w3.org/1999/XSL/Format"
xmlns:doc="http://nwalsh.com/xsl/documentation/1.0"
exclude-result-prefixes="doc"
version="1.0">
<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/epub3/profile-chunk.xsl"/>
<xsl:attribute-set name="para.properties" use-attribute-sets="normal.para.spacing">
	<xsl:attribute name="text-indent">2em</xsl:attribute>
</xsl:attribute-set>
</xsl:stylesheet>
