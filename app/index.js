var util   = require('util');
var path   = require('path');
var yeoman = require('yeoman-generator');
var chalk  = require('chalk');

var FatarrowGenerator = yeoman.generators.Base.extend({
	init: function () {
		this.pkg = require('../package.json');

		this.on('end', function () {
			if (!this.options['skip-install']) {
				this.installDependencies();
			}
		});
	},

	askFor: function () {
		var done = this.async();

		// have Yeoman greet the user
		this.log(this.yeoman);

		// replace it with a short and sweet description of your generator
		this.log(chalk.magenta('You\'re using the fantastic fatarrow generator.'));

		var prompts = [{
			type: 'confirm',
			name: 'someOption',
			message: 'Would you like to build a fatarrow app?',
			default: true
		}];

		this.prompt(prompts, function (props) {
			this.someOption = props.someOption;

			done();
		}.bind(this));
	},

	app: function () {
		this.directory('src', 'src', true);

		this.copy('_package.json', 'package.json');
		this.copy('config.coffee', 'config.coffee');
		this.copy('gulpfile.js', 'gulpfile.js');
		this.copy('gulpfile.coffee', 'gulpfile.coffee');
	},

	projectfiles: function () {}
});

module.exports = FatarrowGenerator;