---
type: project
status: active
alias: Logseq
---

- ## Current Organization Description
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
		- [[Project]]
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
		- ## Projects:
		- ## Meetings
		- ## Wrapup
			- What did you do today?
			- What did you learn today?
			-
		-
		- TODO