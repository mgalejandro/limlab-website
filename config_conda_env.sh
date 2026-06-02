#!/bin/bash -l
set -euo pipefail

# Initialize conda for this shell.
source "$(conda info --base)/etc/profile.d/conda.sh"

# To rebuild from scratch, uncomment:
# conda deactivate || true
# conda env remove -n limlab-website -y

# Create (or update) the conda environment from environment.yml.
if conda env list | awk '{print $1}' | grep -qx "limlab-website"; then
  echo "Conda env 'limlab-website' already exists; updating..."
  conda env update -n limlab-website -f environment.yml --prune
else
  conda env create -f environment.yml -v
fi

# Activate the environment so subsequent npm calls install into it.
conda activate limlab-website

# Install local build dependencies (grunt, plugins, dart-sass, etc.).
npm install

# Install the grunt CLI inside the conda env's npm prefix so `grunt` is on PATH.
# This stays scoped to the env and does not pollute the host.
npm install -g grunt-cli

echo
echo "Done. To build the site:"
echo "  conda activate limlab-website"
echo "  grunt"
