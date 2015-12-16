<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="TechGeeks.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 460px;
      }
    </style>
   
   <script>
      var map;
      function initMap() {
         var myLatLng = { lat: 40.633125, lng: -8.659767 };
         map = new google.maps.Map(document.getElementById('map'), {
            center: myLatLng,
            zoom: 15
         });
         var marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            title: 'TechGeeks Store'
         });
      }
   </script>
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCqJb31-ibms8GMT1h_7qEskVAjQGHEP88&callback=initMap"
        async defer></script>
   
   <div class="row">
      <div class="col-md-6 text-center">
         <h4>Information</h4>
         <div class="well">
            <h5><b>Coordinates:</b> 40.633125, -8.659767</h5>
            <h5><b>Opening hours:</b> 8am - 20pm</h5>
            <h5><b>Contact:</b> 901337064</h5>
         </div>
         <h4>Founders</h4>
         <div class="well">
            <div class="row">
               <div class="col-md-6">
                  <img src="<%: GravatarHelper.CreateGravatarUrl("diogo.corte@ua.pt", 
                     100, GravatarHelper.DefaultImageIdenticon, GravatarRating.G, false, 
                     false) %>" class="img-circle" alt="User Image">
                  <h3>Diogo Corte</h3>
                  <h5><b>Course:</b> Engenharia de Computadores e Telemática</h5>
                  <h5><b>Email:</b> diogo.corte@ua.pt</h5>
                  <h5><b>Number:</b> 35800</h5>
               </div>
               <div class="col-md-6">
                  <img src="<%: GravatarHelper.CreateGravatarUrl("dbtds@ua.pt", 
                     100, GravatarHelper.DefaultImageIdenticon, GravatarRating.G, false, 
                     false) %>" class="img-circle" alt="User Image">
                  <h3>Diogo Silva</h3>
                  <h5><b>Course:</b> Engenharia de Computadores e Telemática</h5>
                  <h5><b>Email:</b> dbtds@ua.pt</h5>
                  <h5><b>Number:</b> 60337</h5>
               </div>
            </div>
         </div>
      </div>
      <div class="col-md-6">
         <h4 class="text-center">TechGeeks Shop Location</h4>
         <div id="map" class="well"></div>
      </div>
   </div>
</asp:Content>
