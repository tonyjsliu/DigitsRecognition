#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
@author: junshengliu
"""

#Part 1 - Data Preprocessing
# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset_train = pd.read_csv('mnist_train.csv')
dataset_test = pd.read_csv('mnist_test.csv')
train_x = dataset_train.iloc[:, 1:].values
train_y = dataset_train.iloc[:, 0].values
test_x = dataset_test.iloc[:, 1:].values
test_y = dataset_test.iloc[:, 0].values

#Part 2 - Make the ANN
#Encoding categorical data
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
onehotencoder1 = OneHotEncoder(categorical_features = [0])
train_y = np.array(train_y).reshape(len(train_y), 1)
train_y = onehotencoder1.fit_transform(train_y).toarray()

# Importing the Keras libraries and packages
import keras
from keras.models import Sequential
from keras.layers import Dense

#Initialising the ANN
classifier = Sequential()

#Adding the input layer and the first hidden layer
classifier.add(Dense(units = 400, kernel_initializer = 'uniform', activation = 'relu', input_dim = 784))

#Adding the second hidden layer
classifier.add(Dense(units = 400, kernel_initializer = 'uniform', activation = 'relu'))

#Adding the output layer
classifier.add(Dense(units = 10, kernel_initializer = 'uniform', activation = 'softmax'))

#Compiling the ANN
classifier.compile(optimizer = 'adam', loss = 'binary_crossentropy', metrics = ['accuracy'])

# Fitting the ANN to the Training set
classifier.fit(train_x, train_y, batch_size = 100, epochs = 50)

# Predicting the Test set results
pred_y = classifier.predict(test_x)
pred_y = np.argmax(pred_y, axis = 1)

# Making the Confusion Matrix
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(test_y, pred_y)
