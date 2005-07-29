<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>
  
  <xsl:template match="Class">
    <Class>
      <xsl:apply-templates/>
    </Class>    
  </xsl:template>
  
  <xsl:template match="Modules">
    <Modules>      
      <xsl:apply-templates/>  
    </Modules>    
  </xsl:template>
  
  <xsl:template match="Module">
    <Module>      
      <xsl:attribute name="type">
        <xsl:value-of select="@type"/>
      </xsl:attribute>      
      <xsl:attribute name="code">
        <xsl:value-of select="@code"/>
      </xsl:attribute>      
      <xsl:copy-of select="Title"/>      
    </Module>    
  </xsl:template>
  
  <xsl:template match="Students">
    <Students>       
        <xsl:apply-templates/>
    </Students>    
  </xsl:template>

   <xsl:template match="Student">
     <Student>
       <xsl:attribute name="id">
         <xsl:value-of select="@id"/>
       </xsl:attribute>
       <xsl:copy-of select="Name"/>
       <xsl:for-each select="Grade">
         <xsl:copy-of select="current()"/>
       </xsl:for-each>
     </Student>
   </xsl:template>

</xsl:stylesheet>
