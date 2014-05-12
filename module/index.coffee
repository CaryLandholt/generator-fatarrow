_      = require 'underscore'
_.str  = require 'underscore.string'
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

class ModuleGenerator extends yeoman.generators.NamedBase
	init = ->
		@on 'end', ->
			@log logo
			@log()
			@log magenta "Module '#{@name}' created!"
			@log()

	names = ->
		@className      = _.str.classify "#{@name}"
		moduleName      = _.str.camelize _.str.slugify "#{@name}"
		@controllerName = "#{moduleName}Controller"
		directory       = "src/#{moduleName}"
		@routePath      = _.str.slugify "#{@name}"
		@viewName       = "#{@routePath}.html"
		@viewUrl        = "/#{moduleName}/#{@viewName}"
		@viewPath       = "#{directory}/#{@viewName}"
		@controllerPath = "#{directory}/#{moduleName}Controller.coffee"
		@routesPath     = "#{directory}/#{moduleName}Routes.coffee"

	scaffold = ->
		@copy 'src/module/module.html', @viewPath
		@copy 'src/module/moduleController.coffee', @controllerPath
		@copy 'src/module/moduleRoutes.coffee', @routesPath

	init     : init
	names    : names
	scaffold : scaffold

module.exports = ModuleGenerator