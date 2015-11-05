<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="EDC2015_Trabalho2.Courses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Lista de Cursos</h2>
        <hr>
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom: 15px;">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="margin-top: 10px; width: 50px;">Tipos: </div> 
                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                    <asp:DropDownList CssClass="form-control" ID="CourseTypes" runat="server" AutoPostBack="true" DataSourceID="XmlDataSource2"
                        DataTextField="Grau" DataValueField="Grau" AppendDataBoundItems="true" OnSelectedIndexChanged="CourseTypes_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="margin-top: 10px; width: 50px;">Locais: </div> 
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                        <asp:DropDownList CssClass="form-control" ID="LocaisTypes" runat="server" AutoPostBack="true" DataSourceID="XmlDataSource3" 
                            DataTextField="Local" DataValueField="Local" AppendDataBoundItems="true" OnSelectedIndexChanged="LocaisTypes_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
        <asp:GridView ID="GridView1" CssClass="table table-condensed" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1" BorderStyle="None" HeaderStyle-BackColor="#0099FF" AllowPaging="True" GridLines="None" OnDataBound="GridView1_DataBound">
            
            <Columns>
                <asp:HyperLinkField HeaderText="GUID" DataTextField="GUID" DataNavigateUrlFields="GUID" SortExpression="GUID" DataNavigateUrlFormatString="~/Course?ID={0}" />
                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                <asp:BoundField DataField="Grau" HeaderText="Grau" SortExpression="Grau" />
                <asp:BoundField DataField="Local" HeaderText="Local" SortExpression="Local" />
            </Columns>
            <EmptyDataTemplate>
                <div class="panel panel-warning">
                  <div class="panel-heading">
                    <h3 class="panel-title">ATENÇÃO!!!</h3>
                  </div>
                  <div class="panel-body">
                    Não há cursos desse tipo nessa instituição.
                  </div>
                </div>
            </EmptyDataTemplate>
            <HeaderStyle BackColor="#0099FF" HorizontalAlign="Center" ForeColor="White"></HeaderStyle>
            <PagerStyle HorizontalAlign="Center" CssClass="pagination-ys" />
        </asp:GridView>
    </div>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/cursos.xml" TransformFile="~/App_Data/lista_cursos.xsl">
    </asp:XmlDataSource>
    <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/App_Data/cursos.xml" TransformFile="~/App_Data/lista_cursos.xsl"
    XPath="/cursos/curso[not(@Grau=preceding::curso/@Grau)]" EnableCaching="false"></asp:XmlDataSource>

    <asp:XmlDataSource ID="XmlDataSource3" runat="server" DataFile="~/App_Data/cursos.xml" TransformFile="~/App_Data/lista_cursos.xsl"
    XPath="/cursos/curso[not(@Local=preceding::curso/@Local)]" EnableCaching="false"></asp:XmlDataSource>


</asp:Content>
