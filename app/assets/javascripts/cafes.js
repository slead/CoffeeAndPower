var ready;
ready = function() {

  if ( $("#map").length ) {
    var stamen = new L.StamenTileLayer("toner-lite");
    leafletMap = new L.Map("map", {
      center: [40.7127837, -74.0059413],
      zoom: 12,
      layers: [stamen]
    });    
    
    var geojsonMarkerOptions = {
      radius: 8,
      fillColor: "#ed9c28",
      color: "#000",
      weight: 1,
      opacity: 1,
      fillOpacity: 0.8
    };

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
    mapSearch;
    leafletMap.on('moveend', mapSearch);

  }

  function mapSearch() {
    console.log("Map search")
    extent = leafletMap.getBounds();
    var northEast = extent._northEast;
    var southWest = extent._southWest;
    url = "cafes.json?bbox=" + southWest.lat + "," + southWest.lng + "," + northEast.lat + "," + northEast.lng
    console.log(url)
    $.ajax({
      dataType: 'text',
      url: url,
      success: function(data) {
        var geojson;
        geojson = $.parseJSON(data);
        jsonLayer = L.geoJson(geojson, {
          pointToLayer: function (feature, latlng) {
            return L.circleMarker(latlng, geojsonMarkerOptions);
          },
          onEachFeature: function (feature, layer) {
            if(feature.properties.name != undefined) {
              if(feature.properties.url != undefined) {
                layer.bindPopup("<a href='/cafes/" + feature.properties.url + "''>" + feature.properties.name + "</a>");
              } else {
                layer.bindPopup(feature.properties.name);
              }
            }
          }
        });
        jsonLayer = L.geoJson();
        jsonLayer.addTo(leafletMap);
      },
      error: function() {
        console.log("Error");
      }
    });
  }
};

$(document).ready(ready);
$(document).on('page:load', ready);