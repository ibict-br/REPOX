<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
    xmlns:dim="http://www.dspace.org/xmlns/dspace/dim"
    	exclude-result-prefixes="dim vmf fn">

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
				<xsl:value-of select="'SPA'"/>
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
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='contributor'][@qualifier='author']">
				<mtd3-br:contributorAuthor>
					<xsl:value-of select="."/>
				</mtd3-br:contributorAuthor>
			</xsl:for-each>
			
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='contributor'][@qualifier='authorID']">
				<mtd3-br:contributorAuthorID>
					<xsl:value-of select="."/>
				</mtd3-br:contributorAuthorID>
			</xsl:for-each>
		
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='contributor'][@qualifier='advisor']">
				<mtd3-br:contributorAdvisor>
					<xsl:value-of select="."/>
				</mtd3-br:contributorAdvisor>
			</xsl:for-each>
		 
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='contributor'][@qualifier='advisor-co']">
				<mtd3-br:contributorAdvisor-co>
					<xsl:value-of select="."/>
				</mtd3-br:contributorAdvisor-co>
			</xsl:for-each>
			
			<xsl:if test="fn:exists(//dim:field[@mdschema='dc'][@element='contributor'][@qualifier='advisor'][2])">
				<mtd3-br:contributorAdvisor-co>
					<xsl:value-of select="//dim:field[@mdschema='dc'][@element='contributor'][@qualifier='advisor'][2]"/>
				</mtd3-br:contributorAdvisor-co>
			</xsl:if>
			
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='contributor'][@qualifier='member']">
				<mtd3-br:contributorReferees>
					<xsl:value-of select="."/>
				</mtd3-br:contributorReferees>
			</xsl:for-each>
			
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='date'][@qualifier='accessioned']">
				<mtd3-br:dateAccessioned>
					<xsl:value-of select="."/>
				</mtd3-br:dateAccessioned>
			</xsl:for-each>
			
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='date'][@qualifier='available']">
				<mtd3-br:dateAvailable>
					<xsl:value-of select="."/>
				</mtd3-br:dateAvailable>
			</xsl:for-each>
			
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='date'][@qualifier='issued']">
				<mtd3-br:dateIssued>
					<xsl:value-of select="."/>
				</mtd3-br:dateIssued>
			</xsl:for-each>
			
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='identifier'][@qualifier='uri']">
				<mtd3-br:identifierUri>
					<xsl:value-of select="."/>
				</mtd3-br:identifierUri>
			</xsl:for-each>
			
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='identifier'][@qualifier='citation']">
				<mtd3-br:identifierCitation>
					<xsl:value-of select="."/>
				</mtd3-br:identifierCitation>
			</xsl:for-each>
			
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='identifier'][@qualifier='doi']">
				<mtd3-br:identifierDoi>
					<xsl:value-of select="."/>
				</mtd3-br:identifierDoi>
			</xsl:for-each>
		
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='description'][@qualifier='abstract']">
				<mtd3-br:descriptionAbstract>
					<xsl:if test="fn:exists(//dim:field[@mdschema='dc'][@element='description'][@qualifier='abstract'])">
						<xsl:attribute name="lang" namespace="">
							<xsl:call-template name="vmf:vmf3_inputtolang">
								<xsl:with-param name="input" select="translate(string(@lang), $smallcase, $uppercase)"/>
							</xsl:call-template>
						</xsl:attribute>
					</xsl:if>
					<xsl:value-of select="."/>
				</mtd3-br:descriptionAbstract>
			</xsl:for-each>
			
			<xsl:if test="not(fn:exists(//dim:field[@mdschema='dc'][@element='description'][@qualifier='abstract']))">
				<mtd3-br:descriptionAbstract>
					<xsl:text>Resumo não disponível</xsl:text>
				</mtd3-br:descriptionAbstract>
			</xsl:if>
							
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='description'][@qualifier='sponsorship']">
				<mtd3-br:descriptionSponsorship>
					<xsl:value-of select="."/>
				</mtd3-br:descriptionSponsorship>
			</xsl:for-each>

		<!-- <xsl:for-each select="//dim:field[@mdschema='dc'][@element='degree'][@qualifier='grantor']"> -->
			<mtd3-br:publisher>
				<xsl:text>Universidade Federal da Bahia</xsl:text>
			</mtd3-br:publisher>
		<!--	</xsl:for-each> -->
			
			<mtd3-br:publisherCountry>
				<xsl:text>BR</xsl:text>
			</mtd3-br:publisherCountry>

			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='degree'][@qualifier='departament']">
				<mtd3-br:publisherDepartament>
					<xsl:value-of select="."/>
				</mtd3-br:publisherDepartament>
			</xsl:for-each>

			
			<xsl:variable name="programa" select="normalize-space(concat('Programa ',substring-before(substring-after(//dim:field[@mdschema='dc'][@element='publisher'],'Programa'),'da Uni')))"/>
			<xsl:if test="string-length($programa) > 9">
				<mtd3-br:publisherProgram>
					<xsl:value-of select="$programa"/>
				</mtd3-br:publisherProgram>
			</xsl:if>

		<!--<xsl:for-each select="//dim:field[@mdschema='dc'][@element='publisher'][@qualifier='initials']"> -->
			<mtd3-br:publisherInitials>
				<xsl:text>UFBA</xsl:text>
			</mtd3-br:publisherInitials>
		<!--</xsl:for-each> -->
			
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='type']">
				<mtd3-br:type>
					<xsl:call-template name="vmf:vmf3_inputtotype">
						<xsl:with-param name="input" select="translate(string(.), $smallcase, $uppercase)"/>
					</xsl:call-template>
				</mtd3-br:type>
			</xsl:for-each>
			
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='title']">
				<xsl:if test="@qualifier='alternative'">
					<mtd3-br:titleAlternative>
						<xsl:attribute name="lang">eng</xsl:attribute>
						<xsl:value-of select="."/>
					</mtd3-br:titleAlternative>
				</xsl:if>
				<xsl:if test="not(exists(@qualifier))">
					<mtd3-br:title>
						<xsl:value-of select="."/>
					</mtd3-br:title>
				</xsl:if>
			</xsl:for-each>
			
			
			<xsl:choose>
				<xsl:when test="//dim:field[@mdschema='dc'][@element='language'][@qualifier='iso']">
					<mtd3-br:language>
						<xsl:call-template name="vmf:vmf3_inputtolang">
							<xsl:with-param name="input" select="translate(string(//dim:field[@mdschema='dc'][@element='language'][@qualifier='iso']), $smallcase, $uppercase)"/>
						</xsl:call-template>	
					</mtd3-br:language>
				</xsl:when>
				<xsl:otherwise>
					<mtd3-br:language>
						 <xsl:call-template name="vmf:vmf3_inputtolang">
							<xsl:with-param name="input" select="translate(string(//dim:field[@mdschema='dc'][@element='language']), $smallcase, $uppercase)"/>
						</xsl:call-template>	
					</mtd3-br:language>
				</xsl:otherwise>
			</xsl:choose>
			
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='rights']">
				<mtd3-br:rights>
					<xsl:value-of select="."/>
				</mtd3-br:rights>
			</xsl:for-each>

			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='rights'][@qualifier='uri']">
				<mtd3-br:rightsUri>
					<xsl:value-of select="."/>
				</mtd3-br:rightsUri>
			</xsl:for-each>
			
			
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='subject']">
				<mtd3-br:subject>
					<xsl:if test="@qualifier='en'">
						<xsl:attribute name="lang">eng</xsl:attribute>
					</xsl:if>
					<xsl:if test="@qualifier='es'">
						<xsl:attribute name="lang">spa</xsl:attribute>
					</xsl:if>
					<xsl:if test="@qualifier='fr'">
						<xsl:attribute name="lang">fra</xsl:attribute>
					</xsl:if>
					<xsl:if test="@qualifier='decs'">
						<xsl:attribute name="lang">por</xsl:attribute>
					</xsl:if>
					<xsl:if test="@qualifier='other'">
						<xsl:attribute name="lang">por</xsl:attribute>
					</xsl:if>
					<xsl:if test="not(exists(@qualifier))">
						<xsl:attribute name="lang">por</xsl:attribute>
					</xsl:if>

					<xsl:value-of select="."/>

				</mtd3-br:subject>
			</xsl:for-each>

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
			
			<!--
			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='format']">
				<mtd3-br:format>
					<xsl:value-of select="."/>
				</mtd3-br:format>
			</xsl:for-each>
			-->
			
			<mtd3-br:format>
				<xsl:text>application/pdf</xsl:text>
			</mtd3-br:format>
			
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

			<xsl:for-each select="//dim:field[@mdschema='dc'][@element='provenance']">
				<mtd3-br:provenance>
					<xsl:value-of select="."/>
				</mtd3-br:provenance>
			</xsl:for-each>

		</mtd3-br:mtd3br>
	</xsl:template>
</xsl:stylesheet>