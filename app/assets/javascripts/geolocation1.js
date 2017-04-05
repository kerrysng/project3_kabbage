var places = [{place:'Melbourne',lat: -37.663712,long: 144.844788},{place:'Perth',lat:-31.953512,long:115.857048},{place:'Singapore',lat:1.290270 , long:103.851959},{place: 'San Francisco',lat: 37.773972, long: -122.431297}];
function initPinMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 2,
    center: new google.maps.LatLng(2.8,-187.3),
    mapTypeId: 'terrain'
  });

  var flightPlanCoordinates = [
          {lat: -37.663712, lng: 144.844788},
          {lat: -31.953512, lng: 115.857048},
          {lat: 1.290270, lng: 103.851959},
          {lat: 37.773972, lng: -122.431297}
        ];

  var flightPath = new google.maps.Polyline({
          path: flightPlanCoordinates,
          geodesic: true,
          strokeColor: '#FF0000',
          strokeOpacity: 1.0,
          strokeWeight: 2
        });

        flightPath.setMap(map);

  for (var i = 0; i < places.length; i++) {
    var latLng = new google.maps.LatLng(places[i].lat,places[i].long);
    var marker = new google.maps.Marker({
      position: latLng,
      map: map,
      label: i.toString(),
      animation: google.maps.Animation.DROP,
      title: places[i].place // placeholder for each marker
    });
  }
}
