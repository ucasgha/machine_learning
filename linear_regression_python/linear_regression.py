
import numpy as np 
import csv
import matplotlib.pyplot as plt


# initialize a list where to store the CSV data 

data = []

# initialize the relevant variables 

theta0 = 0
theta1 = 0
alpha = 0.07
J = []


# opening the CSV file

with open('linear_regression_data.csv', mode ='r')as file:

# reading the CSV file
    
    csvFile = csv.reader(file)

    for column in csvFile: # each row is a list
    
        data.append(column)
    
    x = data[0] [:]
    y = data[1] [:]
    
    for i in range(0,len(x)):
        
        x[i] = float(x[i])
        y[i] = float(y[i])
    
    plt.scatter(x, y)
    plt.xlabel('x')
    plt.ylabel('y')
    
    
# define the number of samples

    m = np.size(x)
    
# define the model function 

    hypothesis = [0] * len(x)  
    
# define the number of iterations  
    
    for j in range(0,101):
        
        # define the model 
            
        for i in range(0,len(x)):
            
            hypothesis[i] = theta0 + theta1 * x[i]
        
        # define the cost function 
        
        error = [0] * len(x)
        
        for i in range(0,len(x)):
            
           error = (hypothesis[i] - y[i])**2  
           error += error
       
           J = 1/(2*m) * error
               
      # define gradient descent 
            
        derivative0 = [0] * len(x)
        derivative1 = [0] * len(x)
           
        for i in range(len(x)):
        
            derivative0[i] = (hypothesis[i] - y[i])         
            derivative1[i] = (hypothesis[i] - y[i]) * x[i]
            
            if i > 0:
                
                derivative0[i] = derivative0[i] + derivative0[i-1]
                derivative1[i] = derivative1[i] + derivative1[i-1]
            
            sum0 = derivative0[len(x)-1]
            sum1 = derivative1[len(x)-1]
            
            
            theta0 = theta0 - (alpha/(len(x))) * sum0
            theta1 = theta1 - (alpha/(len(x))) * sum1
    
    # plot the solution 
           
    plt.plot(x,hypothesis)     
    plt.show()   
       
       
       
   
   
           
   
       
       
       
           
           
           
        
    
    
    
    
    
        
        
        
        
        
