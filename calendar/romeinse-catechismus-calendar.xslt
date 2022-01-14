<?xml version="1.0"?>
<xsl:stylesheet version="3.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" indent="yes"/>

    <!-- stdin = the calendar-{eo,of}.xml file
         param "romeinse-catechismus-html" = kalender-{eo,of}.html filename -->

  <xsl:param name="romeinse-catechismus-html"/>
  <xsl:param name="romeinse-catechismus-url"/>

  <xsl:variable name="romeinse-catechismus" select="doc($romeinse-catechismus-html)//article/h2"/>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="year">
      <xsl:apply-templates select="node()"/>
  </xsl:template>

  <xsl:template match="cyear|month|form|cycle|i18n|rss"/>

  <xsl:template match="day">
    <xsl:if test="date &gt; '2022-01-13'">
      <xsl:variable name="section" select="$romeinse-catechismus[contains(@id,current()/coordinates)]"/>
      <xsl:if test="$section">
        <xsl:copy>
          <xsl:apply-templates select="@*|node()"/>
          <xsl:variable name="html">
            <h3><xsl:value-of select="normalize-space($section/text()[1])"/></h3>
            <xsl:copy-of select="$section/following-sibling::ul[1]"/>
          </xsl:variable>
          <text>
            <xsl:copy-of select="serialize($html)"/>
          </text>
          <url>
            <xsl:value-of select="concat($romeinse-catechismus-url,$section/a/@href)"/>
          </url>
        </xsl:copy>
        <xsl:apply-templates select="preceding-sibling::day[1]" mode="preceding-days">
          <xsl:with-param name="next-section" select="$section"/>
        </xsl:apply-templates>
      </xsl:if>
      <!--xsl:if test="not($section)">
        <xsl:message>No match in innerlijk-leven-html5.html for <xsl:value-of select="coordinates"/> on <xsl:value-of select="date"/></xsl:message>
      </xsl:if-->
    </xsl:if>
  </xsl:template>

  <xsl:template match="day" mode="preceding-days">
    <xsl:param name="next-section"/>
    <xsl:if test="date &gt; '2022-01-13'">
      <xsl:variable name="section" select="$romeinse-catechismus[contains(@id,current()/coordinates)]"/>
      <xsl:if test="not($section)">
        <xsl:copy>
          <xsl:apply-templates select="@*|node()"/>
          <xsl:variable name="html">
            <h3><xsl:value-of select="normalize-space($next-section/text()[1])"/></h3>
            <xsl:copy-of select="$next-section/following-sibling::ul[1]"/>
          </xsl:variable>
          <text>
            <xsl:copy-of select="serialize($html)"/>
          </text>
          <url>
            <xsl:value-of select="concat($romeinse-catechismus-url,$next-section/a/@href)"/>
          </url>
        </xsl:copy>
        <xsl:apply-templates select="preceding-sibling::day[1]" mode="preceding-days">
          <xsl:with-param name="next-section" select="$next-section"/>
        </xsl:apply-templates>
      </xsl:if>
      <!--xsl:if test="$section">
        <xsl:message>No match in innerlijk-leven-html5.html for <xsl:value-of select="coordinates"/> on <xsl:value-of select="date"/></xsl:message>
      </xsl:if-->
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>

