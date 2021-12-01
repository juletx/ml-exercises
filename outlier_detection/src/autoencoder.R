library(h2o)
h2o.init()
protate_path = sytem.file("extdata", "prostate.csv", package="h2o")
prostate = h2o.importFile(path = prostate_path)
colnames(prostate)
dim(prostate)

# learn autoencoder with 2 hidden layers of 10 units each
autoencoder_model = h2o.deeplearning(x=3:9,
                                     training_frame=prostate, 
                                     autoencoder=TRUE,
                                     hidden=c(10,10),
                                     epochs=5)

# features in the autoencoder's first hidden layer
deep_features_layer1 = h2o.deepfeatures(autoencoder_model, prostate, layer=1)

# further supervised models can be trained with these features
head(deep_features_layer1)

# reconstruction error per sample ~ outlierness indicative
reconstruction_error = h2o.anomaly(autoencoder_model, prostate)
head(reconstruction_error)
reconstruction_error = as.data.frame(reconstruction_error)
plot(sort(reconstruction_error$Reconstruction.MSE), main="Reconstruction Error")
which(reconstruction_error > 0.15)
