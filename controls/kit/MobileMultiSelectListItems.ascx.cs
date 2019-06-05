// --------------------------------------------------------------------------------
// Copyright AspDotNetStorefront.com. All Rights Reserved.
// http://www.aspdotnetstorefront.com
// For details on this license please visit the product homepage at the URL above.
// THE ABOVE NOTICE MUST REMAIN INTACT. 
// --------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AspDotNetStorefrontControls;
using AspDotNetStorefrontCore;

namespace AspDotNetStorefront.Kit
{
    public partial class MobileMultiSelectListItems : BaseKitGroupControl
    {
        protected void rptItems_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
        }

        public override void ResolveSelection()
        {
            rptItems.ForEachItemTemplate(RepeaterItemIterator);
        }

        private void RepeaterItemIterator(RepeaterItem item)
        {
            HiddenField hdfKitItemId = item.FindControl<HiddenField>("hdfKitItemId");
            CheckBox chkItem = item.FindControl<CheckBox>("chkItem");

            int kitItemId = hdfKitItemId.Value.ToNativeInt();
            KitItemData kitItem = KitGroup.GetItem(kitItemId);

            kitItem.IsSelected = chkItem.Checked;
        }
    }
}


