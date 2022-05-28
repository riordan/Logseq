---
type: project
status: active
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
	- ## ((62379de4-41e2-4162-a949-7c47aee31942))
		- All templates are managed at [[logseq/templates]].
		- Some use [[Logseq/Smart Blocks]]
- ### Knowledge Base ([[kb]])
  collapsed:: true
	- {{embed ((629262da-f65f-4873-ba3c-297e6e6cfeea))}}
- ## Queries
	- Queries allow the building of structured data retrieval and searches making Logseq more functional.
	- ### How to write Logseq Queries
		- [https://www.youtube.com/watch?v=i9Xdj6WG_C0](Logseq Office Hours: Building Processes with Queries)