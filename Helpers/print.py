print("test")

a=3
print(a)

str = "Hello World"
print(str)

b,c,d=5,6.4,"Great"
print("Value is " + d)
print("Value is " + d)
print("{} {}".format("Value is ", b))
print(type(b))
print(type(c))
print(type(d))

al=[1,2,3,4,5]
print(al[1])

tup=(1,2,3,4)
print(tup[3])

dict={a:10,b:2}
print(dict[a])

greeting="Good Morning"
if greeting=="Good Morning":
    print("true")
else:    
    print("false")
  
  
obj=[2,3,4,5]   
for i in obj:
    print(i)

summ=0  
for j in range(1,6):
    summ = summ + j
print(summ)

for k in range(1,10,2):
    print(k)

it=3    
while it>1:
    if it!=3:
        print(it)
    it=it-1    
    
    
id=6    
while id>1:
    if id==6:
        id = id-1
        continue
    if id==3:
        break
    print(id)
    id=id-1       
    
    