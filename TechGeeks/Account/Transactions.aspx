<%@ Page Title="Transactions" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="TechGeeks.Account.Transactions" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" 
      GridLines="None" AllowPaging="True" AllowSorting="True" CssClass="table table-condensed" OnRowUpdating="GridView1_RowUpdating">
      <Columns>
         <asp:BoundField DataField="TransactionId" HeaderText="ID" SortExpression="TransactionId" />
         <asp:BoundField DataField="Bought_date" HeaderText="Bought at" SortExpression="Bought_date" />
         <asp:BoundField DataField="Product_id" HeaderText="Product ID" SortExpression="Product_id" />
         <asp:BoundField DataField="Product_name" HeaderText="Product Name" SortExpression="Product_id" />
         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
         <asp:TemplateField>
            <ItemTemplate>
               <a href="#" data-toggle="modal" data-target='#modal<%# Eval("TransactionId") %>'><i class="fa fa-plus-circle"></i></a>
               
               <div class="modal fade" id='modal<%# Eval("TransactionId") %>' tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                 <div class="modal-dialog" role="document">
                   <div class="modal-content">
                     <div class="modal-header">
                       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <asp:Label ID="Label2" CssClass="h4 text-center" runat="server" Text='Feedback Modal'></asp:Label>
                     </div>
                     <div class="modal-body">
                       <asp:TextBox ID='data' runat="server" TextMode="MultiLine"></asp:TextBox>
                     </div>
                     <div class="modal-footer">
                       <button type="button" class="btn btn-flat btn-default" data-dismiss="modal">Close</button>
                        <asp:LinkButton runat="server" CssClass="btn btn-flat btn-primary" CommandName="Update" CommandArgument='<%# Eval("TransactionId") %>'><i class="fa fa-floppy-o"></i>Save Changes</asp:LinkButton>
                     </div>
                   </div>
                 </div>
               </div>
               <asp:LinkButton runat="server"></asp:LinkButton>
            </ItemTemplate>
         </asp:TemplateField>
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
