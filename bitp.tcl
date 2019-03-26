f='01111110'
d=input("Enter data to be sent : ")	#string data
s=[]
st=''
fst=''
c=0
for i in range(len(d)):		#converting string to ascii
	s.append(ord(d[i]))
print(s)
for i in range(len(s)):		#convert ascii to binary
	st+=bin(int(s[i]))[2:]
print('Before Stuffing : ')
print(f+st+f)
for i in range(len(st)):
	if st[i]=='0':	c=0 
	elif st[i]=='1':	c+=1
	fst+=st[i]
	if c==5:	fst+='0'
print('After Stuffing : ')
print(f+fst+f)

