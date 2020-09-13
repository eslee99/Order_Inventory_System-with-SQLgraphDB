<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Order_Inventory_System.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 44%;
            height: 73px;
        }
        .auto-style2 {
            width: 179px;
        }

        .regBtn{
           border:none;
           	outline:none;
           background-color:inherit;
           text-decoration:underline;
           font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; 
           font-size:12px;
	        cursor:pointer;
       }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Staff Login" Font-Size="X-Large"></asp:Label>
            <br />
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Username : </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Password :</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Invalid username or password" Font-Size="Small" ForeColor="Red" Visible="False"></asp:Label>
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                        <br />
                        <br />
                        <asp:Button ID="registerBtn" runat="server" Text="Register Now !" CssClass="regBtn" OnClick="registerBtn_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
