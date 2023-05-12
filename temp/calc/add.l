%{
    #include <stdio.h>
    int a,b,c,d;
%}

%%
[a] {printf("Enter a: ");scanf("%d",&a);}
[b] {printf("Enter b: ");scanf("%d",&b);}
[c] {printf("SUM : %d",a+b);}
[d] {exit(0);}
%%

int main(){
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}
