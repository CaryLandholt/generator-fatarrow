//jscs:disable
angular.module('app', [
	'ngAnimate',
	'ngRoute',
	<%% if (useBackendless) { %>
	'ngMockE2E',
	<%% } %>
	'angular-loading-bar'

]);
