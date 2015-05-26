<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" 			
    	exclude-result-prefixes="oai_dc  vmf fn ">

	<xsl:template name="vmf:normaliza_type">
		<xsl:param name="input" select="/.."/>
			<xsl:variable name="inputType" select="fn:lower-case(fn:replace($input,' ',''))" />

		<xsl:choose>

			<xsl:when test="((contains($inputType,'article') or contains($inputType,'artigo') or contains($inputType,'artigos')) and
				not(contains($inputType,'artigoemanaisdecongresso') or contains($inputType,'artigodeevento') 
				or contains($inputType,'artigosaceitos')))">
				<xsl:value-of select="'info:eu-repo/semantics/article'"/>
			</xsl:when>
			
			<xsl:when test="((contains($inputType,'artigoemanaisdecongresso') or contains($inputType,'resumoemanaisdecongresso')
			   or contains($inputType,'conferenceobject') or contains($inputType,'abstract') or contains($inputType,'paper') 
			   or contains($inputType,'meeting') or contains($inputType,'trabalhopalestra') or contains($inputType,'evento')) 
			   and not(contains($inputType,'workingpapers,resenhas,entreoutros')))">
				<xsl:value-of select="'info:eu-repo/semantics/conferenceObject'"/>
			</xsl:when>
			
			<xsl:when test="((contains($inputType,'capítulo') or contains($inputType,'capitulo')
			   or contains($inputType,'chapter') or contains($inputType,'partedelivro') or contains($inputType,'bookPart')))">
				<xsl:value-of select="'info:eu-repo/semantics/bookPart'"/>
			</xsl:when>
			
			<xsl:when test="($inputType='livro' or $inputType='book' or contains($inputType,'livroscientíficos(alice)') 
			or contains($inputType,'livro/book') or contains($inputType,'produçãobibliográfica:livros') or contains($inputType,'livro/folheto'))">
				<xsl:value-of select="'info:eu-repo/semantics/book'"/>
			</xsl:when>
			
			<xsl:when test="($inputType='publishedwork' or $inputType='periódico' or $inputType='revista' or $inputType='jornal' 
				or $inputType='fascículodeperiódico' or contains($inputType,'textoemjornalourevista'))">
				<xsl:value-of select="'info:eu-repo/semantics/contributionToPeriodical'"/>
			</xsl:when>
			
			<xsl:when test="($inputType='tcc' or $inputType='bachelorThesis' or contains($inputType,'conclusãodeiniciaçãocientífica') 
			or contains($inputType,'conclusãodeoutranatureza') or contains($inputType,'graduação') or contains($inputType,'monografia') 
			or contains($inputType,'especialização'))">
				<xsl:value-of select="'info:eu-repo/semantics/bachelorThesis'"/>
			</xsl:when>

			<xsl:when test="((contains($inputType,'doutor') or contains($inputType,'doctor') or contains($inputType,'tese') 
			    or contains($inputType,'thesis') or contains($inputType,'pós-doutorado')) and
				not(contains($inputType,'teses/dissertações') or contains($inputType,'teseoudissertação') 
				or contains($inputType,'eletronicthesisordissertation')))">
				<xsl:value-of select="'info:eu-repo/semantics/doctoralThesis'"/>
			</xsl:when>
			
			<xsl:when test="((contains($inputType,'mestre') or contains($inputType,'mestra') or contains($inputType,'master') 
			     or contains($inputType,'disserta')) and not(contains($inputType,'teses/dissertações') or contains($inputType,'teseoudissertação')
				 or contains($inputType,'eletronicthesisordissertation')))">
				<xsl:value-of select="'info:eu-repo/semantics/masterThesis'"/>
			</xsl:when>
			
			<xsl:when test="($inputType='review' or $inputType='resenha')">
				<xsl:value-of select="'info:eu-repo/semantics/review'"/>
			</xsl:when>
			
			<xsl:when test="(contains($inputType,'workingpapers,resenhas,entreoutros') or contains($inputType,'trabalhostécnicos') 
			or contains($inputType,'textoparadiscussão'))">
				<xsl:value-of select="'info:eu-repo/semantics/workingPaper'"/>
			</xsl:when>
	
			<xsl:when test="($inputType='textodeapresentação/encerramento' or $inputType='lecture'  
			or $inputType='apresentação' or $inputType='apresentacao' or $inputType='relatodeexperiencia' or $inputType='presentation')">
				<xsl:value-of select="'info:eu-repo/semantics/lecture'"/>
			</xsl:when>	
			
			<xsl:when test="contains($inputType,'patent')">
				<xsl:value-of select="'info:eu-repo/semantics/patent'"/>
			</xsl:when>
			
			<xsl:when test="($inputType='letter' or $inputType='carta' or $inputType='e-letters' or 
			$inputType='preprint' or contains($inputType,'artigosaceitosparapublicação'))">
				<xsl:value-of select="'info:eu-repo/semantics/preprint'"/>
			</xsl:when>
			
			<xsl:when test="((contains($inputType,'relatório') or contains($inputType,'notatécnica') or contains($inputType,'report')) and not(contains($inputType,'relatórioadministrativo')))">
				<xsl:value-of select="'info:eu-repo/semantics/report'"/>
			</xsl:when>
			
			<xsl:when test="(contains($inputType,'novasescriturasemedia') or contains($inputType,'video') or contains($inputType,'vídeo')
			or $inputType='outro' or $inputType='outros' or $inputType='other' or $inputType='audio' or $inputType='text' or $inputType='texto'
			or $inputType='outraspublicaçõescientíficas(alice)' or $inputType='produçãotécnica:outraproduçãotécnica' 
			or $inputType='produçãotécnica:outraproduçãotécnica' or $inputType='editorial' or $inputType='modelo3d' 
			or $inputType='folheto/sheet' or $inputType='ntsc' or $inputType='fotografia' or $inputType='misc' or $inputType='recording,oral' 
			or $inputType='n/t' or $inputType='biography' or $inputType='dvd' or $inputType='dvcam' or $inputType='entrevista' 
			or $inputType='p&amp;b' or $inputType='basededados' or $inputType='jogo'
			or contains($inputType,'tradução') or contains($inputType,'produçãocultural') or contains($inputType,'produçãocultural') 
			or contains($inputType,'anima') or contains($inputType,'software') or contains($inputType,'image'))">
				<xsl:value-of select="'info:eu-repo/semantics/other'"/>
			</xsl:when>

			<xsl:otherwise>
				<xsl:value-of select="$input"/>
		  </xsl:otherwise>
		</xsl:choose>
			
	</xsl:template>	
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
			
		<oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" 
			xmlns:dc="http://purl.org/dc/elements/1.1/" 
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
			xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ 
			http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
		
			<xsl:for-each select="//dc:title">
				<dc:title>
					<xsl:value-of select="."/>
				</dc:title>
			</xsl:for-each>
		
			<xsl:for-each select="//dc:creator">
				<dc:creator>
					 <xsl:value-of select="."/>
				</dc:creator>
			</xsl:for-each>
			
			<xsl:for-each select="//dc:subject">
				<dc:subject>
					<xsl:value-of select="."/>
				</dc:subject>
			</xsl:for-each>
			
			<xsl:for-each select="//dc:description">
				<dc:description>
					<xsl:value-of select="."/>
				</dc:description>
			</xsl:for-each>
				
			<xsl:for-each select="//dc:publisher">
				<dc:publisher>
					<xsl:value-of select="."/>
				</dc:publisher>
			</xsl:for-each>
			
			<xsl:for-each select="//dc:contributor">
				<dc:contributor>
					<xsl:value-of select="."/>
				</dc:contributor>
			</xsl:for-each>

			<xsl:for-each select="//dc:date">
				<dc:date>
					<xsl:value-of select="."/>
				</dc:date>
			</xsl:for-each>
			
			<xsl:for-each select="//dc:type">
				<dc:type> 
					<xsl:call-template name="vmf:normaliza_type">
						<xsl:with-param name="input" select="."/>
					</xsl:call-template>
				</dc:type>
			</xsl:for-each>			

			<xsl:for-each select="//dc:format">
				<dc:format>
					<xsl:value-of select="."/>
				</dc:format>
			</xsl:for-each>
			
			<xsl:for-each select="//dc:identifier">						
				<dc:identifier>
					<xsl:value-of select="."/>
				</dc:identifier>
			</xsl:for-each>
			
			<xsl:for-each select="//dc:source">						
				<dc:source>
					<xsl:value-of select="."/>
				</dc:source>
			</xsl:for-each>
						
			<xsl:for-each select="//dc:language">			
				<dc:language>
					<xsl:value-of select="."/>
				</dc:language>
			</xsl:for-each>
			
			<xsl:for-each select="//dc:relation">
				<dc:relation>
					<xsl:value-of select="."/>
				</dc:relation>
			</xsl:for-each>
	
			<xsl:for-each select="//dc:coverage">
				<dc:coverage>
					<xsl:value-of select="."/>
				</dc:coverage>
			</xsl:for-each>
	
			<xsl:for-each select="//dc:rights">
				<dc:rights>
					<xsl:value-of select="."/>
				</dc:rights>
			</xsl:for-each>
		</oai_dc:dc>
	</xsl:template>
</xsl:stylesheet>