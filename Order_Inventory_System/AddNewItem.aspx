<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNewItem.aspx.cs" Inherits="Order_Inventory_System.AddNewItem" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        td{
            padding:10px;
            margin-right:100px;
        }
        .auto-style1 {
            width: 973px;
            height: 371px;
            font-size:16px;
        }
        .input{
             height:30px;
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
        .btn:hover, .btn2:hover{
            background-color:burlywood;
        }
        .auto-style3 {
            width: 167px;
        }
        .auto-style4 {
            width: 237px;
        }
    </style>
    <script type="text/Javascript">
        function confirm_cancel() {
            if (confirm("Do you confirm to give up current action? If YES, the system will redirect to previous page. ")) {
                window.location = "/Stocks.aspx";
            }
        }
    </script>
    <div style="border:inset; margin:90px;margin-top:50px">
            <fieldset style="margin:30px">
                <legend>New Item Details</legend>
            <table ID="Table1" runat="server" class="auto-style1">
            <tr>
                <td class="auto-style3">Item Name : </td>
                <td class="auto-style4">
                     <asp:TextBox ID="txtName" CssClass="input" runat="server" required="required"></asp:TextBox><asp:Label ID="lblName" runat="server" Text="" Visible="false"></asp:Label>                
                </td>
                <td class="auto-style3">&nbsp Category :</td>
                <td class="auto-style3">
                    <asp:DropDownList CssClass="input" ID="ddlCat" runat="server" DataSourceID="SqlDataSource1" DataTextField="cat_desc" DataValueField="cat_id" OnSelectedIndexChanged="ddlCat_SelectedIndexChanged"></asp:DropDownList>
                    <asp:Label ID="lblCat" runat="server" Text="" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Item ID : </td>
                <td class="auto-style4" style="padding-bottom:0px">
                    <asp:TextBox ID="txtId" CssClass="input" runat="server" required="required"></asp:TextBox><asp:Label ID="lblItemId" runat="server" Text="" Visible="false"></asp:Label>
                    <br/><asp:Label ID="Label1" runat="server" style="color:blue; font-size:14px" Text="(e.g. 'A001', 'B001', ...)"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp Current Quantity :</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtQty" CssClass="input" TextMode="Number" runat="server" min="1" required="required"></asp:TextBox><asp:Label ID="lblQty" runat="server" Text="" Visible="false"></asp:Label>
                </td>                
            </tr>
            <tr>
                <td class="auto-style3">Reorder Level : </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtReordLevel" CssClass="input" TextMode="Number" runat="server" min="1" required="required"></asp:TextBox><asp:Label ID="lblReordLevel" runat="server" Text="" Visible="false"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp Selling Price : </td>
                <td class="auto-style3">
                    RM <asp:TextBox ID="txtPrice" CssClass="input" runat="server" required="required"></asp:TextBox><asp:Label ID="lblPrice" runat="server" Text="" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Target Stock Level :  </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtTarLevel" CssClass="input" TextMode="Number" runat="server" min="1" required="required"></asp:TextBox><asp:Label ID="lblTarLevel" runat="server" Text="" Visible="false"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp Supplier : </td>
                <td class="auto-style3">
                    <asp:DropDownList CssClass="input" ID="ddlSup" runat="server" DataSourceID="SqlDataSource2" DataTextField="sup_name" DataValueField="sup_id"></asp:DropDownList>
                    <asp:Label ID="lblSup" runat="server" Text="" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Description :</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtDesc" CssClass="input" runat="server"></asp:TextBox>&nbsp;<asp:Label ID="lblDesc" runat="server" Text="" Visible="false"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp Manufacturing Date :  </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtDate" CssClass="input" TextMode="Date" runat="server" required="required"></asp:TextBox>&nbsp;<asp:Label ID="lblDate" runat="server" Text="" Visible="false"></asp:Label>
                </td>
            </tr>
            </table> 
            <br />
            <div style="text-align:center;margin-top:10px">
               <asp:Button ID="btnAdd" CssClass="btn" runat="server" Text="Add" OnClick="addItemButton_Click" />
               &nbsp;&nbsp;&nbsp;
               <asp:Button ID="btnCancel" CssClass="btn" runat="server" Text="Cancel" OnClientClick="confirm_cancel()"/>
               <asp:Button ID="btnBack" CssClass="btn2" runat="server" Text="Back to previous page" PostBackUrl="~/Stocks.aspx" Visible="false" />
            </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IkeaConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IkeaConnectionString %>" SelectCommand="SELECT * FROM [Supplier]"></asp:SqlDataSource>
        </fieldset>
        </div>
</asp:Content>