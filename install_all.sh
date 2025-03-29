#!/bin/bash

set -e  # Stop on error

echo "🔧 Création (ou activation) de l'environnement Python virtuel..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi
source venv/bin/activate

echo "📦 Mise à jour de pip..."
pip install --upgrade pip

echo "📦 Installation des dépendances Python..."
pip install -r requirements.txt || {
    echo "❌ Échec lors de l'installation des dépendances Python."
    exit 1
}

echo "📁 Création du dossier local pour les packages R (R_lib)..."
mkdir -p R_lib

echo "📦 Installation des packages R..."
Rscript install_R_packages.R || {
    echo "❌ Échec lors de l'installation des packages R."
    exit 1
}

echo "✅ Installation terminée avec succès."
echo "💡 Vous pouvez maintenant lancer Streamlit avec :"
echo "    source venv/bin/activate && streamlit run app.py"
