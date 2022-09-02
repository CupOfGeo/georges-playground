# pimp your terminal https://www.engineeringwithutsav.com/blog/spice-up-your-macos-terminal
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

# docker
brew cask install docker
# gcloud
brew install --cask google-cloud-sdk
# terraform
brew install terraform


# test github actions locally
brew install act

# terraform stuff
brew tap liamg/tfsec
brew install terraform-docs tflint tfsec checkov
brew install pre-commit gawk coreutils


pre-commit install
pre-commit
