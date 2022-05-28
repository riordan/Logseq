[[Salesforce]]

# Data Model Tour [[2022-02-02]]
Participants:
- [[Toan Dang]]
- [[Jen McGroaty]]
- [[Jim Anton]]
- [[Vassavi Kolusu]] - Senior [[Salesforce]] Developer
- [[Brian Waligorski]]
- [[Mark Loomis]]
- [[Kate Connolly]]
## Schemas
[Hansen's Lucidchart of Salesforce:](https://lucid.app/lucidchart/7732317a-6eac-4d3f-98af-97abfea183ee/edit?beaconFlowId=FE5474103E428A12&page=fP0-H6sjfVcZ#?folder_id=home&browser=list)
### Vendor provided ERD
![[Pasted image 20220202160722.png]]

![[Pasted image 20220202160808.png]]

**Maintainance Structure: Transactions**
![[Pasted image 20220202160846.png]]

**Recurly Account**
![[Pasted image 20220202160927.png]]
Equivelent structure in Recurly as SF. Passes account details onto 

**Refund Structure**
![[Pasted image 20220202160955.png]]


Syncing from print billing:
- Every day we draw a fixed amount from every active subscription. DSI does this nightly.
- This is synched up nightly from DSI -> Salesforce
	- Ties into Salesforce.Subscription
	  
	  Informatica monitors a job queue from Salesforce for things like vacation stops.
- The informatica job runs every 7 minutes to pull from the queue and insert to DSI
  
  Credit cards:
- As a DSI subscriber who updates via web community
	- becomes a recurly biller
	- Push the paid through via recurly
	- nightly sync happens 
	  
	  
	  Historical contacts in salesforce:
- Missing stuff
	- DSI billing history
- Has
	- Balance
	  Challenge where some are beign billed from DSI, some are being billed from recurly.
	  
	  Salesforce reporting:
	  ![[Pasted image 20220202163416.png]]
	  26k salesforce-billed subscribers
	  not including apple or google
	  
	  ![[Pasted image 20220202163747.png]]