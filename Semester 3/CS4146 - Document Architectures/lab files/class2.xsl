<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>    
    
    <xsl:template match="Modules">
        
    </xsl:template>    
    
    <xsl:template match="Students">
        <xsl:copy>
            <xsl:apply-templates select="Student"/>
        </xsl:copy>
    </xsl:template>    
    
    <xsl:template match="Student">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"  mode="import"/>
        </xsl:copy>     
    </xsl:template>   
    
    <xsl:template match="@*|node()" mode="import" priority="-1">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode="import"/>
        </xsl:copy>
    </xsl:template>
        
</xsl:stylesheet>
