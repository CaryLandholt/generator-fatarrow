describe('markdown', function() {
	return describe('markdownService', function() {
		beforeEach(module('app'));
		beforeEach(inject(function(markdownService) {
			this.markdownService = markdownService;
		}));

		it('converts html from a single line of markdown', function() {
			var markdown = '# fatarrow';
			var html = this.markdownService.convert(markdown);
			var expected = '<h1 id="fatarrow">fatarrow</h1>';
			return expect(html).toEqual(expected);
		});

		return it('converts html from multiple lines of markdown', function() {
			var markdown = '# fatarrow\n## Table of Contents';
			var html = this.markdownService.convert(markdown);
			var expected = '<h1 id=\"fatarrow\">' +
			'fatarrow</h1>\n\n<h2 id=\"tableofcontents\">Table of Contents</h2>';
			return expect(html).toEqual(expected);
		});
	});
});
