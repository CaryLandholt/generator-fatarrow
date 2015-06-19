angular.module('app').run(function($httpBackend) {
	return $httpBackend.whenGET(/^.*\.(html|htm)$/).passThrough();
});
