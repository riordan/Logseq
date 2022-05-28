---
tags: [[inquirer/project]] 
---

- ## Background
	- Our friends at [[Google]] have decided to deprecate [[Google Analytics]] 3 on behalf of their hybrid app/web GA4. This means events will stop being processed on July 1, 2023. We will need to:
		- Move all web client instrumentation over to GA4
			- Switch to purely event-based collection & analysis
			- Validate that we're collecting everything correctly
		- Create vital reporting in native Google interface
		- Create new data pipelines from GA4 eventstream and use it for all new analysis work (to get analysts used to working with it)
			- Equevelent of User360, Meter Stops, etc.
		- Migrate all ongoing reporting to use new sources
			- Dashboards, tools like meter stops
			- Set up hybrid tools
		-