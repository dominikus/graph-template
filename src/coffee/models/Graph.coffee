# graph model

class window.Node extends Backbone.Model
	defaults: ->
		#

	# overwrite server syncing
	url: ""
	sync: ->
		@

class window.Nodes extends Backbone.Collection
	model: Node

class window.Link extends Backbone.Model
	defaults: ->
		#

	# overwrite server syncing
	url: ""
	sync: ->
		@

class window.Links extends Backbone.Collection
	model: Link



window.top.$(window.top.document).on "data-loaded", () ->

	window.app.models.graph = {}
	window.app.models.graph.nodes = new Nodes()
	window.app.models.graph.links = new Links()

	for p, i in window.app.data.graph.nodes
		t = window.app.models.graph.nodes.create(p)

	for p, i in window.app.data.graph.links
		window.app.models.graph.links.create({
			"source": window.app.models.graph.nodes.models[p.source]
			"target": window.app.models.graph.nodes.models[p.target]
			})

	window.top.$(window.top.document).trigger "graph-created"
