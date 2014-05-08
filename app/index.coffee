util   = require 'util'
path   = require 'path'
yeoman = require 'yeoman-generator'
chalk  = require 'chalk'

green   = chalk.green
magenta = chalk.magenta
white   = chalk.white
check   = green '✓'

class Generator extends yeoman.generators.Base
	init: ->
		@pkg = require '../package.json'

		@on 'end', ->
			@installDependencies() unless @options['skip-install']

	askFor: ->
		done = @async()

		@log @yeoman
		@log magenta 'You\'re using the fantastic fatarrow generator.'

		prompts = [
			name: 'appName'
			message: 'What is your app\'s name?'
			validate: (input) ->
				!!input
		]

		@prompt prompts, ((props) ->
			@appName = props.appName

			done()
		).bind this

	tree: ->
		@log '\n', chalk.magenta 'Tree:'
		@directory 'src', 'src', true

	gulp: ->
		@log '\n', check, white 'gulp'
		@copy 'config.coffee', 'config.coffee'
		@copy 'gulpfile.js', 'gulpfile.js'
		@copy 'gulpfile.coffee', 'gulpfile.coffee'

	npm: ->
		@log '\n', check, white 'npm'

		context =
			appname: @appName

		@template '_package.json', 'package.json', context

module.exports = Generator