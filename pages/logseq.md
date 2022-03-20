---
type: project
status: active
alias: Logseq
---

- ## Current Logseq Org Structure
  id:: 6237a345-d173-49f8-80a4-46a30e5ee52c
  collapsed:: true
	- Daily Journals are where everything starts: gets moved to sections as needed
	- Use properties liberally; especially the yaml frontmatter
		- ```
		  ---
		  <frontmatter goes here in first block>
		  ---
		  ```
	- Logseq Organization tags are tagged as `type:: lsorg`
	  collapsed:: true
		- Tag Types: {{query lsorg}}
		- [[Priority]]
		  type:: lsorg
		  collapsed:: true
			- [[Priority/High]]
			  type:: lsorg
			- [[Priority/Normal]]
			  type:: lsorg
			- [[Priority/Low]]
			  type:: lsorg
		- [[Projects]]
		  collapsed:: true
			- type:: lsorg
		- [[Status]]
		  type:: lsorg
		  collapsed:: true
			- Active
			- On Hold
			- Completed
			- Deprecated
			- Experimental
	- ((62379de4-41e2-4162-a949-7c47aee31942)) are used to set up frequent things like the daily notes and weekly review
	-
- ## Logseq Configuration
	- ## Plugins
		- ### Third Party Plugins
			- [Logseq Periodic Notes](https://github.com/brendonscript/logseq-periodic-notes)
- ## Logseq Templates
  id:: 62379de4-41e2-4162-a949-7c47aee31942
	- [[Weekly Review]]
	  template:: Weekly Review
	  collapsed:: true
		- Plus: What went well?
		- Minus: What didn't go so well?
		- Next: What will I focus on next week?
	- [[Journaling Prompts]]
	  template:: Journaling Prompts
	  collapsed:: true
		- What's one thing I learned yesterday?
		- What's one thing I'm grateful for today?
		- What's one thing I want to accomplish today?
		- What's one challenge I may experience today?
		- Any other thoughts?
	- [[Meeting Minutes]]
	  template:: Meeting Minutes
	  template-including-parent:: false
	  collapsed:: true
		- Attendees:
		- Meeting name:
		- Presenter:
		- Facilitator:
		- Notes:
		- Action items:
		- Open issues:
		-
	- [[Daily Notes]]
	  template:: daily
	  template-including-parent:: false
		- Setup
			- DONE Insert Today's Notebook Setup Checklist
			- TODO INSERT Journaling Habit
			- TODO Review your schedule for the day
			- TODO Review your schedule for the week
			- TODO [Omnifocus](omnifocus://) task review
		- Main
		  collapsed:: true
			- ## Today I worked on:
			- ## I had these meetings:
			- ## Wrapup
				- What did you accomplish today?
				- What did you learn today?
				- What do you want to do tomorrow?
		- ## Scratch
		-
		- TODO