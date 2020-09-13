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
    public partial class ViewRFQ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IkeaConnectionString"].ConnectionString);
            con.Open();

            //get ID from RFQhomepage
            int QID = int.Parse(Request.QueryString["Quotation ID"].ToString());


            // get Quotation details at top
            String str = "Select Q.QUOTATION_LIST_ID, S.username, Q.deliverDate,Q.createdDate,Q.deliveryAddress, P.product_id,P.product_desc, Q.QTY, Q.UOM,Q.PRICE, Q.QUOTATION_STATUS " +
                "FROM STAFF S, MAKE, QUOTATION Q, CONTAIN, Product P WHERE match(S - (MAKE)->Q - (CONTAIN)->P) AND Q.QUOTATION_LIST_ID = @QID ";

            SqlCommand cmd = new SqlCommand(str, con);
            cmd.Parameters.Add("@QID", SqlDbType.Int).Value = QID;

            SqlDataReader r = cmd.ExecuteReader();

            while (r.Read())
            {
                txtRFQ.Text = r[0].ToString();
                txtstaff.Text = r[1].ToString();
                txtDeliverOn.Text = r[2].ToString();
                txtCreated.Text = r[3].ToString();
                txtDeliverTo.Text = r[4].ToString();

                DateTime d = Convert.ToDateTime(txtDeliverOn.Text);
                txtDeliverOn.Text = d.ToShortDateString();
            }
            // bind product to gridview
            str = "Select P.product_id,P.product_desc, Q.QTY, Q.UOM,Q.PRICE, Q.QUOTATION_STATUS FROM STAFF S, MAKE, QUOTATION Q, CONTAIN, Product P " +
                "WHERE match(S - (MAKE)->Q - (CONTAIN)->P) AND Q.QUOTATION_LIST_ID = " + QID;

            DataSet ds = GetData(str);
            if (ds.Tables.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }

            con.Close();
        }
        DataSet GetData(String queryString)
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IkeaConnectionString"].ConnectionString);
            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(queryString, con);

            // Fill the DataSet.
            adapter.Fill(ds);
            con.Close();

            return ds;
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RFQhomepage.aspx");
        }

        protected void TxtRFQ(object sender, EventArgs e)
        {

        }

        protected void txtCreated_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtSup_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtDeliverOn_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtDeliverTo_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}