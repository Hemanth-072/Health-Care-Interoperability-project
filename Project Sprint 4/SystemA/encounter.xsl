<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3">
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:template match="/hl7:ClinicalDocument">
        <xsl:text>POST /Encounter</xsl:text>
        <xsl:text>&#xa;{&#xa;</xsl:text>
        <xsl:apply-templates select="hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:entry/hl7:encounter"/>
        <xsl:text>&#xa;}</xsl:text>
    </xsl:template>
    
    <xsl:template match="hl7:encounter">
        <xsl:text>"encounterDatetime": "</xsl:text>
        <xsl:value-of select="hl7:effectiveTime/@value"/>
        <xsl:text>",&#xa;</xsl:text>
        <xsl:text>"patient": "</xsl:text>
        <xsl:value-of select="normalize-space(hl7:participant/hl7:participantRole/hl7:playingEntity/hl7:code/@code)"/>
        <xsl:text>",&#xa;</xsl:text>
        <xsl:text>"encounterType": "</xsl:text>
        <xsl:value-of select="normalize-space(hl7:code/hl7:translation/@code)"/>
        <xsl:text>",&#xa;</xsl:text>
        <xsl:text>"location": "</xsl:text>
        <xsl:value-of select="normalize-space(hl7:participant/hl7:participantRole/hl7:code/@code)"/>
        <xsl:text>",&#xa;</xsl:text>
        <xsl:text>"encounterProviders": [&#xa;</xsl:text>
        <xsl:apply-templates select="hl7:performer/hl7:assignedEntity"/>
        <xsl:text>&#xa;],&#xa;</xsl:text>
        <xsl:text>"visit": {&#xa;</xsl:text>
        <xsl:text>"patient": "</xsl:text>
        <xsl:value-of select="normalize-space(hl7:participant/hl7:participantRole/hl7:playingEntity/hl7:code/@code)"/>
        <xsl:text>",&#xa;</xsl:text>
        <xsl:text>"visitType": "</xsl:text>
        <xsl:value-of select="normalize-space(hl7:code/hl7:translation/@code)"/>
        <xsl:text>",&#xa;</xsl:text>
        <xsl:text>"startDatetime": "</xsl:text>
        <xsl:value-of select="hl7:effectiveTime/@value"/>
        <xsl:text>",&#xa;</xsl:text>
        <xsl:text>"stopDatetime": "</xsl:text>
        <xsl:value-of select="hl7:effectiveTime/@value"/>
        <xsl:text>"&#xa;</xsl:text>
        <xsl:text>}&#xa;</xsl:text>
    </xsl:template>
    
    <xsl:template match="hl7:assignedEntity">
        <xsl:text>{&#xa;</xsl:text>
        <xsl:text>"provider": "</xsl:text>
        <xsl:value-of select="normalize-space(hl7:id/@extension)"/>
        <xsl:text>",&#xa;</xsl:text>
        <xsl:text>"encounterRole": "</xsl:text>
        <xsl:value-of select="normalize-space(hl7:code/@code)"/>
        <xsl:text>"&#xa;</xsl:text>
        <xsl:text>}</xsl:text>
        <xsl:if test="following-sibling::hl7:assignedEntity">
            <xsl:text>,&#xa;</xsl:text>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>
