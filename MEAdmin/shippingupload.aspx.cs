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
    public partial class shippingupload : AdminPageBase
	{
        StringBuilder sql = new StringBuilder();

		private void Page_Load(object sender, System.EventArgs e) 
		{
            Response.CacheControl = "private";
            Response.Expires = 0;
            Response.AddHeader("pragma", "no-cache");

            SectionTitle = "Import Postage Log (Step 1)";

            RenderContent();
		}             

        private void RenderContent()
        {
            string FileName = "Import_" + Localization.ToThreadCultureShortDateString(System.DateTime.Now).Replace(" ", "").Replace("/", "").Replace(":", "").Replace(".", "");
            FileName = "PostageImport_" + DateTime.Now.ToString("MMddyyyyHHmmss");
            bool DataUpdated = false;
            string ErrorMsg = string.Empty;
            string FmtPath = CommonLogic.SafeMapPath("ShippingImportFormats.xml");

            DataTable FmtDt = ShippingImportCls.GetImportFormatList();
            if (CommonLogic.FormCanBeDangerousContent("IsSubmit").Equals("TRUE", StringComparison.InvariantCultureIgnoreCase))
            {
                string PostedFormat = Request.Form["LogFormat"];
                try
                {
                    string LogFile = string.Empty;
                    HttpPostedFile PostedFile = Request.Files["LogFile"];
                    sql.Append("<p><b><font color=red>" + "</font></b></p>\n");
                    if (PostedFile.ContentLength != 0)
                    {
                        string TargetFile = CommonLogic.SafeMapPath("../download/" + FileName + ".txt");
                        PostedFile.SaveAs(TargetFile);
                    }
                    DataUpdated = true;
                }
                catch (Exception ex)
                {
                    ErrorMsg = CommonLogic.GetExceptionDetail(ex, "<br/>");
                }
                if (DataUpdated)
                {
                    sql.Append("<p align=\"left\"><font size=3 color=blue><b><a href=\"" + AppLogic.AdminLinkUrl("shippingimport.aspx") + "?LogFile=" + FileName + "&LogFormat=" + PostedFormat + "\">Shipping Log Upload successful. Click here to go to begin processing...</a></b></font></p><p></p>\n");
                }
            }
            if (ErrorMsg.Length != 0)
            {
                sql.Append("<p><b><font color=red>" + ErrorMsg + "</font></b></p>\n");
            }
            if (ErrorMsg.Length == 0)
            {
                sql.Append("<p><big><b><font color=red>Import Postage Log (Step 1: Upload File)</font></b></big></p>");
                sql.Append("<p>This is still a experimental function...</p>");
                sql.Append("<hr size=1>");
                sql.Append("<p align=\"left\"><b>Import Shipping Data</b></p>\n");
                sql.Append("<script type=\"text/javascript\">\n");
                sql.Append("function Form_Validator(theForm)\n");
                sql.Append("  {\n");
                sql.Append("  return (true);\n");
                sql.Append("  }\n");
                sql.Append("</script>\n");
                sql.Append("<p align=\"left\">Select the local Postage Log file that you want to upload. This file must conform to our Shipping Import File Format Specifications defined in the manual!<br/><br/>This file should be on your own computer. Click 'browse' to select the file on your computer:</p>\n");
                sql.Append("<table width=\"100%\" cellpadding=\"4\" cellspacing=\"0\">\n");
                sql.Append("<form enctype=\"multipart/form-data\" action=\"?LogFile=" + FileName + "\" method=\"post\" id=\"Form1\" name=\"Form1\" onsubmit=\"return (validateForm(this) && Form_Validator(this))\" onReset=\"return confirm('Do you want to reset all fields to their starting values?');\">\n");
                sql.Append("<input type=\"hidden\" name=\"IsSubmit\" value=\"true\">\n");
                sql.Append("<tr>\n");
                sql.Append("<td valign=\"top\" align=\"right\">*File:\n");
                sql.Append("</td>\n");
                sql.Append("<td valign=\"top\" align=\"left\">");
                sql.Append("<input type=\"file\" name=\"LogFile\" size=\"50\" value=\"\">\n");
                sql.Append("</td>\n");
                sql.Append(" </tr>\n");
                sql.Append("<tr>\n");
                sql.Append("<td valign=\"top\" align=\"right\">*Format:\n");
                sql.Append("</td>\n");
                sql.Append("<td valign=\"top\" align=\"left\">");
                sql.Append("<select size=\"1\" name=\"LogFormat\">\n");
                sql.Append("<option selected>select format:</option>\n");
                foreach (DataRow r in FmtDt.Rows)
                {
                    sql.AppendFormat("<option value=\"{0}\">{1}</option>\n", r["ID"], r["Name"]);                    
                }
                sql.Append("</select>\n");
                sql.Append("</td>\n");
                sql.Append(" </tr>\n");
                sql.Append("<tr>\n");
                sql.Append("<td valign=\"top\" align=\"right\">Send Notice Email:\n");
                sql.Append("</td>\n");
                sql.Append("<td valign=\"top\" align=\"left\">");
                sql.Append("<input type=\"checkbox\" name=\"SendEmail\" value=\"true\">\n");
                sql.Append("</td>\n");
                sql.Append(" </tr>\n");
                sql.Append("<tr>\n");
                sql.Append("<td></td><td align=\"left\"><br/>\n");
                sql.Append("<input type=\"submit\" class=\"normalButtons\" value=\"Upload\" name=\"submit\">\n");
                sql.Append("</td>\n");
                sql.Append("</tr>\n");
                sql.Append("</form>\n");
                sql.Append("</table>\n");

                ltContent.Text = sql.ToString();
            } 
        }
	} 
}
