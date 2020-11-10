n=input("Enter the string")
l=[]
l.append(-1)
j=0
count=0
i=1
while j<len(n):
    k=(i)&(i-1)
    if k==0:
        count+=1
        l.append(-1);
    else:
        l.append(n[j])
        j+=1
    i+=1
for i in range(0,count):
    ans=0
    for j in range(1,len(l)):
        if (j>>i)%2!=0 and l[j]!=-1:
            ans^=int(l[j])
    l[1<<i]=ans
print("Hamming code")
print(l[::-1])