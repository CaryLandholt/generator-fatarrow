angular.module('app').config(['$routeProvider',
	function Routes ($routeProvider) {
		$routeProvider
		.when('/', {
			controller: 'homeController',
			controllerAs: 'controller',
			templateUrl: 'home/home.html'
		});
	}
]);
