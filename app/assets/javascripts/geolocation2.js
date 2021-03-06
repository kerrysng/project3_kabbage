function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -34.397, lng: 150.644},
    zoom: 15
  });
  var geocoder = new google.maps.Geocoder;
  var infowindow = new google.maps.InfoWindow;
  var infoWindow = new google.maps.InfoWindow({map: map});

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      $('#latitude').attr('value',pos.lat);
      $('#longitude').attr('value',pos.lng);

      geocoder.geocode({'location': pos}, function(results, status) {
        if (status === 'OK') {
          if (results[1]) {
            map.setZoom(11);
            var marker = new google.maps.Marker({
              position: pos,
              map: map
            });
            var cityCountry = results[5].formatted_address;
            var cityArray = cityCountry.split(", ");
            $('#country').attr('value',cityArray[2]);
            $('#city').attr('value',cityArray[0]);
            infowindow.setContent(results[1].formatted_address);
            infowindow.open(map, marker);
          } else {
            window.alert('No results found');
          }
        } else {
          window.alert('Geocoder failed due to: ' + status);
        }
      });

      // infoWindow.setPosition(pos);
      // infoWindow.setContent('You Are Here.');
      map.setCenter(pos);
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }
  function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(browserHasGeolocation ?
      'Error: The Geolocation service failed.' :
      'Error: Your browser doesn\'t support geolocation.');
  }
}

//
// function initMap() {
//   var directionsService = new google.maps.DirectionsService;
//   var directionsDisplay = new google.maps.DirectionsRenderer;
//   var map = new google.maps.Map(document.getElementById('map'), {
//     zoom: 3,
//     center: {lat: -31.953512, lng: 115.857048}
//   });
//   directionsDisplay.setMap(map);
//
//   calculateAndDisplayRoute(directionsService, directionsDisplay);
//
//   function calculateAndDisplayRoute(directionsService, directionsDisplay) {
//     var waypts = [{lat: -37.663712,long: 144.844788},{lat:-31.953512,long:115.857048}];
//
//     directionsService.route({
//       origin: document.getElementById('start').value,
//       destination: document.getElementById('end').value,
//       waypoints: waypts,
//       optimizeWaypoints: true,
//       travelMode: 'DRIVING'
//     }, function(response, status) {
//       if (status === 'OK') {
//         directionsDisplay.setDirections(response);
//         var route = response.routes[0];
//         var summaryPanel = document.getElementById('directions-panel');
//         summaryPanel.innerHTML = '';
//         // For each route, display summary information.
//         for (var i = 0; i < route.legs.length; i++) {
//           var routeSegment = i + 1;
//           summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment +
//           '</b><br>';
//           summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
//           summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
//           summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
//         }
//       } else {
//         window.alert('Directions request failed due to ' + status);
//       }
//     });
//   }
//
// }
