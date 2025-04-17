<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:v3="urn:hl7-org:v3"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    exclude-result-prefixes="v3 xsi">
    
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    
    <!-- Root template to initiate transformation -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Problem List Information</title>
            </head>
            <body>
                <h1>Problem List Details</h1>
                <table border="1" width="100%">
                    <thead>
                        <tr bgcolor="#9acd32">
                            <th>Name</th>
                            <th>Date</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Rib-Cage Defect</td>
                            <td>Onset: 04/02/2024</td>
                            <td>Active</td>
                        </tr>
                        <tr>
                            <td>Long-fingers</td>
                            <td>Onset: 04/02/2024</td>
                            <td>Active</td>
                        </tr>
                        <tr>
                            <td>Flat feet</td>
                            <td>Onset: 04/02/2024</td>
                            <td>Active</td>
                        </tr>
                        <tr>
                            <td>Double jointedness</td>
                            <td>Onset: 04/02/2024</td>
                            <td>Active</td>
                        </tr>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>