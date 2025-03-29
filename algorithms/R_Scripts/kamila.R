# Étend le chemin sans supprimer les chemins de base
.libPaths(c("R_lib", .libPaths()))

# Charge les packages
library(ggplot2)
library(clustMD)
library(kamila)
library(jsonlite)

if (!file.exists("k.json")) {
  stop("Fichier k.json manquant")
}

data <- fromJSON("k.json")

# Python passes k (number of clusters) through a JSON file
data <- fromJSON("k.json")
k <- as.numeric(data$n_clusters)

# Load numerical (continuous) variables and scale
con_vars <- read.csv(file = "temp_continue.csv")
con_vars <- data.frame(scale(con_vars))

# Load categorical variables
cat_vars_fac <- read.csv(file = "temp_cat.csv")

# Rearranging catagorical data to fit the Kamila package's needs
cat_vars_fac[] <- lapply(cat_vars_fac, factor)
cat_vars_dum <- dummyCodeFactorDf(cat_vars_fac)
cat_vars_dum <- data.frame(cat_vars_dum)

# Process Kamila
kam_res <- kamila(con_vars,
                 cat_vars_fac,
                 numClust = k,
                 numInit = 10,
                 maxIter = 25)
clusters <- kam_res$finalMemb - 1

write.csv(clusters, "temp_clustered.csv", row.names = FALSE)

# Write Clustered data to a file
#df <- cbind(
#    con_vars,
#    cat_vars_fac,
#    cluster = clusters
#)

#write.csv(df, "temp_clustered.csv", row.names = FALSE)