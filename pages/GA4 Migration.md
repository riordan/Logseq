---
tags: [[inquirer/projects]] 
---

- ## Background
	- Our friends at [[Google]] have decided to deprecate [[Google Analytics]] 3 on behalf of their hybrid app/web GA4. This means events will stop being processed on July 1, 2023. We will need to:
		- Move all web client instrumentation over to GA4
			- Switch to purely event-based collection & analysis
			- Validate that we're collecting everything correctly
		- Create vital reporting in native Google interface
		- Create new data pipelines for all analyses
		-