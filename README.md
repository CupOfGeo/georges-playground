Hello this is a template repo that I have for a FastAPI-CRUD app. It's my own custom template so that I can quickly build fastapi (or any python app) and deploy it to GCP in the future.

# What to do when first cloning this project
try the untested-dev-first-clone-mac.sh and let me know if it even works.

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
https://cli.github.com/manual/gh_secret_set
```sh
gh secret set -f .env
```

APP_NAME - python app name fastapi-crud - ideally we have one deployment per repo but its just little me so ill probably put multiple apps here and need to change this. Also Note now vscode uses .env from the project level. Also also dependency bot would use requirements.txt on thought would be to combine .envs and requirements.txt into the project level with a shell script that would run with during pre-commit. could work for .env but requirements could have conflicts. Im going back and forth on it bc of the terraform which I might not even use. i think its clearly better to use one deployment per repo and i shall stick with that.

--- more GCP set up docs needed
Set up with commands from here https://cloud.google.com/blog/products/identity-security/enabling-keyless-authentication-from-github-actions
WIF_PROVIDER= 'projects/643420178383/locations/global/workloadIdentityPools/my-pool/providers/my-provider'
WIF_SERVICE_ACCOUNT= 'my-service-account@playground-geo.iam.gserviceaccount.com'

FASTAPI_CRUD_DB_PASS= gcp database password


If your using discord for auth module you'll need to create an app https://discord.com/developers/applications/ and then set them here more about discord set up needed.
FASTAPI_CRUD_DISCORD_CLIENT_ID
FASTAPI_CRUD_DISCORD_CLIENT_SECRET


# Pre-commit Hooks
- isort, flake8, mypy, some check yaml, toml all done by .pre-commit-config.yaml
  - additional flake8 and isort configuration done in tox.ini and setup.cfg

# Actions
- `tests.yaml` - Linting and unit tests runs on all branches. Integration tests will run on pull requests to main.
 Must change APP_NAME env if you are renaming it.
- Run tests on push and pull requests - You should enable branch protection on main, so you can't push to master without passing tests

- `google-cloud-run-deploy.yaml` - Builds dockerfile fastapi-crud and deploys it to google cloud run. Now with domain georges-playground.com

- `flyway-migration.yaml` - runs flyway migrations located in fastapi-crud/migrations folder to CloudSQL


test locally with [act](https://github.com/nektos/act) sort of :shrug:. I haven't gotten it to work with actions that need GCP WIF credentials. but it will work for tests.yaml with the app name secret.
```sh
act -W .github/workflows/tests.yaml -v -s APP_NAME=fastapi-crud
```
(if on M1 mac it might tell you to run with `--container-architecture linux/amd64`)

# FastAPI-CRUD
What I want a dummy app fastapi server thats connected to a cloudSQL database

I want it deployed to cloud run and to have it own https url - see README in folder for more


# Terraform_stuff
Read the read me in that folder to get started

#### Questions I'm having right now

- Q Not sure what to do with workflow/actions/lint just added pre-commit hooks to test workflow.
- A So I don't need to separate it into an action just fix the jobs structure and use `needs:`

- Q should everything be in its own repo
- A really each application should have its own separate repo, one repo of terraform, one repo for GitHub action template
es, and one for helm chart templates. All under one org but that would be crazy for me to do so im not going to do that.
It's better to keep it all in one repo till a need arises to separate thing out.
