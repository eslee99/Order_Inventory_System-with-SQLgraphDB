<%@ Page Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="inputOrder.aspx.cs" Inherits="Order_Inventory_System.inputOrder" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
       <style type="text/css">
         td{
            padding:10px;
        }
        .auto-style1 {
            width: 862px;
            height: 371px;
        }
    </style>

    <div>

            <fieldset style="margin:100px">
             <legend>Enter New Order</legend>
            <table class="auto-style1" >
                <tr>
                    <td class="auto-style2">Order ID</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox1" runat="server" style="height: 22px" disabled="disabled"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Customer Name</td>
                    <td>
                        <asp:Label ID="lbName" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Order Date</td>
                    <td>
                        <asp:Label ID="lbOrderDate" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Product ID</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Press Enter" Font-Size="10pt" ForeColor="#006600"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Product Name</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox3" runat="server" disabled="disabled"></asp:TextBox>
                        <asp:TextBox ID="TextBox6" runat="server" Visible="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Product Price</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox4" runat="server" disabled="disabled"></asp:TextBox>
                        <asp:TextBox ID="TextBox7" runat="server" Visible="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Order Quantity</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblPrice" runat="server" Visible="False"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Continue" OnClick="Button2_Click" />
                    </td>
                </tr>
            </table>

            </fieldset>
        </div>
        <div style="margin:10px" >
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnDataBound="GridView1_DataBound" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" /> 
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <br /></div>
            <div style="text-align:center">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Cancel Order" />
                        &nbsp;
                        <asp:Button ID="Button3" runat="server" Text="Delivery Option" OnClientClick = "alert('Confirm Order!');"  PostBackUrl="~/deliveryInfo.aspx" OnClick="Button3_Click" style="height: 26px" />
        </div>
</asp:Content>