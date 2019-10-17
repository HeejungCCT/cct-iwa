<?xml version="1.0"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"	version="2.0">
	<xsl:template match="*">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="text()">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="/">
		<html>
			<head><title>Example</title>
			</head>
			<body>
				<!--Question 1-->
				<h2>Modules this semester:</h2>
				<xsl:apply-templates select="/timetable/module/name"/>
				<!--Question 2-->
				<h2>Modules with a Terminal Exam:</h2>
				<xsl:apply-templates select="//exam"/>
				<!--Question 3-->
				<h2>Lab Schedule:</h2>
				<xsl:apply-templates select="/timetable/module/classes/lab"/>
				<!--Question 4 -->
				<h2>There is more than one lecture in:</h2>
				<xsl:apply-templates select="/timetable/module/classes/lecture[@id>'1']"/>
				<!--Question 5-->
				<h2>The day time and room of all classes in a computer lab:</h2>
				<xsl:apply-templates select="//room[@type='computerLab']"/>
				<!--Question 6-->
				<h2>The details of all Monday classes:</h2>
				<xsl:apply-templates select="/timetable/module/classes/*/day[text()='Mon']"/>
			</body>
			</html>
	</xsl:template>
	<!--Question 1-->
	<xsl:template match="name">
			<xsl:value-of select="."/><br/>
	</xsl:template> 
	<!--Question 2-->
	<xsl:template match="exam">
			<xsl:value-of select="../name"/><br/>
	</xsl:template>
	<!--Question 3-->
	<xsl:template match="lab">
			<xsl:value-of select="../../name"/>
			<ul>
				<li><xsl:value-of select="day"/></li>
				<li><xsl:value-of select="time"/></li>
				<li><xsl:value-of select="room"/></li>
			</ul>
	</xsl:template>
	<!--Question 4-->
	<xsl:template match="lecture">
            <xsl:for-each select="../../*">
                <xsl:value-of select="."/><br/>
            </xsl:for-each>
	</xsl:template>
	<!--Question 5-->
	<xsl:template match="room">
			<xsl:value-of select="../../../name"/>, 
			<xsl:value-of select="../."/><br/>
	</xsl:template>
	<!--Question 6-->
	<xsl:template match="day">
			<xsl:value-of select="../../../name"/><br/>
	</xsl:template>
</xsl:transform>
