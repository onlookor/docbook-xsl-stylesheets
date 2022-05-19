<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:d="http://docbook.org/ns/docbook"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:doc="http://nwalsh.com/xsl/documentation/1.0"
	exclude-result-prefixes="doc"
	version="1.0">
	<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/common/common.xsl"/>

	<xsl:param name="local.l10n.xml" select="document('')"/>
	<l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
		<l:l10n language="zh_cn">
			<l:context name="title-numbered">
				<l:template name="part" text="第 %n 部分 %t"/>
			</l:context>    
		</l:l10n>
	</l:i18n>
	<xsl:template name="person.name">
		<!-- Formats a personal name. Handles corpauthor as a special case. This template is copied from Docbook XSL release.-->
		<xsl:param name="node" select="."/>

		<xsl:param name="style">
			<xsl:choose>
				<xsl:when test="$node/@role">
					<xsl:value-of select="$node/@role"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="gentext.template">
						<xsl:with-param name="context" select="'styles'"/>
						<xsl:with-param name="name" select="'person-name'"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>

		<xsl:choose>
			<!-- the personname element is a specialcase -->
			<xsl:when test="$node/d:personname">
				<xsl:call-template name="person.name">
					<xsl:with-param name="node" select="$node/d:personname"/>
				</xsl:call-template>
			</xsl:when>

			<!-- handle corpauthor as a special case...-->
			<!-- * MikeSmith 2007-06: I'm wondering if the person.name template -->
			<!-- * actually ever gets called to handle corpauthor.. maybe -->
			<!-- * we don't actually need to check for corpauthor here. -->
			<xsl:when test="local-name($node)='corpauthor'">
				<xsl:apply-templates select="$node"/>
			</xsl:when>

			<xsl:otherwise>
				<xsl:choose>
					<!-- Handle case when personname contains only general markup (DocBook 5.0) -->
					<xsl:when test="$node/self::d:personname and not($node/d:firstname or $node/d:honorific or $node/d:lineage or $node/d:othername or $node/d:surname)">
						<xsl:apply-templates select="$node/node()"/>
					</xsl:when>
					<xsl:when test="$style = 'family-given'">
						<xsl:call-template name="person.name.family-given">
							<xsl:with-param name="node" select="$node"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$style = 'last-first'">
						<xsl:call-template name="person.name.last-first">
							<xsl:with-param name="node" select="$node"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$style = 'chinese'">
						<xsl:call-template name="person.name.chinese">
							<xsl:with-param name="node" select="$node"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="person.name.first-last">
							<xsl:with-param name="node" select="$node"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="person.name.chinese">
		<!--Formats a chinese personal name in Chinese. The name inherited from family comes first, and there is no seperator between the components of a name.--> 
		<xsl:param name="node" select="."/>
		<xsl:if test="$node//d:surname and $node//d:givenname">
			<xsl:apply-templates select="$node//d:surname[1]"/>
			<xsl:apply-templates select="$node//d:givenname[1]"/>
		</xsl:if>
		<xsl:if test="$node//d:surname and $node//d:firstname">
			<xsl:if test="$node//d:surname">
				<xsl:apply-templates select="$node//d:surname[1]"/>
			</xsl:if>
			<xsl:if test="$node//d:firstname">
				<xsl:apply-templates select="$node//d:firstname[1]"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
