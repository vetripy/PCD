#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>
#include<ctype.h>

int main()
{
   int i=0,j=0,x=0,n,flag=0;
   void* p, *add[15];
   char srch,b[15],d[15],con[15],g[10],c;
   char ch;
   printf("Expression terminated by $:");
   while((c=getchar())!='$'){
       b[i]=c;
       i++;
   }
   n=i-1;
   b[n+1]='\0';
   printf("Given expression:%s",b);
   printf("\nSymbol table\n");
   while(j<=n)
   {
       c=b[j];
       if(isdigit(toascii(c)))
       {
           p=malloc(c);
           add[x]=p;
           con[x]=c;
           printf("%c\t%p\tConstant\n",c,p);
           x++;
       }
       else if(isalpha(toascii(c)))
       {
           if(j<=n)
           {
               p=malloc(c);
               add[x]=p;
               d[x]=c;
               printf("%c\t%p\tIdentifier\n",c,p);
               goto oper;
           }
           else
           {
               oper:
               ch = b[j+1];
               if(ch=='+' || ch=='-' || ch=='*' || ch=='=' || ch=='/' || ch=='(' || ch==')')
               {
                   p=malloc(c);
                   add[x]=p;
                   g[x]=ch;
                   printf("%c\t%p\tOperator\n",g[x],p);
                   x++;
               }
           }
       }
       j++;
   }
   printf("The symbol to be searched for: \n");
   scanf("%s",&srch);
   for(i=0;i<=x;i++)
   {
       if(srch == d[i] || srch == g[i])
       {
           printf("Symbol found\n");
           printf("%c%s%p\n",srch,"@address",&d[i]);
           flag=1;
           break;
       }
   }
   if(flag==0)
       printf("Symbol not found\n");
   return 0;
}

