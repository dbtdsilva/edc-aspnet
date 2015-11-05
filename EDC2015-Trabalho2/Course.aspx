<%@ Page Title="Course" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="EDC2015_Trabalho2.Course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Informação do curso</h2>
    <asp:DetailsView ID="DetailsView1" runat="server"  AutoGenerateRows="False" CssClass="table table-condensed" DataSourceID="XmlDataSource1" GridLines="None">
        <FieldHeaderStyle BackColor="#3399FF" ForeColor="White" HorizontalAlign="Right" Width="200px" />
        <Fields>
            <asp:BoundField DataField="guid" HeaderText="GUID" SortExpression="guid" />
            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
            <asp:BoundField DataField="codigo" HeaderText="Código" SortExpression="codigo" />
            <asp:BoundField DataField="grau" HeaderText="Grau" SortExpression="grau" />
            <asp:BoundField DataField="vagas" HeaderText="Vagas" SortExpression="vagas" />
            <asp:BoundField DataField="saidas_profissionais" HeaderText="Saídas Profissionais" SortExpression="saidas_profissionais" HtmlEncode="false" />
            <asp:BoundField DataField="media1" HeaderText="Média - 1ª Fase" SortExpression="media1" />
            <asp:BoundField DataField="media2" HeaderText="Média - 2ª Fase" SortExpression="media2" />
            <asp:BoundField DataField="duracao" HeaderText="Duração" SortExpression="duracao" />
            <asp:BoundField DataField="provas" HeaderText="Provas" SortExpression="provas" HtmlEncode="false" />
        </Fields>
        <HeaderStyle BackColor="#0099FF" />
    </asp:DetailsView>
    <asp:XmlDataSource ID="XmlDataSource1" OnLoad="XmlDataSource1_Load" runat="server" TransformFile="~/App_Data/curso_details.xslt" XPath="/curso">
    </asp:XmlDataSource>
</asp:Content>
