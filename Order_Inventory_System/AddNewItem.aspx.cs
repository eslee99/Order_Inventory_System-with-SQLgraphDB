using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Order_Inventory_System
{
    public partial class AddNewItem : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IkeaConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addItemButton_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Insert into Product(product_id, product_price, manu_date, product_remark, product_qty, product_desc, stock_level, reorder_level) " +
                               "values (@product_id, @product_price, @manu_date, @product_remark, @product_qty, @product_desc, @stock_level, @reorder_level)", conn);
                cmd.Parameters.AddWithValue("@product_id", txtId.Text);
                cmd.Parameters.AddWithValue("@product_price", txtPrice.Text);
                cmd.Parameters.AddWithValue("@manu_date", txtDate.Text);
                cmd.Parameters.AddWithValue("@product_remark", txtDesc.Text);
                cmd.Parameters.AddWithValue("@product_qty", txtQty.Text);
                cmd.Parameters.AddWithValue("@product_desc", txtName.Text);
                cmd.Parameters.AddWithValue("@stock_level", txtTarLevel.Text);
                cmd.Parameters.AddWithValue("@reorder_level", txtReordLevel.Text);
                cmd.ExecuteNonQuery();

                SqlCommand cmd2 = new SqlCommand("INSERT INTO isCategorisedInto VALUES((SELECT $node_id FROM Product WHERE product_id = @product_id), (SELECT $node_id FROM Category WHERE cat_id = @cat_id))", conn);
                cmd2.Parameters.AddWithValue("@product_id", txtId.Text);
                cmd2.Parameters.AddWithValue("@cat_id", ddlCat.SelectedValue);
                cmd2.ExecuteNonQuery();

                SqlCommand cmd3 = new SqlCommand("INSERT INTO isSuppliedBy VALUES((SELECT $node_id FROM Product WHERE product_id = @product_id), (SELECT $node_id FROM Supplier WHERE sup_id = @sup_id))", conn);
                cmd3.Parameters.AddWithValue("@product_id", txtId.Text);
                cmd3.Parameters.AddWithValue("@sup_id", ddlSup.SelectedValue);
                cmd3.ExecuteNonQuery();
                conn.Close();
                display();
        }
            catch(Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "alert('Error! The particular item may exist. Please change the item id or name.');", true);
        }
    }

        protected void ddlCat_SelectedIndexChanged(object sender, EventArgs e)
        {
            conn.Open();
            String query = "SELECT * FROM Product, isCategorisedInto, Category WHERE MATCH (Product-(isCategorisedInto)->Category) AND cat_id = @cat_id";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@cat_id", ddlCat.SelectedItem.Value);
            SqlDataReader reader = cmd.ExecuteReader();

            reader.Read();
            lblItemId.Text = ddlCat.SelectedItem.Value;
            reader.Close();
            conn.Close();
        }

        private void display()
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Information", "alert('Add item successfully');", true);
            lblName.Text = txtName.Text;
            lblItemId.Text = txtId.Text;
            lblCat.Text = ddlCat.SelectedItem.Text;
            lblReordLevel.Text = txtReordLevel.Text;
            lblTarLevel.Text = txtTarLevel.Text;
            lblQty.Text = txtQty.Text;
            lblPrice.Text = txtPrice.Text;
            lblSup.Text = ddlSup.SelectedItem.Text;
            lblDesc.Text = txtDesc.Text;
            lblDate.Text = txtDate.Text;
            txtName.Visible = false;
            txtId.Visible = false;
            ddlCat.Visible = false;
            txtReordLevel.Visible = false;
            txtTarLevel.Visible = false;
            txtQty.Visible = false;
            txtPrice.Visible = false;
            ddlSup.Visible = false;
            txtDesc.Visible = false;
            txtDate.Visible = false;

            Label1.Visible = false;
            lblName.Visible = true;
            lblItemId.Visible = true;
            lblCat.Visible = true;
            lblReordLevel.Visible = true;
            lblTarLevel.Visible = true;
            lblQty.Visible = true;
            lblPrice.Visible = true;
            lblSup.Visible = true;
            lblDesc.Visible = true;
            lblDate.Visible = true;

            btnAdd.Visible = false;
            btnCancel.Visible = false;
            btnBack.Visible = true;
        }
    }
}