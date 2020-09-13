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
    public partial class customer : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IkeaConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string phoneNumber = DropDownList1.SelectedValue + TextBox2.Text;
            string cDate = date.Text;
            string email = TextBox3.Text;
            Boolean success = true;

            if (cName.Text == "" || TextBox2.Text == "" || email == "" || cDate == "")
            {
                Label2.Text = "Please fill in all the information.";
                success = false;
            }

            if (email.IndexOf("@") == -1)
            {
                Label3.Text = "Please insert a proper email address";
                success = false;
            }

            if (!phoneNumber.All(char.IsDigit))
            {
                Label4.Text = "Please insert a proper phone number";
                success = false;
            }

            if (success == true)
            {
                string ins = "Insert into [Customer](cName, cPhone, cEmail, oDate) values('" + cName.Text + "', '" + phoneNumber + "', '" + email + "', '" + cDate + "')";
                SqlCommand com = new SqlCommand(ins, con);
                con.Open();
                com.ExecuteNonQuery();
                con.Close();

                Session["user"] = cName.Text;
                Session["user1"] = cDate;
                Response.Redirect("inputOrder.aspx");
            }

        }
    }
}