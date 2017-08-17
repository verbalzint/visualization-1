# The Simple Linear Regression Model
import numpy as np
import random
import matplotlib.pyplot as plt

X = np.array([[1, i] for i in range(50)])
b = random.randint(-10, 10)
y = np.array([[b * j + random.normalvariate(0,10)] for j in range(50)])
theta = np.array([[0], [0]])
alpha = 0.001
num_iters = 10000

# cost function J
def costFunction(X, y, theta) :
	m = len(y)
	J = (1 / (2 * m)) * sum((np.dot(X, theta) - y) * (np.dot(X, theta) - y))
	return J

# gradient descent
def gradientDescent(X, y, theta, alpha) :
	m = len(y)
	n = len(theta)
	temp = [0 for i in range(n)]
	for i in range(n) :
		squareerror = 0
		for j in range(m) :
			squareerror += (np.dot(X, theta) - y)[j] * X[:,i][j]
		temp[i] = theta[i] - alpha * (1 / m) * squareerror
	print(temp)
	return(temp)

# local min J : theta
def findTheta(X, y, theta, alpha, num_iters) :
	for i in range(num_iters) :
		theta = gradientDescent(X, y, theta, alpha)
	return theta

theta = findTheta(X, y, theta, alpha, num_iters)

print('\ntheta is', theta)
print('The Simple Linear Regression Model :', 'y =', float(theta[0]), '+', float(theta[1]), '* X')
plt.scatter(X[:, 1], y, label = 'The Simple Linear Regression Model')
plt.plot(X[:, 1], theta[1] * X[:, 1] + theta[0], '-')
plt.xlabel('X')
plt.ylabel('y')
plt.show()
