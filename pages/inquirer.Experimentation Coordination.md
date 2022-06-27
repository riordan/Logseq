alias:: inquirer/Experimentation Coordination
tags:: inquirer/project
title:: inquirer/Experimentation Coordination

- ## DIBB
  tag:: [[dibb]]
	- ### Data
	- ### Insights
	- ### Beliefs
	- ### Bet
- ## Project Approach
	- ### Problem:
		- Online Experimentation (e.g. A/B Testing) is the gold standard for doing
	- ### Problem Nuances
	- ### Concerns:
		- [[Liz Grace]] has been the primary coordinator of experimentation at The Inquirer, first as part of the PDE Analytics team, then in her role in [[Marketing]] as the Manager of Business Intelligence and Innovation. At the time of writing, she's just gone out on parental leave, so this is not a time to make substantial changes. She is an essential partner in architecting any change to how experimentation is done or coordinated at The Inquirer, so any proposals for how things might change operationally should wait for her return and partnership.
		-
- ## Project Notes
- [[2022/04/07]] [[Mark Loomis]] note
	- [[David Riordan]] 
	  > The thing that really got me down this experimentation rabbit hole yesterday was the realization that we have Optimize and Piano (and formerly VWO) and have simultaneous experiments that could be running across both of them. And experimentation is now highly distributed across different departments; with different experimentation platforms for different purposes, being used by different operators. Lots of room for collisions.
	  So I started looking for a single site of coordination. It's clear Liz was doing that when she was in Analytics and had a good communication approach for it. Now we're at a point where the Smartsheets have been abandoned, but are still linked in a lot of places (not a huge deal; easy to clean up) and the Jira OPTIMIZE board isn't super interconnected.
	  Normally I'd say "Lets just broadly use the OPTIMIZE board and try to put in place policies that let us figure out how to do more coordination." This is made more complex by the fact that it's Liz's first week out on leave! Anything like that would be seen as infringing on her area of focus. And it would be if she weren't involved and it weren't an emergency. So that takes policy pronouncements off the table.
	  So where I ended up was there are likely ways to improve the visibility of tests (and similar work) that is a valuable utility to understand whats going on. If in addition to the announcements in #testing_optimization, there were an automated weekly announcement (pointing back to a list of all known tests) of what tests/evaluations were running.
	  What that might look like is:
	  Pull together all running / scheduled evaluations somewhere.
	  Where there's pre-canned connectors, pull the testing tools data directly into BQ so we can automatically include it in the schedule, showing what's running at any given moment.
	  If we're doing this for Google Optimize and Piano, we might as well do this for Usertesting.com, Qualaroo, and SurveyMonkey since we know there are Stitch Taps / Airbyte connectors already waiting for them.
	  Ironically GO and Piano are the two that are kinda hard to do. But Piano has a batch export system (it's a start) and GO ties directly into GA4 so they might be possible to get this "what's scheduled/whats running" without a ton of effort, but it'll require some investigation.
	  What sources don't have exported data feeds would need to be maintained by hand (like is done on the OPTIMIZE jira today), but the overall burden of managing upkeep would be reduced (and facilitate us getting local copies for analysis).
	  The whole point of pulling it together is to be able to regularly display the calendar of what tests are running at the start of each week to the testing_optimization slack channel with a link to a nifty visualization of current/upcoming/ongoing tests/surveys. Hell; it could be driven by the Optimize JIRA with a native calendar visualization and a GANTT of what's happening.
	  By making what's already present visible, it makes the challenges of distributed experimentation a lot easier to coordinate.
	- [[Mark]]
	  > yeah - i think i’m onboard with all of it.  Things fell apart a bit when Liz left her role.  Our plan was to quickly replace that role with the Data PM that would manage testing overall as well as other things.  This is now 8 months that role has been unfilled though
	  
	  > The plan was
	  1. Data PM oversee testing overall as a program - partner with Product
	  2. Liz role manages testing for marketing working with the data PM for overall program management
	  
	  > The data export thing we should just talk through in more detail.  Make sure what we are getting from the tools is meaningful.  For a lot of the tools we don’t use them for hte analysis - mostly for the splitting and experience
- [[2022/04/06]] [[kate]]
  collapsed:: true
	- [[Liz Grace]] in [[Marketing]] used to own [[Experimentation]] for [[Analytics Team]] before moving over to marketing
		- she's on parental leave; current owner for [[Marketing]] is [[Nadya Tan]]
	- ways we track stuff:
	- Platforms:
		- [[Piano]]
		- [[Blueconic]]
		- Optimize
			- Feature-focused testing:
				- moving module up or down the page; color of modals
				- NOT focused on registration/meter
		- [[inquirer/mobile app]] testing: Firebase remote config
			- custom system build by [[Bryan Deemer]]
		- Lists of tests have lived in a couple of different documentation systems
			- Optimize Jira
			- Smartsheet
			- Recaps of tests run in previous year on Google Drive
			- Confluence test pages
				- Analytics
					- [results](https://inquirer.atlassian.net/wiki/spaces/KB/pages/229046/Testing+Results)
					- [2021 testing roadmap mid-year review](https://docs.google.com/presentation/d/17CRCzWg3BUZ1j31s8tw-LY-TEXtY7MMwZOcDcskP0mQ/edit#slide=id.gdb77f633bb_0_38)
				- [Marketing]()
	- Challenges:
		- different platforms
		- fragmented communication
		- fragmented operations
		- not a lot of transparency
	- Analytics process:
		- Previously mark was managing with liz (as point of contact)
			- Kate managed some of the app stuff
			- liz handled optimize setup
			- mark and nat did piano marketing things
			- not liz
		- Current:
			- liz doing piano
			- nat gone: gap for marketing tests
				- kate does't ahve experience working in piano; nat handled it before. mark feels like he can take it on because he managed piano with nat
				- [[mark]] steps in because he has experience, but doesn't give kate a way to get experience
			- Not really a clear channel for where tests come from; mark figures he'll set it up and get it going and kate can analyze at the end
				- struggle of where the handoff is
			- The jira intake process is heavy because was designed to capture from folks in product, but not lightweight. We don't have a way lightweight capture requests and work tickets regardless of where they come from #fleeting #agile
	- What could we do:
		- Pull automated data from all known experiment/test sources
		- Visualize active experiment timelines
		- Post new experiments to a slack channel
		- Post a weekly update of all running (non-_permanent_) experiments