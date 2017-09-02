#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
@author: junshengliu
"""

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
#from PIL import Image
from scipy.misc import imresize

def imgCrop(bw):
    x1=y1=0
    x2=y2=27
    while (bw[x1].sum() == 0):
        x1=x1+1
    while (bw[x2].sum() == 0):
        x2=x2-1
    while (bw[:,y1].sum() == 0):
        y1=y1+1
    while (bw[:,y2].sum() == 0):
        y2=y2-1
    return bw[x1:x2+1,y1:y2+1]

def changeSize(data, n):
    output = []
    for r in range(len(data)):
        output.append([])
        tmp = []
        for i in range(28):
            tmp.append([])
            for j in range(28):
                if (data[r][28*i+j] > 0):
                    tmp[i].append(1)
                else:
                    tmp[i].append(0)
        tmp=imgCrop(np.array(tmp))
        tmp=np.array(tmp,dtype=np.uint8)
        out=imresize(tmp, [n,n])
        for i in range(len(out)):
            for j in range(len(out[0])):
                output[r].append(out[i][j])
    return output

# Importing the dataset
dataset_train = pd.read_csv('mnist_train.csv')
dataset_test = pd.read_csv('mnist_test.csv')
train_x = dataset_train.iloc[:, 1:].values
train_y = dataset_train.iloc[:, 0].values
test_x = dataset_test.iloc[:, 1:].values
test_y = dataset_test.iloc[:, 0].values
                   
test_x = np.array(changeSize(test_x,6))
train_x = np.array(changeSize(train_x,6))
#df = pd.DataFrame(test_y)
#df.to_csv('tmp.csv', header = False, index = False)
    
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
classifier.add(Dense(units = 20, kernel_initializer = 'uniform', activation = 'relu', input_dim = 36))
classifier.add(Dense(units = 20, kernel_initializer = 'uniform', activation = 'relu'))
classifier.add(Dense(units = 10, kernel_initializer = 'uniform', activation = 'softmax'))
classifier.compile(optimizer = 'adam', loss = 'binary_crossentropy', metrics = ['accuracy'])

# Fitting the ANN to the Training set
classifier.fit(train_x, train_y, batch_size = 100, epochs = 50)

# Predicting the Test set results
pred_y = classifier.predict(test_x)
pred_y = np.argmax(pred_y, axis = 1)

# Making the Confusion Matrix
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(test_y, pred_y)

