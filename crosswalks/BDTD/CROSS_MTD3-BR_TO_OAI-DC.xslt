<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" 			
	xmlns:mtd3-br="http://200.130.0.199/mtd3-br/" 
    	exclude-result-prefixes="oai_dc  vmf fn mtd3-br">

	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
			
		<oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" 
			xmlns:dc="http://purl.org/dc/elements/1.1/" 
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
			xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
		
			<xsl:if test="fn:exists(//mtd3-br:contributorAuthor)">
				<xsl:for-each select="//mtd3-br:contributorAuthor">
					<dc:creator>
						<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
					</dc:creator>
				</xsl:for-each>
			</xsl:if>
			<!--
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='contributor'][@qualifier='authorID']">
				<mtd3-br:contributorAuthorID>
					<xsl:value-of select="."/>
				</mtd3-br:contributorAuthorID>
			</xsl:for-each>
			-->
			
			<xsl:for-each select="//mtd3-br:contributorAdvisor">
				<dc:contributor>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:contributor>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:contributorAdvisor-co">
				<dc:contributor>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:contributor>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:contributorAdvisor-co1">
				<dc:contributor>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:contributor>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:contributorAdvisor-co2">
				<dc:contributor>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:contributor>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:contributorReferees">
				<dc:contributor>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:contributor>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:contributorReferees1">
				<dc:contributor>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:contributor>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:contributorReferees2">
				<dc:contributor>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:contributor>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:contributorReferees3">
				<dc:contributor>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:contributor>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:contributorReferees4">
				<dc:contributor>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:contributor>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:contributorReferees5">
				<dc:contributor>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:contributor>
			</xsl:for-each>

			<xsl:for-each select="//mtd3-br:dateIssued">			
				<dc:date>
					<xsl:value-of select="."/>
				</dc:date>
			</xsl:for-each>

			<xsl:for-each select="//mtd3-br:dateAvailable">			
				<dc:date>
					<xsl:value-of select="."/>
				</dc:date>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:dateAccessioned">	
				<dc:date>
					<xsl:value-of select="."/>
				</dc:date>
			</xsl:for-each>
			

			<xsl:for-each select="//mtd3-br:identifierUri">			
				<dc:identifier>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:identifier>
			</xsl:for-each>
			<!--
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='identifier'][@qualifier='doi']">
				<mtd3-br:identifierDoi>
					<xsl:value-of select="."/>
				</mtd3-br:identifierDoi>
			</xsl:for-each>
			-->
			
			<xsl:for-each select="//mtd3-br:descriptionAbstract">
				<dc:description>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:description>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:descriptionSponsorship">
				<dc:description>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:description>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:identifierCitation">
				<dc:description>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:description>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:publisherDepartament">
				<dc:description>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:description>
			</xsl:for-each>

			<xsl:for-each select="//mtd3-br:publisherProgram">	
				<dc:description>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>	
				</dc:description>
			</xsl:for-each>
			
			<xsl:if test="fn:exists(//mtd3-br:publisher)">
				<dc:publisher>
					<xsl:value-of select="fn:replace(concat(//mtd3-br:publisher[1],' - ',//mtd3-br:publisherInitials[1]),'􀀀','-')"/>	
				</dc:publisher>
			</xsl:if>

			<xsl:for-each select="//mtd3-br:type">
				<dc:type> 
					<xsl:value-of select="."/>
				</dc:type>
			</xsl:for-each>			
			
			<xsl:for-each select="//mtd3-br:title">
				<dc:title>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>	
				</dc:title>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:titleAlternative">
				<dc:title>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>	
				</dc:title>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:language">
				<dc:language>
					<xsl:value-of select="."/>
				</dc:language>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:rights">
				<dc:rights>
					<xsl:value-of select="."/>
				</dc:rights>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:rightsUri">
				<dc:rights>
					<xsl:value-of select="."/>
				</dc:rights>
			</xsl:for-each>	
			
			<xsl:for-each select="//mtd3-br:subject">
				<dc:subject>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:subject>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:subjectCnpq">
				<dc:subject>
					<xsl:value-of select="fn:replace(.,'􀀀','-')"/>
				</dc:subject>
			</xsl:for-each>

			<xsl:for-each select="//mtd3-br:format">			
				<dc:format>
					<xsl:value-of select="."/>
				</dc:format>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:relation">
				<dc:relation>
					<xsl:value-of select="."/>
				</dc:relation>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:relationOther">
				<dc:relation>
					<xsl:value-of select="."/>
				</dc:relation>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:relationReferences">
				<dc:relation>
					<xsl:value-of select="."/>
				</dc:relation>
			</xsl:for-each>
		</oai_dc:dc>
	</xsl:template>
</xsl:stylesheet>