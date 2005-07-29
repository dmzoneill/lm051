<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="Students">
        <html><body>
        <xsl:apply-templates select="Student"/>
        </body></html>
    </xsl:template>
    
    <xsl:template match="Student">  
        <xsl:apply-templates select="Name" />
    </xsl:template>
    
    <xsl:template match="Name">        
        <xsl:apply-templates /><br/>
    </xsl:template>    

</xsl:stylesheet>
