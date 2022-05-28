- Base Tools
	- Homebrew
	  collapsed:: true
		- cask
			- gcloud
			- visual-studio-code
	- VSCode
	- Docker
	- `pipx install dbt-bigquery --install-deps`
# Data Science
	- ## DS Environment:
	  collapsed:: true
		- [pipx](https://github.com/pypa/pipx)
			- pipx: [cookiecutter](https://github.com/cookiecutter/cookiecutter)
			- https://pipenv.pypa.io/en/latest/
		- ## Guidance
		  collapsed:: true
			- Science Box principles
				- [Creating a solid data science development environment](https://towardsdatascience.com/creating-a-solid-data-science-development-environment-60df14ce3a34)
				- [Building a reproducible data science environment with Nix](https://josephsdavid.github.io/nix.html)
				- [Ten Simple Rules for writing dockerfiles for reproducible data science](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1008316)
				- [Cookiecutter Modern Data Science](https://github.com/crmne/cookiecutter-modern-datascience)
	- # Systems
	  collapsed:: true
		- [x] Google Workspace (gmail/drive)
		- [x] Slack
		- [x] Confluence (awaiting approval)
- ## Sciencebox 2
  id:: 626fca95-0ae4-4e84-ac6c-468be973c979
	- ## Attributes:
	  collapsed:: true
		- Batteries-included Python Datascience environment
		- Docker
		- Jupyter Notebooks
		- VSCode
			- real-time collaboration
			- Pull requests
			- Code reviews
		- Uses local environment GCP auth
		- Project templates built in
		- Easy to turn to scripts
		- Easy to schedule scripts
		- Package management
	- ## Comparables:
		- Sciencebox
		  id:: 626fca95-2ced-4543-b733-7d1943afb463
		- BQ Runner
	- ## Implementation:
	  id:: 629226e9-f589-419e-b953-585f29a0c4e4
		- Starting Infrastructure:
			- Philadelphia Inquirer Google BigQuery database (Data Warehouse)
				- [[inq-datawarehouse GCP project structure]]
					-