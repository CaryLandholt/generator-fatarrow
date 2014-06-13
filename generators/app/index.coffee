chalk  = require 'chalk'
logo   = require 'fatarrow-ascii-art'
path   = require 'path'
yeoman = require 'yeoman-generator'

Base  = yeoman.generators.Base
check = chalk.green '✓'

class AppGenerator extends Base
	init: ->
		@pkg = require '../../package.json'

		@on 'end', ->
			cb = =>
				@log()
				@log logo
				@log()
				@log chalk.magenta "Just type 'gulp' to fire up '#{@appname}'!"
				@log()

			@installDependencies callback: cb unless @options['skip-install']

	splash: ->
		@log logo
		@log chalk.magenta 'Get ready to create your fatarrow app!'
		@log()

	askFor: ->
		done = @async()

		prompts = [
			name    : 'appname'
			message : 'What do you want to call your app?'
			default : path.basename process.cwd()
		,
			name    : 'appdescription'
			message : 'Please provide a description for your app.'
			default : 'a fatarrow app'
		]

		###
		,
			name    : 'features'
			type    : 'checkbox'
			message : 'What more would you like?'
			choices: [
				value   : 'includeTwitterBootstrap'
				name    : 'Twitter Bootstrap'
				checked : true
			,
				value   : 'includeExamples'
				name    : 'Examples'
				checked : true
			]
		###

		hasFeature = (features, feature) ->
			features.indexOf(feature) isnt -1

		@prompt prompts, (props) =>
			# features                 = props.features
			@appdescription          = props.appdescription
			@appname                 = props.appname
			@includeTwitterBootstrap = true
			@includeExamples         = true
			# @includeTwitterBootstrap = hasFeature features, 'includeTwitterBootstrap'
			# @includeExamples         = hasFeature features, 'includeExamples'

			done()

	scaffold: ->
		if @includeExamples
			@directory 'src', 'src', true
		else
			@directory 'src/app', 'src/app', true
			@directory 'src/home', 'src/home', true

		@copy 'home/_home.html', 'src/home/home.html'
		@copy 'home/_homeController.coffee', 'src/home/homeController.coffee'

		@directory 'e2e', 'e2e', true
		@copy '_README.md', 'README.md'

	config: ->
		@copy '_config.coffee', 'config.coffee'

	bower: ->
		@copy 'bowerrc', '.bowerrc'

	gulp: ->
		@copy 'gulpfile.coffee', 'gulpfile.coffee'

	npm: ->
		context =
			appdescription : @appdescription
			appname        : @appname

		@template '_package.json', 'package.json', context

	git: ->
		@copy 'gitignore', '.gitignore'

	ci: ->
		@copy 'travis.yml', '.travis.yml'

module.exports = AppGenerator