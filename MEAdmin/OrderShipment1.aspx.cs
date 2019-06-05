// --------------------------------------------------------------------------------
// Copyright AspDotNetStorefront.com. All Rights Reserved.
// http://www.aspdotnetstorefront.com
// For details on this license please visit the product homepage at the URL above.
// THE ABOVE NOTICE MUST REMAIN INTACT. 
// --------------------------------------------------------------------------------
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using AspDotNetStorefrontCore;


namespace AspDotNetStorefrontAdmin
{
    public partial class OrderShipment1 : AdminPageBase 
    {
        StringBuilder sql = new StringBuilder();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "private";
            Response.Expires = 0;
            Response.AddHeader("pragma", "no-cache");

            /****************************************************************************/
            // * WARNING TO DEVELOPERS
            // * The redirect below is a SAFETY feature.  Removing the redirect will not
            // * enable ML-only features on a lower version of AspDotNetStorefront.
            // * Attempting to do so can very easily result in a partially implemented
            // * feature, invalid or incomplete data in your DB, and other serious 
            // * conditions that will cause your store to be non-functional.
            // *
            // * If you break your store attempting to enable ML-only features in PRO or
            // * Standard, our staff cannot help you fix it, and it will also invalidate
            // * your AspDotNetStorefront License.
            /***************************************************************************/

            if (!AppLogic.m_ProductIsML())
            {
                Response.Redirect(AppLogic.AdminLinkUrl("restrictedfeature.aspx"));
            }

            SectionTitle = AppLogic.GetString("admin.sectiontitle.OrderShipment1", SkinID, LocaleSetting);
            RenderContent();
        }       

        private void RenderContent()
        {            

            sql.Append("<script type=\"text/javascript\">\n");
            sql.Append("function ViewShipmentInformation()\n");
            sql.Append("{\n");
            sql.Append("window.open('" + AppLogic.AdminLinkUrl("viewshipment.aspx") + "', '', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,width=600,height=500,left=0,top=0');\n");
            sql.Append("}\n");
            sql.Append("</SCRIPT>\n");

            sql.Append("<script type=\"text/javascript\">\n");
            sql.Append("function checkifnull()\n");
            sql.Append("{\n");

            sql.Append("if (document.getElementById(\"pricingimport\").value == \"\")");
            sql.Append("{\n");
            sql.Append(" alert(\"" + AppLogic.GetString("admin.OrderShipment1.BrowseForTrackingInfo", SkinID, LocaleSetting) + "\"); ");
            sql.Append(" document.Form1.pricingimport.focus(); return false;");
            sql.Append("}\n");
            
            sql.Append("\n else");
            sql.Append("{\n");
            sql.Append("setFormPostDataForImport();\n");
            sql.Append("return true;");
            sql.Append("}\n");

            sql.Append("}\n");
            sql.Append("</script>\n");

            sql.Append("<p><b>" + AppLogic.GetString("admin.OrderShipment1.ShippingLabelProgram", SkinID, LocaleSetting) + "</b></p>");
            sql.Append("<p><input type=\"radio\" name=\"exporttype\" value=\"UPS WorldShip\" checked>" + AppLogic.GetString("admin.OrderShipment1.UPSWorldShip", SkinID, LocaleSetting) + "</p>");

			String sqlThatWorks = @"
				 SELECT count(*) as N
					FROM dbo.Orders o    with (nolock) 
					 JOIN (SELECT OrderNumber, ShippingAddressID FROM dbo.orders_shoppingcart with (nolock) GROUP BY OrderNumber, ShippingAddressID HAVING COUNT(DISTINCT ShippingAddressID) = 1 ) a ON O.OrderNumber = A.OrderNumber    
					 JOIN (SELECT OrderNumber, ShippingAddressID, SUM(OrderedProductPrice * Quantity) AddressSubTotal,   SUM(PV.Weight * Quantity) AddressWeightTotal FROM dbo.orders_shoppingcart os with (nolock) JOIN productvariant pv with (nolock) on os.variantid = pv.variantid group by ordernumber, shippingaddressid )  b on b.ordernumber = a.ordernumber and b.ShippingAddressID = a.ShippingAddressID    
					 JOIN (SELECT OrderNumber, count(ShippingAddressID) AddressCount FROM dbo.orders_shoppingcart with (nolock) group by ordernumber ) c on c.ordernumber = a.ordernumber
					 JOIN dbo.Address ad on ad.addressid = b.shippingaddressid    
					WHERE o.ReadyToShip = 1 AND o.ShippedOn IS NULL AND TransactionState IN ('AUTHORIZED', 'CAPTURED')
				";
			int NumOrdersReadyToExport = DB.GetSqlN(sqlThatWorks);
            if (NumOrdersReadyToExport == 0)
            {
                sql.Append("<p><b>" + AppLogic.GetString("admin.OrderShipment1.ExportingOrders", SkinID, LocaleSetting) + "</b></p>");
                sql.Append("<p><b><font color=\"red\">" + String.Format(AppLogic.GetString("admin.OrderShipment1.NothingToExport", SkinID, LocaleSetting),AppLogic.ro_TXStateAuthorized,AppLogic.ro_TXStateCaptured) + "</font></b></p>");
            }
            else
            {
                sql.Append("<p><b>" + AppLogic.GetString("admin.OrderShipment1.ExportingOrders", SkinID, LocaleSetting) + "</b></p>");
                sql.Append(String.Format(AppLogic.GetString("admin.OrderShipment1.ReadyToShip", SkinID, LocaleSetting),NumOrdersReadyToExport.ToString()));
                // use the postbackUrl behavior
                string postbackPageScript = "javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;stateExport&quot;, &quot;&quot;, false, &quot;&quot;, &quot;OrderShipment2.aspx&quot;, false, false))";

                sql.Append("<p><input class=\"normalButtons\" id=\"stateExport\" name=\"stateExport\" type=\"submit\" value=\"" + AppLogic.GetString("admin.OrderShipment1.ExportOrders", SkinID, LocaleSetting) + "\" onclick=\"" + postbackPageScript + "\"  />");
                sql.Append("</p>");
                sql.Append("<p></p>");
            }
            sql.Append("<p><b>" + AppLogic.GetString("admin.OrderShipment1.ImportingTrackingNumbers", SkinID, LocaleSetting) + "</b></p>");
            sql.Append("<p>" + String.Format(AppLogic.GetString("admin.OrderShipment1.SelectTrackingInfoFile", SkinID, LocaleSetting)) + "<br/><input type=\"file\" name=\"pricingimport\" id=\"pricingimport\" accept=\"text/csv\" size=\"60\"></p>");
            sql.Append("<p><input class=\"normalButtons\" name=\"stateImport\" type=\"button\" value=\"" + AppLogic.GetString("admin.OrderShipment1.ImportTrackingNumbers", SkinID, LocaleSetting) + "\" onclick=\"return checkifnull();\"></p>");



            sql.Append("<p><b><font color=\"blue\">" + AppLogic.GetString("admin.OrderShipment1.NoteMultiple", SkinID, LocaleSetting) + "</font></b></p>");

            ltContent.Text = sql.ToString();
        }
    }
}

