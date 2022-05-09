---
type: project
status: active
alias: Logseq
---

- ## Structure
  id:: 6237a345-d173-49f8-80a4-46a30e5ee52c
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
	- ## System Configuration
		- Date mode: yyyy/MM/dd
		- ## Plugins
			- Manually installed plugins
				- [Logseq Periodic Notes](https://github.com/brendonscript/logseq-periodic-notes)
- ## ((62379de4-41e2-4162-a949-7c47aee31942))
	- All templates are managed at [[logseq/templates]].
	-