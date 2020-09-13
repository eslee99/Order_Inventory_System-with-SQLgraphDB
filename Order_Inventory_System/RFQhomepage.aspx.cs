using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Order_Inventory_System
{
    public partial class RFQhomepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txt_result_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
        }


        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // let staff press "Received" button
            if (e.CommandName == "Select")
            {
                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
                GridViewRow row = GridView2.Rows[rowIndex];

                // get value
                string RFQID = row.Cells[0].Text;
                string PID = row.Cells[1].Text;

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IkeaConnectionString"].ConnectionString);
                con.Open();

                String str = "select Q.QUOTATION_ID from Quotation Q,CONTAIN, Product P where match (Q-(CONTAIN)->P) AND " +
                    "Q.QUOTATION_LIST_ID = @RFQID AND P.product_id=@PID ";
                SqlCommand cmd = new SqlCommand(str, con);
                cmd.Parameters.Add("@RFQID", SqlDbType.Int).Value = Convert.ToInt32(RFQID);
                cmd.Parameters.Add("@PID", SqlDbType.VarChar).Value = PID;
                SqlDataReader r = cmd.ExecuteReader();

                String test = "";
                while (r.Read())
                {
                    test = r[0].ToString();
                }
                con.Close();
                con.Open();
                str = "update QUOTATION set QUOTATION_STATUS = 'Received' where QUOTATION_ID = @QID ";

                cmd = new SqlCommand(str, con);
                cmd.Parameters.Add("@QID", SqlDbType.Int).Value = Convert.ToInt32(test);
                cmd.ExecuteNonQuery();
                con.Close();


                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                   "alert(' The product " + PID + " has marked as received. ');window.location ='/RFQhomepage.aspx';", true);
            }

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }

    }
}