<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="RFQ.aspx.cs" Inherits="Order_Inventory_System.RFQ" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server"> 
    <style type="text/css">
        .auto-style1 {
            margin-top: 0px;
        }
    </style>
        <div>
            <asp:Label ID="rfq_page" runat="server" Text="RFQ page"></asp:Label>
            <div id="vendor_info">
             <table>
              <tr>
                <td><asp:Label ID="rfq_id" runat="server" Text="#RFQ ID:"></asp:Label><asp:TextBox ID="txtRFQ" runat="server" OnTextChanged="TxtRFQ" style="height: 29px" ReadOnly="True"></asp:TextBox></td>
                <td><asp:Label ID="lbl_supplier" runat="server" Text="Supplier:"></asp:Label></td><td><asp:DropDownList ID="ddl_vendor" runat="server" DataSourceID="SqlDataSource1" DataTextField="sup_name" DataValueField="sup_name" OnSelectedIndexChanged="ddl_vendor_SelectedIndexChanged"></asp:DropDownList></td>
                <td><asp:Label ID="lbl_staff" runat="server" Text="Created By:"></asp:Label></td><td><asp:DropDownList ID="ddl_staff" runat="server" DataSourceID="SqlDataSource2" DataTextField="username" DataValueField="username" OnSelectedIndexChanged="ddl_staff_SelectedIndexChanged"></asp:DropDownList></td>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IkeaConnectionString %>" SelectCommand="SELECT [sup_name] FROM [Supplier]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IkeaConnectionString %>" SelectCommand="SELECT [username] FROM [STAFF]"></asp:SqlDataSource>
              </tr>

                <tr>
                <td><asp:Label ID="lblDate" runat="server" Text="Created On:"></asp:Label><asp:TextBox ID="txtDate" runat="server" OnTextChanged="TxtDate" style="height: 29px" ReadOnly="True"></asp:TextBox></td>
                <td><asp:Label ID="lblDeliver" runat="server" Text="Deliver on:"></asp:Label><asp:TextBox ID="txtDeliver" runat="server" OnTextChanged="TxtDate" style="height: 29px"></asp:TextBox></td>
                <td><asp:Label ID="lblAddress" runat="server" Text="Delivery To:"></asp:Label><asp:DropDownList ID="ddlAddress" runat="server" OnSelectedIndexChanged="ddl_SelectedIndexChanged">
                    <asp:ListItem>Cheras Warehouse</asp:ListItem>
                    <asp:ListItem>Bukit Mertajam Warehouse</asp:ListItem>
                    <asp:ListItem>Batu Pahat Warehouse</asp:ListItem>
                    </asp:DropDownList></td>
                </tr>
                </table>
            </div>

            <div id="item_info">
                <asp:Label ID="lblItem" runat="server" Text="Item listing"></asp:Label>
                <asp:Button ID="btn_add" runat="server" Text="Add row" OnClick="btn_add_Click" />
                <asp:Button ID="btn_delete" runat="server" Text="Delete row" OnClick="btn_delete_Click" />
                <asp:Label ID="lblMsg" runat="server" Text="System Message: "></asp:Label>
                    <asp:Repeater runat="server" ID="Repeater1" OnItemCommand="Repeater1_ItemCommand1">
                    <HeaderTemplate>
                        <div class="container">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Item ID</th>
                                        <th>Item name</th>
                                        <th>Quantity</th>
                                        <th>UOM</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                    </HeaderTemplate>
                    <ItemTemplate>

                        <tr>
                            <td>
                                <asp:TextBox runat="server" ID="txtNo" Text="<%#Container.ItemIndex+1 %>" />
                                
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtLID" Text='<%# Eval("ItemID") %>' />
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtDesc" Text='<%# Eval("Product_desc") %>' />
                                
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtQty" Text='<%# Eval("Qty") %>' />
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtUOM" Text='<%# Eval("UOM") %>' />
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtPrice" Text='<%# Eval("Price") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>

                    <FooterTemplate>
                       
                </table>
                    </div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <asp:Button ID="btn_submit" runat="server" Text="Submit Quotation" OnClick="btn_submit_Click" />
            <asp:Button ID="Button1" runat="server" Text="Back" OnClick="btn_submit_Click" PostBackUrl="~/RFQhomepage.aspx" />
        </div>
</asp:Content>