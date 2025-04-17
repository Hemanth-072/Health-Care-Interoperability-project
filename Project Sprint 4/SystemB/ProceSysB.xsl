<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3">
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    
    <!-- Root template to initiate transformation -->
    <xsl:template match="/hl7:ClinicalDocument">
        <procedureDetails>
            <!-- Extract and format procedure information -->
            <type>testorder</type>
            <action>new</action>
            <urgency>
                <xsl:value-of select="normalize-space(hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:entry/hl7:procedure/hl7:priorityCode/@displayName)"/>
            </urgency>
            <dateActivated>
                <xsl:value-of select="normalize-space(hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:entry/hl7:procedure/hl7:effectiveTime/@value)"/>
            </dateActivated>
            <careSetting>INPATIENT</careSetting>
            <encounter>
                <xsl:value-of select="normalize-space(hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:entry/hl7:procedure/hl7:encounter/@root)"/>
            </encounter>
            <patient>
                <xsl:value-of select="normalize-space(hl7:recordTarget/hl7:patientRole/hl7:id/@root)"/>
            </patient>
            <concept>
                <xsl:value-of select="normalize-space(hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:entry/hl7:procedure/hl7:code/@code)"/>
            </concept>
            <orderer>
                <xsl:value-of select="normalize-space(hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:entry/hl7:procedure/hl7:performer/hl7:assignedEntity/hl7:id/@root)"/>
            </orderer>
            <!-- Extract and format description -->
            <description>
                <xsl:value-of select="normalize-space(hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:text)"/>
            </description>
        </procedureDetails>
    </xsl:template>
    
</xsl:stylesheet>