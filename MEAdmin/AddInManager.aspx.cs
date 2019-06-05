// --------------------------------------------------------------------------------
// Copyright AspDotNetStorefront.com. All Rights Reserved.
// http://www.aspdotnetstorefront.com
// For details on this license please visit the product homepage at the URL above.
// THE ABOVE NOTICE MUST REMAIN INTACT. 
// --------------------------------------------------------------------------------
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using AspDotNetStorefront.HostView;
using AspDotNetStorefrontCore;
using Telerik.Web.UI;
using System.AddIn.Hosting;
using System.IO;

namespace AspDotNetStorefrontAdmin
{
    public partial class AddInManagerPage : AdminPageBase
    {
        protected void btnRebuild_Click(object sender, EventArgs e)
        {
            var addInPath = CommonLogic.SafeMapPath(String.Format("~/{0}", AppLogic.AppConfig("AddInDir")));

			AddInDiscoveryHelper.DiscoverAvailableAddins(addInPath, true);
        }

        protected void btnUploadAddIn_Click(object sender, EventArgs e)
        {
            if (flpAddIn.HasFile)
            {
                TrySaveAddIn(flpAddIn.PostedFile);
            }
        }

        private void TrySaveAddIn(HttpPostedFile addInFile)
        {
            if (IsValidAddinFile(addInFile))
            {
                SaveAddIn(flpAddIn.PostedFile); 
            }
            else
            {
                lblError.Text = AppLogic.GetString("admin.AddInManager.InvalidFileType", SkinID, LocaleSetting);
            }
        }

        private bool IsValidAddinFile(HttpPostedFile file)
        {
            return FileHasValidExtension(file, ".dll");
        }

        private bool IsValidConfigFile(HttpPostedFile file)
        {
            return FileHasValidExtension(file, ".config");
        }

        private bool FileHasValidExtension(HttpPostedFile file, string extension)
        {
            return Path.GetExtension(file.FileName).EqualsIgnoreCase(extension);
        }

        private void SaveAddIn(HttpPostedFile file)
        {
            string relPath = "~/{0}/AddIns".FormatWith(AppLogic.AppConfig("AddInDir"));
            string addInFolder = CommonLogic.SafeMapPath(relPath);
            string addInName = Path.GetFileNameWithoutExtension(file.FileName);
            string addInDirectory = "{0}/{1}".FormatWith(addInFolder, addInName);

            try
            {
                // recreate the directory, removing previous installed files
                if (Directory.Exists(addInDirectory))
                {
                    Directory.Delete(addInDirectory, true);
                }

                Directory.CreateDirectory(addInDirectory);

                string addInSavePath = "{0}/{1}".FormatWith(addInDirectory, file.FileName);
                file.SaveAs(addInSavePath);

                if (flpConfig.HasFile && 
                    IsValidConfigFile(flpConfig.PostedFile))
                {
                    string configSavePath = "{0}/{1}".FormatWith(addInDirectory, flpConfig.PostedFile.FileName);
                    flpConfig.SaveAs(configSavePath);
                }

                ctrlAddinList.RefreshAddins();

                lblError.Text = string.Empty;
            }
            catch
            {
                // io permission error
                lblError.Text = String.Format(AppLogic.GetString("admin.AddInManager.CouldNotUploadAddin", SkinID, LocaleSetting),addInName);
            }
        }
        
    }
}

