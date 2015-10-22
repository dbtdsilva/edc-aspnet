<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="EDC2015_Trabalho2.Courses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Lista de Cursos</h2>
        <asp:GridView ID="GridView1" CssClass="table table-condensed" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1" BorderStyle="None" HeaderStyle-BackColor="#0099FF" AllowPaging="True" GridLines="None">
            
            <Columns>
                <asp:HyperLinkField HeaderText="GUID" DataTextField="GUID" DataNavigateUrlFields="GUID" SortExpression="GUID" DataNavigateUrlFormatString="~/Course?ID={0}" />
                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                <asp:BoundField DataField="Grau" HeaderText="Grau" SortExpression="Grau" />
                <asp:BoundField DataField="Local" HeaderText="Local" SortExpression="Local" />
            </Columns>
            <HeaderStyle BackColor="#0099FF" HorizontalAlign="Center" ForeColor="White"></HeaderStyle>
            <PagerStyle HorizontalAlign="Center" CssClass="pagination-ys" />
        </asp:GridView>
    </div>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/cursos.xml" TransformFile="~/App_Data/lista_cursos.xsl"></asp:XmlDataSource>
</asp:Content>
