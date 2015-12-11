<%@ Page Title="Shop" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="TechGeeks.Shop.Category" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <asp:Literal EnableViewState="false" runat="server" ID="categoryTitle"/>
   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="None" CssClass="table table-condensed" AllowPaging="True" AllowSorting="True">
      <Columns>
         <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
         <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
         <asp:BoundField DataField="Short" HeaderText="Short" SortExpression="Short" />
         <asp:BoundField DataField="LaunchDate" HeaderText="LaunchDate" SortExpression="LaunchDate" />
         <asp:TemplateField HeaderText="Commands">
            <ItemTemplate>
               <a href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus-circle"></i></a>
               <asp:LinkButton runat="server" CssClass="fa fa-cart-plus"></asp:LinkButton>
               <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                 <div class="modal-dialog" role="document">
                   <div class="modal-content">
                     <div class="modal-header">
                       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <asp:Label ID="Label2" CssClass="h4 text-center" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                     </div>
                     <div class="modal-body">
                       <asp:Label ID="Label1" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                     </div>
                     <div class="modal-footer">
                       <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                       <button type="button" class="btn btn-primary">Save changes</button>
                     </div>
                   </div>
                 </div>
               </div>
            </ItemTemplate>
         </asp:TemplateField>
      </Columns>
   </asp:GridView>
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="sp_getProducts" SelectCommandType="StoredProcedure">
      <SelectParameters>
         <asp:RouteParameter DefaultValue="" Name="Category" RouteKey="category" Type="String" />
      </SelectParameters>
   </asp:SqlDataSource>
</asp:Content>
