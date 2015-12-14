<%@ Page Title="Transactions" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="TechGeeks.Account.Transactions" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" 
      GridLines="None" AllowPaging="True" AllowSorting="True" CssClass="table table-condensed">
      <Columns>
         <asp:BoundField DataField="TransactionId" HeaderText="ID" SortExpression="TransactionId" />
         <asp:BoundField DataField="Bought_date" HeaderText="Bought at" SortExpression="Bought_date" />
         <asp:BoundField DataField="Product_id" HeaderText="Product ID" SortExpression="Product_id" />
         <asp:BoundField DataField="Product_name" HeaderText="Product Name" SortExpression="Product_id" />
         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
      </Columns>
      <EmptyDataTemplate>
         <h3 class="text-center">You haven't made any transactions yet.</h3>
      </EmptyDataTemplate>
   </asp:GridView>
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="sp_getUserTransactions" SelectCommandType="StoredProcedure">
      <SelectParameters>
         <asp:Parameter Name="userid" Type="String" />
      </SelectParameters>
   </asp:SqlDataSource>
</asp:Content>
