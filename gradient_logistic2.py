# Logistic Regression Model
import numpy as np
import random
import matplotlib.pyplot as plt
import math

# sigmoid function
def sigmoid(z) :
	h = 1 / (1 + math.exp(-1 * z))
	return h	

X1 = [i for i in range(100)]
X2 = [i * i for i in range(100)]

# Feature Scaling
meanX2 = np.mean(X2)
sdX2 = np.std(X2)
X2 = (X2 - meanX2) / sdX2

X = np.array([[1, X1[i], X2[i]] for i in range(100)])
y = np.array([[0],[0],[0],[0],[0],[0],[0],[0],[0],[0],
	[0],[0],[0],[0],[0],[0],[0],[0],[0],[0],
	[0],[0],[0],[0],[0],[0],[0],[0],[0],[0],
	[0],[0],[0],[0],[0],[0],[0],[0],[0],[0],
	[0],[0],[0],[0],[0],[0],[0],[1],[0],[1],
	[1],[0],[1],[0],[1],[1],[0],[1],[1],[0],
	[1],[1],[1],[1],[1],[1],[1],[1],[1],[1],
	[1],[1],[1],[1],[1],[1],[1],[1],[1],[1],
	[1],[1],[1],[1],[1],[1],[1],[1],[1],[1],
	[1],[1],[1],[1],[1],[1],[1],[1],[1],[1]])
theta = np.array([[0], [0], [0]])
alpha = 0.001
num_iters = 10000
m = len(y)
n = len(theta)

# cost function J
def costFunction(X, y, theta) :
	h = np.array([[sigmoid(np.dot(X, theta)[i])] for i in range(m)])
	h1 = np.array([math.log(h[i]) for i in range(m)])
	h2 = np.array([math.log(1 - h[i]) for i in range(m)])
	J = (-1 / m) * sum((y * h1) + ((1 - y) * h2))
	return J

# gradient descent
def gradientDescent(X, y, theta, alpha) :
	h = np.array([[sigmoid(np.dot(X, theta)[i])] for i in range(m)])
	temp = [0 for i in range(n)]
	for i in range(n) :
		squareerror = 0
		for j in range(m) :
			squareerror += (h[j] - y[j]) * X[:,i][j]
		temp[i] = theta[i] - alpha * (1 / m) * squareerror
	return(temp)

# local min J : theta
def findTheta(X, y, theta, alpha, num_iters) :
	for i in range(num_iters) :
		theta = gradientDescent(X, y, theta, alpha)
	return theta

theta = findTheta(X, y, theta, alpha, num_iters)
h = np.array([[sigmoid(np.dot(X, theta)[i])] for i in range(m)])

print('Logistic Regression Model')
print('\ntheta is', theta)
plt.scatter(X[:, 1], y, label = 'Logistic Regression Model')
plt.plot(X[:, 1], h, '-')
plt.xlabel('X')
plt.ylabel('y')
plt.show()
