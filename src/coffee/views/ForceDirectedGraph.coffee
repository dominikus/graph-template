# ForceDirectedGraph.coffee

window.top.$(window.top.document).on "visible-graph-created", () ->
	# globals

	width = 1200
	height = 640

	[vis, svg, labels, nodes, links, visibleNodes, visibleLinks, force] = [undefined]

	setup = () ->
		svg = d3.select("#vis").append("svg")
			.attr({
				"width": width
				"height": height
				"viewBox": "0 0 #{width} #{height}"
				"preserveAspectRatio": "xMidYMin meet"
				})
			.style({
				"width": "100%"
				"height": "100%"
				})
			.append("g")
				.attr("transform", "translate(#{width*0.1},#{height*0.1}) scale(0.9,0.9)")

		force = d3.layout.force()
			.charge(-120)
			.linkDistance(30)
			.size([width, height])

		render()

	tick = () ->
		visibleLinks.attr("x1", (d) -> d.source.x)
		visibleLinks.attr("y1", (d) -> d.source.y)
		visibleLinks.attr("x2", (d) -> d.target.x)
		visibleLinks.attr("y2", (d) -> d.target.y)

		visibleNodes.attr("cx", (d) -> d.x)
		visibleNodes.attr("cy", (d) -> d.y)

	render = () ->
		nodes = window.app.models.visibleGraph.visibleNodes
		links = window.app.models.visibleGraph.visibleLinks

		force
			.nodes(nodes)
			.links(links)
			.start()

		visibleLinks = svg.selectAll(".link")
			.data(links)
		visibleLinkEnter = visibleLinks.enter()
		visibleLinkEnter.append("line")
				.classed("link", true)

		visibleNodes = svg.selectAll(".node")
			.data(nodes)
		visibleNodeEnter = visibleNodes.enter()
		visibleNodeEnter.append("circle")
				.classed("node", true)
				.attr("r", 5)
				.call(force.drag)

		force.on "tick", tick


	setup()

	$(window).on "resize",_.debounce(render, 1000)
