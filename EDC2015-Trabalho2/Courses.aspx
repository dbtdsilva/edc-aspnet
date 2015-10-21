<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="EDC2015_Trabalho2.Courses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Lista de Cursos</h2>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="XmlDataSource1" CssClass="table table-condensed" GridLines="None">
            <HeaderStyle BackColor="#0099FF" ForeColor="White" />
        </asp:GridView>
    </div>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/cursos.xml" TransformFile="~/App_Data/lista_cursos.xsl"></asp:XmlDataSource>
</asp:Content>
