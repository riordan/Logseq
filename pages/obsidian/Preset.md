Preset is a hosted [[Apache Superset]]

# Initial Thoughts on Preset for [[Inquirer]] [[2022-02-07]]

Note to [[Brian Waligorski]]
1. Superset's not ready for BQ Primetime.
	1. SQL Lab fetches table previews with SELECT * LIMIT commands every time a user looks at a new dataset in the UI. They're going to have to use the table preview / row retrieval that's costless before we consider rolling it out broadly.
	2. It's not yet offering User Impersonation for BQ. Everything goes through its Service Account to get to a DB. Not a non-starter, but would be very good to have BQ logs have that granularity.
	3. **Current Recommendation**: Do not broadly roll out a BI tool without understanding BQ cost implications. Limit prior use of general data exploration tools to constrained, known, pre-alpha users, and only with usage guidance well-defined and pre-communicated (DE, Analytics, possibly one or two other individuals with specific constrained use cases).
	4. **Process Recommendation:** When scoping general BI tools, ensure we're getting info on infrastructure impact implications and tooling to support cost management.
2. We almost certainly would benefit from an external data discovery layer, even with Superset in place.
	1.  Superset can't play the role of a data catalog. Explicit datasets must be added manually to be searched, or otherwise navigated hierarchically  (Database [BQ: Project] > Schema [BQ: Dataset] > Schema Table [BQ: Table]).
	2.  Data search is poor. Even for explicitly added datasets, you can't search by table fields.
	3.  **CURRENT RECOMMENDATION:** Encourage BQ UI for limited search today based on table names. Field / schema description search will need to be provided by formal data catalog.
	4.  **PROCESS RECOMMENDATION:** Data catalog may be useful in working with data team projects in short-term. See if Google Data Catalog or Hosted Datahub can cheaply serve this search need without integration or upkeep.
5. Obviously this is purely explorative. Simply having this visibility has been useful for quickly exploring data we have in BQ, but it's also tamped down my appetite to think about anything resembling generalized access. It's made the complexity in working with customer data tooling substantially more apparent to me, recommitting to the notion of Data Studio for general data access for the time being as a higher priority.