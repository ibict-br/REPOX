<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
    xmlns:oai_etdms="http://www.ndltd.org/standards/metadata/etdms/1.0/"
	xmlns:mtd3-br="http://200.130.0.199/mtd3-br/" 
    	exclude-result-prefixes="oai_etdms vmf fn mtd3-br xs">
	
	<xsl:template name="vmf:vmf3_inputtotype">
			<xsl:param name="input" select="/.."/>
			<xsl:if test="contains($input,'masterThesis')">
				<xsl:value-of select="'Master'"/>
			</xsl:if>
			<xsl:if test="contains($input,'doctoralThesis')">
				<xsl:value-of select="'Doctoral'"/>
			</xsl:if>
	</xsl:template>
	
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<oai_etdms:thesis xmlns:oai_etdms="http://www.ndltd.org/standards/metadata/etdms/1.0/" 
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xsi:schemaLocation="http://www.ndltd.org/standards/metadata/etdms/1.0/ 
			http://www.ndltd.org/standards/metadata/etdms/1.0/etdms.xsd">
			
			<xsl:if test="fn:exists(//mtd3-br:title)">
				<oai_etdms:title>
					<xsl:value-of select="//mtd3-br:title"/>
				</oai_etdms:title>
			</xsl:if>
			
			<xsl:if test="fn:exists(//mtd3-br:titleAlternative)">
				<oai_etdms:alternativeTitle>
					<xsl:value-of select="//mtd3-br:titleAlternative"/>
				</oai_etdms:alternativeTitle>
			</xsl:if>
		
			<xsl:if test="fn:exists(//mtd3-br:contributorAuthor)">
				<oai_etdms:creator>
					<xsl:value-of select="//mtd3-br:contributorAuthor"/>
				</oai_etdms:creator>
			</xsl:if>
			
			<xsl:for-each select="//mtd3-br:subject">
				<oai_etdms:subject>
					<xsl:value-of select="."/>
				</oai_etdms:subject>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:subjectCnpq">
				<oai_etdms:subject>
					<xsl:value-of select="."/>
				</oai_etdms:subject>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:descriptionAbstract">
				<oai_etdms:description>
					<xsl:value-of select="."/>
				</oai_etdms:description>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:descriptionSponsorship">
				<oai_etdms:description>
					<xsl:value-of select="."/>
				</oai_etdms:description>
			</xsl:for-each>
			
			<xsl:if test="fn:exists(//mtd3-br:identifierCitation)">
				<oai_etdms:description>
					<xsl:value-of select="//mtd3-br:identifierCitation"/>
				</oai_etdms:description>
			</xsl:if>
			
			<xsl:if test="fn:exists(//mtd3-br:publisher)">
				<oai_etdms:publisher>
					<xsl:value-of select="concat(//mtd3-br:publisher,' - ',//mtd3-br:publisherInitials)"/>
				</oai_etdms:publisher>
			</xsl:if>
			
			<xsl:for-each select="//mtd3-br:contributorAdvisor">
				<oai_etdms:contributor>
					<xsl:attribute name="role">
						<xsl:text>advisor</xsl:text>
					</xsl:attribute>
					<xsl:value-of select="."/>
				</oai_etdms:contributor>
			</xsl:for-each>	
				
			<xsl:for-each select="//mtd3-br:contributorAdvisor-co">
				<oai_etdms:contributor>
					<xsl:attribute name="role">
						<xsl:text>co-advisor</xsl:text>
					</xsl:attribute>
					<xsl:value-of select="."/>
				</oai_etdms:contributor>
			</xsl:for-each>
			
			<xsl:for-each select="//mtd3-br:contributorReferees">
				<oai_etdms:contributor>
					<xsl:attribute name="role">
						<xsl:text>committee_member</xsl:text>
					</xsl:attribute>
					<xsl:value-of select="."/>
				</oai_etdms:contributor>
			</xsl:for-each>


			<xsl:if test="fn:exists(//mtd3-br:dateIssued)">
				<oai_etdms:date>
					<xsl:value-of select="//mtd3-br:dateIssued"/>
				</oai_etdms:date>
			</xsl:if>
			
			<xsl:if test="not(fn:exists(//mtd3-br:dateIssued))">
				<oai_etdms:date>
					<xsl:value-of select="//mtd3-br:dateAvailable"/>
				</oai_etdms:date>
			</xsl:if>
		
			<oai_etdms:type> 
				<xsl:text>Electronic Thesis or Dissertation</xsl:text>
			</oai_etdms:type>
			
			<oai_etdms:type> 
				<xsl:text>Text</xsl:text>
			</oai_etdms:type>
			
			
			<xsl:if test="fn:exists(//mtd3-br:format)">
				<oai_etdms:format>
					<xsl:value-of select="//mtd3-br:format"/>
				</oai_etdms:format>
			</xsl:if>

			<xsl:if test="not(fn:exists(//mtd3-br:format))">
				<oai_etdms:format>
					<xsl:text>unknown</xsl:text>
				</oai_etdms:format>
			</xsl:if>			

				
			<xsl:if test="fn:exists(//mtd3-br:identifierUri)">
				<oai_etdms:identifier>
					<xsl:value-of select="//mtd3-br:identifierUri"/>
				</oai_etdms:identifier>
			</xsl:if>



			
			<xsl:if test="fn:exists(//mtd3-br:language)">
				<oai_etdms:language>
					<xsl:value-of select="//mtd3-br:language"/>
				</oai_etdms:language>
			</xsl:if>	
			
			<!--
			<xsl:if test="fn:exists(//mtd3-br:)">
				<coverage>
					<xsl:value-of select="//mtd3-br:"/>
				</coverage>
			</xsl:if>
			-->
				
			<xsl:if test="fn:exists(//mtd3-br:rights)">
				<oai_etdms:rights>
					<xsl:value-of select="//mtd3-br:rights"/>
				</oai_etdms:rights>
			</xsl:if>	
			
			<xsl:if test="fn:exists(//mtd3-br:rightsUri)">
				<oai_etdms:rights>
					<xsl:value-of select="//mtd3-br:rightsUri"/>
				</oai_etdms:rights>
			</xsl:if>	
			
			
			<oai_etdms:degree>
				
				<xsl:if test="fn:exists(//mtd3-br:publisherProgram)">
					<oai_etdms:name>
						<xsl:value-of select="//mtd3-br:publisherProgram"/>
					</oai_etdms:name>
				</xsl:if>
				
				<xsl:if test="fn:exists(//mtd3-br:type)">
					<oai_etdms:level>
						<xsl:call-template name="vmf:vmf3_inputtotype">
							<xsl:with-param name="input" select="//mtd3-br:type"/>
						</xsl:call-template>
					</oai_etdms:level>				
				</xsl:if>
				
				<xsl:if test="fn:exists(//mtd3-br:publisherProgram)">
					<oai_etdms:discipline>
							<xsl:value-of select="//mtd3-br:publisherProgram"/>
					</oai_etdms:discipline>
				</xsl:if>
				
				<xsl:if test="fn:exists(//mtd3-br:publisher)">
					<oai_etdms:grantor>
							<xsl:value-of select="//mtd3-br:publisher"/>
					</oai_etdms:grantor>
				</xsl:if>
				
			</oai_etdms:degree>
		</oai_etdms:thesis>
	</xsl:template>
</xsl:stylesheet>