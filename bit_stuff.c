#include<stdio.h>
void main(){
char a[100];
int i,j,n,count=0;

printf("Enter length of string");
scanf("%d",&n);

printf("enter string");
scanf("%s",a);
for(i=0;i<n;i++){
 	if(a[i]=='1'){
		count=count+1;
		printf("%d",count);
	}
	else{
		count=0; 
	}	
	if(count==5)
	{
		for(j=n;j>i+1;j--){
		a[j]=a[j-1];
		}
		a[i+1]='0';
		a[n+1]='\0';
		count=0;
	}
	
}
printf("stuffed string %s",a);
}
