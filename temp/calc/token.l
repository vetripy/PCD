%{
#include <stdio.h>
%}
digit     [0-9]
letter    [A-Za-z]
id        {letter}({letter}|{digit})*
key       if|else|switch|int|char|main|return
operator  +|-|*|/|^|&
delim [ \t]+
%%
{delim} { }
{key} {printf("Keyword: %s\n",yytext);}
[+|*|/|^|&|()|=|-]+ {printf("Operator: %s\n", yytext); }
{digit}+    { printf("number: %s\n", yytext); }
{id}      { printf("identifier: %s\n", yytext); }
.        { printf("other: %s\n", yytext); }
%%
int main()
{ 
    yylex(); 
    return 0;
}

int yywrap()
{
return 1;
}
