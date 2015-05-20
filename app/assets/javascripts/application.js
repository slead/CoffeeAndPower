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
//= require bootstrap.min
//= require leaflet
//= require Control.Geocoder

function pageLoad() {
  setTimeout(function() {
    $('#notice_wrapper').fadeOut("slow", function() {
      $(this).remove();
    })
    $('#alert_wrapper').fadeOut("slow", function() {
      $(this).remove();
    })
  }, 4500)

  $('#searchBox').typeahead({
    name: "Location",
    remote: "/locations/autocomplete?query=%QUERY"
  });

    if ( $("#map").length ) {
    var stamen = new L.StamenTileLayer("toner-lite");
    leafletMap = new L.Map("map", {layers: [stamen]});

    var searchParam = getUrlParameter('search');
    var pageParam = getUrlParameter('page');
    if (searchParam != undefined) {
      url = 'cafes.json?search=' + searchParam;
      if (pageParam != undefined) {
        url += "&page=" + pageParam;
      }
    } else {
      url = window.location.pathname + '.json';
    }
    $.ajax({
      dataType: 'text',
      url: url,
      success: function(data) {
        var geojson;
        geojson = $.parseJSON(data);
        jsonLayer = L.geoJson(geojson, {
          style: function (feature) {
            return {color: feature.properties.color};
          },
          onEachFeature: function (feature, layer) {
            layer.bindPopup("<a href='/cafes/" + feature.properties.url + "''>" + feature.properties.name + "</a>");
          }
        });
        jsonLayer.addTo(leafletMap);
        leafletMap.fitBounds(jsonLayer.getBounds().pad(0.5));
        if (geojson.length < 2) {
          leafletMap.setZoom(15);
        }
      },
      error: function() {
        console.log("Error");
      }
    });

    leafletMap.on('moveend', function(e) {
      mapSearch(leafletMap.getBounds());
    });
  }

  function mapSearch(extent) {
    var northEast = extent._northEast;
    var southWest = extent._southWest;
    url = "cafes.json?bbox=" + southWest.lat + "," + southWest.lng + "," + northEast.lat + "," + northEast.lng
    $.ajax({
      dataType: 'text',
      url: url,
      success: function(data) {
        var geojson;
        geojson = $.parseJSON(data);
        jsonLayer = L.geoJson(geojson, {
          style: function (feature) {
            return {color: feature.properties.color};
          },
          onEachFeature: function (feature, layer) {
            layer.bindPopup("<a href='/cafes/" + feature.properties.url + "''>" + feature.properties.name + "</a>");
          }
        });
        jsonLayer.addTo(leafletMap);
        console.log(geojson.length);
      },
      error: function() {
        console.log("Error");
      }
    });
  }
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