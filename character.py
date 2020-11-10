n=input("Enter a string  :")
output="F"
flag="F"
for i in range(1,len(n)-1):
    if n[i]=='E' or n[i]=='F':
        output=output+'E'+n[i]
    else:
        output+=n[i]
output+="F"
print(output)
destuff=""
i=0
while i<len(output):
    if output[i]=="E":
        destuff+=output[i+1]
        i+=1
    else:
         destuff+=output[i]
    i+=1
print(destuff)