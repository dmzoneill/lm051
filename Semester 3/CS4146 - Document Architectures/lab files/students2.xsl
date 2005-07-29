<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="Class">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>    
    
    <xsl:template match="Student">
        <xsl:if test="Grade[2] /@value &gt;= 3">
            <Student name="{Name}">
                <Grades>
                <xsl:for-each select="Grade" >
                    <xsl:value-of select="@value"/>, 
                </xsl:for-each>
                </Grades>
            </Student>            
        </xsl:if>
    </xsl:template>   
    
</xsl:stylesheet>
