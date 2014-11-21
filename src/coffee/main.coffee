
# -------------------

class App extends Backbone.Router
	views: {}
	models: {}
	data: {}

	routes:
		'*path': 'pageChange'

	initialize: ()->
		window.top.$(window.top.document).trigger "app-ready"
		Backbone.history.start()

	pageChange: (path)->
		console.log "page change", path

# -------------------

window.app = new App()
