/*global describe, beforeEach, it */
var path = require('path');
var helpers = require('yeoman-generator').test;

describe('fatarrow generator', function () {
	beforeEach(function (done) {
		helpers.testDirectory(path.join(__dirname, 'temp'), function (err) {
			if (err) {
				return done(err);
			}

			this.app = helpers.createGenerator('fatarrow:app', [
				'../../app'
			]);

			done();
		}.bind(this));
	});

	it('creates expected files', function (done) {
		var expected = [
			// add files you expect to exist here.
		];

		helpers.mockPrompt(this.app, {
			'someOption': true
		});

		this.app.options['skip-install'] = true;
		this.app.run({}, function () {
			helpers.assertFile(expected);
			done();
		});
	});
});