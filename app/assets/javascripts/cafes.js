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
      mapObj.jsonLayer.addData(geojson);
      mapObj.leafletMap.fitBounds(mapObj.jsonLayer.getBounds().pad(0.5));
      if (geojson.length < 2) {
        mapObj.leafletMap.setZoom(15);
      }
    },
    error: function() {
      console.log("Error");
    }
  });

};

$(document).ready(ready);
$(document).on('page:load', ready);