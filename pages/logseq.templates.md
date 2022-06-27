---
title: logseq/templates
alias: template, templates
---

- ## Logseq Templates
  id:: 62379de4-41e2-4162-a949-7c47aee31942
	- Journal Organization
		- Plan For The Week
		  template:: Weekly Plan
		  template-including-parent:: false
			- organization:: Weekly Plan
			- ## Focusing On
				- TODO Replace me with themes
				  :LOGBOOK:
				  CLOCK: [2022-06-27 Mon 12:56:33]
				  :END:
				- ### Not Focusing On
					- TODO Replace me with things I want to do, but will not focus on
			- ## Goals For The Week
				- TODO Fill in the things you want to do this week
				- ## Daily Goals
					- ### [Monday](<% Monday this week %>)
					- ### [Tuesday](<% Tuesday this week %>)
					- ### [Wednesday](<% Wednesday this week %>)
					- ### [Thursday](<% Tuesday this week %>)
		- [[Weekly Review]]
		  id:: 62a73923-0604-4f20-ba70-cd15e6cd043b
		  template:: Weekly Review
		  organization:: weekly review
		  collapsed:: true
			- Plus: What went well?
			- Minus: What didn't go so well?
			- Goals: How are you doing toward your [goals](((62a88f98-9b05-44a6-a6ca-c8cd0f59ff2d)))?
				- Personal:
				- Departmental:
			- Next: What will I focus on next week?
		- End-of-Day Wrapup
		  template:: eod
		  template-including-parent:: false
		  id:: 62a8f8a3-8e3a-4933-a94d-35cf93d8efe9
		  collapsed:: true
			- What did you accomplish today?
			- What did you learn today?
			- What are the things you worked on today?
			- What do you want to do [Tomorrow](<% tomorrow %>)?
		- [[Journaling Prompts]]
		  id:: 62a73923-0d4c-4e1c-a939-7fd90622dd86
		  template:: Journaling Prompts
		  organization:: daily journal
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
		- ((62926f96-222c-4865-b77f-35b12fcc23e8))
		- Product Sync
		  template:: Product Sync
		  template-including-parent:: false
		  collapsed:: true
			- Data & Insights
			- Notes
				- Housekeeping
				- Big pushes this week
				- Blockers/opportunities:
				- Glows to share
			- Resources & Action Items
	- Productivity Tools
	  collapsed:: true
		- Eisenhower Matrix
		  template:: Eisenhower Matrix
		  template-including-parent:: false
		  collapsed:: true
			- #.v-eisenhower-matrix
			  template:: eisenhower-matrix
				- [[TODO]]
					-
					-
					-
				- [[DECIDE]]
					-
					-
					-
				- [[DELEGATE]]
					-
					-
					-
				- [[ELIMINATE]]
					-
					-
					-
		- template:: 🚥 Kanban
		  collapsed:: true
			- **Board name:** #kanban
				- [[🟢 low]]
				  			{{renderer :todomaster}}
					- ...
					- ...
				- [[🟡 normal]]
				  			{{renderer :todomaster}}
					- ...
					- ...
				- [[🔴 high]]
				  			{{renderer :todomaster}}
					- ...
					- ...
		- template:: procons
		  template-including-parent:: True
		  collapsed:: true
			- Pros and Cons #.v-kanban
				- #like
					-
				- #dislike
					-