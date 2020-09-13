<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Order_Inventory_System._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <div class="jumbotron">
        <h1>MILLOS TRADING</h1>
        <p class="lead">The Best Choice of Furniture</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Stock Management</h2>
            <p><br/><br/>
                <h5><i class="fa fa-snowflake-o">&nbsp Add, Search, Update, Delete Stock Details..</i><br/><br/><i class="fa fa-snowflake-o">&nbsp View Stock In and Out Record..</i></h5>
                <br/><br/>
                <a class="btn btn-default" href="Stocks.aspx">Go To &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Request For Quotation</h2>
            <p><br/><br/>
                <h5><i class="fa fa-snowflake-o">&nbsp Create Request For Quotation And Purchase Order..</i><br/><br/><i class="fa fa-snowflake-o">&nbsp Purchase And Reorder Stock From Supplier..</i></h5>
                <br/><br/>
                <a class="btn btn-default" href="RFQhomepage.aspx">Go To &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Customer Order</h2>
            <p><br/><br/>
                <h5><i class="fa fa-snowflake-o">&nbsp Create Or Remove Customer Order..</i><br/><br/><i class="fa fa-snowflake-o">&nbsp Manage Stock Delivery For Customer Order..</i></h5>
                <br/><br/>
                <a class="btn btn-default" href="customer.aspx">Go To &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>