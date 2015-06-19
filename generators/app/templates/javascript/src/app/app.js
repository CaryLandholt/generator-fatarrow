/* jshint ignore:start */
angular.module('app', [
	'ngAnimate',
	'ngRoute',
	<% if (useBackendless) { %>
	'ngMockE2E',
	<% } %>
	'angular-loading-bar'
]);
/* jshint ignore:end */
