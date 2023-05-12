%{
  #include<stdio.h>
  #include<stdlib.h>
  int valid = 1;
%}
%token digit;
%token letter;

%%
start: letter S 
      ;
S: letter S
    | digit S
    |
    ;
%%

int main()
{
printf("Enter Identifier name for testing : ");
yyparse();
if(valid)
{
  printf("\nIt is a valid Idenifier");
}
return 0;
}

void yyerror()
{
valid = 0;
printf("It is an invalid identifier");
}


