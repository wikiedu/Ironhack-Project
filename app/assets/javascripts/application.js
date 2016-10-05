// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require underscore
//= require gmaps/google
$(function() {
  navigator.geolocation.getCurrentPosition(success, error, options);
});

var options = {
  enableHighAccuracy: true,
  maximumAge: 0
};

function success(pos) {
  var crd = pos.coords;
  console.log('Your current position is:');
  console.log('Latitude : ' + crd.latitude);
  console.log('Longitude: ' + crd.longitude);
  console.log('More or less ' + crd.accuracy + ' meters.');
  $.ajax({
            type: 'POST',
            url: '/update_geolocation',
            data: { lat: crd.latitude, long: crd.longitude }

        });
};

function error(err) {
  console.warn('ERROR(' + err.code + '): ' + err.message);
};


function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 14,
    center: {lat: 59.323, lng: 18.010}
  });

  var layer = new google.maps.visualization.DynamicMapsEngineLayer({
    layerId: '06673056454046135537-08896501997766553811',
    map: map,
    suppressInfoWindows: true,
    clickable: true
  });

  layer.addListener('mouseover', function(event) {
    var style = layer.getFeatureStyle(event.featureId);
    style.fillColor = colors[event.featureId - 1];
    style.fillOpacity = '0.8';
  });

  layer.addListener('mouseout', function(event) {
    layer.getFeatureStyle(event.featureId).resetAll();
  });
}

var colors = ['red', 'blue', 'yellow', 'green'];
