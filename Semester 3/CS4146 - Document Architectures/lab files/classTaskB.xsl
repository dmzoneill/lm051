<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output indent="no" method="xml"/>

<xsl:template match="Class">
  <xsl:copy-of select="Students"/>
</xsl:template>

</xsl:stylesheet>
