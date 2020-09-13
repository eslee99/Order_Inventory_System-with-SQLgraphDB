using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Order_Inventory_System
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["UserLogin"] != null)
            {
                signin.Text = "Hello , " + Request.Cookies["UserLogin"]["username"].ToString();                
            }
        }
    }
}