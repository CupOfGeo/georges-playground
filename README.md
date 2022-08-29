Hello this is a test repo that I have configured with pre-commit-hooks and GitHub actions.

# What to do when first cloning this project
Make a virtual env however you want.
```
python -m venv .dev-venv
source .dev-venv/bin/activate
```

Install dependencies
```
pip install -r dev-requirements.txt
pre-commit install
pre-commit
```

# Pre-commit Hooks
- isort, black, flake8, some check yaml, toml all done by .pre-commit-config.yaml
  - additional flake8 and isort configuration done in tox.ini

# Actions
- Linting done by pre-commit hooks - your code should be linted before committing
- Run tests on push and pull requests - You should enable branch protection on main, so you can't push to master without passing tests
  - testing is only done on the my-python-app module.
TODO:
- If tests pass build in docker image and push to gcr (first need gcr with terraform)
- Deploy somewhere?

test locally with [act](https://github.com/nektos/act)

# Sample python module
I have a my-python-app module that doesn't do much, but it has tests and docker container.

# Terraform_stuff
Read the read me in that folder to get started

#### Questions I'm having right now

- Q Not sure what to do with workflow/actions/lint just added pre-commit hooks to test workflow.
- A So I don't need to separate it into an action just fix the jobs structure and use `needs:`

- Q should everything be in its own repo
- A really each application should have its own separate repo, one repo of terraform, one repo for GitHub action templat
es, and one for helm chart templates. All under one org but that would be crazy for me to do so im not going to do that.
It's better to keep it all in one repo till a need arises to separate thing out.
