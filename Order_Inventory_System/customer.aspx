<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="customer.aspx.cs" Inherits="Order_Inventory_System.customer" %>

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

    <style>
        td{
            padding:10px;
        }
        .auto-style1 {
            width: 862px;
            height: 371px;
        }
    </style>

      <fieldset style="margin:50px">
     <legend>Enter Customer Details</legend>
        <div>
            <table class="auto-style1">
                <tr>
                    <td>Customer Name</td>
                    <td>
                        <asp:TextBox ID="cName" runat="server" Width="249px" Height="30px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Customer Phone Number</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="40px">
                            <asp:ListItem>010</asp:ListItem>
                            <asp:ListItem>011</asp:ListItem>
                            <asp:ListItem>012</asp:ListItem>
                            <asp:ListItem>013</asp:ListItem>
                            <asp:ListItem>014</asp:ListItem>
                            <asp:ListItem>015</asp:ListItem>
                            <asp:ListItem>016</asp:ListItem>
                            <asp:ListItem>017</asp:ListItem>
                            <asp:ListItem>018</asp:ListItem>
                            <asp:ListItem>019</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label1" runat="server" Text="-"></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server" Width="180px" Height="30px"></asp:TextBox>
                        <asp:Label ID="Label4" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Customer Email</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox3" runat="server" Width="249px" Height="30px"></asp:TextBox>
                        <asp:Label ID="Label3" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Order Date</td>
                    <td>
                        <asp:TextBox ID="date" runat="server" Width="249px" Height="30px"></asp:TextBox>
                        
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Cancel" PostBackUrl="~/Pagelink.aspx"/>
                        &nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" Text="Next" OnClick="Button1_Click" />
                        &nbsp;
                        <asp:Label ID="Label2" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
         </fieldset>
</asp:Content>