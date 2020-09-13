using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Xml.Schema;
using System.Configuration;

namespace Order_Inventory_System
{
    public partial class register : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IkeaConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ins = "Insert into [Staff](username, password, position, email, phoneNumber) values('" + TextBox1.Text + "', '" + TextBox2.Text + "', '" + DropDownList1.Text + "', '" + TextBox4.Text + "', '" + TextBox5.Text + "')";
            SqlCommand com = new SqlCommand(ins, con);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();

            Response.Redirect("login.aspx");
        }
    }
}