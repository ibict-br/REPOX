<?xml version="1.0" encoding="UTF-8"?>
<!--
This file was generated by Altova MapForce 2013r2sp2

YOU SHOULD NOT MODIFY THIS FILE, BECAUSE IT WILL BE
OVERWRITTEN WHEN YOU RE-RUN CODE GENERATION.

Refer to the Altova MapForce Documentation for further details.
http://www.altova.com/mapforce
-->
<xsl:stylesheet version="2.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:ns0="http://oai.ibict.br/mtd2-br/" 
xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf" 
xmlns:xs="http://www.w3.org/2001/XMLSchema" 
xmlns:fn="http://www.w3.org/2005/xpath-functions" 
exclude-result-prefixes="ns0 vmf xs fn ">
	
	<xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyzàáâãäåæçèéêëìíîïðñòóôõö÷øùüúþÿ'" />	
	<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÜÚÞß'" />	

	<xsl:template name="vmf:vmf1_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Orientador'">
				<xsl:value-of select="'advisor'"/>
			</xsl:when>
			<xsl:when test="$input='Co-Orientador'">
				<xsl:value-of select="'advisor-co'"/>
			</xsl:when>
			<xsl:when test="$input='Presidente da Banca'">
				<xsl:value-of select="'referees'"/>
			</xsl:when>
			<xsl:when test="$input='Vice-Presidente da Banca'">
				<xsl:value-of select="'referees'"/>
			</xsl:when>
			<xsl:when test="$input='Membro da Banca'">
				<xsl:value-of select="'referees'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'others'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="vmf:vmf2_inputtoresult">
			<xsl:param name="input" select="()"/>
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
	
	<xsl:template name="vmf:vmf3_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Doutor'">
				<xsl:value-of select="'doctoralThesis'"/>
			</xsl:when>
			<xsl:when test="$input='Mestre'">
				<xsl:value-of select="'masterThesis'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="vmf:vmf4_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='pt'">
				<xsl:value-of select="true()"/>
			</xsl:when>
			<xsl:when test="$input='por'">
				<xsl:value-of select="true()"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="vmf:vmf6_inputtoresult">
		<xsl:param name="input1" select="()"/>
		<xsl:choose>
			<xsl:when test="$input1='eng'">
				<xsl:value-of select="true()"/>
			</xsl:when>
			<xsl:when test="$input1='spa'">
				<xsl:value-of select="true()"/>
			</xsl:when>
			<xsl:when test="$input1='fra'">
				<xsl:value-of select="true()"/>
			</xsl:when>
			<xsl:when test="$input1='deu'">
				<xsl:value-of select="true()"/>
			</xsl:when>
			<xsl:when test="$input1='ita'">
				<xsl:value-of select="true()"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="vmf:vmf8_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='pdf'">
				<xsl:value-of select="'application/pdf'"/>
			</xsl:when>
			<xsl:when test="$input='PDF'">
				<xsl:value-of select="'application/pdf'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
				
	<xsl:template match="/">

		<xsl:variable name="var1_mtdbr" as="node()?" select="ns0:mtd2br"/>
		
		<mtd3-br:mtd3br xsi:schemaLocation="http://200.130.0.199/mtd3-br/mtd3-br.xsd" xmlns:mtd3-br="http://200.130.0.199/mtd3-br/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	
			<xsl:for-each select="$var1_mtdbr/ns0:Autor">
					<xsl:choose>
						<xsl:when test="fn:exists($var1_mtdbr/ns0:Autor/ns0:Citacao)">
								<mtd3-br:contributorAuthor>
									<xsl:value-of select="$var1_mtdbr/ns0:Autor/ns0:Citacao[1]/text()"/>
								</mtd3-br:contributorAuthor>		
							
						</xsl:when>
						<xsl:otherwise>
						<mtd3-br:contributorAuthor>
							<xsl:sequence select="fn:string(ns0:Nome)"/>
						</mtd3-br:contributorAuthor>		

						</xsl:otherwise>
					</xsl:choose>

			</xsl:for-each>
			
			<xsl:variable name="nomesContributores" select="''" />
			

			<xsl:for-each select="$var1_mtdbr/ns0:Contribuidor">
				<xsl:variable name="var2_Papel" as="node()?" select="@Papel"/>
				<!-- <xsl:variable name="var_ContributorCitacao" as="node()?" select="self::$var1_mtdbr/ns0:Contribuidor/ns0:Citacao"/> -->
					
				<!--	<xsl:variable name="nomesContributor" select="fn:concat($nomesContributor,' ',fn:string(ns0:Nome))" /> -->
				<!--	<xsl:variable name="nomesContributor" select="fn:string(ns0:Nome)" /> -->
					
					<!--	<xsl:variable name="citacoesAuthor" select="fn:concat($nomesContributor,' ',fn:string(ns0:Citacao))" /> -->
					<xsl:choose>
						<xsl:when test="$var2_Papel='Orientador'">
							<mtd3-br:contributorAdvisor>
								<xsl:choose>
									<xsl:when test="fn:exists(ns0:Citacao)">
										<xsl:sequence select="fn:string(ns0:Citacao)"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:sequence select="fn:string(ns0:Nome)"/>
									</xsl:otherwise>
								</xsl:choose>
							</mtd3-br:contributorAdvisor>
						</xsl:when>
						<xsl:when test="$var2_Papel='Co-Orientador'">
							<mtd3-br:contributorAdvisor-co>
								<xsl:choose>
									<xsl:when test="fn:exists(ns0:Citacao)">
										<xsl:sequence select="fn:string(ns0:Citacao)"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:sequence select="fn:string(ns0:Nome)"/>
									</xsl:otherwise>
								</xsl:choose>
							</mtd3-br:contributorAdvisor-co>							
						</xsl:when>
						<xsl:when test="$var2_Papel='Presidente da Banca'">
							<mtd3-br:contributorReferees>
								<xsl:choose>
									<xsl:when test="fn:exists(ns0:Citacao)">
										<xsl:sequence select="fn:string(ns0:Citacao)"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:sequence select="fn:string(ns0:Nome)"/>
									</xsl:otherwise>
								</xsl:choose>
							</mtd3-br:contributorReferees>										
						</xsl:when>
						<xsl:when test="$var2_Papel='Vice-Presidente da Banca'">
							<mtd3-br:contributorReferees>
								<xsl:choose>
									<xsl:when test="fn:exists(ns0:Citacao)">
										<xsl:sequence select="fn:string(ns0:Citacao)"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:sequence select="fn:string(ns0:Nome)"/>
									</xsl:otherwise>
								</xsl:choose>
							</mtd3-br:contributorReferees>	
						</xsl:when>
						<xsl:when test="$var2_Papel='Membro da Banca'">
							<mtd3-br:contributorReferees>
								<xsl:choose>
									<xsl:when test="fn:exists(ns0:Citacao)">
										<xsl:sequence select="fn:string(ns0:Citacao)"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:sequence select="fn:string(ns0:Nome)"/>
									</xsl:otherwise>
								</xsl:choose>
							</mtd3-br:contributorReferees>	
						</xsl:when>
						<xsl:otherwise>
							<mtd3-br:contributorReferees>
								<xsl:choose>
									<xsl:when test="fn:exists(ns0:Citacao)">
										<xsl:sequence select="fn:string(ns0:Citacao)"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:sequence select="fn:string(ns0:Nome)"/>
									</xsl:otherwise>
								</xsl:choose>
							</mtd3-br:contributorReferees>	
						</xsl:otherwise>
					</xsl:choose>
		<!--		
			<teste>
				<xsl:value-of select="fn:string($nomesContributor)"/>
			</teste>
		-->	
		</xsl:for-each>

			<xsl:for-each select="$var1_mtdbr">
				<mtd3-br:dateAccessioned>
					<xsl:sequence select="xs:string(fn:string(ns0:Controle/ns0:DataAtualizacao))"/>
				</mtd3-br:dateAccessioned>
			</xsl:for-each>
			<xsl:for-each select="$var1_mtdbr">
				<mtd3-br:dateAvailable>
					<xsl:sequence select="xs:string(fn:string(ns0:DataDefesa))"/>
				</mtd3-br:dateAvailable>
			</xsl:for-each>
			<xsl:for-each select="$var1_mtdbr">
				<mtd3-br:dateIssued>
					<xsl:sequence select="xs:string(fn:string(ns0:DataDefesa))"/>
				</mtd3-br:dateIssued>
			</xsl:for-each>
			<xsl:for-each select="$var1_mtdbr/ns0:Arquivo">
				<mtd3-br:identifierUri>
					<xsl:sequence select="xs:string(xs:anyURI(fn:string(ns0:URL)))"/>
				</mtd3-br:identifierUri>
			</xsl:for-each>
			<xsl:for-each select="$var1_mtdbr/ns0:Resumo">
				<xsl:variable name="var3_Idioma" as="node()?" select="@Idioma"/>
				<mtd3-br:descriptionAbstract>
					<xsl:if test="fn:exists($var3_Idioma)">
						<xsl:variable name="var4_resultof_vmf__inputtoresult" as="xs:string?">
							<xsl:call-template name="vmf:vmf2_inputtoresult">
									<xsl:with-param name="input" select="translate(fn:string($var3_Idioma), $smallcase, $uppercase)"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:if test="fn:exists($var4_resultof_vmf__inputtoresult)">
							<xsl:attribute name="lang" namespace="" select="$var4_resultof_vmf__inputtoresult"/>
						</xsl:if>
					</xsl:if>
					<xsl:sequence select="fn:string(.)"/>
				</mtd3-br:descriptionAbstract>
			</xsl:for-each>
			<xsl:for-each select="$var1_mtdbr/ns0:AgenciaFomento">
				<xsl:variable name="var5_cur" as="node()" select="."/>
				<xsl:for-each select="ns0:Sigla">
					<mtd3-br:descriptionSponsorship>
						<xsl:sequence select="fn:concat(fn:concat(fn:string(.), ' - '), fn:string($var5_cur/ns0:Nome))"/>
					</mtd3-br:descriptionSponsorship>
				</xsl:for-each>
			</xsl:for-each>
			<!--
			<xsl:for-each select="$var1_mtdbr">
				<mtd3-br:publisher>
					<xsl:sequence select="fn:string(ns0:InstituicaoDefesa/ns0:Nome)"/>
				</mtd3-br:publisher>
			</xsl:for-each>
			-->
			
			<mtd3-br:publisher>
				<xsl:text>Universidade Estadual de Londrina</xsl:text>
			</mtd3-br:publisher>
			
			<xsl:for-each select="$var1_mtdbr/ns0:InstituicaoDefesa/ns0:Pais">
				<mtd3-br:publisherCountry>
					<xsl:sequence select="fn:string(.)"/>
				</mtd3-br:publisherCountry>
			</xsl:for-each>
			
			<xsl:variable name="departamento" select="normalize-space(substring-before(substring-after($var1_mtdbr/ns0:InstituicaoDefesa/ns0:Nome,'.'),'.'))"/>

			<xsl:variable name="programa" select="normalize-space(substring-after(substring-after($var1_mtdbr/ns0:InstituicaoDefesa/ns0:Nome,'.'),'.'))"/>			
			
			<mtd3-br:publisherDepartament>
				<xsl:sequence select="$departamento"/>
			</mtd3-br:publisherDepartament>
		
			<mtd3-br:publisherProgram>
				<xsl:sequence select="$programa"/>
			</mtd3-br:publisherProgram>
		
			
			<mtd3-br:publisherInitials>
				<xsl:text>UEL</xsl:text>
			</mtd3-br:publisherInitials>
			
			<xsl:variable name="var8_resultof_filter" as="node()?">
				<xsl:for-each select="$var1_mtdbr">
					<xsl:variable name="var6_resultof_vmf__inputtoresult" as="xs:string?">
						<xsl:call-template name="vmf:vmf3_inputtoresult">
							<xsl:with-param name="input" select="fn:string(ns0:Grau)" as="xs:string"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="var7_resultof_exists" as="xs:boolean" select="fn:exists($var6_resultof_vmf__inputtoresult)"/>
					<xsl:if test="$var7_resultof_exists">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:for-each>
			</xsl:variable>
			<xsl:for-each select="$var8_resultof_filter">
				<mtd3-br:type>
					<xsl:call-template name="vmf:vmf3_inputtoresult">
						<xsl:with-param name="input" select="fn:string(ns0:Grau)" as="xs:string"/>
					</xsl:call-template>
				</mtd3-br:type>
			</xsl:for-each>
			<xsl:for-each select="$var1_mtdbr">
				<xsl:variable name="var11_resultof_filter" as="node()*">
					<xsl:for-each select="ns0:Titulo[fn:exists(@Idioma)]">
						<xsl:variable name="var9_resultof_vmf__inputtoresult" as="xs:boolean?">
							<xsl:call-template name="vmf:vmf4_inputtoresult">
								<xsl:with-param name="input" select="fn:string(@Idioma)" as="xs:string"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="var10_resultof_exists" as="xs:boolean" select="fn:exists($var9_resultof_vmf__inputtoresult)"/>
						<xsl:if test="$var10_resultof_exists">
							<xsl:sequence select="."/>
						</xsl:if>
					</xsl:for-each>
				</xsl:variable>
				<xsl:variable name="var13_resultof_filter" as="node()*">
					<xsl:for-each select="$var11_resultof_filter">
						<xsl:variable name="var12_resultof_first" as="xs:boolean">
							<xsl:call-template name="vmf:vmf4_inputtoresult">
								<xsl:with-param name="input" select="fn:string(@Idioma)" as="xs:string"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:if test="$var12_resultof_first">
							<xsl:sequence select="."/>
						</xsl:if>
					</xsl:for-each>
				</xsl:variable>
				<xsl:for-each select="$var13_resultof_filter">
					<mtd3-br:title>
						<xsl:sequence select="fn:string(.)"/>
					</mtd3-br:title>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$var1_mtdbr">
				<xsl:variable name="var16_resultof_filter" as="node()*">
					<xsl:for-each select="ns0:Titulo[fn:exists(@Idioma)]">
						<xsl:variable name="var14_resultof_vmf__inputtoresult" as="xs:string?">
							<xsl:call-template name="vmf:vmf2_inputtoresult">
								<xsl:with-param name="input" select="translate(fn:string(@Idioma), $smallcase, $uppercase)"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="var15_resultof_exists" as="xs:boolean" select="fn:exists($var14_resultof_vmf__inputtoresult)"/>
						<xsl:if test="$var15_resultof_exists">
							<xsl:sequence select="."/>
						</xsl:if>
					</xsl:for-each>
				</xsl:variable>
				<xsl:variable name="var19_resultof_filter" as="node()*">
					<xsl:for-each select="$var16_resultof_filter">
						<xsl:variable name="var17_resultof_vmf__inputtoresult" as="xs:boolean?">
							<xsl:call-template name="vmf:vmf6_inputtoresult">
								<xsl:with-param name="input1" as="xs:string">
									<xsl:call-template name="vmf:vmf2_inputtoresult">
										<xsl:with-param name="input" select="translate(fn:string(@Idioma), $smallcase, $uppercase)"/>
									</xsl:call-template>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="var18_resultof_exists" as="xs:boolean" select="fn:exists($var17_resultof_vmf__inputtoresult)"/>
						<xsl:if test="$var18_resultof_exists">
							<xsl:sequence select="."/>
						</xsl:if>
					</xsl:for-each>
				</xsl:variable>
				<xsl:variable name="var21_resultof_filter" as="node()*">
					<xsl:for-each select="$var19_resultof_filter">
						<xsl:variable name="var20_resultof_first" as="xs:boolean">
							<xsl:call-template name="vmf:vmf6_inputtoresult">
								<xsl:with-param name="input1" as="xs:string">
									<xsl:call-template name="vmf:vmf2_inputtoresult">
										<xsl:with-param name="input" select="translate(fn:string(@Idioma), $smallcase, $uppercase)"/>
									</xsl:call-template>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:variable>
						<xsl:if test="$var20_resultof_first">
							<xsl:sequence select="."/>
						</xsl:if>
					</xsl:for-each>
				</xsl:variable>
				<xsl:for-each select="$var21_resultof_filter">
					<mtd3-br:titleAlternative>
						<xsl:attribute name="lang" namespace="">
							<xsl:call-template name="vmf:vmf2_inputtoresult">
								<xsl:with-param name="input" select="translate(fn:string(@Idioma), $smallcase, $uppercase)"/>
							</xsl:call-template>
						</xsl:attribute>
						<xsl:sequence select="fn:string(.)"/>
					</mtd3-br:titleAlternative>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$var1_mtdbr">
				<mtd3-br:language>
					<xsl:call-template name="vmf:vmf2_inputtoresult">
						<xsl:with-param name="input" select="translate(fn:string(ns0:Idioma), $smallcase, $uppercase)"/>
					</xsl:call-template>
				</mtd3-br:language>
			</xsl:for-each>
			<xsl:for-each select="$var1_mtdbr/ns0:Direitos">
				<mtd3-br:rights>
					<xsl:sequence select="fn:string(.)"/>
				</mtd3-br:rights>
			</xsl:for-each>
			<xsl:for-each select="$var1_mtdbr/ns0:Assunto">
				<xsl:variable name="var23_Idioma" as="node()?" select="@Idioma"/>
				<mtd3-br:subject>
					<xsl:if test="fn:exists($var23_Idioma)">
						<xsl:variable name="var24_resultof_vmf__inputtoresult" as="xs:string?">
							<xsl:call-template name="vmf:vmf2_inputtoresult">
								<xsl:with-param name="input" select="translate(fn:string($var23_Idioma), $smallcase, $uppercase)"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:if test="fn:exists($var24_resultof_vmf__inputtoresult)">
							<xsl:attribute name="lang" namespace="" select="$var24_resultof_vmf__inputtoresult"/>
						</xsl:if>
					</xsl:if>
					<xsl:sequence select="fn:string(.)"/>
				</mtd3-br:subject>
			</xsl:for-each>
			<xsl:for-each select="$var1_mtdbr/ns0:InstituicaoDefesa/ns0:Programa/ns0:Area">
				<mtd3-br:subjectCnpq>
					<xsl:sequence select="fn:string(.)"/>
				</mtd3-br:subjectCnpq>
			</xsl:for-each>
			<xsl:for-each select="$var1_mtdbr">
				<xsl:variable name="var27_resultof_filter" as="node()*">
					<xsl:for-each select="ns0:Arquivo[fn:exists(ns0:URL/@Formato)]">
						<xsl:variable name="var25_resultof_vmf__inputtoresult" as="xs:string?">
							<xsl:call-template name="vmf:vmf8_inputtoresult">
								<xsl:with-param name="input" select="fn:string(ns0:URL/@Formato)" as="xs:string"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="var26_resultof_exists" as="xs:boolean" select="fn:exists($var25_resultof_vmf__inputtoresult)"/>
						<xsl:if test="$var26_resultof_exists">
							<xsl:sequence select="."/>
							
						</xsl:if>
					</xsl:for-each>
				</xsl:variable>
				<xsl:for-each select="$var27_resultof_filter">
					<mtd3-br:format>
						<xsl:call-template name="vmf:vmf8_inputtoresult">
							<xsl:with-param name="input" select="fn:string(ns0:URL/@Formato)" as="xs:string"/>
						</xsl:call-template>
					</mtd3-br:format>
				</xsl:for-each>
			</xsl:for-each>
		</mtd3-br:mtd3br>
	</xsl:template>
</xsl:stylesheet>
