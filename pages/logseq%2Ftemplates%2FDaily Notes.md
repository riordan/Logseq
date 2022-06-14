---
title:logseq/templates/Daily Notes
tags: template, smartblocks
alias: Daily Notes, logseq/templates/Daily Notes
title: logseq/templates/Daily Notes
---

- ## Base Template
	- [[logseq/templates/Daily Notes]]
	  id:: 62926f96-222c-4865-b77f-35b12fcc23e8
	  template:: daily
	  template-including-parent:: false
	  title::Daily Notes
		- Setup
			- TODO [Omnifocus](omnifocus://) task review
		- ## Morning Journal {{renderer :smartblock, Journaling Prompts, Insert Journal, false}}
		- ## Day Planning
			- [Review](((62a89da8-158e-4a7a-a23d-f866fb3100a9))) your schedule for [Today](x-fantastical3://show?date=<% today %>)
				-
			- Review your schedule for [This Week](x-fantastical3://show?date=this week)
			- Review your Tasks
				- In [Omnifocus](omnifocus:///forecast)
				- In [[TODO]]
			- ### Day Thinking
				- #### Today I will work on
					-
				- #### Today I should work on
					-
				- #### Today I would like to work on
					-
		- ## Actual Work & Scratch
		- ## End-of-Day Wrapup
			- What did you accomplish today?
			- What did you learn today?
			- What are the things you worked on today?
			- What do you want to do [Tomorrow](<% tomorrow %>)?
- ## Instructions
	- ### Review your schedule for the day
	  id:: 62a89da8-158e-4a7a-a23d-f866fb3100a9
	  collapsed:: true
		- Use the Calendar Plugin to insert your work calendar
		- Focus on the **Work Calendar** block with `⌘+.`
		- Toggle Open Blocks with `esc t+o`
		- Jump back to your journal view and prioritize for the day