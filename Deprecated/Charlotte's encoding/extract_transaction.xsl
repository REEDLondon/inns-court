<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://oxygenxml/com/ns/doc/xsl"
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns:jc="http://james.blushingbunny.net/ns.html"
    version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">

<!-- Stylesheet to extract data from transaction files -->
    
    <!-- xsl:output here outputting text for CSV -->
    <xsl:output method="text" encoding="UTF-8"/>
    
    <!-- Match Root Node -->
    <xsl:template match="/">
        <xsl:text>Transaction amount</xsl:text>
        <xsl:for-each select="//text//measure">
            <xsl:sort select="name()"/>
            <xsl:sort select="."/>
            <!--<xsl:sort select="@n"/>-->
            <xsl:value-of select="jc:createCSV(.)"/>
        </xsl:for-each>       
    </xsl:template>
    
    <!-- This function creates a string from the node provided to it -->
<xsl:function name="jc:createCSV" as="xs:string">
    <!-- Take in the node as a parameter -->
    <xsl:param as="node()" name="node"/>
    <!-- Create CSV separator ", " variable -->
    <xsl:variable name="sep">
        <xsl:text>&quot;,&quot;</xsl:text>
    </xsl:variable>
    <!-- Create CSV terminal (just a " or &quot but why not) -->
    <xsl:variable name="terminal">
        <xsl:text>&quot;</xsl:text>
    </xsl:variable>

    <xsl:variable name="tag">
        <xsl:value-of select="$node/name()"/>
    </xsl:variable>
    <xsl:variable name="elementName">
        <xsl:value-of select="$node/jc:csvEscapeDoubleQuotes(.)"/>
    </xsl:variable>
    <xsl:variable name="elementContent">
        <xsl:value-of select="$node/jc:csvEscapeDoubleQuotes(.)" />
    </xsl:variable>    
    <xsl:variable name="typeAttributeIfPresent">
        <xsl:value-of select="$node/@type/jc:csvEscapeDoubleQuotes(.)" />
    </xsl:variable>


<!--    <!-\- Assemble the output $terminal, all our variables separated with value of $sep, followed by the $terminal -\->   
    <xsl:variable name="output"><xsl:value-of select="$terminal"/><xsl:value-of select="$elementName, $elementContent, $typeAttributeIfPresent, separator="{$sep}"/><xsl:value-of select="$terminal"/></xsl:variable>    -->
    
    <xsl:variable name="n">
        <xsl:value-of select="$node/@n/jc:csvEscapeDoubleQuotes(.)"/>
    </xsl:variable>
    
    <xsl:variable name="type">
        <xsl:value-of select="$node/@type/jc:csvEscapeDoubleQuotes(.)" />
    </xsl:variable>
    
    <xsl:variable name="persName">
        <xsl:value-of select="$node/@persName/jc:csvEscapeDoubleQuotes(.)"/>
    </xsl:variable>

    
    
    <xsl:variable name="when">
        <xsl:value-of select="$node/@when-iso/jc:csvEscapeDoubleQuotes(.)"/>
    </xsl:variable>

    <!-- Assemble the output $terminal, all our variables separated with value of $sep, followed by the $terminal -->   
    <xsl:variable name="output">
        <xsl:value-of select="$terminal"/>
        <xsl:value-of select="$tag, $elementContent, $type, $persName, $when" separator="{$sep}"/>
        <xsl:value-of select="$terminal"/>
    </xsl:variable>    
    
    <!-- Concatenated the normalize-spaced version of this with a newline at the beginning -->
    <xsl:value-of select="concat('&#xA;',normalize-space($output))"/>
    </xsl:function>
    
    <!-- CSV doesn't like spare double quotes lying around. So you escape them by putting two double quotes instead -->  
    <xsl:function name="jc:csvEscapeDoubleQuotes" as="xs:string">
        <xsl:param name="string"/>
        <xsl:value-of select="replace($string, '&quot;', '&quot;&quot;')"/>
    
    </xsl:function>
</xsl:stylesheet>