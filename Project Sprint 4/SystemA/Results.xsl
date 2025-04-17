<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3">
    <xsl:output method="text" encoding="UTF-8"/>
    
    <!-- Match the root ClinicalDocument element -->
    <xsl:template match="/hl7:ClinicalDocument">
        <xsl:text>{&#xa;</xsl:text>
        
        <!-- "names" array with section title -->
        <xsl:text>"names": [&#xa;</xsl:text>
        <xsl:apply-templates select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='30954-2']/hl7:title"/>
        <xsl:text>],&#xa;</xsl:text>
        
        <!-- Hardcoded values for datatype, version, conceptClass -->
        <xsl:text>"datatype": "8d4a4c94-c2cc-11de-8d13-0010c6dffd0f",&#xa;</xsl:text>
        <xsl:text>"version": "1.2.2",&#xa;</xsl:text>
        <xsl:text>"conceptClass": "8d492774-c2cc-11de-8d13-0010c6dffd0f",&#xa;</xsl:text>
        
        <!-- "mappings" array with conceptReferenceTerm and conceptMapType -->
        <xsl:text>"mappings": [&#xa;</xsl:text>
        <xsl:apply-templates select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='30954-2']/hl7:entry/hl7:organizer/hl7:code"/>
        <xsl:text>],&#xa;</xsl:text>
        
        <!-- "descriptions" array with description and locale -->
        <xsl:text>"descriptions": [&#xa;</xsl:text>
        <xsl:apply-templates select="hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code/@code='30954-2']/hl7:text/hl7:table/hl7:tbody/hl7:tr"/>
        <xsl:text>]</xsl:text>
        
        <xsl:text>&#xa;}</xsl:text>
    </xsl:template>
    
    <!-- Template to process section title for "names" array -->
    <xsl:template match="hl7:title">
        <xsl:text>{ "name": "</xsl:text>
        <xsl:value-of select="normalize-space(.)"/>
        <xsl:text>", "locale": "en", "localePreferred": true, "conceptNameType": "FULLY_SPECIFIED" }</xsl:text>
        <xsl:if test="position() != last()">,</xsl:if>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>
    
    <!-- Template to process code element for "mappings" array -->
    <xsl:template match="hl7:code">
        <xsl:text>{ "conceptReferenceTerm": "</xsl:text>
        <xsl:value-of select="@code"/>
        <xsl:text>", "conceptMapType": "</xsl:text>
        <xsl:value-of select="@codeSystemName"/>
        <xsl:text>" }</xsl:text>
        <xsl:if test="position() != last()">,</xsl:if>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>
    
    <!-- Template to process table row for "descriptions" array -->
    <xsl:template match="hl7:tr">
        <xsl:text>{ "description": "</xsl:text>
        <xsl:value-of select="normalize-space(hl7:td[1])"/> - <xsl:value-of select="normalize-space(hl7:td[2])"/>
        <xsl:text>", "locale": "en" }</xsl:text>
        <xsl:if test="position() != last()">,</xsl:if>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>
