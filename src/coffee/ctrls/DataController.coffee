# DataController.coffee

dataPath = 'data'

window.top.$(window.top.document).on "app-ready", () ->
	problem = (error) ->
		console.log 'error loading data:'
		console.log error

	d3.json dataPath + '/miserables.json', (error, results) ->
		window.app.data.graph = results
		window.top.$(window.top.document).trigger "data-loaded"
