%{
  #include<stdio.h>
  #include<stdlib.h>
%}
%union
{
int no;
char str[10];
}
%token <no> digit
%token <str> id
%left '+' '-'
%left '*' '/' '%'
%right '^'
%left '(' ')'
%%
statement: E {printf("\n");}
          ;
E : E '+' E {printf("+");}
  | E '-' E {printf("-");}
  | E '*' E {printf("*");}
  | E '/' E {printf("/");}
  | E '%' E {printf("%");}
  | E '^' E {printf("^");}
  | '(' E ')' 
  | digit {printf("%d",yylval.no);}
  | id {printf("%s",yylval.str);}
  ;
%%
int main()
{
  printf("Enter expression to be converted :");
  yyparse();
  return 0;
}
int yyerror()
{
return 0;
}