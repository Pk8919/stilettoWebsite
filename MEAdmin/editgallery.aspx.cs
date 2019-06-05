// --------------------------------------------------------------------------------
// Copyright AspDotNetStorefront.com. All Rights Reserved.
// http://www.aspdotnetstorefront.com
// For details on this license please visit the product homepage at the URL above.
// THE ABOVE NOTICE MUST REMAIN INTACT. 
// --------------------------------------------------------------------------------
using System;
using System.Data;
using System.Globalization;
using System.Text;
using System.Web;
using System.Collections;
using System.IO;
using AspDotNetStorefrontCore;
using System.Data.SqlClient;

namespace AspDotNetStorefrontAdmin
{
    /// <summary>
    /// Summary description for editgallery
    /// </summary>
    public partial class editgallery : AdminPageBase
    {

        int GalleryID;

        protected void Page_Load(object sender, System.EventArgs e)
        {
            Response.CacheControl = "private";
            Response.Expires = 0;
            Response.AddHeader("pragma", "no-cache");


            GalleryID = 0;

            if (CommonLogic.QueryStringCanBeDangerousContent("GalleryID").Length != 0 && CommonLogic.QueryStringCanBeDangerousContent("GalleryID") != "0")
            {
                Editing = true;
                GalleryID = Localization.ParseUSInt(CommonLogic.QueryStringCanBeDangerousContent("GalleryID"));
            }
            else
            {
                Editing = false;
            }            

            //			int N = 0;
            if (CommonLogic.FormBool("IsSubmit"))
            {
                if (ErrorMsg.Length == 0)
                {
                    StringBuilder sql = new StringBuilder(2500);
                    if (!Editing)
                    {
                        // ok to add them:
                        String NewGUID = DB.GetNewGUID();
                        sql.Append("insert into gallery(GalleryGUID,Name,DirName,Description) values(");
                        sql.Append(DB.SQuote(NewGUID) + ",");
                        sql.Append(DB.SQuote(AppLogic.FormLocaleXml("Name")) + ",");
                        sql.Append(DB.SQuote(CommonLogic.Left(CommonLogic.FormCanBeDangerousContent("DirName"), 100)) + ",");
                        if (AppLogic.FormLocaleXml("Description").Length != 0)
                        {
                            sql.Append(DB.SQuote(AppLogic.FormLocaleXml("Description")));
                        }
                        else
                        {
                            sql.Append("NULL");
                        }
                        sql.Append(")");
                        DB.ExecuteSQL(sql.ToString());

                        using (SqlConnection dbconn = DB.dbConn())
                        {
                            dbconn.Open();
                            using (IDataReader rs = DB.GetRS("select GalleryID from gallery   with (NOLOCK)  where deleted=0 and GalleryGUID=" + DB.SQuote(NewGUID), dbconn))
                            {
                                rs.Read();
                                GalleryID = DB.RSFieldInt(rs, "GalleryID");
                                Editing = true;
                            }
                        }
                        DataUpdated = true;
                        // BUILD THE GALLERY DIRECTORY:
                        String SFP = CommonLogic.SafeMapPath("../images/spacer.gif").Replace("images\\spacer.gif", "images\\gallery") + "\\" + AppLogic.GetGalleryDir(GalleryID);
                        try
                        {
                            if (!Directory.Exists(SFP))
                            {
                                DirectoryInfo di = Directory.CreateDirectory(SFP);
                            }
                        }
                        catch { }
                    }
                    else
                    {
                        // ok to update:
                        sql.Append("update gallery set ");
                        sql.Append("Name=" + DB.SQuote(AppLogic.FormLocaleXml("Name")) + ",");
                        if (AppLogic.FormLocaleXml("Description").Length != 0)
                        {
                            sql.Append("Description=" + DB.SQuote(AppLogic.FormLocaleXml("Description")));
                        }
                        else
                        {
                            sql.Append("Description=NULL");
                        }
                        sql.Append(" where GalleryID=" + GalleryID.ToString());
                        DB.ExecuteSQL(sql.ToString());
                        DataUpdated = true;
                        Editing = true;
                    }
                    // handle image uploaded:
                    try
                    {
                        String Image1 = String.Empty;
                        HttpPostedFile Image1File = Request.Files["Image1"];
                        if (Image1File.ContentLength != 0)
                        {
                            // delete any current image file first
                            try
                            {
                                System.IO.File.Delete(AppLogic.GetImagePath("Gallery", "icon", true) + GalleryID.ToString() + ".jpg");
                                System.IO.File.Delete(AppLogic.GetImagePath("Gallery", "icon", true) + GalleryID.ToString() + ".gif");
                                System.IO.File.Delete(AppLogic.GetImagePath("Gallery", "icon", true) + GalleryID.ToString() + ".png");
                            }
                            catch
                            { }

                            String s = Image1File.ContentType;
                            switch (Image1File.ContentType)
                            {
                                case "image/gif":
                                    Image1 = AppLogic.GetImagePath("Gallery", "icon", true) + GalleryID.ToString() + ".gif";
                                    Image1File.SaveAs(Image1);
                                    break;
                                case "image/x-png":
                                    Image1 = AppLogic.GetImagePath("Gallery", "icon", true) + GalleryID.ToString() + ".png";
                                    Image1File.SaveAs(Image1);
                                    break;
                                case "image/jpg":
                                case "image/jpeg":
                                case "image/pjpeg":
                                    Image1 = AppLogic.GetImagePath("Gallery", "icon", true) + GalleryID.ToString() + ".jpg";
                                    Image1File.SaveAs(Image1);
                                    break;
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        ErrorMsg = CommonLogic.GetExceptionDetail(ex, "<br/>");
                    }
                }

            }
            SectionTitle = "<a href=\"" + AppLogic.AdminLinkUrl("galleries.aspx") + "\">Galleries</a> - " + AppLogic.GetString("admin.common.ManageGalleries", SkinID, LocaleSetting) + "" + CommonLogic.IIF(DataUpdated, " (Updated)", "");
            Render();
        }

        private void Render()
        {
            StringBuilder writer = new StringBuilder();
            if (!AppLogic.AppConfigBool("TurnOffHtmlEditorInAdminSite"))
            {
                writer.Append("<script language=\"Javascript\" src=\"Editor/scripts/innovaeditor.js\"></script>\n");
            }

            using (SqlConnection dbconn = DB.dbConn())
            {
                dbconn.Open();
                using (IDataReader rs = DB.GetRS("select * from Gallery   with (NOLOCK)  where GalleryID=" + GalleryID.ToString(), dbconn))
                {
                    if (rs.Read())
                    {
                        Editing = true;
                    }

                    if (ErrorMsg.Length != 0)
                    {
                        writer.Append("<p><b><font color=red>" + ErrorMsg + "</font></b></p>\n");
                    }


                    if (ErrorMsg.Length == 0)
                    {

                        if (Editing)
                        {
                            writer.Append("<b>" + String.Format(AppLogic.GetString("admin.editgallery.Editing", SkinID, LocaleSetting),DB.RSFieldByLocale(rs, "Name", LocaleSetting),DB.RSFieldInt(rs, "GalleryID").ToString()) + "<br/><br/></b>\n");
                        }
                        else
                        {
                            writer.Append("<b>" + AppLogic.GetString("admin.editgallery.AddNewGallery", SkinID, LocaleSetting) + "<br/><br/></b>\n");
                        }

                        writer.Append("<script type=\"text/javascript\">\n");
                        writer.Append("function Form_Validator(theForm)\n");
                        writer.Append("{\n");
                        writer.Append("submitonce(theForm);\n");
                        writer.Append("return (true);\n");
                        writer.Append("}\n");

                        if (!Editing)
                        {
                            writer.Append("function MakeSafeName(theForm)\n");
                            writer.Append("{\n");
                            writer.Append("var cn = document.Form1.Name.value;\n");
                            writer.Append("var cn2 = stripCharsNotInBag(cn,\"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_1234567890\");\n");
                            writer.Append("document.Form1.DirName.value = cn2;\n");
                            writer.Append("document.Form1.DirName.focus();\n");
                            writer.Append("return (true);\n");
                            writer.Append("}\n");
                        }
                        writer.Append("</script>\n");

                        if (AppLogic.NumLocaleSettingsInstalled() > 1)
                        {
                            writer.Append(CommonLogic.ReadFile("jscripts/tabs.js", true));
                        }

                        writer.Append("<p>" + AppLogic.GetString("admin.editgallery.GalleryInfo", SkinID, LocaleSetting) + "</p>\n");
                        writer.Append("<form enctype=\"multipart/form-data\" action=\"" + AppLogic.AdminLinkUrl("editgallery.aspx") + "?GalleryID=" + GalleryID.ToString() + "&edit=" + Editing.ToString() + "\" method=\"post\" id=\"Form1\" name=\"Form1\" onsubmit=\"return (validateForm(document.forms[0]) && Form_Validator(document.forms[0]))\" onReset=\"return confirm('" + AppLogic.GetString("admin.common.ResetAllFieldsPrompt", SkinID, LocaleSetting) + "');\">\n");
                        writer.Append("<input type=\"hidden\" name=\"IsSubmit\" value=\"true\">\n");
                        writer.Append("<table width=\"100%\" cellpadding=\"4\" cellspacing=\"0\">\n");
                        writer.Append("              <tr valign=\"middle\">\n");
                        writer.Append("                <td width=\"100%\" colspan=\"2\" align=\"left\">\n");
                        writer.Append("                </td>\n");
                        writer.Append("              </tr>\n");

                        writer.Append("              <tr valign=\"middle\">\n");
                        writer.Append("                <td width=\"25%\" align=\"right\" valign=\"middle\">*" + AppLogic.GetString("admin.editgallery.GalleryName", SkinID, LocaleSetting) + ":&nbsp;&nbsp;</td>\n");
                        writer.Append("                <td align=\"left\" valign=\"top\">\n");
                        writer.Append(AppLogic.GetLocaleEntryFields(DB.RSField(rs, "Name"), "Name", false, true, true, AppLogic.GetString("admin.editgallery.EnterGalleryName", SkinID, LocaleSetting), 100, 30, 0, 0, false));
                        writer.Append("                	</td>\n");
                        writer.Append("              </tr>\n");

                        writer.Append("              <tr valign=\"middle\">\n");
                        writer.Append("                <td width=\"25%\" align=\"right\" valign=\"middle\">*" + AppLogic.GetString("admin.editgallery.GalleryDirectory", SkinID, LocaleSetting) + ":&nbsp;&nbsp;</td>\n");
                        writer.Append("                <td align=\"left\" valign=\"top\">\n");
                        if (!Editing)
                        {
                            writer.Append("                	<input maxLength=\"100\" size=\"30\" name=\"DirName\" value=\"" + CommonLogic.IIF(Editing, Server.HtmlEncode(DB.RSField(rs, "DirName")), "") + "\">\n");
                            writer.Append("                	<input type=\"hidden\" name=\"DirName_vldt\" value=\"[req][blankalert=" + AppLogic.GetString("admin.editgallery.EnterGalleryDirectory", SkinID, LocaleSetting) + "]\">\n");
                        }
                        else
                        {
                            writer.Append(DB.RSField(rs, "DirName"));
                        }
                        writer.Append("                	</td>\n");
                        writer.Append("              </tr>\n");

                        writer.Append("    <td valign=\"top\" align=\"right\">Icon:\n");
                        writer.Append("</td>\n");
                        writer.Append("    <td valign=\"top\" align=\"left\">");
                        writer.Append("    <input type=\"file\" name=\"Image1\" size=\"30\" value=\"" + CommonLogic.IIF(Editing, "", "") + "\">\n");
                        String Image1URL = AppLogic.LookupImage("Gallery", GalleryID, "icon", SkinID, LocaleSetting);
                        if (Image1URL.Length != 0)
                        {
                            if (Image1URL.IndexOf("nopicture") == -1)
                            {
                                String clicklink = "<a href=\"javascript:void(0);\" onClick=\"DeleteImage('" + Image1URL + "','GalleryPic');\">Click here</a>";
                                writer.Append(String.Format(AppLogic.GetString("admin.editgallery.DeleteImage", SkinID, LocaleSetting),clicklink) + "<br/>\n");
                            }
                            writer.Append("<br/><img id=\"GalleryPic\" name=\"GalleryPic\" border=\"0\" src=\"" + Image1URL + "?" + CommonLogic.GetRandomNumber(1, 1000000).ToString() + "\">\n");
                        }
                        writer.Append("</td>\n");
                        writer.Append(" </tr>\n");

                        writer.Append("              <tr valign=\"middle\">\n");
                        writer.Append("                <td align=\"right\" valign=\"top\">Description:&nbsp;&nbsp;</td>\n");
                        writer.Append("                <td align=\"left\" valign=\"top\">\n");
                        writer.Append(AppLogic.GetLocaleEntryFields(DB.RSField(rs, "Description"), AppLogic.GetString("admin.common.Description", SkinID, LocaleSetting), true, true, false, "", 0, 0, AppLogic.AppConfigUSInt("Admin_TextareaHeight"), AppLogic.AppConfigUSInt("Admin_TextareaWidth"), true));
                        
                        writer.Append("                </td>\n");
                        writer.Append("              </tr>\n");

                        writer.Append("<tr>\n");
                        writer.Append("<td></td><td align=\"left\" valign=\"top\"><br/>\n");
                        if (Editing)
                        {
                            writer.Append("<input type=\"submit\" value=\"" + AppLogic.GetString("admin.common.Update", SkinID, LocaleSetting) + "\" name=\"submit\">\n");
                            writer.Append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"reset\" class=\"CPButton\" value=\"" + AppLogic.GetString("admin.common.Reset", SkinID, LocaleSetting) + "\" name=\"reset\">\n");
                        }
                        else
                        {
                            writer.Append("<input type=\"submit\" value=\"" + AppLogic.GetString("admin.common.AddNew", SkinID, LocaleSetting) + "\" name=\"submit\">\n");
                        }
                        writer.Append("        </td>\n");
                        writer.Append("      </tr>\n");
                        writer.Append("  </table>\n");
                        writer.Append("</form>\n");

                        writer.Append("<script type=\"text/javascript\">\n");
                        writer.Append("function DeleteImage(imgurl,name)\n");
                        writer.Append("{\n");
                        writer.Append("window.open('" + AppLogic.AdminLinkUrl("deleteimage.aspx") + "?imgurl=' + imgurl + '&FormImageName=' + name,\"AspDotNetStorefrontAdmin_ML\",\"height=250,width=440,top=10,left=20,status=no,toolbar=no,menubar=no,scrollbars=yes,location=no\")\n");
                        writer.Append("}\n");
                        writer.Append("</SCRIPT>\n");

                    }
                }
            }
            ltContent.Text = writer.ToString();
        }

    }
}
