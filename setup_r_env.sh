#!/bin/bash

# Chemin du script
DIR=$(dirname "$0")

echo -e "\n[INFO] Lancement de la configuration de l'environnement R avec R 4.1...\n"

# Vérification conda
if ! command -v conda &> /dev/null; then
    echo -e "[ERREUR] Conda n'est pas installé. Installe Miniconda d'abord :"
    echo "  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
    echo "  bash Miniconda3-latest-Linux-x86_64.sh"
    exit 1
fi

# Création de l'environnement conda
echo -e "\n[INFO] Création de l'environnement conda avec R 4.1..."
conda create -y -n r-mixtcomp-env r-base=4.1 r-essentials

# Activation de l'environnement
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate r-mixtcomp-env

echo -e "\n[INFO] Environnement activé. Installation des packages R requis..."

# Crée le script R si nécessaire
R_SCRIPT="$DIR/install_R_packages_conda.R"
cat <<EOF > "$R_SCRIPT"
install_if_missing <- function(pkg) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg, repos = "https://cloud.r-project.org")
  } else {
    message(pkg, " déjà installé.")
  }
}

packages <- c("kamila", "clustMD", "ggplot2", "jsonlite", "RMixtComp")
sapply(packages, install_if_missing)
EOF

# Exécution du script R
Rscript "$R_SCRIPT"

echo -e "\n✅ [SUCCÈS] Environnement R prêt avec tous les packages installés."
echo -e "Tu peux maintenant exécuter : conda activate r-mixtcomp-env && Rscript ton_script.R\n"
