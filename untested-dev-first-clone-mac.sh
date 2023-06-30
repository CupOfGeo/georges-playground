#!/bin/bash

# pimp your terminal https://www.engineeringwithutsav.com/articles/spice-up-your-macos-terminal

#!/bin/bash

# Check if pyenv is installed
if command -v pyenv &>/dev/null; then
    echo "pyenv is already installed"
else
    echo "pyenv not found, installing..."

    # Check if Homebrew is installed
    if command -v brew &>/dev/null; then
        echo "Homebrew is installed"
    else
        echo "Homebrew not found, installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # Install pyenv
    brew install pyenv

    # Add pyenv init to shell to enable shims and autocompletion
    # Check for the current shell
    current_shell=$(basename "$SHELL")

    if [[ "$current_shell" == "bash" ]]; then
        echo 'if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi' >> ~/.bash_profile
        # echo "Please run 'source ~/.bash_profile' or restart your shell to initialize pyenv."
        source ~/.bash_profile
    elif [[ "$current_shell" == "zsh" ]]; then
        echo 'if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi' >> ~/.zshrc
        # echo "Please run 'source ~/.zshrc' or restart your shell to initialize pyenv."
        source ~/.zshrc
    else
        echo "Unsupported shell. Please add 'eval \"$(pyenv init -)\"' to your shell profile manually."
    fi
fi


# Install Python 3.10 with pyenv
echo "Installing Python 3.10 with pyenv..."
pyenv install 3.10.0

# Set Python 3.10 as the global version
pyenv global 3.10.0

# Verify the installation
python_version=$(python --version)
echo "Installed Python version: $python_version"

# Create a new virtual environment
echo "Creating a new virtual environment with Python 3.10..."
python -m venv .venv

# Activate the virtual environment
source .venv/bin/activate
pip install -r requirements.txt

# docker https://www.docker.com/
brew cask install docker
# gcloud https://console.cloud.google.com/
brew install --cask google-cloud-sdk
# flyway db-migrations https://flywaydb.org/
brew install flyway


# ngrok just a great dev tool https://ngrok.com/
brew install ngrok

# test github actions locally
brew install act

# helm for kubernetes template https://helm.sh/
brew install helm

# terraform https://developer.hashicorp.com/terraform
brew install terraform
# terraform stuff
brew tap liamg/tfsec
brew install terraform-docs tflint tfsec checkov
brew install pre-commit gawk coreutils


pre-commit install
pre-commit run --all-files
