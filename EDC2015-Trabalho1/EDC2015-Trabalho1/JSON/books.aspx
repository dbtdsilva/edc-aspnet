<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="books.aspx.cs" Inherits="EDC2015_Trabalho1.JSON.books" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Books <small id="authorName"></small> </h2> 
    <a href="/JSON/default"><i class="fa fa-backward"></i> Back to Authors</a>
    <hr>
    <table class='table table-striped' id="myTable">
        <thead>
        <tr>
            <th style="width:25%;">Title</th>
            <th style="width:17.1%;">Authors</th>
            <th style="width:7.6%;">Type</th>
            <th style="width:7.5%;">Price</th>
            <th style="width:7.5%;">Sold qty.</th>
            <th style="width:25%;">Notes</th>
            <th style="width:10.3%;">Pub. date</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
    
    <script>   
        $.ajax({
            type: "GET",
            url: "http://192.168.160.36/JSON/getAuthors.aspx?numAuthors=23",
            dataType: "jsonp",
            success: function (data) {
                var name = data.filter(function (item) { return item.ID === window.location.search.split('=')[1] })[0].name;
                $('#authorName').html("(by "+name+")");
            },
            error: function (xhr, status, err) {
            }
        });

        var myUrl = "http://192.168.160.36/JSON/getAuthorTitles.aspx"+window.location.search;
        $.ajax({
            type: "GET",
            url: myUrl,
            dataType: "jsonp",
            success: processArray,
            error: function (xhr, status, err) {
            }
        });

        function processArray(data) {
            myData = data;
            if (data.length > 1) {
                myData = myData.sort(function (a, b) {
                    var titleA = a.title.toLowerCase(), titleB = b.title.toLowerCase();
                    if (titleA < titleB)
                        return -1;
                    if (titleA > titleB)
                        return 1;
                    return 0;
                });
                $($('#myTable').find('thead').find('th')[0])
                    .append("&nbsp;&nbsp;" +
                            "<select>" +
                                "<option>Sort(A-Z)</option>" +
                                "<option>Sort(Z-A)</option>" +
                            "</select>"
                    );
                $("select").change(function () {
                    var str = "";
                    $("select option:selected").each(function () {
                        str = $(this).text();
                    });
                    if (typeof myData !== 'undefined') {
                        if (str === "Sort(A-Z)")
                            displayData(myData.sort(function (a, b) {
                                var titleA = a.title.toLowerCase(), titleB = b.title.toLowerCase();
                                if (titleA < titleB)
                                    return -1;
                                if (titleA > titleB)
                                    return 1;
                                return 0;
                            }));
                        else if (str === "Sort(Z-A)")
                            displayData(myData.sort(function (a, b) {
                                var titleA = a.title.toLowerCase(), titleB = b.title.toLowerCase();
                                if (titleA > titleB)
                                    return -1;
                                if (titleA < titleB)
                                    return 1;
                                return 0;
                            }));
                    }
                }).change();
            }
           
            displayData(myData);
        };

        function displayData(data) {
            var content = "";
            data.forEach(function (item) {
                content += '<tr><td>' + item.title + '</td><td>';
                for (var i = 0; i < item.authors.length; i++) {
                    content += "<i class='fa fa-user'></i> " + item.authors[i];
                    if (i < item.authors.length)
                        content += "<br/>";
                }
                content += "</td><td>" + item.type + '</td><td>' + item.price + '</td><td>';
                content += item.ytd_sales + '</td><td>' + item.notes + '</td><td>' + item.pubdate.split(' ')[0] + '</td></tr>';
            });
            $("#myTable").find('tbody').html(content);
        };
    </script>
</asp:Content>
