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
using AspDotNetStorefrontControls;
using System.Collections.Generic;

namespace AspDotNetStorefrontAdmin.Controls
{
    public partial class AddinListControl : BaseUserControl<IEnumerable<AddInRegistry>>
    {
        protected T DataItemAs<T>(GridItem item) where T : class
        {
            return item.DataItem as T;
        }

        protected override void OnInit(EventArgs e)
        {
            BindData(true);
            
            base.OnInit(e);
        }

        public void RefreshAddins()
        {
            BindData(true);
        }


        private void BindData(bool rebuild)
        {
            var addInPath = CommonLogic.SafeMapPath(String.Format("~/{0}", AppLogic.AppConfig("AddInDir")));
            var addIns = AddInDiscoveryHelper.DiscoverAvailableAddins(addInPath, rebuild);
            grdAddIns.DataSource = addIns;
            grdAddIns.DataBind();
        }

        protected void grdAddIns_DetailTableDataBind(object source, GridDetailTableDataBindEventArgs e)
        {
            var detailView = e.DetailTableView;
            detailView.DataSource = (e.DetailTableView.ParentItem.DataItem as AddInRegistry).AddIns;
        }
    }    
}

