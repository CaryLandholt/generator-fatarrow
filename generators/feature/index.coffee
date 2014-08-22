_      = require 'underscore'
_.str  = require 'underscore.string'
chalk  = require 'chalk'
logo   = require 'fatarrow-ascii-art'
path   = require 'path'
yeoman = require 'yeoman-generator'

check     = chalk.green '✓'
NamedBase = yeoman.generators.NamedBase

class Generator extends NamedBase
	init: ->
		@on 'end', ->
			@log logo
			@log()
			@log chalk.magenta "Feature '#{@name}' created!"
			@log()

	splash: ->
		@log logo
		@log chalk.magenta "Get ready to create your '#{@name}' fatarrow feature!"
		@log()

	askFor: ->
		done = @async()

		prompts = [
			name    : 'features'
			type    : 'checkbox'
			message : 'What would you like to include?'
			choices: [
				value   : 'includeController'
				name    : 'Controller'
				checked : true
			,
				value   : 'includeRoute'
				name    : 'Route'
				checked : true
			,
				value   : 'includeService'
				name    : 'Service'
				checked : true
			]
		]

		hasFeature = (features, feature) ->
			features.indexOf(feature) isnt -1

		@prompt prompts, (props) =>
			features           = props.features
			@includeController = hasFeature features, 'includeController'
			@includeRoute      = hasFeature features, 'includeRoute'
			@includeService    = hasFeature features, 'includeService'

			done()

	names: ->
		unixifyPath = (p) ->
			regex = /\\/g
			p.replace regex, '/'

		normalized               = _.str.underscored @name
		featureDirectory         = _.str.camelize normalized
		featureDirectorySegments = featureDirectory.split '/'
		featureName              = featureDirectorySegments[featureDirectorySegments.length - 1]
		dasherized               = _.str.dasherize featureName
		@className               = _.str.classify featureName
		@directory               = path.join 'src', featureDirectory
		@controllerName          = "#{featureName}Controller"
		@controllerPath          = path.join @directory, @controllerName + '.coffee'
		routeName                = "#{featureName}Routes"
		@routePath               = path.join @directory, routeName + '.coffee'
		@routeUrl                = unixifyPath path.join('/', featureDirectory)
		@serviceName             = "#{featureName}Service"
		@servicePath             = path.join @directory, @serviceName + '.coffee'
		@viewName                = unixifyPath path.join(featureDirectory, dasherized + '.html')
		@viewPath                = path.join @directory, dasherized + '.html'

	scaffold: ->
		@log '\n', chalk.magenta 'Tree:'
		@mkdir @directory

		if @includeController
			@copy 'src/feature/featureController.coffee', @controllerPath

		if @includeRoute
			@copy 'src/feature/featureRoutes.coffee', @routePath
			@copy 'src/feature/feature.html', @viewPath

		if @includeService
			@copy 'src/feature/featureService.coffee', @servicePath

module.exports = Generator