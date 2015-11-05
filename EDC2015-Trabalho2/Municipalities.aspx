<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Municipalities.aspx.cs" Inherits="EDC2015_Trabalho2.municipalities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Properties organized by municipality</h2>
    <hr>
    <asp:Xml ID="Xml1" runat="server" DocumentSource="~/App_Data/Parte2/Properties.xml" TransformSource="~/App_Data/Parte2/Municipalities.xslt"></asp:Xml>
</asp:Content>
