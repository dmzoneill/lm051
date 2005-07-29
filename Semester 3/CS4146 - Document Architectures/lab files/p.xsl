<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output indent="yes" method="xml"/>
    <xsl:template match="tvshow">
        <tvshow>
            <xsl:attribute name="year">
                <xsl:value-of select="@year"/>
            </xsl:attribute>
            <xsl:attribute name="rating">
                <xsl:value-of select="@rating"/>
            </xsl:attribute>
            <xsl:attribute name="season">
                <xsl:value-of select="@season"/>
            </xsl:attribute>
            <xsl:apply-templates select="title"/>
            <xsl:apply-templates select="genrelist/genre"/>  
        </tvshow>
    </xsl:template>
    
    <xsl:template match="title">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>    
   
    <xsl:template match="genrelist/genre">
        <genre> <xsl:value-of select="@name"/> </genre>        
    </xsl:template>

</xsl:stylesheet>
