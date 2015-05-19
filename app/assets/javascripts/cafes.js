var ready;
ready = function() {

  if ( $("#map").length ) {
    var stamen = new L.StamenTileLayer("toner-lite");
    leafletMap = new L.Map("map", {layers: [stamen]});

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
        console.log("AJAX success")
        var geojson;
        geojson = $.parseJSON(data);
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
  }
};

$(document).ready(ready);
$(document).on('page:load', ready);