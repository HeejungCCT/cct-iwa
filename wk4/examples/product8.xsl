<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
	<html>
	<head><title></title></head>
	<body>
    	<xsl:for-each select="//vendor_name">
		<xsl:sort select="."/>
		<xsl:if test="../@webvendor!='no'">
			<xsl:element name="a">
    				<xsl:attribute name="href">
    					#<xsl:value-of select="."/>
    				</xsl:attribute>
    				<h2><xsl:value-of select="."/></h2>
    			</xsl:element>
		</xsl:if>
    	</xsl:for-each>	
	<xsl:for-each select="//vendor">
		<xsl:sort select="vendor_name"/>
    		   <xsl:if test="@webvendor!='no'">
			<p><xsl:value-of select="vendor_name"/></p>
    			<xsl:apply-templates select=".//product"/>
    	   	</xsl:if>	
    	</xsl:for-each>

	</body>
	</html>
    </xsl:template>
    
    <xsl:template match="product">
        <ul><li>
            <xsl:apply-templates select="product_id"/>
            <xsl:value-of select="short_desc"/>
            <br/><xsl:apply-templates select="inventory[@color and @location='warehouse']"/>
            <p><xsl:value-of select="price[@pricetype='sale'] | 
            			     price[@pricetype='retail']"/></p>
            
        </li></ul>
    </xsl:template>
    
    <xsl:template match="inventory[@color and @location='warehouse']">
    	--<xsl:value-of select="@color"/><br/>
    </xsl:template>

    <xsl:template match="product/product_id">
        <xsl:value-of select="."/>:
    </xsl:template>
    
</xsl:transform>
