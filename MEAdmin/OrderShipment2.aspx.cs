// --------------------------------------------------------------------------------
// Copyright AspDotNetStorefront.com. All Rights Reserved.
// http://www.aspdotnetstorefront.com
// For details on this license please visit the product homepage at the URL above.
// THE ABOVE NOTICE MUST REMAIN INTACT. 
// --------------------------------------------------------------------------------
using System;
using System.IO;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Xml;
using System.Xml.Xsl;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using AspDotNetStorefrontCore;
using AspDotNetStorefrontCommon;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace AspDotNetStorefrontAdmin
{
    public partial class OrderShipment2 : AdminPageBase
    {

        private string methodtype = string.Empty;
        private string state = string.Empty;
        private string errors = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {

            methodtype = CommonLogic.FormCanBeDangerousContent("exporttype");
            state = CommonLogic.FormCanBeDangerousContent("stateExport");

            if (state.IndexOf("Export") != -1)
            {
                if (methodtype == "UPS WorldShip")
                {
                    ExportShipment();
                }
                else
                {
                    MsgBox(AppLogic.GetString("admin.OrderShipment2.NotImplemented", SkinID, LocaleSetting));
                    Response.Redirect(AppLogic.AdminLinkUrl("exportshipment1.aspx"));
                }
            }
            else
            {
                string dashSeperatedOrderNumbers = ImportShipment();
                Session["dashSeperatedImportedOrderNumbers"] = dashSeperatedOrderNumbers;
                Response.Redirect(AppLogic.AdminLinkUrl("viewshipment.aspx")+ "?statename=import");
                
            }   

        }

        private string ImportShipment()
        {
            if (Request.Files.Count > 0)
            {
                HttpPostedFile PostedFile = Request.Files[0];
                if (!PostedFile.FileName.EndsWith("csv", StringComparison.InvariantCultureIgnoreCase) && !PostedFile.FileName.EndsWith("xml", StringComparison.InvariantCultureIgnoreCase) && PostedFile.FileName.Trim() != "")
                {
                    errors = String.Format(AppLogic.GetString("admin.OrderShipment2.InvalidFileType", SkinID, LocaleSetting),CommonLogic.IIF(PostedFile.ContentLength == 0, AppLogic.GetString("admin.common.FileContentsWereEmpty", SkinID, LocaleSetting), AppLogic.GetString("admin.common.CommaDelimitedFilesPrompt", SkinID, LocaleSetting)));
                }
                else
                {
                    string xml = String.Empty;
                    string filename = "Import_ASPDNSF";
                    string FullFilePath = CommonLogic.SafeMapPath("../images") + "\\" + filename + PostedFile.FileName.ToLowerInvariant().Substring(PostedFile.FileName.ToLowerInvariant().LastIndexOf('.'));

                    PostedFile.SaveAs(FullFilePath);
                    StreamReader sr = new StreamReader(FullFilePath);
                    string filecontent = sr.ReadToEnd();
                    sr.Close();

                    if (PostedFile.FileName.EndsWith("csv", StringComparison.InvariantCultureIgnoreCase))
                    {
                        xml = ImportXmlData(filecontent);
                    }
                    else if (PostedFile.FileName.EndsWith("xls", StringComparison.InvariantCultureIgnoreCase))
                    {
                        xml = Import.ConvertPricingFileToXml(FullFilePath);
                        XslCompiledTransform xForm = new XslCompiledTransform();
                        xForm.Load(CommonLogic.SafeMapPath("XmlPackages/ExcelPricingImport.xslt"));
                        Localization ExtObj = new Localization();
                        XsltArgumentList m_TransformArgumentList = new XsltArgumentList();
                        m_TransformArgumentList.AddExtensionObject("urn:aspdnsf", ExtObj);
                        XmlDocument xdoc = new XmlDocument();
                        xdoc.LoadXml(xml);
                        StringWriter xsw = new StringWriter();
                        xForm.Transform(xdoc, m_TransformArgumentList, xsw);
                        xml = xsw.ToString();
                    }
                    else
                    {
                        xml = filecontent;
                    }
                    File.Delete(FullFilePath);
                    errors = ImportProductList(xml);
                    return getImportedOrderNumbers(xml);
                }
            }
            return "";
        }

        private string getImportedOrderNumbers(string xml)
        {
            XmlDocument xdoc = new XmlDocument();
            StringBuilder csvOrderNumbers = new StringBuilder();
            xdoc.LoadXml(xml);
            XmlNodeList ordernumbers = xdoc.SelectNodes("//OrderNumber");
            foreach (XmlNode n in ordernumbers)
            {
                csvOrderNumbers.Append("-" + n.InnerText);
            }
            if (csvOrderNumbers.Length > 0)
            {
                csvOrderNumbers.Append("-");
            }
            return csvOrderNumbers.ToString();
        }

        private void ExportShipment()
        {
            string importMethod = "export";
            string filepath = CommonLogic.SafeMapPath("../images") + "\\";
            string filename = importMethod + Localization.ToThreadCultureShortDateString(System.DateTime.Now).Replace(" ", "").Replace("/", "").Replace(":", "").Replace(".", "");
            string fileextension = String.Empty;
            string xml = ExportXML();
            string extname = "csv";

            string[] oldfiles = Directory.GetFiles(filepath, "export*." + extname);
            
            foreach (string oldfile in oldfiles)
            {
                try
                {
                    File.Delete(oldfile);
                }
                catch { }
            }

            List<object> newList = ExportList();

            String csvList = CSVExporter.ExportListToCSV(newList);

            using (StreamWriter sw = new StreamWriter(filepath + filename + ".csv"))
            {
                sw.Write(csvList);

                sw.Close();
                sw.Dispose();
            }
            
            Response.Clear();
            Response.ClearHeaders();
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=Export_ADNSF.csv");
            Response.ContentType = "text/csv";
            Response.AddHeader("Pragma", "public");
            Response.Write(csvList);
            Response.End();
        }

        private List<object> ExportList()
        {
            List<object> exportshipping = new List<object>();

            using (SqlConnection conn = new SqlConnection(DB.GetDBConn()))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "dbo.aspdnsf_WorldShipExport";

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            exportshipping.Add(new ShipExport(dr));
                        }

                        dr.Close();
                        dr.Dispose();
                    }

                    cmd.Dispose();
                }

                conn.Close();
                conn.Dispose();
            }

            return exportshipping;
        }

        private String ExportXML()
        {
            StringBuilder sb = new StringBuilder(1024);
            int n = 0;
            using(SqlConnection dbconn = new SqlConnection())
            {
                dbconn.ConnectionString = DB.GetDBConn();
                dbconn.Open();

                using(SqlCommand cmd = new SqlCommand())
                {              
                    cmd.Connection = dbconn;
                    cmd.CommandType = CommandType.Text;
                    string sql = "exec dbo.aspdnsf_WorldShipExport";
                    cmd.CommandText = sql;

                    using(SqlDataReader dr = cmd.ExecuteReader())
                    {
                      n = DB.GetENLocaleXml(dr, "root", "order", ref sb);                
                    }
                }
            }            
            return sb.ToString();
        }

        private void MsgBox(String Message)
        {
            System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE = \"JavaScript\">" + Environment.NewLine);
            System.Web.HttpContext.Current.Response.Write("alert(\"" + Message + "\")" + Environment.NewLine);
            System.Web.HttpContext.Current.Response.Write("</SCRIPT>");
        }

        private string ImportProductList(string importtext)
        {
            if (importtext.Trim() == "")
            {
                return AppLogic.GetString("admin.common.NoDatatoimport", SkinID, LocaleSetting);
            }

            SqlConnection dbconn = new SqlConnection();
            dbconn.ConnectionString = DB.GetDBConn();
            dbconn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = dbconn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "aspdnsf_ImportOrderShipment_XML";
     
            cmd.Parameters.Add(new SqlParameter("@xmlorder", SqlDbType.NText));
            cmd.Parameters["@xmlorder"].Value = importtext;

            cmd.Parameters.Add(new SqlParameter("@carrierName", SqlDbType.NVarChar));
            cmd.Parameters["@carrierName"].Value = DetermineCarrier(importtext);

            try
            {
                cmd.ExecuteNonQuery();
                dbconn.Close();
                if (AppLogic.AppConfigBool("BulkImportSendsShipmentNotifications"))
                    SendShippedEMails(importtext);
                return "";
            }
            catch (Exception ex)
            {
                dbconn.Close();
                throw ex;
            }

        }

        private string DetermineCarrier(string importText)
        {
            //Convert import string to XML to extract tracking number
            XmlDocument xdoc = new XmlDocument();
            xdoc.LoadXml(importText);

            //Extract tracking number
            string trackingNumber = xdoc.SelectSingleNode("shipment/ordershipment/TrackingNumber/text()").Value.Replace("\r", "");

            //Match the tracking number to a carrier
            String[] carrierList = AppLogic.AppConfig("ShippingTrackingCarriers").Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            String match = String.Empty;
            String shippingCarrier = String.Empty;

            foreach (String carrier in carrierList)
            {
                match = Regex.Match(trackingNumber, AppLogic.AppConfig("ShippingTrackingRegex." + carrier.Trim()), RegexOptions.Compiled).Value;

                if (match.Length != 0)
                {
                    shippingCarrier = carrier;
                }
            }

            return shippingCarrier;
        }

        private string ImportXmlData(string fileContent)
        {
            string[] rows = fileContent.Split('\n'); //Environment.NewLine.ToCharArray());
            StringBuilder sb = new StringBuilder();

            string xml = string.Empty;
            string delim = ",";
            string[] cols;

            ArrayList list = new ArrayList();
            list.Clear();

            DataSet ds = new DataSet("WorldShip");
            DataRow dr;
            DataTable dt = new DataTable("ordershipment");
            ds.Tables.Add(dt);
            dt.Columns.Add("ReadyToShip", typeof(Int16));
            dt.Columns.Add("OrderNumber", typeof(Int32));
            dt.Columns.Add("TrackingNumber", typeof(string));
            dt.Columns.Add("Notes", typeof(string));

            for (int i = 0; i < rows.Length; i++)
            {
                bool header = rows[i].StartsWith("OrderNumber", StringComparison.InvariantCultureIgnoreCase);

                if (!header)
                {
                    cols = rows[i].Split(delim.ToCharArray());
                    if (cols[0] != string.Empty)
                    {
                        string[] orderNo = cols[0].Split('-');

                        string tmpOrderNumber = orderNo[0].Replace("\"", "");
                        int orderNumber = 0;

                        if (cols[0].Replace("'", "") != "Y" && 
                            int.TryParse(tmpOrderNumber, out orderNumber))
                        {
                            dr = dt.NewRow();
                            dr["ReadyToShip"] = 1;
                            dr["OrderNumber"] = tmpOrderNumber;
                            dr["TrackingNumber"] = cols[1].Replace("\"", "");
                            list.Add(orderNo[0].Replace("\"", ""));
                            dt.Rows.Add(dr);
                        }
                    }
                }
            }

            DataRow[] filterRow;
            string val = string.Empty;

            DataSet shipmentDS = new DataSet("shipment");
            DataTable shipmentDT = new DataTable("ordershipment");
            DataRow shipmentDR;
            shipmentDS.Tables.Add(shipmentDT);
            shipmentDT.Columns.Add("ReadyToShip", typeof(Int16));
            shipmentDT.Columns.Add("OrderNumber", typeof(Int32));
            shipmentDT.Columns.Add("TrackingNumber", typeof(string));
            shipmentDT.Columns.Add("Notes", typeof(string));

            foreach (string item in list)
            {
                filterRow = ds.Tables[0].Select("OrderNumber = " + item);
                if (filterRow.Length > 1)
                {
                    if (shipmentDS.Tables[0].Select("OrderNumber = " + item).Length == 0)
                    {
                        shipmentDR = shipmentDT.NewRow();
                        shipmentDR["ReadyToShip"] = filterRow[0]["ReadyToShip"];
                        shipmentDR["OrderNumber"] = filterRow[0]["OrderNumber"];
                        shipmentDR["TrackingNumber"] = filterRow[0]["TrackingNumber"];
                        shipmentDR["Notes"] = Notes(filterRow);
                        shipmentDT.Rows.Add(shipmentDR);
                    }
                }
                else
                {
                    shipmentDR = shipmentDT.NewRow();
                    shipmentDR["ReadyToShip"] = filterRow[0]["ReadyToShip"];
                    shipmentDR["OrderNumber"] = filterRow[0]["OrderNumber"];
                    shipmentDR["TrackingNumber"] = filterRow[0]["TrackingNumber"];
                    shipmentDR["Notes"] = "Tracking Number: " + filterRow[0]["TrackingNumber"];
                    shipmentDT.Rows.Add(shipmentDR);
                }
            }

            return shipmentDS.GetXml();            
        }

        private string Notes(DataRow[] notesrow)
        {
            string orderNotes = string.Empty;
            for (int i = 0; i < notesrow.Length; i++)
            {
                orderNotes += String.Format(AppLogic.GetString("admin.OrderShipment2.TrackingNumber", SkinID, LocaleSetting),notesrow[i]["TrackingNumber"].ToString()) + ",";
            }
            return orderNotes.TrimEnd(',');
        }

        private void SendShippedEMails(String importtext)
        {
            //sending email
            StringReader sr = new StringReader(importtext);
            XmlDocument xmldoc = new XmlDocument();
            xmldoc.Load(sr);
            XmlNodeList xmlnodelist = xmldoc.GetElementsByTagName("ordershipment");
            
            bool OKToSend = false;

            String MailServer = AppLogic.AppConfig("MailMe_Server");

            if (AppLogic.AppConfigBool("SendShippedEMailToCustomer") && MailServer.Length != 0 && MailServer != AppLogic.ro_TBD)
            {
                OKToSend = true;
            }

            if (OKToSend)
            {
                for (int i = 0; i < xmlnodelist.Count; i++)
                {
                    Order order = new Order(Int32.Parse(xmlnodelist[i].ChildNodes[1].InnerText), null);
                    try
                    {
                        // try to send "shipped on" EMail
                        String SubjectShipped = String.Format(AppLogic.GetString("common.cs.9", order.SkinID, order.LocaleSetting), AppLogic.AppConfig("StoreName"));

                        String BodyShipped = order.ShippedNotification();
                        if (MailServer.Length != 0 && MailServer.ToUpperInvariant() != AppLogic.ro_TBD)
                        {
                            AppLogic.SendMail(SubjectShipped, BodyShipped + AppLogic.AppConfig("MailFooter"), true, AppLogic.AppConfig("ReceiptEMailFrom"), AppLogic.AppConfig("ReceiptEMailFromName"), order.EMail, order.EMail, String.Empty, MailServer);
                        }
                    }
                    catch { }
                }
            
                
            }
            //end sending email
        }
    }

    class ShipExport
    {
        #region Private Variables

        private	string m_ordernumber = String.Empty;
        private	string m_shippingtrackingnumber = String.Empty;
        private	string m_shippedon = String.Empty;
        private	string m_shippingmethod = String.Empty;
        private	string m_customerid = String.Empty;
        private	string m_name = String.Empty;
        private	string m_email = String.Empty;
        private	string m_shippingname = String.Empty;
        private	string m_shippingcompany = String.Empty;
        private	string m_shippingaddress1 = String.Empty;
        private	string m_shippingaddress2 = String.Empty;
        private	string m_shippingsuite = String.Empty;
        private	string m_shippingcity = String.Empty;
        private	string m_shippingstate = String.Empty;
        private	string m_shippingzip = String.Empty;
        private	string m_shippingcountry = String.Empty;
        private	string m_shippingphone = String.Empty;
        private	string m_ordersubtotal = String.Empty;
        private	string m_ordertax = String.Empty;
        private	string m_ordershippingcosts = String.Empty;
        private	string m_ordertotal = String.Empty;
        private	string m_orderdate = String.Empty;
        private	string m_orderweight = String.Empty;

        #endregion

        #region Public Properties

        public string OrderNumber { get { return m_ordernumber; } set { m_ordernumber = value; } }
        public string ShippingTrackingNumber { get { return m_shippingtrackingnumber; } set { m_shippingtrackingnumber = value; } }
        public string ShippedOn { get { return m_shippedon; } set { m_shippedon = value; } }
        public string ShippingMethod { get { return m_shippingmethod; } set { m_shippingmethod = value; } }
        public string CustomerID { get { return m_customerid; } set { m_customerid = value; } }
        public string Name { get { return m_name; } set { m_name = value; } }
        public string Email { get { return m_email; } set { m_email = value; } }
        public string ShippingName { get { return m_shippingname; } set { m_shippingname = value; } }
        public string ShippingCompany { get { return m_shippingcompany; } set { m_shippingcompany = value; } }
        public string ShippingAddress1 { get { return m_shippingaddress1; } set { m_shippingaddress1 = value; } }
        public string ShippingAddress2 { get { return m_shippingaddress2; } set { m_shippingaddress2 = value; } }
        public string ShippingSuite { get { return m_shippingsuite; } set { m_shippingsuite = value; } }
        public string ShippingCity { get { return m_shippingcity; } set { m_shippingcity = value; } }
        public string ShippingState { get { return m_shippingstate; } set { m_shippingstate = value; } }
        public string ShippingZip { get { return m_shippingzip; } set { m_shippingzip = value; } }
        public string ShippingCountry { get { return m_shippingcountry; } set { m_shippingcountry = value; } }
        public string ShippingPhone { get { return stripNonDigits(m_shippingphone); } set { m_shippingphone = value; } }
        public string OrderSubtotal { get { return m_ordersubtotal; } set { m_ordersubtotal = value; } }
        public string OrderTax { get { return m_ordertax; } set { m_ordertax = value; } }
        public string OrderShippingCosts { get { return m_ordershippingcosts; } set { m_ordershippingcosts = value; } }
        public string OrderTotal { get { return m_ordertotal; } set { m_ordertotal = value; } }
        public string OrderDate { get { return m_orderdate; } set { m_orderdate = value; } }
        public string OrderWeight { get { return m_orderweight; } set { m_orderweight = value; } }
        public string BillingOption { get { return "SHP"; } }

        #endregion

        #region Constructors

        public ShipExport() { }

        public ShipExport(SqlDataReader dr)
        {
            m_ordernumber = DB.RSField(dr, "OrderNumber").Replace(",", "");
            m_shippingtrackingnumber = DB.RSField(dr, "ShippingTrackingNumber").Replace(",", "");
            m_shippedon = CommonLogic.IIF(DB.RSFieldDateTime(dr, "ShippedOn").Equals(System.DateTime.MinValue), String.Empty, DB.RSFieldDateTime(dr, "ShippedOn").ToString());
            m_shippingmethod = DB.RSField(dr, "ShippingMethod").Replace(",", "");
            m_customerid = DB.RSFieldInt(dr, "CustomerID").ToString().Replace(",", "");
            m_name = DB.RSField(dr, "Name").Replace(",", "");
            m_email = DB.RSField(dr, "Email").Replace(",", "");
            m_shippingname = DB.RSField(dr, "ShippingName").Replace(",", "");
            m_shippingcompany = DB.RSField(dr, "ShippingCompany").Replace(",", "");
            m_shippingaddress1 = DB.RSField(dr, "ShippingAddress1").Replace(",", "");
            m_shippingaddress2 = DB.RSField(dr, "ShippingAddress2").Replace(",", "");
            m_shippingsuite = DB.RSField(dr, "ShippingSuite").Replace(",", "");
            m_shippingcity = DB.RSField(dr, "ShippingCity").Replace(",", "");
            m_shippingstate = DB.RSField(dr, "ShippingState").Replace(",", "");
            m_shippingzip = DB.RSField(dr, "ShippingZip").Replace(",", "");
            m_shippingcountry = DB.RSField(dr, "ShippingCountry").Replace(",", "");
            m_shippingphone = DB.RSField(dr, "ShippingPhone").Replace(",", "");
            m_ordersubtotal = DB.RSFieldDecimal(dr, "OrderSubtotal").ToString().Replace(",", "");
            m_ordertax = DB.RSFieldDecimal(dr, "OrderTax").ToString().Replace(",", "");
            m_ordershippingcosts = DB.RSFieldDecimal(dr, "OrderShippingCosts").ToString().Replace(",", "");
            m_ordertotal = DB.RSFieldDecimal(dr, "OrderTotal").ToString().Replace(",", "");
            m_orderdate = DB.RSFieldDateTime(dr, "OrderDate").ToString().Replace(",", "");
            m_orderweight = DB.RSFieldDecimal(dr, "OrderWeight").ToString().Replace(",", "");
        }

        private string stripNonDigits(string s)
        {
            string ret = "";
            foreach (char c in s)
            {
                if (c == '0' || c == '1' || c == '2' || c == '3' || c == '4' || c == '5' || c == '6' || c == '7' || c == '8' || c == '9')
                    ret += c;
            }
            return ret;
        }

        #endregion
    }
}
