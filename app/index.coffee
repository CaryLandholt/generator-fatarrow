chalk  = require 'chalk'
path   = require 'path'
util   = require 'util'
yeoman = require 'yeoman-generator'

green   = chalk.green
magenta = chalk.magenta
white   = chalk.white
check   = green '✓'

class Generator extends yeoman.generators.Base
	init = ->
		@pkg = require '../package.json'

		@on 'end', ->
			@installDependencies() unless @options['skip-install']

	askFor = ->
		done = @async()

		@log @yeoman
		@log magenta 'You\'re using the fantastic fatarrow generator.'

		prompts = [
			name    : 'appname'
			message : 'What is your app\'s name?'
			default : path.basename process.cwd()
		,
			name    : 'appdescription'
			message : 'What is your app\'s description?'
			default : ''
		]

		@prompt prompts, ((props) ->
			@appdescription = props.appdescription
			@appname        = props.appname

			done()
		).bind this

	tree = ->
		@log '\n', chalk.magenta 'Tree:'
		@directory 'src', 'src', true

	gulp = ->
		@log '\n', check, white 'gulp'
		@copy 'config.coffee', 'config.coffee'
		@copy 'gulpfile.js', 'gulpfile.js'
		@copy 'gulpfile.coffee', 'gulpfile.coffee'

	npm = ->
		@log '\n', check, white 'npm'

		context =
			appdescription : @appdescription
			appname        : @appname

		@template '_package.json', 'package.json', context

	init   : init
	askFor : askFor
	tree   : tree
	gulp   : gulp
	npm    : npm

module.exports = Generator