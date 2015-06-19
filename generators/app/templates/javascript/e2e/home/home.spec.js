var HomePage;

HomePage = require('./HomePage');

describe('Home Page', function() {
  beforeEach(function() {
    this.page = new HomePage();
    return this.page.visitPage();
  });
  return it('should have title', function() {
    return expect(this.page.getTitle()).toEqual('fatarrow');
  });
});
