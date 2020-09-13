<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="deliveryInfo.aspx.cs" Inherits="Order_Inventory_System.deliveryInfo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <script src="jquery/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="jquery/datepicker.css">
    <script src="jquery/datepicker.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#<%=date.ClientID%>").datepicker({
                dateFormat: "dd/mm/yy",
                showOn: "both",
                changeMonth: true,
                changeYear: true,
                yearRange: "1950:2020",
                buttonImage: "image/calendar.jpg",
                buttonImageOnly: true,
            });
        });
    </script>

     <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 295px;
        }
        .auto-style3 {
            width: 247px;
        }
        </style>
    <div>
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align:right">
                        <br />
                         <br />
                        &nbsp;<asp:Label ID="Label2" runat="server" Text="Delivery Status :" Font-Size="Small" ></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text="Waiting" ForeColor="#CC0000" Font-Size="XX-Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style3">Customer Name:</td>
                                <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                </td>
                                <td>Order Date:</td>
                                <td>
                         <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Phone Number:</td>
                                <td class="auto-style2">
                                    <asp:Label ID="TextBox4" runat="server" Text=""></asp:Label>
                                </td>
                                <td>Delivery Date:</td>
                                <td>
                                    <asp:TextBox ID="date" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Address:</td>
                                <td class="auto-style2">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:TextBox ID="TextBox2" runat="server" Height="92px" Width="413px"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" style="text-align:right">
                                    <asp:Button ID="Button1" runat="server" Text="Submit" Height="35px" OnClick="Button1_Click" Width="88px" OnClientClick = "alert('Order is Pending!')" />
                                </td>

                            </tr>
                            <tr>
                                <td colspan="4" style="text-align:center">
                                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="4" style="text-align:center">
                                    <asp:Button ID="Button2" runat="server" Text="Back" Height="35px" Width="88px" PostBackUrl="~/Customer.aspx" Visible="False"/>
                                </td>

                            </tr>
                            </table>
                        <br />
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>