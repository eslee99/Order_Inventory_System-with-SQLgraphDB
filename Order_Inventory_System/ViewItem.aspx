<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewItem.aspx.cs" Inherits="Order_Inventory_System.ViewItem" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .ta{
            height:50px;
            width:250px;
            font-size:16px
        }
        .detail{
            padding-left:10px;
            font-weight:bolder;
        }
        .template {
            height: 200px;
            overflow-y: scroll;
        }
        .btn{
            width: 100px;
            height: 40px;
            font-size:14px;
            border:inset;
        }
        .btn2{
            width: 200px;
            height: 40px;
            font-size:14px;
            border:inset;
        }
         .btn3{           
            font-size:14px;
        }
        .btn:hover, .btn2:hover, .btn3:hover{
            background-color:burlywood;
        }
    </style>

    <script type="text/Javascript">
        function confirm_proceed() {
            if (confirm("Do you confirm proceed to make stock replenishment? If YES, the system will redirect to stock purchase page")) {
                window.location="/RFQ.aspx";
            }
        }
    </script>

    <div style="margin:150px; margin-top:80px">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">
         <ItemTemplate>
             <div style="text-align:center;margin-bottom:10px">
                 <div style="float:right; margin-bottom:10px">
                        <asp:Button CssClass="btn" ID="Button2" runat="server" Text="Delete Item" CommandName="DeleteItem" />
                 </div>
             </div>
            <table border="1" style="width:900px">                
            <tr style="background-color:black">
                <td class="ta" colspan="2">
                     <asp:Label ID="lblItemName" runat="server" Text='<%# Eval("product_desc")%>' CssClass="lbl" style="color:white;font-size:20px;font-weight:bolder;padding-left:10px;"></asp:Label>                       
                </td>
            </tr>
            <tr>
                <td class="ta">
                    <span class="detail">Item ID :</span>&nbsp;<asp:Label ID="lblItemId" runat="server" Text='<%# Eval("product_id")%>' CssClass="lbl"></asp:Label>                    
                </td>
                <td class="ta">
                     <span class="detail">Category :</span>&nbsp; <asp:Label ID="lblCat" runat="server" Text='<%# Eval("cat_desc")%>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="ta">                     
                    <span class="detail">Selling Price :</span>&nbsp; RM <asp:TextBox ID="txtPrice" runat="server" Visible="false" Text='<%# Eval("product_price")%>' required="required"></asp:TextBox><asp:Label ID="lblPrice" runat="server" Text='<%# Eval("product_price")%>'></asp:Label>
                </td>
                <td class="ta">
                    <span class="detail">Reorder Level :</span>&nbsp; <asp:TextBox ID="txtReordLevel" runat="server" Visible="false" Text='<%# Eval("reorder_level")%>' TextMode="Number" required="required"></asp:TextBox><asp:Label ID="lblMinLevel" runat="server" Text='<%# Eval("reorder_level")%>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="ta">
                   <span class="detail">Manufacture Date :</span>&nbsp; <asp:Label ID="lblDate" runat="server" Text='<%# Eval("manu_date", "{0:dd-MMM-yyyy}")%>'></asp:Label>
                </td>
                <td class="ta">
                    <span class="detail">Target Stock Level :</span>&nbsp; <asp:TextBox ID="txtTarLevel" runat="server" Visible="false" Text='<%# Eval("stock_level")%>' TextMode="Number" required="required"></asp:TextBox><asp:Label ID="lblMaxLevel" runat="server" Text='<%# Eval("stock_level")%>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="ta">
                    <span class="detail">Supplier :</span>&nbsp; <asp:Label ID="lblSup" runat="server" Text='<%# Eval("sup_name")%>'></asp:Label>
                </td>
                <td class="ta">
                    <span class="detail">Description :</span>
                    &nbsp;<asp:TextBox ID="txtDesc" runat="server" Width="300px" Visible="false" Text='<%# Eval("product_remark")%>'></asp:TextBox><asp:Label ID="lblDesc" runat="server" Text='<%# Eval("product_remark")%>'></asp:Label>                           
                </td>
            </tr>
            <tr>
                 <td class="ta" colspan="2">
                    <span class="detail">Quantity In Stock :</span>
                    &nbsp<asp:Label style="font-weight:bolder" ID="lblQty" runat="server" Text='<%# Eval("product_qty")%>'></asp:Label>
                     &nbsp&nbsp&nbsp<asp:Button ID="btnReplenish" CssClass="btn3" runat="server" Text="Replenish Stock" onmousedown="return confirm_proceed();" OnClick="btnReplenish_Click"/>
                 </td>
            </tr>
            <tr class="rowTransaction" Visible="false">
                <td colspan="2">
                    <br/>
                   <asp:Label runat="server" CssClass="ta" style="font-weight:bolder; padding-left:10px">Stock In and Out Records :</asp:Label>
                   <div style="margin-left:20px;width:860px">                         
                   <table style="border-top:inset;border-bottom:outset; margin-top:10px">
                         <tr>
                            <td style="padding-right:280px;font-size:15px">Date</td><td style="padding-right:140px;font-size:15px">Quantity</td><td style="padding:10px;padding-right:180px;padding-left:100px;font-size:15px">Status</td>
                        </tr>
                   </table><br/>
                    <div class="template">
                    <asp:Repeater ID="rptTransaction" runat="server" Visible="true">                        
                        <ItemTemplate>                                                      
                            <asp:Label style="font-size:15px" ID="Label3" runat="server" Text='<%# Eval("mov_date" , "{0:dd-MMM-yyyy}")%>'></asp:Label>  
                            <asp:Label style="padding-left:240px;font-size:15px" ID="Label2" runat="server" Text='<%# Eval("mov_qty")%>'></asp:Label>
                            <asp:Label style="padding-left:280px;font-size:15px" ID="Label1" runat="server" Text='<%# Eval("status")%>' Visible="true"></asp:Label>
                            <hr/>
                        </ItemTemplate>                          
                    </asp:Repeater>
                    </div>
                       <br/>
                     </div> 
                </td>
            </tr>
            </table>   
             <div style="text-align:center;margin-top:10px">
             <asp:Button CssClass="btn2" ID="btnBack" runat="server" Text="Back to previous page" PostBackUrl="~/Stocks.aspx" />
             <asp:Button CssClass="btn" ID="btnManage" runat="server" Text="Manage" CommandName="ManageDetail" />
             <asp:Button CssClass="btn" ID="btnEdit" runat="server" Text="Edit" CommandName="EditDetail" Visible="false" />
               &nbsp;&nbsp;&nbsp;
             <asp:Button CssClass="btn" ID="btnCancel" runat="server" Text="Cancel" CommandName="CancelEdit" Visible="false" />
             </div>             
          </ItemTemplate>
      </asp:DataList>
      </div>      
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IkeaConnectionString %>" SelectCommand="SELECT * FROM Product, isCategorisedInto, isSuppliedBy, Category, Supplier WHERE MATCH (Product-(isCategorisedInto)-&gt;Category AND Product-(isSuppliedBy)-&gt;Supplier) AND product_id=@product_id">
        <SelectParameters>
            <asp:QueryStringParameter Name="product_id" QueryStringField="product_id" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
