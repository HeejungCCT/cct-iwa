<?xml version="1.0"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
    <html>
        <body>
            <h1><xsl:value-of select="//message" /></h1>
        </body>
    </html>
</xsl:template>
</xsl:transform>
