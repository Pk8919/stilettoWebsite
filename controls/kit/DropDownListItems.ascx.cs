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
    public partial class DropDownListItems : BaseKitGroupControl
    {
        public override void DataBind()
        {
            base.DataBind();

            //KitGroup.ResolveRelativeDeltas();
            PopulateDropDown();
        }

        private void PopulateDropDown()
        {
            cboKitItems.Items.Clear();
            foreach (var kitItem in KitGroup.SelectableItems)
            {
                ListItem lItem = new ListItem();

                // truncate after 75 chars to maintain a proper width for the dropdown
                lItem.Text = KitItemDisplayText(kitItem, 60);
                lItem.Value = kitItem.Id.ToString();
                lItem.Selected = kitItem.IsSelected;

                cboKitItems.Items.Add(lItem);
            }
        }

        public override void ResolveSelection()
        {
            foreach (ListItem lItem in cboKitItems.Items)
            {
                int kitId = lItem.Value.ToNativeInt();
                KitItemData kitItem = KitGroup.GetItem(kitId);

                kitItem.IsSelected = lItem.Selected;
            }

            //KitGroup.ResolveRelativeDeltas();
            //PopulateDropDown();
        }
    }
}


