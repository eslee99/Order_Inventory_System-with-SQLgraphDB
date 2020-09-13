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
    public partial class RFQ : System.Web.UI.Page
    {
        String staff;
        int ID = 0;
        public static List<Product> emptyDataList = new List<Product>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            { // page is loaded due to postback or first time?
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IkeaConnectionString"].ConnectionString);
                con.Open();

                // New quotation: set Quotation ID
                String s = "SELECT TOP 1 QUOTATION_LIST_ID FROM QUOTATION ORDER BY QUOTATION_LIST_ID DESC";

                SqlCommand cmd = new SqlCommand(s, con);
                SqlDataReader r = cmd.ExecuteReader();
                DateTime d = DateTime.Today;

                while (r.Read())
                {
                    ID = Convert.ToInt32(r["QUOTATION_LIST_ID"]);
                    ID++;
                }
                txtRFQ.Text = ID.ToString();
                txtDate.Text = d.ToShortDateString();
                con.Close();
            }
        }
        private DataTable GetData(string query)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }
        protected void OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //Find the DropDownList in the Repeater Item.
                DropDownList ddl_productdesc = (e.Item.FindControl("ddl_productdesc") as DropDownList);
                ddl_productdesc.DataSource = this.GetData("SELECT product_desc FROM Product");
                ddl_productdesc.DataTextField = "Product_desc";
                ddl_productdesc.DataValueField = "Product_desc";
                ddl_productdesc.DataBind();

                //Add Default Item in the DropDownList.
                ddl_productdesc.Items.Insert(0, new ListItem("Search Item desc"));
            }
        }
        protected void btn_add_Click(object sender, EventArgs e)
        {
            emptyDataList.Add(new Product());
            Repeater1.DataSource = emptyDataList;
            Repeater1.DataBind();
        }
        protected void btn_delete_Click(object sender, EventArgs e)
        {
            //precond
            if (emptyDataList.Count > 0)
            {
                int noOfRows = emptyDataList.Count;
                emptyDataList.RemoveAt(noOfRows - 1);
                Repeater1.DataSource = emptyDataList;
                Repeater1.DataBind();
            }
            else
            {
                // no more record
                lblMsg.Text = "no more record";
            }
        }
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            createRFQ();
            assignStaff();

        }
        public void assignStaff()
        {
            staff = ddl_staff.SelectedValue;
            int staff_id = 0;
            List<Int32> quotation_in_charged = new List<Int32>();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IkeaConnectionString"].ConnectionString);
            con.Open();

            /*  get STAFF ID   */
            String str = "select ID from STAFF where username = @s ";
            SqlCommand cmd = new SqlCommand(str, con);
            cmd.Parameters.Add("@s", SqlDbType.VarChar).Value = staff;
            SqlDataReader r = cmd.ExecuteReader();

            while (r.Read())
            {
                String test = r[0].ToString();
                staff_id = Convert.ToInt32(test);
            }
            con.Close();


            // get the unique quotation_id
            String str2 = " select QUOTATION_ID from QUOTATION where QUOTATION_LIST_ID = @qid";
            cmd = new SqlCommand(str2, con);
            cmd.Parameters.Add("@qid", SqlDbType.Int).Value = Convert.ToInt32(txtRFQ.Text.ToString());
            con.Open();
            r = cmd.ExecuteReader();

            while (r.Read())
            {
                int quot = Convert.ToInt32(r.GetInt32(0).ToString());
                quotation_in_charged.Add(quot);

            }
            con.Close();

            /*  STAFF --MAKE--> QUOTATION   */
            for (int j = 0; j < quotation_in_charged.Count; j++)
            {
                con.Open();
                String str3 = "INSERT INTO MAKE VALUES (" +
                    "(SELECT $node_id from STAFF where ID = @staff)," +
                    "(SELECT $node_id from QUOTATION where QUOTATION_ID = @qid))";

                cmd = new SqlCommand(str3, con);
                cmd.Parameters.Add("@staff", SqlDbType.Int).Value = staff_id;
                cmd.Parameters.Add("@qid", SqlDbType.Int).Value = quotation_in_charged[j];
                cmd.ExecuteNonQuery();
                con.Close();
            }
            quotation_in_charged.Clear();
        }
        public void createRFQ()
        {
            // QUOTATION -(CONTAIN)-> Product
            bool hasNextRecord = false;
            int QUOTATION_LIST_ID = 0;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IkeaConnectionString"].ConnectionString);

            foreach (RepeaterItem i in Repeater1.Items)
            {
                if (i.ItemType == ListItemType.Item || i.ItemType == ListItemType.AlternatingItem)
                {
                    TextBox pid = (TextBox)i.FindControl("txtLID");
                    TextBox name = (TextBox)i.FindControl("txtDesc");
                    TextBox qty = (TextBox)i.FindControl("txtQty");
                    TextBox uom = (TextBox)i.FindControl("txtUOM");
                    TextBox price = (TextBox)i.FindControl("txtPrice");

                    /*Add QUOTATION record, 
                     * LOOP to:
                     * 1.  Get QUOTATION_LIST_ID. If >1 record, use the same QUOTATION_LIST_ID
                     * 2.  Insert Products
                     * 3.  Create CONTAIN */
                    con.Open();
                    if (!hasNextRecord)
                    {
                        String s = "select QUOTATION_LIST_ID from QUOTATION where QUOTATION_ID = IDENT_CURRENT('QUOTATION')";
                        SqlCommand cmd_list = new SqlCommand(s, con);

                        SqlDataReader r = cmd_list.ExecuteReader();

                        while (r.Read())
                        {
                            QUOTATION_LIST_ID = Convert.ToInt32(r.GetInt32(0).ToString());
                            QUOTATION_LIST_ID++; // Generate new unique Q_list.ID
                        }
                    }
                    con.Close();
                    con.Open();
                    String str_insert = "insert into QUOTATION values (@listID ,@qty, @uom, @price,@deliver,@created,@address,@status)";
                    SqlCommand cmd = new SqlCommand(str_insert, con);
                    cmd.Parameters.Add("@listID", SqlDbType.Int).Value = QUOTATION_LIST_ID;
                    cmd.Parameters.Add("@qty", SqlDbType.Int).Value = Convert.ToInt32(qty.Text.ToString());
                    cmd.Parameters.Add("@uom", SqlDbType.VarChar).Value = uom.Text.ToString();
                    cmd.Parameters.Add("@price", SqlDbType.Decimal).Value = Convert.ToDouble(price.Text.ToString());
                    cmd.Parameters.Add("@deliver", SqlDbType.Date).Value = txtDeliver.Text.ToString();
                    cmd.Parameters.Add("@created", SqlDbType.Date).Value = txtDate.Text.ToString();
                    cmd.Parameters.Add("@address", SqlDbType.VarChar).Value = ddlAddress.SelectedValue;
                    cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = "Requesting";
                    cmd.ExecuteNonQuery();

                    //QUOTATION --CONTAIN--> Product 
                    String str = "INSERT INTO CONTAIN VALUES (" +
                        "(SELECT $node_id from QUOTATION where QUOTATION_ID = IDENT_CURRENT('QUOTATION'))," +
                        "(SELECT $node_id from Product where product_id = @p_id))";

                    cmd = new SqlCommand(str, con);
                    cmd.Parameters.Add("@p_id", SqlDbType.VarChar).Value = pid.Text.ToString();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    hasNextRecord = true;
                }
                emptyDataList.Clear();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('One quotation create successfully. The quotation is on REQUESTING status.');window.location ='/RFQ.aspx';", true);
            }
            return;
        }
        protected void Repeater1_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //Find the DropDownList in the Repeater Item.
                DropDownList ddl_productdesc = (e.Item.FindControl("ddl_productdesc") as DropDownList);
                ddl_productdesc.DataSource = this.GetData("SELECT product_desc FROM Product");
                ddl_productdesc.DataTextField = "Product_desc";
                ddl_productdesc.DataValueField = "Product_desc";
                ddl_productdesc.DataBind();

                //Add Default Item in the DropDownList.
                ddl_productdesc.Items.Insert(0, new ListItem("Search Item desc"));
            }
        }
        protected void TxtRFQ(object sender, EventArgs e)
        {

        }
        //<!--asp:DropDownList ID="ddl_productdesc" runat="server"></asp:DropDownList-->
        protected void ddl_vendor_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddl_staff_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtAddress_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TxtDate(object sender, EventArgs e)
        {

        }

        protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}

public class Product
{
    public int RFQ_ID { get; set; }
    public string ItemID { get; set; }
    public string Product_desc { get; set; }
    public int Qty { get; set; }
    public string UOM { get; set; }
    public double Price { get; set; }

    public Product()
    {
        this.ItemID = "";
        this.Price = 0.00;
        this.Qty = 0;
        this.UOM = "";
        this.RFQ_ID = 0;
        this.Product_desc = "";
    }
    public Product(int rid, string itemid, string p_desc, int qty, string uom, double p)
    {
        this.RFQ_ID = rid;
        this.ItemID = itemid;
        this.Price = p;
        this.Qty = qty;
        this.UOM = uom;
        this.Product_desc = p_desc;
    }
}