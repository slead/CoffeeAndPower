var ready;
ready = function() {

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
    console.log(northEast.lat, northEast.lng, southWest.lat, southWest.lng);
    url = "cafes.json?bbox=" + southWest.lat + "," + southWest.lng + "," + northEast.lat + "," + northEast.lng
    console.log(url)
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
      },
      error: function() {
        console.log("Error");
      }
    });
  }
};

$(document).ready(ready);
$(document).on('page:load', ready);