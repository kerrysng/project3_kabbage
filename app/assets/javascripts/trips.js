$(document).ready(function(){

  $('#create_new_card').on('click',function(){
    var $newForm = $('#new_card_container').append(createForm());
    geoLocation();
  });

  function createForm(){
    var $form = $('<form>').attr('class','new-card-form');
    var $input1 = $('<input>').attr('type','text').attr('name','lat').attr('id','latitude');
    var $input2 = $('<input>').attr('type','text').attr('name','long').attr('id','longitude');
    var $input3 = $('<input>').attr('type','text').attr('name','country').attr('id','country');
    var $input4 = $('<input>').attr('type','text').attr('name','city').attr('id','city');
    var $input5 = $('<input>').attr('type','text').attr('name','trip_id').attr('id','tripId');
    var $label1 = $('<label>').text("Image URL");
    var $input6 = $('<input>').attr('type','text').attr('name','image_url');
    var $label2 = $('<label>').text("Description");
    var $input7 = $('<input>').attr('type','text').attr('name','body');
    var $button = $('<button>').text("Please Wait").addClass('btn btn-warning').attr('id','submit-btn');
    return $form.append($input1).append($input2).append($input3).append($input4).append($input5).append($label1).append($input6).append($label2).append($input7).append($button);
  }

  function geoLocation(){
    initiate_geolocation();
    function initiate_geolocation() {
      navigator.geolocation.getCurrentPosition(handle_geolocation_query);
    }

    function handle_geolocation_query(position){
      debugger
      var a = position.coords.latitude.toFixed(6);
      var b = position.coords.longitude.toFixed(6);
      var latlng = {lat: parseFloat(a), lng: parseFloat(b)};
      $('#latitude').val(a);
      $('#longitude').val(b);
      $('#tripId').val($('#trip_id').val());
      var geocoder = new google.maps.Geocoder;
      var infowindow = new google.maps.InfoWindow;
      geocoder.geocode({'location': latlng}, function(results, status) {
        var locationArray = results[5].formatted_address.split(", ");
        $('#country').val(locationArray[2]);
        $('#city').val(locationArray[0]);
        $('#submit-btn').removeClass("btn-warning").addClass("btn-success").text("Submit");
      })
    }

    $('.new-card-form').on('submit',function(event){
      event.preventDefault();
      console.log("hello this button is working")
      $.ajax({
        url: '/api/cards',
        method: 'post',
        data: $('.new-card-form').serialize()
      }).done(function(data){
        var card = new Card(data)
        var view = new DashboardCardItemView({model: card});
        $('.cards_container').append(view.render().el);
        $('#new_card_container').empty();
      })
    })
  }
})
