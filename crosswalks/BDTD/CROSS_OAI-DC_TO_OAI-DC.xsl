<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" 			
    	exclude-result-prefixes="oai_dc  vmf fn ">

	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
			
		<oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" 
			xmlns:dc="http://purl.org/dc/elements/1.1/" 
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
			xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
		
			<xsl:if test="fn:exists(//dc:creator)">
				<dc:creator>
					 <xsl:text>TESTANDO</xsl:text>
				</dc:creator>
			</xsl:if>
			
			<xsl:for-each select="//dc:contributor">
				<dc:contributor>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
					
				</dc:contributor>
			</xsl:for-each>
			
			<xsl:for-each select="//dc:contributor">
				<dc:contributor>
					<xsl:value-of select="."/>
				</dc:contributor>
			</xsl:for-each>
			
			<xsl:for-each select="//dc:contributor">
				<dc:contributor>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:contributor>
			</xsl:for-each>

			<xsl:for-each select="//dc:date">
				<dc:date>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:date>
			</xsl:for-each>
			
						
			<xsl:if test="fn:exists(//dc:identifier)">
				<dc:identifier>
					<xsl:value-of select="fn:replace(//dc:identifier,'􀀀','-')"/>
				</dc:identifier>
			</xsl:if>

			
			<xsl:for-each select="//dc:description">
				<dc:description>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:description>
			</xsl:for-each>
			
			

			

			
			<xsl:if test="fn:exists(//dc:publisher)">
				<dc:publisher>
					<xsl:value-of select="fn:replace(//dc:publisher,'􀀀','-')"/>	
				</dc:publisher>
			</xsl:if>

			<xsl:if test="fn:exists(//dc:type)">
				<dc:type> 
					<xsl:value-of select="//dc:type"/>
				</dc:type>
			</xsl:if>
			
			<xsl:if test="fn:exists(//dc:title)">
				<dc:title>
					<xsl:value-of select="fn:replace(//dc:title,'􀀀','-')"/>	
				</dc:title>
			</xsl:if>
			

			
			<xsl:if test="fn:exists(//dc:language)">
				<dc:language>
					<xsl:value-of select="//dc:language"/>
				</dc:language>
			</xsl:if>	
			
			<xsl:if test="fn:exists(//dc:rights)">
				<dc:rights>
					<xsl:value-of select="//dc:rights"/>
				</dc:rights>
			</xsl:if>	
			
			<xsl:if test="fn:exists(//dc:rights)">
				<dc:rights>
					<xsl:value-of select="//dc:rights"/>
				</dc:rights>
			</xsl:if>	
			
			<xsl:for-each select="//dc:subject">
				<dc:subject>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:subject>
			</xsl:for-each>
			
			
			<xsl:if test="fn:exists(//dc:format)">
				<dc:format>
					<xsl:value-of select="//dc:format"/>
				</dc:format>
			</xsl:if>
			
			<xsl:for-each select="//dc:relation">
				<dc:relation>
					<xsl:value-of select="."/>
				</dc:relation>
			</xsl:for-each>
			
		</oai_dc:dc>
	</xsl:template>
</xsl:stylesheet>