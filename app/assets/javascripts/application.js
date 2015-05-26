// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require leaflet

function pageLoad() {
  setTimeout(function() {
    $('#notice_wrapper').fadeOut("slow", function() {
      $(this).remove();
    })
    $('#alert_wrapper').fadeOut("slow", function() {
      $(this).remove();
    })
  }, 4500)

  $('#btnSearch').click(function(){
    addressSearch($("#address").val());
  });

  $( "body" ).delegate( ".cafe_content", "mouseover", function() {
    $(this).addClass("active");
  });

  $( "body" ).delegate( ".cafe_content", "mouseleave", function() {
    $(this).removeClass("active");
  });
}

function addressSearch(address) {
  // Search OpenStreetMap for this location
  url = 'https://nominatim.openstreetmap.org/search?format=json&city=' + address;
  $.ajax({
    url: url,
    type: 'get',
    dataType: 'json',
    success: function(response) {
      // Zoom the map to the first location found. TODO - display the other matches
      if(response.length > 0) {
        lat = response[0].lat;
        lng = response[0].lon;
        var latlng = L.latLng(lat, lng);
        leafletMap.setView(latlng,13);
      }
    }, error: function(error) {
      console.log("error with address search");
    }
  });
}

function getUrlParameter(sParam){
  var sPageURL = window.location.search.substring(1);
  var sURLVariables = sPageURL.split('&');
  for (var i = 0; i < sURLVariables.length; i++) 
  {
      var sParameterName = sURLVariables[i].split('=');
      if (sParameterName[0] == sParam) 
      {
          return sParameterName[1];
      }
  }
}

$(document).ready(pageLoad);
$(document).on('page:load', pageLoad);