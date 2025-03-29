### Benchmark-Mixed-Clustering

This project provides an interactive interface (via Streamlit) to compare clustering and dimensionality reduction algorithms on mixed datasets (categorical and numerical).

Algorithms implemented :  
    - K-Prototypes  
    - KAMILA  
    - Modha-Spangler  
    - FAMD-KMeans  
    - DenseClus  
    - ClustMD `TO DO`
    - Hierarchical clustering with Gower's Distance  
    - MixtComp  
    - KCMM `TO ADD`  
    - Pretopological Clustering (with FAMD, Laplacian Eigenmaps, UMAP and PaCMAP)

Benchmark over computation cost (memory usage, execution time) and internal validity indices (Calinski, Davies-Bouldin, Silhouette).  

Use of real world data (see `/data/` folder) and generated data.

---

## Recommended Versions

- Python: **3.9**
- R: **4.3.3**
- OS: Linux

---

## 🔧 Installation

### 1. Clone the repository

```bash
git clone https://github.com/Loup-Noe/advanced_mixed_clustering.git
cd Benchmark-Mixed-Clustering
```

### 2. Run the automatic installation script (recommended)

```bash
install_all.sh
```

This script:
- creates a Python environment `benchmark-mixed-env`
- installs Python dependencies
- creates a minimal R environment compatible with RMixtComp via conda (`r-mixtcomp-env`)
- installs R packages in a local folder `R_lib`

### 3. Activate the Python environment and export `R_HOME`

```bash
conda activate benchmark-mixed-env
```

## 🚀 Run the application

```bash
streamlit run app.py
```
Then open your browser at `http://localhost:8501`

---

## 📂 Project structure

- `app.py`: Streamlit entry point
- `requirements.txt`: Python dependencies
- `install_all.sh`: installs Python + R automatically
- `install_R_packages.R`: installs R packages in `R_lib`
- `streamlit_webapp/`: Streamlit page logic (e.g., `compare_clustering.py`)
- `algorithms/`: algorithm implementations
- `algorithms/R_Scripts/`: R scripts executed via `subprocess`
- `data/`: datasets

---

## 🙌 Contributions
Feel free to open issues or submit PRs to improve multi-version compatibility or simplify the installation process!

