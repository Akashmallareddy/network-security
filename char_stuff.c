#include<stdio.h>
void main()
{

char c[100];
int count=0,i,j=0,n;

printf("Enter the length:");
scanf("%d",&n);

printf("Enter the string:");
scanf("%s",&c);

printf("\nGiven String:%s",c);


for(i=0;i<n;)
{
	
	if((c[i]=='E'||c[i]=='F'))
		{
		  		
		 for(j=n;j>i;j--)
			{
			  c[j]=c[j-1];
			}
			n++;
			c[n]='\0';
		 c[i]='E';
		
		 i=i+2;
		 
		 }
		 
	else
	 i++;	 

 }

printf("\nstuffed string:%s",c);
}
