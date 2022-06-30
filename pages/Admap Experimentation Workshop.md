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
		- [How to run a GSM Workshop](https://uxdesign.cc/how-to-inform-product-vision-with-a-heart-workshop-5fa72d778066)
			- Example Agenda for a GSM Workshop - [Site](https://www.slideshare.net/LizDonovan3/success-metrics-workshop-outline) ![pdf](../assets/success-metrics-workshop-outline_1655983973003_0.pdf)
			- Suggestions:
				- **Force prioritization of goals** - Progressive dot voting each round to focus
					- **Prioritization becomes critical as this workshop grows exponentially in content with every completed section.**Goals have multiple signals, and each signal might create multiple metrics (see image below). The group needs to ideally limit themselves to the most critical goals; otherwise things will get unwieldy as the workshop progresses.
					  id:: 62bcc32c-ddc5-4429-a1c5-81adb5d0f282
					-
		- [Kerry Rodden - GV Library - How to choose the right UX Metrics for your product](https://library.gv.com/how-to-choose-the-right-ux-metrics-for-your-product-5f46359ab5be#.7dxtcn4ow)
		- [Quantifying and Qualifying Strategy](https://www.designative.info/2021/08/04/need-for-quantifying-and-qualifying-strategy/)
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
			  collapsed:: true
				- [[PMO]] :
					- [[Megan Smith]]
				- Data & Insights
					- [[Alexandra Williams]]
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
			- Follow-up:
				- This workshop has been a generative session that will need some editing and reflection. We collectively need to review and narrowing down the metrics we want to focus on in the near-term.
				- David will take these artifacts, convert them into a spreadsheet
				- Next Week: Discuss this spreadsheet with the accountable group and **have them review with the following considerations:**
					- What are lagging vs. leading indicators?
					- Do you have an automated way of tracking this metric, or would it be done manually?
					- What would be the level of effort to track this metric?
				- These considerations should help us determine which metrics would be best to prioritize in the near-term. Some of them we'll be able to act on now, some will take a bit of cleaning the data we have, others may take engineering work to measure (e.g. ensuring we're capturing events uniformly around ad display, clicks, load times, etc.), or implementation of surveys.
		- #### Content
			- Process
			  collapsed:: true
				- Run a UX Metrics workshop for experimentation
				- Run with Analytics team + PMs (for HEART metrics)
			- Why are we doing this?
			  collapsed:: true
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
			  collapsed:: true
				- North Star Metrics - Guide and align the company
					- [North Star, Driver Metric, supporting metric](https://medium.com/datainterview/principles-and-frameworks-of-product-metrics-youtube-case-study-ff63257a82d3)
				- Driver Metrics - Short-term metrics that align with north star
					- The qualities of a great driver metric are:
					- **Aligned with the North Star**— Is it meaningfully and statistically correlated with the North Star metric?
					- **Actionable**— Does it inform and influence key product decisions?
					- **Sensitive**— Is it sensitive enough to measure core actions?
				- Guardrail Metrics
					- Guardrail metrics are secondary metrics that safeguard the overall product experience and monetization outside of the primary metric (Aka driver metric) that is being tested.
					- **Does something that helps the newsroom hurt ad monetization: We should know before broad rollout.**
					- Types
						- **Business**— Metrics tied to user experience other than the primary metric. Often, there are some trade-offs between the primary metric and business metric. For instance, a search may want to improve ad revenue without afflicting the guardrail which protects user engagement (i.e. queries). Another example could be the sign-up security of an application. An experiment may show that sign-up security with fewer steps increases the sign-up rate. However, the increase should not increase the number of bad actors entering the website.
						- **Internal Validity**— Usually pertains to metrics that monitor an app’s performance and bugs which can afflict user experience in the long term. For instance, they could be the loading time and # of errors. In addition, statistical measurements such as the sample ratio mismatch can serve as a guardrail metric.
			- Metrics in Experiments
				- Types
					- Success Metrics
						- Finding evidence of the hypothesis.
							- superiority tests and require a relative minimum detectable effect (MDE) to be specified
						- Operational Evaluation Criteria (OEC): Special type of success metric
							- a single metric forces trade-offs to be made once for multiple experiments and aligns the organization behind a clear objective. A good OEC should not be short-term focused (e.g., clicks); to the contrary, it should include factors that predict long-term goals, such as predicted lifetime value and repeat visits." So, ideally, an OEC is based on metrics in a short-term experiment that are good predictors of long-term value.
							- Examples: units purchased, revenue, profit, expected lifetime value
							-
					- Guardrail Metrics
				- What makes a good metric?
				  source::https://www.designative.info/2021/08/04/need-for-quantifying-and-qualifying-strategy/
				  cite:: (Croll, A., & Yoskovitz, B. [Lean Analytics](https://amzn.to/2WOAzsh), 2013):
					-
				- What makes a good experimentation metric?
				  source:: [KDD '16: Proceedings of the 22nd ACM SIGKDD International Conference on Knowledge Discovery and Data Mining](https://dl.acm.org/doi/proceedings/10.1145/2939672)August 2016Pages 77–86[https://doi.org/10.1145/2939672.2939700](https://doi.org/10.1145/2939672.2939700)
					- directionality: a good goal metric (or OEC) should have a clear directional interpretation that aligns with user experience in most common cases.
					- Sensitivity: "a good goal metric (or OEC) needs to be sensitive to most of the improvement of user experience. A sensitive goal metric helps the organization and feature teams being able to make decisions quickly and with limited cost.” (Deng and Shi, 2016, p. 3)
				- Different Metrics Frameworks
					-
			- ACTIVITY: Goals Signals Measures
				- ACTIVITY PHASE
					- **Goals:**
						- **_Don't_** define goals in terms of our current metrics.
					- **Signals**
						- How might success or failure in the goals actually manifest itself in user behavior or attitudes?
							- What does failure look like?
						- How easy or difficult is each signal to track?
						- Are these signals sensitive to changes in our experiments?
					- **Metrics**
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