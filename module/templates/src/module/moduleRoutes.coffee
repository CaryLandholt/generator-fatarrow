class <%= className %>Routes extends Config
	constructor: ($routeProvider) ->
		$routeProvider
		.when '<%= routePath %>',
			caption: '<%= name %>'
			controller: '<%= controllerName %>'
			controllerAs: 'controller'
			templateUrl: '<%= viewUrl %>'