# Computer
- Homebrew
	- cask
		- gcloud
		- visual-studio-code
- VSCode
- Docker
- `pipx install dbt-bigquery --install-deps`
# Data Science
## DS Environment:
- [pipx](https://github.com/pypa/pipx)
	- pipx: [cookiecutter](https://github.com/cookiecutter/cookiecutter)
	- https://pipenv.pypa.io/en/latest/
## Guidance
- Science Box principles
- [Creating a solid data science development environment](https://towardsdatascience.com/creating-a-solid-data-science-development-environment-60df14ce3a34)
- [Building a reproducible data science environment with Nix](https://josephsdavid.github.io/nix.html)
- [Ten Simple Rules for writing dockerfiles for reproducible data science](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1008316)
- [Cookiecutter Modern Data Science](https://github.com/crmne/cookiecutter-modern-datascience)
# Systems

^1bc4a5
- [x] Google Workspace (gmail/drive)
- [x] Slack
- [x] Confluence (awaiting approval)
# Sciencebox 2
## Attributes:
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
## Comparables:
- Sciencebox
- BQ Runner
  
  
  
  How to build it:
  1. Create a standard Python runner image that we'll own and maintain for The Inquirer
  	1. Python Runner will be a standalone docker base image / cookiecutter template for running data workflows on Airflow
- Implementation:
	-