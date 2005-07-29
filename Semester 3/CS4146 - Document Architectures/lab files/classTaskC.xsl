<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output indent="no" method="xml"/>

<xsl:template match="Class">
  <xsl:copy>
    <xsl:apply-templates select="Students"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="Student">
  <xsl:copy>
    <xsl:apply-templates select="node()"/>
  </xsl:copy>
</xsl:template>
  
  <xsl:template match="Name|@*">
    <xsl:copy-of select="."/>
  </xsl:template>

<xsl:template match="Grade">
  <xsl:if test="@value &gt;= 8">
    <xsl:copy-of select="."/>
  </xsl:if>
</xsl:template>
  
</xsl:stylesheet>
