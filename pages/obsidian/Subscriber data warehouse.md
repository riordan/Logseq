---
tags: [inquirer/projects]
---

- [Project page - confluence](https://inquirer.atlassian.net/wiki/spaces/KB/pages/1772552239/Subscription+Data+Warehouse+Project)
- [Business Case for PMO](https://docs.google.com/document/d/1LAfelIdodRE83oGMo5FFhmXlT_6iaiph1jpQx75ZT_M/edit#)

# Kickoff
## Kickoff Needs
### For [[Aaron Moore]]
- [x] #task Finalize invite list for [[Subscriber data warehouse]] kickoff ⏫ 🛫 2022-02-07 ⏳ 2022-02-02 📅 2022-02-07
- [x] #task Remap high level plan (Phase 1 being popup team -> conclusion ⏫ 🛫 2022-02-07 ⏳ 2022-02-07 📅 2022-02-07 ✅ 2022-02-23
- [ ] #task Tighten up project scope (FOCUSING ON/ NOT FOCUSING ON)
- [x] #task Build out Risk Map (project Charter and report out) ⏫ 🛫 2022-02-07 ⏳ 2022-02-07 📅 2022-02-07 ✅ 2022-02-23

### For [[Matt Boggie|Matt]]
- [ ] #task Warehouse Project Kickoff: Where are we, what are the risks, what are the concerns?

### Kickoff Meeting - Invite List:
[
#### Senior Leaders:
- [[Pete Doucette]]
- [[Matt Boggie]]
- [[michael zimbalist]]
- [[Toan Dang]]
- George Kurtas

#### Steering Committee
-   Darya Ushakova, Marketing, VP Marketing
-   Bill Tevis, Finance, VP Revenue Planning and Analysis
-   Nadya Tan, Marketing, Director of Marketing Technology
-   Mara Hughes, Marketing, Manager of Engagement & Loyalty 
-   Lindsay Deutsch, Product, Product Manager -  Reader Experience


#### Working Group
- Jim Anton & Jen McGroarty, EAS/Salesforce
- Tracy O’Rourke, Business
- Megan Agren, Business
- James Ciampagila, Business
- Mark Loomis, Product
- Kate Connolly, Product
- Brian Waligorski, Data Architect 
- Nicole Henninger, Senior User Researcher, Product]()


## Pre-Kickoff: Risks and Concerns
- Can we get [[Tracy O'Rourke]]?
	- Finance; spoken to Tracy and her boss ([[Jeff Cooney]], head of FP&A)

# Design Process:
1. List customers
2. Interview Customers
3. Collect & describe use cases
4. Cluster use cases
5. Customer Journey Map ([Job Template](https://miro.com/app/dashboard/?tpTemplate=job-map&isCustom=false&invite_link_id=408085777866))


Acknowledge that what we have are assumptions and patterns 


# Problems stemming from challenges of coordinating
## Billing Complexity
Without clear business rules, it's difficult to know what the systems are supposed to do, so we wind up with cases like this:
![[Pasted image 20220210133307.png]]
![[Pasted image 20220210133338.png]]


# [[2022-02-21]] Salesforce data
- snapshot of subscription database every day. Daily overwrite
	- [[Mark Loomis|mark]] has 2 methods for this:
		- materialize subscription table every day; would let us start providing historical reporting ASAP
			- Materialize approach:
				- Could we provide backfills against this?
				- If we miss a day, could we repartition?
			- fields
				- original_start_date field
				- expire_on field
			- 
		- Transactional change history could be missing
	- Historical subscriptions: lacking transactions to solve for these.
	- Questions:
		- Finance has "Crazy Logic" what's that?
		- 