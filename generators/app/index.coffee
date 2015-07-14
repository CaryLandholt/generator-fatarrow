_      = require 'underscore'
chalk  = require 'chalk'
logo   = require 'fatarrow-ascii-art'
path   = require 'path'
pkg    = require '../../package.json'
yeoman = require 'yeoman-generator'

Base  = yeoman.generators.Base
check = chalk.green '✓'

class Generator extends Base
	initializing: ->
		@pkg = require '../../package.json'

	install: ->
		@npmInstall()

	end: ->
		@log()
		@log logo
		@log()
		@log chalk.magenta "Just type 'gulp' to fire up '#{@appname}'!"
		@log()

	splash: ->
		@log logo
		@log chalk.magenta 'Get ready to create your fatarrow app!'
		@log()

	prompting: ->
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
				value   : 'markdown'
				name    : 'Markdown'
				checked : false
			]
		]

		upgradePrompt = [
			name    : 'upgrade'
			message : 'It looks like you are upgrading your project. Continue?'
			type    : 'confirm'
		]

		@isUpgrade = !!@config.get 'version'

		if @isUpgrade
			@prompt upgradePrompt, (props) =>
				done() if !!props.upgrade
				@appdescription          = @config.get 'appdescription'
				@appname                 = @config.get 'appname'
				@scriptLanguages         = @config.get 'scriptLanguages'
				@styleLanguages          = @config.get 'styleLanguages'
				@templateLanguages       = @config.get 'templateLanguages'
				done()
		else
			@prompt prompts, (props) =>
				@appdescription          = props.appdescription
				@appname                 = props.appname
				@includeTwitterBootstrap = true
				@includeExamples         = props.includeExamples
				@scriptLanguages         = props.scriptLanguages
				@styleLanguages          = props.styleLanguages
				@templateLanguages       = props.templateLanguages

				@config.set 'appname', @appname
				@config.set 'appdescription', @appdescription
				@config.set 'scriptLanguages', @scriptLanguages
				@config.set 'styleLanguages', @styleLanguages
				@config.set 'templateLanguages', @templateLanguages
				@config.set 'version', pkg.version

				@config.save()
				done()

	scaffold: ->
		return if @isUpgrade

		includeCoffeeScript = _.some @scriptLanguages, (x) -> x is 'coffeeScript'
		if @includeExamples
			if includeCoffeeScript
				@directory 'coffeescript/src', 'src', true
			else
				@directory 'javascript/src', 'src', true
		else
			if includeCoffeeScript
				@directory 'coffeescript/src/app', 'src/app', true
				@directory 'coffeescript/src/components/markdown', 'src/components/markdown', true
				@copy 'coffeescript/src/index.html', 'src/index.html', true
			else
				@directory 'javascript/src', 'src', true

		if includeCoffeeScript
			@directory 'coffeescript/e2e', 'e2e', true
		else
			@directory 'javascript/e2e', 'e2e', true

		@copy '_README.md', 'README.md'

	config: ->
		return if @isUpgrade
		@directory 'config', 'config'

	bower: ->
		return if @isUpgrade
		@copy 'bowerrc', '.bowerrc'

	gulp: ->
		@directory 'tasks', 'tasks'
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
			includeLess          : _.some @styleLanguages, (x) -> x is 'less'
			includeSass          : _.some @styleLanguages, (x) -> x is 'sass'
			includeHaml          : _.some @templateLanguages, (x) -> x is 'haml'
			includeJade          : _.some @templateLanguages, (x) -> x is 'jade'
			includeMarkdown      : _.some @templateLanguages, (x) -> x is 'markdown'

		@template '_package.json', 'package.json', context

	git: ->
		@copy 'gitignore', '.gitignore'

	ci: ->
		@copy 'travis.yml', '.travis.yml'

module.exports = Generator
