#classes are user defined blueprint or prototype
#sum, 
#methods, class variables, instance variables and constructors
#functions in class are called methods
#Self keyword is mandatory for calling variable names into method
#instance and class variables have whole different purpose
#constructor name should be __init__
#new keyword is not required when you create object

class calculator:
    num = 100
    
    def __init__(self,a,b):
        self.firstnum = a
        self.secondnum = b
        print("I am called automatically when object is created")
        
    def getData(self):      
       
        print("I am now executing method in class")
        
    def summation(self):
        return self.firstnum + self.secondnum + self.num
        

obj=calculator(4,5) #Syntax to create object in python
obj.getData()
print(obj.num)
print(obj.summation()) 

#Inheritance 
class childimp(calculator):
    num2=200
    
    def __init__(self):
        calculator.__init__(self, 2, 10)
    
    def getCompleteData(self):
        return self.num2 + self.num + self.summation()

obj1=childimp()
print(obj1.getCompleteData()) 
   
    
    