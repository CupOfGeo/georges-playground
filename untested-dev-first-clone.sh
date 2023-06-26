# pimp your terminal https://www.engineeringwithutsav.com/blog/spice-up-your-macos-terminal
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

# docker https://www.docker.com/
brew cask install docker
# gcloud https://console.cloud.google.com/
brew install --cask google-cloud-sdk
# terraform https://developer.hashicorp.com/terraform
brew install terraform
# flyway db-migrations https://flywaydb.org/
brew install flyway


# test github actions locally
brew install act

# terraform stuff
brew tap liamg/tfsec
brew install terraform-docs tflint tfsec checkov
brew install pre-commit gawk coreutils


pre-commit install
pre-commit
