---
tags: dibb
---

- # Initial Thoughts
	- The Data and Insights team makes extensive use of Google Data Studio, a dashboard and reporting tool that’s part of Google Workspace. It’s also a discoverability dumpster fire that leads to way too many dashboards getting created then never found or used again.
	- I’m looking to improve visibility of these assets. As a data studio user, it’s only possible to search for Data Studio dashboards that that user has already opened. This means there’s nothing that’s “Public, open, and searchable by default”. Assets remain effectively private. Likewise, there’s no way to guarantee that a particular dashboard has been made available broadly, except by the analyst who created it.
	- This has led to a situation where:
		- 1. Dashboards aren't found unless listed on [this confluence page](https://inquirer.atlassian.net/wiki/spaces/KB/pages/228649/Analytics+Dashboards+Reports)
		  2. 2. Many of the dashboards on that page have the wrong permissions to be opened broadly, as the creator added view permissions on a one-off basis rather than generally across The Inquirer.
		  3. Several of those dashboards were created by staff no longer with The Inquirer, requiring a Google Workspace admin to change view permissions (and to reassign access to a current team member).
		  4. A significant amount of "dark matter" dashboards that have not been shared, and remain undiscoverable.
	- Rather than asking all members of my team to copy/paste the dozens-to-hundreds google data studio dashboards and datasets they've got access to into a spreadsheet by hand, this seems like something that is likely better addressed by Google Workspace administrative tools, in the form of reports (what's there; who's the owner; who's got access), tools (to make batch changes), and APIs (potentially, for long-term visibility into Data Studio usage metrics and integration into broader Data & Insights infrastructure).
	- While I'm ashamed to admit that this is the kind of ticket that usually winds up becoming a phone call, it would be great to gain more insight and control over the Data Studio situation.
	- In the short-term, that would mean:
		- id:: 09e972ed-7e87-4104-a6a3-ba15f626a81c
		  1. Getting a list of all Data Studio dashboards with associated owner/editor/viewer metadata
		  2. The ability to look into them. _We'll want to determine the degree of access here based on the above; if we feel that the scope of use of the Data Studio product is sufficiently within my purview (either via my role overall or management of overwhelming majority of users), then I'd be happy to have that tied to my google workspace account. Otherwise, I'd be happy to pair with a member of the Systems team to review potentially relevant ones._
		  3. For pertinent dashboards (and the corresponding datasets that power them), we validate to ensure appropriate access permissions are set.
	- THEN… any new dashboards created by the Analytics team go through formalized release process that ensures that put them in a registry and ensure that the creator follows [the above](((09e972ed-7e87-4104-a6a3-ba15f626a81c))). This way we don't have to go through the remediation process on a regular basis and it can serve as a .bootstrapping of  the overall effort.
	- Longer term, this underlying system is incredibly valuable for other efforts in the Data & Insights group, which is why there is the potential for needing API access. Our data engineering team is responsible for Google BigQuery, a database with nearly 1900 datasets and hundreds of data pipelines. Odds are, most go to things that don't get used, yet consume a considerable portion of our infrastructure resources and our engineering time. We also can't shut them off without running the risk of impacting ongoing data collection (e.g. event logs, time-based snapshots). As such, we'll want to see which of these are powering systems in use
		- Multiple [[Data Pipeline Systems]] and [[Dataset Storage Locations]]
			-
			-
-