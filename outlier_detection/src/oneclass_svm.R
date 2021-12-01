library(e1071)

# Daily air quality measurements in New York, May to September 1973
data(airquality)
df <- airquality

# train a SVM one-classification model
model <-svm(df, y=NULL, type='one-classification')
summary(model)

# CAUTION: testing on the same training set
# TRUE values mean suspect outliers
pred <- predict(model, df)
which(pred == TRUE)
