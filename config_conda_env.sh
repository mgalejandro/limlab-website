#!/bin/bash -l

# init conda
eval "$(conda shell.bash hook)"

# Remove env if needed
# conda deactivate
# conda env remove -n limlab-website

# Create the Conda environment
conda env create -f environment.yml -v

# Activate the environment
conda activate limlab-website 

# gem install sass
# gem install sass -v 1.71.0

npm install
# npm install -g grunt-cli@1.5.0
# npm install grunt@0.4.5 --save-dev

