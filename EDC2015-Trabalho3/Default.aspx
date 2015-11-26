<%@ Page Title="Feed Reader" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EDC2015_Trabalho3._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1><i class="fa fa-rss"></i>My Feed Reader</h1>
    <hr />
    <div class="row">
        <div class="col-lg-9 col-md-9 col-sm-8 col-xs-8">
            <asp:DropDownList CssClass="form-control" ID="Feeds" runat="server" AutoPostBack="true" DataSourceID="XmlDataSource1"
                DataTextField="name" DataValueField="name" AppendDataBoundItems="true" OnSelectedIndexChanged="Feeds_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-4 text-right">
            <a class="btn btn-primary" href="manageFeeds"><i class="fa fa-rss"></i>Manage Feeds</a>
        </div>
    </div>
    <div runat="server" id="warning">
        <br />
        <div class="panel panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title">URL não é válido</h3>
            </div>
            <div class="panel-body">
                Servidor falhou a carregar o URL do feed RSS fornecido. Verifique o URL fornecido!
            </div>
        </div>
    </div>
    <div runat="server" id="data" class="row">
        <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
            <h3>Feed Info</h3>
            <asp:DetailsView OnDataBound="DetailsView1_DataBound" ID="DetailsView1" runat="server" AutoGenerateRows="False" CssClass="table" DataSourceID="XmlDataSourceDynamic" GridLines="None">
                <FieldHeaderStyle Width="150px" />
                <Fields>
                    <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                    <asp:BoundField DataField="link" HeaderText="Link" SortExpression="link" />
                    <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                    <asp:BoundField DataField="language" HeaderText="Language" SortExpression="language" />
                    <asp:BoundField DataField="managingEditor" HeaderText="ManagingEditor" SortExpression="managingEditor" />
                    <asp:BoundField DataField="webMaster" HeaderText="WebMaster" SortExpression="webMaster" />
                    <asp:BoundField DataField="lastBuildDate" HeaderText="LastBuildDate" SortExpression="lastBuildDate" />
                    <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" />
                </Fields>
            </asp:DetailsView>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <h3>Feed Image</h3>
            <div class="text-center">
                <asp:Image ID="logo" runat="server" AlternateText="Logo image" />
            </div>
        </div>
        <h3>Feed News</h3>
        <asp:Xml ID="Xml1" runat="server" TransformSource="~/App_Data/news.xslt"></asp:Xml>
    </div>
    
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/feedlist.xml"></asp:XmlDataSource>
    <asp:XmlDataSource ID="XmlDataSourceDynamic" runat="server" DataFile="~/App_Data/feedlist.xml" TransformFile="~/App_Data/feed.xslt" XPath="/feed"></asp:XmlDataSource>
</asp:Content>
