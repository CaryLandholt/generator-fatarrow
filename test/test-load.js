/*global describe, beforeEach, it*/
var assert = require('assert');

describe('fatarrow generator', function () {
	it('can be imported without blowing up', function () {
		var app = require('../generators/app');

		assert(app !== undefined);
	});
});