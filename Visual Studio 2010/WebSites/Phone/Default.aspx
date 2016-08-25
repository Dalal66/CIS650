<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT * FROM [categories] WHERE ([cat_id] = @cat_id) ORDER BY [name]">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="cat_id" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    Select a Category
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="cat_id">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT products.name, featuredProducts.feature, featuredProducts.saleprice, products.price, featuredProducts.prod_id FROM featuredProducts INNER JOIN products ON featuredProducts.prod_id = products.prod_id">
    </asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" BackColor="#DEBA84" 
        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        CellSpacing="2" DataKeyField="prod_id" DataSourceID="SqlDataSource1" 
        GridLines="Both" Height="218px" 
        onselectedindexchanged="DataList1_SelectedIndexChanged" Width="199px">
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <ItemTemplate>
            <asp:Label ID="ProdLabel" runat="server" Text='<%# Eval("prod_id") %>'></asp:Label>
            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("name") %>'></asp:Label>
            <asp:Label ID="FeatureLabel" runat="server" Text='<%# Eval("feature") %>'></asp:Label>
            <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("price", "{0:C}") %>'></asp:Label>
            <asp:Label ID="SalePriceLabel" runat="server" 
                Text='<%# Eval("saleprice", "{0:C}") %>'></asp:Label>
            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select">Details</asp:LinkButton>
            <br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
    <br />
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT products.prod_id, products.cat_id, products.name, products.short_desc, products.long_desc, products.price, products.image, featuredProducts.saleprice FROM products LEFT OUTER JOIN featuredProducts ON products.prod_id = featuredProducts.prod_id WHERE (products.cat_id=@cat_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="Motorola" 
                Name="cat_id" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="prod_id" DataSourceID="SqlDataSource3" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:ImageField DataImageUrlField="image" 
                DataImageUrlFormatString="~\image\{0}" HeaderText="Image">
            </asp:ImageField>
            <asp:BoundField DataField="name" HeaderText="Product" SortExpression="name" />
            <asp:BoundField DataField="short_desc" HeaderText="Description" 
                SortExpression="short_desc" />
            <asp:TemplateField HeaderText="Price" SortExpression="price">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("price", "{0:c}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Saleprice" SortExpression="saleprice">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("saleprice") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("saleprice", "{0:c}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField SelectText="View" ShowSelectButton="True" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
</asp:Content>

