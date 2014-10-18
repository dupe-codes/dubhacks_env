#!/bin/bash

# Navigate to parent directory
cd ..
project_home=$PWD

# create virtual environment. MAKE SURE VIRTUALENV IS INSTALLED
virtualenv dubhacks_dev

# Configure custom activation script for virtualenv
cp dubhacks_setup/activation_config.py dubhacks_dev/bin/activation_config.py
cd dubhacks_dev/bin/
python activation_config.py
sudo rm activation_config.py

echo "Setup complete."
