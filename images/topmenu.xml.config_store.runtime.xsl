<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:aspdnsf="urn:aspdnsf" exclude-result-prefixes="aspdnsf">
  <xsl:output method="html" omit-xml-declaration="yes" />
  <xsl:param name="CategoryID">
    <xsl:choose>
      <xsl:when test="/root/System/PageName = 'showmanufacturer.aspx' or /root/System/PageName = 'showsection.aspx' or /root/System/PageName = 'showdistributor.aspx' or /root/System/PageName = 'showvector.aspx' or /root/System/PageName = 'showgenre.aspx'">0</xsl:when>
      <xsl:when test="/root/System/PageName = 'showcategory.aspx' and boolean(/root/QueryString/categoryid)">
        <xsl:value-of select="/root/QueryString/categoryid" />
      </xsl:when>
      <xsl:when test="(/root/System/PageName = 'showcategory.aspx' or /root/System/PageName = 'showproduct.aspx') and boolean(/root/Cookies/LastViewedEntityInstanceID) and /root/Cookies/LastViewedEntityName = 'Category'">
        <xsl:value-of select="/root/Cookies/LastViewedEntityInstanceID" />
      </xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="AncestorID">
    <xsl:for-each select="/root/EntityHelpers/Category//Entity[EntityID = $CategoryID]">
      <xsl:value-of select="ancestor::*/EntityID" />
    </xsl:for-each>
  </xsl:param>
  <xsl:param name="ParentID">
    <xsl:for-each select="/root/EntityHelpers/Category//Entity[EntityID = $CategoryID]">
      <xsl:value-of select="parent::*/EntityID" />
    </xsl:for-each>
  </xsl:param>
  <xsl:template match="/">
    <ul class="sf-menu">
      <li>
        <a href="/">
          <xsl:value-of select="aspdnsf:StringResource('menu.Home')" disable-output-escaping="yes" />
        </a>
      </li>
      <li>
        <a href="#">
          <xsl:value-of select="aspdnsf:StringResource('menu.Categories')" disable-output-escaping="yes" />
        </a>
        <ul>
          <xsl:apply-templates select="/root/EntityHelpers/Category/Entity" />
        </ul>
      </li>
      <li>
        <a href="#">
          <xsl:value-of select="aspdnsf:StringResource('menu.WhatsNew')" disable-output-escaping="yes" />
        </a>
        <ul>
          <li>
            <a href="/t-now-available.aspx">Now Available</a>
          </li>
          <li>
            <a href="/t-press.aspx">Product Reviews</a>
          </li>
          <li>
            <a href="/t-testimonials.aspx">Testimonials</a>
          </li>
          <li>
            <a href="/t-crews.aspx">Crews and Projects</a>
          </li>
        </ul>
      </li>
      <!-- These are static links -->
      <li>
        <a href="/t-service.aspx">
          <xsl:value-of select="aspdnsf:StringResource('menu.CustomerService')" disable-output-escaping="yes" />
        </a>
        <ul>
          <li>
            <a href="/account.aspx">
              <xsl:value-of select="aspdnsf:StringResource('menu.YourAccount')" disable-output-escaping="yes" />
            </a>
          </li>
          <li>
            <a href="/t-faq.aspx">
              <xsl:value-of select="aspdnsf:StringResource('menu.FAQs')" disable-output-escaping="yes" />
            </a>
          </li>
          <li>
            <a href="/t-returns.aspx">
              <xsl:value-of select="aspdnsf:StringResource('menu.PolicyReturns')" disable-output-escaping="yes" />
            </a>
          </li>
          <li>
            <a href="/t-shipping.aspx">
              <xsl:value-of select="aspdnsf:StringResource('menu.Shipping')" disable-output-escaping="yes" />
            </a>
          </li>
          <li>
            <a href="/t-contact.aspx">
              <xsl:value-of select="aspdnsf:StringResource('menu.Contact')" disable-output-escaping="yes" />
            </a>
          </li>
          <li>
            <a href="/t-privacy.aspx">
              <xsl:value-of select="aspdnsf:StringResource('menu.PolicyPrivacy')" disable-output-escaping="yes" />
            </a>
          </li>
          <li>
            <a href="/t-security.aspx">
              <xsl:value-of select="aspdnsf:StringResource('menu.PolicySecurity')" disable-output-escaping="yes" />
            </a>
          </li>
        </ul>
      </li>
      <li>
        <a href="#">
          <xsl:value-of select="aspdnsf:StringResource('menu.Where')" disable-output-escaping="yes" />
        </a>
        <ul>
          <li>
            <a href="http://stiletto.know-where.com/stiletto/">Store Front Distributors</a>
          </li>
          <li>
            <a href="/t-online-distributors.aspx">Online Distributors</a>
          </li>
        </ul>
      </li>
      <li>
        <a href="/t-about.aspx">
          <xsl:value-of select="aspdnsf:StringResource('menu.AboutUs')" disable-output-escaping="yes" />
        </a>
      </li>
    </ul>
    <script language="javascript">
                $(document).ready(function() {
                  $('ul.sf-menu').superfish();
                });
              </script>
  </xsl:template>
  <xsl:template match="Entity">
    <xsl:param name="eName" select="aspdnsf:GetMLValue(Name)" />
    <li>
      <a href="{concat('c-',EntityID,'-',SEName,'.aspx')}">
        <xsl:value-of select="$eName" />
      </a>
      <xsl:if test="count(child::Entity)&gt;0 and (EntityID = $CategoryID or descendant::Entity/EntityID = $CategoryID)">
        <ul>
          <xsl:apply-templates select="Entity" />
        </ul>
      </xsl:if>
    </li>
  </xsl:template>
</xsl:stylesheet>
