class <%= className %> extends Controller
	constructor: ($log<% if (includeService) { %><%= ', ' + serviceName %><% }%>) ->
		$log.info '<%= controllerName %> instantiated.'