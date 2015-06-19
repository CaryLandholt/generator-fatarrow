angular.module('app').directive('markdown', function (markdownService) {
	var link = function(scope, element, attrs) {
		var code, html;
		code = element.text();
		html = markdownService.convert(code);
		element.html(html);
	};
	return {
		link: link,
		replace: true,
		restrict: 'E',
	};
});
