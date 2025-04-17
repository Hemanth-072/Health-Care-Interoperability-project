<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:v3="urn:hl7-org:v3"
    xmlns:sdtc="urn:hl7-org:sdtc"
    exclude-result-prefixes="v3 sdtc">
    
    <xsl:output method="text" encoding="UTF-8" indent="no"/>
    
    <!-- Match the root element and apply templates -->
    <xsl:template match="/">
        <xsl:text>{</xsl:text>
        <xsl:apply-templates select="//v3:ClinicalDocument/v3:recordTarget/v3:patientRole"/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <!-- Patient Information -->
    <xsl:template match="v3:patientRole">
        <xsl:text>"names": [</xsl:text>
        <xsl:apply-templates select="v3:patient/v3:name[@use='L']"/>
        <xsl:text>],</xsl:text>
        <xsl:text>"gender": "</xsl:text><xsl:value-of select="v3:patient/v3:administrativeGenderCode/@code"/><xsl:text>",</xsl:text>
        <xsl:text>"birthdate": "</xsl:text><xsl:value-of select="substring(v3:patient/v3:birthTime/@value, 1, 4)"/>-<xsl:value-of select="substring(v3:patient/v3:birthTime/@value, 5, 2)"/>-<xsl:value-of select="substring(v3:patient/v3:birthTime/@value, 7, 2)"/><xsl:text>",</xsl:text>
        <xsl:text>"addresses": [</xsl:text>
        <xsl:apply-templates select="v3:addr[@use='HP']"/>
        <xsl:text>]</xsl:text>
    </xsl:template>
    
    <!-- Patient Name -->
    <xsl:template match="v3:name">
        <xsl:text>{</xsl:text>
        <xsl:text>"givenName": "</xsl:text><xsl:value-of select="v3:given"/><xsl:text>",</xsl:text>
        <xsl:text>"familyName": "</xsl:text><xsl:value-of select="v3:family"/><xsl:text>"</xsl:text>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <!-- Patient Address -->
    <xsl:template match="v3:addr">
        <xsl:text>{</xsl:text>
        <xsl:text>"address1": "</xsl:text><xsl:value-of select="v3:streetAddressLine"/><xsl:text>",</xsl:text>
        <xsl:text>"cityVillage": "</xsl:text><xsl:value-of select="v3:city"/><xsl:text>",</xsl:text>
        <xsl:text>"country": "</xsl:text><xsl:value-of select="v3:country"/><xsl:text>",</xsl:text>
        <xsl:text>"postalCode": "</xsl:text><xsl:value-of select="v3:postalCode"/><xsl:text>"</xsl:text>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>