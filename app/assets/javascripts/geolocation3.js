function initMoodPinMap() {
  var places = [];
  var flightPlanCoordinates = [];
  var $id = $('#user_id').val();
  $.ajax({
    url: '/api/moods/'+ $id
  }).done(function(data){
    for(var i=0; i<data.length; i++){
      places.push(createObject(data[i].city,data[i].lat,data[i].long));
      flightPlanCoordinates.push({lat:data[i].lat,lng:data[i].long});
    }
    var map = new google.maps.Map(document.getElementById('mapPin'), {
      zoom: 3,
      center: new google.maps.LatLng(data[0].lat,data[0].long),
      mapTypeId: 'terrain'
    });

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
