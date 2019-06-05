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
    public partial class shippingupdate : AdminPageBase
    {
        StringBuilder sql = new StringBuilder();

		private void Page_Load(object sender, System.EventArgs e) 
		{
            Response.CacheControl = "private";
            Response.Expires = 0;
            Response.AddHeader("pragma", "no-cache");

            SectionTitle = "Process Notice Emails";

            RenderContents();
		} 

		private void RenderContents()
		{
			if (CommonLogic.FormCanBeDangerousContent("IsSubmit").Equals("TRUE", StringComparison.InvariantCultureIgnoreCase))
			// do update
			{

                string outstr = ShippingImportCls.ProcessOrderNoticeEmail(EntityHelpers, GetParser); 

				sql.Append(outstr); 
			}
			else
			// show items to update	
			{
                string outstr = ShippingImportCls.CheckOrderNoticeEmail();

				sql.Append(outstr); 

				sql.Append("<script type=\"text/javascript\">\n"); 
				sql.Append("function Form_Validator(theForm)\n"); 
				sql.Append("  {\n"); 
				sql.Append("  return (true);\n"); 
				sql.Append("  }\n"); 
				sql.Append("</script>\n"); 
		
				sql.Append("<form action=\"\" method=\"post\" onsubmit=\"return (validateForm(this) && Form_Validator(this))\" onReset=\"return confirm('Do you want to reset all fields to their starting values?');\">\n"); 
				sql.Append("<input type=\"hidden\" name=\"IsSubmit\" value=\"true\">\n");
                sql.Append("<input type=\"submit\" class=\"normalButtons\" value=\"Send All Email Notices\" name=\"submit\">\n"); 
				sql.Append("</form>\n");

                ltContent.Text = sql.ToString();
				
			}
		
		}
	}
}
