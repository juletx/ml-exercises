library(DDoutlier)

# 1860 daily Closing Prices of Major European Stock Indices
data("EuStockMarkets")
colnames(EuStockMarkets)

# calculate "outlierness" score, by LOF
outlierness = LOF(dataset=EuStockMarkets, k=5)

# assign an index to outlierness values
names(outlierness) <- 1:nrow(EuStockMarkets)
sort(outlierness, decreasing=TRUE)
hist(outlierness)
which(outlierness > 2.0)
