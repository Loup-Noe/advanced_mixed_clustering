#!/bin/bash

REQUIRED_R_VERSION="4.1"

# Extract major.minor version of R
CURRENT_R_VERSION=$(Rscript -e 'cat(paste(R.version$major, R.version$minor, sep="."))')
CURRENT_R_MAJOR_MINOR=$(echo $CURRENT_R_VERSION | cut -d. -f1,2)

# Compare versions
if [[ "$CURRENT_R_MAJOR_MINOR" != "$REQUIRED_R_VERSION"* ]]; then
  echo "\n[ERREUR] La version de R installée est $CURRENT_R_VERSION."
  echo "Cette version est trop récente pour certains packages comme RMixtComp."
  echo "Veuillez installer R $REQUIRED_R_VERSION.x pour assurer la compatibilité."
  echo "\nPour le faire via conda :"
  echo "  conda create -n r-mixtcomp-env r-base=$REQUIRED_R_VERSION"
  echo "  conda activate r-mixtcomp-env"
  exit 1
fi

# Liste des packages R requis
REQUIRED_PACKAGES=(
  "kamila"
  "clustMD"
  "ggplot2"
  "jsonlite"
  "RMixtComp"
)

# Créer un répertoire local pour les librairies si nécessaire
mkdir -p R_lib

# Installation automatique
Rscript -e '
.libPaths(c("R_lib", .libPaths()))
packages <- c("kamila", "clustMD", "ggplot2", "jsonlite", "RMixtComp")
for (pkg in packages) {
  if (!require(pkg, character.only = TRUE)) {
    message("Installing ", pkg, " ...")
    tryCatch(
      install.packages(pkg, repos="https://cloud.r-project.org"),
      error = function(e) message("[!] Failed to install ", pkg, ": ", e$message)
    )
  } else {
    message(pkg, " already installed.")
  }
}'

echo "\n✅ Installation des packages R terminée."
echo "N'oubliez pas d'utiliser R $REQUIRED_R_VERSION.x pour éviter les problèmes de compatibilité."
