class App extends App
	@constructor = [
		<% if (environment === 'dev') { %>'ngMockE2E'<% } %>
		'ngRoute'
	]