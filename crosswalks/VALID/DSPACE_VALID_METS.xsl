<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:METS="http://www.loc.gov/METS/" 
xmlns:MODS="http://www.loc.gov/standards/mods/v3/" 
xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf" 
xmlns:xs="http://www.w3.org/2001/XMLSchema" 
xmlns:fn="http://www.w3.org/2005/xpath-functions" 
xmlns:dim="http://www.dspace.org/xmlns/dspace/dim"
exclude-result-prefixes="vmf xs dim fn METS MODS">
	

	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
				
	<xsl:template match="METS:mets">

		
	<dim:dim xmlns:dim="http://www.dspace.org/xmlns/dspace/dim" xmlns:doc="http://www.lyncode.com/xoai" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.dspace.org/xmlns/dspace/dim http://www.dspace.org/schema/dim.xsd">
		
        <!-- TIPO DE DOCUMENTO -->
	
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:genre">
			<dim:field element="type" mdschema="dc">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each>
	
        <!-- TÍTULO -->

	
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:titleInfo">
			<dim:field element="title" mdschema="dc">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each>

		
		<!--  AUTOR -->
	
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:name/*:namePart">
			<dim:field element="creator" mdschema="dc">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each>
		
		<!--  DATA DE DEFESA -->

		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:originInfo/*:dateIssued">
			<dim:field element="date" mdschema="dc" qualifier="issued">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each>
		
		<!-- INSTITUIÇÃO -->
		
		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:originInfo/*:publisher">
			<dim:field element="dc" mdschema="publisher">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each>
		
		<!-- TIPO DE ACESSO -->

		<xsl:for-each select="METS:dmdSec/METS:mdWrap/METS:xmlData/*:accessCondition">
			<dim:field element="dc" mdschema="rights">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each>
		
		
	<!-- VALIDAÇÃO -->
		
		<!-- Tipo de documento 
		
		<xsl:if test="not(fn:exists($var1_mtdbr/ns0:Grau))">
			<dim:field element="description" mdschema="dc">
				<xsl:text>Sem tipo de documento</xsl:text>
			</dim:field>
		</xsl:if> -->
	
		<!-- Título 
		
		<xsl:if test="not(fn:exists($var1_mtdbr/ns0:Titulo))">
			<dim:field element="description" mdschema="dc">
				<xsl:text>Sem título</xsl:text>
			</dim:field>
		</xsl:if> -->
		
		<!-- Autor 
		
		<xsl:if test="not(fn:exists($var1_mtdbr/ns0:Autor/ns0:Nome))">
			<dim:field element="description" mdschema="dc">
				<xsl:text>Sem nome do autor</xsl:text>
			</dim:field>
		</xsl:if> 
		
		<xsl:if test="not(fn:exists($var1_mtdbr/ns0:Autor/ns0:Lattes))">
			<dim:field element="description" mdschema="dc">
				<xsl:text>Sem currículo Lattes do autor</xsl:text>
			</dim:field>
		</xsl:if>  -->
		
		<!-- Orientador	
		
		<xsl:if test="not(fn:exists($var1_mtdbr/ns0:Contribuidor[@Papel='Orientador']/ns0:Nome))">
			<dim:field element="description" mdschema="dc">
				<xsl:text>Sem nome do orientador</xsl:text>
			</dim:field>
		</xsl:if>
		
		<xsl:if test="not(fn:exists($var1_mtdbr/ns0:Contribuidor[@Papel='Orientador']/ns0:Lattes))">
			<dim:field element="description" mdschema="dc">
				<xsl:text>Sem currículo Lattes do orientador</xsl:text>
			</dim:field>
		</xsl:if> -->
		
		<!-- Resumo 
		
		<xsl:if test="not(fn:exists($var1_mtdbr/ns0:Resumo))">
			<dim:field element="description" mdschema="dc">
				<xsl:text>Sem resumo</xsl:text>
			</dim:field>
		</xsl:if> -->
		
		<!-- Instituição de Defesa 
		
		<xsl:if test="not(fn:exists($var1_mtdbr/ns0:InstituicaoDefesa/ns0:Nome))">
			<dim:field element="description" mdschema="dc">
				<xsl:text>Sem nome da instituição</xsl:text>
			</dim:field>
		</xsl:if> -->
		
		
		<!-- Data de defesa 
		
		<xsl:if test="not(fn:exists($var1_mtdbr/ns0:DataDefesa))">
			<dim:field element="description" mdschema="dc">
				<xsl:text>Sem data de defesa</xsl:text>
			</dim:field>
		</xsl:if> -->
		
		<!-- Tipo de acesso 
		
		<xsl:if test="not(fn:exists($var1_mtdbr/ns0:Direitos))">
			<dim:field element="description" mdschema="dc">
				<xsl:text>Sem tipo de acesso</xsl:text>
			</dim:field>
		</xsl:if> -->
		
		
		<!-- Texto completo 
		
		<xsl:if test="not(fn:exists($var1_mtdbr/ns0:Arquivo))">
			<dim:field element="description" mdschema="dc">
				<xsl:text>Sem texto completo</xsl:text>
			</dim:field>
		</xsl:if> -->
		
		
	</dim:dim>
	</xsl:template>
</xsl:stylesheet>
