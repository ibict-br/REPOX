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

	<dim:dim xmlns:dim="http://www.dspace.org/xmlns/dspace/dim" xmlns:doc="http://www.lyncode.com/xoai" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.dspace.org/xmlns/dspace/dim http://www.dspace.org/schema/dim.xsd">
		
        <!-- TIPO DE DOCUMENTO -->
	
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:genre">
			<dim:field element="type" mdschema="dc">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each>
	
        <!-- TÍTULO -->
	
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:titleInfo[not(@*)]">
			<dim:field element="title" mdschema="dc">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each> 
		
		<!-- TÍTULO ALTERNATIVO 
		
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:titleInfo[@type='alternative']">
			<dim:field element="title" mdschema="dc">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each> -->
		
		<!--  AUTOR -->
	
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:name/*:namePart[preceding-sibling::*:role/*:roleTerm='author']">
			<dim:field element="author" mdschema="dc">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each> 

		<!--  ORIENTADOR -->
	
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:name/*:namePart[preceding-sibling::*:role/*:roleTerm='advisor']">
			<dim:field element="advisor" mdschema="dc">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each> 
		
		<!--  DATA DE DEFESA -->

		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:originInfo/*:dateIssued">
			<dim:field element="date" mdschema="dc" qualifier="issued">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each> 
		
		<!-- INSTITUIÇÃO -->
		
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:originInfo/*:publisher">
			<dim:field element="publisher" mdschema="dc">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each> 
		
		<!-- TIPO DE ACESSO -->

		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:accessCondition">
			<dim:field element="rights" mdschema="dc">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each> 
		
		<!-- RESUMO 
		
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:abstract">
			<dim:field element="description" mdschema="dc" qualifier="abstract">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each> -->
		
		<!-- PALAVRAS-CHAVE 
		
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:subject/*:topic">
			<dim:field element="subject" mdschema="dc">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each> -->
		
		<!-- IDIOMA -->
		
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:language/*:languageTerm">
			<dim:field element="language" mdschema="dc">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each> 
		
		<!-- CITAÇÃO 
		
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:identifier[@type='citation']">
			<dim:field element="description" mdschema="dc" qualifier="citation">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each> -->
		
		<!-- ISSN 
		
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:identifier[@type='issn']">
			<dim:field element="identifier" mdschema="dc" qualifier="issn">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each> --> 
		
		<!-- ISBN 
		
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:identifier[@type='isbn']">
			<dim:field element="identifier" mdschema="dc" qualifier="isbn">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each> -->
		
		<!-- URI -->
		
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:identifier[@type='uri']">
			<dim:field element="identifier" mdschema="dc" qualifier="uri">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each> 
		
		<!-- BITSTREAM 
		
		<xsl:for-each select="METS:amdSec/METS:techMD/METS:mdWrap/METS:xmlData/*:premis/*:object/*:objectIdentifier/*:objectIdentifierValue">
			<dim:field element="identifier" mdschema="dc" qualifier="bitstream">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each> --> 
		
		<!-- TIPO DE ARQUIVO -->
		
		<xsl:for-each select="METS:amdSec/METS:techMD/METS:mdWrap/METS:xmlData/*:premis/*:object/*:objectCharacteristics/*:format/*:formatDesignation/*:formatName">
			<dim:field element="format" mdschema="dc">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each> 
		
		<!-- PROVENIÊNCIA 
		
		<xsl:for-each select="METS:amdSec/METS:techMD/METS:mdWrap/METS:xmlData/*:note[@type='provenance']">
			<dim:field element="description" mdschema="dc" qualifier="provenance">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each> -->
		
		<!-- FONTE -->
		
		<xsl:for-each select="METS:metsHdr/METS:agent/METS:name">
			<dim:field element="source" mdschema="dc" qualifier="localbase">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each> 
		
		
	<!-- VALIDAÇÃO -->
		
		<!-- Tipo de documento -->
		
		<xsl:if test="not(fn:exists(METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:genre))">
			<dim:field element="description" mdschema="dc" qualifier="report">
				<xsl:text>Sem tipo de documento</xsl:text>
			</dim:field>
		</xsl:if> 
		
		<xsl:if test="not(fn:exists(METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:genre))">
			<dim:field element="description" mdschema="dc" qualifier="report">
				<xsl:text>Tipo de fora do padrão</xsl:text>
			</dim:field>
		</xsl:if> 
		
	
		<!-- Título -->
		
		<xsl:if test="not(fn:exists(METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:titleInfo[not(@*)]))">
			<dim:field element="description" mdschema="dc" qualifier="report">
				<xsl:text>Sem título</xsl:text>
			</dim:field>
		</xsl:if> 
		
		<!-- Autor -->
		
		<xsl:if test="not(fn:exists(METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:name/*:namePart))">
			<dim:field element="description" mdschema="dc" qualifier="report">
				<xsl:text>Sem nome do autor</xsl:text>
			</dim:field>
		</xsl:if> 
		
		
		<!-- Resumo -->
		
		<xsl:if test="not(fn:exists(METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:abstract))">
			<dim:field element="description" mdschema="dc" qualifier="report">
				<xsl:text>Sem resumo</xsl:text>
			</dim:field>
		</xsl:if> 
		
		<!-- Sem palavras-chave -->
		
		<xsl:if test="not(fn:exists(METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:subject/*:topic))">
			<dim:field element="description" mdschema="dc" qualifier="report">
				<xsl:text>Sem palavras-chave</xsl:text>
			</dim:field>
		</xsl:if> 
		
		<xsl:if test="not(fn:exists(METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:language/*:languageTerm))">
			<dim:field element="description" mdschema="dc" qualifier="report">
				<xsl:text>Sem descrição de idioma</xsl:text>
			</dim:field>
		</xsl:if> 
		<!-- Instituição de Defesa -->
		
		<xsl:if test="not(fn:exists(METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:originInfo/*:publisher))">
			<dim:field element="description" mdschema="dc" qualifier="report">
				<xsl:text>Sem nome da instituição publicadora</xsl:text>
			</dim:field>
		</xsl:if> 
		
		<!-- Data de defesa -->
		
		<xsl:if test="not(fn:exists(METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:originInfo/*:dateIssued))">
			<dim:field element="description" mdschema="dc" qualifier="report">
				<xsl:text>Sem data de defesa</xsl:text>
			</dim:field>
		</xsl:if> 
		
		<!-- Tipo de acesso -->
		
		<xsl:if test="not(fn:exists(METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:accessCondition))">
			<dim:field element="description" mdschema="dc" qualifier="report">
				<xsl:text>Sem tipo de acesso</xsl:text>
			</dim:field>
		</xsl:if> 
		
		<xsl:if test="METS:dmdSec/METS:mdWrap/METS:xmlData/*:mods/*:accessCondition=''">
			<dim:field element="description" mdschema="dc" qualifier="report">
				<xsl:text>Sem tipo de acesso</xsl:text>
			</dim:field>
		</xsl:if> 
		
		
		<!-- Texto completo -->
		
		<xsl:if test="not(fn:exists(METS:amdSec/METS:techMD/METS:mdWrap/METS:xmlData/*:premis/*:object/*:objectIdentifier/*:objectIdentifierValue))">
			<dim:field element="description" mdschema="dc" qualifier="report">
				<xsl:text>Sem texto completo</xsl:text>
			</dim:field>
		</xsl:if> 
		
		
	</dim:dim>
	</xsl:template>
</xsl:stylesheet>
