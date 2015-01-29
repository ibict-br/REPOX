<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
    xmlns:xoai="http://www.lyncode.com/xoai"
    	exclude-result-prefixes="dim vmf fn">

		<xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyzàáâãäåæçèéêëìíîïðñòóôõö÷øùüúþÿ'" />	
		<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÜÚÞß'" />	
		
		<xsl:template name="vmf:vmf3_inputtolang">
			<xsl:param name="input" select="/.."/>
			<xsl:if test="contains($input,'PT')">
				<xsl:value-of select="'por'"/>
			</xsl:if>
			<xsl:if test="contains($input,'POR')">
				<xsl:value-of select="'por'"/>
			</xsl:if>
			<xsl:if test="contains($input,'EN')">
				<xsl:value-of select="'eng'"/>
			</xsl:if>
			<xsl:if test="contains($input,'ES')">
				<xsl:value-of select="'spa'"/>
			</xsl:if>
			<xsl:if test="contains($input,'SPA')">
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
				
				<xsl:for-each select="//metadata/element[@name='dc']/element[@name='contributor']/element[@name='advisor']/element[@name='none']/field[@name='value']">
						<mtd3-br:contributorAdvisor>
							<xsl:value-of select="."/>
						</mtd3-br:contributorAdvisor>
				</xsl:for-each>
				<!--
				
				<xsl:for-each select="//dim:field[@mdschema='dc'][@element='contributor'][@qualifier='authorID']">
					<mtd3-br:contributorAuthorID>
						<xsl:value-of select="."/>
					</mtd3-br:contributorAuthorID>
				</xsl:for-each>
				
				<xsl:for-each select="//dim:field[@mdschema='dc'][@element='contributor'][@qualifier='authorID']">
					<mtd3-br:contributorAuthorLattes>
						<xsl:value-of select="."/>
					</mtd3-br:contributorAuthorLattes>
				</xsl:for-each>
			
				<xsl:for-each select="//dim:field[@mdschema='dc'][@element='contributor'][@qualifier='advisor']">
					<mtd3-br:contributorAdvisor>
						<xsl:value-of select="."/>
					</mtd3-br:contributorAdvisor>
				</xsl:for-each>
	
				
				<xsl:for-each select="//dim:field[@mdschema='dc'][@element='contributor'][@qualifier='advisor-co'][position()=1]">
					<mtd3-br:contributorAdvisor-co1>
						<xsl:value-of select="."/>
					</mtd3-br:contributorAdvisor-co1>
				</xsl:for-each>
				
				<xsl:for-each select="//dim:field[@mdschema='dc'][@element='contributor'][@qualifier='advisor-co'][position()=2]">
					<mtd3-br:contributorAdvisor-co2>
						<xsl:value-of select="."/>
					</mtd3-br:contributorAdvisor-co2>
				</xsl:for-each>
				
				<xsl:for-each select="//dim:field[@mdschema='dc'][@element='contributor'][@qualifier='referees'][position()=1]">
					<mtd3-br:contributorReferees1>
						<xsl:value-of select="."/>
					</mtd3-br:contributorReferees1>
				</xsl:for-each>
				
				<xsl:for-each select="//dim:field[@mdschema='dc'][@element='contributor'][@qualifier='referees'][position()=2]">
					<mtd3-br:contributorReferees2>
						<xsl:value-of select="."/>
					</mtd3-br:contributorReferees2>
				</xsl:for-each>
				
				<xsl:for-each select="//dim:field[@mdschema='dc'][@element='contributor'][@qualifier='referees'][position()=3]">
					<mtd3-br:contributorReferees3>
						<xsl:value-of select="."/>
					</mtd3-br:contributorReferees3>
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
				
				<xsl:for-each select="//dim:field[@mdschema='dc'][@element='date'][@qualifier='submitted']">
					<mtd3-br:dateIssued>
						<xsl:value-of select="."/>
					</mtd3-br:dateIssued>
				</xsl:for-each>
				
				<xsl:if test="not(fn:exists(//dim:field[@mdschema='dc'][@element='date'][@qualifier='submitted']))">
					<xsl:for-each select="//dim:field[@mdschema='dc'][@element='date'][@qualifier='issued']">
						<mtd3-br:dateIssued>
							<xsl:value-of select="."/>
						</mtd3-br:dateIssued>
					</xsl:for-each>
				</xsl:if>
				
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
									<xsl:with-param name="input" select="upper-case(string(@lang))"/>
								</xsl:call-template>
							</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="."/>
					</mtd3-br:descriptionAbstract>
				</xsl:for-each>
				
				<xsl:for-each select="//dim:field[@mdschema='dc'][@element='description'][@qualifier='sponsorship']">
					<mtd3-br:descriptionSponsorship>
						<xsl:value-of select="."/>
					</mtd3-br:descriptionSponsorship>
				</xsl:for-each>

			
				<mtd3-br:publisher>
					<xsl:text>Universidade Federal de Alagoas</xsl:text>
				</mtd3-br:publisher>
				
				
				<xsl:for-each select="//dim:field[@mdschema='dc'][@element='publisher'][@qualifier='country']">
					<mtd3-br:publisherCountry>
						<xsl:value-of select="."/>
					</mtd3-br:publisherCountry>
				</xsl:for-each>
				
				

				<mtd3-br:publisherCountry>
					<xsl:text>BR</xsl:text>
				</mtd3-br:publisherCountry>
				
				
				
				<xsl:for-each select="//dim:field[@mdschema='dc'][@element='publisher'][@qualifier='departament']">
					<mtd3-br:publisherDepartament>
						<xsl:value-of select="."/>
					</mtd3-br:publisherDepartament>
				</xsl:for-each>

				<xsl:for-each select="//dim:field[@mdschema='dc'][@element='publisher'][@qualifier='program']">
					<mtd3-br:publisherProgram>
						<xsl:value-of select="."/>
					</mtd3-br:publisherProgram>
				</xsl:for-each>

				<mtd3-br:publisherInitials>
					<xsl:text>UFAL</xsl:text>
				</mtd3-br:publisherInitials>			
				
				<xsl:for-each select="//dim:field[@mdschema='dc'][@element='type']">
					<mtd3-br:type>
						<xsl:call-template name="vmf:vmf3_inputtotype">
							<xsl:with-param name="input" select="translate(string(.), $smallcase, $uppercase)"/>
						</xsl:call-template>
					</mtd3-br:type>
				</xsl:for-each>
				
				<xsl:for-each select="//dim:field[@mdschema='dc'][@element='title']">
					<mtd3-br:title>
						<xsl:value-of select="."/>
					</mtd3-br:title>
				</xsl:for-each>
				
				<xsl:for-each select="//dim:field[@mdschema='dc'][@element='title'][@qualifier='alternative']">
					<mtd3-br:titleAlternative>
						<xsl:if test="fn:exists(//dim:field[@mdschema='dc'][@element='title'][@qualifier='alternative'])">
							<xsl:attribute name="lang" namespace="">
								<xsl:call-template name="vmf:vmf3_inputtolang">
									<xsl:with-param name="input" select="translate(string(@lang), $smallcase, $uppercase)"/>
								</xsl:call-template>
							</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="."/>
					</mtd3-br:titleAlternative>
				</xsl:for-each>
				<xsl:for-each select="//dim:field[@mdschema='dc'][@element='language'][@qualifier='iso']">
					<mtd3-br:language>
						<xsl:call-template name="vmf:vmf3_inputtolang">
							<xsl:with-param name="input" select="translate(string(.), $smallcase, $uppercase)"/>
						</xsl:call-template>	
					</mtd3-br:language>
				</xsl:for-each>
					
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
					<xsl:if test="fn:exists(//dim:field[@mdschema='dc'][@element='subject'])">
							<xsl:attribute name="lang" namespace="">
								<xsl:call-template name="vmf:vmf3_inputtolang">
									<xsl:with-param name="input" select="translate(string(@lang), $smallcase, $uppercase)"/>
								</xsl:call-template>
							</xsl:attribute>
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
				
				
				<xsl:for-each select="//dim:field[@mdschema='dc'][@element='format']">
					<mtd3-br:format>
						<xsl:value-of select="."/>
					</mtd3-br:format>
				</xsl:for-each>
				
				
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
				
				-->
			</mtd3-br:mtd3br>
	</xsl:template>
</xsl:stylesheet>
