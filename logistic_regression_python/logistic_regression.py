import numpy as np 
import csv
import matplotlib.pyplot as plt


# initialize the relevnt variables 

x1 = []
x2 = []
y = []
alpha = 0.0007
theta0 = 0
theta1 = 0
theta2 = 0
data = []
sum0 = []
sum1 = []
sum2 = []


# opening the CSV file
with open('logistic_reg_data.csv', mode ='r')as file:

# reading the CSV file
    csvFile = csv.reader(file)

# storing the contents of the CSV file into variables 
    for lines in csvFile:
        
        data.append(lines)
        
    x1 = data[0][:]
    x2 = data[1][:]
    y =  data[2][:]
        
# redefine the x data as floats 
        
for i in range(len(x1)):
       
       x1[i] = float(x1[i])
       x2[i] = float(x2[i])
       y[i] = float(y[i])


for l in range(300):   
 
    # define the model (hypothesis)       
     
    hypothesis = [0] * len(x1)
    model = [0] * len(x1)
    
    for i in range(len(x1)):
    
        hypothesis[i] = theta0 + theta1 * x1[i] + theta2 * x2[i]
        model[i] = 1/(1+np.exp(-hypothesis[i]))
    
    # define the cost for each hypothesis 
    
    error = [0] * len(x1)
    
    for i in range(len(x1)):
        
        error[i] = -y[i] * np.log(model[i]) - (1-y[i]) * np.log(1-model[i])
        
        if i > 0:
            
            error[i] = error[i] + error[i-1]
            
    sum_error = error[len(x1)-1]

    J = (1/len(x1)) * sum_error

    # define gradient descent
    
    derivative0 = [0] * len(x1)
    derivative1 = [0] * len(x1)
    derivative2 = [0] * len(x1)
    
    
    for i in range(len(x1)):
        
        derivative0[i] = (model[i] - y[i]) 
        derivative1[i] = (model[i] - y[i]) * x1[i] 
        derivative2[i] = (model[i] - y[i]) * x2[i]
    
        if i > 0:
            
            derivative0[i] = derivative0[i] + derivative0[i-1]
            derivative1[i] = derivative1[i] + derivative1[i-1]
            derivative2[i] = derivative2[i] + derivative2[i-1]
            
            sum0 = derivative0[len(x1)-1]
            sum1 = derivative1[len(x1)-1]        
            sum2 = derivative2[len(x1)-1]
        
            theta0 = theta0 - (alpha/(len(x1))) * sum0
            theta1 = theta1 - (alpha/(len(x1))) * sum1
            theta2 = theta2 - (alpha/(len(x1))) * sum2
    

    plot_y = [0] * len(x1)
    
    for i in range(len(x1)):
    
        plot_y[i] = (-1/(theta2)) * (theta1 * x1[i] + (theta0))
    
    plt.scatter(x1, x2)
    plt.xlabel('x1')
    plt.ylabel('x2')
    plt.plot(x1,plot_y)
    plt.show()
    
            
        

