#!/usr/bin/env sh

# Verify installation of python3
if ! type "python3" > /dev/null; then
  echo "Please install python3 first!"
  exit 1
fi

# Verify installation of pip3
if ! type "pip3" > /dev/null; then
  echo "Please install pip3 first!"
  exit 1
fi

# Install python dependencies
pip3 install pyyaml boto3 >> /dev/null

DIR="/usr/bin"

# Check dir for MacOS
if [ -d "/usr/local/bin" ]; then
	DIR="/usr/local/bin"
fi

# Install the executable
curl -s -o "$DIR/kubectl-updater-aws" https://raw.githubusercontent.com/xip-online-applications/kubectl-updater-aws/master/kubectl-updater-aws
chmod +x "$DIR/kubectl-updater-aws"

echo "The command has been installed to this path: $DIR/kubectl-updater-aws"
