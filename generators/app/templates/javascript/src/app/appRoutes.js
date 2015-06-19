angular.module('app').config(function ($routeProvider) {
	$routeProvider.otherwise({redirectTo: '/'});
});
