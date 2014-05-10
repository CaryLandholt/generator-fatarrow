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
			@installDependencies() unless @options['skip-install']

	splash = ->
		@log logo
		@log magenta 'Get ready to create your fatarrow app!'
		@log ''

	askFor = ->
		done = @async()

		prompts = [
			name    : 'appname'
			message : 'app name?'
			default : path.basename process.cwd()
		,
			name    : 'appdescription'
			message : 'app description?'
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
		@directory 'e2e', 'e2e', true

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
	splash : splash
	askFor : askFor
	tree   : tree
	gulp   : gulp
	npm    : npm

module.exports = Generator