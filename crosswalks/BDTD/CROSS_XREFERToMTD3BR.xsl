<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
	xmlns:marc="http://www.loc.gov/MARC21/slim" 
	xmlns:mtd3-br="http://200.130.0.199/mtd3-br/" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
	exclude-result-prefixes="marc mtd3-br fn vmf">
	<xsl:import href="http://www.loc.gov/standards/marcxml/xslt/MARC21slimUtils.xsl"/>
	
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
	</xsl:template>
	
	<xsl:template name="vmf:vmf3_inputtotype">
		<xsl:param name="input" select="/.."/>
		<xsl:if test="(contains($input,'DOUTOR')) or (contains($input,'DOCTOR')) or (contains($input,'TESE')) or ($input='THESIS') or  ($input='DO')">
			<xsl:value-of select="'doctoralThesis'"/>
		</xsl:if>
		<xsl:if test="(contains($input,'MESTRE')) or (contains($input,'MESTRA')) or (contains($input,'MASTER')) or (contains($input,'DISSERTA')) or ($input='DISSERTATION') or ($input='ME')">
			<xsl:value-of select="'masterThesis'"/>
		</xsl:if>
			
	</xsl:template>	
	
	<xsl:output method="xml" indent="yes"/>
	<!--
	Fixed 530 Removed type="original" from dc:relation 2010-11-19 tmee
	Fixed 500 fields. 2006-12-11 ntra
	Added ISBN and deleted attributes 6/04 jer
	-->
	<xsl:template match="/">
		<xsl:if test="marc:record">
			<mtd3-br:mtd3br xsi:schemaLocation="http://200.130.0.199/mtd3-br/mtd3-br.xsd" xmlns:mtd3-br="http://200.130.0.199/mtd3-br/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
				<xsl:apply-templates/>
			</mtd3-br:mtd3br>
		</xsl:if>
	</xsl:template>
	<xsl:template match="marc:record">
		<xsl:variable name="leader" select="marc:leader"/>
		<xsl:variable name="leader6" select="substring($leader,7,1)"/>
		<xsl:variable name="leader7" select="substring($leader,8,1)"/>
		<xsl:variable name="controlField008" select="marc:controlfield[@tag=008]"/>
		
		<!-- contributorAuthor -->
		<xsl:for-each select="marc:datafield[@tag=100]|marc:datafield[@tag=110]|marc:datafield[@tag=111]">
			<mtd3-br:contributorAuthor>
				<xsl:value-of select="."/>
			</mtd3-br:contributorAuthor>
		</xsl:for-each>
		
		<!--
		<xsl:for-each select="//dim:field[@mdschema='dc'][@element='contributor'][@qualifier='authorID']">
			<mtd3-br:contributorAuthorID>
				<xsl:value-of select="."/>
			</mtd3-br:contributorAuthorID>
		</xsl:for-each>
		-->
		
		<xsl:for-each select="marc:datafield[@tag=500]">
			<xsl:variable name="contribuidor" select="."/>
			<!-- contributorAdvisor -->
			<xsl:if test="(contains($contribuidor,'Orientador'))">
				<mtd3-br:contributorAdvisor>
					<xsl:value-of select="normalize-space(substring(.,12))"/>
				</mtd3-br:contributorAdvisor>
			</xsl:if>
			<!-- contributorAdvisor-co -->
			<xsl:if test="(contains($contribuidor,'Coorientador'))">
				<mtd3-br:contributorAdvisor-co>
					<xsl:value-of select="normalize-space(substring(.,14))"/>
				</mtd3-br:contributorAdvisor-co>
			</xsl:if>
			<!-- contributorReferees -->
			<xsl:if test="(contains($contribuidor,'Banca'))">
				<mtd3-br:contributorReferees>
					<xsl:value-of select="normalize-space(substring(.,7))"/>
				</mtd3-br:contributorReferees>
			</xsl:if>
		</xsl:for-each>
		
		<xsl:for-each select="marc:datafield[@tag=260]/marc:subfield[@code='c']">
			<mtd3-br:dateAccessioned>
				<xsl:value-of select="."/>
			</mtd3-br:dateAccessioned>
		</xsl:for-each>
		
		<xsl:for-each select="marc:datafield[@tag=260]/marc:subfield[@code='c']">
			<mtd3-br:dateAvailable>
				<xsl:value-of select="."/>
			</mtd3-br:dateAvailable>
		</xsl:for-each>

		<xsl:for-each select="marc:datafield[@tag=943]/marc:subfield[@code='a']">
			<mtd3-br:dateIssued>
				<xsl:value-of select="translate(string(.), '/', '-')"/>
			</mtd3-br:dateIssued>
		</xsl:for-each>

		<xsl:for-each select="marc:datafield[@tag=856]">
			<mtd3-br:identifierUri>
				<xsl:value-of select="marc:subfield[@code='u']"/>
			</mtd3-br:identifierUri>
		</xsl:for-each>
		
		<!--
		<xsl:for-each select="//dim:field[@mdschema='dc'][@element='identifier'][@qualifier='citation']">
			<mtd3-br:identifierCitation>
				<xsl:value-of select="."/>
			</mtd3-br:identifierCitation>
		</xsl:for-each>
		-->
		<!--
		<xsl:for-each select="//dim:field[@mdschema='dc'][@element='identifier'][@qualifier='doi']">
					<mtd3-br:identifierDoi>
						<xsl:value-of select="."/>
					</mtd3-br:identifierDoi>
				</xsl:for-each>
		-->
		
		<xsl:for-each select="marc:datafield[@tag=520]/marc:subfield[@code='a']">
			<mtd3-br:descriptionAbstract>
				<xsl:if test="fn:exists(marc:datafield[@tag=520]/marc:subfield[@code=1])">
					<xsl:attribute name="lang" namespace="">
						<xsl:value-of select="marc:datafield[@tag=520]/marc:subfield[@code=1]"/>						
					</xsl:attribute>
				</xsl:if>
				<xsl:value-of select="."/>
			</mtd3-br:descriptionAbstract>
		</xsl:for-each>
		
		<!--
		<xsl:for-each select="//dim:field[@mdschema='dc'][@element='description'][@qualifier='sponsorship']">
			<mtd3-br:descriptionSponsorship>
				<xsl:value-of select="."/>
			</mtd3-br:descriptionSponsorship>
		</xsl:for-each>
		-->
		
		<xsl:for-each select="marc:datafield[@tag=710]/marc:subfield[@code='a']">
			<mtd3-br:publisher>
				<xsl:value-of select="."/>
			</mtd3-br:publisher>
		</xsl:for-each>
		

		<mtd3-br:publisherCountry>
			<xsl:text>BR</xsl:text>
		</mtd3-br:publisherCountry>
	
		<xsl:for-each select="marc:datafield[@tag=710]/marc:subfield[@code='b']">
			<mtd3-br:publisherDepartament>
				<xsl:value-of select="."/>
			</mtd3-br:publisherDepartament>
		</xsl:for-each>
		

		<xsl:for-each select="marc:datafield[@tag=942]/marc:subfield[@code='a']">
			<mtd3-br:publisherProgram>
				<xsl:value-of select="."/>
			</mtd3-br:publisherProgram>
		</xsl:for-each>
		
		<xsl:for-each select="marc:controlfield[@tag='003']">
			<mtd3-br:publisherInitials>
				<xsl:value-of select="."/>
			</mtd3-br:publisherInitials>
		</xsl:for-each>
		
		<xsl:for-each select="marc:datafield[@tag=696]/marc:subfield[@code='a']">
			<mtd3-br:type>
				<xsl:call-template name="vmf:vmf3_inputtotype">
					<xsl:with-param name="input" select="translate(string(.), $smallcase, $uppercase)"/>
				</xsl:call-template>
			</mtd3-br:type>
		</xsl:for-each>
		
		<xsl:for-each select="marc:datafield[@tag=245]">
			<mtd3-br:title>
				<xsl:call-template name="subfieldSelect">
					<xsl:with-param name="codes">abfghk</xsl:with-param>
				</xsl:call-template>
			</mtd3-br:title>
		</xsl:for-each>
		
		<!--
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
	    -->
	
		<mtd3-br:language>
			<xsl:value-of select="substring($controlField008,36,3)"/>
		</mtd3-br:language>
		
		<xsl:for-each select="marc:datafield[@tag=506]">
			<mtd3-br:rights>
				<xsl:value-of select="marc:subfield[@code='a']"/>
			</mtd3-br:rights>
		</xsl:for-each>
		
		<!--
		<xsl:for-each select="//dim:field[@mdschema='dc'][@element='rights'][@qualifier='uri']">
			<mtd3-br:rightsUri>
				<xsl:value-of select="."/>
			</mtd3-br:rightsUri>
		</xsl:for-each>
		-->
		
		<xsl:for-each select="marc:datafield[@tag=600]">
			<mtd3-br:subject>
				<xsl:if test="fn:exists(marc:datafield[@tag=600]/marc:subfield[@code=1])">
					<xsl:attribute name="lang" namespace="">
						<xsl:value-of select="marc:datafield[@tag=600]/marc:subfield[@code=1]"/>						
					</xsl:attribute>
				</xsl:if>
				<xsl:call-template name="subfieldSelect">
					<xsl:with-param name="codes">abcdq</xsl:with-param>
				</xsl:call-template>
			</mtd3-br:subject>
		</xsl:for-each>
		<xsl:for-each select="marc:datafield[@tag=610]">
			<mtd3-br:subject>
				<xsl:if test="fn:exists(marc:datafield[@tag=610]/marc:subfield[@code=1])">
					<xsl:attribute name="lang" namespace="">
						<xsl:value-of select="marc:datafield[@tag=610]/marc:subfield[@code=1]"/>						
					</xsl:attribute>
				</xsl:if>
				<xsl:call-template name="subfieldSelect">
					<xsl:with-param name="codes">abcdq</xsl:with-param>
				</xsl:call-template>
			</mtd3-br:subject>
		</xsl:for-each>
		<xsl:for-each select="marc:datafield[@tag=611]">
			<mtd3-br:subject>
				<xsl:if test="fn:exists(marc:datafield[@tag=611]/marc:subfield[@code=1])">
					<xsl:attribute name="lang" namespace="">
						<xsl:value-of select="marc:datafield[@tag=611]/marc:subfield[@code=1]"/>						
					</xsl:attribute>
				</xsl:if>
				<xsl:call-template name="subfieldSelect">
					<xsl:with-param name="codes">abcdq</xsl:with-param>
				</xsl:call-template>
			</mtd3-br:subject>
		</xsl:for-each>
		<xsl:for-each select="marc:datafield[@tag=630]">
			<mtd3-br:subject>
				<xsl:if test="fn:exists(marc:datafield[@tag=630]/marc:subfield[@code=1])">
					<xsl:attribute name="lang" namespace="">
						<xsl:value-of select="marc:datafield[@tag=630]/marc:subfield[@code=1]"/>						
					</xsl:attribute>
				</xsl:if>
			<xsl:call-template name="subfieldSelect">
				<xsl:with-param name="codes">abcdq</xsl:with-param>
			</xsl:call-template>
			</mtd3-br:subject>
		</xsl:for-each>
		<xsl:for-each select="marc:datafield[@tag=650]">
			<mtd3-br:subject>
				<xsl:if test="fn:exists(marc:datafield[@tag=650]/marc:subfield[@code=1])">
					<xsl:attribute name="lang" namespace="">
						<xsl:value-of select="marc:datafield[@tag=650]/marc:subfield[@code=1]"/>						
					</xsl:attribute>
				</xsl:if>			
				<xsl:call-template name="subfieldSelect">
					<xsl:with-param name="codes">abcdq</xsl:with-param>
				</xsl:call-template>
			</mtd3-br:subject>
		</xsl:for-each>
		<xsl:for-each select="marc:datafield[@tag=653]">
			<mtd3-br:subject>
				<xsl:if test="fn:exists(marc:datafield[@tag=653]/marc:subfield[@code=1])">
					<xsl:attribute name="lang" namespace="">
						<xsl:value-of select="marc:datafield[@tag=653]/marc:subfield[@code=1]"/>						
					</xsl:attribute>
				</xsl:if>
				<xsl:call-template name="subfieldSelect">
					<xsl:with-param name="codes">abcdq</xsl:with-param>
				</xsl:call-template>
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
		
		
		<xsl:for-each select="marc:datafield[@tag=530]">
			<mtd3-br:relation>
				<xsl:call-template name="subfieldSelect">
					<xsl:with-param name="codes">abcdu</xsl:with-param>
				</xsl:call-template>
			</mtd3-br:relation>
		</xsl:for-each>
		<xsl:for-each select="marc:datafield[@tag=760]|marc:datafield[@tag=762]|marc:datafield[@tag=765]|marc:datafield[@tag=767]|marc:datafield[@tag=770]|marc:datafield[@tag=772]|marc:datafield[@tag=773]|marc:datafield[@tag=774]|marc:datafield[@tag=775]|marc:datafield[@tag=776]|marc:datafield[@tag=777]|marc:datafield[@tag=780]|marc:datafield[@tag=785]|marc:datafield[@tag=786]|marc:datafield[@tag=787]">
			<mtd3-br:relationOther>
				<xsl:call-template name="subfieldSelect">
					<xsl:with-param name="codes">ot</xsl:with-param>
				</xsl:call-template>
			</mtd3-br:relationOther>
		</xsl:for-each>
		
	 
		<!--</mtd3-br:mtd3br>-->
	</xsl:template>
</xsl:stylesheet>