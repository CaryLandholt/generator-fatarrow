angular.module('app').factory('markdownService', function($window) {
	var converter = new $window.Showdown.converter();
	return {
		convert: function(content) {
			return converter.makeHtml(content);
		}
	};
});
