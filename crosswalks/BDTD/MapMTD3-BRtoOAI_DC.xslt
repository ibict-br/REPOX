<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:mtd3-br="http://10.0.0.173/mtd3br"
    	exclude-result-prefixes="mtd3-br">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
					<oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" 			xmlns:dc="http://purl.org/dc/elements/1.1/" 			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 	xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd">		
			<xsl:for-each select="//mtd3-br:title">
				<dc:title>
					<xsl:value-of select="." />
				</dc:title>
			</xsl:for-each>		
			<xsl:for-each select="//mtd3-br:contributorAuthor">
				<dc:creator>
					<xsl:value-of select="." />
				</dc:creator>
			</xsl:for-each>			
			<xsl:for-each select="//mtd3-br:subject">
				<dc:subject>
					<xsl:value-of select="." />
				</dc:subject>
			</xsl:for-each>
			<xsl:for-each select="//mtd3-br:descriptionAbstract">
				<dc:description>
					<xsl:value-of select="." />
				</dc:description>
			</xsl:for-each>

		</oai_dc:dc>
	</xsl:template>
</xsl:stylesheet>
