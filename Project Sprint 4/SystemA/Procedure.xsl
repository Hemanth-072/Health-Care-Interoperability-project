<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3">
    <xsl:output method="text" encoding="UTF-8"/>
    
    <!-- Match the root ClinicalDocument element -->
    <xsl:template match="/hl7:ClinicalDocument">
        <xsl:text>&#xa;{&#xa;</xsl:text>
        
        <!-- Extract and format procedures section -->
        <xsl:text>"type": "testorder",&#xa;</xsl:text>
        <xsl:text>"action": "new",&#xa;</xsl:text>
        <xsl:text>"urgency": "</xsl:text>
        <xsl:value-of select="normalize-space(hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:entry/hl7:procedure/hl7:priorityCode/@displayName)"/>
        <xsl:text>",&#xa;</xsl:text>
        <xsl:text>"dateActivated": "</xsl:text>
        <xsl:value-of select="normalize-space(hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:entry/hl7:procedure/hl7:effectiveTime/@value)"/>
        <xsl:text>",&#xa;</xsl:text>
        <xsl:text>"careSetting": "INPATIENT",&#xa;</xsl:text>
        <xsl:text>"encounter": "</xsl:text>
        <xsl:value-of select="normalize-space(hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:entry/hl7:procedure/hl7:encounter/@root)"/>
        <xsl:text>",&#xa;</xsl:text>
        <xsl:text>"patient": "</xsl:text>
        <xsl:value-of select="normalize-space(hl7:recordTarget/hl7:patientRole/hl7:id/@root)"/>
        <xsl:text>",&#xa;</xsl:text>
        <xsl:text>"concept": "</xsl:text>
        <xsl:value-of select="normalize-space(hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:entry/hl7:procedure/hl7:code/@code)"/>
        <xsl:text>",&#xa;</xsl:text>
        <xsl:text>"orderer": "</xsl:text>
        <xsl:value-of select="normalize-space(hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:entry/hl7:procedure/hl7:performer/hl7:assignedEntity/hl7:id/@root)"/>
        <xsl:text>",&#xa;</xsl:text>
        
        <!-- Extract and format description -->
        <xsl:text>"description": "</xsl:text>
        <xsl:value-of select="normalize-space(hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:text)"/>
        <xsl:text>"&#xa;</xsl:text>
        
        <xsl:text>}</xsl:text>
    </xsl:template>
</xsl:stylesheet>
