def gcd(a,b):
    if(a==0):
        return b
    return gcd(b%a,a)
p=int(input())
q=int(input())
n=p*q
n1=(p-1)*(q-1)
e=2
while(e<n1):
    if(gcd(e,n1)==1):
        break
    e+=1
d=1
while(d<n1):
    if((e*d)%n1==1):
        break
    d+=1
plain=int(input())
c=(plain**e)%n
print(c)
pl=(c**d)%n
print(pl)