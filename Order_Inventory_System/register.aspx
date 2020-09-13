<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Order_Inventory_System.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 47%;
            height: 229px;
        }
        .auto-style2 {
            width: 187px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Staff Register" Font-Size="X-Large"></asp:Label>
            <br />
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Username :</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Required="required"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Password :</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Required="required" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Position : </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>Manager</asp:ListItem>
                            <asp:ListItem>Staff</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Email :</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" Required="required"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Phone Number :</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" Required="required"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" OnClientClick = "alert('Successful Register!')"/>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>