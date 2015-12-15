﻿<%@ Page Title="Role Manager" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="ManageRoles.aspx.cs" Inherits="TechGeeks.Admin.ManageRoles" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <asp:GridView ID="UserRoleGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="email" DataSourceID="SqlDataSource1" 
      GridLines="None" AllowPaging="True" AllowSorting="True" CssClass="table table-condensed" OnItemUpdating="UserRoleGrid_ItemUpdating" OnRowDataBound="gv_RowDataBound">
      <Columns>

          <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="email" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
          <asp:TemplateField HeaderText="Role">
                <ItemTemplate>
                    <asp:Label ID="role" runat="server" Text='<%# Eval("role") %>'></asp:Label>
                </ItemTemplate>
              <EditItemTemplate>
                  <asp:DropDownList ID="DropDownList1" runat="server" >
                    </asp:DropDownList>
              </EditItemTemplate>
          </asp:TemplateField>

          <asp:TemplateField HeaderText="Commands">
            <EditItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CssClass="btn btn-primary" CommandArgument='<%# Eval("email") %>' CommandName="Update" Text=""><i class="fa fa-floppy-o"></i></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CssClass="btn btn-default" CommandName="Cancel" Text=""><i class="fa fa-times"></i></asp:LinkButton>
            </EditItemTemplate>

            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CssClass="btn btn-default" CommandName="Edit" Text=""><i class="fa fa-pencil"></i></asp:LinkButton>               
            </ItemTemplate>

         </asp:TemplateField>
      </Columns>
      <EmptyDataTemplate>
         <h3 class="text-center">There are no data records to display.</h3>
      </EmptyDataTemplate>

   </asp:GridView>
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
       SelectCommand="sp_getUserRoles" SelectCommandType="StoredProcedure">
   </asp:SqlDataSource>

</asp:Content>
