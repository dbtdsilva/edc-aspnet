<%@ Page Title="Titles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Titles.aspx.cs" Inherits="EDC2015_Trabalho1.titles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Publication Type</h2>
    <asp:DropDownList CssClass="form-control" ID="ddlTypes" runat="server" AutoPostBack="true" DataSourceID="DropDownDataSource"
        DataTextField="type" DataValueField="type" AppendDataBoundItems="true">
        <asp:ListItem Text="All types" Value="" />
    </asp:DropDownList>
    <asp:SqlDataSource ID="DropDownDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:pubsConnectionString1 %>"
        SelectCommand="SELECT DISTINCT type FROM [titles]"></asp:SqlDataSource>
    <h2>Titles</h2>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-condensed table-hover" DataKeyNames="title_id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." GridLines="None" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="title_id" HeaderText="title_id" ReadOnly="True" SortExpression="title_id" />
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
            <asp:BoundField DataField="pub_id" HeaderText="pub_id" SortExpression="pub_id" />
            <asp:TemplateField HeaderText="Comandos">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" CssClass="fa fa-check-square-o"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
    </asp:GridView>
    <h2>Title details</h2>
    <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="SqlDataSource2" AutoGenerateRows="False" CssClass="table table-condensed table-hover" GridLines="None">
        <Fields>
            <asp:BoundField DataField="title_id" HeaderText="title_id" ReadOnly="True" SortExpression="title_id" />
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
            <asp:BoundField DataField="pub_id" HeaderText="pub_id" SortExpression="pub_id" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="advance" HeaderText="advance" SortExpression="advance" />
            <asp:BoundField DataField="royalty" HeaderText="royalty" SortExpression="royalty" />
            <asp:BoundField DataField="ytd_sales" HeaderText="ytd_sales" SortExpression="ytd_sales" />
            <asp:TemplateField HeaderText="notes" SortExpression="notes">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("notes") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("notes") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="pubdate" HeaderText="pubdate" SortExpression="pubdate" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pubsConnectionString1 %>"
       ProviderName="<%$ ConnectionStrings:pubsConnectionString1.ProviderName %>"
        SelectCommand="SELECT [title_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate] FROM [titles]"
        FilterExpression="type = '{0}'">
        <FilterParameters>
            <asp:ControlParameter Name="type" ControlID="ddlTypes" PropertyName="SelectedValue" />
        </FilterParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pubsConnectionString1 %>"
        ProviderName="<%$ ConnectionStrings:pubsConnectionString1.ProviderName %>"
        SelectCommand="SELECT [title_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate] FROM [titles] WHERE [title_id] = @title_id"
        UpdateCommand="UPDATE [titles] SET [title] = @title, [type] = @type, [pub_id] = @pub_id, [price] = @price, [advance] = @advance, [royalty] = @royalty, [ytd_sales] = @ytd_sales, [notes] = @notes, [pubdate] = @pubdate WHERE [title_id] = @title_id">
        <SelectParameters>
            <asp:ControlParameter Name="title_id" Type="String" ControlID="GridView1"/>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="type" Type="String" />
            <asp:Parameter Name="pub_id" Type="String" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="advance" Type="Decimal" />
            <asp:Parameter Name="royalty" Type="Int32" />
            <asp:Parameter Name="ytd_sales" Type="Int32" />
            <asp:Parameter Name="notes" Type="String" />
            <asp:Parameter Name="pubdate" Type="DateTime"  />
            <asp:Parameter Name="title_id" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
