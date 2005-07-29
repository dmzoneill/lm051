<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes" />
    
    <xsl:template match="Students">
        <class>
            <xsl:apply-templates select="Student"/>          
        </class>        
    </xsl:template>
        
    <xsl:template match="Student">
        
        <xsl:if test="Grade[2] /@value &gt;= 3">
            
        <Student>
            <xsl:attribute name="name">
                <xsl:value-of select="Name"/>
            </xsl:attribute>
            
            <Grades> 
                <xsl:for-each select="Grade">
                    <xsl:value-of select="@value"/>,                     
                </xsl:for-each>
            </Grades>
            
        </Student>  
            
        </xsl:if>
    </xsl:template>
   
    

</xsl:stylesheet>
