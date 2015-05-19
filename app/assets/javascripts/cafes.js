$(document).ready(function() {
  //This is causing the page to reload without the Search parameters........ but without
  //the document.ready the mapObj objects aren't available......
  
  $.ajax({
    dataType: 'text',
    url: 'cafes.json',
    success: function(data) {
      var geojson;
      geojson = $.parseJSON(data);
      mapObj.jsonLayer.addData(geojson);
      mapObj.leafletMap.fitBounds(mapObj.jsonLayer.getBounds().pad(0.5));
    },
    error: function() {
      console.log("Error");
    }
  });
});