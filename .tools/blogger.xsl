<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:blog="http://www.w3.org/2005/Atom"
                xmlns:app="http://purl.org/atom/app#"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:exsl="http://exslt.org/common"
                xmlns:date="http://exslt.org/dates-and-times"
		extension-element-prefixes="app blog date exsl"
		version="1.0">

<xsl:output method="text" encoding="UTF-8"/>
<xsl:strip-space elements="*"/>

<xsl:template name="common.write.chunk">
	<xsl:param name="filename"/>
	<xsl:param name="method" select="'text'"/>
	<xsl:param name="indent" select="'no'"/>
	<xsl:param name="media-type" select="'text/plain'"/>
	<xsl:param name="content"/>

	<exsl:document href="{$filename}"
		       method="{$method}"
		       encoding="UTF-8"
		       indent="{$indent}"
		       media-type="{$media-type}">
		<xsl:copy-of select="$content"/>
	</exsl:document>
	<xsl:message>
		<xsl:text>Writing </xsl:text>
		<xsl:value-of select="$filename"/>
	</xsl:message>
</xsl:template>

<xsl:template name="common.header.text">
<xsl:text>---</xsl:text>
layout: post
<xsl:choose>
<xsl:when test="child::blog:category[@scheme = 'http://www.blogger.com/atom/ns#']/@term = 'german'">lang: de</xsl:when>
<xsl:otherwise>lang: en</xsl:otherwise>
</xsl:choose>

<xsl:apply-templates select="blog:published"/>
<xsl:apply-templates select="blog:updated"/>
<xsl:apply-templates select="blog:title"/>
author: dleidert
description: >
  TODO
<xsl:if test="child::blog:category[@scheme = 'http://www.blogger.com/atom/ns#']">categories:
<xsl:apply-templates select="child::blog:category[@scheme = 'http://www.blogger.com/atom/ns#']"/>
</xsl:if>
<xsl:if test="child::blog:category[@scheme = 'http://www.blogger.com/atom/ns#']">tags:
<xsl:apply-templates select="child::blog:category[@scheme = 'http://www.blogger.com/atom/ns#']"/>
</xsl:if>
<xsl:if test="child::blog:link[@rel = 'alternate']">redirect_from:
<xsl:apply-templates select="child::blog:link[@rel = 'alternate']"/>
</xsl:if>
<xsl:if test="descendant::app:draft">published: false</xsl:if>
<xsl:text>
---

</xsl:text>
</xsl:template>

<xsl:template match="/">
	<xsl:apply-templates select=".//blog:entry[child::blog:category[@term = 'http://schemas.google.com/blogger/2008/kind#post']]" /> 
</xsl:template>

<xsl:template match="blog:entry">
	<xsl:variable name="date" select="substring(blog:published, 1, 10)" />
	<xsl:variable name="filename">
		<xsl:choose>
			<xsl:when test="blog:link[@rel = 'alternate']/@href">
				<xsl:variable name="title" select="substring-before(substring(blog:link[@rel = 'alternate']/@href, 29), '.')" />
				<xsl:value-of select="concat('_posts/', $date ,'-', $title, '.md')" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat('_drafts/', $date ,'-draft.md')"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:call-template name="common.write.chunk">
		<xsl:with-param name="filename" select="$filename"/>
		<xsl:with-param name="method" select="'text'"/>
		<xsl:with-param name="media-type" select="'text/plain'"/>
		<xsl:with-param name="content">
			<xsl:call-template name="common.header.text"/>
			<xsl:apply-templates select="blog:content"/>
		</xsl:with-param>
	</xsl:call-template>
</xsl:template>

<xsl:template match="blog:title">
title: >
  <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="blog:published">
date: <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="blog:updated">
last_modified_at: <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="blog:category[not(attribute::term = 'german')]">
	<xsl:text>- </xsl:text><xsl:value-of select="@term" />
        <!-- <xsl:if test="following-sibling::blog:category"><xsl:text>&#xA;</xsl:text></xsl:if> -->
	<xsl:text>&#xA;</xsl:text>
</xsl:template>

<xsl:template match="blog:link">
	<xsl:text>- </xsl:text><xsl:value-of select="substring-after(@href, 'https://www.wgdd.de')" />
	<xsl:if test="following-sibling::blog:link[@rel = 'alternate']"><xsl:text>&#xA;</xsl:text></xsl:if>
</xsl:template>
</xsl:stylesheet>
