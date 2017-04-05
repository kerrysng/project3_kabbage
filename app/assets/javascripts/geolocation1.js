function initPinMap() {
  var places = [];
  var flightPlanCoordinates = [];
  var $id = $('#trip_id').val();
  $.ajax({
    url: '/api/trips/'+ $id
  }).done(function(data){
    for(var i=0; i<data.length; i++){
      places.push(createObject(data[i].city,data[i].lat,data[i].long));
      flightPlanCoordinates.push({lat:data[i].lat,lng:data[i].long});
    }
    var map = new google.maps.Map(document.getElementById('mapPin'), {
      zoom: 6,
      center: new google.maps.LatLng(data[0].lat,data[0].long),
      mapTypeId: 'terrain'
    });
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
  })

  function createObject(location, latitude, longitude){
    return {place:location,lat:latitude, long:longitude};
  }
}
