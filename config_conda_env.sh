#!/bin/bash -l

# init conda
eval "$(conda shell.bash hook)"

# Create the Conda environment
conda env create -f environment.yml -v

# Activate the environment
conda activate limlab-website 

npm install -g grunt-cli@1.5.0
