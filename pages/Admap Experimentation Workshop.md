- [[HEART Framework]] #workshop for participants in the [[Admap]] workstream. Currently scheduled for [[2022/06/30]].
- ## Project Tasks
	- #+BEGIN_QUERY
	  {:title "All tasks tagged using current page"
	   :query [:find (pull ?b [*])
	         :in $ ?current-page
	         :where
	         [?p :block/name ?current-page]
	         [?b :block/marker ?marker]
	         [?b :block/refs ?p]
	         [(= "NOW" ?marker)]]
	   :inputs [:current-page]}
	  #+END_QUERY
- ## Workshop Planning
  id:: 62b44ec1-5ed4-4918-af40-d9c1d10d95b0
	- ### Planning Resources:
	  collapsed:: true
		- [How to run a GSM Workshop](https://uxdesign.cc/how-to-inform-product-vision-with-a-heart-workshop-5fa72d778066)
			- Example Agenda for a GSM Workshop - [Site](https://www.slideshare.net/LizDonovan3/success-metrics-workshop-outline) ![pdf](../assets/success-metrics-workshop-outline_1655983973003_0.pdf)
		- [Kerry Rodden - GV Library - How to choose the right UX Metrics for your product](https://library.gv.com/how-to-choose-the-right-ux-metrics-for-your-product-5f46359ab5be#.7dxtcn4ow)
	- ### Pre-Plan
		- NOW Draft workshop ((62b9ea74-990f-403e-9579-d880215127e9))
		  :LOGBOOK:
		  CLOCK: [2022-06-28 Tue 10:10:14]
		  CLOCK: [2022-06-28 Tue 10:10:15]
		  :END:
		- NOW Make workshop ((62bb0d01-e3f4-418a-a374-f2ea76876cbc))
		  :LOGBOOK:
		  CLOCK: [2022-06-28 Tue 10:10:21]
		  CLOCK: [2022-06-28 Tue 10:10:24]
		  :END:
		- NOW Create workshop ((62bb0d46-5654-4884-80cf-3fdc53ad4ede))
		  :LOGBOOK:
		  CLOCK: [2022-06-28 Tue 10:10:29]
		  CLOCK: [2022-06-28 Tue 10:10:30]
		  :END:
		- NOW Write up workshop Pre-Read
		- ### Pre-Read / Note (0%)
	- ### Outline (5%)
	  id:: 62b9ea74-990f-403e-9579-d880215127e9
		- #### Meta
			- Capture Content + Think Through Activities
			- Participants:
				- [[PMO]] :
					- [[Megan Smith]]
				- Data & Insights
					- [[Alexandra Williams]]
					- NOW Invite Kate to be a part of this meeting and brief her as to what it'll involve.
					  :LOGBOOK:
					  CLOCK: [2022-06-28 Tue 10:31:07]
					  CLOCK: [2022-06-28 Tue 10:31:09]
					  :END:
				- Ads:
					- Becky Dodds
					- [[Max Kilpatrick]]
					- [[Lauren Amato]]
					- Terrance Brown
					-
				- Product Design:
					- [[Lindsay Grow]]
					- [[Beth Flynn]]
					- Jenn Bateman
				- Product Management:
					- [[harriet white]]
					- [[Lindsay Deutsch]]
					- [[Tod Gillespie]]
				- Finance:
					- [[Bill Tevis]]
		- #### Content
			- Process
				- Run a UX Metrics workshop for experimentation
				- Run with Analytics team + PMs (for HEART metrics)
			- Why are we doing this?
				- To help businesses reach The Philadelphia community
				- To support The Mission of The Inquirer
				- Flywheel <img src="https://mermaid.ink/img/ICBncmFwaCBMUgogICAgVXNhYmxlUHJvZFtBIG5ld3NwYXBlciBwcm9kdWN0IHBlb3BsZSB1c2UgYW5kIGxvdmVdIC0tPiBBdWRpZW5jZSAtLT4gQWRNb25bTW9uZXRpemUgdmlhIGFkdmVydGlzaW5nXSAtLT4gU3VzdGFpbltTdXN0YWluIG1pc3Npb24gb2YgVGhlIElucXVpcmVyXQogICAgVXNhYmxlUHJvZC0tPlBheVByb2RbQSBuZXdzcGFwZXIgcHJvZHVjdCBpdHMgcmVhZGVycyBuZWVkIHNvIG11Y2ggdGhleSdyZSB3aWxsaW5nIHRvIHBheSBmb3JdIC0tPiBTdWJzY3JpYmVbTW9uZXRpemUgdmlhIHJlY3VycmluZyBzdWJzY3JpcHRpb25dIC0tPiBTdXN0YWluCiAgICBTdXN0YWluLS0-VXNhYmxlUHJvZAoK" />
				  collapsed:: true
				  {{renderer :mermaid_syjffniid}}
					- ```mermaid 
					  graph LR
					      UsableProd[A newspaper product people use and love] --> Audience --> AdMon[Monetize via advertising] --> Sustain[Sustain mission of The Inquirer]
					      UsableProd-->PayProd[A newspaper product its readers need so much they're willing to pay for] --> Subscribe[Monetize via recurring subscription] --> Sustain
					      Sustain-->UsableProd
					  
					  ```
				- Success of our business depends on long-term success of advertising, success of reporting, success of subscribership, and success of product delivery / usability.
					- Newsroom <-> Product
					- Audience
					- Monetize
			- "Data Science is just applied counting." -Brian Abelson
			- Metric Types
				- North Star Metrics - Guide and align the company
					- [North Star, Driver Metric, supporting metric](https://medium.com/datainterview/principles-and-frameworks-of-product-metrics-youtube-case-study-ff63257a82d3)
				- Driver Metrics - Short-term metrics that align with north star
					- The qualities of a great driver metric are:
					- **Aligned with the North Star**— Is it meaningfully and statistically correlated with the North Star metric?
					- **Actionable**— Does it inform and influence key product decisions?
					- **Sensitive**— Is it sensitive enough to measure core actions?
				- Guardrail Metrics
					-
			-
		-
	- ### [Slide Deck](https://docs.google.com/presentation/d/1M0pysryE2T2Iofs0qllGStF2jfkppavVZLbmh3gke1M/edit) (5%)
	  id:: 62bb0d01-e3f4-418a-a374-f2ea76876cbc
	- ### Miro (0%)
	  id:: 62bb0d46-5654-4884-80cf-3fdc53ad4ede
	- ### Pre-Read / Participant Note (0%)
	  id:: 62bb0e97-0257-45e5-b3db-80cbf8070eb6
		- #### Meta:
			- NOW Send out ((62bb0e97-0257-45e5-b3db-80cbf8070eb6)) at least 1 day before workshop
			  SCHEDULED: <2022-06-28 Tue>
			  DEADLINE: <2022-06-29 Wed 9:30>
			  :LOGBOOK:
			  CLOCK: [2022-06-28 Tue 10:23:57]
			  :END:
		- #### Content:
			-
	-
	-