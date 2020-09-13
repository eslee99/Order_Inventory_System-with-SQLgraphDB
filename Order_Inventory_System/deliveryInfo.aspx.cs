using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Runtime.CompilerServices;
using System.Configuration;

namespace Order_Inventory_System
{
    public partial class deliveryInfo : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IkeaConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

            Label3.Text = (string)Session["user"];
            Label4.Text = (string)Session["user1"];

            con.Open();

            SqlCommand cmd = new SqlCommand("Select cPhone from Customer where cName =@customerName", con);
            cmd.Parameters.AddWithValue("customerName", (Label3.Text).ToString());
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                TextBox4.Text = reader.GetValue(0).ToString();
            }
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Boolean success = true;
            if (Label3.Text == " " || TextBox4.Text == "" || Label4.Text == "" || date.Text == "" || TextBox2.Text == "")
            {
                success = false;
                Label5.Text = "Please fill in all information.";
            }

            if (success)
            {
                Label1.Text = "Pending";
                Label1.ForeColor = System.Drawing.Color.Green;
                TextBox2.Enabled = false;
                date.Enabled = false;
                TextBox4.Enabled = false;
                Button1.Visible = false;
                Button2.Visible = true;

                string ins = "Insert into [Delivery](cusN, phoneN, orderD, deliveryD, address, status) values('" + Label3.Text + "', '" + TextBox4.Text + "', '" + Label4.Text + "', '" + date.Text + "', '" + TextBox2.Text + "', '" + Label1.Text + "')";
                SqlCommand com2 = new SqlCommand(ins, con);
                con.Open();
                com2.ExecuteNonQuery();
                con.Close();
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}