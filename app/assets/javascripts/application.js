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
//= require turbolinks
//= require_tree .
//= require leaflet

$(document).ready(function() {
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

  // Create the Leaflet map
  mapObj = {};
  var stamen = new L.StamenTileLayer("toner-lite");
  mapObj.leafletMap = new L.Map("map", {
        center: new L.LatLng(40.7127837,-74.0059413),
        zoom: 13,
        minZoom: 10,
        maxZoom: 18,
        layers: [stamen],
    });
})