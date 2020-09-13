using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Order_Inventory_System
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IkeaConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string check = "select count(*) from [Staff] where username = '" + TextBox1.Text + "' and Password = '" + TextBox2.Text + "' ";
            string check666 = "select * from [Staff] where username = '" + TextBox1.Text + "' and Password = '" + TextBox2.Text + "'";

            SqlDataAdapter sda = new SqlDataAdapter(check666, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            SqlCommand com = new SqlCommand(check, con);
            con.Open();
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            con.Close();
            if (temp == 1)
            {
                HttpCookie mycookie = new HttpCookie("UserLogin");
                mycookie["username"] = dt.Rows[0]["username"].ToString();

                mycookie.Expires = DateTime.Now.AddDays(1d);
                Response.Cookies.Add(mycookie);

                Response.Redirect("Default.aspx");
            }
            else
            {
                Label2.Visible = true;
            }
        }

        protected void registerBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }
    }
}