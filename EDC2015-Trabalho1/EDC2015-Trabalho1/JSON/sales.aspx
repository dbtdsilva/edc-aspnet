<%@ Page Title="Sales" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="sales.aspx.cs" Inherits="EDC2015_Trabalho1.JSON.sales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Sales <small id="authorName"></small> </h2> 
    <a href="/JSON/default"><i class="fa fa-backward"></i> Back to Authors</a>
    <hr>

    <table class="table table-striped" id="myTable">
        <thead>
            <tr>
            <th colspan="1" style="width:38.3%;">Title</th>
            <th colspan="5" style="width:61.7%;">Sales</th>
            </tr>
            <tr>
                <th>Title</th>
                <th style="width:12.6%;">Order n.</th>
                <th style="width:11.3%;">Order date</th>
                <th style="width:5.4%;">Qty.</th>
                <th style="width:11.3%;">Pay terms</th>
                <th style="width:21.1%;">Store</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>

    <script>
        $.ajax({
            type: "GET",
            url: "http://192.168.160.36/JSON/getAuthors.aspx?numAuthors=23",
            dataType: "jsonp",
            success: function (data) {
                var name = data.filter(function (item) { return item.ID === window.location.search.split('=')[1] })[0].name;
                $('#authorName').html("(by " + name + ")");
            },
            error: function (xhr, status, err) {
            }
        });

        var myUrl = "http://192.168.160.36/JSON/getAuthorSales.aspx" + window.location.search;
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
                $($($('#myTable').find('thead').find('tr')[1]).find('th')[0])
                    .append("&nbsp;&nbsp;"+
                            "<select>"+
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
                content += "<tr><td rowspan='" + item.sales.length + "'>" + item.title + "</td>";
                item.sales.forEach(function (sale) {
                    content += "<td><i class='fa fa-bookmark'></i> " + sale.orderNum + "</td>";
                    content += "<td>" + sale.orderDate.split(' ')[0] + "</td>"
                    content += "<td>" + sale.quantity + "</td>"
                    content += "<td>" + sale.payTerms + "</td>"
                    content += "<td><b>" + sale.store.name + "</b><br>" + sale.store.address + "<br>" + sale.store.city + ", ";
                    content += sale.store.state + ", " + sale.store.zip + "</td>" + "</tr>";
                });
            });
            $("#myTable").find('tbody').html(content);
        };
    </script>
</asp:Content>
