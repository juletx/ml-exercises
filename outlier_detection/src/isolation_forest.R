# Package with benchmark datasets
library(mlbench)
# Package with IsolationForest implementation
library(solitude)

# Census data for 506 Boston houses
data("BostonHousing", package="mlbench")

# Empty tree structure
iso <- isolationForest$new()

# Learn the IsolationForest for our data
iso$fit(BostonHousing)
p <- iso$predict(BostonHousing)
#print(p)
sort(p$anomaly_score)
plot(density(p$anomaly_score))

# Base don the plot, decide the cut-off point (e.g > 0.63)
which(p$anomaly_score > 0.63)

