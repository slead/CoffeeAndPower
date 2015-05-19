var ready;
ready = function() {

  var searchParam = getUrlParameter('search');
  if (searchParam != undefined) {
    url = 'cafes.json?search=' + searchParam;
  } else {
    url = window.location.pathname + '.json';
  }
  $.ajax({
    dataType: 'text',
    url: url,
    success: function(data) {
      var geojson;
      geojson = $.parseJSON(data);
      // Create the Leaflet map
      var stamen = new L.StamenTileLayer("toner-lite");
      leafletMap = new L.Map("map", {
        center: new L.LatLng(40.7127837,-74.0059413),
        zoom: 13,
        // minZoom: 10,
        // maxZoom: 18,
        layers: [stamen]
      });

      jsonLayer = L.geoJson(geojson);
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

};

$(document).ready(ready);
$(document).on('page:load', ready);