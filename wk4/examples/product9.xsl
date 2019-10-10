<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
	<html>
	<body>
    	<xsl:for-each select="//vendor_name">
    		<xsl:sort select="."/>
    		   <xsl:choose>
    		   	<xsl:when test="../@webvendor!='no'">
    			<xsl:element name="a">
    				<xsl:attribute name="href">
    					#<xsl:value-of select="."/>
    				</xsl:attribute>
    				<h2><xsl:value-of select="."/></h2>
    			</xsl:element>
    		   </xsl:when>
    		   <xsl:otherwise>
    		   	<h2><xsl:value-of select="."/></h2>
    		   </xsl:otherwise>
    		   </xsl:choose>
    	</xsl:for-each>	

	<xsl:for-each select="//vendor">
		<xsl:sort select="vendor_name"/>
    		   <xsl:if test="@webvendor!='no'">
    			<xsl:apply-templates/>
    	   	</xsl:if>	
    	</xsl:for-each>
	</body>
	</html>
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="product">
        <ul><li>
            <xsl:apply-templates select="product_id"/>
            <xsl:value-of select="short_desc"/>
            <br/><xsl:apply-templates select="inventory[@color and @location='warehouse']"/>
            <p><xsl:value-of select=".//price[@pricetype='sale'] | 
            			     .//price[@pricetype='retail']"/></p>
            
        </li></ul>
    </xsl:template>
    
    <xsl:template match="inventory[@color and @location='warehouse']">
    	--<xsl:value-of select="@color"/><br/>
    </xsl:template>

    <xsl:template match="product/product_id">
        <xsl:value-of select="."/>:
    </xsl:template>
    
    <xsl:template match="vendor_name">
    	<xsl:if test="../@webvendor!='no'">
    	<xsl:element name="a">
    		<xsl:attribute name="name"><xsl:value-of select="."/>
    		</xsl:attribute>
       		<p><xsl:value-of select="."/></p>
       	</xsl:element>
       	</xsl:if>
    </xsl:template>

</xsl:transform>
