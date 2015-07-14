module.exports = (function() {
  function _Class() {
    this.visitPage = function() {
      return browser.get('/');
    };
    this.getTitle = function() {
      return browser.getTitle();
    };
  }

  return _Class;

})();
