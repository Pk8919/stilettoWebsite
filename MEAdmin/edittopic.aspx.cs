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
using AspDotNetStorefrontCore;
using System.Data.SqlClient;

namespace AspDotNetStorefrontAdmin
{
    /// <summary>
    /// Summary description for edittopic
    /// </summary>
    public partial class edittopic : AdminPageBase
    {

        int TopicID;

        private void Page_Load(object sender, System.EventArgs e)
        {
            Response.CacheControl = "private";
            Response.Expires = 0;
            Response.AddHeader("pragma", "no-cache"); 
            

            TopicID = 0;

            if (CommonLogic.QueryStringCanBeDangerousContent("TopicID").Length != 0 && CommonLogic.QueryStringCanBeDangerousContent("TopicID") != "0")
            {
                Editing = true;
                TopicID = Localization.ParseUSInt(CommonLogic.QueryStringCanBeDangerousContent("TopicID"));
            }
            else
            {
                Editing = false;
            }

            if (CommonLogic.FormCanBeDangerousContent("IsSubmit").Equals("TRUE", StringComparison.InvariantCultureIgnoreCase))            
            {
                StringBuilder sql = new StringBuilder(2500);
                if (!Editing)
                {
                    // ok to add them:
                    String NewGUID = DB.GetNewGUID();
                    sql.Append("insert into Topic(TopicGUID,Name,SkinID,ContentsBGColor,PageBGColor,GraphicsColor,Title,Description,Password,RequiresSubscription,HTMLOk,RequiresDisclaimer,ShowInSiteMap,SEKeywords,SEDescription,SETitle) values(");
                    sql.Append(DB.SQuote(NewGUID) + ",");
                    sql.Append(DB.SQuote(CommonLogic.FormCanBeDangerousContent("Name")) + ",");
                    sql.Append(CommonLogic.FormUSInt("SkinID") + ",");
                    sql.Append(DB.SQuote(CommonLogic.FormCanBeDangerousContent("ContentsBGColor")) + ",");
                    sql.Append(DB.SQuote(CommonLogic.FormCanBeDangerousContent("PageBGColor")) + ",");
                    sql.Append(DB.SQuote(CommonLogic.FormCanBeDangerousContent("GraphicsColor")) + ",");
                    sql.Append(DB.SQuote(AppLogic.FormLocaleXml("Title")) + ",");
                    if (AppLogic.FormLocaleXml("Description").Length != 0)
                    {
                        sql.Append(DB.SQuote(AppLogic.FormLocaleXml("Description")) + ",");
                    }
                    else
                    {
                        sql.Append("NULL,");
                    }
                    if (CommonLogic.FormCanBeDangerousContent("Password").Length != 0)
                    {
                        sql.Append(DB.SQuote(CommonLogic.FormCanBeDangerousContent("Password")) + ",");
                    }
                    else
                    {
                        sql.Append("NULL,");
                    }
                    sql.Append(CommonLogic.FormUSInt("RequiresSubscription").ToString() + ",");
                    sql.Append(CommonLogic.FormUSInt("HTMLOk").ToString() + ",");
                    sql.Append(CommonLogic.FormUSInt("RequiresDisclaimer").ToString() + ",");
                    sql.Append(CommonLogic.FormUSInt("ShowInSiteMap").ToString() + ",");
                    if (AppLogic.FormLocaleXml("SEKeywords").Length != 0)
                    {
                        sql.Append(DB.SQuote(AppLogic.FormLocaleXml("SEKeywords")) + ",");
                    }
                    else
                    {
                        sql.Append("NULL,");
                    }
                    if (AppLogic.FormLocaleXml("SEDescription").Length != 0)
                    {
                        sql.Append(DB.SQuote(AppLogic.FormLocaleXml("SEDescription")) + ",");
                    }
                    else
                    {
                        sql.Append("NULL,");
                    }
                    if (AppLogic.FormLocaleXml("SETitle").Length != 0)
                    {
                        sql.Append(DB.SQuote(AppLogic.FormLocaleXml("SETitle")) + ",");
                    }
                    else
                    {
                        sql.Append("NULL,");
                    }
                    sql.Append(ThisCustomer.CustomerID);
                    sql.Append(")");
                    DB.ExecuteSQL(sql.ToString());

                    using (SqlConnection dbconn = DB.dbConn())
                    {
                        dbconn.Open();
                        using (IDataReader rs = DB.GetRS(string.Format("select TopicID from Topic with (NOLOCK) where deleted=0 and TopicGUID={0}", DB.SQuote(NewGUID)), dbconn))
                        {
                            rs.Read();
                    TopicID = DB.RSFieldInt(rs, "TopicID");
                    Editing = true;
                        }
                    }
                    DataUpdated = true;
                }
                else
                {
                    // ok to update:
                    sql.Append("update Topic set ");
                    sql.Append("Name=" + DB.SQuote(CommonLogic.FormCanBeDangerousContent("Name")) + ",");
                    sql.Append("SkinID=" + CommonLogic.FormUSInt("SkinID") + ",");
                    sql.Append("ContentsBGColor=" + DB.SQuote(CommonLogic.FormCanBeDangerousContent("ContentsBGColor")) + ",");
                    sql.Append("PageBGColor=" + DB.SQuote(CommonLogic.FormCanBeDangerousContent("PageBGColor")) + ",");
                    sql.Append("GraphicsColor=" + DB.SQuote(CommonLogic.FormCanBeDangerousContent("GraphicsColor")) + ",");
                    sql.Append("Title=" + DB.SQuote(AppLogic.FormLocaleXml("Title")) + ",");
                    if (AppLogic.FormLocaleXml("Description").Length != 0)
                    {
                        sql.Append("Description=" + DB.SQuote(AppLogic.FormLocaleXml("Description")) + ",");
                    }
                    else
                    {
                        sql.Append("Description=NULL,");
                    }
                    if (CommonLogic.FormCanBeDangerousContent("Password").Length != 0)
                    {
                        sql.Append("Password=" + DB.SQuote(CommonLogic.FormCanBeDangerousContent("Password")) + ",");
                    }
                    else
                    {
                        sql.Append("Password=NULL,");
                    }
                    sql.Append("RequiresSubscription=" + CommonLogic.FormUSInt("RequiresSubscription").ToString() + ",");
                    sql.Append("HTMLOk=" + CommonLogic.FormUSInt("HTMLOk").ToString() + ",");
                    sql.Append("RequiresDisclaimer=" + CommonLogic.FormUSInt("RequiresDisclaimer").ToString() + ",");
                    sql.Append("ShowInSiteMap=" + CommonLogic.FormUSInt("ShowInSiteMap").ToString() + ",");
                    if (AppLogic.FormLocaleXml("SEKeywords").Length != 0)
                    {
                        sql.Append("SEKeywords=" + DB.SQuote(AppLogic.FormLocaleXml("SEKeywords")) + ",");
                    }
                    else
                    {
                        sql.Append("SEKeywords=NULL,");
                    }
                    if (AppLogic.FormLocaleXml("SEDescription").Length != 0)
                    {
                        sql.Append("SEDescription=" + DB.SQuote(AppLogic.FormLocaleXml("SEDescription")) + ",");
                    }
                    else
                    {
                        sql.Append("SEDescription=NULL,");
                    }
                    if (AppLogic.FormLocaleXml("SETitle").Length != 0)
                    {
                        sql.Append("SETitle=" + DB.SQuote(AppLogic.FormLocaleXml("SETitle")));
                    }
                    else
                    {
                        sql.Append("SETitle=NULL");
                    }
                    sql.Append(" where TopicID=" + TopicID.ToString());
                    DB.ExecuteSQL(sql.ToString());
                    DataUpdated = true;
                    Editing = true;
                }
            }
            SectionTitle = "<a href=\"" + AppLogic.AdminLinkUrl("topics.aspx") + "\">" + AppLogic.GetString("admin.sectiontitle.edittopic", SkinID, LocaleSetting) + "</a> - " + AppLogic.GetString("admin.common.ManageTopics", SkinID, LocaleSetting);
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
                using (IDataReader rs = DB.GetRS(string.Format("select * from Topic with (NOLOCK) where TopicID={0}", TopicID.ToString()), dbconn))
                {
                    if (rs.Read())
                    {
                        Editing = true;
                    }

                    if (ErrorMsg.Length != 0)
                    {
                        writer.Append("<p><b><font color=red>" + ErrorMsg + "</font></b></p>\n");
                    }
                    if (DataUpdated)
                    {
                        writer.Append("<p align=\"left\"><b><font color=blue>" + AppLogic.GetString("admin.editCreditCard.Updated", SkinID, LocaleSetting) + "</font></b></p>\n");
                    }


                    if (ErrorMsg.Length == 0)
                    {

                        if (Editing)
                        {
                            writer.Append("<b>" + String.Format(AppLogic.GetString("admin.edittopic.EditingTopic", SkinID, LocaleSetting),DB.RSFieldByLocale(rs, "Name", LocaleSetting),DB.RSFieldInt(rs, "TopicID").ToString()) + "<br/><br/></b>\n");
                        }
                        else
                        {
                            writer.Append("<b>" + AppLogic.GetString("admin.edittopic.AddNewTopic", SkinID, LocaleSetting) + ":<br/><br/></b>\n");
                        }

                        writer.Append("<script type=\"text/javascript\">\n");
                        writer.Append("function Form_Validator(theForm)\n");
                        writer.Append("{\n");
                        writer.Append("submitonce(theForm);\n");
                        writer.Append("return (true);\n");
                        writer.Append("}\n");
                        writer.Append("</script>\n");

                        if (AppLogic.NumLocaleSettingsInstalled() > 1)
                        {
                            writer.Append(CommonLogic.ReadFile("jscripts/tabs.js", true));
                        }

                        if (TopicID != 0)
                        {
                            writer.Append("<p align=\"left\"><a href=\"" + AppLogic.AdminLinkUrl("edittopic.aspx") + "\"><b>" + AppLogic.GetString("admin.edittopic.MakeNewTopic", SkinID, LocaleSetting) + "</b></a></p>");
                        }

                        writer.Append("<p>" + AppLogic.GetString("admin.edittopic.TopicInfo", SkinID, LocaleSetting) + "</p>\n");
                        writer.Append("<form action=\"" + AppLogic.AdminLinkUrl("edittopic.aspx") + "?TopicID=" + TopicID.ToString() + "&edit=" + Editing.ToString() + "\" method=\"post\" id=\"Form1\" name=\"Form1\" onsubmit=\"return (validateForm(document.forms[0]) && Form_Validator(document.forms[0]))\" onReset=\"return confirm('" + AppLogic.GetString("admin.common.ResetAllFieldsPrompt", SkinID, LocaleSetting) + "');\">\n");
                        writer.Append("<input type=\"hidden\" name=\"IsSubmit\" value=\"true\">\n");
                        writer.Append("<table width=\"100%\" cellpadding=\"4\" cellspacing=\"0\">\n");
                        writer.Append("              <tr valign=\"middle\">\n");
                        writer.Append("                <td width=\"100%\" colspan=\"2\" align=\"left\">\n");
                        writer.Append("                </td>\n");
                        writer.Append("              </tr>\n");

                        writer.Append("              <tr valign=\"middle\">\n");
                        writer.Append("                <td width=\"25%\" align=\"right\" valign=\"middle\">*" + AppLogic.GetString("admin.edittopic.TopicName", SkinID, LocaleSetting) + ":&nbsp;&nbsp;</td>\n");
                        writer.Append("                <td align=\"left\" valign=\"top\">\n");
                        writer.Append(AppLogic.GetLocaleEntryFields(DB.RSField(rs, "Name"), "Name", false, true, true, AppLogic.GetString("admin.common.TopicNamePrompt", SkinID, LocaleSetting), 100, 30, 0, 0, false));
                        
                        writer.Append("                	</td>\n");
                        writer.Append("              </tr>\n");

                        writer.Append("              <tr valign=\"middle\">\n");
                        writer.Append("                <td width=\"25%\" align=\"right\" valign=\"middle\">*" + AppLogic.GetString("admin.topic.title", SkinID, LocaleSetting) + "&nbsp;&nbsp;</td>\n");
                        writer.Append("                <td align=\"left\" valign=\"top\">\n");
                        writer.Append(AppLogic.GetLocaleEntryFields(DB.RSField(rs, "Title"), "Title", false, true, true, AppLogic.GetString("admin.common.TopicPageTitlePrompt", SkinID, LocaleSetting), 100, 30, 0, 0, false));
                        
                        writer.Append("                	</td>\n");
                        writer.Append("              </tr>\n");

                        writer.Append("              <tr valign=\"middle\">\n");
                        writer.Append("                <td width=\"25%\" align=\"right\" valign=\"middle\">*" + AppLogic.GetString("admin.topic.appliestoskin", SkinID, LocaleSetting) + "&nbsp;&nbsp;</td>\n");
                        writer.Append("                <td align=\"left\" valign=\"top\">\n");
                        writer.Append("        <input type=\"text\" name=\"SkinID\" size=\"3\" maxlength=\"3\" value=\"" + CommonLogic.IIF(DB.RSFieldInt(rs, "SkinID") == 0, "", DB.RSFieldInt(rs, "SkinID").ToString()) + "\">");
                        writer.Append("        <input type=\"hidden\" name=\"SkinID_vldt\" value=\"[number][invalidalert=" + AppLogic.GetString("admin.edittopic.EnterSkinNumber", SkinID, LocaleSetting) + "]\">\n");
                        writer.Append("&nbsp;<small>" + AppLogic.GetString("admin.edittopic.LeaveBlank", SkinID, LocaleSetting) + "</small>");
                        writer.Append("                	</td>\n");
                        writer.Append("              </tr>\n");

                        writer.Append("              <tr valign=\"middle\">\n");
                        writer.Append("                <td align=\"right\" valign=\"top\">" + AppLogic.GetString("admin.common.Description", SkinID, LocaleSetting) + ":&nbsp;&nbsp;</td>\n");
                        writer.Append("                <td align=\"left\" valign=\"top\">\n");
                        writer.Append(AppLogic.GetLocaleEntryFields(DB.RSField(rs, "Description"), "Description", true, true, false, "", 0, 0, AppLogic.AppConfigUSInt("Admin_TextareaHeight"), AppLogic.AppConfigUSInt("Admin_TextareaWidth"), !Editing || DB.RSFieldBool(rs, "HTMLOk")));
                        
                        writer.Append("                </td>\n");
                        writer.Append("              </tr>\n");

                        writer.Append("              <tr valign=\"middle\">\n");
                        writer.Append("                <td align=\"right\" valign=\"top\">" + AppLogic.GetString("admin.topic.setitle", SkinID, LocaleSetting) + "&nbsp;&nbsp;</td>\n");
                        writer.Append("                <td align=\"left\" valign=\"top\">\n");
                        writer.Append(AppLogic.GetLocaleEntryFields(DB.RSField(rs, "SETitle"), "SETitle", false, true, false, "", 100, 100, 0, 0, false));
                        
                        writer.Append("                </td>\n");
                        writer.Append("              </tr>\n");

                        writer.Append("              <tr valign=\"middle\">\n");
                        writer.Append("                <td align=\"right\" valign=\"top\">" + AppLogic.GetString("admin.topic.sekeywords", SkinID, LocaleSetting) + "&nbsp;&nbsp;</td>\n");
                        writer.Append("                <td align=\"left\" valign=\"top\">\n");
                        writer.Append(AppLogic.GetLocaleEntryFields(DB.RSField(rs, "SEKeywords"), "SEKeywords", false, true, false, "", 255, 100, 0, 0, false));
                        
                        writer.Append("                </td>\n");
                        writer.Append("              </tr>\n");

                        writer.Append("              <tr valign=\"middle\">\n");
                        writer.Append("                <td align=\"right\" valign=\"top\">" + AppLogic.GetString("admin.topic.sedescription", SkinID, LocaleSetting) + "&nbsp;&nbsp;</td>\n");
                        writer.Append("                <td align=\"left\" valign=\"top\">\n");
                        writer.Append(AppLogic.GetLocaleEntryFields(DB.RSField(rs, "SEDescription"), "SEDescription", false, true, false, "", 255, 100, 0, 0, false));
                        
                        writer.Append("                </td>\n");
                        writer.Append("              </tr>\n");

                        writer.Append("              <tr valign=\"middle\">\n");
                        writer.Append("                <td align=\"right\" valign=\"top\">" + AppLogic.GetString("admin.topic.password", SkinID, LocaleSetting) + "&nbsp;&nbsp;</td>\n");
                        writer.Append("                <td align=\"left\" valign=\"top\">\n");
                        writer.Append("                	<input Password=\"100\" size=\"20\" name=\"Password\" value=\"" + CommonLogic.IIF(Editing, DB.RSField(rs, "Password"), "") + "\"> " + AppLogic.GetString("admin.edittopic.OnlyRequired", SkinID, LocaleSetting) + "\n");
                        writer.Append("                </td>\n");
                        writer.Append("              </tr>\n");

                        writer.Append("      <tr>");
                        writer.Append("                <td align=\"right\" valign=\"top\">" + AppLogic.GetString("admin.topic.subscription", SkinID, LocaleSetting) + "&nbsp;&nbsp;</td>\n");
                        writer.Append("                <td align=\"left\" valign=\"top\">\n");
                        writer.Append(AppLogic.GetString("admin.common.Yes", SkinID, LocaleSetting) + "&nbsp;<INPUT TYPE=\"RADIO\" NAME=\"RequiresSubscription\" value=\"1\" " + CommonLogic.IIF(DB.RSFieldBool(rs, "RequiresSubscription"), " checked ", "") + ">\n");
                        writer.Append(AppLogic.GetString("admin.common.No", SkinID, LocaleSetting) + "&nbsp;<INPUT TYPE=\"RADIO\" NAME=\"RequiresSubscription\" value=\"0\" " + CommonLogic.IIF(DB.RSFieldBool(rs, "RequiresSubscription"), "", " checked ") + ">\n");
                        writer.Append("        </td>");
                        writer.Append("      </tr>");

                        writer.Append("      <tr>");
                        writer.Append("                <td align=\"right\" valign=\"top\">" + AppLogic.GetString("admin.topic.HTML", SkinID, LocaleSetting) + "&nbsp;&nbsp;</td>\n");
                        writer.Append("                <td align=\"left\" valign=\"top\">\n");
                        writer.Append(AppLogic.GetString("admin.common.Yes", SkinID, LocaleSetting) + "&nbsp;<INPUT TYPE=\"RADIO\" NAME=\"HTMLOk\" value=\"1\" " + CommonLogic.IIF(!Editing || DB.RSFieldBool(rs, "HTMLOk"), " checked ", "") + ">\n");
                        writer.Append(AppLogic.GetString("admin.common.No", SkinID, LocaleSetting) + "&nbsp;<INPUT TYPE=\"RADIO\" NAME=\"HTMLOk\" value=\"0\" " + CommonLogic.IIF(!Editing || DB.RSFieldBool(rs, "HTMLOk"), "", " checked ") + ">\n");
                        writer.Append("        </td>");
                        writer.Append("      </tr>");

                        writer.Append("      <tr>");
                        writer.Append("                <td align=\"right\" valign=\"top\">" + AppLogic.GetString("admin.edittopic.RequiresDisclaimer", SkinID, LocaleSetting) + ":&nbsp;&nbsp;</td>\n");
                        writer.Append("                <td align=\"left\" valign=\"top\">\n");
                        writer.Append(AppLogic.GetString("admin.common.Yes", SkinID, LocaleSetting) + "&nbsp;<INPUT TYPE=\"RADIO\" NAME=\"RequiresDisclaimer\" value=\"1\" " + CommonLogic.IIF(DB.RSFieldBool(rs, "RequiresDisclaimer"), " checked ", "") + ">\n");
                        writer.Append(AppLogic.GetString("admin.common.No", SkinID, LocaleSetting) + "&nbsp;<INPUT TYPE=\"RADIO\" NAME=\"RequiresDisclaimer\" value=\"0\" " + CommonLogic.IIF(DB.RSFieldBool(rs, "RequiresDisclaimer"), "", " checked ") + ">\n");
                        writer.Append("        </td>");
                        writer.Append("      </tr>");

                        writer.Append("      <tr>");
                        writer.Append("                <td align=\"right\" valign=\"top\">" + AppLogic.GetString("admin.topic.sitemap", SkinID, LocaleSetting) + "&nbsp;&nbsp;</td>\n");
                        writer.Append("                <td align=\"left\" valign=\"top\">\n");
                        writer.Append(AppLogic.GetString("admin.common.Yes", SkinID, LocaleSetting) + "&nbsp;<INPUT TYPE=\"RADIO\" NAME=\"ShowInSiteMap\" value=\"1\" " + CommonLogic.IIF(DB.RSFieldBool(rs, "ShowInSiteMap"), " checked ", "") + ">\n");
                        writer.Append(AppLogic.GetString("admin.common.No", SkinID, LocaleSetting) + "&nbsp;<INPUT TYPE=\"RADIO\" NAME=\"ShowInSiteMap\" value=\"0\" " + CommonLogic.IIF(DB.RSFieldBool(rs, "ShowInSiteMap"), "", " checked ") + ">\n");
                        writer.Append("        </td>");
                        writer.Append("      </tr>");

                        writer.Append("              <tr valign=\"middle\">\n");
                        writer.Append("                <td align=\"right\" valign=\"top\">" + AppLogic.GetString("admin.topic.pagebgcolor", SkinID, LocaleSetting) + "&nbsp;&nbsp;</td>\n");
                        writer.Append("                <td align=\"left\" valign=\"top\">\n");
                        writer.Append("                	<input maxLength=\"20\" size=\"10\" name=\"PageBGColor\" value=\"" + CommonLogic.IIF(Editing, DB.RSField(rs, "PageBGColor"), "") + "\">\n");
                        writer.Append("                </td>\n");
                        writer.Append("              </tr>\n");

                        writer.Append("              <tr valign=\"middle\">\n");
                        writer.Append("                <td align=\"right\" valign=\"top\">" + AppLogic.GetString("admin.topic.contentsbgcolor", SkinID, LocaleSetting) + "&nbsp;&nbsp;</td>\n");
                        writer.Append("                <td align=\"left\" valign=\"top\">\n");
                        writer.Append("                	<input maxLength=\"20\" size=\"10\" name=\"ContentsBGColor\" value=\"" + CommonLogic.IIF(Editing, DB.RSField(rs, "ContentsBGColor"), "") + "\">\n");
                        writer.Append("                </td>\n");
                        writer.Append("              </tr>\n");

                        writer.Append("              <tr valign=\"middle\">\n");
                        writer.Append("                <td align=\"right\" valign=\"top\">" + AppLogic.GetString("admin.topic.skingraphicscolor", SkinID, LocaleSetting) + "&nbsp;&nbsp;</td>\n");
                        writer.Append("                <td align=\"left\" valign=\"top\">\n");
                        writer.Append("                	<input maxLength=\"20\" size=\"10\" name=\"GraphicsColor\" value=\"" + CommonLogic.IIF(Editing, DB.RSField(rs, "GraphicsColor"), "") + "\">\n");
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
                    }
                }
            }
            ltContent.Text = writer.ToString();
        }

    }
}
