<%@ Page Title="Manage Feeds" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manageFeeds.aspx.cs" Inherits="EDC2015_Trabalho3._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1><i class="fa fa-rss"></i> Gestão de feeds</h1>
    <hr />
    
    <asp:DetailsView ID="DetailsView2" CssClass="table table-condensed col-lg-12 col-md-12"  runat="server" AllowPaging="True" GridLines="None" AutoGenerateRows="False" DataSourceID="XmlDataSource4">
        
        <Fields>
            <asp:TemplateField HeaderText="name:" SortExpression="name">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" CssClass="form-control input-sm custom-form-width" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="url:" SortExpression="url">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" CssClass="form-control input-sm custom-form-width" runat="server" Text='<%# Bind("url") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" CssClass="form-control input-sm custom-form-width" runat="server" Text='<%# Bind("url") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("url") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CssClass="btn btn-primary" CommandName="Update" Text=""><i class="fa fa-floppy-o"></i></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CssClass="btn btn-default" CommandName="Cancel" Text=""><i class="fa fa-times"></i></asp:LinkButton>
                </EditItemTemplate>
                
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CssClass="btn btn-primary" CommandName="Insert" Text=""><i class="fa fa-floppy-o"></i></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CssClass="btn btn-default" CommandName="Cancel" Text=""><i class="fa fa-times"></i></asp:LinkButton>
                </InsertItemTemplate>
               
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CssClass="btn btn-default" CommandName="Edit" Text=""><i class="fa fa-pencil"></i></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CssClass="btn btn-default" CommandName="Delete" Text="" ><i class="fa fa-trash"></i></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CssClass="btn btn-default" CommandName="New" Text=""><i class="fa fa-star-o"></i></asp:LinkButton>                
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <PagerStyle HorizontalAlign="Center" CssClass="pagination-ys" />
    </asp:DetailsView>
    <asp:XmlDataSource ID="XmlDataSource4" runat="server" DataFile="~/App_Data/feedlist.xml"></asp:XmlDataSource>
    
       
    <a class="btn btn-default" href="/"><i class="fa fa-rss"></i> Leitor de feeds</a>
</asp:Content>
