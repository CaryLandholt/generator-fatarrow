angular.module('app').directive('markdown', function(markdownService) {
	var link = function(scope, element) {
		var code = element.text();
		var html = markdownService.convert(code);
		element.html(html);
	};
	return {
		link: link,
		replace: true,
		restrict: 'E'
	};
});
