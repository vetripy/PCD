%{
    #include<stdio.h>
    int n,ident,k,op,ot;
%}
digit [0-9]
letter [A-Za-z]
id {letter}({letter}|{digit})*
keyword if|else|while|int|char|main|return|printf|include|stdio.h
operator ">"|<|>=|<=|-|=|==|"+"|"*"|"**"
%%
{keyword} {printf("Keyword: %s\n", yytext); k++;}
{operator} {printf("Operator: %s\n", yytext); op++;}
{digit}+ { printf("Number: %s\n", yytext); n++;}
{id} { printf("Identifier: %s\n", yytext); ident++;}
. { printf("Other: %s\n", yytext); ot++;}
%%
int main(int argv,char*argc[])
{   FILE *f;
    f=fopen(argc[1],"r");
    yyin=f;
    yylex();
    printf("No of keywords: %d\nNo of operators: %d\nNo of digits: %d\nNo of Identifier: %d\nNo of other characters: %d\n",k,op,n,ident,ot);
    return 0;
}
int yywrap()
{
    return 1;
}
