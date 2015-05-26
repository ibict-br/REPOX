<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:OAIDC="http://www.openarchives.org/OAI/2.0/oai_dc/" 	
xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf" 
xmlns:xs="http://www.w3.org/2001/XMLSchema" 
xmlns:fn="http://www.w3.org/2005/xpath-functions" 
xmlns:dim="http://www.dspace.org/xmlns/dspace/dim"
exclude-result-prefixes="xs vmf xsl fn dim OAIDC">
	
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
				
	<xsl:template match="/">
	
		
	<dim:dim xmlns:dim="http://www.dspace.org/xmlns/dspace/dim" xmlns:doc="http://www.lyncode.com/xoai" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.dspace.org/xmlns/dspace/dim http://www.dspace.org/schema/dim.xsd">
		
	<!-- TIPO DE DOCUMENTO -->
	
		<xsl:for-each select="OAIDC:dc/*:type">
			<dim:field element="type" mdschema="dc">
				<xsl:sequence select="fn:string(.)"/> 
			</dim:field>
		</xsl:for-each>
	
	
		
	
		
		
	</dim:dim>
	</xsl:template>
</xsl:stylesheet>
