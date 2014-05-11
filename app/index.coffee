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
			message : 'app name?'
			default : path.basename process.cwd()
		,
			name    : 'appdescription'
			message : 'app description?'
			default : 'a fatarrow app'
		]

		@prompt prompts, ((props) ->
			@appdescription = props.appdescription
			@appname        = props.appname

			done()
		).bind this

	scaffold = ->
		@log '\n', chalk.magenta 'Tree:'
		@directory 'src', 'src', true
		@directory 'e2e', 'e2e', true
		@copy '_README.md', 'README.md'

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

	init     : init
	splash   : splash
	askFor   : askFor
	scaffold : scaffold
	gulp     : gulp
	npm      : npm

module.exports = Generator