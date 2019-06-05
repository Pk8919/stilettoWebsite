<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:aspdnsf="urn:aspdnsf" exclude-result-prefixes="aspdnsf">
  <xsl:output method="html" omit-xml-declaration="yes" />
  <xsl:param name="LocaleSetting" select="/root/Runtime/LocaleSetting" />
  <xsl:param name="WebConfigLocaleSetting" select="/root/Runtime/WebConfigLocaleSetting" />
  <xsl:param name="ShowSubcatsInGrid">
    <xsl:value-of select="aspdnsf:AppConfig('ShowSubcatsInGrid')" />
  </xsl:param>
  <xsl:param name="SubcatGridCols">
    <xsl:value-of select="/root/EntityHelpers/*[name()=/root/Runtime/EntityName]/descendant::Entity[EntityID=/root/Runtime/EntityID]/ColWidth" />
  </xsl:param>
  <xsl:param name="EntityName">
    <xsl:value-of select="/root/Runtime/EntityName" />
  </xsl:param>
  <xsl:param name="EntityID">
    <xsl:value-of select="/root/Runtime/EntityID" />
  </xsl:param>
  <xsl:param name="WholesaleOnlySite">
    <xsl:value-of select="aspdnsf:AppConfig('WholesaleOnlySite')" />
  </xsl:param>
  <xsl:param name="BaseURL">
    <xsl:variable name="currentEntity" select="/root/EntityHelpers/*[name()=/root/Runtime/EntityName]/descendant::Entity[EntityID=/root/Runtime/EntityID]/Entity" />
    <xsl:value-of select="aspdnsf:EntityLink(/root/Runtime/EntityID, $currentEntity/SEName, /root/Runtime/EntityName, 0)" />
  </xsl:param>
  <xsl:param name="CurrentPage">
    <xsl:choose>
      <xsl:when test="/root/QueryString/pagenum">
        <xsl:value-of select="/root/QueryString/pagenum" />
      </xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:template match="/">
    <div>
      <xsl:value-of select="aspdnsf:EntityPageHeaderDescription($EntityName, $EntityID)" disable-output-escaping="yes" />
    </div>
    <xsl:value-of select="aspdnsf:EntityPageFilterOptions($EntityName, $EntityID, /root/Runtime/SecID, /root/Runtime/CatID, /root/Runtime/ManID, /root/Runtime/ProductTypeFilterID)" disable-output-escaping="yes" />
    <xsl:call-template name="SubEntity" />
    <xsl:choose>
      <xsl:when test="count(/root/Products/Product) = 0 and count(/root/EntityHelpers/*[name()=/root/Runtime/EntityName]/descendant::Entity[EntityID=/root/Runtime/EntityID]/Entity) = 0">
        <xsl:value-of select="aspdnsf:Topic(concat('empty', /root/Runtime/EntityName, 'text'))" disable-output-escaping="yes" />
      </xsl:when>
      <xsl:otherwise>
        <div style="text-align:right;">
          <xsl:value-of select="aspdnsf:PagingControl($BaseURL, $CurrentPage, /root/Products2/Product/pages)" disable-output-escaping="yes" />
        </div>
        <table border="0" cellpadding="0" cellspacing="4" width="100%">
          <xsl:apply-templates select="/root/Products/Product" />
        </table>
        <div style="text-align:right;">
          <xsl:value-of select="aspdnsf:PagingControl($BaseURL, $CurrentPage, /root/Products2/Product/pages)" disable-output-escaping="yes" />
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="SubEntity">
    <xsl:for-each select="/root/EntityHelpers/*[name()=/root/Runtime/EntityName]/descendant::Entity[ParentEntityID=/root/Runtime/EntityID]">
      <xsl:choose>
        <xsl:when test="$ShowSubcatsInGrid = 'true'">
          <table border="0" cellpadding="0" cellspacing="4" width="100%">
            <xsl:if test="position() mod $SubcatGridCols = 1 or ($SubcatGridCols = 1)">
              <tr>
                <xsl:for-each select=". | following-sibling::*[position() &lt; $SubcatGridCols]">
                  <xsl:variable name="scName" select="aspdnsf:GetMLValue(Name)" />
                  <xsl:call-template name="SubCatCell">
                    <xsl:with-param name="scName" select="$scName" />
                  </xsl:call-template>
                </xsl:for-each>
              </tr>
              <tr>
                <td height="10" colspan="{$SubcatGridCols}"> </td>
              </tr>
            </xsl:if>
          </table>
        </xsl:when>
        <xsl:otherwise>
          <xsl:variable name="scName" select="aspdnsf:GetMLValue(Name)" />
          <p align="left">
                                   <img border="0" src="{concat('App_Themes/Skin_', aspdnsf:SkinID(), '/images/redarrow.gif')}"></img> 
                                <a href="{aspdnsf:EntityLink(EntityID, SEName, $EntityName, 0, '')}"><xsl:value-of select="$scName" disable-output-escaping="yes" /></a></p>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="SubCatCell">
    <xsl:param name="scName">
    </xsl:param>
    <xsl:param name="pSEAltText" select="aspdnsf:GetMLValue(SEAltText)">
    </xsl:param>
    <xsl:param name="AltText">
      <xsl:choose>
        <xsl:when test="$pSEAltText=''">
          <xsl:value-of select="$scName" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$pSEAltText" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:param>
    <xsl:param name="URL">
      <xsl:value-of select="aspdnsf:EntityLink(EntityID, SEName, $EntityName, 0, '')" />
    </xsl:param>
    <td align="center">
      <a href="{$URL}">
        <xsl:value-of select="aspdnsf:LookupEntityImage(EntityID, $EntityName, 'icon', 0, $AltText)" disable-output-escaping="yes" />
      </a>
      <br />
      <a href="{$URL}">
        <xsl:value-of select="$scName" disable-output-escaping="yes" />
      </a>
    </td>
  </xsl:template>
  <xsl:template match="Product">
    <xsl:param name="pName" select="aspdnsf:GetMLValue(Name)">
    </xsl:param>
    <xsl:param name="pDescription" select="aspdnsf:GetMLValue(Summary)">
    </xsl:param>
    <xsl:param name="pSalesPromptName" select="aspdnsf:GetMLValue(SalesPromptName)">
    </xsl:param>
    <xsl:param name="pSEAltText" select="aspdnsf:GetMLValue(SEAltText)">
    </xsl:param>
    <xsl:param name="AltText">
      <xsl:choose>
        <xsl:when test="$pSEAltText=''">
          <xsl:value-of select="$pName" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$pSEAltText" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:param>
    <xsl:param name="URL">
      <xsl:value-of select="aspdnsf:ProductandEntityLink(ProductID, SEName, $EntityID, $EntityName, 0)" disable-output-escaping="yes" />
    </xsl:param>
    <tr>
      <td>
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
          <tr>
            <td width="10%" align="left" valign="top" style="padding-right:10px;">
              <a href="{$URL}">
                <xsl:value-of select="aspdnsf:LookupProductImage(ProductID, ImageFileNameOverride, SKU, 'icon', 0, $AltText)" disable-output-escaping="yes" />
              </a>
            </td>
            <td valign="top" align="left">
              <table width="100%" cellpadding="1" cellspacing="0" border="0">
                <tr>
                  <td class="ProductNameText" align="left" valign="top">
                    <h3>
                      <a href="{$URL}">
                        <xsl:value-of select="$pName" disable-output-escaping="yes" />
                      </a>
                    </h3>
                  </td>
                </tr>
                <tr>
                  <td align="left" valign="top">
                    <xsl:value-of select="$pDescription" disable-output-escaping="yes" />
                    <a href="{$URL}" class="lmorebtn">Learn More</a>
                  </td>
                </tr>
                <tr>
                  <td height="20"> </td>
                </tr>
                <tr style="display: none;">
                  <td align="left" valign="top" style="display: none;">
                    <xsl:value-of select="aspdnsf:StringResource(concat('show', $EntityName, '.aspx.29'), $LocaleSetting)" disable-output-escaping="yes" />
                    <xsl:value-of select="SKU" />
                  </td>
                </tr>
                <tr style="display: none;">
                  <td align="left" valign="top">
                    <xsl:choose>
                      <xsl:when test="MiscText = 'SHOW INVENTORY'">
                        <xsl:value-of select="aspdnsf:StringResource('searchadv.aspx.20')" disable-output-escaping="yes" />
                        <xsl:value-of select="Inventory" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="aspdnsf:StringResource('searchadv.aspx.21')" disable-output-escaping="yes" />
                        <xsl:choose>
                          <xsl:when test="number(Inventory)&gt;0">
                            <xsl:value-of select="aspdnsf:StringResource('searchadv.aspx.5')" disable-output-escaping="yes" />
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="aspdnsf:StringResource('searchadv.aspx.6')" disable-output-escaping="yes" />
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
                <tr style="display: none;">
                  <td align="left" valign="bottom">
                    <xsl:value-of select="aspdnsf:GetVariantPrice(VariantID, number(HidePriceUntilCart), Price, SalePrice, ExtendedPrice, Points, $pSalesPromptName, TaxClassID)" disable-output-escaping="yes" />
                  </td>
                </tr>
                <tr>
                  <td align="left" valign="bottom" style="display: none;">
                    <xsl:if test="aspdnsf:AppConfigBool('DisplayOutOfStockProducts') = 'true'">
                      <xsl:value-of select="aspdnsf:DisplayProductStockHint(ProductID, VariantID,'Entity')" disable-output-escaping="yes" />
                    </xsl:if>
                  </td>
                </tr>
                <tr style="display: none;">
                  <td height="20"> </td>
                </tr>
                <tr style="display: none;">
                  <td align="left" valign="bottom">
                    <xsl:choose>
                      <xsl:when test="IsAKit = 1 or IsAPack = 1">
                        <a href="{$URL}">
                          <img style="cursor:hand;" border="0" src="{concat('App_Themes/Skin_', aspdnsf:SkinID(), '/images/moreinfo.gif')}" alt="{aspdnsf:StringResource('image.altText.14', $LocaleSetting)}">
                          </img>
                        </a>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="aspdnsf:AddtoCartForm(ProductID, VariantID, 0, 'left')" disable-output-escaping="yes" />
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td height="15">
        <hr size="1" />
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
