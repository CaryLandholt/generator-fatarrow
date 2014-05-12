class <%= className %>Routes extends Config
	constructor: ($routeProvider) ->
		$routeProvider
		.when '<%= routeUrl %>',
			caption: '<%= name %>'
			controller: '<%= controllerName %>'
			controllerAs: 'controller'
			templateUrl: '<%= viewName %>'