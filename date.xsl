<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xhtml="http://www.w3.org/1999/xhtml">
    <!--Modded XSLT 1.0 Date Conversion Template - 
    Original Code: https://stackoverflow.com/questions/27990478/convert-epoch-to-date-via-xsl-from-xml-attribute-and-display-in-html -->
    <xsl:template name="seconds-to-date">
      <xsl:param name="seconds"/>

      <xsl:param name="JDN" select="floor($seconds div 86400) + 2440588"/>
      <xsl:param name="Sec" select="$seconds mod 86400"/>

      <xsl:param name="f" select="$JDN + 1401 + floor((floor((4 * $JDN + 274277) div 146097) * 3) div 4) - 38"/>
      <xsl:param name="e" select="4*$f + 3"/>
      <xsl:param name="g" select="floor(($e mod 1461) div 4)"/>
      <xsl:param name="h" select="5*$g + 2"/>

      <xsl:param name="d" select="floor(($h mod 153) div 5 ) + 1"/>
      <xsl:param name="m" select="(floor($h div 153) + 2) mod 12 + 1"/>
      <xsl:param name="y" select="floor($e div 1461) - 4716 + floor((14 - $m) div 12)"/>

      <xsl:param name="H" select="floor($Sec div 3600)"/>
      <xsl:param name="M" select="floor($Sec mod 3600 div 60)"/>
      <xsl:param name="S" select="$Sec mod 60 div 1"/>

      <xsl:value-of select="concat($y, format-number($m, '-00'), format-number($d, '-00'))" />
      <xsl:value-of select="concat(format-number($H, ' 00'), format-number($M, ':00'), format-number($S, ':00'))" />
    </xsl:template>
  </xsl:stylesheet>