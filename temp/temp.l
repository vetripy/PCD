%{
    #include<stdio.h>
%}
%%
[a*b+]  {printf("bruh!");}
.       {}
%%

int main(){
yylex();
return 0;
}

yywrap(){
    return 1;
}