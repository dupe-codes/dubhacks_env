#!/bin/bash

# Navigate to parent directory
cd ..

# create virtual environment. MAKE SURE VIRTUALENV IS INSTALLED 
virtualenv dupstegu-datapipeline

# Hack to get appropriate directories for python path 
cd data-pipeline/config
config_directory=$PWD'/'

# Create python path configuration files 
cd ..
cd ..
cd dupstegu-datapipeline/lib/python2.7/site-packages/
echo -n $config_directory > set_project_config_path.pth

# Now that virtualenv is configured, activate it and install requirements for project
# Requirements need to be installed before anything else done, otherwise stuff explodes
cd ..; cd ..; cd ..; cd ..;
echo "Activating new virtual environment..."
source dupstegu-datapipeline/bin/activate
cd data-pipeline/
echo "Downloading requirements..."
sudo pip install -r requirements.txt
cd ..;
echo "Deactivating virtual environment..."
deactivate dupstegu-datapipeline/bin/activate
echo "Setup complete."
