var ready;
ready = function() {

  if ( $("#map").length ) {
    var stamen = new L.StamenTileLayer("toner-lite");
    leafletMap = new L.Map("map", {
      center: [40.7127837, -74.0059413],
      zoom: 12,
      layers: [stamen]
    });
    mapSearch();
    
    var geojsonMarkerOptions = {
      radius: 8,
      fillColor: "#ed9c28",
      color: "#000",
      weight: 1,
      opacity: 1,
      fillOpacity: 0.8
    };

    // var searchParam = getUrlParameter('search');
    // var pageParam = getUrlParameter('page');
    // if (searchParam != undefined) {
    //   url = 'cafes.json?search=' + searchParam;
    //   if (pageParam != undefined) {
    //     url += "&page=" + pageParam;
    //   }
    // } else {
    //   url = window.location.pathname + '.json';
    // }
    mapSearch;
    leafletMap.on('moveend', mapSearch);

  }

  function mapSearch() {
    // Request cafes within the current map extent
    console.log("Map search")

    extent = leafletMap.getBounds();
    var northEastLat = extent._northEast.lat;
    var northEastLng = extent._northEast.lng;
    var southWestLat = extent._southWest.lat;
    var southWestLng = extent._southWest.lng;
    // if (northEastLng < -180) {northEastLng += 360;}
    // if (southWestLng < -180) {southWestLng += 360;}

    url = "cafes.json?bbox=" + southWestLat + "," + southWestLng + "," + northEastLat + "," + northEastLng
    $.ajax({
      dataType: 'text',
      url: url,
      success: function(data) {
        var geojson;
        geojson = $.parseJSON(data);

        // Add the cafes to the map
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

        // Create a new text entry for each cafe
        var html = '';
        for (var idx = 0; idx <geojson.length; idx++) {
          if (idx % 3 == 0) {
            html += "<div class='row'>";
          }
          cafe = geojson[idx].properties;
          html += "<div class='col-md-4 cafe_content'>";
          html += "<div class='name'><h2><a href=cafes/" + cafe.url + ">" + cafe.name + "</a></h2></div>";
          html += "<div class='address'><h4>" + cafe.address + "</h4></div>";
          html += "<div class='summary'><p>" + cafe.description + "</p></div>";
          html += "</div>";
          if (idx % 3 == 2) {
            html += "</div>"
          }
        }
        console.log(html)
        $("#results").html(html);
  
      },
      error: function() {
        console.log("Error");
      }
    });
  }
};

$(document).ready(ready);
$(document).on('page:load', ready);