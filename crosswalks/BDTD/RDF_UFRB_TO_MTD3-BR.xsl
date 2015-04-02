<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" 			
	xmlns:dc="http://purl.org/dc/elements/1.1/" 
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
    	exclude-result-prefixes="oai_dc dc vmf fn rdf">

		<xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyzàáâãäåæçèéêëìíîïðñòóôõö÷øùüúþÿ'" />	
		<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÜÚÞß'" />	
		
		<xsl:template name="vmf:vmf3_inputtolang">
			<xsl:param name="input" select="/.."/>
			<xsl:if test="contains($input,'PT')">
				<xsl:value-of select="'por'"/>
			</xsl:if>
			<xsl:if test="contains($input,'EN')">
				<xsl:value-of select="'eng'"/>
			</xsl:if>
			<xsl:if test="contains($input,'ES')">
				<xsl:value-of select="'spa'"/>
			</xsl:if>
			<xsl:if test="contains($input,'FR')">
				<xsl:value-of select="'fra'"/>
			</xsl:if>
			<xsl:if test="contains($input,'IT')">
				<xsl:value-of select="'ita'"/>
			</xsl:if>
			<xsl:if test="contains($input,'DE')">
				<xsl:value-of select="'deu'"/>
			</xsl:if>
			<xsl:if test="contains($input,'GER')">
				<xsl:value-of select="'deu'"/>
			</xsl:if>
			<xsl:if test="contains($input,'JA')">
				<xsl:value-of select="'jpn'"/>
			</xsl:if>
			<xsl:if test="contains($input,'POR')">
				<xsl:value-of select="'por'"/>
			</xsl:if>
			<xsl:if test="contains($input,'SPA')">
				<xsl:value-of select="'spa'"/>
			</xsl:if>
	</xsl:template>
	
	<xsl:template name="vmf:vmf3_inputtotype">
		<xsl:param name="input" select="/.."/>
		<xsl:if test="(contains($input,'DOUTOR')) or (contains($input,'DOCTOR')) or (contains($input,'TESE')) or ($input='THESIS')">
			<xsl:value-of select="'doctoralThesis'"/>
		</xsl:if>
		
		<xsl:if test="(contains($input,'MESTRE')) or (contains($input,'MESTRA')) or (contains($input,'MASTER')) or (contains($input,'DISSERTA')) or ($input='DISSERTATION')">
			<xsl:value-of select="'masterThesis'"/>
		</xsl:if>
			
	</xsl:template>	
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<mtd3-br:mtd3br xsi:schemaLocation="http://200.130.0.199/mtd3-br/mtd3-br.xsd" xmlns:mtd3-br="http://200.130.0.199/mtd3-br/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:if test="fn:exists(//dc:creator)">
				<mtd3-br:contributorAuthor>
					<xsl:value-of select="//dc:creator"/>
				</mtd3-br:contributorAuthor>
			</xsl:if>
			<!--
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='contributor'][@qualifier='authorID']">
				<mtd3-br:contributorAuthorID>
					<xsl:value-of select="."/>
				</mtd3-br:contributorAuthorID>
			</xsl:for-each>
			-->
			<xsl:if test="fn:exists(//dc:contributor[1])">
				<mtd3-br:contributorAdvisor>
					<xsl:value-of select="//dc:contributor[1]"/>
				</mtd3-br:contributorAdvisor>
			</xsl:if>
		 <!--
			<xsl:if test="fn:exists(//dc:contributor[2])">
				<mtd3-br:contributorAdvisor-co1>
					<xsl:value-of select="//dc:contributor[2]"/>
				</mtd3-br:contributorAdvisor-co1>
			</xsl:if>
		-->	
			<xsl:if test="fn:exists(//dc:contributor[2])">
				<mtd3-br:contributorReferees1>
					<xsl:value-of select="//dc:contributor[2]"/>
				</mtd3-br:contributorReferees1>
			</xsl:if>
			
			<xsl:if test="fn:exists(//dc:contributor[3])">
				<mtd3-br:contributorReferees2>
					<xsl:value-of select="//dc:contributor[3]"/>
				</mtd3-br:contributorReferees2>
			</xsl:if>
			
			<xsl:if test="fn:exists(//dc:contributor[4])">
				<mtd3-br:contributorReferees3>
					<xsl:value-of select="//dc:contributor[4]"/>
				</mtd3-br:contributorReferees3>
			</xsl:if>
			
			<xsl:if test="fn:exists(//dc:contributor[5])">
				<mtd3-br:contributorReferees4>
					<xsl:value-of select="//dc:contributor[5]"/>
				</mtd3-br:contributorReferees4>
			</xsl:if>
			
			<xsl:if test="fn:exists(//dc:contributor[6])">
				<mtd3-br:contributorReferees5>
					<xsl:value-of select="//dc:contributor[6]"/>
				</mtd3-br:contributorReferees5>
			</xsl:if>
			
			<xsl:if test="fn:exists(//dc:date[2])">
				<mtd3-br:dateAccessioned>
					<xsl:value-of select="//dc:date[2]"/>
				</mtd3-br:dateAccessioned>
			</xsl:if>
			
			<xsl:if test="fn:exists(//dc:date[2])">
				<mtd3-br:dateAvailable>
					<xsl:value-of select="//dc:date[2]"/>
				</mtd3-br:dateAvailable>
			</xsl:if>
			
			<xsl:if test="fn:exists(//dc:date[1])">
				<xsl:variable name="data" select="normalize-space(//dc:date[1])"/>
				<mtd3-br:dateIssued>
				<xsl:choose>
					<xsl:when test="((string-length($data) > 6) and (string-length($data) &lt; 10))">
						<xsl:value-of select="substring($data,4,4)"/>
					</xsl:when>
					<xsl:when test="string-length($data) > 8">
						<xsl:value-of select="concat(substring($data,7,4),'-',substring($data,4,2),'-',substring($data,1,2))"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space($data)"/>
					</xsl:otherwise>
				 </xsl:choose>
				 </mtd3-br:dateIssued>
			</xsl:if>
			
			<xsl:if test="fn:exists(//dc:identifier[2])">
				<mtd3-br:identifierUri>
					<xsl:value-of select="fn:normalize-space(fn:replace(//dc:identifier[2],'http://hdl.handle.net/','http://www.repositorio.ufrb.edu.br/handle/'))"/>
				</mtd3-br:identifierUri>
			</xsl:if>
			
			<xsl:if test="not(fn:exists(//dc:identifier[2]))">
				<mtd3-br:identifierUri>
					<xsl:value-of select="fn:normalize-space(fn:replace(//dc:identifier[1],'http://hdl.handle.net/','http://www.repositorio.ufrb.edu.br/handle/'))"/>
				</mtd3-br:identifierUri>
			</xsl:if>
			
			<xsl:if test="fn:exists(//dc:reference)">
				<mtd3-br:identifierCitation>
					<xsl:value-of select="//dc:reference"/>
				</mtd3-br:identifierCitation>
			</xsl:if>
			
			
			<!--
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='identifier'][@qualifier='doi']">
				<mtd3-br:identifierDoi>
					<xsl:value-of select="."/>
				</mtd3-br:identifierDoi>
			</xsl:for-each>
			-->
			
			<xsl:if test="fn:exists(//dc:description[2])">
				<mtd3-br:descriptionAbstract>
					<xsl:attribute name="lang" namespace="">
						<xsl:text>por</xsl:text>
					</xsl:attribute>
					<xsl:value-of select="//dc:description[2]"/>
				</mtd3-br:descriptionAbstract>
			</xsl:if>
			
			<xsl:if test="fn:exists(//dc:description[3])">
				<mtd3-br:descriptionAbstract>
					<xsl:attribute name="lang" namespace="">
						<xsl:text>eng</xsl:text>
					</xsl:attribute>
					<xsl:value-of select="//dc:description[3]"/>
				</mtd3-br:descriptionAbstract>
			</xsl:if>
			
			<!--
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='description'][@qualifier='sponsorship']">
				<mtd3-br:descriptionSponsorship>
					<xsl:value-of select="."/>
				</mtd3-br:descriptionSponsorship>
			</xsl:for-each>
			-->
			
			
			<mtd3-br:publisher>
				<xsl:text>Universidade Federal do Rec&#244;ncavo Bahia</xsl:text>
			</mtd3-br:publisher>
			
			
			<mtd3-br:publisherCountry>
				<xsl:text>BR</xsl:text>
			</mtd3-br:publisherCountry>


			<xsl:if test="fn:exists(//dc:source[2])">
				<mtd3-br:publisherDepartament>
					<xsl:value-of select="normalize-space(//dc:source[2])"/>
				</mtd3-br:publisherDepartament>
			</xsl:if>
		   
			<xsl:if test="fn:exists(//dc:source[3])">
				<mtd3-br:publisherProgram>
					<xsl:value-of select="normalize-space(//dc:source[3])"/>
				</mtd3-br:publisherProgram>
			</xsl:if>

			<mtd3-br:publisherInitials>
				<xsl:text>UFRB</xsl:text>
			</mtd3-br:publisherInitials>
			
			<xsl:if test="fn:exists(//dc:type)">
				<mtd3-br:type>
					<xsl:call-template name="vmf:vmf3_inputtotype">
						<xsl:with-param name="input" select="translate(string(//dc:type), $smallcase, $uppercase)"/>
					</xsl:call-template>
				</mtd3-br:type>
			</xsl:if>
			
			<xsl:if test="not(fn:exists(//dc:type))">
				<mtd3-br:type>
					<xsl:call-template name="vmf:vmf3_inputtotype">
						<xsl:with-param name="input" select="translate(string(//dc:description[1]), $smallcase, $uppercase)"/>
					</xsl:call-template>
				</mtd3-br:type>
			</xsl:if>
			
			<xsl:if test="fn:exists(//dc:title[1])">
				<mtd3-br:title>
					<xsl:value-of select="//dc:title[1]"/>
				</mtd3-br:title>
			</xsl:if>
			
			<xsl:if test="fn:exists(//dc:title[2])">
				<mtd3-br:titleAlternative>
					<xsl:attribute name="lang" namespace="">
						<xsl:text>eng</xsl:text>
					</xsl:attribute>
					<xsl:value-of select="//dc:title[2]"/>
				</mtd3-br:titleAlternative>
			</xsl:if>
			
			<xsl:if test="fn:exists(//dc:language)">
				<mtd3-br:language>
					<xsl:call-template name="vmf:vmf3_inputtolang">
						<xsl:with-param name="input" select="translate(string(//dc:language), $smallcase, $uppercase)"/>
					</xsl:call-template>	
				</mtd3-br:language>
			</xsl:if>	
			
			<xsl:if test="fn:exists(//dc:rights)">
				<mtd3-br:rights>
					<xsl:value-of select="//dc:rights"/>
				</mtd3-br:rights>
			</xsl:if>	
			
			<!--
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='rights'][@qualifier='uri']">
				<mtd3-br:rightsUri>
					<xsl:value-of select="."/>
				</mtd3-br:rightsUri>
			</xsl:for-each>
			-->
			
			<xsl:for-each select="//dc:subject">
				<mtd3-br:subject>
					<xsl:value-of select="."/>
				</mtd3-br:subject>
			</xsl:for-each>
			<!--
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='subject'][@qualifier='cnpq']">
			<mtd3-br:subjectCnpq>
				<xsl:if test="fn:exists(//dim:field[@mdschema='dc'][@element='subject'][@qualifier='cnpq'])">
						<xsl:attribute name="lang" namespace="">
							<xsl:call-template name="vmf:vmf3_inputtolang">
								<xsl:with-param name="input" select="translate(string(@lang), $smallcase, $uppercase)"/>
							</xsl:call-template>
						</xsl:attribute>
					</xsl:if>
					<xsl:value-of select="."/>
				</mtd3-br:subjectCnpq>
			</xsl:for-each>
			-->
			
			<mtd3-br:format>
				<xsl:text>application/pdf</xsl:text>
			</mtd3-br:format>
			
			<!--
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='relation']">
				<mtd3-br:relation>
					<xsl:value-of select="."/>
				</mtd3-br:relation>
			</xsl:for-each>
			
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='relation'][@qualifier='other']">
				<mtd3-br:relationOther>
					<xsl:value-of select="."/>
				</mtd3-br:relationOther>
			</xsl:for-each>
		 
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='relation'][@qualifier='references']">
				<mtd3-br:relationReferences>
					<xsl:value-of select="."/>
				</mtd3-br:relationReferences>
			</xsl:for-each>
			-->
		</mtd3-br:mtd3br>
	</xsl:template>
</xsl:stylesheet>