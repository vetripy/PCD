/* Flex Program that accepts the Language L = { a n b n}; where n >= 0 and m >= 0. */
%{
	#include<stdio.h>
	Int check(int , char*);
%}
%%
[ab]* {int leng=check(yyleng , yytext);
	if (leng ==1)
	printf(“The string is accepted\n”);
	else
	printf(“The string not accepted\n");
}
.+ {printf(“\n Error in Input stream”}
%%
int main()
	{
	Yylex();
	}
int yywrap()
	{ return 1;}
int check(int leng, char *token)
{
	int i, flag = 0, counta=0;
	char ch;
	for(i=1, ch=token[0]; ch==’a’ && i<leng;i++)
	{
		counta++;
		ch=token[i];
   	}
return 1;
}


