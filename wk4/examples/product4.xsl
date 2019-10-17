<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
	<html>
	<head><title></title></head>
	<body>
            <xsl:apply-templates select="products/vendor" />
	</body>
	</html>
    </xsl:template>
    
    
    
    <xsl:template match="product">
        <ul><li>
            <xsl:apply-templates select="product_id"/>
            <xsl:value-of select="short_desc"/>
            <br/><xsl:apply-templates select="inventory[@color and @location='warehouse']"/>
            <p><xsl:value-of select="price[@pricetype='sale'] | price[@pricetype!='cost']"/></p>
            
        </li></ul>
    </xsl:template>
    
    <xsl:template match="inventory[@color and @location='warehouse']">
    	--<xsl:value-of select="@color"/><br/>
    </xsl:template>

    <xsl:template match="product/product_id">
        <xsl:value-of select="."/>:
    </xsl:template>
    
    <xsl:template match="vendor">
       <p><xsl:value-of select="vendor_name"/></p>
       <xsl:apply-templates select=".//product" />
    </xsl:template>

</xsl:transform>
