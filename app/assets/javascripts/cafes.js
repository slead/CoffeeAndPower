var ready;
ready = function() {

  console.log('ready');
  var viewReset;

  if ( $("#map").length ) {
    var stamen = new L.StamenTileLayer("toner-lite");
    leafletMap = new L.Map("map", {layers: [stamen]});
    leafletMap.off('viewreset', updateCafes);

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

    doAjax(url);
    leafletMap.on('moveend', updateCafes);
  }

  function updateCafes(e) {
    mapSearch(leafletMap.getBounds());    
  }

  function mapSearch(extent) {
    console.log("Map search")
    var northEast = extent._northEast;
    var southWest = extent._southWest;
    url = "cafes.json?bbox=" + southWest.lat + "," + southWest.lng + "," + northEast.lat + "," + northEast.lng
    doAjax(url);
  }

  function doAjax(url) {
    console.log("ajax")
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
        jsonLayer.addTo(leafletMap);
        // leafletMap.fitBounds(jsonLayer.getBounds().pad(0.5));
        // if (geojson.length < 2) {
        //   leafletMap.setZoom(15);
        // }
      },
      error: function() {
        console.log("Error");
      }
    });
  }
};

$(document).ready(ready);
$(document).on('page:load', ready);