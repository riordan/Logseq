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
		- ## Morning Journal
			- [Journal Template](((62a73923-0d4c-4e1c-a939-7fd90622dd86))) {{renderer :smartblock, Journaling Prompts, Insert Journal, true}}
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
				- #### Today I would like to work on (but will not)
					-
		- ## Actual Work & Scratch
		- ## End-of-Day Wrapup
			- [EoD](((62a8f8a3-8e3a-4933-a94d-35cf93d8efe9))) {{renderer :smartblock, eod, Insert EoD, true}}
- ## Instructions
	- ### Review your schedule for the day
	  id:: 62a89da8-158e-4a7a-a23d-f866fb3100a9
	  collapsed:: true
		- Use the Calendar Plugin to insert your work calendar
		- Focus on the **Work Calendar** block with `⌘+.`
		- Toggle Open Blocks with `esc t+o`
		- Jump back to your journal view and prioritize for the day