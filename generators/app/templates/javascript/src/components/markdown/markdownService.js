angular.module('app').factory('markdownService', function ($window) {
	var converter = new $window.Showdown.converter();
	return {
		convert: function(content) {
			var html;
			return html = converter.makeHtml(content);
		}
	};
});
