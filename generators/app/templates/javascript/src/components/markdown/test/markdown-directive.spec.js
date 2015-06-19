describe('markdown', function() {
  return describe('markdown directive', function() {
    beforeEach(module('app'));
    beforeEach(inject(function($compile, $rootScope) {
      this.$compile = $compile;
      return this.scope = $rootScope.$new();
    }));
    it('renders html from a single line of markdown', function() {
      var controller, element, expected, html, markup;
      markup = "<markdown>\n# fatarrow\n</markdown>";
      element = this.$compile(markup)(this.scope);
      controller = element.controller();
      html = element.html();
      expected = '<h1 id="fatarrow">fatarrow</h1>';
      return expect(html).toEqual(expected);
    });
    return it('renders html from multiple lines of markdown', function() {
      var controller, element, expected, html, markup;
      markup = "<markdown>\n# fatarrow\n## Table of Contents\n</markdown>";
      element = this.$compile(markup)(this.scope);
      controller = element.controller();
      html = element.html();
      expected = "<h1 id=\"fatarrow\">fatarrow</h1>\n\n<h2 id=\"tableofcontents\">Table of Contents</h2>";
      return expect(html).toEqual(expected);
    });
  });
});
