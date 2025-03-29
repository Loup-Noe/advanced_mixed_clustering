# install_R_packages.R

lib_path <- "R_lib"
if (!dir.exists(lib_path)) dir.create(lib_path, recursive = TRUE)
.libPaths(c(lib_path, .libPaths()))

# Définir CRAN dès le départ
options(repos = c(CRAN = "https://cran.rstudio.com"))

cat("🔧 Installation de remotes si nécessaire...\n")

# Installer remotes si manquant
if (!require("remotes", character.only = TRUE, quietly = TRUE)) {
  install.packages("remotes", lib = lib_path)
}
library(remotes)

# Installer des versions précises compatibles avec R 4.1
install_version("Matrix", version = "1.3-4", lib = lib_path, dependencies = TRUE)
install_version("MASS", version = "7.3-54", lib = lib_path, dependencies = TRUE)
install_version("mgcv", version = "1.8-36", lib = lib_path, dependencies = TRUE)
install_version("codetools", version = "0.2-18", lib = lib_path, dependencies = TRUE)


cat("\n📦 Installation des packages du projet...\n")

required_packages <- c(
  "kamila",
  "clustMD",
  "ggplot2",
  "jsonlite",
  "RMixtComp",
  "rjson"
)

install_if_missing <- function(pkg) {
  if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
    cat(paste("[INSTALL]", pkg, "...\n"))
    install.packages(pkg, lib = lib_path)
  } else {
    cat(paste("[OK]", pkg, "déjà installé.\n"))
  }
}

sapply(required_packages, install_if_missing)

cat("\n✅ Tous les packages sont installés ou déjà présents.\n")
