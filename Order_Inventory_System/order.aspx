<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="Order_Inventory_System.order" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div>
            <asp:Label ID="Label1" runat="server" Text="Pending Order" Font-Size="X-Large"></asp:Label>
            <br />
            <br />
            <table class="auto-style1">
               
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" Height="338px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" Width="637px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnRowCommand="GridView1_RowCommand" >
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="No" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                <asp:BoundField DataField="cusN" HeaderText="Customer Name" SortExpression="cusN" />
                                <asp:BoundField DataField="phoneN" HeaderText="Phone Number" SortExpression="phoneN" />
                                <asp:BoundField DataField="orderD" HeaderText="Order Date" SortExpression="orderD" />
                                <asp:BoundField DataField="deliveryD" HeaderText="Delivery Date" SortExpression="deliveryD" />
                                <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                                <asp:CommandField ShowSelectButton="True" SelectText="Ready" />
                            </Columns>
                            <EmptyDataTemplate>
                                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                     
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                        &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:memeConnectionString %>" SelectCommand="SELECT [Id], [cusN], [phoneN], [orderD], [deliveryD], [Status] FROM [Delivery]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    <br />
            <div >
                <asp:Button ID="Button1" runat="server" Text="Back to Menu" PostBackUrl="~/Pagelink.aspx"/>
        </div>
</asp:Content>