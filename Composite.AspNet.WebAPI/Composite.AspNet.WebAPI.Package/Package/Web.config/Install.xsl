<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="/configuration/system.web/compilation/assemblies">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()" />
			<xsl:if test="count(add[@assembly='System.Net.Http, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'])=0">
				<add assembly="System.Net.Http, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" />
			</xsl:if>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="/configuration/system.webServer/modules">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()" />
			<xsl:if test="count(remove[@name='WebDAVModule'])=0">
				<remove name="WebDAVModule" />
			</xsl:if>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>