Hello this is a template repo that I have for a FastAPI-CRUD app. It's my own custom template so that I can quickly build fastapi (or any python app) and deploy it to GCP
in the future.

configured with pre-commit-hooks and GitHub actions.

# What to do when first cloning this project
Make a virtual env however you want.
```
python -m venv .venv
source .venv/bin/activate
```

Install dependencies
```
pip install -r requirements.txt
pre-commit install
pre-commit
```

# Needed Secrets
APP_NAME = python app name fastapi-crud
GCP_CREDENTIALS = GCP service account



# Pre-commit Hooks
- isort, flake8, mypy, some check yaml, toml all done by .pre-commit-config.yaml
  - additional flake8 and isort configuration done in tox.ini and setup.cfg

# Actions
- `python_ci.yaml` - Linting and Tests runs on all branches. Must change APP_NAME env if you are renaming it.
- Run tests on push and pull requests - You should enable branch protection on main, so you can't push to master without passing tests
  - testing is only done on the my-python-app module.
TODO:
- If tests pass build in docker image and push to gcr (first need gcr with terraform)
- Deploy somewhere?

- `google-cloud-run-deply.yaml` - Builds dockerfile in fastapi-crud and deploys it to google cloud run.

- `flyway-migration.yaml` - runs flyway migrations located in fastapi-crud/migrations folder to CloudSQL


test locally with [act](https://github.com/nektos/act) sort of :shrug:

# FastAPI-CRUD
What I want a dummy app fastapi server thats connected to a cloudsql database

I want it deployed to cloud run and to have it own https url


# Terraform_stuff
Read the read me in that folder to get started

#### Questions I'm having right now

- Q Not sure what to do with workflow/actions/lint just added pre-commit hooks to test workflow.
- A So I don't need to separate it into an action just fix the jobs structure and use `needs:`

- Q should everything be in its own repo
- A really each application should have its own separate repo, one repo of terraform, one repo for GitHub action templat
es, and one for helm chart templates. All under one org but that would be crazy for me to do so im not going to do that.
It's better to keep it all in one repo till a need arises to separate thing out.
