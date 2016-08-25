<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT products.cat_id, products.name, products.short_desc, products.long_desc, products.price, products.image, featuredProducts.feature, featuredProducts.saleprice FROM products LEFT OUTER JOIN featuredProducts ON products.prod_id = featuredProducts.prod_id ">
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" BackColor="#DEBA84" 
        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        CellSpacing="2" DataSourceID="SqlDataSource1" GridLines="Both">
        <EditItemTemplate>
            cat_id:
            <asp:TextBox ID="cat_idTextBox" runat="server" Text='<%# Bind("cat_id") %>' />
            <br />
            name:
            <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
            <br />
            short_desc:
            <asp:TextBox ID="short_descTextBox" runat="server" 
                Text='<%# Bind("short_desc") %>' />
            <br />
            long_desc:
            <asp:TextBox ID="long_descTextBox" runat="server" 
                Text='<%# Bind("long_desc") %>' />
            <br />
            price:
            <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
            <br />
            image:
            <asp:TextBox ID="imageTextBox" runat="server" Text='<%# Bind("image") %>' />
            <br />
            feature:
            <asp:TextBox ID="featureTextBox" runat="server" Text='<%# Bind("feature") %>' />
            <br />
            saleprice:
            <asp:TextBox ID="salepriceTextBox" runat="server" 
                Text='<%# Bind("saleprice") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            cat_id:
            <asp:TextBox ID="cat_idTextBox" runat="server" Text='<%# Bind("cat_id") %>' />
            <br />
            name:
            <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
            <br />
            short_desc:
            <asp:TextBox ID="short_descTextBox" runat="server" 
                Text='<%# Bind("short_desc") %>' />
            <br />
            long_desc:
            <asp:TextBox ID="long_descTextBox" runat="server" 
                Text='<%# Bind("long_desc") %>' />
            <br />
            price:
            <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
            <br />
            image:
            <asp:TextBox ID="imageTextBox" runat="server" Text='<%# Bind("image") %>' />
            <br />
            feature:
            <asp:TextBox ID="featureTextBox" runat="server" Text='<%# Bind("feature") %>' />
            <br />
            saleprice:
            <asp:TextBox ID="salepriceTextBox" runat="server" 
                Text='<%# Bind("saleprice") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            cat_id:
            <asp:Label ID="cat_idLabel" runat="server" Text='<%# Bind("cat_id") %>' />
            <br />
            name:
            <asp:Label ID="nameLabel" runat="server" Text='<%# Bind("name") %>' />
            <br />
            short_desc:
            <asp:Label ID="short_descLabel" runat="server" 
                Text='<%# Bind("short_desc") %>' />
            <br />
            long_desc:
            <asp:Label ID="long_descLabel" runat="server" Text='<%# Bind("long_desc") %>' />
            <br />
            price:
            <asp:Label ID="priceLabel" runat="server" Text='<%# Bind("price") %>' />
            <br />
            image:
            <asp:Label ID="imageLabel" runat="server" Text='<%# Bind("image") %>' />
            <br />
            feature:
            <asp:Label ID="featureLabel" runat="server" Text='<%# Bind("feature") %>' />
            <br />
            saleprice:
            <asp:Label ID="salepriceLabel" runat="server" Text='<%# Bind("saleprice") %>' />
            <br />

        </ItemTemplate>
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
    </asp:FormView>
</asp:Content>

