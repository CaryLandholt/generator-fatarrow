chalk  = require 'chalk'
logo   = require 'fatarrow-ascii-art'
path   = require 'path'
util   = require 'util'
yeoman = require 'yeoman-generator'

green   = chalk.green
magenta = chalk.magenta
white   = chalk.white
check   = green '✓'
yellow  = chalk.yellow

class Generator extends yeoman.generators.Base
	init = ->
		@pkg = require '../package.json'

		@on 'end', ->
			cb = =>
				@log()
				@log logo
				@log()
				@log magenta "Just type 'gulp' to fire up '#{@appname}'!"
				@log()

			@installDependencies callback: cb unless @options['skip-install']

	splash = ->
		@log logo
		@log magenta 'Get ready to create your fatarrow app!'
		@log()

	askFor = ->
		done = @async()

		prompts = [
			name    : 'appname'
			message : 'What do you want to call your app?'
			default : path.basename process.cwd()
		,
			name    : 'appdescription'
			message : 'Please provide a description for your app.'
			default : 'a fatarrow app'
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
		]

		hasFeature = (features, feature) ->
			features.indexOf(feature) isnt -1

		@prompt prompts, ((props) ->
			features                 = props.features
			@appdescription          = props.appdescription
			@appname                 = props.appname
			@includeTwitterBootstrap = hasFeature features, 'includeTwitterBootstrap'
			@includeExamples         = hasFeature features, 'includeExamples'

			done()
		).bind this

	scaffold = ->
		@log '\n', chalk.magenta 'Tree:'
		@directory 'src', 'src', true
		@directory 'e2e', 'e2e', true
		@copy '_README.md', 'README.md'

	config = ->
		@log '\n', check, white 'config'
		@copy '_config.coffee', 'config.coffee'

	gulp = ->
		@log '\n', check, white 'gulp'
		@copy 'gulpfile.js', 'gulpfile.js'
		@copy 'gulpfile.coffee', 'gulpfile.coffee'

	npm = ->
		@log '\n', check, white 'npm'

		context =
			appdescription : @appdescription
			appname        : @appname

		@template '_package.json', 'package.json', context

	init     : init
	splash   : splash
	askFor   : askFor
	scaffold : scaffold
	config   : config
	gulp     : gulp
	npm      : npm

module.exports = Generator