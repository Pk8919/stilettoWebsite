// --------------------------------------------------------------------------------
// Copyright AspDotNetStorefront.com. All Rights Reserved.
// http://www.aspdotnetstorefront.com
// For details on this license please visit the product homepage at the URL above.
// THE ABOVE NOTICE MUST REMAIN INTACT. 
// --------------------------------------------------------------------------------
using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Text;
using System.Web;
using AspDotNetStorefrontCore;

namespace AspDotNetStorefrontAdmin
{
    /// <summary>
    /// Summary description for shippingupdate.
    /// </summary>
    public partial class shippingstatus : AdminPageBase
    {

        private void Page_Load(object sender, System.EventArgs e)
        {
            Response.CacheControl = "private";
            Response.Expires = 0;
            Response.AddHeader("pragma", "no-cache");

            SectionTitle = "Shipping Status";
            RenderMarkup();
        }

        private void RenderMarkup()
        {
            System.Text.StringBuilder output = new System.Text.StringBuilder();
            if (CommonLogic.FormCanBeDangerousContent("IsSubmit").Equals("TRUE", StringComparison.InvariantCultureIgnoreCase))
            // do something
            {
                string ordnum = CommonLogic.FormCanBeDangerousContent("sendemail");

                output.Append(ShippingImportCls.ProcessOrderNoticeEmail(ordnum, EntityHelpers, GetParser));

            }
            else
            // Show Status
            {
                bool twostage = true;
                int s = CommonLogic.QueryStringUSInt("s");

                if (s == 4)
                {
                    twostage = false;
                }


                if (twostage)
                {
                    output.Append("<h3>New Orders:</h3>");

                    output.Append(GetRTS(false));

                    output.Append("<hr/>");
                }
                else
                {
                    output.Append("<h3>New Orders - Waiting on payment:</h3>");

                    output.Append(GetWOP());

                    output.Append("<hr/>");

                    output.Append("<h3>New Orders - Ready to Ship:</h3>");

                    output.Append(GetRTS(true));

                    output.Append("<hr/>");


                    output.Append("<h3>Shipped Orders (Shipping Notice Not Sent):</h3>");

                    output.Append(GetSWN());

                    output.Append("<hr/>");

                }

                output.Append("<h3>Shipped:</h3>");

                output.Append(GetRSO(!twostage));
            }
            ltContent.Text = output.ToString();
        }


        string GetWOP() // Show All New Orders Waiting on payment
        {
            StringBuilder outsb = new StringBuilder(4096);

            outsb.Append("<table border=\"0\" cellpadding=\"2\" border=\"0\" cellspacing=\"1\" width=\"100%\">");
            outsb.Append("<tr bgcolor=\"DDDDDD\">");
            outsb.Append("<td><b>Order Number</b></td>");
            outsb.Append("<td><b>Order Date</b></td>");
            outsb.Append("<td><b>Order Total</b></td>");
            outsb.Append("<td><b>Payment Method</b></td>");
            outsb.Append("</tr>");

            int recordcount = 0;
            StringBuilder orderRow = new StringBuilder(4096);

            using (SqlConnection con = new SqlConnection(DB.GetDBConn()))
            {
                con.Open();
                using (IDataReader rsOrders = DB.GetRS("select * from Orders  with (NOLOCK)  where ShippedOn IS NULL and IsNew=1 and TransactionState=" + DB.SQuote(AppLogic.ro_TXStateCaptured), con))
                {
                    while (rsOrders.Read())
                    {
                        recordcount += 1;

                        orderRow.Append("<tr>");
                        orderRow.Append("<td><a href=\"" + AppLogic.AdminLinkUrl("orderframe.aspx") + "?ordernumber=" + rsOrders["OrderNumber"].ToString() + "\">" + rsOrders["OrderNumber"].ToString() + "</td>");
                        orderRow.Append("<td>" + String.Format("{0:d}", rsOrders["OrderDate"]) + "</td>");
                        orderRow.Append("<td>" + String.Format("{0:c}", rsOrders["OrderTotal"]) + "</td>");
                        orderRow.Append("<td>" + rsOrders["PaymentMethod"].ToString() + "</td>");
                        orderRow.Append("</tr>\n");
                    }


                    if (recordcount > 0)
                    {
                        //exists
                        outsb.Append(orderRow.ToString());
                        outsb.Append("<tr>");
                        outsb.Append("<td>" + recordcount.ToString() + " Orders</td>");
                        outsb.Append("<td> </td>");
                        outsb.Append("<td> </td>");
                        outsb.Append("</tr>");
                    }
                    else
                    {
                        //nothing
                        outsb.Append("<tr>");
                        outsb.Append("<td colspan=3><b>No Orders</b></td>");
                        outsb.Append("</tr>");
                    }
                }
            }

            outsb.Append("</table>");

            return outsb.ToString();

        }


        string GetRTS(bool filterunpaid) // Show All New Orders Ready to Ship
        {
            StringBuilder outsb = new StringBuilder(4096);

            string sqltxt = "select * from Orders  with (NOLOCK)  where ShippedOn IS NULL and IsNew=1 and TransactionState=" + DB.SQuote(AppLogic.ro_TXStateCaptured) + " ";
            if (filterunpaid)
            {
                sqltxt += " AND (TransactionState = " + DB.SQuote(AppLogic.ro_TXStateCaptured) + ")";
            }

            using (SqlConnection con = new SqlConnection(DB.GetDBConn()))
            {
                con.Open();
                using (IDataReader rsOrders = DB.GetRS(sqltxt, con))
                {
                    outsb.Append("<table border=\"0\" cellpadding=\"2\" border=\"0\" cellspacing=\"1\" width=\"100%\">");
                    outsb.Append("<tr class=\"gridHeader\">");
                    outsb.Append("<td><b>OrderNumber</b></td>");
                    outsb.Append("<td><b>OrderTotal</b></td>");
                    outsb.Append("<td><b>Transaction State</b></td>");
                    outsb.Append("<td><b>Shipping Method</b></td>");
                    outsb.Append("</tr>");

                    int recordcount = 0;

                    StringBuilder orderRow = new StringBuilder(4096);

                    while (rsOrders.Read())
                    {
                        recordcount += 1;

                        orderRow.Append("<tr>");
                        orderRow.Append("<td><a href=\"" + AppLogic.AdminLinkUrl("orderframe.aspx") + "?ordernumber=" + rsOrders["OrderNumber"].ToString() + "\">" + rsOrders["OrderNumber"].ToString() + "</td>");
                        orderRow.Append("<td>" + String.Format("{0:c}", rsOrders["OrderTotal"]) + "</td>");
                        orderRow.Append("<td>" + rsOrders["TransactionState"].ToString() + "</td>");
                        orderRow.Append("<td>" + rsOrders["ShippingMethod"].ToString() + "</td>");
                        orderRow.Append("</tr>\n");
                    }


                    if (recordcount > 0)
                    {
                        //exists
                        outsb.Append(orderRow.ToString());
                        outsb.Append("<tr>");
                        outsb.Append("<td colspan=4><b>" + recordcount.ToString() + " Orders<b></td>");
                        outsb.Append("</tr>\n");
                        outsb.Append("</table>");
                    }
                    else
                    {
                        //nothing
                        outsb.Append("<tr>");
                        outsb.Append("<td colspan=4><b>No Orders</b></td>");
                        outsb.Append("</tr>");
                        outsb.Append("</table>");
                    }

                    outsb.Append("<p>Export New Orders: ");
                    DataTable efl = ShippingImportCls.GetExportFormatList();
                    foreach (DataRow ef in efl.Rows)
                    {
                        outsb.Append("<a href=\"" + AppLogic.AdminLinkUrl("shippingexport.aspx") + "?format=" + ef["id"] + "\">" + ef["Name"] + "</a> &nbsp;");
                    }
                    outsb.Append("<br/>");

                    outsb.Append("<p>Import Shipped Orders: ");
                    outsb.Append("<a href=\"" + AppLogic.AdminLinkUrl("shippingupload.aspx") + "\">Upload Shipping Log</a><br/>");
                }
            }

            return outsb.ToString();

        }


        string GetSWN() // Show Shipped without notice + send buttons
        {
            StringBuilder outsb = new StringBuilder(4096);
            
            using (SqlConnection con = new SqlConnection(DB.GetDBConn()))
            {
                con.Open();
                using (IDataReader rsOrders = DB.GetRS("SELECT * FROM Orders WHERE NOT(ShippedOn IS NULL) AND (ShippedEmailSentOn IS NULL)", con))
                {
                    outsb.Append("<form action=\"\" method=\"post\" onsubmit=\"return (validateForm(this) && Form_Validator(this))\";\">\n");

                    outsb.Append("<table border=\"0\" cellpadding=\"2\" border=\"0\" cellspacing=\"1\" width=\"100%\">");
                    outsb.Append("<tr class=\"gridHeader\">");
                    outsb.Append("<td>Send Email</td>");
                    outsb.Append("<td>Order Number</td>");
                    outsb.Append("<td>Order Date</td>");
                    outsb.Append("<td>Order Total</td>");
                    outsb.Append("<td>Ship Date</td>");
                    outsb.Append("<td>Ship VIA</td>");
                    outsb.Append("<td>Ship Weight</td>");
                    outsb.Append("</tr>");

                    int recordcount = 0;

                    StringBuilder orderRow = new StringBuilder(4096);

                    while (rsOrders.Read())
                    {
                        recordcount += 1;

                        orderRow.Append("<tr>");
                        orderRow.Append("<td><input type=\"checkbox\" name=\"sendemail\" value=\"" + rsOrders["OrderNumber"].ToString() + "\"></td>");
                        orderRow.Append("<td><a href=\"" + AppLogic.AdminLinkUrl("orderframe.aspx") + "?ordernumber=" + rsOrders["OrderNumber"].ToString() + "\">" + rsOrders["OrderNumber"].ToString() + "</td>");
                        orderRow.Append("<td>" + String.Format("{0:d}", rsOrders["OrderDate"]) + "</td>");
                        orderRow.Append("<td>" + String.Format("{0:c}", rsOrders["OrderTotal"]) + "</td>");
                        orderRow.Append("<td>" + rsOrders["ShippedOn"].ToString() + "</td>");
                        orderRow.Append("<td>" + rsOrders["ShippedVia"].ToString() + "</td>");
                        orderRow.Append("<td>" + rsOrders["CarrierReportedWeight"].ToString() + "</td>");
                        orderRow.Append("</tr>\n");
                    }


                    if (recordcount > 0)
                    {
                        //exists
                        outsb.Append(orderRow.ToString());
                        outsb.Append("<tr>");
                        outsb.Append("<td>" + recordcount.ToString() + " Orders</td>");
                        outsb.Append("<td> </td>");
                        outsb.Append("<td> </td>");
                        outsb.Append("</tr>");
                    }
                    else
                    {
                        //nothing
                        outsb.Append("<tr>");
                        outsb.Append("<td colspan=3><b>No Orders</b></td>");
                        outsb.Append("</tr>");
                    }

                    outsb.Append("</table>");
                    outsb.Append("<input type=\"hidden\" name=\"IsSubmit\" value=\"true\">\n");
                    outsb.Append("<input type=\"submit\" value=\"Send Selected Email Notices\" name=\"submit\">\n");
                    outsb.Append("</form>\n");
                }
            }

            return outsb.ToString();

        }


        string GetRSO(bool filterunsent) // show orders recently shipped
        {


            StringBuilder outsb = new StringBuilder(4096);

            string sqltxt = "SELECT * FROM Orders WHERE NOT(ShippedOn IS NULL)";
            if (filterunsent)
            {
                sqltxt += " AND NOT(ShippedEmailSentOn IS NULL)";
            }

            using (SqlConnection con = new SqlConnection(DB.GetDBConn()))
            {
                con.Open();
                using (IDataReader rsOrders = DB.GetRS(sqltxt, con))
                {
                    outsb.Append("<table border=\"0\" cellpadding=\"2\" border=\"0\" cellspacing=\"1\" width=\"100%\">");
                    outsb.Append("<tr bgcolor=\"DDDDDD\">");
                    outsb.Append("<td><b>Order Number</b></td>");
                    outsb.Append("<td><b>Order Date</b></td>");
                    outsb.Append("<td><b>Order Total</b></td>");
                    outsb.Append("<td><b>Ship Date</b></td>");
                    outsb.Append("<td><b>Ship VIA</b></td>");
                    outsb.Append("</tr>");

                    int recordcount = 0;

                    StringBuilder orderRow = new StringBuilder(4096);

                    while (rsOrders.Read())
                    {
                        recordcount += 1;

                        orderRow.Append("<tr>");
                        orderRow.Append("<td><a href=\"" + AppLogic.AdminLinkUrl("orderframe.aspx") + "?ordernumber=" + rsOrders["OrderNumber"].ToString() + "\">" + rsOrders["OrderNumber"].ToString() + "</td>");
                        orderRow.Append("<td>" + String.Format("{0:d}", rsOrders["OrderDate"]) + "</td>");
                        orderRow.Append("<td>" + String.Format("{0:c}", rsOrders["OrderTotal"]) + "</td>");
                        orderRow.Append("<td>" + rsOrders["ShippedOn"].ToString() + "</td>");
                        orderRow.Append("<td>" + rsOrders["ShippedVia"].ToString() + "</td>");
                        orderRow.Append("</tr>\n");
                    }


                    if (recordcount > 0)
                    {
                        //exists
                        outsb.Append(orderRow.ToString());
                        outsb.Append("<tr>");
                        outsb.Append("<td>" + recordcount.ToString() + " Orders</td>");
                        outsb.Append("<td> </td>");
                        outsb.Append("<td> </td>");
                        outsb.Append("</tr>");
                    }
                    else
                    {
                        //nothing
                        outsb.Append("<tr>");
                        outsb.Append("<td colspan=3><b>No Orders</b></td>");
                        outsb.Append("</tr>");
                    }

                    outsb.Append("</table>");
                }
            }

            return outsb.ToString();

        }

    }
}
