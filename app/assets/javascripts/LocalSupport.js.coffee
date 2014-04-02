app = angular.module('LocalSupport', ['ngResource'])

app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

app.factory 'Organizations', ['$resource', ($resource) ->
  $resource('/organizations/:id.json', {id: '@id'}, {query: {method: 'GET', isArray: true }})
]

@OrganizationsCtrl = ['$scope', 'Organizations', ($scope, Organizations) ->
  thing = Organizations.query()
  $scope.organizations = thing
]