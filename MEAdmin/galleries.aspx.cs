// --------------------------------------------------------------------------------
// Copyright AspDotNetStorefront.com. All Rights Reserved.
// http://www.aspdotnetstorefront.com
// For details on this license please visit the product homepage at the URL above.
// THE ABOVE NOTICE MUST REMAIN INTACT. 
// --------------------------------------------------------------------------------
using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Text;
using System.Web;
using System.IO;
using AspDotNetStorefrontCore;

namespace AspDotNetStorefrontAdmin
{
    /// <summary>
    /// Summary description for galleries.
    /// </summary>
    public partial class galleries : AdminPageBase
    {

        protected void Page_Load(object sender, System.EventArgs e)
        {
            Response.CacheControl = "private";
            Response.Expires = 0;
            Response.AddHeader("pragma", "no-cache");
            SectionTitle = AppLogic.GetString("admin.sectiontitle.galleries", SkinID, LocaleSetting);
            Render();
        }

        private void Render()
        {
            StringBuilder writer = new StringBuilder();
            if (CommonLogic.QueryStringCanBeDangerousContent("DeleteID").Length != 0)
            {
                // delete any images:
                try
                {
                    System.IO.File.Delete(AppLogic.GetImagePath("Gallery", "icon", true) + CommonLogic.QueryStringUSInt("DeleteID").ToString() + ".jpg");
                    System.IO.File.Delete(AppLogic.GetImagePath("Gallery", "icon", true) + CommonLogic.QueryStringUSInt("DeleteID").ToString() + ".png");
                    System.IO.File.Delete(AppLogic.GetImagePath("Gallery", "icon", true) + CommonLogic.QueryStringUSInt("DeleteID").ToString() + ".gif");
                }
                catch { }

                // delete the gallery directory also!
                String GalleryDirName = AppLogic.GetGalleryDir(CommonLogic.QueryStringUSInt("DeleteID"));
                String SFP = CommonLogic.SafeMapPath("../images/spacer.gif").Replace("images\\spacer.gif", "images\\gallery") + "\\" + GalleryDirName;
                try
                {
                    if (Directory.Exists(SFP))
                    {
                        String[] files = Directory.GetFiles(SFP, "*.*");
                        foreach (String file in files)
                        {
                            System.IO.File.Delete(file);
                        }
                        Directory.Delete(SFP);
                    }
                }
                catch { }

                // delete the gallery:
                DB.ExecuteSQL("delete from gallery where GalleryID=" + CommonLogic.QueryStringCanBeDangerousContent("DeleteID"));
            }

            if (CommonLogic.FormBool("IsSubmit"))
            {
                for (int i = 0; i <= Request.Form.Count - 1; i++)
                {
                    if (Request.Form.Keys[i].IndexOf("DisplayOrder_") != -1)
                    {
                        String[] keys = Request.Form.Keys[i].Split('_');
                        int GalleryID = Localization.ParseUSInt(keys[1]);
                        int DispOrd = 1;
                        try
                        {
                            DispOrd = Localization.ParseUSInt(Request.Form[Request.Form.Keys[i]]);
                        }
                        catch { }
                        DB.ExecuteSQL("update gallery set DisplayOrder=" + DispOrd.ToString() + " where GalleryID=" + GalleryID.ToString());
                    }
                }
            }

            writer.Append("<form method=\"POST\" action=\"" + AppLogic.AdminLinkUrl("galleries.aspx") + "\">\n");
            writer.Append("<input type=\"hidden\" name=\"IsSubmit\" value=\"true\">\n");
            writer.Append("  <table border=\"0\" cellpadding=\"2\" border=\"0\" cellspacing=\"1\" width=\"100%\">\n");
            writer.Append("    <tr bgcolor=\"" + AppLogic.AppConfig("LightCellColor") + "\">\n");
            writer.Append("      <td ><b>" + AppLogic.GetString("admin.common.ID", SkinID, LocaleSetting) + "</b></td>\n");
            writer.Append("      <td ><b>" + AppLogic.GetString("admin.editgallery.GalleryName", SkinID, LocaleSetting) + "</b></td>\n");
            writer.Append("      <td ><b>" + AppLogic.GetString("admin.galleries.GalleryURL", SkinID, LocaleSetting) + "</b></td>\n");
            writer.Append("      <td align=\"center\"><b>" + AppLogic.GetString("admin.common.DisplayOrder", SkinID, LocaleSetting) + "</b></td>\n");
            writer.Append("      <td align=\"center\"><b>" + AppLogic.GetString("admin.common.Edit", SkinID, LocaleSetting) + "</b></td>\n");
            writer.Append("      <td align=\"center\"><b>" + AppLogic.GetString("admin.common.ManageImages", SkinID, LocaleSetting) + "</b></td>\n");
            writer.Append("      <td align=\"center\"><b>" + AppLogic.GetString("admin.common.Delete", SkinID, LocaleSetting) + "</b></td>\n");
            writer.Append("    </tr>\n");
            
            using (SqlConnection dbconn = new SqlConnection(DB.GetDBConn()))
            {
                dbconn.Open();
                using(IDataReader rs = DB.GetRS("select * from gallery   with (NOLOCK)  where deleted=0 order by DisplayOrder,Name",dbconn))
                {
                    while (rs.Read())
                    {
                        writer.Append("    <tr bgcolor=\"" + AppLogic.AppConfig("LightCellColor") + "\">\n");
                        writer.Append("      <td>" + DB.RSFieldInt(rs, "GalleryID").ToString() + "</td>\n");
                        writer.Append("      <td >");
                        String Image1URL = AppLogic.LookupImage("Gallery", DB.RSFieldInt(rs, "GalleryID"), "icon", SkinID, LocaleSetting);
                        if (Image1URL.Length != 0)
                        {
                            writer.Append("<a href=\"" + AppLogic.AdminLinkUrl("editGallery.aspx") + "?Galleryid=" + DB.RSFieldInt(rs, "GalleryID").ToString() + "\">");
                            writer.Append("<img src=\"" + Image1URL + "?" + CommonLogic.GetRandomNumber(1, 1000000).ToString() + "\" height=\"35\" border=\"0\" align=\"absmiddle\">");
                            writer.Append("</a>&nbsp;\n");
                        }
                        writer.Append("      <a href=\"" + AppLogic.AdminLinkUrl("editGallery.aspx") + "?Galleryid=" + DB.RSFieldInt(rs, "GalleryID").ToString() + "\">");
                        writer.Append(DB.RSFieldByLocale(rs, "Name", LocaleSetting));
                        writer.Append("</a>");
                        writer.Append("</td>\n");
                        writer.Append("      <td><a target=\"_blank\" href=\"../showgallery.aspx?galleryid=" + DB.RSFieldInt(rs, "GalleryID").ToString() + "\">showgallery.aspx?galleryid=" + DB.RSFieldInt(rs, "GalleryID").ToString() + "</a></td>\n");
                        writer.Append("      <td align=\"center\"><input size=2 type=\"text\" name=\"DisplayOrder_" + DB.RSFieldInt(rs, "GalleryID").ToString() + "\" value=\"" + DB.RSFieldInt(rs, "DisplayOrder").ToString() + "\"></td>\n");
                        writer.Append("      <td align=\"center\"><input type=\"button\" value=\"" + AppLogic.GetString("admin.common.Edit", SkinID, LocaleSetting) + "\" name=\"Edit_" + DB.RSFieldInt(rs, "GalleryID").ToString() + "\" onClick=\"self.location='" + AppLogic.AdminLinkUrl("editgallery.aspx") + "?galleryid=" + DB.RSFieldInt(rs, "GalleryID").ToString() + "'\"></td>\n");
                        writer.Append("      <td align=\"center\"><input type=\"button\" value=\"" + AppLogic.GetString("admin.galleries.AddDeleteGalleryImages", SkinID, LocaleSetting) + "\" name=\"ManageImages_" + DB.RSFieldInt(rs, "GalleryID").ToString() + "\" onClick=\"self.location='" + AppLogic.AdminLinkUrl("galleryimages.aspx") + "?galleryid=" + DB.RSFieldInt(rs, "GalleryID").ToString() + "'\"></td>\n");
                        writer.Append("      <td align=\"center\"><input type=\"button\" value=\"" + AppLogic.GetString("admin.common.Delete", SkinID, LocaleSetting) + "\" name=\"Delete_" + DB.RSFieldInt(rs, "GalleryID").ToString() + "\" onClick=\"DeleteGallery(" + DB.RSFieldInt(rs, "GalleryID").ToString() + ")\"></td>\n");
                        writer.Append("    </tr>\n");
                    
                    }
                }
            }

            writer.Append("    <tr>\n");
            writer.Append("      <td colspan=\"4\" align=\"left\"></td>\n");
            writer.Append("      <td align=\"center\" bgcolor=\"" + AppLogic.AppConfig("LightCellColor") + "\"><input type=\"submit\" value=\"" + AppLogic.GetString("admin.common.Update", SkinID, LocaleSetting) + "\" name=\"Submit\"></td>\n");
            writer.Append("      <td colspan=\"2\"></td>\n");
            writer.Append("    </tr>\n");
            writer.Append("    <tr>\n");
            writer.Append("      <td colspan=\"7\" height=5></td>\n");
            writer.Append("    </tr>\n");
            writer.Append("  </table>\n");
            writer.Append("<p align=\"left\"><input type=\"button\" value=\"" + AppLogic.GetString("admin.galleries.AddNewGallery", SkinID, LocaleSetting) + "\" name=\"AddNew\" onClick=\"self.location='" + AppLogic.AdminLinkUrl("editgallery.aspx") + "';\"><p/>");
            writer.Append("</form>\n");

            writer.Append("<script type=\"text/javascript\">\n");
            writer.Append("function DeleteGallery(id)\n");
            writer.Append("{\n");
            writer.Append("if(confirm('" + String.Format(AppLogic.GetString("admin.galleries.ConfirmDelete", SkinID, LocaleSetting),"+ id +?'"));
            writer.Append("{\n");
            writer.Append("self.location = '" + AppLogic.AdminLinkUrl("galleries.aspx") + "?deleteid=' + id;\n");
            writer.Append("}\n");
            writer.Append("}\n");
            writer.Append("</SCRIPT>\n");
            ltContent.Text = writer.ToString();
        }

    }
}
