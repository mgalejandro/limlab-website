#!/bin/bash -l

# init conda
eval "$(conda shell.bash hook)"

# Remove env if needed
# # conda deactivate
# conda env remove -n limlab-website

# Create the Conda environment
conda env create -f environment.yml -v

# Activate the environment
conda activate limlab-website 

# gem install sass

npm install
npm install -g sass
# npm install grunt-contrib-sass --save-dev
# npm install -g grunt-cli@1.5.0
# npm install grunt@0.4.5 --save-dev

