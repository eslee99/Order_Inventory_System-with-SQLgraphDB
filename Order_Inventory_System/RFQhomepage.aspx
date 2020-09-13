<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="RFQhomepage.aspx.cs" Inherits="Order_Inventory_System.RFQhomepage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">     
    <style type="text/css">
        .auto-style1 {
            margin-right: 0px;
        }
    </style>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Request for Quotation (RFQ)"></asp:Label></br></br>
            <strong><asp:Label ID="Label2" runat="server" Text="Products to be received on TODAY: "></asp:Label></strong></br></br>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="1256px" onrowcommand="GridView2_RowCommand">
                <Columns>
                    <asp:BoundField DataField="#ID" HeaderText="#ID" SortExpression="#ID" />
                    <asp:BoundField DataField="Product ID" HeaderText="Product ID" SortExpression="Product ID" />
                    <asp:BoundField DataField="Product name" HeaderText="Product name" SortExpression="Product name" />
                    <asp:BoundField DataField="Deliver To" HeaderText="Deliver To" SortExpression="Deliver To" />
                    <asp:BoundField DataField="QTY" HeaderText="QTY" SortExpression="QTY" />
                    <asp:BoundField DataField="UOM" HeaderText="UOM" SortExpression="UOM" />
                    <asp:BoundField DataField="QUOTATION_STATUS" HeaderText="QUOTATION_STATUS" SortExpression="QUOTATION_STATUS" />
                    <asp:TemplateField>
                <HeaderTemplate>
                    Received?
                    </HeaderTemplate>
                <ItemTemplate>
                    <asp:Button ID="btnReceived" CommandName="Select" Text="Received" runat="server" CommandArgument="<%# Container.DataItemIndex %>"/>
                </ItemTemplate>
            </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IkeaConnectionString %>" 
                SelectCommand="select Q.QUOTATION_LIST_ID AS [#ID], P.product_id AS [Product ID], P.product_desc AS [Product name], Q.deliveryAddress AS [Deliver To], Q.QTY,Q.UOM, Q.QUOTATION_STATUS 
from STAFF S, MAKE, QUOTATION Q, CONTAIN, Product P
where match(S-(MAKE)-&gt;Q-(CONTAIN)-&gt;P ) AND Q.deliverDate = FORMAT (getdate(), 'yyyy-MM-dd ')  AND Q.QUOTATION_STATUS = 'Requesting'">
            </asp:SqlDataSource>
        </div>

    <table>
    <tr><td><asp:Label ID="search" runat="server" Text="Search.."></asp:Label></td><td><asp:TextBox ID="txt_result" runat="server" OnTextChanged="txt_result_TextChanged"></asp:TextBox></td><td><asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" /></td><td><asp:Button ID="Button2" runat="server" Text="Create RFQ" OnClick="Button1_Click" PostBackUrl="~/RFQ.aspx" /></td></tr>

    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="1261px" CssClass="auto-style1" onrowcommand="GridView1_RowCommand">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Quotation ID" HeaderText="Quotation ID" SortExpression="Quotation ID" />
            <asp:BoundField DataField="Requested by" HeaderText="Requested by" SortExpression="Requested by" />
            <asp:BoundField DataField="Created Date" HeaderText="Created Date" SortExpression="Created Date" ReadOnly="True" />
            <asp:BoundField DataField=" Delivery Date" HeaderText=" Delivery Date" SortExpression=" Delivery Date" ReadOnly="True" />
            <asp:BoundField DataField="Deliver To" HeaderText="Deliver To" SortExpression="Deliver To" />
            
            <asp:HyperLinkField Text="View Details" DataNavigateUrlFields="Quotation ID"  DataNavigateUrlFormatString="ViewRFQ.aspx?Quotation ID={0}" />
            
           
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IkeaConnectionString %>" SelectCommand="select distinct top 10000 Q.QUOTATION_LIST_ID as [Quotation ID], S.username as [Requested by], FORMAT(Q.createdDate,'dd/MM/yyyy') as [Created Date] , FORMAT(Q.deliverDate,'dd/MM/yyyy') as[ Delivery Date] ,Q.deliveryAddress as [Deliver To]
from QUOTATION Q, STAFF S,MAKE
where match (S-(MAKE)-&gt;Q)"></asp:SqlDataSource>
        <br />
</asp:Content>
