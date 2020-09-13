<%@ Page Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Stocks.aspx.cs" Inherits="Order_Inventory_System.Stocks" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .btn{
            width: 70px;
            height: 40px;
            font-size:14px;
            border:inset;
        }
        .btn2{
            width: 120px;
            height: 40px;
            font-size:14px;
            float:left;
            border:inset;
        }
        .btn:hover, .btn2:hover{
            background-color:burlywood;
        }
    </style>

 <div style="margin-top:30px;margin-bottom:30px">
    <asp:Button CssClass="btn2" ID="add" runat="server" Text="+ Add New Item" OnClick="addButton_Click" />
    <div style="float:right">
         <asp:TextBox ID="searchBox" runat="server"></asp:TextBox>
         <asp:Button CssClass="btn" ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" style="margin-left:20px" />
          <asp:Button CssClass="btn" ID="reset" runat="server" Text="Reset" OnClick="resetSearchButton_Click" style="margin-left:20px" />
    </div>
    <br />
    <br />
     <br />
     <asp:Label style="font-size:18px;color:blue;font-weight:bolder" ID="lblResult" runat="server" Visible="false" Text=""></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="text-align:center" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="1150px" Height="205px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="product_id" HeaderText="Item ID" ItemStyle-Height="50px" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<ItemStyle Height="50px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="product_desc" HeaderText="Item Name" />
            <asp:BoundField DataField="cat_desc" HeaderText="Category" />
            <asp:BoundField DataField="product_qty" HeaderText="Quantity In Stock" /> 
            <asp:BoundField DataField="product_price" HeaderText="Selling Price (RM)" />              
            <asp:BoundField DataField="reorder_level" HeaderText="Reorder Level" />
            <asp:BoundField DataField="stock_level" HeaderText="Target Stock Level" />         
            <asp:HyperLinkField Text="View Details" DataNavigateUrlFields="product_id, product_qty, reorder_level, stock_level, cat_id, sup_id" DataNavigateUrlFormatString="ViewItem.aspx?product_id={0}&product_qty={1}&reorder_level={2}&stock_level={3}&cat_id={4}&sup_id={5}" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" Height="50px" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black"  HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
</asp:GridView>
</div>
</asp:Content>