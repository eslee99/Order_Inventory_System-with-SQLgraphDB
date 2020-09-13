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
    public partial class ViewItem : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IkeaConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            int qty = int.Parse(Request.QueryString["product_qty"].ToString());
            int reorderlvl = int.Parse(Request.QueryString["reorder_level"].ToString());
            int targetlvl = int.Parse(Request.QueryString["stock_level"].ToString());
            if (qty <= reorderlvl)
            {
                ((Label)DataList1.Items[0].FindControl("lblQty")).Style.Add("color", "red");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The in-stock number is reached the min level. Please reorder it...')", true);
                ((Button)DataList1.Items[0].FindControl("btnReplenish")).Visible = true;
            }
            else if(qty == targetlvl){
                ((Button)DataList1.Items[0].FindControl("btnReplenish")).Visible = false;
            }
            else
            {
                ((Button)DataList1.Items[0].FindControl("btnReplenish")).Visible = true;
            }
        }

        protected void MakeSession()
        {
            HttpContext.Current.Session["Id"] = ((Label)DataList1.Items[0].FindControl("lblItemId")).Text;
            HttpContext.Current.Session["ProductName"] = ((Label)DataList1.Items[0].FindControl("lblItemName")).Text;
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int chkQty = int.Parse(((Label)DataList1.Items[0].FindControl("lblQty")).Text);
            if(chkQty == int.Parse(Request.QueryString["stock_level"].ToString()))
            {
                ((Button)DataList1.Items[0].FindControl("btnReplenish")).Visible = false;
            }
            if (e.CommandName == "ManageDetail")
            {
                ((TextBox)DataList1.Items[0].FindControl("txtReordLevel")).Visible = true;
                ((TextBox)DataList1.Items[0].FindControl("txtTarLevel")).Visible = true;
                ((TextBox)DataList1.Items[0].FindControl("txtPrice")).Visible = true;
                ((TextBox)DataList1.Items[0].FindControl("txtDesc")).Visible = true;
                ((Label)DataList1.Items[0].FindControl("lblMinLevel")).Visible = false;
                ((Label)DataList1.Items[0].FindControl("lblMaxLevel")).Visible = false;
                ((Label)DataList1.Items[0].FindControl("lblPrice")).Visible = false;
                ((Label)DataList1.Items[0].FindControl("lblDesc")).Visible = false;
                ((Button)DataList1.Items[0].FindControl("btnEdit")).Visible = true;
                ((Button)DataList1.Items[0].FindControl("btnCancel")).Visible = true;
                ((Button)DataList1.Items[0].FindControl("btnManage")).Visible = false;
                ((Button)DataList1.Items[0].FindControl("btnBack")).Visible = false;
            }
            else if (e.CommandName == "DeleteItem")
            {
                conn.Open();                
                SqlCommand cmdDelete1 = new SqlCommand("DELETE isCategorisedInto FROM Product, isCategorisedInto, Category" +
                    " WHERE MATCH(Product-(isCategorisedInto)->Category) AND product_id = @product_id AND cat_id = @cat_id", conn);
                cmdDelete1.Parameters.AddWithValue("@product_id", Request.QueryString["product_id"].ToString());
                cmdDelete1.Parameters.AddWithValue("@cat_id", Request.QueryString["cat_id"].ToString());
                cmdDelete1.ExecuteNonQuery();

                SqlCommand cmdDelete2 = new SqlCommand("DELETE isSuppliedBy FROM Product, isSuppliedBy, Supplier" +
                    " WHERE MATCH(Product-(isSuppliedBy)->Supplier) AND product_id = @product_id AND sup_id = @sup_id", conn);
                cmdDelete2.Parameters.AddWithValue("@product_id", Request.QueryString["product_id"].ToString());
                cmdDelete2.Parameters.AddWithValue("@sup_id", Request.QueryString["sup_id"].ToString());
                cmdDelete2.ExecuteNonQuery();

                SqlCommand cmdDelete3 = new SqlCommand("Delete From Product WHERE product_id = @product_id", conn);
                cmdDelete3.Parameters.AddWithValue("@product_id", ((Label)DataList1.Items[0].FindControl("lblItemId")).Text);
                cmdDelete3.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script language='javascript'>alert('Delete item successfully... The system will redirect to stock list.');window.location='/Stocks.aspx';</script>");
            }
            else 
            {
                if (e.CommandName == "EditDetail")
                {                    
                    conn.Open();
                    SqlCommand cmdUpdate = new SqlCommand("Update Product set product_price = @product_price, stock_level = @stock_level, reorder_level = @reorder_level, " +
                        "product_remark = @product_remark WHERE product_id = @product_id", conn);
                    cmdUpdate.Parameters.AddWithValue("@product_price", ((TextBox)DataList1.Items[0].FindControl("txtPrice")).Text);
                    cmdUpdate.Parameters.AddWithValue("@stock_level", ((TextBox)DataList1.Items[0].FindControl("txtTarLevel")).Text);
                    cmdUpdate.Parameters.AddWithValue("@reorder_level", ((TextBox)DataList1.Items[0].FindControl("txtReordLevel")).Text);
                    cmdUpdate.Parameters.AddWithValue("@product_remark", ((TextBox)DataList1.Items[0].FindControl("txtDesc")).Text);
                    cmdUpdate.Parameters.AddWithValue("@product_id", ((Label)DataList1.Items[0].FindControl("lblItemId")).Text);
                    cmdUpdate.ExecuteNonQuery();
                    conn.Close();

                    ((Label)DataList1.Items[0].FindControl("lblPrice")).Text = ((TextBox)DataList1.Items[0].FindControl("txtPrice")).Text;
                    ((Label)DataList1.Items[0].FindControl("lblMinLevel")).Text = ((TextBox)DataList1.Items[0].FindControl("txtReordLevel")).Text;
                    ((Label)DataList1.Items[0].FindControl("lblMaxLevel")).Text = ((TextBox)DataList1.Items[0].FindControl("txtTarLevel")).Text;
                    ((Label)DataList1.Items[0].FindControl("lblDesc")).Text = ((TextBox)DataList1.Items[0].FindControl("txtDesc")).Text;
                    ((Button)DataList1.Items[0].FindControl("btnReplenish")).Visible = false;
                    Response.Write("<script language='javascript'>alert('Edit item successfully... ');</script>");
                }
                ((TextBox)DataList1.Items[0].FindControl("txtReordLevel")).Visible = false;
                ((TextBox)DataList1.Items[0].FindControl("txtTarLevel")).Visible = false;
                ((TextBox)DataList1.Items[0].FindControl("txtPrice")).Visible = false;
                ((TextBox)DataList1.Items[0].FindControl("txtDesc")).Visible = false;
                ((Label)DataList1.Items[0].FindControl("lblMinLevel")).Visible = true;
                ((Label)DataList1.Items[0].FindControl("lblMaxLevel")).Visible = true;
                ((Label)DataList1.Items[0].FindControl("lblPrice")).Visible = true;
                ((Label)DataList1.Items[0].FindControl("lblDesc")).Visible = true;
                ((Button)DataList1.Items[0].FindControl("btnEdit")).Visible = false;
                ((Button)DataList1.Items[0].FindControl("btnCancel")).Visible = false;
                ((Button)DataList1.Items[0].FindControl("btnManage")).Visible = true;
                ((Button)DataList1.Items[0].FindControl("btnBack")).Visible = true;
                ((Button)DataList1.Items[0].FindControl("btnReplenish")).Visible = true;
            }
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            Repeater repTrans = (Repeater)e.Item.FindControl("rptTransaction");
            conn.Open();
            String selectCmd = "SELECT * FROM StockMovement WHERE stock_id = @stock_id";
            SqlCommand cmd = new SqlCommand(selectCmd, conn);
            cmd.Parameters.AddWithValue("@stock_id", ((Label)e.Item.FindControl("lblItemId")).Text);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            repTrans.DataSource = ds;
            repTrans.DataBind();
            conn.Close();
        }

        protected void btnReplenish_Click(object sender, EventArgs e)
        {
            MakeSession();
        }
    }
}