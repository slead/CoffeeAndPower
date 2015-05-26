var ready;
ready = function() {

  var stamen = new L.StamenTileLayer("toner-lite");
  var geojsonMarkerOptions = {
    radius: 8,
    fillColor: "#ed9c28",
    color: "#000",
    weight: 1,
    opacity: 1,
    fillOpacity: 0.8
  };

  // Initialise the map for the Index page
  if ( $("#map").length ) {

    leafletMap = new L.Map("map", {
      center: [40.736592006730966, -73.98845672607422],
      zoom: 14,
      minZoom: 12,
      layers: [stamen],
      maxBounds: L.latLngBounds(L.latLng(-90, -180), L.latLng(90, 180))
    });

    // Fetch the cafes within  the current map extent, and re-fetch them when it changes
    mapSearch();
    leafletMap.on('moveend', mapSearch);

    // Initialise the map for the Show page
  } else if ( $("#minimap").length ) {

    // the AJAX call is to the cafe name + .json
    url = window.location.pathname + '.json';

    $.ajax({
      dataType: 'text',
      url: url,
      success: function(data) {
        var geojson;
        geojson = $.parseJSON(data);

        // The results contain this cafe plus any nearby cafes. Centre the map on this cafe
        var centroid = geojson[0].geometry.coordinates;
        leafletMap = new L.Map("minimap", {
          center: [centroid[1], centroid[0]],
          zoom: 12,
          minZoom: 11,
          layers: [stamen]
        });
        leafletMap.setMaxBounds(leafletMap.getBounds().pad(0.05));

        // Add the cafe and its neighbours to the map
        jsonLayer = L.geoJson(geojson, {
          pointToLayer: function (feature, latlng) {
            if (feature.properties.type && feature.properties.type == "nearby_cafe") {
              geojsonMarkerOptions.fillColor = "#727272";
            }
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

      }, error: function() {
        console.log("Error with Show map");
      }
    });

  }

  function mapSearch() {
    // Request cafes within the current map extent

    extent = leafletMap.getBounds();
    var northEast = extent._northEast.wrap();
    var southWest = extent._southWest.wrap();

    url = "cafes.json?bbox=" + southWest.lat + "," + southWest.lng + "," + northEast.lat + "," + northEast.lng;
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
        featureGroup = L.featureGroup()
        featureGroup.addLayer(jsonLayer)
        featureGroup.addTo(leafletMap);

        // Create a new text entry for each cafe
        var html = '';
        for (var idx = 0; idx <geojson.length; idx++) {
          if (idx % 3 == 0) {
            html += "<div class='row'>";
          }
          cafe = geojson[idx].properties;
          html += "<div class='col-md-4 cafe_content' id='" + cafe.id + "''>";
          html += "<div class='name'><h2><a href=cafes/" + cafe.url + ">" + cafe.name + "<span class='link-spanner'></span></a></h2></div>";
          html += "<div class='address'><h4>" + cafe.address + "</h4></div>";

          html += "<div id='social' class='clearfix'>";
          html += "<span><i class='fa fa-comments-o'></i>" + cafe.comment_count + "</span>"
          html += "<span><i class='fa fa-thumbs-o-up'></i>" + cafe.likes + "</span>"
          html += "<span><i class='fa fa-thumbs-o-down'></i>" + cafe.dislikes + "</span>"
          html += "</div>" // social

          html += "<div class='summary'><p>" + cafe.description + "</p></div>";

          html += "</div>"; // cafe_content
          if (idx % 3 == 2) {
            html += "</div>"
          }
        }
        $("#results").html(html);
  
      },
      error: function() {
        console.log("Error with Index map");
      }
    });
  }
};

$(document).ready(ready);
$(document).on('page:load', ready);