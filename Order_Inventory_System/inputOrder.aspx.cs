using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Order_Inventory_System
{
    public partial class inputOrder : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IkeaConnectionString"].ConnectionString);
        string mane, iii;
        DataTable dt = new DataTable();
        int NUMOFROW, orderID, totalOrder = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            lbName.Text = (string)Session["user"];
            lbOrderDate.Text = (string)Session["user1"];


            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [CusOrder]", con);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                NUMOFROW = int.Parse(reader.GetValue(0).ToString());
                orderID = NUMOFROW + 1;
                TextBox1.Text = orderID.ToString();
            }
            con.Close();

            if (!Page.IsPostBack)
            {
                if (ViewState["Records"] == null)
                {
                    dt.Columns.Add("Product ID");
                    dt.Columns.Add("Product Name");
                    dt.Columns.Add("Quantity");
                    dt.Columns.Add("Unit Price (RM)");
                    dt.Columns.Add("Total Price (RM)");
                    ViewState["Records"] = dt;
                }
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

            con.Open();

            SqlCommand cmd = new SqlCommand("Select product_desc, product_price from Product where product_id =@product_id", con);
            cmd.Parameters.AddWithValue("product_id", (TextBox2.Text).ToString());
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                TextBox3.Text = reader.GetValue(0).ToString();
                TextBox4.Text = reader.GetValue(1).ToString();

                iii = TextBox3.Text = reader.GetValue(0).ToString();
                mane = TextBox4.Text = reader.GetValue(1).ToString();
            }
            con.Close();


            TextBox6.Text = iii;
            TextBox7.Text = mane;

        }


        protected void Button2_Click(object sender, EventArgs e)
        {

            double num1;
            int num2;
            double total;
            Boolean success = true;
            if (TextBox2.Text == "" || TextBox5.Text == "")
            {
                success = false;
            }

            if (success == true)
            {
                num2 = int.Parse(TextBox5.Text);
                num1 = double.Parse(TextBox7.Text);

                total = num1 * num2;


                lblPrice.Text = total.ToString();

                dt = (DataTable)ViewState["Records"];
                dt.Rows.Add(TextBox2.Text, TextBox6.Text, TextBox5.Text, TextBox7.Text, lblPrice.Text);
                GridView1.DataSource = dt;
                GridView1.DataBind();


                string ins = "Insert into [CusOrder](orderId, productId, orderQuantity, productName, productQty, totalP, customerName, orderD) values('" + TextBox1.Text + "', '" + TextBox2.Text + "', '" + TextBox5.Text + "', '" + TextBox6.Text + "', '" + TextBox7.Text + "', '" + lblPrice.Text + "', '" + lbName.Text + "', '" + lbOrderDate.Text + "')";
                SqlCommand com = new SqlCommand(ins, con);
                con.Open();
                com.ExecuteNonQuery();
                con.Close();

                TextBox2.Text = null;
                TextBox5.Text = null;

                Label2.Text = "Order placed successfully.";
                totalOrder += 1;
            }
            else
            {
                Label2.Text = "Please fill all the information.";
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            //Delete All Order Insert

            //SqlCommand cmd = new SqlCommand("Delete from CusOrder where customerName =@cName", con);
            //cmd.Connection = con;
            //con.Open();
            //cmd.Parameters.AddWithValue("cName", (lbName.Text));
            //cmd.ExecuteNonQuery();
            //con.Close();

            try
            {
                using (var sc = con)
                using (var cmd = sc.CreateCommand())
                {
                    sc.Open();
                    cmd.CommandText = "DELETE FROM CusOrder WHERE customerName = @cName";
                    cmd.Parameters.AddWithValue("@cName", lbName.Text);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Customer.aspx");
                }
            }
            catch
            {

            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            calculateSum();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }

        private void calculateSum()
        {

        }
    }
}