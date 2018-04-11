//  init autocomplete input
//  get result address + lat + lng
//  store in session


document.addEventListener("DOMContentLoaded", function() {

  var placeSearch, autocomplete;
  var componentForm = {
    street_number: 'short_name',
    route: 'long_name',
    locality: 'long_name',
    administrative_area_level_1: 'short_name',
    country: 'long_name',
    postal_code: 'short_name'
  };
  var autocomplete_field = document.getElementById('field3');
  var userlat = document.getElementById('user_latitude');
  var userlng = document.getElementById('user_longitude');


  function initAutocomplete() {
    autocomplete = new google.maps.places.Autocomplete((autocomplete_field), {types: ['geocode']});
    autocomplete.addListener('place_changed', onPlaceChanged);
  }

  function onPlaceChanged() {
    var place = this.getPlace();
    var components = getAddressComponents(place);
    userlat.value = place.geometry.location.lat();
    userlng.value = place.geometry.location.lng();
  }

  function getAddressComponents(place) {

    if (window.console && typeof console.log === "function") {
      console.log(place);
    }

    var street_number = null;
    var route = null;
    var zip_code = null;
    var city = null;
    var country_code = null;
    for (var i in place.address_components) {
      var component = place.address_components[i];
      for (var j in component.types) {
        var type = component.types[j];
        if (type === 'street_number') {
          street_number = component.long_name;
        } else if (type === 'route') {
          route = component.long_name;
        } else if (type === 'postal_code') {
          zip_code = component.long_name;
        } else if (type === 'locality') {
          city = component.long_name;
        } else if (type === 'postal_town' && city === null) {
          city = component.long_name;
        } else if (type === 'country') {
          country_code = component.short_name;
        }
      }
    }

    return {
      address: street_number === null ? route : (street_number + ' ' + route),
      zip_code: zip_code,
      city: city,
      country_code: country_code
    };
  }

  if (autocomplete_field) {
    google.maps.event.addDomListener(autocomplete_field, 'keydown', function(e) {
      if (e.key === "Enter") {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
  if (autocomplete_field) {
    initAutocomplete();
  }

});
