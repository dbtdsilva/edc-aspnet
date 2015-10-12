<%@ Page Title="Authors" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="EDC2015_Trabalho1.JSON._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Book Authors</h2>
    <hr>
    Sort by: 
    <select>
        <option>Name(A-Z)</option>
        <option>Name(Z-A)</option>
    </select>
    <br/><br/>
    <div id="authorsContent" class="row">
    </div>
    <script>
        var myUrl = "http://192.168.160.36/JSON/getAuthors.aspx?numAuthors=23";
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
        };

        function processArray(data) {
            myData = data;
            displayData(myData);
        };

        function displayData(data) {
            content = "";
            data.forEach(function (item) {
                content += "<div class='col-lg-4 col-md-4'>";
                content += "<div class='panel panel-default'><div class='panel-body'>";
                content += "<div class='col-lg-4 col-md-4'><span class='circle text-center' style='background-color:";
                content += "#" + ((1 << 24) * Math.random() | 0).toString(16) + ";'>" + getBadge(item.name) + "</span>";
                content += "<h5><small style='color:black'>" + item.ID + "</small></h5></div>";
                content += "<div class='col-lg-8 col-md-8'>";
                content += "<h4 style='margin-top:0px'>" + item.name + "</h4>";
                content += "<span>" + item.address + "</span><br/>";
                content += "<span>" + item.city + ", " + item.state + " " + item.zip + "</span><br/>";
                content += "<span> <i class='fa fa-phone'></i> " + item.phone + "</span>";
                content += "</div><div class='col-lg-12 col-md-12' style='text-align: center;'>";
                content += "<a href='/JSON/sales?author_ID=" + item.ID + "' class='btn btn-default' role='button'>Sales</a>"
                content += "&nbsp;&nbsp;<a href='/JSON/books?author_ID=" + item.ID
                content += "' class='btn btn-default' role='button'>Books</a></div>";
                content += "</div></div></div>";
            });
            $("#authorsContent").html(content);
        };

        $("select").change(function () {
            var str = "";
            $("select option:selected").each(function () {
                str = $(this).text();
            });
            if (typeof myData !== 'undefined') {
                if (str === "Name(A-Z)")
                    displayData(myData.sort(function(a,b) {
                        var nameA=a.name.toLowerCase(), nameB=b.name.toLowerCase();
                        if (nameA < nameB) 
                            return -1;
                        if (nameA > nameB)
                            return 1;
                        return 0;
                }));
                else if (str === "Name(Z-A)")
                    displayData(myData.sort(function(a,b) {
                        var nameA = a.name.toLowerCase(), nameB = b.name.toLowerCase();
                        if (nameA > nameB)
                            return -1;
                        if (nameA < nameB)
                            return 1;
                        return 0;
                    }));
            }
        }).change();
    </script>

</asp:Content>
