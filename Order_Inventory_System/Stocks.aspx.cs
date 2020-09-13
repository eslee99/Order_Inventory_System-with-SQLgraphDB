using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Order_Inventory_System
{
    public partial class Stocks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //to make sure the data isn't loaded in postback
            if (!Page.IsPostBack)
            {
                //use a datatable for storing all the data
                DataTable dt = new DataTable();
                string query = "SELECT * FROM Product, isCategorisedInto, Category,  isSuppliedBy, Supplier WHERE MATCH (Product-(isCategorisedInto)->Category AND Product-(isSuppliedBy)->Supplier) ORDER BY Product_Id";

                //wrapping in 'using' means the connection is closed an disposed when done
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IkeaConnectionString"].ConnectionString);
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                //fill the datatable with the contents from the database
                adapter.Fill(dt);

                //save the datatable into a viewstate for later use
                ViewState["myViewState"] = dt;

                //bind the datasource to the gridview
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            string searchTerm = searchBox.Text.ToLower();
            int count = 0;
            //check if the search input is at least 2 chars
            if (searchTerm.Length >= 2)
            {
                //always check if the viewstate exists before using it
                if (ViewState["myViewState"] == null)
                    return;

                //cast the viewstate as a datatable
                DataTable dt = ViewState["myViewState"] as DataTable;

                //make a clone of the datatable
                DataTable dtNew = dt.Clone();

                //search the datatable for the correct fields
                foreach (DataRow row in dt.Rows)
                {
                    //add your own columns to be searched here
                    if (row["product_id"].ToString().ToLower().Contains(searchTerm) || row["product_desc"].ToString().ToLower().Contains(searchTerm))
                    {
                        //when found copy the row to the cloned table
                        dtNew.Rows.Add(row.ItemArray);
                        count++;
                    }
                }

                //rebind the grid
                GridView1.DataSource = dtNew;
                GridView1.DataBind();

                lblResult.Visible = true;
                if(count != 0)
                    lblResult.Text = "Total Search Results Match : " + count + " rows <br/>";
                else
                    lblResult.Text = "No Record Found... <br/>";
            }
        }


        protected void resetSearchButton_Click(object sender, EventArgs e)
        {
            //always check if the viewstate exists before using it
            if (ViewState["myViewState"] == null)
                return;

            //cast the viewstate as a datatable
            DataTable dt = ViewState["myViewState"] as DataTable;

            //rebind the grid
            GridView1.DataSource = dt;
            GridView1.DataBind();

            lblResult.Visible = false;
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddNewItem.aspx");
        }
    }
}