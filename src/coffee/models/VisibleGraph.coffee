# visible graph model

window.top.$(window.top.document).on "graph-created", () ->

	window.app.models.visibleGraph = {}
	window.app.models.visibleGraph.visibleNodes = []
	window.app.models.visibleGraph.visibleLinks = []

	# create visible versions for all nodes and links
	window.app.models.graph.nodes.forEach (n) ->
		visibleNode = {
			model: n
		}
		n.set("visible", visibleNode)
		window.app.models.visibleGraph.visibleNodes.push(visibleNode)

	window.app.models.graph.links.forEach (l) ->
		visibleLink = {
			model: l
			source: l.get("source").get("visible")
			target: l.get("target").get("visible")
		}
		l.set("visible", visibleLink)
		window.app.models.visibleGraph.visibleLinks.push(visibleLink)

	window.top.$(window.top.document).trigger "visible-graph-created"

