<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="EDC2015_Trabalho1.JSON._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        var myUrl = "http://192.168.160.36/JSON/getAuthors.aspx";
        $.ajax({
            type: "GET",
            url: myUrl,
            dataType: "jsonp",
            success: processArray,
            error: function (xhr, status, err) {
            }
        });

        function getBadge(name) {
            var myBadge = "";
            name.split(" ").map(function (item) {
                return item.length > 0 ? item[0] : '';
            }).forEach(function (item) {
                myBadge += item;
            });
            return myBadge;
        }
        function processArray(data) {
            content = "";
            data.forEach(function (item) {
                content += "<div class='col-lg-4 col-md-4'>";
                content += "<div class='panel panel-default'><div class='panel-body'>";
                content += "<div class='col-lg-4 col-md-4'><span class='circle text-center'>" + getBadge(item.name) + "</span>";
                content += "<h5><small style='color:black'>" + item.ID + "</small></h5></div>";
                content += "<div class='col-lg-8 col-md-8'>";
                content += "<h4 style='margin-top:0px'>"+item.name+"</h4>";
                content += "<span>"+item.address+"</span><br/>";
                content += "<span>" + item.city + ", " + item.state + " " + item.zip + "</span><br/>";
                content += "<span>" + item.phone + "</span>";
                content += "</div></div></div></div>";
            });
            $("#authorsContent").html(content);
        };
    </script>
    <h2>Book Authors</h2>
    <div id="authorsContent" class="row">
    </div>
</asp:Content>
