describe('markdown', function() {
	return describe('markdown directive', function() {
		beforeEach(module('app'));
		beforeEach(inject(function($compile, $rootScope) {
			this.$compile = $compile;
			this.scope = $rootScope.$new();
		}));

		it('renders html from a single line of markdown', function() {
			var markup = '<markdown>\n# fatarrow\n</markdown>';
			var element = this.$compile(markup)(this.scope);
			var html = element.html();
			var expected = '<h1 id="fatarrow">fatarrow</h1>';
			return expect(html).toEqual(expected);
		});

		it('renders html from multiple lines of markdown', function() {
			var markup = '<markdown>\n# fatarrow\n## Table of Contents\n</markdown>';
			var element = this.$compile(markup)(this.scope);
			var html = element.html();
			var expected = '<h1 id=\"fatarrow\">fatarrow</h1>' +
				'\n\n<h2 id=\"tableofcontents\">Table of Contents</h2>';
			return expect(html).toEqual(expected);
		});
	});
});
