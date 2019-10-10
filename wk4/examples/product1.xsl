
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:template match="/">
     <html>
        <body>
            <xsl:apply-templates select="//vendor"/>
        </body>
     </html>
    </xsl:template>

    
    <xsl:template match="//vendor">
       <p><xsl:value-of select="vendor_name"/></p>
    </xsl:template>


</xsl:transform>
