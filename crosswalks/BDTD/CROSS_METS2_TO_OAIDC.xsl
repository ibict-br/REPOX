<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:METS="http://www.loc.gov/METS/" 
xmlns:MODS="http://www.loc.gov/standards/mods/v3/" 
xmlns:PREMIS="http://www.loc.gov/standards/premis"
xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf" 
xmlns:xs="http://www.w3.org/2001/XMLSchema" 
xmlns:fn="http://www.w3.org/2005/xpath-functions" 
xmlns:dim="http://www.dspace.org/xmlns/dspace/dim"
exclude-result-prefixes="vmf xs dim fn METS MODS PREMIS">
	

	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
				
	<xsl:template match="METS:mets">

	<oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
		
        <!-- TIPO DE DOCUMENTO -->
	
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:genre">
			<dc:type>
				<xsl:sequence select="fn:string(.)"/> 
			</dc:type>
		</xsl:for-each>
	
        <!-- TÍTULO -->
	
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:titleInfo[not(@*)]">
			<dc:title>
				<xsl:sequence select="fn:string(.)"/> 
			</dc:title>
		</xsl:for-each> 
		
		<!-- TÍTULO ALTERNATIVO -->
		
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:titleInfo[@type='alternative']">
			<dc:title>
				<xsl:sequence select="fn:string(.)"/> 
			</dc:title>
		</xsl:for-each> 
		
		<!--  AUTOR -->
	
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:name/*:namePart[preceding-sibling::*:role/*:roleTerm='author']">
			<dc:creator>
				<xsl:sequence select="fn:string(.)"/> 
			</dc:creator>
		</xsl:for-each> 

		<!--  ORIENTADOR -->
	
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:name/*:namePart[preceding-sibling::*:role/*:roleTerm='advisor']">
			<dc:contributor>
				<xsl:sequence select="fn:string(.)"/> 
			</dc:contributor>
		</xsl:for-each> 
		
		<!--  DATA DE DEFESA -->

		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:originInfo/*:dateIssued">
			<dc:date>
				<xsl:sequence select="fn:string(.)"/> 
			</dc:date>
		</xsl:for-each> 
		
		<!-- INSTITUIÇÃO -->
		
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:originInfo/*:publisher">
			<dc:publisher>
				<xsl:sequence select="fn:string(.)"/> 
			</dc:publisher>
		</xsl:for-each> 
		
		<!-- TIPO DE ACESSO -->

		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:accessCondition">
			<dc:rights>
				<xsl:sequence select="fn:string(.)"/> 
			</dc:rights>
		</xsl:for-each> 
		
		<!-- RESUMO -->
		
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:note">
			<dc:description>
				<xsl:sequence select="fn:string(.)"/> 
			</dc:description>
		</xsl:for-each> 
		
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:abstract">
			<dc:description>
				<xsl:sequence select="fn:string(.)"/> 
			</dc:description>
		</xsl:for-each> 
		
		<!-- PALAVRAS-CHAVE -->
		
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:subject/*:topic">
			<dc:subject>
				<xsl:sequence select="fn:string(.)"/> 
			</dc:subject>
		</xsl:for-each> 
		
		<!-- IDIOMA -->
		
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:language/*:languageTerm">
			<dc:language>
				<xsl:sequence select="fn:string(.)"/> 
			</dc:language>
		</xsl:for-each> 
		
		<!-- CITAÇÃO -->
		
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:identifier[@type='citation']">
			<dc:citation>
				<xsl:sequence select="fn:string(.)"/> 
			</dc:citation>
		</xsl:for-each> 
		
		
		<!-- IDENTIFICADORES -->
		
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:identifier">
			<dc:identifier>
				<xsl:sequence select="fn:string(.)"/> 
			</dc:identifier>
		</xsl:for-each> 
		
				
		<!-- TIPO DE ARQUIVO -->
		
		<xsl:for-each select="METS:amdSec/METS:techMD/METS:mdWrap/METS:xmlData/*:premis/*:object/*:objectCharacteristics/*:format/*:formatDesignation/*:formatName">
			<dc:format>
				<xsl:sequence select="fn:string(.)"/> 
			</dc:format>
		</xsl:for-each> 
			
		<!-- FONTE -->
		
		<xsl:for-each select="METS:metsHdr/METS:agent/METS:name">
			<dc:source>
				<xsl:sequence select="fn:string(.)"/> 
			</dc:source>
		</xsl:for-each> 
		
	</oai_dc:dc>
	</xsl:template>
</xsl:stylesheet>
