//= require gmaps/google
//= require underscore.min
//= require angular.min
//= require angular-google-maps.min
//= require_self
//= require_tree .

window.LocalSupport = angular.module('LocalSupport', ['google-maps']);

LocalSupport.controller('MapController', ['$scope',
  function($scope) {
    $scope.map = {
      center: {
        latitude: 51.5978,
        longitude: -0.3370
      },
      zoom: 12
    };
  };
]);
