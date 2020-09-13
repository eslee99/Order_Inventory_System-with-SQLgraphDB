<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ViewRFQ.aspx.cs" Inherits="Order_Inventory_System.ViewRFQ" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server"> 
    <style type="text/css">
        .auto-style2 {
            width: 176px;
        }
    </style>    
    <div>
            <asp:Label ID="rfq_page" runat="server" Text="RFQ page"></asp:Label>
            <div id="vendor_info">
             <table>
              <tr>
                <td><asp:Label ID="rfq_id"  runat="server" Text="#RFQ ID:"></asp:Label></td><td><asp:TextBox ID="txtRFQ" Text=<%# Eval("Quotation_ID")%> runat="server" OnTextChanged="TxtRFQ" style="height: 29px" ReadOnly="True"></asp:TextBox></td>

                <td><asp:Label ID="lbl_staff" runat="server" Text="Created By:"></asp:Label></td><td><asp:TextBox ID="txtstaff" runat="server" OnTextChanged="TxtRFQ" style="height: 29px" ReadOnly="True"></asp:TextBox></td>

              </tr>

                <tr>
                <td><asp:Label ID="lblDate" runat="server" Text="Created On:"></asp:Label></td><td><asp:TextBox ID="txtCreated" runat="server" style="height: 29px" ReadOnly="True" OnTextChanged="txtCreated_TextChanged"></asp:TextBox></td>
                <td class="auto-style2"><asp:Label ID="lblDeliver" runat="server" Text="Deliver on:"></asp:Label></td><td><asp:TextBox ID="txtDeliverOn" runat="server" style="height: 29px" ReadOnly="True" OnTextChanged="txtDeliverOn_TextChanged"></asp:TextBox></td>
                <td><asp:Label ID="lblAddress" runat="server" Text="Delivery To:"></asp:Label></td><td><asp:TextBox ID="txtDeliverTo" runat="server" style="height: 29px" ReadOnly="True" OnTextChanged="txtDeliverTo_TextChanged"></asp:TextBox></td>
                </tr>
                </table>
            </div>

            <div id="item_info">
                <strong><asp:Label ID="lblItem" runat="server" Text="Item listing"></asp:Label></strong>
                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="1256px">
                <Columns>
                    <asp:BoundField DataField="product_id" HeaderText="Product ID" SortExpression="Product ID" />
                    <asp:BoundField DataField="product_desc" HeaderText="Product name" SortExpression="Product name" />
                    <asp:BoundField DataField="QTY" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="UOM" HeaderText="UOM" SortExpression="UOM" />
                    <asp:BoundField DataField="PRICE" HeaderText="Requested Price" SortExpression="Requested Price" />
                    <asp:BoundField DataField="QUOTATION_STATUS" HeaderText="QUOTATION_STATUS" SortExpression="QUOTATION_STATUS" />
                </Columns>
            </asp:GridView>
            </div>
            <asp:Button ID="btn_back" runat="server" Text="Back" OnClick="btn_back_Click" />
        </div>
</asp:Content>