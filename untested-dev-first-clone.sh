python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

# test github actions locally
brew install act

# terraform stuff
brew tap liamg/tfsec
brew install terraform-docs tflint tfsec checkov
brew install pre-commit gawk coreutils


pre-commit install
pre-commit
