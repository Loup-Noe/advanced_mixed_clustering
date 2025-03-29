#!/bin/bash

# === Script: install_all.sh ===
# Purpose: Set up a complete Conda environment for the Benchmark-Mixed-Clustering project
# Includes: Python, R, rpy2, and all required dependencies (Python + R)

# Environment name
ENV_NAME="benchmark-mixed-env"
PYTHON_VERSION="3.9"
R_VERSION="4.1"

# 1. Create the Conda environment
echo "[INFO] Creating Conda environment: $ENV_NAME (Python $PYTHON_VERSION, R $R_VERSION)"
conda create -y -n $ENV_NAME python=$PYTHON_VERSION r-base=$R_VERSION rpy2 -c conda-forge

# 2. Activate the environment
echo "[INFO] Activating the environment"
eval "$(conda shell.bash hook)"
conda activate $ENV_NAME

# 3. Install Python packages
echo "[INFO] Installing Python dependencies from requirements.txt"
pip install -r requirements.txt

# 4. Install R packages
echo "[INFO] Installing R packages via Rscript"
Rscript install_R_packages.R

# 5. Final message
echo -e "\n✅ Environment $ENV_NAME is ready!\n"
echo "Launch the app with:"
echo "conda activate $ENV_NAME && streamlit run app.py"
