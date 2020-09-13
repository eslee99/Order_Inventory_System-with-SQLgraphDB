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
    public partial class order : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IkeaConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            for (int rowIndex = GridView1.Rows.Count - 2; rowIndex >= 0; rowIndex--)
            {
                GridViewRow gvRow = GridView1.Rows[rowIndex];
                GridViewRow gvNextRow = GridView1.Rows[rowIndex + 1];


                if (gvRow.Cells[0].Text == gvNextRow.Cells[0].Text)
                {
                    if (gvNextRow.Cells[0].RowSpan < 2)
                    {
                        gvRow.Cells[0].RowSpan = 2;
                    }
                    else
                    {
                        gvRow.Cells[0].RowSpan = gvNextRow.Cells[0].RowSpan + 1;
                    }
                    gvNextRow.Cells[0].Visible = false;
                }

            }



        }


        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridViewRow gvRow = GridView1.SelectedRow;

            String updateData = "Update Delivery set status='Shipping' where Id =" + gvRow.Cells[0].Text;
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = updateData;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();

            Response.Redirect("order.aspx");

        }

        protected void Button2_Click1(object sender, EventArgs e)
        {


        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click2(object sender, EventArgs e)
        {


        }
    }
}