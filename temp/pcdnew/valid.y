%{
  #include<stdio.h>
  #include<stdlib.h>
  int flag = 0;
%}

%token num
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%
statement: E {printf("\nResult : %d",$$); return 0;}
          ;
E : E '+' E {$$=$1+$3;}
  | E '-' E {$$=$1-$3;}
  | E '*' E {$$=$1*$3;}
  | E '/' E {$$=$1/$3;}
  | E '%' E {$$=$1%$3;}
  | '(' E ')' {$$=$2;}
  | num
  ;
%%
int main()
{
printf("Enter arithmetic expression +,-,/%:");
yyparse();
if(flag == 0)
  printf("Valid");
return 0;
}
void yyerror()
{
  flag = 1;
  printf("Invalid");
}