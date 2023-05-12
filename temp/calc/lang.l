%{
#include<stdio.h>
int check(int,char*);
%}
%%
a*b*|[ab]+ {
	if(yyleng == 1)
		printf("The string is accepted\n");
	else if(check(yyleng,yytext) == 1)
		printf("The string is not accepted\n");
	else
		printf("The string is accepted\n");
	}
.+ { printf("Error in input\n"); }
%%
int main(){
    yylex();
}
int yywrap(){
    return 1;}
int check(int l, char* s){
    int i,counta=0,countb=0;
    for(i = 0; i < l; i++)
    {
        if(s[i] == 'a'){
            counta++;
            }
        else if(s[i] == 'b'){
            countb++;}
    }
    if(counta==countb)
        return 0;
    else
        return 1;
}
