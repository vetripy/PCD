%{
  #include<stdlib.h>
  #include<stdio.h>
  #include "y.tab.h"
%}
%%
[0-9]+ {yylval.no = atoi(yytext); return digit;}
[a-zA-Z]+ {strcpy(yylval.str,yytext);return id;}
[\n] return 0;
. return yytext[0];
%%
int yywrap()
{
return 1;
}