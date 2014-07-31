#!/bin/bash

# Navigate to parent directory
cd ..
project_home=$PWD

# create virtual environment. MAKE SURE VIRTUALENV IS INSTALLED 
virtualenv dupstegu-datapipeline

# Hack to get appropriate directories for python path 
cd data-pipeline/config
config_directory=$PWD'/'
cd ..; cd data_pipeline/models
models_dir=$PWD'/'

# Create python path configuration files 
cd $project_home
cd dupstegu-datapipeline/lib/python2.7/site-packages/
echo -n $config_directory > set_project_config_path.pth
echo -n $models_dir > set_project_models_path.pth

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
