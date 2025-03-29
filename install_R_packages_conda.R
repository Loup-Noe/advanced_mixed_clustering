install_if_missing <- function(pkg) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg, repos = "https://cloud.r-project.org")
  } else {
    message(pkg, " déjà installé.")
  }
}

packages <- c("kamila", "clustMD", "ggplot2", "jsonlite", "RMixtComp")
sapply(packages, install_if_missing)
