python -m venv .venv
source .venv/bin/activate
pip install -r dev-requirements.txt
pre-commit install
pre-commit
