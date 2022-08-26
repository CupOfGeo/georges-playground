brew install act
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
pre-commit install
pre-commit
