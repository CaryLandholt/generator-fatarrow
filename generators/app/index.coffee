_      = require 'underscore'
chalk  = require 'chalk'
logo   = require 'fatarrow-ascii-art'
path   = require 'path'
yeoman = require 'yeoman-generator'

Base  = yeoman.generators.Base
check = chalk.green '✓'

class Generator extends Base
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
		,
			name    : 'includeExamples'
			type    : 'confirm'
			message : 'Would you like code examples?'
			default : true
		,
			name    : 'scriptLanguages'
			type    : 'checkbox'
			message : 'What scripting languages in addition to JavaScript would you like?'
			choices: [
				value   : 'coffeeScript'
				name    : 'CoffeeScript'
				checked : true
			,
				value   : 'babel'
				name    : 'Babel'
				checked : false
			,
				value   : 'liveScript'
				name    : 'LiveScript'
				checked : false
			,
				value   : 'typeScript'
				name    : 'TypeScript'
				checked : false
			]
		,
			name    : 'styleLanguages'
			type    : 'checkbox'
			message : 'What styling languages in addition to CSS would you like?'
			choices: [
				value   : 'less'
				name    : 'Less'
				checked : false
			,
				value   : 'sass'
				name    : 'Sass'
				checked : false
			]
		,
			name    : 'templateLanguages'
			type    : 'checkbox'
			message : 'What templating languages in addition to HTML would you like?'
			choices: [
				value   : 'haml'
				name    : 'Haml'
				checked : false
			,
				value   : 'jade'
				name    : 'Jade'
				checked : false
			,
				value   : 'makdown'
				name    : 'Markdown'
				checked : false
			]
		]

		hasFeature = (features, feature) ->
			features.indexOf(feature) isnt -1

		@prompt prompts, (props) =>
			@appdescription          = props.appdescription
			@appname                 = props.appname
			@includeTwitterBootstrap = true
			@includeExamples         = props.includeExamples
			@scriptLanguages         = props.scriptLanguages
			@styleLanguages          = props.styleLanguages
			@templateLanguages       = props.templateLanguages

			done()

	scaffold: ->
		if @includeExamples
			@directory 'coffeescript/src', 'src', true
		else
			@directory 'coffeescript/src/app', 'src/app', true
			@directory 'coffeescript/src/components/markdown', 'src/components/markdown', true
			@copy 'coffeescript/src/index.html', 'src/index.html', true

		@directory 'coffeescript/e2e', 'e2e', true
		@copy '_README.md', 'README.md'

	config: ->
		@template '_config.coffee', 'config.coffee'
		@copy '_protractor.config.coffee', 'protractor.config.coffee'


	bower: ->
		@copy 'bowerrc', '.bowerrc'

	gulp: ->
		@copy 'gulpfile.coffee', 'gulpfile.coffee'

	npm: ->
		context =
			appdescription       : @appdescription
			appname              : @appname
			scriptLanguages      : @scriptLanguages
			includeCoffeeScript  : _.some @scriptLanguages, (x) -> x is 'coffeeScript'
			includeBabel         : _.some @scriptLanguages, (x) -> x is 'babel'
			includeTypeScript    : _.some @scriptLanguages, (x) -> x is 'typeScript'
			includeLiveScript    : _.some @scriptLanguages, (x) -> x is 'liveScript'
			includeLess          : _.some @scriptLanguages, (x) -> x is 'less'
			includeSass          : _.some @scriptLanguages, (x) -> x is 'sass'
			includeHaml          : _.some @scriptLanguages, (x) -> x is 'haml'
			includeJade          : _.some @scriptLanguages, (x) -> x is 'jade'
			includeMarkdown      : _.some @scriptLanguages, (x) -> x is 'markdown'

		@template '_package.json', 'package.json', context

	git: ->
		@copy 'gitignore', '.gitignore'

	ci: ->
		@copy 'travis.yml', '.travis.yml'

module.exports = Generator
